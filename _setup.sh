git config --global user.name "Ben Doan"
git config --global user.email ben@bendoan.me

git config --global color.ui auto

git config --global alias.l "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.s "status"
git config --global alias.d "diff"
git config --global alias.p "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit -p"
git config --global alias.gg "rebase --abort"

git config --global core.excludesfiles ~/.gitignore_global
