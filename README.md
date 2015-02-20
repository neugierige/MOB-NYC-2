# MOB-NYC-2
Arun and Anar's course

### How to create a GitHub repository for submitting homework

1. Create a directory on your computer where you will be saving all your assignments
2. Use the `cd` command in the terminal to get to the aforementioned directory
  * You can also choose to use the GitHub Mac client instead of the terminal for steps 2 and 3
3. Run the `git init` command in the terminal to initialize your local git repository
4. Now any folders and assignments you add to that directory will be under source control, and can be pushed to your GitHub repository
5. Create a new repository on GitHub to push changes from your local repo
  * This is your online or remote repository where you will push changes from your local git repository you made earlier
  * Name the GitHub repository in a logical manner, such as MOB-NYC-2-Assignments
  * Make sure to add your instructor and TA as collaborators of your GitHub repo under settings
6. New GitHub repositories will come with instructions as to how to push your code, depending on if you have a local git repo or not. These instructions must be done through the terminal. The Mac GitHub client can assist you through a graphical user interface as well.

NOTE: Make sure that when you create new XCode projects, that you leave the option to create git repository unchecked. This is because you only need one git repository for all your projects (the one in your directory), as opposed to a separate git repository for each project.


##### Initializing git repo yourself, and push to your GitHub repo

`echo "# MOB-NYC-2-Assignments" >> README.md`

`git init` (If you haven't done so already)

`git add README.md`

`git commit -m "first commit"`

`git remote add origin https://github.com/yourGitHubUsername/MOB-NYC-2-Assignments.git`

`git push -u origin master`


