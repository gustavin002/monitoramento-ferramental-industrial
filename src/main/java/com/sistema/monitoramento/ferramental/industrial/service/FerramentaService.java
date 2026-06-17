/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sistema.monitoramento.ferramental.industrial.service;

import com.sistema.monitoramento.ferramental.industrial.model.FerramentaDTO;
import com.sistema.monitoramento.ferramental.industrial.repository.FerramentaRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FerramentaService {
    
    @Autowired FerramentaRepository repository;
    
    public void cadastrarFerramenta(FerramentaDTO ferramenta){
        repository.cadastrarFerramenta(ferramenta);
    }
    
    public List<FerramentaDTO> listarFerramentas(){
        return repository.listarFerramentas();
    }
    
    public void salvarFerramenta (FerramentaDTO ferramenta){
        repository.salvarFerramenta(ferramenta);
    }
    
    public void deleteById(Long id){
        repository.deleteById(id);
    }
    
}
