/*
  Warnings:

  - You are about to drop the column `PenitentId` on the `Notes` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Notes" DROP CONSTRAINT "Notes_PenitentId_fkey";

-- AlterTable
ALTER TABLE "Notes" DROP COLUMN "PenitentId",
ADD COLUMN     "PatientId" INTEGER;

-- AddForeignKey
ALTER TABLE "Notes" ADD CONSTRAINT "Notes_PatientId_fkey" FOREIGN KEY ("PatientId") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;
