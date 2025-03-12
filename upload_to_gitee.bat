@echo off
SETLOCAL ENABLEEXTENSIONS

:: ������� Gitee �ֿ�� SSH ��ַ
set REPO_URL=git@gitee.com:cdd_123/soft-exam-knowledge-points.git

:: ���ñ����ļ���·��
set LOCAL_FOLDER=D:\�Լ������ܽ�\��\������ʦ\��֪ʶ��

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
git commit -m "�ϴ����µ���֪ʶ��"

:: ���������͵� Gitee
echo "���͸��ĵ� Gitee..."
git push -u origin master

echo "�ϴ����!"
pause
