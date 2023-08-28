import express from 'express';
import { PostController } from './post.controller';




const router = express.Router();


router.post("/", PostController.insertIntoDb);
router.get("/:id", PostController.getPost);
router.patch("/:id", PostController.updatePost);
router.delete("/:id", PostController.deletePost);
router.get("/", PostController.getPosts);


export const PostRouter = router