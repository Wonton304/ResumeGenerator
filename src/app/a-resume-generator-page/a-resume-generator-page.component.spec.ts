import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AResumeGeneratorPageComponent } from './a-resume-generator-page.component';

describe('AResumeGeneratorPageComponent', () => {
  let component: AResumeGeneratorPageComponent;
  let fixture: ComponentFixture<AResumeGeneratorPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AResumeGeneratorPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AResumeGeneratorPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
