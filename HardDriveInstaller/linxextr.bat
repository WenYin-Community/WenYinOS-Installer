
@echo off

:simpchn

echo ====================��������ӭʹ��FedoraӲ�̰�װ��������====================
echo.
echo ���������������ɵش�Ӳ�̻�װFedora��Ŀǰֻ֧��LiveCD�棩
title FedoraӲ�̰�װ��0.10Beta 

echo.
echo * Ҫ���Ͽ�ʼ��װ�����û� [�س�] ����
echo * ���ڱ������� [����about] Ȼ��س���
echo * �˳��������� [����exit] Ȼ��س���
echo.
set /p cho=ѡ��һ��ѡ�
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
REM //////////////////////////////////////////////////////̽��������
if exist %SYSTEMDRIVE%\boot.ini (
 set loader="nt5"
 goto schn_inst
)
if exist %systemroot%\Boot\ (
 set loader="nt6"
 goto schn_inst
)

REM////////////���������޸��У�����ִ��

:schn_inst
cls
echo ====================��������1��  ѡ���ļ�������====================
echo.
echo ̽�⵽����������Ϊ��%loader%
echo.
echo �뽫��װISO�ļ�(Fedora*.iso)����ĳ��FAT32������Ŀ¼��
echo ������������ISO���õص㡣(��������϶����˴�)
echo ע�⣺������ַǷ��ַ���·�������²���ʧ�ܣ�
set /p file=����
if "%file%"=="^" goto schn_err1 &REM //////////��
if "%file%"=="." goto schn_err1 &REM //////////
if "%file%"=="*" goto schn_err1 &REM //////////��
if "%file%"=="/" goto schn_err1 &REM //////////
if "%file%"=="\" goto schn_err1 &REM //////////��
if "%file%"=="," goto schn_err1 &REM //////////
if "%file%"=="=" goto schn_err1 &REM //////////��
if "%file%"=="" goto schn_err1 &REM ///////////
if not exist %file% goto schn_err1 &REM ///////:)����һ�����԰���򣬳���������Һ�������
goto schn_extr


:schn_extr
cls
echo ====================��������2��  ��ѹ�ļ���====================
 &REM //////////////////////////////////////////////////////û������ļ���ʱ����ת����Ӧ������ʾ
goto schn_goingon


