#产生SSH key
#根据Github提供的help文档，具体过程如下

cd ~/.ssh
# Checks to see if there is a directory named ".ssh" in your user directory

# 使用ssh-keygen产生新的key
ssh-keygen -t rsa -C "your_email@example.com"
# Creates a new ssh key using the provided email
#
# Generating public/private rsa key pair.

# Enter file in which to save the key (/home/you/.ssh/id_rsa):
# 使用默认的文件名直接enter, 按提示输入密码（如果不提供密码，SSH将无密码连接，如果private key泄露可能会有安全问题）
# Enter passphrase (empty for no passphrase): [Type a passphrase]
# Enter same passphrase again: [Type passphrase again]
# 密匙产生成功

# Your identification has been saved in /home/you/.ssh/id_rsa.
# Your public key has been saved in /home/you/.ssh/id_rsa.pub.
# The key fingerprint is:
# 01:0f:f4:3b:ca:85:d6:17:a1:7d:f0:68:9d:f0:a2:db your_email@example.com

# ================================================================================
# 上传public key到Github账户
# 1 登录github
# 2 点击右上方的Accounting settings图标
# 3 选择 SSH key
# 4 点击 Add SSH key
# ================================================================================
# 在出现的界面中填写SSH key的名称，填一个你自己喜欢的名称即可，然后将上面拷贝的~/.ssh/id_rsa.pub文件内容粘帖到key一栏，在点击“add key”按钮就可以了。
# 添加过程github会提示你输入一次你的github密码

# ================================================================================
# 设置SSH使用HTTPS的403端口
# 在局域网中SSH的22端口可能会被防火墙屏蔽，可以设置SSH使用HTTPS的443端口。
# 测试HTTPS端口是否可用
ssh -T -p 443 git@ssh.github.com
# Hi username! You've successfully authenticated, but GitHub does not provide shell access.
# 编辑SSH配置文件 ~/.ssh/config 如下:
# Host github.com
#  Hostname ssh.github.com
#  Port 443
# 测试是否配置成功

ssh -T git@github.com
# Hi username! You've successfully authenticated, but GitHub does not provide shell access.
