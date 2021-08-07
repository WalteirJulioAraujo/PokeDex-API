import supertest from "supertest";
import { getConnection } from "typeorm";

import app, { init } from "../../src/app";
import { createValidUser } from "../factories/userFactory";
import { clearDatabase, insertUserInDatabase, returnIdMyPokemons } from "../utils/database";

beforeAll(async () => {
  await init();
});

beforeEach(async () => {
  await clearDatabase();
});

afterAll(async () => {
  await getConnection().close();
});

describe("POST /my-pokemons/:id/add and /my-pokemons/:id/remove", () => {
  it("should answer with status 200 if token is correct and test ", async () => {
    const user = createValidUser();

    await insertUserInDatabase(user);

    const getToken = await supertest(app).post("/sign-in").send(user);

    const authorization = "Bearer "+getToken.body.token;

    const idPokemon = 25;

    const responseAdd = await supertest(app).post(`/my-pokemons/${idPokemon}/add`).set('Authorization', authorization);

    

    const myPokemons= await returnIdMyPokemons();
    
    expect(myPokemons).toContain(idPokemon);

    const responseRemove = await supertest(app).post(`/my-pokemons/${idPokemon}/remove`).set('Authorization', authorization);

    expect(responseRemove.status).toBe(200);

    const myPokemonsAfterRemove= await returnIdMyPokemons();

    expect(myPokemonsAfterRemove).not.toContain(idPokemon);
  });

  it("should answer with status 401 if token is incorrect", async () => {
    const user = createValidUser();

    await insertUserInDatabase(user);

    const getToken = await supertest(app).post("/sign-in").send(user);

    const invalidToken = getToken.body.token.slice(1);

    const authorization = "Bearer "+invalidToken;

    const response = await supertest(app).get("/pokemons").set('Authorization', authorization);

    expect(response.status).toBe(401);
    
  });
  
  it("should answer with status 401 if the token is not sent", async () => {
    const user = createValidUser();

    await insertUserInDatabase(user);

    const response = await supertest(app).get("/pokemons");

    expect(response.status).toBe(401);
    
  });
});
