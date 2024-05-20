/*
  Warnings:

  - You are about to drop the `Device` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Device" DROP CONSTRAINT "Device_ownerID_fkey";

-- DropTable
DROP TABLE "Device";

-- DropTable
DROP TABLE "User";

-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "firstName" TEXT,
    "lastName" TEXT,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Devices" (
    "Sid" SERIAL NOT NULL,
    "activateCode" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ownerID" INTEGER NOT NULL,

    CONSTRAINT "Devices_pkey" PRIMARY KEY ("Sid")
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_email_key" ON "Users"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Devices_activateCode_key" ON "Devices"("activateCode");

-- AddForeignKey
ALTER TABLE "Devices" ADD CONSTRAINT "Devices_ownerID_fkey" FOREIGN KEY ("ownerID") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
