/*
  Warnings:

  - You are about to drop the column `RateValue` on the `Heart_Rate_Record` table. All the data in the column will be lost.
  - Added the required column `ir_Reading` to the `Heart_Rate_Record` table without a default value. This is not possible if the table is not empty.
  - Added the required column `redReading` to the `Heart_Rate_Record` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Heart_Rate_Record" DROP COLUMN "RateValue",
ADD COLUMN     "ir_Reading" INTEGER NOT NULL,
ADD COLUMN     "redReading" INTEGER NOT NULL;
