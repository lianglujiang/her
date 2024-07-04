$(function(){
	//�ϴ�ͼƬ
	new AjaxUpload('#addLabProdPic', {
		action: 'upload.action', 
		name: 'file',
		responseType: 'json',
		
		onSubmit : function(file , ext){
			if (ext && /^(jpg|png|bmp)$/.test(ext.toLowerCase())){
				this.setData({
					'fileFileName': file
				});
			} else {
				alert("���ϴ���ʽΪ jpg|png|bmp ��ͼƬ��");
				return false;				
			}
		},
		onComplete : function(file,response){
			if(response.error) {
				alert("error");
				return;
			}
	
			$("#viewImgs").append("<img src='"+response.picUrl+"'/>");
//			$('#viewImg').attr('src',response.picUrl);
//			$('#viewImg').css('display','block');
			$("#picpath").val( $("#picpath").val()+","+ response.picUrl );
		}		
	});
});