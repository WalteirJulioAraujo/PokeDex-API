import joi from 'joi';

export const signUpSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().min(3).required(),
    confirmPassword: joi.ref('password')
});

export const logInSchema = joi.object({
    email: joi.string().email().required(),
    password: joi.string().min(3).required()
});