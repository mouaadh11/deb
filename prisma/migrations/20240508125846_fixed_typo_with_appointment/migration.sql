/*
  Warnings:

  - You are about to drop the column `patientsId` on the `Appointment` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Appointment" DROP CONSTRAINT "Appointment_patientsId_fkey";

-- AlterTable
ALTER TABLE "Appointment" DROP COLUMN "patientsId",
ADD COLUMN     "PatientId" INTEGER;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_PatientId_fkey" FOREIGN KEY ("PatientId") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;
