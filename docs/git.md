# Beginner Git {#t2016git}

# Prerequisites

-   Have `git` installed via:
    -   `sudo apt install git` on ubuntu
    -   [Install for Windows from here](https://git-scm.com/download/win).
-   Know the following commands (run in `git bash` or in your terminal)
    -   `pwd`
    -   `cd`
    -   `ls`
    -   `mkdir`
    -   `rm`
    -   Learn these and more [here](https://help.ubuntu.com/community/UsingTheTerminal#File_.26_Directory_Commands)!
-   Have a text editor installed and be comfortable using it!
    -   Gui or terminal does not matter.

# Git

> The Stupid Content Tracker

-   `git` is *NOT* GitHub.
-   GitHub is 'server git'

## Why `git` over another VCS?

-   Branching and Merging
-   ***FAST***
-   Powerful, and Flexible
-   Free (as in freedom, and as in beer)

## Why `git` over another client?

-   `git` is the 1st party front-end
-   `git` is the way it was designed to be experienced.
-   Learning `git` is the easiest way to understand what's going on.
-   `git` gives you ultimate, uninhibited access to your repository.

# Basic Git Commands

-   Follow along on your own computer!

## Creating a `git` Repo

```shell
# Create a folder named 'repo'
mkdir repo
# Move inside 'repo'
cd repo
# Create a git repository where we are
# (created inside the repo folder)

git init
# > Initialized empty Git repository in /tmp/repo/.git/
git status
# > On branch master
# > Initial commit
# > nothing to commit (create/copy files and use "git add" to track)

# Use cd .. to move up a directory
```

## Adding *Content*

```shell
# Create a file called file.txt with some text in it.
# Example:
echo "this is a line to be stored into git" > file.txt
git status
# > Untracked files:
# >   (use "git add <file>..." to include in what will be committed)
# >     file.txt
git add file.txt
# > Changes to be committed:
# >   (use "git rm --cached <file>..." to unstage)
# >         new file:   file.txt

# This message should reflect the change. We'll come back to this.
git commit -m "Added a small amount of content"
```

## Staging Area

![img](https://i.imgur.com/lSuhwGr.jpg)

## Viewing History

-   `git` versions are 'hashes'
    -   Something like: `cbbd8d9a5e...`
    -   You don't need the full hash to refer to a commit
        -   Only use ~6 chars from the front.

```shell
# Show the latest commit
git show

# Show all commits (use q to quit)
git log
```

## Git History

-   Every git version is linked to it's previous versions:
-   `v1 <- v2 <- v3 <- v4`
-   Every version is linked to the previous version

# Git Branching

-   We'll discuss what we're doing in a bit
-   Let's create a new feature, but we know it's going to be buggy
    -   Let's create it in an isolated environment, a branch!

## Create a feature branch

```shell
# Create a myfeature branch
git branch myfeature
# Move to myfeature branch
git checkout myfeature

# Let's find out where we are
git status
# > On branch myfeature
# > nothing to commit, working tree clean
```

## Add a new 'feature'

```shell
echo "My new feature!" >> file.txt
git add file.txt
git commit -m 'My new feature is very cool, but buggy!'
```

## There's a bug in the released version!

-   Let's patch the version everyone is on, the master release!

```shell
# Switch back to the master branch
git checkout master
git status
# Look at the contents of file.txt at this point!

echo "My critical bugfix!" >> file.txt
git add file.txt
git commit -m "Critical bugfix number 1!"
```

## What just happened?

-   We first created our test file, which is our 'release version'
-   Then we created a feature branch, and made some 'buggy changes'
-   We then realized we need to fix a bug in the 'release version'
    -   We switched back to release, and 'fixed the bug'

## Let's take a closer look

```shell
# A much nicer git log that will visualize our history
git log --oneline --graph --all

git show <commit hash>
```

## Merging

-   Brings divergent branches together
-   Let's release our feature by putting it into the master branch

```shell
# We want to merge INTO master
git checkout master

# Merge myfeature into master
git merge myfeature
# > Auto-merging file.txt
# > CONFLICT (content): Merge conflict in file.txt
# > Automatic merge failed; fix conflicts and then commit the result.

# That's not good!
git status
# Edit file.txt to remove >>> <<< and ===
git add file.txt
git commit # Just save whatever pops up
git status
```
