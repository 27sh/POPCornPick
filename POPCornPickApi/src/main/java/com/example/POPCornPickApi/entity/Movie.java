package com.example.POPCornPickApi.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Entity
@Data
public class Movie {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long movieDC;
    private String title;
    private String color;
    private String viewAge;
    private String showTm;
}
