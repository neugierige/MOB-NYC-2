# MOB-NYC-2
Arun and Anar's course

### How to submit homework

1. Create project with source control checked when saving to a directory on your computer
  * If you leave source control unchecked, you will have to initialize the project's git repository yourself
  * This can be acheived by using a `git init` command in the terminal in the directory of your project
  * You should be familiar with both approaches for initializing a git repository for your assignment projects
2. Create a new repository on GitHub for your current assignment
  * This is your online or remote repository where you will push changes from your local git repository you made earlier
  * Name the GitHub repository in a logical manner, such as MOB-NYC-Assignment-1
  * Make sure to add your instructor and TA as collaborators of your project under settings
3. New GitHub repositories will come with instructions as to how to push your code, depending on if you have a local git repo or not. These instructions must be done through the terminal.
  * Remember, the URL in the examples below is simply an example, you must use your own GitHub URL for your own repo

##### If you left source control checked during project creation, go with this code

`git remote add origin https://github.com/yourGitHubUsername/MOB-NYC-Assignment-1.git`

`git push -u origin master`

##### Otherwise, initialize a local git repo yourself, and push to your GitHub repo

`echo "# MOB-NYC-Assignment-1" >> README.md`

`git init`

`git add README.md`

`git commit -m "first commit"`

`git remote add origin https://github.com/yourGitHubUsername/MOB-NYC-Assignment-1.git`

`git push -u origin master`

