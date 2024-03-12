/*
  Warnings:

  - Added the required column `kindId` to the `Pet` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "PetGroup" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Pet" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "ownerId" INTEGER NOT NULL,
    "breedId" INTEGER NOT NULL,
    "kindId" INTEGER NOT NULL,
    "color" TEXT NOT NULL,
    "size" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "Pet_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Pet_breedId_fkey" FOREIGN KEY ("breedId") REFERENCES "Breed" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Pet_kindId_fkey" FOREIGN KEY ("kindId") REFERENCES "PetGroup" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Pet" ("breedId", "color", "createdAt", "id", "name", "ownerId", "size", "updatedAt") SELECT "breedId", "color", "createdAt", "id", "name", "ownerId", "size", "updatedAt" FROM "Pet";
DROP TABLE "Pet";
ALTER TABLE "new_Pet" RENAME TO "Pet";
CREATE UNIQUE INDEX "Pet_ownerId_key" ON "Pet"("ownerId");
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
