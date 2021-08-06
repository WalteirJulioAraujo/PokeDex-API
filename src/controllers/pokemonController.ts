import { Request, Response } from "express";

import * as pokemonService from "../services/pokemonService";

export async function insertPokemon(req:Request,res:Response) {
    try{
        const pokemon = req.body;
        await pokemonService.insertPokemon(pokemon);
        res.sendStatus(200);
    }catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}

export async function getAll(req:Request, res:Response) {
    const userId = res.locals.session.userId;
    try{
        const pokemons = await pokemonService.getAll(userId);
        res.send(pokemons).status(200);
    }catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}

export async function addPokemon(req:Request, res:Response) {
    const id = Number(req.params.id);
    const userId = res.locals.session.userId;
    try{
        const result = await pokemonService.addPokemon(id,userId);
        res.sendStatus(200);
    }catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}

export async function removePokemon(req:Request, res:Response) {
    const id = Number(req.params.id);
    const userId = res.locals.session.userId;
    try{
        const result = await pokemonService.removePokemon(id,userId);
        res.sendStatus(200);
    }catch(err){
        console.log(err);
        res.sendStatus(500);
    }
}