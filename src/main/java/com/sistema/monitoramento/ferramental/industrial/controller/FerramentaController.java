/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sistema.monitoramento.ferramental.industrial.controller;

import com.sistema.monitoramento.ferramental.industrial.model.FerramentaDTO;
import com.sistema.monitoramento.ferramental.industrial.service.FerramentaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FerramentaController {
    
    @Autowired private FerramentaService service;
    
    @GetMapping("/")
    public String index(){
        return "redirect:/ferramentas";
    }
    
    @GetMapping("/ferramentas")
    public String listarTodos(Model model){
        List<FerramentaDTO> lista = service.listarTodos();
        model.addAttribute("listaFerramentas", lista);
        return "ferramentas";
    }
    
    @PostMapping("/ferramentas/salvar")
    public String salvar(FerramentaDTO ferramenta){
        service.salvar(ferramenta);
        return "redirect:/lista";
    }
    
    @GetMapping("/ferramentas/excluir/{id}")
    public String excluir(@PathVariable int id) {
        service.deleteById(id);
        return "redirect:/ferramentas";
    }
    
}
