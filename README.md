to use this bakend application follow the new steps below:
1- clone this repository in your machine.

2- don't forget to install the needed dependencies and packages 'npm i'

3- set up PostgreSQL on your machine you can install it from this link: https://www.enterprisedb.com/downloads/postgres-postgresql-downloads 
chose the one for your operating system and click on the small blue box with an arrow down to download
4- once downloaded open the intaller and install PostgreSQL on your machine (note while installing it will ask you to set password make to remember it or to write it down cause you 
will need it).

5- afer PostgreSQL installation it will ask you to install stack builder just close and exist you don't need that

6- go search for SQL SHELL (psql) on your machine using the windows search

7- command line program will show up click on it

8- all you have to do is click enter on everything except when it asks for password you have to type the password you entered while installing postgresql.

9- after it will let use the commmand line interface for postgresql all you need to do now is just to create database you can do that using this command "CREATE DATABASE dataname" 
note you can alse use the following command to see all databases on your machine "\l"
when you make sure the database is created make sure to remember the name of the database cause you will need it

10-open your the project file in your code editor and go to the .env file and change the database url based on your database name and password for postgresql and the port postgresql is running on by default it is  5432
DATABASE_URL="postgresql://postgres:PASSWORDHERE@localhost:5432/DATABASENAME?schema=public"

11- after this you need to open your command line in dirctory of the project and type the follwing command "npx prisma migrate dev"
this will migrate the prisma schema to your postgresql database

11- now you can run the project if you want to using this command "npx nest run -w"

12- after this you can use any rest API client to test the API endpoints

13- before you do this go to command line and type "npx prisma studio" this will open tool that allows to create and delete data so you can test the API endpoints

14- you need to create user and device and make the user owne the device using prisma Studio
 note in this case the device is your esp32 device keep that on mind

15- the API endpoint you need to test is "/DDIG/SDPR" all what you need to send is the device id

the API should respond with the mqtt topic your device need to connect so it can start sending messages

16- you can go to ddig service file on line 111 and 125 you can see how the message is expected to be sent 

17- if everything goes well it should start writing data hopeffully but otherwise just ask for my help 

good luck and good luck again
