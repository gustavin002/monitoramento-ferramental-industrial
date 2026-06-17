/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sistema.monitoramento.ferramental.industrial.service;

import com.sistema.monitoramento.ferramental.industrial.model.FerramentaDTO;
import com.sistema.monitoramento.ferramental.industrial.repository.FerramentaRepository;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

@Service
public class FerramentaService {
    
    @Autowired private FerramentaRepository repository;
    
    public void salvar(FerramentaDTO ferramenta){
        if(ferramenta.getNome().equals("")){
            throw new ResponseStatusException(HttpStatusCode.valueOf(400), "Nome não preenchido");
        }
        
        if(ferramenta.getVidaUtilMaxima() <= 0){
            throw new ResponseStatusException(HttpStatusCode.valueOf(400), "Vida util não preenchido");
        }
        if(ferramenta.getHorasUso() < 0){
            ferramenta.setHorasUso(0);
            throw new ResponseStatusException(HttpStatusCode.valueOf(400), "Horas de uso não preenchido");
        }
        
        int linhasAfetadas = repository.salvar(ferramenta);
        if(linhasAfetadas == 0){
            throw new ResponseStatusException(HttpStatusCode.valueOf(500), "Erro ao adicionar ao banco de dados");
        }
        
    }
    public List<FerramentaDTO> listarTodos(){
        return repository.listarTodos();
    }
    
    public void update(FerramentaDTO ferramenta){
        if(ferramenta.getNome().equals("")){
            throw new ResponseStatusException(HttpStatusCode.valueOf(400), "Nome não preenchido");
        }
        
        if(ferramenta.getVidaUtilMaxima() <= 0){
            throw new ResponseStatusException(HttpStatusCode.valueOf(400), "Vida util não preenchido");
        }
        if(ferramenta.getHorasUso() < 0){
            ferramenta.setHorasUso(0);
            throw new ResponseStatusException(HttpStatusCode.valueOf(400), "Horas de uso não preenchido");
        }
        
        int linhasAfetadas = repository.update(ferramenta);
        if(linhasAfetadas == 0){
            throw new ResponseStatusException(HttpStatusCode.valueOf(500), "Erro ao adicionar ao banco de dados");
        }
        
    }
    
    public void deleteById(int id){ 
        int linhasAfetadas = repository.deleteById(id);
        if(linhasAfetadas == 0){
            throw new ResponseStatusException(HttpStatusCode.valueOf(500), "Erro ao Excluir");
        }
    }
    
}
