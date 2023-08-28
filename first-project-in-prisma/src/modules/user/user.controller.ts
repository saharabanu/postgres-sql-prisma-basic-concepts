import { Request, Response } from "express";
import { UserService } from "./user.service";

const insertIntoDb = async(req:Request, res:Response) => {
  try {
    const result = await UserService.insertIntoDb(req.body);
    res.send({
        success:true,
        message:"User created successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}
const getUsers = async(req:Request, res:Response) => {
  try {
    const result = await UserService.getUsers();
    res.send({
        success:true,
        message:"User retrieved successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}
const getUser = async(req:Request, res:Response) => {
  try {
    const id = req.params.id
    const result = await UserService.getUser(parseInt(id));
    res.send({
        success:true,
        message:" single User retrieved successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}
const insertOrUpdateProfile = async(req:Request, res:Response) => {
  try {
    const result = await UserService.insertOrUpdateProfile(req.body);
    res.send({
        success:true,
        message:"Profile created or Updated successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}

export const UserController = {
    insertIntoDb, insertOrUpdateProfile, getUsers, getUser
}