import {
  Controller,
  Post,
  UseGuards,
  Body,
  Put,
  Delete,
  Param,
} from '@nestjs/common';
import { Get } from '@nestjs/common';
import { Users } from '@prisma/client';
//import { AuthGuard } from '@nestjs/passport';
//import { Request } from 'express';
import { GetUser } from 'src/auth/decorators';
import { jwtguard } from 'src/auth/guard';
import { UserService } from './user.service';
//import { UpdateDevice } from './dto/user.dto';
import { AuthService } from '../auth/auth.service';
import {
  ActivateDeviceDto,
  RNPdto,
  NoteDto,
  UpNoteDto,
  UpPatient,
  userid,
  HeartRate,
  currnetTime,
  newAppointment,
  UpdateAppointment,
  UpNotification,
  newDevice,
} from './dto';
//if you want to test the jwt guard just uncommnet the line below
//@UseGuards(jwtguard)
@Controller('user')
export class UserController {
  constructor(
    private userservice: UserService,
    private authService: AuthService,
  ) { }
  @Get('me')
  @UseGuards(jwtguard)
  getMe(@GetUser() user: Users) {
    return this.userservice.Getme(user);
  }

  //devices
  @Post('/devices')
  async ActivateDecvice(@Body() dto: ActivateDeviceDto) {
    await this.authService.validateRole(dto.ActivatorId, dto.Userid);
    return await this.userservice.ActivateDevice(dto);
  }
  @Post('/devices/all')
  async getAllDevices(@Body() dto: userid) {
    await this.authService.validateRole(null, null, dto.UserId);
    return await this.userservice.GetAllDevices();
  }
  // @Put('/devices/:id')
  // async updateDevice(@Param('id') device: number, @Body() dto: UpdateDevice) {
  //   await this.authService.validateRole(dto.ActivatorId, dto.NeWOwner);
  //   return await this.userservice.UpdateDevice(dto);
  // }

  @Put('/devices/:id')
  async DesActviateDevice(@Param('id') deviceSid: number, @Body() dto: userid) {
    const parsedDevice =
      typeof deviceSid === 'string' ? parseInt(deviceSid, 10) : deviceSid;
    await this.authService.validateRole(dto.UserId, null);
    return await this.userservice.DeActivateDevice(parsedDevice, dto.UserId);
  }
  @Delete('/devices/:id')
  async DeleteDevice(@Param('id') DeviceSid: number, @Body() dto: userid) {
    const parsedDevice =
      typeof DeviceSid === 'string' ? parseInt(DeviceSid, 10) : DeviceSid;
    await this.authService.validateRole(null, null, dto.UserId);
    return await this.userservice.DeleteDevice(parsedDevice);
  }

  @Post('/device/')
  async createDevice(@Body() dto: newDevice) {
    await this.authService.validateRole(null, null, dto.Userid);
    return await this.userservice.RegisterNewDevice(dto);
  }

  @Post('/doctors')
  async getDoctors(@Body() dto: userid) {
    await this.authService.validateRole(null, null, dto.UserId);
    return await this.userservice.GetDoctors();
  }
  //patients
  @Post('/patients')
  async createPatient(@Body() dto: RNPdto) {
    console.log(dto);
    await this.authService.validateRole(dto.Userid, null);
    return await this.userservice.RegisterNewPatients(dto);
  }

  @Get('/patients')
  @UseGuards(jwtguard)
  async getPatientList(@GetUser() user: Users) {
    console.log('))))))))))))))))))))))))))))))))))user', user.id);
    console.log('))))))))))))))))))))))))))))))))))user', typeof user.id);
    // await this.authService.validateRole(user.id, null);
    return await this.userservice.GetpatientLists(user.id);
  }
  @Get('/patient/:UserId')
  async getPatient(@Param('UserId') userId: string) {
    await this.authService.validateRole(null, null, parseInt(userId));
    return await this.userservice.GetPatients();
  }

  @Put('/patients/:id')
  async updatePatient(
    @Param('id') userId: number,
    @Body() dto: Partial<UpPatient>,
  ) {
    const parsedUserId =
      typeof userId === 'string' ? parseInt(userId, 10) : userId;
    await this.authService.validateRole(null, parsedUserId);
    return await this.userservice.Updatepatient(parsedUserId, dto);
  }

  @Delete('/patients/:id')
  async deletePatientFromList(
    @Param('id') PatientId: number,
    @Body() dto: userid,
  ) {
    const parsedUserId =
      typeof PatientId === 'string' ? parseInt(PatientId, 10) : PatientId;
    await this.authService.validateRole(null, parsedUserId, dto.UserId);
    return await this.userservice.DeletePatientFromList(
      parsedUserId,
      dto.UserId,
    );
  }
  @Delete('/:id') async deletePatient(
    @Param('id') PatientId: number,
    @Body() dto: userid,
  ) {
    const parsedUserId =
      typeof PatientId === 'string' ? parseInt(PatientId, 10) : PatientId;
    await this.authService.validateRole(null, null, dto.UserId);
    return await this.userservice.DeleteUser(parsedUserId);
  }
  @Get('/patients/:id/heartrates/')
  async getHeartbeat(@Param('id') PatientId: number, @Body() dto: HeartRate) {
    const parsedPatientId =
      typeof PatientId === 'string' ? parseInt(PatientId, 10) : PatientId;
    await this.authService.validateRole(dto.UserId, parsedPatientId);
    return await this.userservice.getHeartbeat(
      parsedPatientId,
      dto.startDate,
      dto.endDate,
    );
  }

