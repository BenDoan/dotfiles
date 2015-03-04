import parseopt2
import os
import terminal
import strutils
import osproc

const dotfiles = ["vim", "i3", "fonts", "vimrc", "xsession", "zshrc", "conkyrc", "tmux.conf", "i3status.conf", "profile", "gitignore_global", "gitconfig", "compton.conf"]

proc install() =
    echo "Installing dotfiles..."

    for dotfile in dotfiles:
        let dest = os.expandTilde("~" / "."&dotfile)
        let source = os.expandTilde("~" / "dotfiles" / dotfile)

        if os.existsFile(dest) and not os.symlinkExists(dest):
            echo "Error: regular file exists for " & dotfile
        elif not os.symlinkExists(dest):
            os.createSymlink(source, dest)
            echo "Linking " & dotfile

    discard osproc.execCmd("git submodule update --init")
    discard osproc.execCmd("bash _setup.sh")

proc uninstall() =
    echo "Unlinking dotfiles..."

    for dotfile in dotfiles:
        let dest = os.expandTilde("~" / "."&dotfile)

        if os.symlinkExists(dest):
            os.removeFile(dest)
            echo "Unlinking " & dotfile
        else:
            echo "Error: regular file exists for " & dotfile

proc status() =
    echo "Stats:"
    echo format("Managing $# dotfiles", dotfiles.len())
    echo format("OS is $# $#", hostOS, hostCPU)

    echo ""

    echo "Status:"
    for dotfile in dotfiles:
        let dest = os.expandTilde("~" / "."&dotfile)
        if os.symlinkExists(dest):
            terminal.setForegroundColor(fgGreen)
            echo dotfile&" is linked"
        elif os.existsFile(dest):
            terminal.setForegroundColor(fgYellow)
            echo dotfile&" exists, but is not a link"
        else:
            terminal.setForegroundColor(fgRed)
            echo dotfile&" does not exist"

proc main() =
    for kind, key, val in getopt():
        case key
        of "install":
            install()
        of "uninstall":
            uninstall()
        of "status":
            status()
        else:
            discard
        break

when isMainModule:
    main()
