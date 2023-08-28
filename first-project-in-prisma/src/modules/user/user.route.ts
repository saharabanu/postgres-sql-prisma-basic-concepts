import express from 'express';
import { UserController } from './user.controller';


const router = express.Router();


router.post("/", UserController.insertIntoDb);
router.get("/:id", UserController.getUser);
router.get("/", UserController.getUsers);
router.post("/profile", UserController.insertOrUpdateProfile)

export const UserRouter = router