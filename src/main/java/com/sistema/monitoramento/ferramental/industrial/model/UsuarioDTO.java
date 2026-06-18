/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sistema.monitoramento.ferramental.industrial.model;

public class UsuarioDTO {
    
    private Long id;
    private String login;
    private String senha;
    private String perfil;

    public UsuarioDTO() {
    }

    public UsuarioDTO(Long id, String login, String senha, String perfil) {
        this.id = id;
        this.login = login;
        this.senha = senha;
        this.perfil = perfil;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        if (perfil != null && (perfil.equalsIgnoreCase("ADMIN") || perfil.equalsIgnoreCase("OPERADOR") || perfil.equalsIgnoreCase("TECNICO"))) {
            this.perfil = perfil;
        } else {
            throw new IllegalArgumentException("Perfil invalido!! Use ADMIN ou OPERADOR ou TECNICO");
        }
    }
    
}
