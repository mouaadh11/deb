/*
  Warnings:

  - You are about to drop the column `Petients` on the `Notification` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Notification" DROP COLUMN "Petients",
ADD COLUMN     "PatientAccid" INTEGER;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_PatientAccid_fkey" FOREIGN KEY ("PatientAccid") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;
