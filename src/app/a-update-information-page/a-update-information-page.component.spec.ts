import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AUpdateInformationPageComponent } from './a-update-information-page.component';

describe('AUpdateInformationPageComponent', () => {
  let component: AUpdateInformationPageComponent;
  let fixture: ComponentFixture<AUpdateInformationPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AUpdateInformationPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AUpdateInformationPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
