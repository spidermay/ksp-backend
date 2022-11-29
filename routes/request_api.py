"""The Endpoints to manage the BOOK_REQUESTS"""
from flask import jsonify, abort, request, Blueprint, render_template
from werkzeug.utils import secure_filename
from datetime import datetime, timedelta
import math
import database as connection
import os

REQUEST_API = Blueprint("request_api", __name__)
epoch = datetime.utcfromtimestamp(0)

def get_blueprint():
    """Return the blueprint for the main app module"""
    return REQUEST_API

#Routes for employee
@REQUEST_API.route("/employee", methods=["GET"])
def get_list_employee():
    """Return all employee requests
    @return: 200: an array of all known records as a \
    flask/response object with application/json mimetype.
    """

    sql = ""
    data = []
    success = 0
    limit_sentence = ""
    args = request.args
    summary = { "total":0, "pages":0, "page":1, "start":0, "size":20 }
    
    try:
        DbConnection = connection.database.cursor()

        if(args.get("size")):
            if(int(args.get("size")) > 0):
                summary["size"] = int(args.get("size"))
        
        if(args.get("page")):
            summary["page"] = int(args.get("page"))

        if(summary["page"] > 1):
            summary["start"] = (summary["page"] -1) * summary["size"]

        sql = "SELECT COUNT(employee.employee_id) AS total FROM employee WHERE deleted = '1'"
        DbConnection.execute(sql) 
        my_result = DbConnection.fetchone()
        summary["total"] = int(my_result[0])
        
        if(summary["total"] > 0):
            success = 1
            summary["pages"] = math.ceil(summary["total"] / summary["size"])
            
            if(args.get("recursive") != "true"):
                limit_sentence = " LIMIT " + str(summary["start"]) + ", " + str(summary["size"])

            sql = "SELECT employee.*, employee_id AS item_id, CONCAT_WS(' ', employee.names, employee.lastname, employee.mother_lastname) AS fullname, (SELECT COUNT(beneficiary.beneficiary_id) FROM beneficiary WHERE beneficiary.employee_id = employee.employee_id) AS beneficiary FROM employee WHERE deleted = '1' ORDER BY employee_id DESC " + limit_sentence
            # print(sql)

            DbConnection.execute(sql)
            my_result = DbConnection.fetchall()
            
            column_names = [column[0] for column in DbConnection.description]
            
            for row in my_result:
                data.append(dict(zip(column_names, row)))
        
        if(args.get("query") != "1"):
            sql = ""

        del summary["start"]
        
        DbConnection.close()
        return jsonify({ "message":"Listing data into data", "summary":summary, "data":data, "success":success, "sql":sql })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":"Error", "success":success })

@REQUEST_API.route("/employee/<int:item_id>", methods=["GET"])
def get_employee(item_id):
    """Get employee request details by it's id
    @param item_id: the id
    @return: 200: a BOOK_REQUESTS as a flask/response object \
    with application/json mimetype.
    @raise 404: if employee request not found
    """

    sql = ""
    success = 0
    args = request.args
    data = { "employee":{} }

    if not item_id:
        abort(400)

    try:
        sql = "SELECT employee.*, employee_id AS item_id FROM employee WHERE deleted = '1' AND employee_id = '" + str(item_id) + "'"
        # print(sql)
        DbConnection = connection.database.cursor()
        DbConnection.execute(sql) 
        my_result = DbConnection.fetchone()
        column_names = [column[0] for column in DbConnection.description]
        data["employee"] = dict(zip(column_names, my_result))
        DbConnection.close()
        
        if(data["employee"]["item_id"] > 0):
            success = 1

        # if(args.get("query") != "1"):
        #     sql = ""
        
        return jsonify({ "message":"The data is into nested nodes, node for table", "data":data, "success":success, "sql":sql })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":"Error", "success":success, "reason":"Not found this record by item_id" })
        
@REQUEST_API.route("/employee", methods=["POST"])
def create_employee():
    """Create a employee request record
    @param names: post : the requesters names 
    @param lastname: post : the lastname 
    @return: 201: a new item_id as a flask/response object \
    with application/json mimetype.
    @raise 400: misunderstood request
    """
    success = 0
    request_data = {}
    args = request.args
    table_name = "employee"
    message = "The data is not save"
    form_data = request.form
    file = ""
    allowed_extensions = { 'png', 'jpg', 'jpeg' }
    
    for key in form_data:
        request_data[key] = form_data[key]
        
    try:
        if request.files:
            if allowed_file(request.files["image"].filename, allowed_extensions):
                file = request.files["image"]
                filename = secure_filename(file.filename)
                file.save(os.path.join("static", "storage", "employee", filename))
                request_data["image"] = filename

        query_data = query_builder(0, table_name, request_data)

        DbConnection = connection.database.cursor()
        DbConnection.execute(query_data["sql"], query_data["values"])
        connection.database.commit()
        
        if(DbConnection.rowcount > 0):
            message = "The data is saved ok"
            success = 1

        if(args.get("query") != "1"):
            query_data["sql"] = ""

        sql = "SELECT " + table_name + "_id AS item_id FROM " + table_name + " ORDER BY " + table_name + "_id DESC LIMIT 1"
        DbConnection.execute(sql) 
        my_result = DbConnection.fetchone()
        last_id = my_result[0]

        DbConnection.close()
        return jsonify({ "message":message, "success":success, "sql":query_data["sql"], "data":last_id })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":message, "success":success })

