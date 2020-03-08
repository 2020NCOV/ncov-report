**简要描述：**




> ** 此接口需要传递 token 和 uid信息**

**请求URL：**
- ` ~/index/info/getmyinfo`

**请求方式：**
- POST

**参数：**

| 参数名 | 必选 | 类型 | 说明 |
| :---- | :--- | :----- | :--- |
| uid | 是 | int | 用户在微信小程序信息库中的编码id|
| token | 是 | string | token|
| corpid | 是 | string | 企业编号|


**返回示例**

```
{
	"errcode":0,
	"userid":"12",
	"name":"张三",
	"corpname":"学校名称",
	"phone_num":"13444444444"
}
```

**返回参数说明：**

| 参数名 | 类型 | 说明 |
| :---- | :----- | ----- |
| userid | string | 职工号或学号或其他用户在企业中的唯一标识编号  |
| name | string | 姓名 |
| corpname  | string | 所在单位名称|
| phone_num  | string | 电话号码|


**备注**

- 更多返回代码请看全局返回参数说明
