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
