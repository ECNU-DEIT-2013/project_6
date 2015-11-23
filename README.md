<<<<<<< HEAD
# dart文章感悟
标签（空格分隔）： 未分类
##转换器
转换器就是一个转换输入的dart的对象，即是将写入的dart文件或者是格式化的html文件转化成为对应得。通过pub build命令将生成的文件放入到files中。pub serve命令，在另一方面，并不新生成文件，它所生成的asset直接由dev服务器来服务。

##传递依赖性
这是一种依赖关系，你的包由于它的一个依赖关系而需要使用它的时候产生的。如果你的包需要A的支持，而这又依赖于B，B又依赖于C，那么A是直接相关的，B、C是传递的。

##上传者
包的上传者就是用权限管理这个包的人。他们不仅可以上传一个包的新版本，同时在这个包内可以增加和删除其他上传者。一包的上传者通常，但不一定，是这个包的创建者。
任何人上传了一个新的包就自动成为了这个包的上传者否则，要成为上传者，就有联系现在的上传者，让他们添加你为另一个上传者。

##版本约束
每一个包的依赖性约束需要讲明，当前包所依赖的包的版本
这可以是一个单一的版本（如0.3.0）或一个范围的版本如（^1.2.1）。尽管都是可以的，但是出于性能的考虑，我们并不会这样子做。

###TIPS
举个例子就是，我需要用到一个包A，版本是1.0，但是A包里对B包有依赖关系，版本是0.9，那么我A包的版本约束里应该有B包的版本约束。之后，如果我还需要一个包C，它对B包也有依赖，但是要求必须是1.0以上的版本，这个时候就会发生约束冲突。（感觉包就像是第三方的库文件

=======
### exercise
这个项目是每位同学独立完成的平日dart编程练习，每个人对应一个分支，分支描述为 yourgithubname_x。其中x是练习的序号，每次累加。

### 注意，课堂中的讲解和操作是当堂练习使用。这次的exercise我已经做了dart项目初始化，因此：本次大家只需要做如下事情：
1. clone exercise项目到本地
2. 创建你的分支（branch）
3. 使用webstorm打开clone下来的项目
  - 打开pubspec.yaml文件
  - enable dart suport
    ![enable dart support](http://img0.ph.126.net/aXqb_uceuAO0vzrTC5tStg==/6630695031259275024.png "enable dart support")
  - 点击get denpendence 按钮
    ![get denpendece](http://img0.ph.126.net/x83fNB_bZAno7GaZYu05Qw==/6630710424421903305.png 'get dependencies')
 - 运行一下，看是否正常运行。
 ![run index](http://img0.ph.126.net/W0cKBGjKheipC3r8tj2_AQ==/6631365733350874332.png 'run ')
4. 如平常一样编程，编程修改各自的dart文件和html文件
5. **由于各自使用了自己喜爱的昵称，我不知道大家是谁。想来想去使用这个方法吧：请用你的学号作为  branch（注意从master创建branch，不要从别的同学的branch创建）。且以后每次作业不必再创建新的branch了，而是作为一个新的commit提交。commit名称用exercise_x,其中x表示 1，2，...以此类推.但是不是作为最终提交的commit命名不要用exercise-x**
![id-name](http://img2.ph.126.net/ymg68brO1fuF3IuWF_rqFw==/6630327794374964546.png)
提交新作业，如图：
![commit_exercise_x](http://img0.ph.126.net/-tkDUtT4kyXHegVQoGq_bQ==/6630529005002847564.png)
提交后，别忘了右上角的publish（或者sync），如图：
![publish_exercise_x](http://img0.ph.126.net/kFpNW891Gsq3iZUVzievGg==/6631307459234648688.png)
>>>>>>> dfc51b9d1b83e4fb1aa01750bf0f0a2fb57a9d07

5. 提交修改的文件
 
