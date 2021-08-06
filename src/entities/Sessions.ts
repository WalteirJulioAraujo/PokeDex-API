import { Entity, PrimaryGeneratedColumn, Column, OneToOne, JoinColumn } from "typeorm";
import User from "./User";

@Entity("sessions")
export default class Sessions{
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    token:string;

    @OneToOne(()=>User,user=>user.session)
    @JoinColumn()
    user:User;
}