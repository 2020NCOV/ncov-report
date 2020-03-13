**简要描述：**

- 用户注册

> ** 此接口需要传递 token 信息**

**请求URL：**
- ` ~/index/login/register `

**请求方式：**
- POST

**参数：**

| 参数名 | 必选 | 类型 | 说明 |
| :---- | :--- | :----- | :--- |
| uid | 是 | int | 用户在微信小程序信息库中的编码id|
| token | 是 | string | token|
| corpid | 是 | string | 企业的标识码，里面含有企业编号和密码|
| userid | 是 | string | 长度不超过20，职工号或学号或其他用户在企业中的唯一标识编号,也可以用手机号或身份证号|
| name | 是 | string | 用户姓名|
| phone_num | 是 | string | 电话号码|

备注：注册接口参数中的corpid和userid，不需要用户再次输入了，check_user接口已经返回了

**返回示例**

```
{
	"errcode ": 0,
	"is_registered ": 1,
}
```

**返回参数说明：**

| 参数名 | 类型 | 说明 |
| :---- | :----- | ----- |
| is_registered | int | 1代表通过注册方式，注册成功 |


**备注**

- 更多返回代码请看全局返回参数说明
