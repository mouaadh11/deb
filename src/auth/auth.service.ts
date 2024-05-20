import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { AuthDto, AuthDto2 } from './dto';
import * as argon from 'argon2';
import { PrismaClientKnownRequestError } from '@prisma/client/runtime/library';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { Roles } from '../auth/enums';
//import { error } from 'console';
//import { error } from 'console';
// import { UserService } from '../user/user.service';

@Injectable()
export class AuthService {
  constructor(
    private prisma: PrismaService,
    private jwt: JwtService,
    private config: ConfigService,
  ) {}
  async signup(dto: AuthDto, Role?: string) {
    if (Role === null || Role === undefined) {
      Role = Roles.Doctor;
    }
    const hash = await argon.hash(dto.password);
    try {
      console.log('new request');
      console.log(dto);
      const user = await this.prisma.users.create({
        data: {
          phoneNum: dto.phoneNum,
          email: dto.email,
          firstName: dto.firstname,
          lastName: dto.lastname,
          birthdate: dto.DateOfBirth,
          height: dto.height,
          weight: dto.weight,
          MaxRate: dto.MaxRate,
          MinRate: dto.MinRate,
          BloodType: dto.BloodType,
          hash,
          Role: Role,
        },
      });
      console.log('we got request');
      if (user) {
        try {
          await this.prisma.accounts.create({
            data: {
              AccountOwner: user.id,
            },
          });
        } catch (error) {
          throw new Error('error creating account');
        }
      }
      return this.signToken(user.id, user.email);
    } catch (error) {
      if (error instanceof PrismaClientKnownRequestError) {
        if (error.code === 'P2002') {
          throw new Error('Email already exists');
        }
        throw error;
      }
    }
  }
  async signin(dto: AuthDto2) {
    const user = await this.prisma.users.findUnique({
      where: {
        phoneNum: dto.phonenum,
      },
    });
    if (!user) {
      throw new Error('Wrong credentials');
    }
    if (user.Role == Roles.Patient) {
      throw new Error('unAuthorized user');
    }
    const pwMatches = await argon.verify(user.hash, dto.password);
    if (!pwMatches) {
      throw new Error('Wrong credentials');
    }
    return this.signToken(user.id, user.phoneNum);
  }

  // async validateUser(id: number, password: string) {
  //   const user = await this.prisma.users.findFirst({
  //     where: {
  //       id: id,
  //     }
  //   });
  //   if (!user) return null;

  //   const pwValid = await argon.verify(user.hash, password);
  //   if (!pwValid) return null;

  //   return user;
  // }

  async validateRole(DoctorId?: number, PatientId?: number, adminId?: number) {
    try {
      console.log('validating role');
      console.log(DoctorId);
      if (DoctorId != null && PatientId != undefined) {
        console.log('role doc not null');
        console.log(DoctorId);
        // const parsedDoctorId =
        //   typeof DoctorId === 'string' ? parseInt(DoctorId, 10) : DoctorId;
        const doc = await this.prisma.users.findUnique({
          where: {
            id: DoctorId,
          },
        });
        console.log("doc",doc);
        console.log('first query done');
        if (doc.Role != Roles.Doctor) {
          throw new Error('Access denied');
        }
      }
      console.log(PatientId);
      console.log(typeof PatientId);
      if (PatientId != null && PatientId != undefined) {
        console.log('Patient null we should be here');
        // const parsedUserId =
        //   typeof PatientId === 'string' ? parseInt(PatientId, 10) : PatientId;
        const patient = await this.prisma.users.findUnique({
          where: {
            id: PatientId,
          },
        });
        if (patient.Role != Roles.Patient) {
          throw new Error('Access denied');
        }
      }
      if (adminId != null && adminId != undefined) {
        console.log('Patient null we should be here');
        // const parsedUserId =
        //   typeof PatientId === 'string' ? parseInt(PatientId, 10) : PatientId;
        const Admin = await this.prisma.users.findUnique({
          where: {
            id: adminId,
          },
        });
        if (Admin.Role != Roles.Admin) {
          throw new Error('Access denied');
        }
      }
    } catch (err) {
      throw new Error('Error while validating role');
    }
  }
  async signToken(
    userId: number,
    phone: string,
  ): Promise<{ access_token: string }> {
    const payload = {
      sub: userId,
      phone,
    };

    const secret = this.config.get('JWT_SECRET');
    const token = await this.jwt.signAsync(payload, {
      expiresIn: '15m',
      secret: secret,
    });
    return { access_token: token };
  }
  removeUndefinedOrNull<T extends object>(obj: T): Partial<T> {
    const newObj: Partial<T> = {};

    for (const key in obj) {
      if (
        obj.hasOwnProperty(key) &&
        obj[key] !== undefined &&
        obj[key] !== null
      ) {
        newObj[key] = obj[key];
      }
    }

    return newObj;
  }
}
