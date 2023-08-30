import { Category } from '@prisma/client';
import { Request, Response } from "express";
import { CategoryService } from './category.service';


const insertIntoDb = async(req:Request, res:Response) => {
  try {
    const result = await CategoryService.insertIntoDb(req.body);
    res.send({
        success:true,
        message:"Category created successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}
const getcategory = async(req:Request, res:Response) => {
  try {
    const result = await CategoryService.getcategory();
    res.send({
        success:true,
        message:"categoty retrieved successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}
// const getUser = async(req:Request, res:Response) => {
//   try {
//     const id = req.params.id
//     const result = await UserService.getUser(parseInt(id));
//     res.send({
//         success:true,
//         message:" single User retrieved successfully",
//         data: result
//     })
    
//   } catch (error) {
//     res.send(error)
//   }
// }
// const insertOrUpdateProfile = async(req:Request, res:Response) => {
//   try {
//     const result = await UserService.insertOrUpdateProfile(req.body);
//     res.send({
//         success:true,
//         message:"Profile created or Updated successfully",
//         data: result
//     })
    
//   } catch (error) {
//     res.send(error)
//   }
// }

export const CategoryController = {
    insertIntoDb,
    getcategory
}