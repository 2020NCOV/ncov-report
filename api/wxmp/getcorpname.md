**简要描述：**

- 获取单位名称


> ** 此接口需要传递 token 和 uid信息**

**请求URL：**
- ` ~/index/login/getcorpname`

**请求方式：**
- POST

**参数：**

| 参数名 | 必选 | 类型 | 说明 |
| :---- | :---- | :----- | :--- |
| uid | 是 | int | 用户在微信小程序信息库中的编码id|
| token | 是 | string | token|
| corpid | 是 | string | 企业的标识码，里面含有企业编号和密码|
| template_code  | 否 | string | 测试时，可以传递不同的模板名称，即可返回相应的模板名。如果该值为空，则form_template返回default|




**返回示例**

```
{
	"errcode": 0,
	"corpid": "202010013742",
	"corpname": '学校名称',
	"template_code": 'default',
	"type_corpname": '公司名称',
	"type_username": '职工号',
}
```

**返回参数说明：**

| 参数名 | 类型 | 说明 |
| :---- | :----- | ----- |
| corpid | string | 企业的标识码，里面含有企业编号和密码 |
| corpname  | string | 单位名称|


**备注**

- 更多返回代码请看全局返回参数说明
