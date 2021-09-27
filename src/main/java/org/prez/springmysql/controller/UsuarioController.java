package org.prez.springmysql.controller;

import org.prez.springmysql.model.Usuario;
import org.prez.springmysql.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@CrossOrigin
@RequestMapping(path = "/usuarios")
public class UsuarioController {

    @Autowired

    private UsuarioRepository usuarioRepository;

    @GetMapping(path = "/add")
    public @ResponseBody Usuario addNewUser(@RequestParam String nombre,
             @RequestParam String correo, @RequestParam Integer curso) {


        Usuario n = new Usuario();
        n.setNombre(nombre);
        n.setCorreo(correo);
        n.setCurso(curso);
        return usuarioRepository.save(n);
    }

    @GetMapping(path = "/all")
    public @ResponseBody
    Iterable<Usuario> getAllUsers() {
        return usuarioRepository.findAll();
    }
    
    @DeleteMapping(path = "/delete/{id}")
    public @ResponseBody
    ResponseEntity<?> delete(@PathVariable(value = "id") int id){
        Usuario u = new Usuario();
        u.setId(id);
        
        usuarioRepository.delete(u);

        return ResponseEntity.ok().build();
    }

    @PutMapping(path = "update/{id}")
    public ResponseEntity<Usuario> update(@PathVariable(value = "id") int id,
                                          @RequestBody Usuario usuario) {
        Optional<Usuario> data = usuarioRepository.findById(id);
        if(data.isPresent()) {
            Usuario u = data.get();
            u.setNombre(usuario.getNombre());
            u.setCorreo(usuario.getCorreo());
            u.setCurso(usuario.getCurso());
            return new ResponseEntity<>(usuarioRepository.save(u), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
    @GetMapping(path = "user_course/{id}")
    public @ResponseBody List<Object> procedure(@PathVariable("id") int id) {
        return usuarioRepository.procedimiento(id);
    }
}
