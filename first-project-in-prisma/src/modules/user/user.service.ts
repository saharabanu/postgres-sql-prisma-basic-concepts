import { PrismaClient, Profile, User } from "@prisma/client";

const prisma = new PrismaClient()

const insertIntoDb = async(data : User): Promise<User> => {
    const result = await prisma.user.create({data});
    return result
};
const getUsers = async() => {
    // const result = await prisma.user.findMany(
    //     // jeita jeita dekhte cai
    // //     {select:{
    // //     email: true
    // // }}
    // // onno table dekhte caile
    // {
    //     include:{
    //         profile:true
    //     }
    // }
    // );

    // raw database
    const result = await prisma.$queryRaw`select * from users`
    return result
};
const getUser = async(id : number) => {
    const result = await prisma.user.findUnique(
       {
        where:{
            id
        },include:{
            profile:true
        }
       }
    );
    return result
};
const insertOrUpdateProfile = async(data : Profile): Promise<Profile> => {
    const isExist = await prisma.profile.findUnique({
        where:{
            userId: data.userId

        }
    })
    if(isExist){
        const result = await prisma.profile.update({
            where:{
                userId: data.userId
            }, data:{
                bio: data.bio
            }
        });
        return result
    }
    
    const result = await prisma.profile.create({data});
    return result
}

export const UserService = {
    insertIntoDb, insertOrUpdateProfile, getUsers, getUser
}