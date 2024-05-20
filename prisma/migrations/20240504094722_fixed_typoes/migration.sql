/*
  Warnings:

  - You are about to drop the column `NoteAutherId` on the `Notes` table. All the data in the column will be lost.
  - You are about to drop the column `AutherDeviceid` on the `UserListRecords` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[AuthorDeviceid]` on the table `UserListRecords` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Notes" DROP CONSTRAINT "Notes_NoteAutherId_fkey";

-- DropForeignKey
ALTER TABLE "UserListRecords" DROP CONSTRAINT "UserListRecords_AutherDeviceid_fkey";

-- DropIndex
DROP INDEX "UserListRecords_AutherDeviceid_key";

-- AlterTable
ALTER TABLE "Notes" DROP COLUMN "NoteAutherId",
ADD COLUMN     "AuthorId" INTEGER;

-- AlterTable
ALTER TABLE "UserListRecords" DROP COLUMN "AutherDeviceid",
ADD COLUMN     "AuthorDeviceid" INTEGER;

-- CreateIndex
CREATE UNIQUE INDEX "UserListRecords_AuthorDeviceid_key" ON "UserListRecords"("AuthorDeviceid");

-- AddForeignKey
ALTER TABLE "Notes" ADD CONSTRAINT "Notes_AuthorId_fkey" FOREIGN KEY ("AuthorId") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserListRecords" ADD CONSTRAINT "UserListRecords_AuthorDeviceid_fkey" FOREIGN KEY ("AuthorDeviceid") REFERENCES "Devices"("Sid") ON DELETE SET NULL ON UPDATE CASCADE;
