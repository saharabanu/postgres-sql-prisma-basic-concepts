import express from 'express';
import { CategoryController } from './category.controller';



const router = express.Router();


router.post("/", CategoryController.insertIntoDb);
// router.get("/:id", UserController.getUser);
// router.get("/", UserController.getUsers);
// router.post("/profile", UserController.insertOrUpdateProfile)

export const CategoryRouter = router