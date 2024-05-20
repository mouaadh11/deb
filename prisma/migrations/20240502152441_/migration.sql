/*
  Warnings:

  - A unique constraint covering the columns `[ownerID]` on the table `Devices` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "Devices_ownerID_key" ON "Devices"("ownerID");