@REQUEST_API.route("/employee/<int:item_id>", methods=["PUT"])
def edit_employee(item_id):
    """Edit a employee request record
    @param names: post : the requesters names 
    @param lastname: post : the lastname 
    @return: 200: a employeee_request as a flask/response object \
    with application/json mimetype.
    @raise 400: misunderstood request
    """

    success = 0
    request_data = {}
    args = request.args
    table_name = "employee"
    message = "The data is not update"
    form_data = request.form
    file = ""
    allowed_extensions = { 'png', 'jpg', 'jpeg' }
    
    for key in form_data:
        # print(key, form_data[key])
        request_data[key] = form_data[key]

    try:
        if request.files:
            if allowed_file(request.files["image"].filename, allowed_extensions):
                file = request.files["image"]
                filename = secure_filename(file.filename)
                file.save(os.path.join("static", "storage", "employee", filename))
                request_data["image"] = filename

        query_data = query_builder(1, table_name, request_data)
        query_data["values"].append(item_id)
        
        DbConnection = connection.database.cursor()
        DbConnection.execute(query_data["sql"], query_data["values"])
        connection.database.commit()
        
        if(DbConnection.rowcount > 0):
            message = "The data is update ok"
            success = 1

        if(args.get("query") != "1"):
            query_data["sql"] = ""

        DbConnection.close()
        return jsonify({ "message":message, "success":success, "sql":query_data["sql"] })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":message, "success":success })

    return jsonify({ "message":message, "success":success })

@REQUEST_API.route("/employee/<int:item_id>", methods=["DELETE"])
def delete_employee(item_id):
    """Delete a employee request record
    @param id: the id
    @return: 204: an empty payload.
    @raise 404: if employee request not found
    """

    sql = ""
    success = 0
    args = request.args
    message = "The data is not deleted"

    if not item_id:
        abort(400)

    try:
        sql = "UPDATE `employee` SET `deleted` = '0' WHERE `employee_id` = %s"
        values = (item_id)
        
        DbConnection = connection.database.cursor()
        DbConnection.execute(sql,(values,))
        connection.database.commit()

        if(DbConnection.rowcount > 0):
            success = 1
            message = "The data is logic deleted"

        if(args.get("query") != "1"):
            sql = ""

        DbConnection.close()
        return jsonify({ "message":message, "success":success, "sql":sql })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":"Error", "success":success })

# @REQUEST_API.route("/employee/storage/<string:filename>", methods=["GET"])
# def get_image_employee(filename):
#     image_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
#     image_dir = os.path.join(image_dir, "storage", "employee", filename)
    
#     return render_template(image_dir)

#Routes for beneficiary
@REQUEST_API.route("/beneficiary", methods=["GET"])
def get_list_beneficiary():
    """Return all beneficiary requests
    @return: 200: an array of all known records as a \
    flask/response object with application/json mimetype.
    """

    sql = ""
    data = []
    success = 0
    limit_sentence = ""
    args = request.args
    summary = { "total":0, "pages":0, "page":1, "start":0, "size":20 }
    filter_sentence = ""
    filters = {}

    try:
        DbConnection = connection.database.cursor()

        if(args.get("size")):
            if(int(args.get("size")) > 0):
                summary["size"] = int(args.get("size"))
        
        if(args.get("page")):
            summary["page"] = int(args.get("page"))

        if(summary["page"] > 1):
            summary["start"] = (summary["page"] -1) * summary["size"]

        if(args.get("employee_id")):
            filters["employee_id"] = args.get("employee_id")

        for key in filters:
            filter_sentence = filter_sentence + " AND " + key + " = '" + filters[key] + "'"
        
        sql = "SELECT COUNT(beneficiary.beneficiary_id) AS total FROM beneficiary WHERE deleted = '1' " + filter_sentence
        # print(sql)

        DbConnection.execute(sql) 
        my_result = DbConnection.fetchone()
        summary["total"] = int(my_result[0])
        
        if(summary["total"] > 0):
            success = 1
            summary["pages"] = math.ceil(summary["total"] / summary["size"])
            
            if(args.get("recursive") != "true"):
                limit_sentence = " LIMIT " + str(summary["start"]) + ", " + str(summary["size"])

            sql = "SELECT beneficiary.*, beneficiary_id AS item_id, CONCAT_WS(' ', beneficiary.names, beneficiary.lastname, beneficiary.mother_lastname) AS fullname, (SELECT CONCAT_WS(' ', employee.names, employee.lastname, employee.mother_lastname) FROM employee WHERE employee.employee_id = beneficiary.employee_id) AS employee_fullname FROM beneficiary WHERE deleted = '1' " + filter_sentence + " ORDER BY beneficiary_id DESC " + limit_sentence
            # print(sql)

            DbConnection.execute(sql)
            my_result = DbConnection.fetchall()
            
            column_names = [column[0] for column in DbConnection.description]
            
            for row in my_result:
                data.append(dict(zip(column_names, row)))
        
        # if(args.get("query") != "1"):
        #     sql = ""

        del summary["start"]
        
        DbConnection.close()
        return jsonify({ "message":"Listing data into data", "summary":summary, "data":data, "success":success, "sql":sql })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":"Error", "success":success })

