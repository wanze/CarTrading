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

3) Implement the feature

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
