# Ports test project

### Exercise description

The task is to build a simple **Rails API** project. Its functionality is described below:
* For authorized users, there must be an import functionality of **ports**. Expected format is only CSV. Examples are located in `/samples` folder.
* Also, API should provide an ability to search through ports in a various ways (e.g. port name entries, port type, etc.).
* API Documentation and code specs are also expected to be present.

### Notes
* Ports are unique by **code**.
* ID field should be omitted from the import files.
* Imported files shouldn't be stored after processing.
* Some attributes of ports aren't important for the task (e.g. city). However, everything should be stored in database.
* The way of authentication doesn't matter, feel free to use anything that suits you. The only requirement is that limits access to the endpoints.


### Technical details
* Database: `PostgreSQL 9.6+`
* Documentation/testing tools - not specified, you're free to use your favorite(s).
* Auth implementation also doesn't matter
* There's no limitation of using open-source gems. You're welcome to add anything that suits best.
* Ruby/Rails version: `latest(stable)` (at the moment of starting this exercise).
* Exercise should be completed as a pull request to this repository from fork. Please, do not squish commits.

Good luck and looking forward to seeing your app!

Regards,  
**Shypple team**


# Additional Notes

I used a public heroku app for a public postgres database, details in the database.yml file


## Postman collection & testing

### The collection exists out of 2 files:
* `test/newman_collection/Shypple.postman_collection.json`
* `test/newman_collection/Shypple.postman_environment.json`

### Bash script file:
* `scripts/newman_to_slack.sh`

If you execute the bash script it will use the postman collection files to run (using `newman` comman-line version of `postman`) multiple tests on each endpoint on the API.
Including `login` & `import`

The 2 collection files can also be imported into the stand-alone postman application for use of documentation and testing.
* `environment` is hardcoded to 'http://localhost:3000/'


