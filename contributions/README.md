# 请每位参与者在此目录下创建一个个人简介的文档

> 本文档记录了线上交流的课后练习内容，请各位同学课后参阅

## 课后作业
### 3月9号线上交流课后作业
#### 学习资源
https://github.com/firstcontributions/first-contributions

#### 实践任务
- 注册一个github账号
- 安装git工具
- fork本仓库到自己的github账号
- 添加一个.md文档到contributions目录
- 按照firstcontributions的教程提交一个PR到本项目中，会有志愿者帮助审核PR并merge

## 步骤说明

**首先请保证已注册github账号，并安装git工具**

### 如何提交一个PR
#### 1. fork本仓库到自己的仓库
#### 2. 命令行中 git clone 到本地
点击自己仓库中的clone or download按钮（绿色的那个）然后复制链接就可,之后再命令行中输入下面的命令

    git clone [自己的仓库地址]
#### 3. 进入到文件夹
```
cd ncov-report
```
#### 4. 在contributions文件夹中新建一个.md文件作为个人简介
文件名：英文网名.md
文件内容：个人简介（请不要包含个人隐私信息）
#### 5. 提交修改过后的代码到自己的仓库
```
git add .     
git commit -m "添加了xxx个人简介"
git push origin master
```
这些命令具体做了什么大家可以自行百度~
#### 6. 提交PR
- 在github中自己的仓库中点击New pull request按钮
- 在新页面中填写相应的信息，点击create pull request提交PR
#### 7. 之后会有志愿者审核PR，会有邮件通知
