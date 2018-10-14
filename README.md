[![Project Status: Unsupported – The project has reached a stable, usable state but the author(s) have ceased all work on it. A new maintainer may be desired.](https://www.repostatus.org/badges/latest/unsupported.svg)](https://www.repostatus.org/#unsupported)
[![license](https://img.shields.io/badge/license-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.en.html)

# Aim

The aim is to store a file at one location but give it multiple tags in order to find it easily later. 

# Note

I am using the scripts for years now and of course there is room for improvment, for instance moving
multiple files that were tagged with one call, but for my purpose it works good enough and I will 
probably not further improve the scripts!

# Example

First we create labels we want to use later:

```
user$ tagmake 2018 bank contract
```

Now assume we have two files /foo/bar/a and /bar/foo/b

```
user$ tag /foo/bar/a 2018 bank
user$ tag /bar/foo/b 2018 contract
```

Search for files with tag *2018* will yield both files

```
user$ tagsearch 2018

files:
/foo/bar/a
/bar/foo/b

tags(union):
2018 bank contract
```

Search for files with tag *bank* will yield only one file

```
user$ tagsearch bank

files:
/foo/bar/a

tags(union):
2018 bank
```

Search for files with tag *bank* and tag *contract* will yield no file 
because there is no file that has both tags at the same time

```
user$ tagsearch bank contract

files:
```

# Installation

1. Copy the scripts to some folder and add the folder to the PATH-environment variable
1. Create a folder .tag in your homefolder (here all symbolic links to files that were tagged will be stored)

# Warning

The files are not modified. Instead a symbolic link is created that points to the file that is tagged. 
Hence, moving the files after being tagged will result in broken symbolic links.
There is a dedicated script *tagfilemv* that can move ONLY one file.
