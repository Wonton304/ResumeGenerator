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
import { SidebarComponent } from './sidebar/sidebar.component';
import { HttpClientModule } from '@angular/common/http'; 
import { DataServiceService } from './data-service.service';
import { HttpModule } from '@angular/http';
import { EJobPostingPageComponent } from './e-job-posting-page/e-job-posting-page.component';

@NgModule({
  declarations: [
    AppComponent,
    ECreatePostingPageComponent,
    ESelectingApplicantPageComponent,
    AUpdateInformationPageComponent,
    AJobPostingPageComponent,
    AResumeGeneratorPageComponent,
    MainLoginPageComponent,
    SidebarComponent,
    EJobPostingPageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    HttpModule
  ],
  providers: [DataServiceService],
  bootstrap: [AppComponent]
})
export class AppModule { }
