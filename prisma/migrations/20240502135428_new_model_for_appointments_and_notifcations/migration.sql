-- AlterTable
ALTER TABLE "Users" ADD COLUMN     "MaxRate" INTEGER,
ADD COLUMN     "MinRate" INTEGER;

-- CreateTable
CREATE TABLE "Notification" (
    "Notid" SERIAL NOT NULL,
    "UserAccid" INTEGER,
    "notifDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "Petients" TEXT NOT NULL,
    "context" TEXT NOT NULL,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("Notid")
);

-- CreateTable
CREATE TABLE "Appointment" (
    "Aid" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "AppointmentDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "patientsId" INTEGER,
    "DoctorId" INTEGER,

    CONSTRAINT "Appointment_pkey" PRIMARY KEY ("Aid")
);

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_UserAccid_fkey" FOREIGN KEY ("UserAccid") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_patientsId_fkey" FOREIGN KEY ("patientsId") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appointment" ADD CONSTRAINT "Appointment_DoctorId_fkey" FOREIGN KEY ("DoctorId") REFERENCES "accounts"("AccId") ON DELETE SET NULL ON UPDATE CASCADE;
