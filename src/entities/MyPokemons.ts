import { Column, Entity, ManyToOne, PrimaryGeneratedColumn, } from "typeorm";
import User from "./User";
import Pokemons from "./Pokemons";

@Entity("mypokemons")
export default class MyPokemons{
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    userId:number;

    @Column()
    pokemonId:number;

    @ManyToOne(()=>User,user=>user.mypokemons)
    user:User;

    @ManyToOne(()=>Pokemons,pokemon=>pokemon.mypokemons)
    pokemon:Pokemons;
}