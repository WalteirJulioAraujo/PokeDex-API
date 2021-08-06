import { getRepository } from "typeorm";
import Pokemons from "../entities/Pokemons";
import MyPokemons from "../entities/MyPokemons";

export async function insertPokemon(pokemon:object) {
    await getRepository(Pokemons).insert(pokemon);
}
//alterar a get all pra olhar quais sao meus pokemons antes de retornar;
export async function getAll(){
    const pokemons = await getRepository(Pokemons).find();
    return pokemons;
}

export async function addPokemon(id:number,userId:number) {
    const checkIfitsMyPokemon = await getRepository(MyPokemons).findOne({userId,pokemonId:id});
    if(checkIfitsMyPokemon) return;

    await getRepository(MyPokemons).insert({userId,pokemonId:id});
    return;
}

export async function removePokemon(id:number,userId:number) {

    await getRepository(MyPokemons).delete({userId,pokemonId:id});
    return;
}