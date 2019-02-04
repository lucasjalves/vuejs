package com.github.lucasjalves.projetoles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/grupoPrecificacao")
public class GrupoPrecificacaoController {

	@RequestMapping("/cadastro")
	public ModelAndView paginaCadastro(ModelAndView modelView) {
		modelView.setViewName("grupoPrecificacao/cadastro");
		return modelView;
	}
}
