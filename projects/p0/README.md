# Project 0: Setup

This project is simply to get your system ready. It will not be submitted for
a grade. 

# Introduction

In this course, among other things, you will learn three different programming
languages: Ruby, OCaml, and Rust. To complete the projects you have to
install the appropriate software to develop programs in these languages.

To install all the necessary libraries and ensure they work we will be using a program called docker. 

## Table of contents
- [Docker](#docker)
  * [Installing Docker](#installing-docker)
    + [Linux](#linux)
    + [Mac OS](#mac-os)
    + [Windows](#windows)
  * [Making the container](#making-the-container)
  * [Using the container](#using-the-container)
    + [Exiting the container](#exiting-the-container)
- [Manual Package Installation](#manual-package-installation)
  * [macOS](#macos)
  * [Windows 10](#windows-10)
  * [Linux](#linux-1)
  * [Working with WSL](#working-with-wsl)
    + [Visual Studio Code for WSL](#visual-studio-code-for-wsl)



# Docker 
We will be using docker as our intermediary to hold all the necessary packages and other essentials. 
However, if you encounter an error and cannot debug we have provided an alternate set of instructions to manually install all the necessary packages onto your computer. 

## Installing Docker 

### Linux 
If you are using Ubuntu or another Debian distribution, you can install docker by using the following command:

```
sudo apt-get install docker
```
If you are using a distribution other ubuntu, then you will have to use your package manager available to install docker. 


### Mac OS 
You can find the installer [here](https://hub.docker.com/editions/community/docker-ce-desktop-mac/) and install the dmg using the instructions mentioned [here](https://docs.docker.com/docker-for-mac/install/). 

### Windows  
Windows, by default, does now have the terminal or the commands to get setup. 
[This application](https://gitforwindows.org/) will give have all the necessary tools and interface to setup.

There are some prerequisites that need to be addressed if you are on a windows machine: 
1. Install Windows 10, version 2004 or higher.
2. Enable WSL 2 feature on Windows. For detailed instructions, refer to the [Microsoft documentation](https://docs.microsoft.com/en-us/windows/wsl/install-win10).
3. Download and install the [Linux kernel update package](https://docs.microsoft.com/windows/wsl/wsl2-kernel).

You can find the installer [here](https://hub.docker.com/editions/community/docker-ce-desktop-windows/) and for the installation guide refer to the instructions [here](https://docs.docker.com/docker-for-mac/install/). 

If you are using gitbash then you _do not_ need `sudo` in the following steps. 


## Making the container 
Once you have all the necessary tools installed we can proceed making the container. 
In a terminal window navigate to the course github folder(i.e. CMSC330summer20). 
Once at the github folder, navigate to the projects directory. 
If you `ls` in this directory you should find a `Dockerfile`.
This file contains the instructions to setup the container. 
Run the following command in the docker folder:
```
sudo docker build -t 330container .
```
This step can take up to 20 minutes. 

## Using the container 
Once the above step is done you are ready to use the container.
To test if the container was installed correctly we will run the tests in `p0`.
Navigate to the folder with the docker file, and run the following command
```
sudo docker run -it --mount type=bind,source="$(pwd)",target="/root/cmsc330_src" 330container
```

Breaking down the above command: 


`sudo docker run -it`: This part says to run the command in interactive mode so that you have a terminal to run tests


`--mount type=bind,source="$(pwd), target="/root/cmsc330_src"`: This says that which ever directory you are in should be linked to the `/root/cmsc330_src` directory in the container.


`330container`: This is the name of the container we built earlier. 


_Note_: If you are on windows you may get a prompt to share the folder you are in. Make sure you say `yes` to sharing the folder.

If the command was run successfully, you will get a prompt like this
```
root@d0fa451163a1:~#
``` 
Once the container is run navigate to the p0 directory 
```
cd /root/cmsc330_src/p0/
```
If the above command returns a `directory not found` error then the binding directory is incorrect. 
Make sure that the run command was executed in the correct directory. 

Once in the directory, run 

```
ruby public.rb 
```
and you should see an output similar to 
```
root@d0fa451163a1:~/cmsc330_src/p0# ruby public.rb
[WARNING] Running as root is not recommended
Run options: --seed 60484

# Running:

...[WARNING] Running as root is not recommended
[WARNING] Running as root is not recommended
[WARNING] Running as root is not recommended
[WARNING] Running as root is not recommended
....

Finished in 1.626617s, 4.3034 runs/s, 7.9920 assertions/s.

7 runs, 13 assertions, 0 failures, 0 errors, 0 skips
root@d0fa451163a1:~/cmsc330_src/p0#
``` 
You may ignore the warnings because this is in a docker container. 

### Exiting the container

If you want to exit the container then when you are at the prompt `root@10403927ae0d:~#` run `exit` or press `Ctrl-D` to exit back into your terminal


# Manual Package Installation 

Here are the packages that you are required to install.

* [Ruby](https://www.ruby-lang.org)
  - [minitest](https://rubygems.org/gems/minitest)
  - [sqlite3](https://rubygems.org/gems/sqlite3)
  - [sinatra](https://rubygems.org/gems/sinatra)
* [OCaml](http://ocaml.org)
  - [OPAM](https://opam.ocaml.org)
  - [OUnit](https://opam.ocaml.org/packages/ounit)
  - [ocamlfind](https://opam.ocaml.org/packages/ocamlfind)
  - [dune](https://opam.ocaml.org/packages/dune/)
* [Rust](https://www.rust-lang.org)
* [SQLite3](https://sqlite.org)

We highly recommend, but do not require, installing the following
packages.

* [Graphviz](http://graphviz.org)
* [utop](https://opam.ocaml.org/packages/utop)

The next sections will help guide you through installing these
on different operating systems. Follow the instructions for your operating system. Some
of these steps may take a long time, be patient. To verify you have
completed all the steps correctly, run `ruby public.rb` in this directory.
You should not get any errors.

Computers are like people, each unique in its own way. These instructions
may require slight (or large) modifications depending on your setup.
Search engines are your friend if something goes wrong. If you are unable
to install **anything**, please come to office hours **as soon as possible**. 

## macOS 

First, we will install the Homebrew package manager.

* `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Check your Ruby version with `ruby -v`. If it's older than 2.2.2 you'll need
to install a newer version using `brew install ruby`.

Next, we can install some of the software through Homebrew.

* `brew install ocaml opam rust graphviz`

Macs already come with Ruby and the Ruby Gems package manager. We only need
to install the required gems.

* `sudo gem install minitest sqlite3 sinatra`

If it hangs installing documentation for Sinatra, hit Ctrl-C. It will
have successfully installed anyway.

The OCaml package manager needs some initial configuration.

* `opam init`
* When prompted to modify `~/.bash_profile` (or another file) type "y".
* `source ~/.bash_profile` (or the file mentioned above).

First we want to make sure that we have the correct version of OCaml. We'll be
using version 4.07.0. Run  `ocaml -version` to see which version you have.

If the version is not 4.07.0, then use `opam switch 4.07.0` (you may need to 
run `opam switch create 4.07.0` instead). Don't forget to run the
advertised ``eval `opam config env` `` to update your PATH accordingly.

Then run `ocaml -version` to make sure it says 4.07.0

Next, we will install the required OCaml packages through OPAM.

* `opam install ocamlfind ounit utop dune qcheck`

## Windows 10 

Enable the [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
and install Ubuntu. Make sure to run `sudo apt update && sudo apt upgrade` after installing. 
Then follow the instructions in the Linux section below. 

## Linux 

These instructions will assume you have a Debian-based system. This includes
distributions like Ubuntu. If you have a different distribution, use the
native package manager.

We will install all the packages we need.

* `sudo apt-get install ruby-dev sqlite3 libsqlite3-dev ocaml ocaml-native-compilers camlp4 opam make m4 curl graphviz default-jre`

Next, we will install some gems.

* `sudo gem install minitest sqlite3 sinatra`

If it hangs installing documentation for Sinatra, hit Ctrl-C. It will
have successfully installed anyway.

The OCaml package manager needs some initial configuration.

* `opam init`
* If it hangs at "Fetching repository information" press Enter. This may take awhile, be patient.
* When prompted to modify `~/.profile` (or another file) type "n".
* Open `~/.profile` (or the file mentioned above) in your text editor (probably emacs).
* Add ``eval `opam config env` `` (these are **backticks** located to the left of the 1 key, not single quotes).
* Save the file and run `source ~/.profile` (or the file mentioned above).

We want to make sure that we have the correct version of OCaml. We'll be
using version 4.07.0. Run  `ocaml -version` to see which version you have.

If the version is not 4.07.0, then use `opam switch 4.07.0`
(you may need to run `opam switch create 4.07.0` instead).
Don't forget to run the advertised ``eval `opam config env` `` to update your
PATH accordingly.

Then run `ocaml -version` to make sure it says 4.07.0

Next, we will install the required OCaml packages through OPAM.

* `opam install ocamlfind ounit utop dune qcheck`

Finally, we'll install Rust. Note this may take some time.

* `curl https://sh.rustup.rs -sSf | sh`

## Working with WSL  

Let's say you want to clone the 330 repository into somewhere accessible, like your documents folder or your desktop in your Windows filesystem. This section will show you the correct way to accomplish this. PLEASE READ THE ENTIRE SECTION BEFORE DOING ANYTHING.

From your Ubuntu home directory, open the hidden .profile file using emacs or vim (Do NOT use Atom, VS Code or any other outside editor).

Add the following line to the end of the file 

```code
cd /mnt/c/Users/<Your Username Here>/Desktop
```
Save the .profile file and exit the subsystem. When you re-open the subsystem, it will open looking at your desktop.

From here you can clone into the 330 github repository as described in project0 and the repo should be on your desktop.

All of the files on your desktop should not cause any permission issues and can be worked on in any IDE.

You can also modify the line in the .profile file to point to another place on your computer, such as your Documents folder and you will still not run into any permission issues. 

A small tip: if you are in the Windows terminal and want to access WSL capabilities, type `bash` into your terminal to enable WSL.

### Visual Studio Code for WSL 

You can use any editor you would like for this class, but if you are on a Windows, we recommend checking out [Visual Studio Code](https://code.visualstudio.com/). You may run into miscellaneous problems when working in between your Windows system and WSL, and VS Code mitigates most of those problems. Again, you can develop using any editor you'd like, but if you need a place to start, VS Code is a good option.
