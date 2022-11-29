## Python3 Flask API Rest

### MIT License
Rememeber, No guarantees, or even fit for a particular purpose.

This project will be updated slowly as required, so stay tuned.

If you have a suggestion, or you want to contribute some code, you are free to make a pull.

Your contributions will be visible since this project is public.

### To Setup and Start
```bash
pip install -r requirements.txt 
python app.py
```

### Get All Request Records
```bash
curl -X GET http://127.0.0.1:5000/employee
```

### Get One Request Record
```bash
curl -X GET http://127.0.0.1:5000/employee/04cfc704-acb2-40af-a8d3-4611fab54ada
```

### Add A New Record
```bash
curl -X POST http://127.0.0.1:5000/employee -H 'Content-Type: application/json' -d '{"title":"Good & Bad Book", "email": "testuser3@test.com"}'
```

### Edit An Existing Record
```bash
curl -X PUT http://127.0.0.1:5000/employee -H 'Content-Type: application/json' -d '{"title":"edited Good & Bad Book", "email": "testuser4@test.com"}'
```

### Delete A Record
```bash
curl -X DELETE http://127.0.0.1:5000/employee/04cfc704-acb2-40af-a8d3-4611fab54ada
```

## Unit Test with Nose
```bash
nosetests --verbosity=2
```

### Test Output
```bash
$ nosetests --verbose --nocapture
app_test.test_get_all_employees ... ok
app_test.test_get_individual_employee ... ok
app_test.test_get_individual_employee_404 ... ok
app_test.test_add_new_record ... ok
app_test.test_get_new_record ... ok
app_test.test_edit_new_record_title ... ok
app_test.test_edit_new_record_email ... ok
app_test.test_add_new_record_bad_email_format ... ok
app_test.test_add_new_record_bad_title_key ... ok
app_test.test_add_new_record_no_email_key ... ok
app_test.test_add_new_record_no_title_key ... ok
app_test.test_add_new_record_unicode_title ... ok
app_test.test_add_new_record_no_payload ... ok
app_test.test_delete_new_record ... ok
app_test.test_delete_new_record_404 ... ok

------------------------------------------------------------------------------------
Ran 15 tests in 15.285s

OK
```

## Swagger UI
![swagger.png](swagger.png)

Hosted Locally
http://127.0.0.1:5000/swagger/

###
Hosted via Docker-compose and Nginx
http://127.0.0.1/swagger/

Thanks

spidermay