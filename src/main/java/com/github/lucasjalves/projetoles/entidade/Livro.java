package com.github.lucasjalves.projetoles.entidade;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
public class Livro extends Entidade{

	private String autor;
	private String categoria;
	private String ano;
	private String editora;
	private String edicao;
	private String isbn;
	private String numero_paginas;
	private String sinopse;
	private String dimencoes;
	private String peso;
	private String codigo_barra;
	private String preco;
	
	@OneToOne(cascade=CascadeType.ALL)
	private GrupoPrecificacao grupoPrecificacao;
	
	public String getAutor() {
		return autor;
	}
	public void setAutor(String autor) {
		this.autor = autor;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getAno() {
		return ano;
	}
	public void setAno(String ano) {
		this.ano = ano;
	}
	public String getEditora() {
		return editora;
	}
	public void setEditora(String editora) {
		this.editora = editora;
	}
	public String getEdicao() {
		return edicao;
	}
	public void setEdicao(String edicao) {
		this.edicao = edicao;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getNumero_paginas() {
		return numero_paginas;
	}
	public void setNumero_paginas(String numero_paginas) {
		this.numero_paginas = numero_paginas;
	}
	public String getSinopse() {
		return sinopse;
	}
	public void setSinopse(String sinopse) {
		this.sinopse = sinopse;
	}
	public String getDimencoes() {
		return dimencoes;
	}
	public void setDimencoes(String dimencoes) {
		this.dimencoes = dimencoes;
	}
	public String getPeso() {
		return peso;
	}
	public void setPeso(String peso) {
		this.peso = peso;
	}
	public String getCodigo_barra() {
		return codigo_barra;
	}
	public void setCodigo_barra(String codigo_barra) {
		this.codigo_barra = codigo_barra;
	}
	public String getPreco() {
		return preco;
	}
	public void setPreco(String preco) {
		this.preco = preco;
	}	
	
}
