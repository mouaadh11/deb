/*
  Warnings:

  - Added the required column `BloodType` to the `Users` table without a default value. This is not possible if the table is not empty.
  - Made the column `firstName` on table `Users` required. This step will fail if there are existing NULL values in that column.
  - Made the column `lastName` on table `Users` required. This step will fail if there are existing NULL values in that column.
  - Made the column `hash` on table `Users` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Users" ADD COLUMN     "BloodType" TEXT NOT NULL,
ALTER COLUMN "firstName" SET NOT NULL,
ALTER COLUMN "lastName" SET NOT NULL,
ALTER COLUMN "hash" SET NOT NULL;

-- CreateTable
CREATE TABLE "accounts" (
    "AccId" SERIAL NOT NULL,
    "AccountOwner" INTEGER NOT NULL,

    CONSTRAINT "accounts_pkey" PRIMARY KEY ("AccId")
);

-- CreateTable
CREATE TABLE "PreviewerList" (
    "id" SERIAL NOT NULL,
    "PreviewedId" INTEGER NOT NULL,
    "state" TEXT NOT NULL,
    "PreviewerId" INTEGER NOT NULL,

    CONSTRAINT "PreviewerList_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Heart_Rate_Record" (
    "Rid" SERIAL NOT NULL,
    "RateValue" INTEGER NOT NULL,
    "timeStamp" TIMESTAMP(3) NOT NULL,
    "AutherDevice" INTEGER NOT NULL,
    "OwnerID" INTEGER NOT NULL,

    CONSTRAINT "Heart_Rate_Record_pkey" PRIMARY KEY ("Rid")
);

-- CreateIndex
CREATE UNIQUE INDEX "accounts_AccountOwner_key" ON "accounts"("AccountOwner");

-- CreateIndex
CREATE UNIQUE INDEX "PreviewerList_PreviewedId_key" ON "PreviewerList"("PreviewedId");

-- CreateIndex
CREATE UNIQUE INDEX "Heart_Rate_Record_OwnerID_key" ON "Heart_Rate_Record"("OwnerID");

-- AddForeignKey
ALTER TABLE "accounts" ADD CONSTRAINT "accounts_AccountOwner_fkey" FOREIGN KEY ("AccountOwner") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PreviewerList" ADD CONSTRAINT "PreviewerList_PreviewedId_fkey" FOREIGN KEY ("PreviewedId") REFERENCES "accounts"("AccId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PreviewerList" ADD CONSTRAINT "PreviewerList_PreviewerId_fkey" FOREIGN KEY ("PreviewerId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Heart_Rate_Record" ADD CONSTRAINT "Heart_Rate_Record_OwnerID_fkey" FOREIGN KEY ("OwnerID") REFERENCES "accounts"("AccId") ON DELETE RESTRICT ON UPDATE CASCADE;
