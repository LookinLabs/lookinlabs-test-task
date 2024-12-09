# LookinLabs Test Task

The goal of this task is to evaluate your skills in software engineering, problem solving and coding.

This repository uses MVC layered architecture. Middleware gets the request and sends to controller. Controller sends the request to service. Service sends the request to repository. Repository sends the request to database. Database sends the response to repository. Repository sends the response to service. Service sends the response to controller. Controller sends the response to middleware. Middleware sends the response to client.

LookinLabs test task is divided into two parts: Software Engineering and Cloud Operations. It's important to mention that advanced tasks are optional and meant for more experienced candidates.

**Note** There are layers, that are not needed for this task like service.

## Main Task (Software Engineering)

**1. Write a golang http server with basic requests**

Write an golang web http server based on Gin framework that will have 2 endpoints:

- GET /api/v1/ping that will return pong as message
- POST /api/v1/users with request body which will create a user in database via JSON Request Body
- GET /api/v1/users which will get all users from database in JSON Response Body
- GET /api/v1/user/<user_name> or /api/v1/user/:id which will get only one user from database in JSON Response Body
- PATCH /api/v1/users which will update a user in database via JSON Request Body

The messages should be done in a json way, e.g:
```json
{
  "message": "help message"
}
```

**2. Write an database connection and queries for `*/users*` endpoints**

Configure database connection and write queries, which will be used in `*/users*` endpoints.

The database should be PostgreSQL. The database should have a table `users`. The table content is up to you.

**3. Write tests for the endpoints**

Write golang tests for the endpoints. It'd nice if tests will be located under /tests folder.

**4. Add simple frontend with simple form**

Add simple frontend with simple form in the middle of the page. On top from form you should have two tabs (Create User) and (Get User). When you click on the tab, the form should change to the form, which is needed for the endpoint.

Create User tab will make an POST request to /api/v1/users endpoint with header "Content-Type" = "application/json". The form should make the same request body as in first point. So if you have database table `users` with columns `id`, `name`, `email`, the form should have 2 inputs: name, email.

And the request body will look like:
```
{
  "name": "John Doe",
  "email": "john.doe@no-reply.com,
}
```

Get User tab will make an GET request to /api/v1/users endpoint. The form should return all users with user ID's. For example they can be returned as a table in the middle of the page.

**5. Backend validation (advanced)**

Add validation for the request body in the endpoints. The validation should be done in model layer.

**6. Solve code problems**

Solve the following problems:
- golang modules are not working, find and fix it
- problemSolver causes memory leak, find the issue and fix it

Hint: [htop](https://hisham.hm/htop/) can be used to monitor the memory leak.
Hint: Data slice length is the key to solve the problem.

## Task 2 (Cloud Operations - advanced)

**1. Write a Dockerfile for the application**

Write a dockerfile for the application using docker best practices.

**2. Write a docker-compose file for the application**

Write a docker-compose file for the application using docker best practices. Docker compose should read environmentals from .env file, it should run golang and postgresql containers.

**3. Make the application to run in AWS App Runner (advanced)**

Run the application inside of AWS app runner via terraform. You can use [following repository](https://github.com/KostLinux/aws-app-runner-tf-template) to deploy the application.

But if you use the repository, remove everything, which is unnecessary to run the application in AWS App Runner (like route53).

## Comments

Leave your comments here