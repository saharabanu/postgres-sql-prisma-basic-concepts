import { PrismaClient } from "@prisma/client";
import app from "./app";

const port = process.env.port || 5000;
const prisma = new PrismaClient();

async function main() {
app.listen((port),() => {
  console.log(`this Prisma project server  is listening at ${port}`)
})
}
main()