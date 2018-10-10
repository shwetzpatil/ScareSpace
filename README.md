# ScareSpace

User Stories

* They sign up
    * As a user, to be able to use MBnb, I would like to be able to sign up (using email and password at minimum)
* They create a space
    * As a listing user, to be able to make money, I would like to be able to create a space
        * Name, description, price
* They list availability
    * As a listing user, to be able to
* They list a space
    * As a listing user, to enable other users to book my space, I would like to list my space (with availability) and have it visible to other users
* They list multiple spaces
    * As a listing user, to enable other users to book many spaces, I would like to list multiple spaces
* They update a space
    * As a listing user, to ensure my description is accurate, I would like to be able to update my space (or change availability)
* A user can see a listed space
    * As a booking user, to allow me to choose where to go, I would like to see a list of (available) spaces
* A user requests to book their space
    * As a listing user, to allow me to confirm a request, I would like to receive a request for my space
* They confirm a request
    * As a listing user, to allow others to stay in the space, I would like to be able to agree to the request
* They deny a request
    * As a listing user, to stop others staying in the space, I would like to be able to deny the request
* They request to book a space
    * As a booking user, to allow me to stay in a space, I would like to be able to make a booking request.
* Their request to book a space is confirmed
    * As a booking user, to allow me to get happy, I would like to receive confirmation when my booking request is agreed.
* Their request to book a space is denied
    *  As a booking user, to allow me to get angry, I would like to receive confirmation when my booking request is denied.

https://github.com/racldn
https://github.com/shwetzpatil
https://github.com/TinyGobby
https://github.com/victorjefferies/

## Working notes
### Database setup:
```
psql
CREATE DATABASE scarespace;
\c scarespace
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60) UNIQUE, password VARCHAR(140));
CREATE TABLE spaces (id SERIAL PRIMARY KEY, name VARCHAR(60), address VARCHAR(150), price DECIMAL(5,2), description VARCHAR(500), lister_id INTEGER REFERENCES users (id));
CREATE TABLE availability (id SERIAL PRIMARY KEY, date INTEGER, space_id INTEGER REFERENCES spaces (id), booker_id INTEGER REFERENCES users (id), lister_id INTEGER REFERENCES users (id));
```

### To Create A New Branch
```
git checkout -b your_branch_name
```

### To Load Into A Branch
```
git checkout your_branch_name
git pull origin your_branch_name
```

### To Merge:
```
(in your_branch_name)
git checkout origin
git merge --no-ff your_branch_name
:wq
git push origin HEAD:master
git checkout master
```
