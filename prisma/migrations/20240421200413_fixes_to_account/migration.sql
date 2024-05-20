-- DropForeignKey
ALTER TABLE "accounts" DROP CONSTRAINT "accounts_AccountOwner_fkey";

-- AlterTable
ALTER TABLE "accounts" ALTER COLUMN "AccountOwner" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "accounts" ADD CONSTRAINT "accounts_AccountOwner_fkey" FOREIGN KEY ("AccountOwner") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;
