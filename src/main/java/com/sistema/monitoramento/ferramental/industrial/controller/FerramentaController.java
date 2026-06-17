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
    
    @Autowired FerramentaService service;
    
    @GetMapping("/ferramentas")
    public String listarFerramentas(Model model){
        List<FerramentaDTO> lista = service.listarFerramentas();
        model.addAttribute("listaFerramentas", lista);
        return "lista";
    }
    
    @PostMapping("/ferramentas/salvar")
    public String salvarFerramenta(FerramentaDTO ferramenta){
        service.salvarFerramenta(ferramenta);
        return "redirect:/lista";
    }
    
}
