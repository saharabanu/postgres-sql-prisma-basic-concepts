import { Category } from '@prisma/client';
import { Request, Response } from "express";
import { PostService } from './post.service';



const insertIntoDb = async(req:Request, res:Response) => {
  try {
    const result = await PostService.insertIntoDb(req.body);
    res.send({
        success:true,
        message:"Category created successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}
const getPosts = async(req:Request, res:Response) => {
  // console.log(req.query)
  try {
    const options = req.query;
    const result = await PostService.getPosts(options);
    res.send({
        success:true,
        message:" All Posts retrieved successfully",
        total: result.total,
        data: result.data
    })
    
  } catch (error) {
    res.send(error)
  }
}
const getPost = async(req:Request, res:Response) => {
  try {
    const id = req.params.id
    const result = await PostService.getPost(parseInt(id));
    res.send({
        success:true,
        message:" single Post retrieved successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}
const updatePost = async(req:Request, res:Response) => {
  const id = parseInt(req.params.id);
  const data = req.body;
  try {
    const result = await PostService.updatePost(id, data);
    res.send({
        success:true,
        message:"Post  Updated successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}
const deletePost = async(req:Request, res:Response) => {
  const id = parseInt(req.params.id);
  
  try {
    const result = await PostService.deletePost(id);
    res.send({
        success:true,
        message:"Post  deleted successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}
//  this api does not work
const learnAggregateGroupingsss = async(req:Request, res:Response) => {
 
  
  try {
    const result = await PostService.learnAggregateGrouping();
    console.log(result);
    res.send({
        success:true,
        message:"avg successfully",
        data: result
    })
    
  } catch (error) {
    res.send(error)
  }
}

export const PostController = {
    insertIntoDb, getPosts, getPost, updatePost, deletePost, learnAggregateGroupingsss
}