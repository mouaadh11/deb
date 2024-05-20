import { Test, TestingModule } from '@nestjs/testing';
import { DdigService } from './ddig.service';

describe('DdigService', () => {
  let service: DdigService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [DdigService],
    }).compile();

    service = module.get<DdigService>(DdigService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
