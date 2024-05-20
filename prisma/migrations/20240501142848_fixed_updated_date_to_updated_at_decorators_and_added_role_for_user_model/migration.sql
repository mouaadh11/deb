/*
  Warnings:

  - Added the required column `updateAt` to the `Devices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `Role` to the `Users` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Devices" ADD COLUMN     "updateAt" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Notes" ALTER COLUMN "updateAt" DROP DEFAULT;

-- AlterTable
ALTER TABLE "PreviewerList" ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Users" ADD COLUMN     "Role" TEXT NOT NULL,
ALTER COLUMN "updatedAt" DROP DEFAULT;
