package com.github.lucasjalves.projetoles.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/livro")
public class LivroController {

	@RequestMapping("/cadastro")
	public ModelAndView paginaCadastroLivro(ModelAndView modelView) {
		modelView.setViewName("livro/cadastro");
		return modelView;
	}
}
