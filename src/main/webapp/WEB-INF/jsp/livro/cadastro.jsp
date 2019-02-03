<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"></jsp:include>
<script src="https://unpkg.com/buefy/dist/components/input"></script>
<script src="https://unpkg.com/buefy/dist/components/modal"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-the-mask@0.11.1/dist/vue-the-mask.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/v-money-plus@0.1.0/dist/v-money.min.js"></script>
<script src="/componentes/modal.js"></script>
<meta charset="ISO-8859-1">
<title>Cadastro de livro</title>
</head>
<body>
	<div id="app" class="container">
		<money type="hidden" v-model="preco"></money>
		<section>
			<b-field label="Nome do livro" :type="{'is-danger': autor.length === 0}" :message="{'Campo obrigatório' : autor.length === 0}"> <b-input v-model="autor" ></b-input> </b-field>

			<b-field :type="{'is-danger': categoria.length === 0}" :message="{'Campo obrigatório' : categoria.length === 0}" label="Categoria">
            	<b-select placeholder="Categoria"  v-model="categoria">
	                <option
	                    v-for="option in categorias"
	                    :value="option"
	                    :key="option">
	                    {{option}}
	                </option>
            	</b-select>
        	</b-field>

			<b-field label="Ano" :type="{'is-danger': ano.length === 0}" :message="{'Campo obrigatório' : ano.length === 0}"> 
				<b-input  v-mask="'####'" v-model="ano"></b-input> 
			</b-field>

			<b-field label="Editora" :type="{'is-danger': editora.length === 0}" :message="{'Campo obrigatório' : editora.length === 0}"> 
				<b-input v-model="editora"> </b-input> 
			</b-field>

			<b-field label="Edição" :type="{'is-danger': edicao.length === 0}" :message="{'Campo obrigatório' : edicao.length === 0}"> 
				<b-input v-model="edicao"></b-input> 
			</b-field>
						
			<b-field label="ISBN" :type="{'is-danger': isbn.length === 0}" :message="{'Campo obrigatório' : isbn.length === 0}"> 
				<b-input v-mask="'#############'" v-model="isbn"></b-input> 
			</b-field>
			
			<b-field label="Número de páginas" :type="{'is-danger': numero_paginas.length === 0}" :message="{'Campo obrigatório' : numero_paginas.length === 0}"> 
				<b-input v-mask="'#####'" v-model="numero_paginas"></b-input> 
			</b-field>
			
			<b-field label="Sinopse"  :type="{'is-danger': sinopse.length === 0}" :message="{'Campo obrigatório' : sinopse.length === 0}">
           	 	<b-input type="textarea" v-model="sinopse"></b-input>
        	</b-field>
        	
			<b-field :type="{'is-danger': grupo.length === 0}" :message="{'Campo obrigatório' : grupo.length === 0}" label="Grupo precificação">
            	<b-select placeholder="Grupo precificação"  v-model="grupo">
	                <option
	                    v-for="grupoPrecificacao in grupos"
	                    :value="grupoPrecificacao.valor"
	                    :key="grupoPrecificacao.valor">
	                   	{{grupoPrecificacao.nome}} -- {{grupoPrecificacao.valor.replace(".", ",")}}%
	                </option>
            	</b-select>
        	</b-field>   
        	
			<b-field label="Sinopse"  :type="{'is-danger': sinopse.length === 0}" :message="{'Campo obrigatório' : sinopse.length === 0}">
           	 	<b-input type="textarea" v-model="sinopse"></b-input>
        	</b-field>   
        	
        	<b-field label="Dimensões (AA.AA x LL.LL x PP.PP)"  :type="dimensoesLivro" :message="mensagemErroDimensaoLivro">
           	 	<b-input v-model="dimensoes" v-mask="'##.##x##.##x##.##'"></b-input>
        	</b-field>   
        	
        	<b-field label="Peso (gramas)"  :type="pesoLivro" :message="mensagemErroPesoLivro">
           	 	<b-input v-model="peso" v-mask="'####'"></b-input>
        	</b-field>    
        	
        	<b-field label="Código de barras"  :type="codigoBarraLivro" :message="mensagemErroCodigoBarraLivro">
           	 	<b-input v-model="codigo_barra" v-mask="'#############'"></b-input>
        	</b-field>     

        	<b-field label="Preço"  :type="precoLivro" :message="mensagemErroPrecoLivro">
           	 	<b-input v-model="preco"></b-input>
        	</b-field>     
        	
         <div>           
             <button class="button is-success" @click="submitForm()">Cadastrar</button>
         </div>     	      	  	 	
		</section>


	<b-modal :active.sync="haErro">
            <modal-validacao :titulo="tituloModal" :mensagem="mensagemModal"></modal-validacao>
     </b-modal>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
	<jsp:include page="../scripts/scriptsUtil.jsp"></jsp:include>
