/*
  Warnings:

  - You are about to drop the column `kindId` on the `Pet` table. All the data in the column will be lost.
  - Added the required column `petGroupId` to the `Breed` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Pet" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "ownerId" INTEGER NOT NULL,
    "breedId" INTEGER NOT NULL,
    "color" TEXT NOT NULL,
    "size" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Pet_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Pet_breedId_fkey" FOREIGN KEY ("breedId") REFERENCES "Breed" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Pet" ("breedId", "color", "createdAt", "id", "name", "ownerId", "size", "updatedAt") SELECT "breedId", "color", "createdAt", "id", "name", "ownerId", "size", "updatedAt" FROM "Pet";
DROP TABLE "Pet";
ALTER TABLE "new_Pet" RENAME TO "Pet";
CREATE UNIQUE INDEX "Pet_ownerId_key" ON "Pet"("ownerId");
CREATE TABLE "new_Breed" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "rarity" INTEGER NOT NULL,
    "petGroupId" INTEGER NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Breed_petGroupId_fkey" FOREIGN KEY ("petGroupId") REFERENCES "PetGroup" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Breed" ("createdAt", "id", "name", "rarity", "updatedAt") SELECT "createdAt", "id", "name", "rarity", "updatedAt" FROM "Breed";
DROP TABLE "Breed";
ALTER TABLE "new_Breed" RENAME TO "Breed";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
