# README
## Name
Paralink
## Overview
Communication tool for people with disabilities and caregivers.
## Description
Persons with disabilities and caregivers can post their opinions and thoughts and learn about their thoughts.
In addition, you can post photos, add the description of the photo, it can be enjoyed by people with disabilities.
## Function
+ Post function
+ Comment on a post
+ Post / user name search function
## Requirements
Can be used in Docker environment
## Usage
1. Register your username, email, and password. <br>(you can also register and login with your Twitter / Facebook account)
2. You can post messages and photos from the posting screen.
3. You can comment on the post.
4. You can search for posts or usernames
## Installation
Download and install Docker for your OS from the following URL.
https://www.docker.com/products/docker-desktop
1. Start and build the docker container.<br>$ docker-compose up -d --build
2. Create DB.<br>$ docker-compose exec web rails db:create
3. Run the migration fil.<br> $ docker-compose exec web rails db:migrate
4. Access「http: // localhost: 3000」in the browser.
## Test
Execute the following command while the app is running.  
$ docker-compose exec web rspec  
or  
$ docker-compose exec web bin/rspec
## Deploy
If you have a heroku / circleCI account, you can deploy by following the steps below.  
### Deploy to heroku
1. $ heroku login
2. Install a plugin to release the container.<br>$ heroku plugins:install @heroku-cli/plugin-container-registry
3. Log in to docker container registry<br>$ heroku container:login
4. $ heroku create
5. $ heroku container:push web
6. $ heroku addons:create heroku-postgresql:hobby-dev
7. $ heroku run rails db:migrate
8. $ heroku container:release web  

Deployed to heroku with the above command  

### Build a pipeline with circleCI
Log in to circleCI and follow the GitHub repository.  
Then set HEROKU_AUTH_TOKEN, HEROKU_LOGIN, HEROKU_API_KEY, HEROKU_APP_NAME.  
When you push to Git, it will automatically test and deploy.
>>https://qiita.com/kei_f_1996/items/934296e23b0d8d877ff1

## Author
[Kazuaki Nanayaku](https://twitter.com/789__PQ)
## License
MIT
