-- DropForeignKey
ALTER TABLE "UserListRecords" DROP CONSTRAINT "UserListRecords_AutherDeviceid_fkey";

-- DropForeignKey
ALTER TABLE "UserListRecords" DROP CONSTRAINT "UserListRecords_User_fkey";

-- AlterTable
ALTER TABLE "UserListRecords" ALTER COLUMN "AutherDeviceid" DROP NOT NULL,
ALTER COLUMN "User" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "UserListRecords" ADD CONSTRAINT "UserListRecords_AutherDeviceid_fkey" FOREIGN KEY ("AutherDeviceid") REFERENCES "Devices"("Sid") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserListRecords" ADD CONSTRAINT "UserListRecords_User_fkey" FOREIGN KEY ("User") REFERENCES "accounts"("AccountOwner") ON DELETE SET NULL ON UPDATE CASCADE;
