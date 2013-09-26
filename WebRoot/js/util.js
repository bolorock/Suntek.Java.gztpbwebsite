var Util={
		/**
		 * 提交表单成功后返回流水号
		 * @param applyNum 流水号
		 * @param step 最后完成步骤的jquery对象：如：$("#step-6")
		 */
		addSuccessMsg:function(applyNum,step){
			$("<div>").addClass("form_success")
			.append("<p><strong>您好！您已成功提交申请！请记录申请流水号： </strong></p>")
			.append($("<span>").addClass("form_span").text(applyNum))
			.append("<p><strong>您可以用此流水号在http://www.baidu.com查询您的业务办理情况。</strong></p>")
			.appendTo(step);
		},
		
		/**
		 * 必填字段加星号显示
		 */
		addAsterisk:function(){
			$("#wizard").find(".\\:required").each(function(){
				$(this).parent().find(".editor-label").prepend("<span class='field-impt'>*</span>");
			})
			
		},
		
		/**
		 * 设置提示
		 */
		setTip:function(){
			$(".qtip").each(function(){
				var tip=$(this).attr("tip");
				var tipWidth=$(this).attr("tipWidth") || 230;
				if (tip){
					 $(this).qtip(
								{
									content: tip,
							 	 	position: {
									      corner: {
									    	 tooltip: 'leftMiddle',
									         target: 'rightMiddle'
									      }
									   },
									   style: {
							                tip: true, // Give it a speech bubble tip with automatic corner detection
							                name: 'cream',
							                width: Number(tipWidth)
							            }

							  });
				}
			});
		},
		
		/**
		 * 设置显示等待图标
		 * @param isShow 是否显示 true or false
		 */
		setWaiting:function(isShow){
			var $div=$("#waiting");
			if ($div.length==0){
				$("body").append($("<div>").attr("id","waiting"));
			}
			if (isShow){
				$div.show();
			}
			else{
				$div.hide();
			}
		},
		/**
		 * 自动滚动到页面顶部
		 */
		autoScroll:function(){
		    $('html,body', window.parent.document).animate({scrollTop: $('body', window.parent.document).offset().top}, 1000);
		}
}