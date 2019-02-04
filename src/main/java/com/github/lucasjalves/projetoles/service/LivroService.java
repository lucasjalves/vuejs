package com.github.lucasjalves.projetoles.service;

import org.springframework.stereotype.Service;

import com.github.lucasjalves.projetoles.entidade.Livro;
import com.github.lucasjalves.projetoles.rns.Resultado;

@Service
public interface LivroService {

	public Resultado cadastrar(Livro livro);
	public Resultado consultar(Livro livro);
	public Resultado deletar(Livro livro);
	public Resultado consultarPorId(Livro livro);
	public Resultado alterar(Livro livro);
	
}
