# Gloth

## Want to use this project?

### Development

Uses the default Flask development server.

1. Rename *.env.dev-sample* to *.env.dev*.
1. Update the environment variables in the *docker-compose.yml* and *.env.dev* files.
1. Build the images and run the containers:

    ```sh
    docker-compose up -d --build
    ```

    Test it out at [http://localhost:5000](http://localhost:5000). The "web" folder is mounted into the container and your code changes apply automatically.

To interact with the database shell:
```sh
docker exec -ti flask-on-docker_db_1 psql -U gloth postgres
```

or simply use a database tool to have a graphical interface to edit the db
```python
POSTGRES = {
    'user': 'gloth',
    'pw': 'password',
    'db': 'postgres',
    'host': 'localhost',
    'port': '5432',
}
```