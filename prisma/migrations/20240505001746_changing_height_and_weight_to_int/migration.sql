/*
  Warnings:

  - You are about to alter the column `height` on the `Users` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Integer`.
  - You are about to alter the column `weight` on the `Users` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Integer`.

*/
-- AlterTable
ALTER TABLE "Users" ALTER COLUMN "height" SET DEFAULT 0,
ALTER COLUMN "height" SET DATA TYPE INTEGER,
ALTER COLUMN "weight" SET DEFAULT 0,
ALTER COLUMN "weight" SET DATA TYPE INTEGER;
