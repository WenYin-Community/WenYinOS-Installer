


@echo off
REM ////admin mode code
title Fedora Ӳ�̰�װ��0.1
echo ������Դ��������ruojiner��weijie��ͬ�޸Ĵ�����
echo ���ڶ�bootmgr���д���...


REM/////���������ڴ���menu.lst���֣����ܺ�linxextr.bat�ļ��ж�Ӧ���ݲ������뿪������ز��Բ��޸ģ�

echo # Fedora installer file>C:\menu.lst
echo default 0 >>C:\menu.lst
echo timeout 0 >>C:\menu.lst
echo  >>C:\menu.lst
echo title ��ʼ��װFedoraϵͳ>>C:\menu.lst
echo  kernel /vmlinuz0 ro quiet>>C:\menu.lst
echo  initrd /initrd0.img >>C:\menu.lst
echo  boot >>C:\menu.lst

 
REM ////Edit the BCD boot Loader
REM//////����ע����linxextr.Bat�ļ��еڶ�������ѹ�ļ���λ�ö�Ӧ����������༭BCD��ָ����������������������һ�δ��롣

bcdedit /export C:\fedbkup\BCD
for /f "delims=" %%a in ('bcdedit /create /d "��ʼ��װFedora Linux" /application bootsector') do set "uid=%%a" 
bcdedit /set %uid:~2,38% device partition=C:
bcdedit /set %id:~2,38% path \grldr.mbr
bcdedit /displayorder %id:~2,38% /addlast

