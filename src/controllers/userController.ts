import { Request, Response } from "express";
import { signUpSchema } from "./schemas/userSchemas";
import * as userService from "../services/userService";

interface InsertUser{
  email:string;
  password:string;
}

export async function insertUser(req: Request, res: Response) {

  const user : InsertUser = req.body;

  const validate = signUpSchema.validate(user);
  if(validate.error){
    console.log(validate.error);
    return res.sendStatus(400);
  }


  try{
    const result = await userService.insertUser(user);
    
    if(result===null) return res.sendStatus(409);

    res.sendStatus(201);
    
  }catch(err){
    console.error(err);
    res.sendStatus(500);
  }
}


export async function getUsers (req: Request, res: Response) {
  try {
    const users = await userService.getUsers();
    res.send(users);
  } catch (err) {
    console.error(err);
    res.sendStatus(500);
  }
}
