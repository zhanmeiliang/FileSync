@echo oFF
title FileSync v2.0���ļ�ͬ��/���ݹ��ߣ� - By:Flyfish
:: FileSync v2.0���ļ�ͬ��/���ݹ��ߣ� - By:Flyfish
:: http://sec007.cc/7233.html
:: ���Ի�����Windows 7 �콢�� Ver6.1.7601 SP1 x64

CALL :Timevar
ECHO,
ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] ��ʼ��������...
ECHO,
IF DEFINED TARGET SET TARGET=
FOR /F "TOKENS=1 DELIMS=\ " %%I IN ('MOUNTVOL ^|FIND ":\"') DO (echo ���ִ���%%I)
FOR /F "TOKENS=1 DELIMS=\ " %%A IN ('MOUNTVOL ^|FIND ":\"') DO (
    FOR /F "TOKENS=3 DELIMS= " %%B IN ('FSUTIL FSINFO VOLUMEINFO %%A^|find "�����к�"') DO (
        if "%%B"=="0x7a20a4ff" (SET TARGET=%%A&echo,&ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] ���Ŀ����̡�%%A�����к���Ԥ��һ�£�������ʼ�ļ�ͬ��/����...&&GOTO FileSync)
    )
)


:FileSync
::�ļ�����
IF NOT DEFINED TARGET ECHO,&ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] δ������Ԥ��ֵ��ƥ��Ŀ�����!&ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] �����˳�.&ping 127.1>nul&exit /b 0
::if "%Defaultid%"=="0x58988ba5" (echo,&ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] ���Ŀ��������к���Ԥ��һ�£�������ʼ�ļ�ͬ��/����...) ELSE (echo,&ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] δ��ȷƥ��Ŀ����̾��...&ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] �����˳�.&ping 127.1>nul&exit /b 0)
ECHO,
ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] Starting...
ECHO,
ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] ��D:\NEW\��===^>^>��%TARGET%\NEW\��
ROBOCOPY D:\NEW\ %TARGET%\NEW\ /mir /MT:128 /BYTES /TS /FP /NP /NJH /NJS /TEE /LOG+:D:\NEW\Synlog.log
ECHO,
SET TARGET=
ECHO [%Timehh%:%time:~3,2%:%time:~6,2%] Finshed!&PING 127.1>NUL

:Timevar
SET Timehh=%time:~0,2%
IF /I %Timehh% LSS 10 (
SET Timehh=0%time:~1,1%
)
GOTO :EOF