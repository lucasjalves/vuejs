
Vue.component('modal-validacao', {
        template: `
                <div class="modal-card" style="width: auto">
                    <header class="modal-card-head">
                        <p class="modal-card-title">{{titulo}}</p>
                    </header>
                    <section class="modal-card-body">
        				<p>{{mensagem}}</p>
                    </section>
                    <footer class="modal-card-foot">
                        <button :class="estiloBotao" @click="$parent.close()">Ok</button>
                    </footer>
            </div>
        `,
        props: ["titulo", "mensagem"],
        computed: {
        	estiloBotao : function(){
        		if(this.titulo === "Erro"){
        			return "button is-danger";
        		}else{
        			return "button is-success";
        		}
        	}
        }
});