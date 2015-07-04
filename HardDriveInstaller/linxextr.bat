
@echo off

:simpchn

echo ====================＞＞＞欢迎使用Fedora硬盘安装器＜＜＜====================
echo.
echo 本程序将引导您轻松地从硬盘或安装Fedora（目前只支持LiveCD版）
title Fedora硬盘安装器0.10Beta 

echo.
echo * 要马上开始安装，请敲击 [回车] 键；
echo * 关于本程序请 [键入about] 然后回车；
echo * 退出本程序请 [键入exit] 然后回车。
echo.
set /p cho=选择一个选项：
if "%cho%"=="" (
 set cho=
 goto schn_check
)

if "%cho%"=="about" (
 set cho=
 goto schn_about
)
if "%cho%"=="exit" (
 set cho=
 exit
)

:schn_check
REM //////////////////////////////////////////////////////探测引导器
if exist %SYSTEMDRIVE%\boot.ini (
 set loader="nt5"
 goto schn_inst
)
if exist %systemroot%\Boot\ (
 set loader="nt6"
 goto schn_inst
)

REM////////////本段正在修改中，请勿执行

:schn_inst
cls
echo ====================＞＞＞第1步  选择文件＜＜＜====================
echo.
echo 探测到您的引导器为：%loader%
echo.
echo 请将安装ISO文件(Fedora*.iso)放在某个FAT32分区根目录。
echo 并在这里输入ISO放置地点。(或用鼠标拖动到此处)
echo 注意：键入各种非法字符和路径将导致操作失败！
set /p file=—＞
if "%file%"=="^" goto schn_err1 &REM //////////容
if "%file%"=="." goto schn_err1 &REM //////////
if "%file%"=="*" goto schn_err1 &REM //////////错
if "%file%"=="/" goto schn_err1 &REM //////////
if "%file%"=="\" goto schn_err1 &REM //////////机
if "%file%"=="," goto schn_err1 &REM //////////
if "%file%"=="=" goto schn_err1 &REM //////////制
if "%file%"=="" goto schn_err1 &REM ///////////
if not exist %file% goto schn_err1 &REM ///////:)这是一个测试版程序，出问题望大家海涵。。
goto schn_extr


:schn_extr
cls
echo ====================＞＞＞第2步  解压文件＜====================
 &REM //////////////////////////////////////////////////////没有这个文件的时候跳转至相应错误提示
goto schn_goingon


