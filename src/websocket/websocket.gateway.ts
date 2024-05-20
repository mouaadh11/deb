import { Logger } from '@nestjs/common';
import {
  WebSocketGateway,
  WebSocketServer,
  SubscribeMessage,
  OnGatewayInit,
  OnGatewayConnection,
  OnGatewayDisconnect,
} from '@nestjs/websockets';
import { Server, Socket } from 'socket.io';

@WebSocketGateway()
export class WebsocketGateway
  implements OnGatewayInit, OnGatewayConnection, OnGatewayDisconnect
{
  private readonly logger = new Logger(WebsocketGateway.name);
  @WebSocketServer()
  io: Server;
  afterInit() {
    this.logger.log('connection Initailized');
  }
  handleConnection(client: any, ...args: any[]) {
    const { sockets } = this.io.sockets;
    this.logger.log(`Client connected: ${client.id}`);
    this.logger.debug(`Number of connected clients:${sockets.size}`);
  }
  handleDisconnect(client: any) {
    this.logger.log(`Cliend id:${client.id} disconnected`);
  }
  @SubscribeMessage('ping')
  handleMessage(client: Socket, payload: string): void {
    this.logger.log(`Message received from client id: ${client.id}`);
    this.logger.log(`message recevied: ${payload}`);
  }
}
