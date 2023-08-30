import { Category, PrismaClient, } from "@prisma/client";

const prisma = new PrismaClient();

// post

const insertIntoDb = async(data : Category): Promise<Category> => {
    const result = await prisma.category.create({data});
    return result
};
const getcategory = async() => {
    const result = await prisma.category.findMany();
    return result
};

export const CategoryService = {
    insertIntoDb, 
    getcategory
}