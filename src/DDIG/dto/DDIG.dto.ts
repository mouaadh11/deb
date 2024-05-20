import { IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class DDIGDto {
  @IsNumber()
  @IsNotEmpty()
  sid: number;
}

export class ReceivedDataDto {
  @IsNumber()
  @IsNotEmpty()
  beat: number;

  @IsNumber()
  @IsNotEmpty()
  ir_Reading: number;

  @IsNumber()
  @IsNotEmpty()
  redReading: number;

  @IsString()
  @IsNotEmpty()
  timeStamp: string;
}
