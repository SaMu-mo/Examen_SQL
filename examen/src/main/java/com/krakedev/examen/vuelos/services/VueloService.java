package com.krakedev.examen.vuelos.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.krakedev.examen.vuelos.entities.Vuelo;
import com.krakedev.examen.vuelos.repositories.VueloRepository;

@Service
public class VueloService {

    @Autowired
    private VueloRepository repositorio;

    public Vuelo crear(Vuelo vuelo) {
        return repositorio.save(vuelo);
    }

    public List<Vuelo> listar() {
        return repositorio.findAll();
    }

    public Optional<Vuelo> buscarPorId(Long id) {
        return repositorio.findById(id);
    }

    public Vuelo actualizar(Long id, Vuelo vuelo) {
        vuelo.setId(id);
        return repositorio.save(vuelo);
    }

    public boolean eliminar(Long id) {
        if (repositorio.existsById(id)) {
            repositorio.deleteById(id);
            return true;
        }
        return false;
    }

    public List<Vuelo> vuelosConPocosAsientos(Integer asientos) {
        return repositorio.findByAsientosDisponiblesLessThan(asientos);
    }
}