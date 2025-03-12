@echo off
SETLOCAL ENABLEEXTENSIONS

:: 设置你的 Gitee 仓库的 SSH 地址
set REPO_URL=git@gitee.com:cdd_123/soft-exam-knowledge-points.git

:: 设置本地文件夹路径
set LOCAL_FOLDER=D:\自己技术总结\软考\软件设计师\软考知识点

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
git commit -m "上传更新的软考知识点"

:: 将更改推送到 Gitee
echo "推送更改到 Gitee..."
git push -u origin master

echo "上传完成!"
pause
