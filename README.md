# Simple conversation history using Rails + Hotwire

### Running the app
1. Install docker and docker-compose from https://www.docker.com/get-started
2. Clone the project
3. Navigate to the project root folder
4. Create a `.env` file and copy the contents of `.env.example` in the new file
5. Run `docker-compose up`
6. Wait for the services to start, might take several minutes

NOTE: When running for the first time the database needs to be initialized
1. Follow the steps described below to get an interactive session
2. Run `rails db:create db:migrate db:seed`
3. In any web browser, visit `http://localhost:9292`

### Additional information

#### Run tests, rubocop
1. Run `docker ps` and copy the container id for any image that contains `talkable`
2. Run `docker exec -it <container_id> /bin/bash`
3. You can now:
   1. run tests by running `rspec`
   2. run rubocop by running `rubocop`

Additional questions/observations for building such a feature can be found [here](./doc/questions.md)
