package com.example.pokedex

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.pokedex.model.Pokemon

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val recyclerView = findViewById<RecyclerView>(R.id.recyclerView)
        recyclerView.layoutManager = LinearLayoutManager(this)

        val pokemonList = listOf(
            Pokemon("Caterpie", ""),
            Pokemon("Larvitar", ""),
            Pokemon("Nidorino", ""),
            Pokemon("Quilava", ""),
            Pokemon("Slugma", ""),
            Pokemon("Typhlosion", "")
        )

        val adapter = PokemonAdapter(pokemonList)
        recyclerView.adapter = adapter
    }
}
