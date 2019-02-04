package com.github.lucasjalves.projetoles.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.lucasjalves.projetoles.entidade.GrupoPrecificacao;
import com.github.lucasjalves.projetoles.facade.Facade;
import com.github.lucasjalves.projetoles.rns.Resultado;
import com.github.lucasjalves.projetoles.service.GrupoPrecificacaoService;

@Service
public class GrupoPrecificacaoServiceImpl implements GrupoPrecificacaoService {

	@Autowired
	private Facade facade;
	@Override
	public Resultado cadastrar(GrupoPrecificacao grupoPrecificacao) {
		return facade.salvar(grupoPrecificacao);
	}

	@Override
	public Resultado consultar(GrupoPrecificacao grupoPrecificacao) {
		return facade.buscar(grupoPrecificacao);
	}

	@Override
	public Resultado deletar(GrupoPrecificacao grupoPrecificacao) {
		return facade.buscarPorId(grupoPrecificacao);
	}

	@Override
	public Resultado consultarPorId(GrupoPrecificacao grupoPrecificacao) {
		return facade.buscarPorId(grupoPrecificacao);
	}

	@Override
	public Resultado alterar(GrupoPrecificacao grupoPrecificacao) {
		return facade.alterar(grupoPrecificacao);
	}

}
