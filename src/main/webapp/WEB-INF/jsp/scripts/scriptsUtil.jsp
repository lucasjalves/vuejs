<script>

function existeChaveJson(chave, json){
	var chaves = Object.keys(json);
	for(var i = 0; i < chaves.length; i++){
		if(chaves[i] == chave){
			return true;
		}
		return false;
	}
}
</script>