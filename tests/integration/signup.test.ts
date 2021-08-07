import supertest from "supertest";
import { getConnection } from "typeorm";

import app, { init } from "../../src/app";
import { createSignUpUser } from "../factories/userFactory";
import { clearDatabase, insertUserInDatabase } from "../utils/database";

beforeAll(async () => {
  await init();
});

beforeEach(async () => {
  await clearDatabase();
});

afterAll(async () => {
  await getConnection().close();
});

describe("POST /sign-up", () => {
  it("should answer with status 201 if data is correct", async () => {
    const user = createSignUpUser();

    const response = await supertest(app).post("/sign-up").send(user);

    expect(response.status).toBe(201);
  });

  it("should answer with status 400 if data is empty", async () => {

    const response = await supertest(app).post("/sign-up").send({});

    expect(response.status).toBe(400);
  });

  it("should answer with status 400 if data is email is not available", async () => {
    const user = createSignUpUser();

    user.email='teste.com'

    const response = await supertest(app).post("/sign-up").send(user);

    expect(response.status).toBe(400);
  });

  it("should answer with status 409 if the email has already been registered", async () => {
    const user = createSignUpUser();

    await insertUserInDatabase({email:user.email,password:user.password});

    const response = await supertest(app).post("/sign-up").send(user);

    expect(response.status).toBe(409);
  });
});
