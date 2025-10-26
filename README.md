# docker-baidunetdisk

docker-baidunetdisk 可以使你在 Docker 容器中运行 百度网盘。

即使该 dockerfile 仓库使用 GPL 发布，其中下载的软件仍然遵循其最终用户使用许可协议，请确认同意协议后再进行下载使用。

随着版本更新，docker 的 百度网盘 并不保证总是可用。若你遇到不可用问题，在严格按照下述步骤执行后仍可复现，请通过 Issue 反馈。

该项目修改自docker-wine-coolq， 非常感谢相关贡献者做出的开创性工作。

示例均为amd64(x86_64)，如需arm64请自行替换镜像tag。

**示例下载目录(容器内)为/baidunetdisk_data**

## 快速开始(临时使用)

如果你在服务器上使用 `docker` 或者和 docker 兼容的服务，只需执行：

```bash
docker run -it --rm -p 9000:9000 -v `pwd`/baidunetdisk_data:/baidunetdisk_data -v `pwd`/baidunetdisk_config:/home/user/.config/baidunetdisk -e VNC_GEOMETRY="1280x720" dockerguiimages/docker-baidunetdisk:latest-amd64
```

即可运行一个 docker-baidunetdisk 实例。运行后，访问 `http://你的IP:9000` 可以打开 noVNC 页面，输入 `MAX8char` 作为密码后即可看到 百度网盘 已经启动。

## 常用示例(正式使用)

### 使用 HTTP Basic Authentication 进行鉴权 (推荐)

```bash
docker run --name=baidunetdisk -d -p 9000:9000 -v `pwd`/baidunetdisk_data:/baidunetdisk_data -v `pwd`/baidunetdisk_config:/home/user/.config/baidunetdisk -e VNC_GEOMETRY="1280x720" -e VNC_PASSWD="" -e HTTP_AUTH_USER="auth_username" -e HTTP_AUTH_PASSWD="auth_password" dockerguiimages/docker-baidunetdisk:latest-amd64
```

### 使用 VNC 进行鉴权 (不推荐)

```bash
docker run --name=baidunetdisk -d -p 9000:9000 -v `pwd`/baidunetdisk_data:/baidunetdisk_data -v `pwd`/baidunetdisk_config:/home/user/.config/baidunetdisk -e VNC_GEOMETRY="1280x720" -e VNC_PASSWD="12345678" dockerguiimages/docker-baidunetdisk:latest-amd64
```

## 环境变量

在创建 docker 容器时，使用以下环境变量，可以调整容器行为。

* **`HTTP_AUTH_USER`** HTTP Basic Authentication 用户名
* **`HTTP_AUTH_PASSWD`** HTTP Basic Authentication 密码
* **`VNC_PASSWD`** 设置 VNC 密码。注意该密码不能超过 8 个字符，超过8个字符后的所有内容均无效。

