

function existeChaveJson(chave, json){
	var chaves = Object.keys(json);
	for(var i = 0; i < chaves.length; i++){
		if(chaves[i] == chave){
			return true;
		}
		return false;
	}
}

function validarCamposVazios(json){
	for(var chave in json){
		var valorChave = json[chave];
		if(valorChave.length === 0){
			return true;
		}
	}  	
	
	return false;
}
