@echo off




:head
echo ====================＞＞＞欢迎使用Fedora安装U盘制作器＜＜＜====================
echo.
echo 本程序将引导您轻松地从U盘安装Fedora
echo 使用本程序后，您U盘内所有数据将全部丢失！！！
echo 请务必备份数据！作者对使用中出现的数据意外丢失不负责任！
echo 且制作好的U盘在Windows下无法读取。
title Fedora 安装U盘制作器 0.5 RC版 
echo.
echo * 要马上开始安装，请敲击 [回车] 键；
echo * 关于本程序版权信息请 [键入about] 然后回车
 echo * 退出本程序请 [键入exit] 然后回车。
echo.
set /p choose=选择一个选项：
if "%choose%"=="" (
 set choose=
 goto start
)

if "%choose%"=="about" (
 set choose=
 goto about
)
if "%choose%"=="exit" (
 set choose=
 exit
)


REM//////////版权信息

 
:about
cls
title 关于Fedora安装U盘制作器 0.5 RC版   
echo.
echo                                  Fedora安装U盘制作器
echo.
echo                               Fedora安装U盘制作器 0.5 RC版
echo                          玟茵开源社区 出品

echo 我们的网站：http://www.wenyinos.org
echo.
echo 本程序遵守GNU通用公共协议第二版；您可以在本协议的基础上对本程序进行复制、传播、修改和再发布。
echo.
echo 参与编写人员：
echo ruojiner，weijie
echo.
echo 按下任意键返回主屏幕！
pause >nul
set cho=
goto head


REM///////////////这里开始正式操作代码
:start
cls
echo ====================＞＞＞第1步  选择文件＜＜＜====================

title Fedora安装U盘制作器 0.5RC



echo 请输入您的安装ISO镜像所在位置？(亦可用鼠标拖动到此处)
echo 注意：键入各种非法字符和路径将导致操作失败！
echo 现在请插入您的U盘，最好是不存放任何数据。
set /p file=—＞
if "%file%"=="^" goto error1 
if "%file%"=="." goto error1  
if "%file%"=="*" goto error1  
if "%file%"=="/" goto error1  
if "%file%"=="\" goto error1  
if "%file%"=="," goto error1  
if "%file%"=="=" goto error1
if "%file%"=="" goto error1  
if not exist %file% goto error1 &REM ///////:)您的操作有问题！请重试……
goto drive

:drive
cls

 echo ====================＞＞＞第2步.    选择您的U盘盘符位置 ＜＜＜====================

title Fedora安装U盘制作器 0.5RC
 

:error1
cls
echo ====================＞＞＞一点小问题O(∩_∩)O＜＜＜====================  
title Fedora 安装U盘制作器 0.5 RC

echo.
echo 您输入的这个文件并不存在！请仔细检查：
echo 确定您输入的文件名正确么？
echo.
echo 按任意键返回上一步！
pause>nul
set file=
goto start



 :error2
cls
echo ====================＞＞＞一点小问题O(∩_∩)O＜＜＜====================  

title Fedora 安装U盘制作器 0.5 RC


echo.
echo 您输入的盘符错误！请仔细检查：
echo 
echo.
echo 按任意键返回上一步！
pause>nul
set drive=
goto drive

