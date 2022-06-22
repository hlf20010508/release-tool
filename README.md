# release-tool

可执行文件一键release工具

针对release需要上传多个平台的可执行文件的情况

在多个平台执行release-tool可以直接上传对应平台的可执行文件

<br/>

本脚本需要<a href="https://github.com/cli/cli.git">gh</a>

<br/>

需要在目标项目中定义一个名为compile.sh的文件，用于生成可执行文件，本项目已包含，可供参考

<br/>

用法
```
bash release-tool.sh tag_name project_directory_path
```

可直接运行在线脚本
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/hlf20010508/vue-init/master/vue-init.sh)" tag_name project_directory_path
```

tag_name 是tag的名字

project_directory_path 是要release的项目文件夹的路径