:schn_goingon
cls
echo ====================＞＞＞第3步  准备安装程序＜＜＜====================
echo.
echo 您设定的文件为：%file%
echo 您设定的解压路径为：%location%
echo.
echo 确定吗？ [回车] 开始准备硬盘安装程序，否则请键入no然后回车。
set /p yesno=—＞
if "%yesno%"=="no" (
 set file=
 set location=
 set yesno=
 goto schn_inst

REM /////本段代码要实现一个目的:用同目录下的7z.exe自动解压出ISO内的vmlinuz0，initrd0.img文件。具体命令请开发者自己加入。

REM //////////////////////////////////////////////////////NT6已经跳到下面，双重引号是对打包的exe做优化，传递的参数带了引号
if "%loader%"==""nt6"" goto operating_nt6

REM //////////////////////////////////////////////////////以下为NT5内核系统的编辑
REM ////////////////////////////////////创建menu.lst
echo # 这是Fedora硬盘安装器创建的menu.lst文件>C:\menu.lst
echo default 0 >>C:\menu.lst
echo timeout 0 >>C:\menu.lst
echo. >>C:\menu.lst
echo title Install Fedora Linux>>C:\menu.lst
echo  kernel /vmlinuz0 ro quiet>>C:\menu.lst
echo  initrd /initrd0.img >>C:\menu.lst
echo  boot >>C:\menu.lst

REM ////////////////////////////////////放置vmlinuz0 initrd0.img和grldr
title Fedora硬盘安装器0.10Beta                    82％部署启动...
copy C:\isolinux\vmlinuz0 C:\ >nul
copy C:\isolinux\initrd0.img C:\ >nul
del C:\isolinux\vmlinuz0
del C:\isolinux\initrd0.img
copy grldr C:\ >nul
if not exist C:\isolinux\* rd /s /q C:\isolinux &REM ///////////这句有病，不能运作，原因暂时未知。

title Fedora硬盘安装器0.10Beta                       95％部署启动...
goto operating_nt5


:schn_finish
title Fedora硬盘安装器0.10Beta   
cls
echo ====================＞＞＞您的Fedora硬盘安装配置已成功＜＜＜====================
echo.
echo Fedora硬盘安装器0.10Beta   已经准备好了操作系统的安装部署，即将重新启动到安装程序。
echo 请保存您的工作，按下任意键重新启动您的电脑。
pause>nul
REM //////////////////////////////////////////////////////清除所有变量
set lang=
set file=
set location=
set yesno=
set loader=
REM shutdown -r -t 00
REM 上面这句关机命令的注释会在正式版本取消

exit


:schn_err1 &REM / Cant find file
cls
echo ====================＞＞＞一点小问题O(∩_∩)O＜＜＜====================
echo.
echo 您输入的这个文件并不存在！请仔细检查：
echo 确定您输入的文件名正确么？
echo.
echo 按任意键返回上一步！
pause>nul
set file=
goto schn_inst

:schn_err2 &REM 找不到解压路径会跳转到这里
cls
echo ====================＞＞＞一点小问题O(∩_∩)O＜＜＜====================
echo.
echo 无法找到您输入的盘符！请仔细检查……
echo 按任意键返回上一步！
pause>nul
set location=
goto schn_extr


pause>nul
exit


pause >nul
exit


exit


:ger_err1
cls
echo ====================＞＞＞一点小问题O(∩_∩)O＜＜＜====================
echo.
echo 您输入的这个文件并不存在！请仔细检查：
echo  您输入的文件名是否正确？
echo.
echo 按任意键返回上一步！
pause>nul
set file=
goto ger_inst

:ger_err2
cls
echo ====================＞＞＞一点小问题O(∩_∩)O＜＜＜====================
echo.
echo 无法找到您输入的盘符！请仔细检查……
echo 按任意键返回上一步！
pause>nul
set location=
goto ger_extr


REM //////////////////////////////////////////////////////对NT5内核引导修改段

:operating_nt5

attrib -s -h -r C:\boot.ini
mkdir C:\fedbkup
copy C:\boot.ini C:\fedbkup
echo C:\grldr="启动Fedora安装程序" >>C:\boot.ini
REM ////////下一段代码要实现的目的是让boot.ini中timeout值由 0改为10。详细代码见同目录下change_timeout.txt文件。代码可能是错误的，请开发者务必测试并修改！！

 ECHO [boot loader]>>c:\boot.ini.bak
 ECHO timeout=10>>c:\boot.ini.bak
 FOR /f "tokens=* delims=" %%i in ( findstr /i /v "timeout loader]" C:\boot.ini ) 
   do (ECHO %%i>>c:\boot.ini.bak)
 DEL /q /s /a /f c:\boot.ini&&
 REN c:\boot.ini.bak boot.ini&&attrib +h +s +r c:\boot.inipause 

echo 
echo 请按任意键继续！
pause >nul
goto schn_finish

REM //////////////////////////////////////////////////////对NT6内核引导修改段

:operating_nt6

mkdir C:\atostemp
copy grldr C:\atostemp >nul
copy grldr.mbr C:\atostemp >nul
start bcde.exe
goto schn_finish


:schn_about
cls
title 关于Fedora硬盘安装器0.10Beta   
echo.
echo                                  Fedora硬盘安装器
echo.
echo                          Fedora硬盘安装器0.10Beta
echo                          玟茵开源社区 出品


echo 我们的网站：http://www.wenyinos.org
echo.
echo 本程序遵守GNU通用公共协议第二版；您可以在本协议的基础上对本程序进行复制、传播、修改和再发布。
echo.
echo 参与编写人员：
echo ruojiner，weijie
echo.
echo 感谢来自安同开源社区-俊德工作室源码！本程序暂基于此开发
echo.原作者：黎民雍（以俊德）
echo 按下任意键返回主屏幕。
pause >nul
set cho=
goto simpchn

