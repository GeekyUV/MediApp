
# Medical App
 This GitHub project aims to build a simple Ruby on Rails application with two distinct portals - a Receptionist Portal and a Doctor Portal - that share a single login page. The application will facilitate various tasks for receptionists and doctors, enhancing the management and accessibility of patient data.
#### project uses Ruby version 3.2.2 and Rails version 7.0.7


## Features
- user can register as doctor and receiptionist
- receiptionist can register perform crud on patients
- doctor can view patients and see registration graph patients registered vs days


## Getting Started
- Clone the repository:
```bash
 git clone https://github.com/GeekyUV/MediApp.git
 ```

 - initial setup
to install all the required gems

 ```bash
bundle install 
 ```

 ### Set up the database:

 - setup the postgres connection


in your database.yml file paste the following
```
default: &default
  adapter: postgresql
  encoding: unicode
  username: yuvraj
  password: yuvi123
  host: localhost
  port: 5432

development:
  <<: *default
  database: masteryuvi_development
  port: 5432

test:
  <<: *default
  database: masteryuvi_test
  port: 5432

production:
  <<: *default
  database: masteryuvi_production
  port: 5432
```

- remember you have your postgresql user setup replace username,password with your credentials 

- install gem 'pg' with pgconfig path eg. 
```
gem install pg -- --with-pg-config=/Library/PostgreSQL/15/bin/pg_config

```
- to find the path,check current user or create new user you can use following commands(mac os)

- find path
```
which postgres
```
- open postgres=# in your terminal 
```
sudo -u postgres /Library/PostgreSQL/15/bin/psql
```
- check current users(it will give all the users)
```
SELECT usename FROM pg_user;
```
- create a new user
```
CREATE USER new_username WITH PASSWORD 'new_password';
ALTER USER new_username CREATEDB;
```

now our posgresql database is successfully setup, migrate the migration files and start with tha app run these commands

```
rails db:create
rails db:migrate
 ```


- Start the Rails server and begin :
```bash
rails server or rails s
 ```

Future Enhancements:

- Integration with additional features like appointment scheduling or medical history tracking.
- Improving user interface and experience.
- Implementing role-based access control for different levels of users.

### Guide to devise gem for authentication

    1. add gem 'devise' and run bundle install
    2. run rails generate devise:install
    3. rails generate devise User , specify what users can be in user model
    4. rails generate devise:views, to create views modify as per your need 



 






