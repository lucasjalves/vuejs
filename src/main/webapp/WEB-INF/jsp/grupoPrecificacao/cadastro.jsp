<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"></jsp:include>
<script src="https://unpkg.com/buefy/dist/components/input"></script>
<script src="https://unpkg.com/buefy/dist/components/modal"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-the-mask@0.11.1/dist/vue-the-mask.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/v-money-plus@0.1.0/dist/v-money.min.js"></script>
<script src="/componentes/modal.js"></script>
<script src="/js/scriptUtil.js"></script>
<meta charset="ISO-8859-1">
<title>Cadastro de grupo de precificação</title>
</head>
<body>

	<div id="app" class="container">
		<section>
			<b-field label="Nome do grupo" :type="{'is-danger': nome.length === 0}" :message="{'Campo obrigatório' : nome.length === 0}"> <b-input v-model="nome" ></b-input> </b-field>
			<div class="field">
				<label class="label"> Valor</label>
				<div class="control has-icons-right">
					<money type="text" v-model="valor" :class="valorGrupo"></money>
					<span class="icon is-right has-text-danger"><i class="mdi mdi-alert-circle mdi-24px"></i></span>
				</div>
				<p v-if="mensagemErroValorGrupo.length > 0" class="help is-danger">{{mensagemErroValorGrupo}}</p>
			</div>  
         <div>           
             <button class="button is-success" @click="submitForm()">Cadastrar</button>
         </div>     	      	  	 	
		</section>


	<b-modal :active.sync="haErro">
            <modal-validacao :titulo="tituloModal" :mensagem="mensagemModal"></modal-validacao>
     </b-modal>
	</div>
<script>
const app = new Vue({
	el: "#app",
	data: {
		valor: "",
		nome: "",
    	haErro: false,
    	tituloModal : " ",
    	mensagemModal: " ",
        money: {
	       	decimal: ',',
	        thousands: '.',
	        precision: 2,
       	}
	},
	computed: {
    	valorGrupo: function(){
    		var valorInt = parseInt(this.valor.toString().replace(/\D/g, ""));
    		if(isNaN(valorInt) || valorInt === 0){
    			return "input is-danger";
    		}
    		return "input";
    	},
    	mensagemErroValorGrupo: function(){
    		var valorInt = parseInt(this.valor.toString().replace(/\D/g, ""));
    		if(isNaN(valorInt) || valorInt === 0){
    			return "Digite um valor válido";
    		}
    		return "";
    	}
	},
	methods: {
		submitForm: function(){
    		this.haErro = false;
    		var erroNaValidacao = validarCamposVazios(app._data);
    		if(erroNaValidacao){
    			this.tituloModal = "Erro"
    			this.mensagemModal = "Favor, verifique os campos."
    			this.haErro = true;
    		}else{
    			
    		}			
		}
	},
	directives: {money: VMoney}
});
</script>

</body>
</html>