import express from "express";
import { PrismaClient } from "./prisma/src/generated/client";

const app = express();
const port = 3000;
const prisma = new PrismaClient();

app.get("/", async (req, res) => {
  const users = await prisma.user.findMany();
  res.json(users);
});

app.post("/user", async (req, res) => {
  const user = await prisma.user.create({
    data: {
      username: "sx6213124",
      pet: {
        create: {
          name: "Rex",
          breed: {
            connect: {
              id: 1,
            },
          },
          color: "Blue",
          size: "Medium",
        },
      },
    },
  });

  res.json(user);
});

app.post("/pet", async (req, res) => {
  const pet = await prisma.pet.create({
    data: {
      name: "Rex",
      ownerId: 1,
      breedId: 1,
      color: "Brown",
      size: "Medium",
    },
  });

  res.json(pet);
});

app.post("/pet/breed", async (req, res) => {
  const petBreed = await prisma.breed.create({
    data: {
      name: "Aether",
      rarity: 1,
      petGroupId: 1,
    },
  });

  res.json(petBreed);
});

app.post("/pet/group/", async (req, res) => {
  const petGroup = await prisma.petGroup.create({
    data: {
      name: "Dragon",
    },
  });

  res.json(petGroup);
});

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
