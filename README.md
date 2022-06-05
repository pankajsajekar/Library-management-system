# Library-management-system
Library Management System

### Python is required
## Steps to Setup Web App
```
git clone  https://github.com/pankajsajekar/Library-management-system.git
```
```
cd Library-management-system
```
create virtual environment
```
py -m venv venv
```
```
.\venv\Scripts\activate
```
Create database of Name : keywordio <br/>
Import keywordio.sql file in MySQL db

```
pip install -r requirements.txt
```
```
python manage.py makemigrations
```
```
python manage.py migrate
```
Used already created User for Admin Login <br/>
User Email : admin@gmail.com <br/>
User Password : 321
```
python manage.py runserver
```
Check Output on this url
```
http://127.0.0.1:8000/
```

