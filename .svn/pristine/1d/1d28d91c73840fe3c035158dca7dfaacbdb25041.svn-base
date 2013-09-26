/**
 * 
 */
function checkCreditId(id) {
	var idnum = id;
	// alert(idnum);
	var errors = new Array("验证通过", "身份证号码位数不对", "身份证含有非法字符", "身份证号码校验错误",
			"身份证地区非法");
	// 身份号码位数及格式检验
	var re;
	var len = idnum.length;
	// 身份证位数检验
	if (len != 15 && len != 18) {
		return errors[1];
	} else if (len == 15) {
		re = new regexp(/^(d{6})()?(d{2})(d{2})(d{2})(d{3})$/);
	} else {
		re = new regexp(/^(d{6})()?(d{4})(d{2})(d{2})(d{3})([0-9xx])$/);
	}

	var area={11:"北京",12:"天津",13:"河北",14:"山西",
		       15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",
		       32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",
		       37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",
		       45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",
		       53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",
		       64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",
		       91:"国外"};

	var idcard_array = new array();
	idcard_array = idnum.split("");

	// 地区检验
	if (area[parseint(idnum.substr(0, 2))] == null) {
		return errors[4];
	}

	// 出生日期正确性检验
	var a = idnum.match(re);

	if (a != null) {
		var flag=false;
		if (len == 15) {
			var dd = new date("19" + a[3] + "/" + a[4] + "/" + a[5]);
			flag = dd.getyear() == a[3] && (dd.getmonth() + 1) == a[4]
					&& dd.getdate() == a[5];
		} else if (len == 18) {
			var dd = new date(a[3] + "/" + a[4] + "/" + a[5]);
			flag = dd.getfullyear() == a[3] && (dd.getmonth() + 1) == a[4]
					&& dd.getdate() == a[5];
		}

		if (!flag) {
			return "身份证出生日期不对！";
		}

		// 检验校验位
		if (len == 18) {
			s = (parseint(idcard_array[0]) + parseint(idcard_array[10])) * 7
					+ (parseint(idcard_array[1]) + parseint(idcard_array[11]))
					* 9
					+ (parseint(idcard_array[2]) + parseint(idcard_array[12]))
					* 10
					+ (parseint(idcard_array[3]) + parseint(idcard_array[13]))
					* 5
					+ (parseint(idcard_array[4]) + parseint(idcard_array[14]))
					* 8
					+ (parseint(idcard_array[5]) + parseint(idcard_array[15]))
					* 4
					+ (parseint(idcard_array[6]) + parseint(idcard_array[16]))
					* 2 + parseint(idcard_array[7]) * 1
					+ parseint(idcard_array[8]) * 6 + parseint(idcard_array[9])
					* 3;

			y = s % 11;
			m = "f";
			jym = "10x98765432";
			m = jym.substr(y, 1);// 判断校验位

			// 检测id的校验位
			if (m == idcard_array[17]) {
				return "";
			} else {
				return errors[3];
			}
		}

	} else {
		return errors[2];
	}
	return "";
}

function checkEmail(email){
	var reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	return reg.match(email);
}
