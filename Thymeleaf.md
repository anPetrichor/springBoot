Thymeleaf:

使用Thymeleaf属性需要注意点以下五点：

一、若要使用Thymeleaf语法，首先要声明名称空间： xmlns:th="http://www.thymeleaf.org"
二、设置文本内容 th:text，设置input的值 th:value，循环输出 th:each，条件判断 th:if，插入代码块 th:insert，定义代码块 th:fragment，声明变量 th:object
三、th:each 的用法需要格外注意，打个比方：如果你要循环一个div中的p标签，则th:each属性必须放在p标签上。若你将th:each属性放在div上，则循环的是将整个div。
四、变量表达式中提供了很多的内置方法，该内置方法是用#开头，请不要与#{}消息表达式弄混。
五、th:insert，th:replace，th:include 三种插入代码块的效果相似，但区别很大。



 **标准表达式语法**
\1. 简单表达式 
${...} 变量表达式 
*{...} 选择变量表达式 
\#{...} 消息表达式 
@{...} 链接url表达式
~{...} 代码块表达式 