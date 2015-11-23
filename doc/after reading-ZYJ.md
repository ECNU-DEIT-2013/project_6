体会：
直接看所翻译的文档有一些一头雾水，于是找来了Getting Started With Pub文档查看，了解到pub其实就是用于管理Dart中的Packages的。
Dart package是一个简单的用来存放pubspec文件的目录。而pubspec文件存放这些关于package的元数据。如果你的APP本身包含不止一个packages，那么你的app本身也就是一个package。package可以存在于任何地方，我们在pub.dartlang.org中找到的package其实都是其他开发者所建立并发表的package，我们自己也可以上传我们自己的package。
使用库中的包只需要三个步骤：
1.创建pubspec.yaml文件（已经创建的在dependecies下面加入package的名字和版本即可）
2.get dependecies
3.导入库
若只是使用别人的package，知道以上知识就已足够，如果需要自己创建包的话，就需要了解一下本次阅读的文档中的一些解释。

Entrypoint（入点）：
入点用来表示两件事：
在一般的dart环境中，这是一个可以直接被调用的dart library。当你在<script>标签中参考Dart library 或者 当命令行与单独的dart虚拟存储器冲突时跳过的library 就是入点。换句话来说，它通常是包含main（）函数的dart文件。
在pub环境中，一个entrypoint package或者root package是依赖图的根源。它通常会成为一个应用。当你运行你的app时，这是entrypoint package。它依赖的其他package不会成为环境中的入点。
一个packeage在有些环境中可以成为入点，在有些环境中则不能。假设你的app使用library package A，当你运行你的APP，A不是entrypoint package。然而，如果你转至A并执行它的测试，在那种环境下，既然你的app不包括在期中，它就可以是入点。

Entrypoint directory（入点目录）：
你的package中的目录被允许包含dart的入点。
Pub有这些目录的白名单：benchmark，bin，example，test, tool, and web.以上这些（除了bin）的子目录也都可以包含入点。


Immediate dependency（直接依赖）
直接调用自己本身的依赖。你在pubspec列表的依赖关系是你包的直接依赖关系。所有其他依赖关系传递依赖关系。

Library package（库包）
一个其他包都依赖的包。库包可能依赖其他包，也可能依赖于自身。它们可能包括直接运行的脚本。与库包对立的是应用程序包。
既然库包应该支持一些依赖版本，库包就不应该通过加密文件查询到源头控制。它们直接的依赖版本限制应该尽可能的宽广同时仍能确保依赖能与测试的版本一致。
既然语义的版本控制需要库包将需要他们的依赖版本比我们测试的相同或更多，并且比下一个主要版本更少。所以如果你的库依赖于（虚构的）变形的包，并且你再1.2.1版本测试过它，那你的版本限制就是^1.2.1.
