package com.github.lucasjalves.projetoles.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.lucasjalves.projetoles.entidade.GrupoPrecificacao;
import com.github.lucasjalves.projetoles.rns.Resultado;
import com.github.lucasjalves.projetoles.service.GrupoPrecificacaoService;

@Controller
@RequestMapping("/grupoPrecificacao")
public class GrupoPrecificacaoController {

	@Autowired
	private GrupoPrecificacaoService service;
	
	@RequestMapping("/cadastro")
	public ModelAndView paginaCadastro(ModelAndView modelView) {
		modelView.setViewName("grupoPrecificacao/cadastro");
		return modelView;
	}
	
	@ResponseBody
	@RequestMapping("/cadastrar")
	public Resultado cadastrar(@ModelAttribute GrupoPrecificacao grupoPrecificacao) {
		return service.cadastrar(grupoPrecificacao);
	}
}
