CarTrading App
==============

Note: To be improved.


##Code Convention / ruby style guide

This seems to be a goog start point: 

https://github.com/bbatsov/ruby-style-guide

##Workflow for implementing a feature / solving a task

1. Pull from the remote master

`
git pull origin master
`

2. Create a local branch
`
git checkout -b name_of_your_branch
`
-> After executing this command you're on the branch name_of_your_branch

With the command
`
git status 
`

you can always check on which branch you are.


3. Implement the feature.

4. Merge all your local commits into a single commit (nice to have)

You can commit as many commits as you like. 
But before you push something on the remote master branch
use the command git rebase to merge all your local commit 
for this specific feature into a single commit.


(The following manual is copied from https://ariejan.net/2011/07/05/git-squash-your-latests-commits-into-one/)

You can use git log to check you're last commits.

Let's say this is your current git log.
`
* df71a27 - (HEAD feature_x) Updated CSS for new elements (4 minutes ago)
* ba9dd9a - Added new elements to page design (15 minutes ago)
* f392171 - Added new feature X (1 day ago)
* d7322aa - (origin/feature_x) Proof of concept for feature X (3 days ago)
` 

You have a branch feature_x here. You've already pushed d7322aa with the proof of concept of the new feature X. After that you've been working to add new element to the feature, including some changes in CSS. Now, you want to squash your last three commits in one to make your history look pretty.

The command to accomplish that is:

git rebase -i HEAD~3
This will open up your editor with the following:
`
pick f392171 Added new feature X
pick ba9dd9a Added new elements to page design
pick df71a27 Updated CSS for new elements
`
Now you can tell git what to do with each commit. Let's keep the commit f392171, the one were we added our feature. We'll squash the following two commits into the first one - leaving us with one clean commit with features X in it, including the added element and CSS.

Change your file to this:
`
pick f392171 Added new feature X
squash ba9dd9a Added new elements to page design
squash df71a27 Updated CSS for new elements
`
When done, save and quit your editor. Git will now squash the commits into one. All done!

Note: do not squash commits that you've already shared with others. You're changing history and it will cause trouble for others.

Remark:

You can use the following  the first commit message line
`
fix #xxx
`
to reference to a fixed or resolved issue by replacing xxx
with the corresponding number.



5. Before pushing to the remote master branch, 
test your implementation against base cases and also edge cases.

6. Push it on the master
`
git push origin master
`



