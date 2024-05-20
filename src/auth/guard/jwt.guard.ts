import { AuthGuard } from '@nestjs/passport';

export class jwtguard extends AuthGuard('jwt') {
  constructor() {
    super();
  }
}
