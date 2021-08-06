import { getRepository } from "typeorm";
import bcrypt from "bcrypt";

import User from "../entities/User";

interface InsertUser{
  email: string;
  password: string;
}

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

export async function getUsers () {
  const users = await getRepository(User).find({
    select: ["id", "email"]
  });
  
  return users;
}
