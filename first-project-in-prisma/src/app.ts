
import express, { Application } from 'express';
import cors from 'cors';
import { UserRouter } from './modules/user/user.route';
import { CategoryRouter } from './modules/category/category.route';
import { PostRouter } from './modules/post/post.route';

const app:Application =  express();
app.use(express.json())
app.use(cors())
app.use(express.urlencoded({extended:true}));

app.use("/api/v1/user", UserRouter);
app.use("/api/v1/category", CategoryRouter);
app.use("/api/v1/post", PostRouter);

export default app;



