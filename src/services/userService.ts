import { getRepository } from "typeorm";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

import { InsertUser } from "../controllers/userController";

import User from "../entities/User";
import Sessions from "../entities/Sessions";

export async function insertUser (user:InsertUser) {

  const ifAlreadyExistsEmail = await getRepository(User).findOne({email:user.email});
  if(ifAlreadyExistsEmail){
    return null;
  }

  const hash = bcrypt.hashSync(user.password, 10);
  user.password=hash;

  const insertUser = await getRepository(User).save(user);
  
  return insertUser;
}

export async function signIn(user:InsertUser) {
  const ifExistsEmail = await getRepository(User).findOne({email:user.email});
  if(!ifExistsEmail){
    return false;
  }
  
  if(ifExistsEmail && bcrypt.compareSync(user.password,ifExistsEmail.password)){
    const token = uuid();
    const searchToken = await getRepository(Sessions).findOne({userId:ifExistsEmail.id});
    if(searchToken){
      await getRepository(Sessions).delete({userId:ifExistsEmail.id});
    }
    const insertToken = await getRepository(Sessions).insert({token,userId:ifExistsEmail.id});
    return token;
  }

  return false;
}

export async function getUsers () {
  const users = await getRepository(User).find({
    select: ["id", "email"]
  });
  
  return users;
}
