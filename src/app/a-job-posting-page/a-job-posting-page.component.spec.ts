import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AJobPostingPageComponent } from './a-job-posting-page.component';

describe('AJobPostingPageComponent', () => {
  let component: AJobPostingPageComponent;
  let fixture: ComponentFixture<AJobPostingPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AJobPostingPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AJobPostingPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
