import {
  IsNotEmpty,
  IsNumber,
  IsEmail,
  IsOptional,
  IsString,
  IsDate,
} from 'class-validator';
import { AuthDto } from '../../auth/dto';
export class ActivateDeviceDto {
  @IsNumber()
  @IsNotEmpty()
  DeviceSID: number;

  @IsNumber()
  @IsNotEmpty()
  ActivationCode: number;

  @IsNumber()
  @IsNotEmpty()
  Userid: number;

  @IsNumber()
  @IsNotEmpty()
  ActivatorId: number;
}

export class RNPdto extends AuthDto {
  @IsNumber()
  @IsNotEmpty()
  Userid: number;
}

export class HeartRate {
  @IsNotEmpty()
  @IsNumber()
  UserId: number;

  @IsDate()
  @IsNotEmpty()
  startDate: string;

  @IsDate()
  @IsNotEmpty()
  endDate: string;
}
export class currnetTime {
  @IsDate()
  @IsNotEmpty()
  time: string;
}

export class UpPatient {
  // @IsNumber()
  // @IsNotEmpty()
  // id: number;

  @IsEmail()
  @IsOptional()
  email: string;

  @IsString()
  @IsOptional()
  phoneNum: string;

  @IsDate()
  @IsOptional()
  birthdate: Date;

  @IsString()
  @IsOptional()
  firstname: string;

  @IsString()
  @IsOptional()
  lastname: string;

  @IsString()
  @IsOptional()
  BloodType: string;

  @IsNumber()
  @IsOptional()
  weight: number;

  @IsNumber()
  @IsOptional()
  height: number;

  @IsNumber()
  @IsOptional()
  MinRate: number;

  @IsNumber()
  @IsOptional()
  MaxRate: number;
}
export class NoteDto {
  @IsNumber()
  @IsNotEmpty()
  AuthorId: number;

  // @IsNumber()
  // @IsNotEmpty()
  // PatientId: number;

  @IsString()
  @IsNotEmpty()
  NoteTitle: string;

  @IsString()
  @IsNotEmpty()
  NoteContent: string;
}

export class UpNoteDto {
  // @IsNumber()
  // @IsNotEmpty()
  // Nid: number;

  @IsNumber()
  @IsNotEmpty()
  AuthorId: number;

  // @IsNumber()
  // @IsNotEmpty()
  // PatientId: number;

  @IsString()
  @IsOptional()
  NoteTitle: string;

  @IsString()
  @IsOptional()
  NoteContent: string;
}
export class userid {
  @IsNumber()
  @IsNotEmpty()
  UserId: number;
}
export class UpdateDevice {
  @IsNumber()
  @IsNotEmpty()
  DeviceSID: number;

  @IsNumber()
  @IsNotEmpty()
  ActivatorId: number;

  @IsNumber()
  @IsNotEmpty()
  NeWOwner: number;
}
export class newAppointment {
  @IsNumber()
  @IsNotEmpty()
  PatientId: number;

  @IsNumber()
  @IsNotEmpty()
  DoctorId: number;

  @IsString()
  @IsNotEmpty()
  AppointmentDate: string;
}

export class UpdateAppointment {
  @IsNumber()
  @IsNotEmpty()
  DoctorId: number;

  @IsString()
  @IsOptional()
  AppointmentDate: string;

  @IsString()
  @IsOptional()
  AppState: string;
}
export class newDevice {
  @IsNumber()
  @IsNotEmpty()
  Sid: number;
  @IsNumber()
  @IsNotEmpty()
  ActivationCode: number;

  @IsNumber()
  @IsNotEmpty()
  Userid: number;
}
export class UpNotification {
  @IsNumber()
  @IsNotEmpty()
  UserId: number;

  @IsNumber()
  @IsNotEmpty()
  NotfiId: number;

  @IsNotEmpty()
  isRead: boolean;
}
