# :wave: The Basics of Git and GitHub

## 🤓 Course overview and learning outcomes 

The goal of this course is to provide a quick but complete introduction to version control systems, Git and GitHub, and is intended for people with little to no experience with either.

### Objectives

- develop a clear conceptual model that answers *What are version control systems and why should I use them? What is Git and how do I use it?*
- become more familiar with the GitHub web interface to edit files, clone and fork repositories, manage branches and pull requests
- practice simple git workflows and become more familiar with git GUI clients (e.g., GitHub Desktop or IDEs like VS Code) to interact with your local and remote Git repositories

If these are too simple for you, great! We also have [links to more advanced resources](#additional-resources-) that we've found useful over the years. 🚀

## :octocat: Git and GitHub

Git is a **distributed Version Control System (VCS)**.

A **version control system** is a software tool that helps you track changes to a pile o' files. These can be any kinds of files: images, plain-text source code files, CSVs, NetCDF files, shapefiles, zipfiles, Word documents, PDFs, etc. Whenever you make changes to a file that you want to keep track of you can tell the version control system, _"Hey! Please keep track of the current state of this file."_ and it will efficiently store the difference between the current state of the file after your changes and the way the file was the last time you told the version control system, _"Hey! Please keep track of the current state of this file."_

We usually keep track of plain-text files in a version control system like Git: these include source code, configuration files and scripts. It's fine to store binary formats in git as well but they are stored a little less efficiently and can make downloading ("checking out", or "cloning") your git repository slower. 

**You should avoid** putting *generated* artifacts into Git like compiled executables (e.g. Windows .exe or macOS application bundle), or compiled C code / Java `.class` files. This is because these artifacts are *derivatives* and change as often as the source code changes. In addition, they tend to stop working as the host operating system or language runtimes and dependencies evolve. Instead, you should only put *source material* into Git, the things that are used to create the derivative. So instead of committing the hauntingly evocative figure you generated for your publication, commit the code and permanent references to the input datasets needed to generate that hauntingly evocative figure.

### Why do we need version control systems?

If you've ever had to collaborate with others on a paper or team coding project, you may have experienced something like this:

![PhD Comics: final.doc](https://phdcomics.com/comics/archive/phd101212s.gif)

or this:

![NetLogo: Neolithic Ecological expansion many versions](images/neolithic-versions.png)

These are typical ad-hoc filename based versioning systems where you change the name of the file each time you make a change. What's lacking? 

Git helps you maintain a clean record of what you’ve worked on - which files changed, what were the changes, and why were the changes made. It's also important to know how to  easily switch between versions so you can always get back to that Last Known Good Setup that you had before you began tinkering or experimenting with something new.

Git and GitHub can help you transparently document and preserve the provenance of your scientific code. *Which changes came from where, when, from whom, and why* can all be reliably stored and made accessible by Git, facilitating future comprehension and reuse. However, a clean Git history that clearly demonstrates the evolving life of a piece of scientific code requires discipline and maintenance like gardening. 

GitHub is a way to use the power of Git online with an easy-to-use web interface. It’s widely used in the software world and beyond to collaborate and maintain the history of projects.

## Key Concepts

Let's start with some common terms and definitions.

### Repositories

A repository is where your project work happens -- it is the _root project_ folder that contains all your project’s files: source code, documentation, configuration files, input data files, data analysis scripts, images, etc. To start working with a Git repository, you can [clone](#cloning-a-repository) it, which downloads a local copy of the Git repository onto your computer. 

Repositories can be `local` (on your desktop or laptop) or `remote` (e.g., stored in the cloud ☁️ on GitHub, GitLab, BitBucket, etc).

GitHub repositories can contain a **README** plain text file in Markdown format. Every directory managed in your Git / GitHub repository will display its README when you view that directory on GitHub - here are [some](https://github.com/comses/winter-school-2022/tree/main/projects) [examples](https://github.com/comses/winter-school-2022/tree/main/initial-tutorial).

It's good practice to add a README file to your repository to tell other people why your project is useful, what they can do with your project, and how they can use it. We are using this README to communicate how to learn Git and GitHub with you. 😄 

To learn more about repositories read ["Creating, Cloning, and Archiving Repositories](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-repositories) and ["About README's"](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-readmes). 


#### Advanced

A cloned Git repository is your pile o' files with an additional `.git` directory relative to the repository's root directory with all of the magic Git book-keeping and metadata representing the clear and transparent provenance trail of *which changes came from where, when, from whom, and why*.

Whenever you are doing Git things (i.e., executing Git commands) you're using the `git` program to interact with the stuff inside the managed `.git` directory of a Git repository.

### Clone a repository

When a repository is created on GitHub.com (i.e., you click on the "New" button from your GitHub dashboard or the "Repositories" tab in your GitHub profile), it’s stored remotely in the cloud ☁️. You can **clone this repository** to create a local copy on your computer and then use Git to keep the two repositories synced. 

This makes it easier to work on new features, fix bugs, and push larger commits that affect lots of files. When you **clone a repository**, downloading it to your local computer, you can use your favorite text editor as opposed to the GitHub UI to edit and modify these files (or a programming platform application like NetLogo!).

Cloning a repository also pulls all the repository data that GitHub has at that point in time, including all versions of every file and folder for the project. This means you can switch to any version that was stored on GitHub at any point.

To learn more about cloning, read ["Cloning a Repository"](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository). 

#### Follow-along Assignment

Please clone this repository now. In GitHub Desktop, click File -> Clone repository <kbd>Ctrl</kbd> + <kbd>Shift</kbd> + <kbd>O</kbd> and enter the URL from the Code button - it should be something like `https://github.com/<yourusername>/github-starter-course`
like 

![Clone this repository](images/git-clone.png)


### Commit and push

**Commits** are how you tell Git you are ready to record the changes you've made to a file or collection of files. It's a good rule of thumb to keep commits small and self contained - if you fixed a bug and added a test that exposes the bug, make a commit to capture just those changes. This makes it easier to follow a project's history over time and understand what changes were made where and why.

Don't fix a bug, add a feature, change the way a function is implemented, and rename some variables all in the same commit. It'll make it a lot harder to pick out what was done and what was being recorded.

Instead, make each of those things their own commit, each representing one small(ish) localized change.

A `commit` as a discrete data object with useful metadata about the set of changes that were made to the repository. What kinds of things do you think they need to keep track of? 

1. the set of files that were changed (called the _changeset_)
2. Its "parent" commit. Every commit data object keeps track of its parent commit except the very first root commit initializing a Git repository
3. the actual file level differences between the files in the _changeset_ and what was in those files previously, in this commit's "parent" commit
4. provenance metadata: a commit log message that you write to explain the commit, the git username and email of the commit's author, and more
5. a unique hash ID (you'll see these often on GitHub)
6. What else you would keep track of if you were Git?

On the command line, this is a 2-phase process. First you **add** files to your commit, telling git that you want to keep track of these files, then you **commit** them, formally marking them as part of your commit and adding associating a commit log message with that _changeset_.

With GitHub Desktop, you'll click checkboxes on the files you want to commit (and remember to uncheck files you **don't** want to commit), enter a log summary and descriptive message to remind your future self and collaborators what you did and why and other relevant non-obvious details that would be difficult to glean from the code itself. Then click the "Commit" button.

![Github Desktop commit](images/github-desktop-commit.png)

After you've committed your changes you'll be able to **push** those commits to add them to the **remote** GitHub repository.

![GitHub Desktop push origin](images/github-desktop-push-origin.png)



Summary: use **commit** and **push** to share your changes with a remote repository so your teammates and collaborators can see your latest work. They can also easily **pull** those changes into their local Git repositories to test them out or build on them.


### Fetch and pull

`Fetch`

**Fetching** or **pulling** are how 

## Managing Contributions: Conflicts, Merging, Branching, and Pull Requests

### Branches
You can use branches on GitHub to isolate work that you do not want merged into your final project just yet. Branches allow you to develop features, fix bugs, or safely experiment with new ideas in a contained area of your repository. Typically, you might create a new branch from the default branch of your repository—main. This makes a new working copy of your repository for you to experiment with. Once your new changes have been reviewed by a teammate, or you are satisfied with them, you can merge your changes into the default branch of your repository.
To learn more about branching, read ["About Branches"](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-branches).

### Forks
A fork is another way to copy a repository, but is usually used when you want to contribute to someone else’s project. Forking a repository allows you to freely experiment with changes without affecting the original project and is very popular when contributing to open source software projects!
To learn more about forking, read ["Fork a repo"](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo)

### Pull requests
When working with branches, you can use a pull request to tell others about the changes you want to make and ask for their feedback. Once a pull request is opened, you can discuss and review the potential changes with collaborators and add more changes if need be. You can add specific people as reviewers of your pull request which shows you want their feedback on your changes! Once a pull request is ready-to-go, it can be merged into your main branch.
To learn more about pull requests, read ["About Pull Requests"](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/about-pull-requests). 


### Issues
Issues are a way to track enhancements, tasks, or bugs for your work on GitHub. Issues are a great way to keep track of all the tasks you want to work on for your project and let others know what you plan to work on. You can also use issues to tell a favorite open source project about a bug you found or a feature you think would be great to add!

For larger projects, you can keep track of many issues on a project board. GitHub Projects help you organize and prioritize your work and you can read more about them [in this "About Project boards document](https://docs.github.com/en/github/managing-your-work-on-github/about-project-boards). You likely won’t need a project board for your assignments, but once you move on to even bigger projects, they’re a great way to organize your team’s work!
You can also link together pull requests and issues to show that a fix is in progress and to automatically close the issue when someone merges the pull request.
To learn more about issues and linking them to your pull requests, read ["About Issues"](https://docs.github.com/en/github/managing-your-work-on-github/about-issues). 

### Your user profile

Your profile page tells people the story of your work through the repositories you're interested in, the contributions you've made, and the conversations you've had. You can also give the world a unique view into who you are with your profile README. You can use your profile to let future employers know all about you! 
To learn more about your user profile and adding and updating your profile README, read ["Managing Your Profile README"](https://docs.github.com/en/github/setting-up-and-managing-your-github-profile/managing-your-profile-readme). 

### Using markdown on GitHub 

You might have noticed already, but you can add some fun styling to your issues, pull requests, and files. ["Markdown"](https://guides.github.com/features/mastering-markdown/) is an easy way to style your issues, pull requests, and files with some simple syntax. This can be helpful to organize your information and make it easier for others to read. You can also drop in gifs and images to help convey your point!
To learn more about using GitHub’s flavor of markdown, read ["Basic Writing and Formatting Syntax"](https://docs.github.com/en/github/writing-on-github/basic-writing-and-formatting-syntax). 


### Beginners Git Workflow

Now that we have some basic terminology for Git and GitHub under our belt we can start to go into typical workflows for
how we can use Git to manage changes to our files. 

The simplest Git workflow is to have a single committer, you, commit and push all of your changes to your local
repository and synchronize that with GitHub. 

0. Have a Git repository cloned on your local computer e.g., `C:\Users\my-username\GitHub\my-first-fisher-price-git-repository`
1. Make some changes to your files in your git repository
2. (Alternatively, you can also make changes to your files directly in the GitHub web interface)
3. Commit your changes selectively and include meaningful log messages
4. Push them to your hosted repository on GitHub.com

## Advanced

The GitHub flow is a lightweight workflow that allows you to experiment and collaborate on your projects easily, without the risk of losing your previous work. It uses Pull Requests and branches to manage incoming changes and is better suited to larger scale collaborative development where you have many people working in tandem on code.

https://docs.github.com/en/get-started/quickstart/github-flow

## General Git Guidelines

1. **Keep commits small and isolated** if you can. Think of commits as logical, self-contained checkpoints of your code, 
   e.g., 
        - add a new feature
        - fix a bug
        - improve a visualization
        - improve text labels or documentation
        - fix a typo or other speling error 
2. **Commit early, commit often** and frequently synchronize your work to make sure your local version of the Git
   repository doesn't become stale and out-of-date. This is less of a problem when you are the only one working on
   things, but is still a good habit to keep.
3. **Write meaningful log messages** that clearly document the intent of your change(s) and any thorny assumptions. Commit log messages are notes to your
   peers as well as your future self and future collaborators.
4. **Use tags and releases** to keep track of important coding milestones. Did this exact version of your computational model pass all of its tests and generate harrowing data that lead to publishable findings? Make sure it's fully synced with your GitHub repository (e.g., **commit** and **push** any available changes), then create a [release, tag, and DOI](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content) that points at this version.


## Next Steps

Complete the following assignments:

* [Assignment 0](assignment-0.md) - Familiarize yourself with [GitHub Desktop](https://docs.github.com/en/desktop/installing-and-configuring-github-desktop/overview/getting-started-with-github-desktop) or equivalent git client so you can synchronize the work on your local machine with GitHub. 
* [Assignment 1](assignment-1.md) - Create a new markdown file in this repository named `documentation.md` and experiment with different Markdown styles. Feel free to let us know what you've learned, and what you are still confused about.
* [Assignment 2](assignment-2.md) - Add a NetLogo file to this repository (feel free to upload one from the NetLogo model commons, e.g., https://ccl.northwestern.edu/netlogo/models/DiningPhilosophers)
* [Assignment 3](assignment-3.md) - Open a pull request and tag us via the `@` symbol, e.g., `@alee` to let us know that you’ve finished this course.
* (Optional) Create your profile README. Let the world know a little bit more about you! What are you interested in learning? What are you working on? What's your favorite hobby? Learn more about creating your profile README in the document, ["Managing Your Profile README"](https://docs.github.com/en/github/setting-up-and-managing-your-github-profile/managing-your-profile-readme).
* (Optional) Go to your user dashboard and create a new repository. Experiment with the features within that repository to familiarize yourself with them. 
* [Let us know what you liked or didn’t like about the content of this course](https://support.github.com/contact/education). What would you like to see more of? What would be interesting or helpful to your learning journey? 

## Additional Resources 📚
* [A short video explaining what GitHub is](https://www.youtube.com/watch?v=w3jLJU7DT5E&feature=youtu.be) 
* [Git and GitHub learning resources](https://docs.github.com/en/github/getting-started-with-github/git-and-github-learning-resources) 
* [Understanding the GitHub flow](https://guides.github.com/introduction/flow/)
* [How to use GitHub branches](https://www.youtube.com/watch?v=H5GJfcp3p4Q&feature=youtu.be)
* [Interactive Git training materials](https://githubtraining.github.io/training-manual/#/01_getting_ready_for_class)
* [GitHub's Learning Lab](https://lab.github.com/)
* [Education community forum](https://education.github.community/)
* [GitHub community forum](https://github.community/)
* [Learn Git interactively in your browser](https://learngitbranching.js.org/)
* [Pro Git (free ebook)](https://git-scm.com/book/en/v2)
* [Atlassian's Git tutorials](https://www.atlassian.com/git/tutorials)
