window.onload = function() {
	var aTr = document.getElementsByTagName("tr");
	var oldColor;
	for (i = 0; i < aTr.length; i++) {
		if (i % 2 == 1) {
			aTr[i].style.backgroundColor='#999';
		}
		
		//JavaScript�հ�
		aTr[i].onmouseover=function(){
			oldColor = this.style.backgroundColor;
			this.style.backgroundColor='#99F';
		};	
		aTr[i].onmouseout=function(){
			this.style.backgroundColor=oldColor;
		};	
		
	}
};