  @Get('/patients/:id/heartrate/')
  async getHeartrate(@Param('id') PatientId: number) {
    const parsedPatientId =
      typeof PatientId === 'string' ? parseInt(PatientId, 10) : PatientId;
    await this.authService.validateRole(null, parsedPatientId);
    const now = new Date();
    const formattedDate = now.toISOString();
    console.log('actual date', formattedDate.toString());
    return await this.userservice.getLastestHeartRate(
      parsedPatientId,
      formattedDate,
    );
    //  Math.floor(Math.random() * (90 - 50 + 1)) + 50;
  }
  //notes
  @Post('/patients/:patientId/notes')
  async creatNewNote(
    @Param('patientId') PatientId: number,
    @Body() dto: NoteDto,
  ) {
    const parsedPatientId =
      typeof PatientId === 'string' ? parseInt(PatientId, 10) : PatientId;
    await this.authService.validateRole(dto.AuthorId, parsedPatientId);
    return await this.userservice.CreateNewNote(dto, parsedPatientId);
  }
  @Get('/patients/:patientId/notes')
  async getNoteList(@Param('patientId') PatientId: number) {
    const parsedPatientId =
      typeof PatientId === 'string' ? parseInt(PatientId, 10) : PatientId;
    await this.authService.validateRole(null, parsedPatientId);
    return await this.userservice.GetNotesLists(parsedPatientId);
  }
  @Put('/notes/:id')
  async updateNote(
    @Param('id') NoteId: number,
    @Body() dto: Partial<UpNoteDto>,
  ) {
    const parsedNoteId =
      typeof NoteId === 'string' ? parseInt(NoteId, 10) : NoteId;
    await this.authService.validateRole(dto.AuthorId, null);
    return this.userservice.UpdateNote(parsedNoteId, dto);
  }

  @Delete('/notes/:id')
  DeleteNote(@Param('id') NoteId: number) {
    const parsedNoteId =
      typeof NoteId === 'string' ? parseInt(NoteId, 10) : NoteId;
    return this.userservice.DeleteNote(parsedNoteId);
  }
  // appointment
  @Post('/appointments/')
  async createAppointment(@Body() dto: newAppointment) {
    await this.authService.validateRole(dto.DoctorId, dto.PatientId);
    return await this.userservice.createAppoinment(
      dto.DoctorId,
      dto.PatientId,
      dto.AppointmentDate,
    );
  }
  //   @Get('/appointments/:id')
  //   async getAppointmentList(@Param('id') dto: number) {
  //     console.log("get a request appoitment")
  //     const parsedUserId =
  //       typeof dto === 'string' ? parseInt(dto, 10) : dto;
  //     await this.authService.validateRole(parsedUserId, null);
  //     return await this.userservice.getAppointment(parsedUserId);
  //   }
  // }

  @Get('/appointments')
  @UseGuards(jwtguard)
  async getAppointmentList(@GetUser() user: Users) {
    console.log('get a request appoitment');
    await this.authService.validateRole(user.id, null);
    return await this.userservice.getAppointment(user.id);
  }

  @Put('/appointments/:id')
  async updateAppointment(
    @Param('id') AppointmentId: number,
    @Body() dto: Partial<UpdateAppointment>,
  ) {
    const parsedAppointmentId =
      typeof AppointmentId === 'string'
        ? parseInt(AppointmentId, 10)
        : AppointmentId;
    await this.authService.validateRole(dto.DoctorId, null);
    return await this.userservice.updateAppointment(parsedAppointmentId, dto);
  }

  @Delete('/appointments/:id')
  async deleteAppointment(@Param('id') AppointmentId: number) {
    const parsedAppointmentId =
      typeof AppointmentId === 'string'
        ? parseInt(AppointmentId, 10)
        : AppointmentId;
    return await this.userservice.deleteAppointment(parsedAppointmentId);
  }
  //notifcation
  @Get('/notification/:id')
  async getNotification(@Param('id') UserId: number) {
    console.log('get notificaion req');
    const parsedUserid =
      typeof UserId === 'string' ? parseInt(UserId, 10) : UserId;
    await this.authService.validateRole(parsedUserid, null);
    return await this.userservice.getNotifByUserId(parsedUserid);
  }

  @Put('/notification')
  async updateNotification(@Body() dto: UpNotification) {
    await this.authService.validateRole(dto.UserId, null);
    return await this.userservice.updateNotification(
      dto.isRead,
      dto.UserId,
      dto.NotfiId,
    );
  }
}
