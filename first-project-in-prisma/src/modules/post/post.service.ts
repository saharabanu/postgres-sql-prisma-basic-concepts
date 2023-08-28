import {  Post, PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// post

const insertIntoDb = async(data : Post): Promise<Post> => {
    const result = await prisma.post.create({data, 
    include:{
        author: true,
        category:true
    },});
    return result
};
const getPosts = async(options: any) => {
    const { sortBy, sortOrder, searchTerm, page, limit } = options;
    const skip = parseInt(limit) * parseInt(page) - parseInt(limit) || 0;
    const take = parseInt(limit) || 10;
  
    return await prisma.$transaction(async(ts)=> {
        const result = await ts.post.findMany({ skip,  
            take,
    
            include:{
                author: true,
                category:true
            },
            // ordering
            orderBy: sortBy && sortOrder ?{
                [sortBy]: sortOrder
            }: {
                createdAt:"desc"
            },
    
            // filtering
            where:{
                // title or name filtering . so I use or, syntax or[{....}], we use here instead of OR, and / nor
                OR:[
                    {
                        title:{
                            contains:searchTerm,
                            // to control case sensitive
                            mode: 'insensitive'
                        }
                    },
                        {
                            author:{
                                name:{
                                    contains:searchTerm,
                                    mode:'insensitive'
                                }
                            }
                        }
                    
                ]
            }
    
        }
            
        
        );
        const total = await ts.post.count();
        return {data:result, total}
    })

    
};
const getPost = async(id : number) => {
    const result = await prisma.post.findUnique(
       {
        where:{
            id
        },include:{
            author:true,
            category:true
        }
       }
    );
    return result
};
const updatePost = async(id: number,payload :Partial<Post> ):Promise<Post> => {
   
        const result = await prisma.post.update({
            where:{
                id
            }, data:payload
            
        });
        return result
    
    
    
}
const deletePost = async(id: number ):Promise<Post> => {
   
        const result = await prisma.post.delete({
            where:{
                id
            }
            
        });
        return result
    
    
    
}

export const PostService = {
    insertIntoDb, getPosts, getPost, updatePost, deletePost
}