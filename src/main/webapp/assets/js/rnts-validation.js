function isEmpty(str){
	
	var result = true;
    var tmp = str.replace(/\s|��/gi, '');
    // ���Խ����� ����, ����, ��, Ư������ ���� ���ڸ� ���ڷ� �ٲ�
    // �Էµ� ���� ���Ͽ� �� ���Խ� ó���� �ϰ� ���� �������� �ʴٸ�
    // ���� ���ǹ� �ϴٰ� �Ǵ���.
    
    if( tmp == '' ) {
    	//do nothing
    } else{
    	result = false;
    }
    
    return result;
}