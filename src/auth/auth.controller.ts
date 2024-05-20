import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthDto, AuthDto2 } from './dto';
@Controller('auth')
export class AuthController {
  constructor(private authservice: AuthService) {}

  @Post('signup')
  singup(@Body() dto: AuthDto) {
    return this.authservice.signup(dto);
  }

  @Post('signin')
  signin(@Body() dto: AuthDto2) {
    return this.authservice.signin(dto);
  }
}
