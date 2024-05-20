import { Module } from '@nestjs/common';
import { DdigService } from './ddig.service';
import { DdigController } from './ddig.controller';
import { ConfigService } from '@nestjs/config';
//import { prismaModule } from 'src/prisma/prisma.module';
import { PrismaService } from 'src/prisma/prisma.service';
import { UserService } from 'src/user/user.service';
import { AuthService } from 'src/auth/auth.service';
import { JwtService } from '@nestjs/jwt';
//import mqtt, { IClientOptions } from 'mqtt';
// DDIG stand for Device Data Intgrety Guard
@Module({
  providers: [
    DdigService,
    ConfigService,
    PrismaService,
    UserService,
    AuthService,
    JwtService,
  ],
  controllers: [DdigController],
})
export class DDIGModule {}
