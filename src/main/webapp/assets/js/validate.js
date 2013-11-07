//validation init
function setValid(){
	$.validator.setDefaults({
		onkeyup:false,
		onclick:false,
		onfocusout:false,
		showErrors:function(errorMap, errorList) {
			if(errorList[0] != null){
				alert( errorList[0].message );	
			}
		}
	});

    $.validator.addMethod("valueNotEquals", function(value, element, arg){
        return arg != value;
    }, "");
    
    $.validator.addMethod("specialLetter", function(value, element){
    	return this.optional(element) || !/[^a-z0-9¤¡-¤¾°¡-ÆR]/i.test(value);
    	
    }, "");
    
    $.validator.addMethod("numberAndAlphabet", function(value, element){
    	return this.optional(element) || !/[^a-z0-9]/i.test(value);
    	
    }, "");
};

