-- DropForeignKey
ALTER TABLE "Heart_Rate_Record" DROP CONSTRAINT "Heart_Rate_Record_ULRid_fkey";

-- DropForeignKey
ALTER TABLE "Notes" DROP CONSTRAINT "Notes_NoteAutherId_fkey";

-- DropForeignKey
ALTER TABLE "Notes" DROP CONSTRAINT "Notes_PenitentId_fkey";

-- DropForeignKey
ALTER TABLE "PreviewerList" DROP CONSTRAINT "PreviewerList_PreviewedAccountId_fkey";

-- DropForeignKey
ALTER TABLE "PreviewerList" DROP CONSTRAINT "PreviewerList_PreviewerAccountId_fkey";

-- AlterTable
ALTER TABLE "Heart_Rate_Record" ALTER COLUMN "ULRid" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Notes" ALTER COLUMN "NoteAutherId" DROP NOT NULL,
ALTER COLUMN "PenitentId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "PreviewerList" ALTER COLUMN "PreviewedAccountId" DROP NOT NULL,
ALTER COLUMN "PreviewerAccountId" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Notes" ADD CONSTRAINT "Notes_NoteAutherId_fkey" FOREIGN KEY ("NoteAutherId") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notes" ADD CONSTRAINT "Notes_PenitentId_fkey" FOREIGN KEY ("PenitentId") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PreviewerList" ADD CONSTRAINT "PreviewerList_PreviewedAccountId_fkey" FOREIGN KEY ("PreviewedAccountId") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PreviewerList" ADD CONSTRAINT "PreviewerList_PreviewerAccountId_fkey" FOREIGN KEY ("PreviewerAccountId") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Heart_Rate_Record" ADD CONSTRAINT "Heart_Rate_Record_ULRid_fkey" FOREIGN KEY ("ULRid") REFERENCES "UserListRecords"("ULRid") ON DELETE SET NULL ON UPDATE CASCADE;
