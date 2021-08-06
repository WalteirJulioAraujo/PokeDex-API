import "./setup";

import express from "express";
import cors from "cors";
import "reflect-metadata";

import connectDatabase from "./database";

import * as userController from "./controllers/userController";
import * as pokemonController from "./controllers/pokemonController";

import authMiddleware from "./middlewares/authMiddleware";

const app = express();
app.use(cors());
app.use(express.json());

app.post("/sign-up", userController.insertUser);

app.post("/sign-in", userController.signIn);

app.get("/pokemons", authMiddleware, pokemonController.getAll);

app.post("/my-pokemons/:id/add", authMiddleware, pokemonController.addPokemon);

app.post("/my-pokemons/:id/remove", authMiddleware, pokemonController.removePokemon);

app.post("/addPokemons",pokemonController.insertPokemon);

app.get("/users", userController.getUsers);

export async function init () {
  await connectDatabase();
}

export default app;
