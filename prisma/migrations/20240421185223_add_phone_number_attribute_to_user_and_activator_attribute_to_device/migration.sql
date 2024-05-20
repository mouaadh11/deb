/*
  Warnings:

  - A unique constraint covering the columns `[phoneNum]` on the table `Users` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Devices" ADD COLUMN     "Activator" INTEGER;

-- AlterTable
ALTER TABLE "Users" ADD COLUMN     "phoneNum" BIGINT,
ALTER COLUMN "email" DROP NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Users_phoneNum_key" ON "Users"("phoneNum");

-- AddForeignKey
ALTER TABLE "Devices" ADD CONSTRAINT "Devices_Activator_fkey" FOREIGN KEY ("Activator") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
