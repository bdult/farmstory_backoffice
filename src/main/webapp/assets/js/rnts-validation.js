function isEmpty(str){
	
	var result = true;
    var tmp = str.replace(/\s|　/gi, '');
    // 정규식으로 공백, 엔터, 탭, 특수문자 공백 문자를 빈문자로 바꿈
    // 입력된 값에 대하여 위 정규식 처리를 하고 뭔가 남아있지 않다면
    // 값이 무의미 하다고 판단함.
    
    if( tmp == '' ) {
    	//do nothing
    } else{
    	result = false;
    }
    
    return result;
}