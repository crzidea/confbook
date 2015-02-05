@echo off
cd %~dp0
copy .vimrc %userprofile%\.vimrc 
git clone https://github.com/gmarik/Vundle.vim.git %userprofile%\.vim\bundle\Vundle.vim
gvim +VundleInstall! +qa