<script>
Vue.use('mask', VueTheMask);
Vue.use(VMoney, {precision: 4});
var app = new Vue({
    el: '#app',
    computed: {
    	dimensoesLivro : function(){
    		if(this.dimensoes.length < 17 && this.dimensoes.length >= 0){
    			return "is-danger";
    		}
    		return "";
    	},
    	mensagemErroDimensaoLivro : function(){
    		if(this.dimensoes.length < 17 && this.dimensoes.length > 0){
    			return "Digite uma dimensão válida";
    		}   		
    		if(this.dimensoes.length === 0){
    			return "Campo obrigatório";
    		}
    		return "";
    	},
    	pesoLivro: function(){
    		var pesoLivro = parseInt(this.peso.replace(/\D/g, ""));
    		if(this.peso.length === 0 || pesoLivro === 0){
    			return "is-danger";
    		}
    		return "";
    	},
    	mensagemErroPesoLivro: function(){
    		var pesoLivro = parseInt(this.peso.replace(/\D/g, ""));
    		if(this.peso.length === 0 || pesoLivro === 0){
    			return "Digite um peso válido";
    		}
    		return "";   		
    	},
    	codigoBarraLivro: function(){
    		if(this.codigo_barra.length === 0 || this.codigo_barra.length < 13){
    			return "is-danger";
    		}
    		return "";
    	},
    	mensagemErroCodigoBarraLivro: function(){
    		if(this.codigo_barra.length === 0){
    			return "Campo obrigatório";
    		}
    		if(this.codigo_barra.length < 13){
    			return "Código de barras (EAN-13) inválido";
    		}
    		return "";
    	},
    	precoLivro: function(){
    		var precoLivroInt = parseInt(this.preco.toString().replace(/\D/g, ""));
    		if(isNaN(precoLivroInt) || precoLivroInt === 0){
    			return "is-danger";
    		}
    		return "";
    	},
    	mensagemErroPrecoLivro: function(){
    		var precoLivroInt = parseInt(this.preco.toString().replace(/\D/g, ""));
    		if(isNaN(precoLivroInt) || precoLivroInt === 0){
    			return "Digite um valor válido";
    		}
    		return "";
    	}
    },
    data: {
    	autor : "",
    	categorias: ["Biografias",
    		 "Colecoes",
    		 "Comportamento",
    		 "Contos",
    		 "Critica",
    		 "Literaria",
    		 "Ficcao",
    		 "Cientifica",
    		 "Folclore",
    		 "Genealogia",
    		 "Humor",
    		 "Infantojuvenis",
    		 "Jogos",
    		 "Jornais",
    		 "Literatura Brasileira",
    		 "Literatura Estrangeira",
    		 "Livros",
    		 "Raros",
    		 "Manuscritos",
    		 "Poesia",
    		 "Outros",
    		 "Assuntos"
    		 ],
    	grupos: [
    		{
    			nome: "A",
    			valor: "10.00"
    		},
    		{
    			nome: "B",
    			valor: "15.00"
    		},
    		{
    			nome: "C",
    			valor: "20.00"
    		}
    	],
    	grupo: "",
    	categoria : "",
    	ano: "",
    	editora : "",
    	edicao: "",
    	isbn: "",
    	numero_paginas : "",
    	sinopse: "",
    	dimensoes: "",
    	peso: "",
    	codigo_barra: "",
    	preco: "",
    	haErro: false,
    	tituloModal : "",
    	mensagemModal: ""
    	
    },
    methods: {
    	submitForm: function(){
    		this.haErro = false;
    		var erroNaValidacao = false;
    		for(var chave in app._data){
    			var valorChave = app._data[chave];
    			if(valorChave.length === 0){
    				erroNaValidacao = true;
    			}
    		}  	
    		
    		if(erroNaValidacao){
    			this.tituloModal = "Erro"
    			this.mensagemModal = "Favor, verifique os campos."
    			this.haErro = true;
    		}
    	}
    }
});




</script>

</body>
</html>