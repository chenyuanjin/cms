#项目说明
* 本项目使用 Spring+Spring MVC+Hibernate+Spring Security实现了一个基本的权限管理框架
* 权限管理的基本思路是权限对应着某种资源,一种角色又有一种或多种权限,用户可以有一种或多种角色,则该用户就可以有权限操作对应的资源
* 本项目由IntelliJ 构建,集成maven

#框架版本
##后端
* Spring 4.1.6.RELEASE
* Hibernate 4.3.10.Final
* Spring Security 3.2.8.RELEASE

##前端
* jquery 1.8.0
* EasyUI 1.3.2

#数据库
* 数据库使用的MySQL5.6,src/main/resources/sql/cms.sql直接导入使用即可
* 数据库超级用户 admini 12345678