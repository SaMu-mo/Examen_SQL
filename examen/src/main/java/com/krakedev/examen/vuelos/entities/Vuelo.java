package com.krakedev.examen.vuelos.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "vuelos")
public class Vuelo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "codigo", nullable = false, unique = true, length = 10)
    private String codigo;

    @Column(name = "precio_boleto", nullable = false)
    private Double precioBoleto;

    @Column(name = "asientos_disponibles", nullable = false)
    private Integer asientosDisponibles;

    public Vuelo() {}

    public Vuelo(String codigo, Double precioBoleto, Integer asientosDisponibles) {
        this.codigo = codigo;
        this.precioBoleto = precioBoleto;
        this.asientosDisponibles = asientosDisponibles;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getCodigo() { return codigo; }
    public void setCodigo(String codigo) { this.codigo = codigo; }

    public Double getPrecioBoleto() { return precioBoleto; }
    public void setPrecioBoleto(Double precioBoleto) { this.precioBoleto = precioBoleto; }

    public Integer getAsientosDisponibles() { return asientosDisponibles; }
    public void setAsientosDisponibles(Integer asientosDisponibles) { this.asientosDisponibles = asientosDisponibles; }

    @Override
    public String toString() {
        return "Vuelo [id=" + id + ", codigo=" + codigo + ", precioBoleto=" + precioBoleto +
               ", asientosDisponibles=" + asientosDisponibles + "]";
    }
}