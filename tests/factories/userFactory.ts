import { getRepository } from "typeorm";

import User from "../../src/entities/User";

export function createSignUpUser () {
  const user = {
    email: "email@email.com",
    password: "123456",
    confirmPassword: "123456"
  };

  return user;
}

export function createValidUser () {
  const user = {
    email: "email@email.com",
    password: "123456"
  };

  return user;
}
