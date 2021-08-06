import { Entity, PrimaryGeneratedColumn, Column, OneToOne, OneToMany } from "typeorm";
import Sessions from "./Sessions";
import Mypokemons from "./MyPokemons";
@Entity("users")
export default class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  email: string;

  @Column()
  password: string;

  @OneToOne(()=>Sessions, session=>session.user)
  session:Sessions

  @OneToMany(()=>Mypokemons,mypokemons=>mypokemons.user)
  mypokemons:Mypokemons[];
}
