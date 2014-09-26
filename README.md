CarTrading App
==============

Note: To be improved.


##Code Convention / ruby style guide

This seems to be a good starting point: 

https://github.com/bbatsov/ruby-style-guide


##Getting started

1) Create a new directory

`
mkdir CarTrading
`

2) Switch to that directory and initialize a new git repo

`
git init
`

3) Add the remote

`
git remote add origin git@github.com:wanze/CarTrading.git
`

4) Pull from the master branch

`
git pull origin master
`

##Run the application
Switch to your CarTrading directory and install the required gems.

`
bundle install
`

Migrate the database.

`
rake db:migrate
`

If you want you can load some sample data from the folder test/fixtures.

`
rake db:fixtures:load
`

Run the app.

`
rails s
`

##Troubleshooting
###rake db migration fails
Reset the db.

`
rake db:reset
`

Run rake migration.

`
rake db:migrate
`


###if the db is really screwed
Drop all the data.

`
rake db:drop:all
`

Create the db.

`
rake db:create:all
`


Run rake migration.

`
rake db:migrate
`



###dependencies are missing
Run bundle install.

`
bundle install
`


##Workflow for implementing a feature / solving a task
1) Before you start implementing a feature

`
git checkout master
`

`
git pull origin master
`

2) Create a new branch

`
git checkout -b new_feature
`

3) Implement the feature and commit the changes

`
git commit
`



4) Merge master branch into the feature branch

`
git merge master
`

5) Switch to the master branch

`
git checkout master
`

6) Merge the feature branch into the master branch

`
git merge new_feature
`

7) Push it on the remote master branch

`
push origin master
`
