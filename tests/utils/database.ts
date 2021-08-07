import { getRepository } from "typeorm";
import bcrypt from "bcrypt";

import User from "../../src/entities/User";
import Sessions from "../../src/entities/Sessions";
import MyPokemons from "../../src/entities/MyPokemons";

export async function clearDatabase () {
  await getRepository(MyPokemons).delete({});
  await getRepository(Sessions).delete({});
  await getRepository(User).delete({});
}
interface InsertUser{
  email:string;
  password:string;
}
export async function insertUserInDatabase (user:InsertUser) {
  const hash = bcrypt.hashSync(user.password, 10);
  await getRepository(User).insert({email:user.email,password:hash});
  return hash;
}

export async function searchToken (user:InsertUser) {
  const searchUser = await getRepository(User).findOne({email:user.email});
  const session = await getRepository(Sessions).findOne({userId:searchUser.id});
  return session.token;
}

export async function returnIdMyPokemons () {
  const searchMyPokemons = await getRepository(MyPokemons).find();
  const arrayMyPokemons = searchMyPokemons.map((e)=>e.pokemonId) 
  return arrayMyPokemons;
}