@REQUEST_API.route("/beneficiary/<int:item_id>", methods=["GET"])
def get_beneficiary(item_id):
    """Get beneficiary request details by it's id
    @param item_id: the id
    @return: 200: a BOOK_REQUESTS as a flask/response object \
    with application/json mimetype.
    @raise 404: if beneficiary request not found
    """

    sql = ""
    success = 0
    args = request.args
    data = { "beneficiary":{}, "employee":{} }

    if not item_id:
        abort(400)

    try:
        sql = "SELECT beneficiary.*, beneficiary_id AS item_id FROM beneficiary WHERE deleted = '1' AND beneficiary_id = '" + str(item_id) + "'"
        # print(sql)

        DbConnection = connection.database.cursor()
        DbConnection.execute(sql) 
        my_result = DbConnection.fetchone()
        column_names = [column[0] for column in DbConnection.description]
        data["beneficiary"] = dict(zip(column_names, my_result))
        # print(data)

        if(data["beneficiary"]["item_id"] > 0):
            success = 1

            sql = "SELECT employee.*, employee_id AS item_id FROM employee WHERE deleted = '1' AND employee_id = '" + str(data["beneficiary"]["employee_id"]) + "'"
            # print(sql)

            DbConnection.execute(sql) 
            my_result = DbConnection.fetchone()
            
            if my_result != None:
                column_names = [column[0] for column in DbConnection.description]
                data["employee"] = dict(zip(column_names, my_result))

        # if(args.get("query") != "1"):
        #     sql = ""

        DbConnection.close()
        return jsonify({ "message":"The data is into nested nodes, node for table", "data":data, "success":success, "sql":sql })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":"Error", "success":success, "reason":"Not found this record by item_id" })
        
@REQUEST_API.route("/beneficiary", methods=["POST"])
def create_beneficiary():
    """Create a beneficiary request record
    @param names: post : the requesters names 
    @param lastname: post : the lastname 
    @return: 201: a new item_id as a flask/response object \
    with application/json mimetype.
    @raise 400: misunderstood request
    """

    file = ""
    success = 0
    request_data = {}
    args = request.args
    table_name = "beneficiary"
    message = "The data is not save"
    form_data = request.form
    allowed_extensions = { 'png', 'jpg', 'jpeg' }
    
    for key in form_data:
        request_data[key] = form_data[key]

    try:
        if request.files:
            if allowed_file(request.files["image"].filename, allowed_extensions):
                file = request.files["image"]
                filename = secure_filename(file.filename)
                file.save(os.path.join("static","storage", "beneficiary", filename))
                request_data["image"] = filename
                
        query_data = query_builder(0, table_name, request_data)

        DbConnection = connection.database.cursor()
        DbConnection.execute(query_data["sql"], query_data["values"])
        connection.database.commit()
        
        if(DbConnection.rowcount > 0):
            message = "The data is saved ok"
            success = 1

        if(args.get("query") != "1"):
            query_data["sql"] = ""

        sql = "SELECT " + table_name + "_id AS item_id FROM " + table_name + " ORDER BY " + table_name + "_id DESC LIMIT 1"
        DbConnection.execute(sql) 
        my_result = DbConnection.fetchone()
        last_id = my_result[0]
        
        DbConnection.close()
        return jsonify({ "message":message, "success":success, "sql":query_data["sql"], "data":last_id })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":message, "success":success })

