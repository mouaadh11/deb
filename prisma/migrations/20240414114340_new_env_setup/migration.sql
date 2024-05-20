/*
  Warnings:

  - You are about to drop the column `AutherDevice` on the `Heart_Rate_Record` table. All the data in the column will be lost.
  - You are about to drop the column `OwnerID` on the `Heart_Rate_Record` table. All the data in the column will be lost.
  - You are about to drop the column `PreviewedId` on the `PreviewerList` table. All the data in the column will be lost.
  - You are about to drop the column `PreviewerId` on the `PreviewerList` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[ULRid]` on the table `Heart_Rate_Record` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `ULRid` to the `Heart_Rate_Record` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PreviewedAccountId` to the `PreviewerList` table without a default value. This is not possible if the table is not empty.
  - Added the required column `PreviewerAccountId` to the `PreviewerList` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
/*ALTER TABLE "Heart_Rate_Record" DROP CONSTRAINT "Heart_Rate_Record_OwnerID_fkey";*/

-- DropForeignKey
/*ALTER TABLE "PreviewerList" DROP CONSTRAINT "PreviewerList_PreviewedId_fkey";*/

-- DropForeignKey
/*ALTER TABLE "PreviewerList" DROP CONSTRAINT "PreviewerList_PreviewerId_fkey";*/

-- DropIndex
/*DROP INDEX "Heart_Rate_Record_OwnerID_key";*/

-- DropIndex
/*DROP INDEX "PreviewerList_PreviewedId_key";*/

-- AlterTable
/*ALTER TABLE "Heart_Rate_Record" DROP COLUMN "AutherDevice",
DROP COLUMN "OwnerID",
ADD COLUMN     "ULRid" INTEGER NOT NULL,
ALTER COLUMN "timeStamp" SET DATA TYPE TIMESTAMPTZ(3);*/

-- AlterTable
/*ALTER TABLE "PreviewerList" DROP COLUMN "PreviewedId",
DROP COLUMN "PreviewerId",
ADD COLUMN     "PreviewedAccountId" INTEGER NOT NULL,
ADD COLUMN     "PreviewerAccountId" INTEGER NOT NULL;*/

-- CreateTable
--CREATE TABLE "UserListRecords" (
--    "ULRid" SERIAL NOT NULL,
--    "AutherDeviceid" INTEGER NOT NULL,
--    "User" INTEGER NOT NULL,

--    CONSTRAINT "UserListRecords_pkey" PRIMARY KEY ("ULRid")
--);

-- CreateIndex
--CREATE UNIQUE INDEX "UserListRecords_AutherDeviceid_key" ON "UserListRecords"("AutherDeviceid");

-- CreateIndex
--CREATE UNIQUE INDEX "Heart_Rate_Record_ULRid_key" ON "Heart_Rate_Record"("ULRid");

-- AddForeignKey
--ALTER TABLE "PreviewerList" ADD CONSTRAINT "PreviewerList_PreviewedAccountId_fkey" FOREIGN KEY ("PreviewedAccountId") REFERENCES "accounts"("AccId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
--ALTER TABLE "PreviewerList" ADD CONSTRAINT "PreviewerList_PreviewerAccountId_fkey" FOREIGN KEY ("PreviewerAccountId") REFERENCES "accounts"("AccId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
--ALTER TABLE "Heart_Rate_Record" ADD CONSTRAINT "Heart_Rate_Record_ULRid_fkey" FOREIGN KEY ("ULRid") REFERENCES "UserListRecords"("ULRid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
--ALTER TABLE "UserListRecords" ADD CONSTRAINT "UserListRecords_AutherDeviceid_fkey" FOREIGN KEY ("AutherDeviceid") REFERENCES "Devices"("Sid") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
--ALTER TABLE "UserListRecords" ADD CONSTRAINT "UserListRecords_User_fkey" FOREIGN KEY ("User") REFERENCES "accounts"("AccountOwner") ON DELETE RESTRICT ON UPDATE CASCADE;
