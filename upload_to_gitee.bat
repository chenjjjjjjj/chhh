@echo off
SETLOCAL ENABLEEXTENSIONS

:: ������� Gitee �ֿ�� SSH ��ַ
set REPO_URL=git@gitee.com:cdd_123/soft-exam-knowledge-points.git

:: ���ñ����ļ���·��
set LOCAL_FOLDER=D:\�Լ������ܽ�\��\������ʦ\��֪ʶ��

:: ��ȡ��ǰʱ�������ʽ��YYYY-MM-DD HH:MM:SS��
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (
    set DATE_STR=%%a-%%b-%%c
)
for /f "tokens=1-3 delims=:." %%a in ('time /t') do (
    set TIME_STR=%%a:%%b:%%c
)
set TIMESTAMP=%DATE_STR% %TIME_STR%

:: �����ļ���
cd /d "%LOCAL_FOLDER%"

:: ����ǵ�һ���ϴ�����ʼ�� git �ֿ�
if not exist ".git" (
    echo "��ʼ�� Git �ֿ�..."
    git init
    git remote add origin %REPO_URL%
)

:: ����ļ����ݴ���
echo "����ļ��� Git �ֿ�..."
git add .

:: �ύ����
echo "�ύ����..."
git commit -m "�Զ��ϴ�����ʱ�䣺%TIMESTAMP%"

:: ���������͵� Gitee
echo "���͸��ĵ� Gitee..."
git push -u origin master

echo "�ϴ����!"
pause
