import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ECreatePostingPageComponent } from './e-create-posting-page.component';

describe('ECreatePostingPageComponent', () => {
  let component: ECreatePostingPageComponent;
  let fixture: ComponentFixture<ECreatePostingPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ECreatePostingPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ECreatePostingPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
