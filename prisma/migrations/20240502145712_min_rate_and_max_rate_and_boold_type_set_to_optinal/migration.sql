-- DropIndex
DROP INDEX "Users_email_key";

-- AlterTable
ALTER TABLE "Users" ALTER COLUMN "BloodType" DROP NOT NULL;
