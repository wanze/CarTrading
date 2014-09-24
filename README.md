CarTrading App
==============

Note: To be improved.


##Code Convention / ruby style guide

This seems to be a good starting point: 

https://github.com/bbatsov/ruby-style-guide

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
