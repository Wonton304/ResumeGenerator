import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EJobPostingPageComponent } from './e-job-posting-page.component';

describe('EJobPostingPageComponent', () => {
  let component: EJobPostingPageComponent;
  let fixture: ComponentFixture<EJobPostingPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EJobPostingPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EJobPostingPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
