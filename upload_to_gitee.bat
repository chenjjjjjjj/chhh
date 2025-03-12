@echo off
SETLOCAL ENABLEEXTENSIONS

:: 设置你的 Gitee 仓库的 SSH 地址
set REPO_URL=git@gitee.com:cdd_123/soft-exam-knowledge-points.git

:: 设置本地文件夹路径
set LOCAL_FOLDER=D:\自己技术总结\软考\软件设计师\软考知识点

:: 获取当前时间戳（格式：YYYY-MM-DD HH:MM:SS）
for /f "tokens=1-3 delims=/ " %%a in ('date /t') do (
    set DATE_STR=%%a-%%b-%%c
)
for /f "tokens=1-3 delims=:." %%a in ('time /t') do (
    set TIME_STR=%%a:%%b:%%c
)
set TIMESTAMP=%DATE_STR% %TIME_STR%

:: 进入文件夹
cd /d "%LOCAL_FOLDER%"

:: 如果是第一次上传，初始化 git 仓库
if not exist ".git" (
    echo "初始化 Git 仓库..."
    git init
    git remote add origin %REPO_URL%
)

:: 添加文件到暂存区
echo "添加文件到 Git 仓库..."
git add .

:: 提交更改
echo "提交更改..."
git commit -m "自动上传更新时间：%TIMESTAMP%"

:: 将更改推送到 Gitee
echo "推送更改到 Gitee..."
git push -u origin master

echo "上传完成!"
pause
