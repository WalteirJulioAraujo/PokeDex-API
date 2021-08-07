import { getRepository } from "typeorm";

import User from "../../src/entities/User";

export function createUser () {
  const user = {
    email: "email@email.com",
    password: "123456"
  };

  return user;
}
