package com.github.lucasjalves.projetoles.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.github.lucasjalves.projetoles.annotation.Repositorio;
import com.github.lucasjalves.projetoles.entidade.GrupoPrecificacao;

@Repository
@Repositorio(classe=GrupoPrecificacao.class)
public interface GrupoPrecificacaoRepository extends JpaRepository<GrupoPrecificacao, Long>{

}
