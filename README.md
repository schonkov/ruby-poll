# Ruby Poll web app

This is a simple Poll Web App built with Ruby on Rails 8.0.1 and SQLite as the database. It allows users to:

- Create a poll with a question and multiple answers.

- Vote on a poll.

- Admins can edit, delete, publish, and close polls.

- Supports light/dark theme toggle and responsive sidebar navigation.

The app is containerized using Docker and can be easily deployed and run with Docker Compose.

# Setup with Docker

1. Clone the repository

git clone https://github.com/schonkov/ruby-poll.git

cd ruby-poll/

2. Build the Docker Image

docker-compose build

3. Create, Migrate, and Seed the Database

docker-compose run web bundle exec rails db:create db:migrate db:seed

4. Start the Application

docker-compose up

5. Access the Application
Open your browser and go to:

http://localhost:3000
or
http://127.0.0.1:3000

# Example Seed Data

users for test:

admin user: admin@example.com

password: password

normal user: user@example.com

password: password

The seed data also includes some Polls.

Thanks :)