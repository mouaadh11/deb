import { Module } from '@nestjs/common';
import { AuthController } from './auth.controller';
import { AuthService } from './auth.service';
import { JwtModule, JwtService } from '@nestjs/jwt';
import { ConfigModule } from '@nestjs/config';
import { PrismaService } from 'src/prisma/prisma.service';
//import { JwtStrategy } from './startegy/jwt.startegy';
import { PassportModule } from '@nestjs/passport';
import { JwtStrategy } from './startegy';
import { UserModule } from '../user/user.module';
import { UserService } from 'src/user/user.service';
import { ConfigService } from '@nestjs/config';
//import { JwtStrategy } from './startegy';

@Module({
  imports: [
    JwtModule.registerAsync({
      imports: [ConfigModule],
      useFactory: async (config: ConfigService) => ({
        secret: config.get('JWT_SECRET'),
        signOptions: { expiresIn: '1800' },
      }),
      inject: [ConfigService],
    }),
    ConfigModule,
    PassportModule,
    UserModule,
  ],
  controllers: [AuthController],
  providers: [
    AuthService,
    JwtModule,
    JwtService,
    JwtStrategy,
    PrismaService,
    UserService,
  ],
})
export class AuthModule {}
