-- DropForeignKey
ALTER TABLE "Devices" DROP CONSTRAINT "Devices_ownerID_fkey";

-- AlterTable
ALTER TABLE "Devices" ALTER COLUMN "ownerID" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Devices" ADD CONSTRAINT "Devices_ownerID_fkey" FOREIGN KEY ("ownerID") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
