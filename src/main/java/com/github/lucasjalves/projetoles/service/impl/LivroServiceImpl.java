package com.github.lucasjalves.projetoles.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.lucasjalves.projetoles.entidade.Livro;
import com.github.lucasjalves.projetoles.facade.Facade;
import com.github.lucasjalves.projetoles.rns.Resultado;
import com.github.lucasjalves.projetoles.service.LivroService;

@Service
public class LivroServiceImpl implements LivroService{

	@Autowired
	private Facade facade;
	@Override
	public Resultado cadastrar(Livro livro) {
		return facade.salvar(livro);
	}

	@Override
	public Resultado consultar(Livro livro) {
		return facade.buscar(livro);
	}

	@Override
	public Resultado deletar(Livro livro) {
		return facade.excluir(livro);
	}

	@Override
	public Resultado consultarPorId(Livro livro) {
		return facade.buscarPorId(livro);
	}

	@Override
	public Resultado alterar(Livro livro) {
		return facade.alterar(livro);
	}

}
