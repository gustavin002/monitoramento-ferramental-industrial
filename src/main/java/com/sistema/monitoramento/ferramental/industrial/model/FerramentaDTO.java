/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sistema.monitoramento.ferramental.industrial.model;

public class FerramentaDTO {
       
    private int id;
    private String nome;
    private int horasUso;
    private int vidaUtilMaxima;

    public FerramentaDTO() {
    }

    public FerramentaDTO(int id, String nome, int horasUso, int vidaUtilMaxima) {
        this.id = id;
        this.nome = nome;
        this.horasUso = horasUso;
        this.vidaUtilMaxima = vidaUtilMaxima;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getHorasUso() {
        return horasUso;
    }

    public void setHorasUso(int horasUso) {
        this.horasUso = horasUso;
    }

    public int getVidaUtilMaxima() {
        return vidaUtilMaxima;
    }

    public void setVidaUtilMaxima(int vidaUtilMaxima) {
        this.vidaUtilMaxima = vidaUtilMaxima;
    }
    
    public double getPercentualDesgaste(){
       return (horasUso / vidaUtilMaxima) * 100;
         
    }
    
}
