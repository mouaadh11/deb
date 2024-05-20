/*
  Warnings:

  - Added the required column `beat` to the `Heart_Rate_Record` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Heart_Rate_Record" ADD COLUMN     "beat" INTEGER NOT NULL;