@REQUEST_API.route("/beneficiary/<int:item_id>", methods=["PUT"])
def edit_beneficiary(item_id):
    """Edit a beneficiary request record
    @param names: post : the requesters names 
    @param lastname: post : the lastname 
    @return: 200: a beneficiarye_request as a flask/response object \
    with application/json mimetype.
    @raise 400: misunderstood request
    """

    file = ""
    success = 0
    request_data = {}
    args = request.args
    table_name = "beneficiary"
    form_data = request.form
    message = "The data is not update"
    allowed_extensions = { 'png', 'jpg', 'jpeg' }
    
    for key in form_data:
        request_data[key] = form_data[key]
        
    try:
        if request.files:
            if allowed_file(request.files["image"].filename, allowed_extensions):
                file = request.files["image"]
                filename = secure_filename(file.filename)
                file.save(os.path.join("static", "storage", "beneficiary", filename))
                request_data["image"] = filename
                
        query_data = query_builder(1, table_name, request_data)
        query_data["values"].append(item_id)
        # print(query_data)

        DbConnection = connection.database.cursor()
        DbConnection.execute(query_data["sql"], query_data["values"])
        connection.database.commit()
        
        if(DbConnection.rowcount > 0):
            message = "The data is update ok"
            success = 1

        if(args.get("query") != "1"):
            query_data["sql"] = ""

        DbConnection.close()
        return jsonify({ "message":message, "success":success, "sql":query_data["sql"] })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":message, "success":success })

@REQUEST_API.route("/beneficiary/<int:item_id>", methods=["DELETE"])
def delete_beneficiary(item_id):
    """Delete a beneficiary request record
    @param id: the id
    @return: 204: an empty payload.
    @raise 404: if beneficiary request not found
    """

    sql = ""
    success = 0
    args = request.args
    message = "The data is not deleted"

    if not item_id:
        abort(400)

    try:
        sql = "UPDATE `beneficiary` SET `deleted` = '0' WHERE `beneficiary_id` = %s"
        values = (item_id)
        
        DbConnection = connection.database.cursor()
        DbConnection.execute(sql,(values,))
        connection.database.commit()

        if(DbConnection.rowcount > 0):
            success = 1
            message = "The data is logic deleted"

        if(args.get("query") != "1"):
            sql = ""

        DbConnection.close()
        return jsonify({ "message":message, "success":success, "sql":sql })

    except Exception as ex:
        print(ex)
        return jsonify({ "message":"Error", "success":success })

# @REQUEST_API.route("/beneficiary/storage/<string:filename>", methods=["GET"])
# def get_image_beneficiary(filename):
#     image_dir = os.path.dirname(os.path.abspath(os.path.dirname(__file__)))
#     image_dir = os.path.join(image_dir, "storage", "beneficiary", filename)
    
#     return render_template(image_dir)

def query_builder(item_id, table_name, data):
    """Construct the query for insert or update
    @param item_id: the item_id for know is new or exist
    @param table_name: the table_name in database
    @param data: the data values for insert
    @return: array: an empty payload.
    @raise array: if cant request
    """
    return_data = { "sql":"", "values":[] }
    fields = ""
    values = ""
    
    try:
        sql = "DESCRIBE " + table_name
        DbConnection = connection.database.cursor()
        DbConnection.execute(sql) 
        my_result = DbConnection.fetchall()
        
        if item_id == 0:
            return_data["sql"] = "INSERT INTO " + table_name + " (_fields_) VALUES (_values_)"
        else:
            return_data["sql"] = "UPDATE " + table_name + " SET _fields_ WHERE " + table_name + "_id = %s"
        
        for row in my_result:
            if item_id == 0:
                if row[0] != table_name + "_id" and row[0] != "deleted" and row[0] != "updated":
                    values = values + " %s,"
                    fields = fields + str(row[0]) + ","
            else:
                if row[0] != table_name + "_id" and row[0] != "deleted" and row[0] != "date":
                    fields = fields + str(row[0]) + "=%s,"

        return_data["sql"] = return_data["sql"].replace("_fields_", fields)
        return_data["sql"] = return_data["sql"].replace("_values_", values)
        return_data["sql"] = return_data["sql"].replace(", W", " W")
        return_data["sql"] = return_data["sql"].replace(",)", ")")

        for row in my_result:
            if row[0] == "date" or row[0] == "updated":
                data[row[0]] = get_mktime(datetime.now())

            if item_id == 0:
                if row[0] != table_name + "_id" and row[0] != "deleted" and row[0] != "updated":
                    return_data["values"].append(data[row[0]])
            else:
                if row[0] != table_name + "_id" and row[0] != "deleted" and row[0] != "date":
                    return_data["values"].append(data[row[0]])
    
    except Exception as ex:
        print(ex)
    
    return return_data

def get_mktime(date):
    mktime = math.floor((date - epoch).total_seconds() + 21600)
    return mktime 

def allowed_file(filename, allowed_extensions):
    return '.' in filename and \
        filename.rsplit('.', 1)[1].lower() in allowed_extensions