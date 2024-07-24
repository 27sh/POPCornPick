  package com.example.POPCornPickApi.entity;
  
  import jakarta.persistence.Column; import jakarta.persistence.Entity; import
  jakarta.persistence.GeneratedValue; import
  jakarta.persistence.GenerationType; import jakarta.persistence.Id; import
  jakarta.persistence.JoinColumn; import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
  
  @Entity
  @Data
  @NoArgsConstructor
  @AllArgsConstructor
  public class StillCut {
  
  @Id
  
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long stillNo;
  
  
  @ManyToOne
  
  @JoinColumn(name = "movieDc", referencedColumnName = "movieDc", nullable =  false)
  private MovieDetail movie;
  
  @Column(nullable = true) 
  private String stillimg;
  }
 