package com.github.lucasjalves.projetoles.service;

import org.springframework.stereotype.Service;

import com.github.lucasjalves.projetoles.entidade.GrupoPrecificacao;
import com.github.lucasjalves.projetoles.rns.Resultado;

@Service
public interface GrupoPrecificacaoService {

	public Resultado cadastrar(GrupoPrecificacao grupoPrecificacao);
	public Resultado consultar(GrupoPrecificacao grupoPrecificacao);
	public Resultado deletar(GrupoPrecificacao grupoPrecificacao);
	public Resultado consultarPorId(GrupoPrecificacao grupoPrecificacao);
	public Resultado alterar(GrupoPrecificacao grupoPrecificacao);
}
