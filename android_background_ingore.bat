::���� android_background_ignore
::���� ����Jack
::�汾 V0.2
::��Ŀ��ַ https://github.com/Jiangyiqun/android_background_ignore
echo off
cls
if not exist white_list.txt (
	echo.
	echo û���ҵ� white_list.txt �ļ�,������µ�ַ����
	echo https://github.com/Jiangyiqun/android_background_ignore
	echo ���������� android_background_ignore.bat ��ͬ·����
	echo.
	pause
)

echo. 
echo ����˵����
echo 1�������Ƶ�����APP���Զ�����
echo 2������Ҫ ROOT
echo 3�������� Android 7.0 +
echo.
echo ׼�����裺
echo 1�����԰�װ ADB
echo 2�����԰�װ Universal Android USB driver
echo 3���ֻ����� USB ����
echo.
echo ��� https://zhuanlan.zhihu.com/p/23372646
echo.
pause
adb devices
echo ��ĻӦ����ʾ���� "CVH7N0000000000        device" ���ִ�
echo ȷ����ȷ����������������¼��׼������
echo.
pause

echo.
echo ���ܲ˵���
echo 1�������Զ�����
echo 2���ָ�Ĭ��ģʽ
set /p choice=��ѡ��
if "%choice%"=="1" goto plan_1
if "%choice%"=="2" goto plan_2

:plan_1
echo.
echo ���������Զ����ѣ�
adb shell pm list packages -3 > apps_list.txt
for /f "tokens=2 delims=:" %%i in (apps_list.txt) do (
	echo �������� %%i ���Զ�����
	adb shell cmd appops set %%i RUN_IN_BACKGROUND ignore
)
del apps_list.txt

echo.
echo ���ڴ��������(����Ըò����еı�����

if exist white_list.txt (
	echo.
	for /f "eol=#" %%i in (white_list.txt) do (
	echo ���ڻָ� %%i ΪĬ��״̬
	adb shell cmd appops set %%i RUN_IN_BACKGROUND allow
	)
)
	
if not exist white_list.txt (
	echo.
	echo û���ҵ�white_list.txt�ļ�,�������������
	goto plan_end
)
goto plan_end

:plan_2
echo.
echo ���ڻָ�Ĭ��ģʽ��
adb shell pm list packages -3 > apps_list.txt
for /f "tokens=2 delims=:" %%i in (apps_list.txt) do (
	echo ���ڻָ� %%i ΪĬ��״̬
	adb shell cmd appops set %%i RUN_IN_BACKGROUND allow
)
del apps_list.txt
goto plan_end

:plan_end
echo.
echo �Ѿ���ɣ���ر�USB����
echo.
pause
