package org.prez.springmysql.repository;

import org.prez.springmysql.model.Usuario;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;


// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

public interface UsuarioRepository extends CrudRepository<Usuario, Integer> {


    @Query(value = "{call SP_UsuariosInscritosCurso(:id)}", nativeQuery = true)
    List<Object> procedimiento(@Param("id") int id);

}
