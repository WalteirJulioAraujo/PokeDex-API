import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from "typeorm";
import MyPokemons from "./MyPokemons";

@Entity("pokemons")
export default class Sessions{
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name:string;

    @Column()
    number:number;

    @Column()
    image:string;

    @Column()
    weight:number;

    @Column()
    height:number;

    @Column()
    baseExp:number;

    @Column()
    description:string;

    @Column()
    inMyPokemons:boolean;

    @OneToMany(()=>MyPokemons,mypokemons=>mypokemons.pokemon)
    mypokemons:MyPokemons[];
}