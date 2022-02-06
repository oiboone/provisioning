## Things to learn

* Credentials manager
* Normal staging, checkin, checkout process for single branch
* Branching and merging

## Github related

* Automatically running tasks on checkin? "git actions"
* Normal use cases: clone repository locally, work, check back in or create rposiory locally, clone to github, update remte repository.

## Basic command line git usage

### Initial setup of git on a machine

If not already installed, install git via: 
```
$ sudo apt install git
```

then set up user information via:
```
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
```


### Creating a new repository in existing current directory

git init 
: creates new .git repository in current directory

### Staging files for next commit

git add **filename**
: stages **filename** for next commit

git add .
: stages all files in current directory

git add -A
: stages all files in repository tree

git add -u
: stages new and modified files but not deleted ones

### committing staged files

git commit -m **commit message**
: creates new commit on current branch with all staged changes.

### Restoring an old version of a file

git status
: shows which branch is current and what staged and unstaged changes exist

git log --oneline 
: shows history of commits in repository

git checkout **commit-id** **filename** 
: restores an old version of a file from the repository

## Github connection

### Cloning an existing Github repository into empty local directory 

git clone **url**

## Creating a GITHUB repository for a project already on a local machine

On Github, create a new, empty repository with no initial files (e.g. no README or LICENSE files).

git remote add origin **Github__Repository_URL** 
: Repo URL looks like github.com/oiboone/repo_name.git

git remote -v
: tests connection to remote repository

git push origin main 
: note that this uses main rather than master as the primary branch

### pushing current local repository to github

git push origin main
: note that this uses main rather than master as the primary branch
