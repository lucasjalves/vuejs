package com.github.lucasjalves.projetoles.entidade;

import javax.persistence.Entity;

@Entity
public class GrupoPrecificacao extends Entidade {

	private String nome;
	private String valor;
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getValor() {
		return valor;
	}
	public void setValor(String valor) {
		this.valor = valor;
	}
	
	
}
