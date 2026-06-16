/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.sistema.monitoramento.ferramental.industrial.repository;

import com.sistema.monitoramento.ferramental.industrial.model.FerramentaDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

@Repository
public class FerramentaRepository {
    
    public void cadastrarFerramenta(FerramentaDTO ferramenta){
        try{
        Connection conn = Conexao.conectar();    
        PreparedStatement stmt = null;
        
        stmt = conn.prepareStatement("INSERT INTO tb_ferramenta (nome, horas_uso, vida_util_maxima) VALUES (?, ?, ?)");
        stmt.setString(1, ferramenta.getNome());
        stmt.setInt(2, ferramenta.getHorasUso());
        stmt.setInt(3, ferramenta.getVidaUtilMaxima());
        
        int linhasAfetadas = stmt.executeUpdate();
        
        if(linhasAfetadas == 0){
            throw new SQLException("Nenhuma linha foi afetada");
        }
        
        } catch(SQLException e){
            e.printStackTrace();
        }
        
    }
    
    public List<FerramentaDTO> listarFerramentas(){
        List<FerramentaDTO> listar = new ArrayList<>();
        try {
            Connection conn = Conexao.conectar();
            PreparedStatement stmt = null;
            ResultSet rs = null;
            
            stmt = conn.prepareStatement("SELECT * FROM tb_ferramenta");
            rs = stmt.executeQuery();
            
            while(rs.next()){
                FerramentaDTO dados = new FerramentaDTO();
                dados.setId(rs.getInt("id"));
                dados.setNome(rs.getString("nome"));
                dados.setHorasUso(rs.getInt("horas_uso"));
                dados.setVidaUtilMaxima(rs.getInt("vida_util_maxima"));
                
                listar.add(dados);
            }
                
        } catch (SQLException e){
            e.printStackTrace();
        }
        return listar;
    }
    
    public void editarFerramenta (FerramentaDTO ferramenta){
        
        try{
            Connection conn = Conexao.conectar();    
            PreparedStatement stmt = null;
            
            stmt = conn.prepareStatement("UPDATE tb_ferramenta SET nome = ?, horas_uso = ?, vida_util_maxima = ? WHERE id = ?");
            stmt.setString(1, ferramenta.getNome());
            stmt.setInt(2, ferramenta.getHorasUso());
            stmt.setInt(3, ferramenta.getVidaUtilMaxima());
            stmt.setInt(4, ferramenta.getId());
            
            int linhasAfetadas = stmt.executeUpdate();
            
            if(linhasAfetadas == 0){
                throw new SQLException("Nenhuma linha foi afetada");
            }
            
        } catch (SQLException e){
            e.printStackTrace();
        }
        
    }
    
    public void deleteById(Long id){
        
        try {
           Connection conn = Conexao.conectar();
           PreparedStatement stmt = null;
            
           stmt = conn.prepareStatement("DELETE FROM tb_ferramenta WHERE id = ?");
           stmt.setLong(1, id);
 
           int linhasAfetadas = stmt.executeUpdate();
           
           if(linhasAfetadas == 0){
               throw new SQLException("Nenhuma linha foi afetada");
           }
           
        } catch (SQLException e){
             e.printStackTrace();
        }
        
    }
    
}
