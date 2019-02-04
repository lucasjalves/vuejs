package com.github.lucasjalves.projetoles.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.github.lucasjalves.projetoles.annotation.Repositorio;
import com.github.lucasjalves.projetoles.entidade.Livro;

@Repository
@Repositorio(classe=Livro.class)
public interface LivroRepository extends JpaRepository<Livro, Long>{
	
}
