# IDS
基于机器学习检测IPV4&amp;IPV6网络环境中异常攻击行为

本项目是采用java和Python语言作为主流开发语言进行。

本项目首先根据snort实现IDS的误用检测和异常检测的功能，实现snort规则的编写并更新到规则库中。里面涉及SQL注入、XSS、蠕虫、灰鸽子和DOS DDOS等检测。

由于检测繁琐等因素，重新使用bro对网络流量进行流量重构，生成log日志文件，并重新用来实现网络流量检测等。

然后根据协议的解析、内容分析得到对应，然后使用聚类、机器学习、时序预测、神经网络等方式来实现检测、分析预测等智能化功能。

最后构建web可视化平台提供实时预警。
