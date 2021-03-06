7za x PortableGit-%PKG_VERSION%-%ARCH%-bit.7z.exe -o"%LIBRARY_PREFIX%\" -aoa
if errorlevel 1 exit 1

cd %LIBRARY_PREFIX%
call post-install.bat
del git_bash.exe
del git_cmd.exe
del README.portable
del post-install.bat

IF NOT EXIST %PREFIX%\Menu mkdir %PREFIX%\Menu
copy %RECIPE_DIR%\menu-windows.json %PREFIX%\Menu\
copy %RECIPE_DIR%\git-for-windows.ico %PREFIX%\Menu\

echo export PATH=$(cygpath -a %PREFIX:\=/%)/Library/bin:$PATH >> %LIBRARY_PREFIX%\etc\profile.d\env.sh
echo. >> %LIBRARY_PREFIX%\etc\profile.d\env.sh

exit 0
