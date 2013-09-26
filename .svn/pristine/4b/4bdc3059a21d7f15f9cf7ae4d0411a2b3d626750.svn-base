/**depend on jquery**/
/**
 * init select element
 * @param id
 * @param val
 * @return
 */
function initSel(id,val){
	var opts=$('#'+id+" option");
	for(var i=0;i<opts.length;i++){
		if(opts[i].value==val){
			opts[i].selected="selected";
			break;
		}
	}
}
/**
 * 判断是否整数
 * @param val
 * @return
 */
function f_check_integer(val) {
	if (/^(\+|-)?\d+$/.test(val)) {
		return true;
	} else {
		return false;
	}
}

 /**
  * 判断是否数字（整型或浮点型）
  * @param num
  * @return
  */
 function isNum(num){
	 var reg = /^\d+(.\d+)?$/;
	 if(reg.test(num)) return true;
	 return false;
}

  /**
   * 判断dataStr1是否在dateStr2之前
   * @param dateStr1
   * @param dateStr2
   * @return
   */
function dateBefore(dateStr1,dateStr2){
	dateStr1   =   dateStr1.replace(/\-/g, "\/ "); 
	dateStr2   =   dateStr2.replace(/\-/g, "\/ "); 
	return (new   Date(dateStr1)   <=   new   Date(dateStr2)); 

}

/**
 * 判断时间是否在今天之前
 * @param dataStr
 * @return
 */
function dateBeforeNow(dataStr){
	dataStr=dataStr.replace(/\-/g, "\/ "); 
	return (new Date(dataStr)<= new Date());
}

function isCardId(str){
	//身份证正则表达式(15位) 
	isIDCard1=/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/; 
	//身份证正则表达式(18位) 
	isIDCard2=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[A-Z])$/;
	return (isIDCard1.test(str)||isIDCard2.test(str));
}

//校验密码：只能输入6-20个字母、数字、下划线
function isPasswd(s) { 
	var patrn=/^(\w){6,20}$/; 
	if (!patrn.exec(s)) 
		return false;
	return true; 
}

//中国电话号码验证
function isTelephone(telephone){
    //var patrn = /((d{3,4})|d{3,4}-)?d{7,8}(-d{3})*/;
    var patrn=/^(\w){6,20}$/; 
    if(telephone.test(patrn)){
       return true;
    }
    //return telephone.test(patrn);
}

function openZDailog(name,url,width,height,title,showMessage,showButton,onClickCallBack) {
	var zDlg = new Dialog(name);
	zDlg.Width = width;
	zDlg.Height = height;
	zDlg.Title = title;
	zDlg.URL = url;
	zDlg.ShowMessageRow = showMessage;
	zDlg.ShowButtonRow=showButton;
	if(onClickCallBack!=null){
		zDlg.ShowButtonRow = true;
		zDlg.OKEvent = function(){
			onClickCallBack(zDlg);
		}
	}else{
		zDlg.ShowButtonRow = false;
	}
	zDlg.addParam("window", window);
	zDlg.show();
	
	return zDlg;
}

//显示对话框，isInfoDlg 是否是显示信息类型的对话框，只有一个确定按钮。 
function openZDailogEx(name,url,width,height,title,showMessage,isInfoDlg,onClickOKCallBack,okBtnTxt) {
		var zDlg = new Dialog(name);
		zDlg.Width = width;
		zDlg.Height = height;
		zDlg.Title = title;
		zDlg.URL = url;
		zDlg.ShowMessageRow = showMessage;
		if(onClickOKCallBack!=null){
			zDlg.ShowButtonRow = true;
			zDlg.OKEvent = function(){onClickOKCallBack(zDlg);}
		}else{
			zDlg.ShowButtonRow = true;
			zDlg.OKEvent = function(){zDlg.close();}
		}
		zDlg.addParam("window", window);
		zDlg.show();
		
		if(isInfoDlg){
			var pw = $E.getTopLevelWindow()
			$E.hide(pw.___("_ButtonCANCEL_"+name));
			if(onClickOKCallBack!=null){
				//zDlg.CancelEvent = function(){alert("CancelEvent");}
				if(okBtnTxt){
					zDlg.OKButton.value =okBtnTxt;
				}else{
					zDlg.OKButton.value = "关闭";
				}
				
				zDlg.OKButton.focus();
			}
		}	
		
		return zDlg;
}
//按钮
function openZDailogEx2(name,url,width,height,title,showMessage) {
	var zDlg = new Dialog(name);
	zDlg.Width = width;
	zDlg.Height = height;
	zDlg.Title = title;
	zDlg.URL = url;
	zDlg.ShowMessageRow = showMessage;
	zDlg.ShowButtonRow = false;
	
	zDlg.addParam("window", window);
	zDlg.show();
	return zDlg;
}

function random(n){
	//var v=Math.random()*(n-m)+m);//回指定范围的随机数(m-n之间)的公式
	var v=Math.ceil(Math.random()*(8-1)+1);
	if(n){
		if(n==v)
			return v+1;
	}
	return v;
}

/*打开浮动小窗口
 * id : 窗口id
 * showButtonRow : 是否显示窗口右下角的“确定”，“取消”按钮
 * cancelEvent : 点击"取消"响应事件
 * okEvent : 点击"确定"响应事件
 */
function openWindow(id,width,height,title,url,showButtonRow,cancelEvent,okEvent){	
	 var dialog = new Dialog(id);
	 dialog.Width = width;
	 dialog.Height =height;
	 dialog.Title = title;
	 dialog.URL = url; 
	 dialog.ShowButtonRow = showButtonRow; 
	 dialog.CancelEvent = cancelEvent;
	 dialog.OKEvent = okEvent;
	 dialog.show();
	 return dialog;
}