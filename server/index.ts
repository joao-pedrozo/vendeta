import express from "express";
import { PrismaClient } from "./prisma/src/generated/client";

const app = express();
const port = 3000;
const prisma = new PrismaClient();

app.get("/", async (req, res) => {
  const users = await prisma.user.findMany();
  res.json(users);
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
