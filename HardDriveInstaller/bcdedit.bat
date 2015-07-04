


@echo off
REM ////admin mode code
title Fedora 硬盘安装器0.1
echo （玟茵开源社区）由ruojiner，weijie共同修改创作。
echo 正在对bootmgr进行处理...


REM/////本部分属于创建menu.lst部分，可能和linxextr.bat文件中对应内容不符，请开发者务必测试并修改！

echo # Fedora installer file>C:\menu.lst
echo default 0 >>C:\menu.lst
echo timeout 0 >>C:\menu.lst
echo  >>C:\menu.lst
echo title 开始安装Fedora系统>>C:\menu.lst
echo  kernel /vmlinuz0 ro quiet>>C:\menu.lst
echo  initrd /initrd0.img >>C:\menu.lst
echo  boot >>C:\menu.lst

 
REM ////Edit the BCD boot Loader
REM//////本段注意与linxextr.Bat文件中第二步，解压文件的位置对应起来。另外编辑BCD的指令可能有误，请务必重新生成一次代码。

bcdedit /export C:\fedbkup\BCD
for /f "delims=" %%a in ('bcdedit /create /d "开始安装Fedora Linux" /application bootsector') do set "uid=%%a" 
bcdedit /set %uid:~2,38% device partition=C:
bcdedit /set %id:~2,38% path \grldr.mbr
bcdedit /displayorder %id:~2,38% /addlast

