#!/usr/bin/env python

import argparse
import os
import platform

from os import path

dotfiles = ["vim", "i3", "fonts", "vimrc", "xsession", "zshrc", "conkyrc", "tmux.conf", "i3status.conf", "profile", "gitignore_global", "gitconfig", "compton.conf"]
dotfiles_config = ["awesome", "fish" ]

red = '\033[91m'
green = '\033[92m'
orange = '\033[93m'
NC = '\033[0m'

def install(args):
    print("Installing dotfiles...")

    # link dotfiles
    for dotfile in dotfiles:
        dest = path.expanduser("~/.{}".format(dotfile))
        source = path.expanduser("~/dotfiles/{}".format(dotfile))
        if path.exists(dest) and not path.islink(dest):
            print("Error: regular file exists for {}".format(dotfile))
        elif not path.islink(dest):
            os.symlink(source, dest)
            print("Linking {}".format(dotfile))

    # setup misc directories
    vimundo_dir = path.expanduser("~/dotfiles/vimundo")
    if not path.exists(vimundo_dir):
        if path.exists(path.expanduser("~/dotfiles")):
            os.mkdir(vimundo)
        else:
            print("Error: can't create vimundo folder")

    # link extra files
    xinit_file = path.expanduser("~/.xinitrc")
    if not path.islink(xinit_file):
        os.link(path.expanduser("~/.xsession"), xinit_file)

def uninstall(args):
    print("Unlinking dotfiles...")

    # link dotfiles
    for dotfile in dotfiles:
        dest = path.expanduser("~/.{}".format(dotfile))
        if path.islink(dest):
            os.unlink(dest)
            print("Unlinking {}".format(dotfile))
        elif path.exists(dest):
            print("Error: regular file exists for {}".format(dotfile))

def status(args):
    print("Stats:")
    print("Managing {} dotfiles".format(len(dotfiles)))
    print("OS is: {}".format("".join(platform.dist())))

    print("")

    print("Status:")

    for dotfile in dotfiles:
        dest = path.expanduser("~/.{}".format(dotfile))
        if path.islink(dest):
            print("{}{} is linked{}".format(green, dotfile, NC))
        elif path.exists(dest):
            print("{}{} exists, but is not a link{}".format(red, dotfile, NC))
        else:
            print("{}{} does not exist{}".format(orange, dotfile, NC))

def main():
    parser = argparse.ArgumentParser(description="manages a user's dotfiles")
    sp = parser.add_subparsers()

    sp_install = sp.add_parser("install", help="Installs (links) the user's dotfiles")
    sp_install.set_defaults(func=install)

    sp_remove = sp.add_parser("uninstall", help="Removes (unlinks) the user's dotfiles")
    sp_remove.set_defaults(func=uninstall)

    sp_status = sp.add_parser("status", help="Prints the status of the user's dotfiles")
    sp_status.set_defaults(func=status)

    args = parser.parse_args()
    args.func(args)

if __name__ == "__main__":
    main()
