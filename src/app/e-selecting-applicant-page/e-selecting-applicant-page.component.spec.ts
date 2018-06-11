import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ESelectingApplicantPageComponent } from './e-selecting-applicant-page.component';

describe('ESelectingApplicantPageComponent', () => {
  let component: ESelectingApplicantPageComponent;
  let fixture: ComponentFixture<ESelectingApplicantPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ESelectingApplicantPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ESelectingApplicantPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
