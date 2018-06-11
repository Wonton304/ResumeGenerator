import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ECreatePostingPageComponent } from './e-create-posting-page/e-create-posting-page.component';
import { ESelectingApplicantPageComponent } from './e-selecting-applicant-page/e-selecting-applicant-page.component';
import { AUpdateInformationPageComponent } from './a-update-information-page/a-update-information-page.component';
import { AJobPostingPageComponent } from './a-job-posting-page/a-job-posting-page.component';
import { AResumeGeneratorPageComponent } from './a-resume-generator-page/a-resume-generator-page.component';
import { MainLoginPageComponent } from './main-login-page/main-login-page.component';

@NgModule({
  declarations: [
    AppComponent,
    ECreatePostingPageComponent,
    ESelectingApplicantPageComponent,
    AUpdateInformationPageComponent,
    AJobPostingPageComponent,
    AResumeGeneratorPageComponent,
    MainLoginPageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