:schn_goingon
cls
echo ====================��������3��  ׼����װ���򣼣���====================
echo.
echo ���趨���ļ�Ϊ��%file%
echo ���趨�Ľ�ѹ·��Ϊ��%location%
echo.
echo ȷ���� [�س�] ��ʼ׼��Ӳ�̰�װ���򣬷��������noȻ��س���
set /p yesno=����
if "%yesno%"=="no" (
 set file=
 set location=
 set yesno=
 goto schn_inst

REM /////���δ���Ҫʵ��һ��Ŀ��:��ͬĿ¼�µ�7z.exe�Զ���ѹ��ISO�ڵ�vmlinuz0��initrd0.img�ļ������������뿪�����Լ����롣

REM //////////////////////////////////////////////////////NT6�Ѿ��������棬˫�������ǶԴ����exe���Ż������ݵĲ�����������
if "%loader%"==""nt6"" goto operating_nt6

REM //////////////////////////////////////////////////////����ΪNT5�ں�ϵͳ�ı༭
REM ////////////////////////////////////����menu.lst
echo # ����FedoraӲ�̰�װ��������menu.lst�ļ�>C:\menu.lst
echo default 0 >>C:\menu.lst
echo timeout 0 >>C:\menu.lst
echo. >>C:\menu.lst
echo title Install Fedora Linux>>C:\menu.lst
echo  kernel /vmlinuz0 ro quiet>>C:\menu.lst
echo  initrd /initrd0.img >>C:\menu.lst
echo  boot >>C:\menu.lst

REM ////////////////////////////////////����vmlinuz0 initrd0.img��grldr
title FedoraӲ�̰�װ��0.10Beta                    82����������...
copy C:\isolinux\vmlinuz0 C:\ >nul
copy C:\isolinux\initrd0.img C:\ >nul
del C:\isolinux\vmlinuz0
del C:\isolinux\initrd0.img
copy grldr C:\ >nul
if not exist C:\isolinux\* rd /s /q C:\isolinux &REM ///////////����в�������������ԭ����ʱδ֪��

title FedoraӲ�̰�װ��0.10Beta                       95����������...
goto operating_nt5


:schn_finish
title FedoraӲ�̰�װ��0.10Beta   
cls
echo ====================����������FedoraӲ�̰�װ�����ѳɹ�������====================
echo.
echo FedoraӲ�̰�װ��0.10Beta   �Ѿ�׼�����˲���ϵͳ�İ�װ���𣬼���������������װ����
echo �뱣�����Ĺ�������������������������ĵ��ԡ�
pause>nul
REM //////////////////////////////////////////////////////������б���
set lang=
set file=
set location=
set yesno=
set loader=
REM shutdown -r -t 00
REM �������ػ������ע�ͻ�����ʽ�汾ȡ��

exit


:schn_err1 &REM / Cant find file
cls
echo ====================������һ��С����O(��_��)O������====================
echo.
echo �����������ļ��������ڣ�����ϸ��飺
echo ȷ����������ļ�����ȷô��
echo.
echo �������������һ����
pause>nul
set file=
goto schn_inst

:schn_err2 &REM �Ҳ�����ѹ·������ת������
cls
echo ====================������һ��С����O(��_��)O������====================
echo.
echo �޷��ҵ���������̷�������ϸ��顭��
echo �������������һ����
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
echo ====================������һ��С����O(��_��)O������====================
echo.
echo �����������ļ��������ڣ�����ϸ��飺
echo  ��������ļ����Ƿ���ȷ��
echo.
echo �������������һ����
pause>nul
set file=
goto ger_inst

:ger_err2
cls
echo ====================������һ��С����O(��_��)O������====================
echo.
echo �޷��ҵ���������̷�������ϸ��顭��
echo �������������һ����
pause>nul
set location=
goto ger_extr


REM //////////////////////////////////////////////////////��NT5�ں������޸Ķ�

:operating_nt5

attrib -s -h -r C:\boot.ini
mkdir C:\fedbkup
copy C:\boot.ini C:\fedbkup
echo C:\grldr="����Fedora��װ����" >>C:\boot.ini
REM ////////��һ�δ���Ҫʵ�ֵ�Ŀ������boot.ini��timeoutֵ�� 0��Ϊ10����ϸ�����ͬĿ¼��change_timeout.txt�ļ�����������Ǵ���ģ��뿪������ز��Բ��޸ģ���

 ECHO [boot loader]>>c:\boot.ini.bak
 ECHO timeout=10>>c:\boot.ini.bak
 FOR /f "tokens=* delims=" %%i in ( findstr /i /v "timeout loader]" C:\boot.ini ) 
   do (ECHO %%i>>c:\boot.ini.bak)
 DEL /q /s /a /f c:\boot.ini&&
 REN c:\boot.ini.bak boot.ini&&attrib +h +s +r c:\boot.inipause 

echo 
echo �밴�����������
pause >nul
goto schn_finish

REM //////////////////////////////////////////////////////��NT6�ں������޸Ķ�

:operating_nt6

mkdir C:\atostemp
copy grldr C:\atostemp >nul
copy grldr.mbr C:\atostemp >nul
start bcde.exe
goto schn_finish


:schn_about
cls
title ����FedoraӲ�̰�װ��0.10Beta   
echo.
echo                                  FedoraӲ�̰�װ��
echo.
echo                          FedoraӲ�̰�װ��0.10Beta
echo                          ����Դ���� ��Ʒ


echo ���ǵ���վ��http://www.wenyinos.org
echo.
echo ����������GNUͨ�ù���Э��ڶ��棻�������ڱ�Э��Ļ����϶Ա�������и��ơ��������޸ĺ��ٷ�����
echo.
echo �����д��Ա��
echo ruojiner��weijie
echo.
echo ��л���԰�ͬ��Դ����-���¹�����Դ�룡�������ݻ��ڴ˿���
echo.ԭ���ߣ�����Ӻ���Կ��£�
echo �����������������Ļ��
pause >nul
set cho=
goto simpchn

