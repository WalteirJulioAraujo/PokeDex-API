import { Request, Response } from "express";
import { getRepository } from "typeorm";
import Sessions from "../entities/Sessions";

export default async function authMiddleware(req:Request,res:Response) {
    const auth = req.headers.authorization;
    const token = auth.replace("Bearer ","");

    const session = getRepository(Sessions).findOne({token});

    if(!session){
        return res.sendStatus(401);
    }
}