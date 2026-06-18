/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sistema.monitoramento.ferramental.industrial.model;

import java.time.LocalDateTime;

public class OrdemServicoDTO {
    
    private Long id;
    private Long idFerramenta;
    private UsuarioDTO tecnico;
    private String descricao;
    private LocalDateTime dataAbertura;
    private LocalDateTime dataFechamento;
    private String status = "Aberta";

    
    public OrdemServicoDTO() {
    }

    public OrdemServicoDTO(Long id, Long idFerramenta, UsuarioDTO tecnico, String descricao, LocalDateTime dataAbertura, LocalDateTime dataFechamento, String status) {
        this.id = id;
        this.idFerramenta = idFerramenta;
        this.tecnico = tecnico;
        this.descricao = descricao;
        this.dataAbertura = dataAbertura;
        this.dataFechamento = dataFechamento;
        this.status = (status != null && !status.isEmpty()) ? status : "Aberta"; 
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdFerramenta() {
        return idFerramenta;
    }

    public void setIdFerramenta(Long idFerramenta) {
        this.idFerramenta = idFerramenta;
    }

    public UsuarioDTO getTecnico() {
        return tecnico;
    }

    public void setTecnico(UsuarioDTO tecnico) {
        this.tecnico = tecnico;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public LocalDateTime getDataAbertura() {
        return dataAbertura;
    }

    public void setDataAbertura(LocalDateTime dataAbertura) {
        this.dataAbertura = dataAbertura;
    }

    public LocalDateTime getDataFechamento() {
        return dataFechamento;
    }

    public void setDataFechamento(LocalDateTime dataFechamento) {
        this.dataFechamento = dataFechamento;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
