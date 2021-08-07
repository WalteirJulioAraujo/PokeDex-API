import { Request, Response } from "express";
import { signUpSchema, logInSchema } from "./schemas/userSchemas";
import * as userService from "../services/userService";

export interface InsertUser{
  email:string;
  password:string;
  confirmPassword:string;
}

export interface SignInUser{
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

export async function signIn(req:Request,res:Response) {
  const user : SignInUser = req.body;

  const validate = logInSchema.validate(user);
  if(validate.error){
    console.log(validate.error);
    return res.sendStatus(400);
  }

  try{
    const result = await userService.signIn(user);
    if(result===false) return res.sendStatus(401);
    res.send({token:result}).status(200);

  }catch(err){
    console.log(err);
    return res.sendStatus(500);
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
