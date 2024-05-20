/*
  Warnings:

  - Made the column `ULRid` on table `Heart_Rate_Record` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Heart_Rate_Record" DROP CONSTRAINT "Heart_Rate_Record_ULRid_fkey";

-- DropIndex
DROP INDEX "Heart_Rate_Record_ULRid_key";

-- DropIndex
DROP INDEX "UserListRecords_AuthorDeviceid_key";

-- AlterTable
ALTER TABLE "Heart_Rate_Record" ALTER COLUMN "ULRid" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Heart_Rate_Record" ADD CONSTRAINT "Heart_Rate_Record_ULRid_fkey" FOREIGN KEY ("ULRid") REFERENCES "UserListRecords"("ULRid") ON DELETE RESTRICT ON UPDATE CASCADE;
