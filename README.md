# docker-example

## How to run the project
As you can see in the `docker-compose.yml` file, the project relies on 5 docker containers.
Luckily, there is a Makefile (which will only work on Linux) that contains most of the required commands.

For windows users, you will need to install wsl. We advice you to install docker first, as it comes with a wsl pre-installed.

### Install docker
You can find how to install it on your computer from here: https://docs.docker.com/get-started/get-docker/

### Install make
This is for being able to run the commands of the Makefile. For windows users: please make sure you run the commands in your wsl terminal, not in your powershell or cmd!

The make command is theoretically available in all Linux distributions. Some may even have it installed by default.

Here's how to get it in Debian based distributions:
```sh
sudo apt-get install make
```

> **NOTE:**  
> For windows users, using the default linux distribution, shipped with docker, know that it is a Ubuntu distribution, meaning the command above should work for you.

### Start!
Once this is installed, you can finally start the project with the following commands:
```sh
make start
```

or

```sh
make run
```

The two commands does the same thing, except the `run` detaches your terminal from the docker container's output, letting
you execute other commands later.

> **NOTE:**  
> If the two commands above fail, please [refer to the `Submodules` section of the `Important notes` part](#submodules)!

### Migrate
We are almost done, but there is one last thing to do: migrate to the latest version for the database.

In order to do so, you need to open a bash session on your web container:
```sh
make wsh
```

And then run this command, that will execute all the migrations:
```sh
php bin/console doctrine:migrations:migrate
```

And that's it. You can fully use your application!

### Stop the containers
If you don't have the docker desktop tool (or any other utility that can allow you to do that graphically), you can use this command to stop the containers:
```sh
make stop
```

## Use the application
Once started, you can go to the following URLs to see the application in action:
- http://localhost:8080/api/openapi.json: This is the JSON file with the backend server documentation.
- http://localhost:8081: This is the frontend of the application
- http://localhost:8084: This is the UI for the OpenAPI documentation of the backend (you can use it to send requests to the backend as well)
- http://localhost:8085: This is the mailcatcher. It is where mails will appear when the backend sends them.

If you want to add the database to your IDE database explorer, you can use the following connection string:
```txt
mysql://docker-example-user:docker-example-user-password@localhost:8086/docker-example-db?charset=utf8mb4
```

## Improtant notes

### Ownership
If you face ownership problems, you can use the command:
```sh
make owner
```
that will give your system ownership of all the files under the `docker-example-php` and `docker-example-vue` folders.

### Submodules
This project uses submodules! Make sure you use the `--recursive` flag when cloning it from the VCS:
```sh
git clone --recursive <URL or SSH string>
```
