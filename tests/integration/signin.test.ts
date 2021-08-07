import supertest from "supertest";
import { getConnection } from "typeorm";

import app, { init } from "../../src/app";
import { createValidUser } from "../factories/userFactory";
import { clearDatabase, insertUserInDatabase, searchToken } from "../utils/database";

beforeAll(async () => {
  await init();
});

beforeEach(async () => {
  await clearDatabase();
});

afterAll(async () => {
  await getConnection().close();
});

describe("POST /sign-in", () => {
  it("should answer with status 200 if data is correct", async () => {
    const user = createValidUser();

    await insertUserInDatabase(user);

    const response = await supertest(app).post("/sign-in").send({email:user.email,password:user.password});

    expect(response.status).toBe(200);
  });

  it("should answer with the same token that is in the database", async () => {

    const user = createValidUser();

    await insertUserInDatabase(user);

    const response = await supertest(app).post("/sign-in").send(user);

    const token = await searchToken(user);

    expect(response.body).toStrictEqual({token:token});
  });

  it("should answer with status 401 if user/password is wrong", async () => {

    const user = createValidUser();

    await insertUserInDatabase(user);

    user.password = user.password.slice(1)

    const response = await supertest(app).post("/sign-in").send(user);

    expect(response.status).toBe(401);
  });

});
