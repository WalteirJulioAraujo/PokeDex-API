import { Entity, PrimaryGeneratedColumn, Column, OneToOne } from "typeorm";
import Sessions from "./Sessions";

@Entity("users")
export default class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  email: string;

  @Column()
  password: string;

  @OneToOne(()=>Sessions, session=>session.user)
  session:Sessions
}
