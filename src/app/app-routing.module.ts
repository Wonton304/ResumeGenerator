import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AUpdateInformationPageComponent } from './a-update-information-page/a-update-information-page.component';
import { AResumeGeneratorPageComponent } from './a-resume-generator-page/a-resume-generator-page.component';
import { AJobPostingPageComponent} from './a-job-posting-page/a-job-posting-page.component';
import { ECreatePostingPageComponent} from './e-create-posting-page/e-create-posting-page.component';
import { ESelectingApplicantPageComponent} from './e-selecting-applicant-page/e-selecting-applicant-page.component';
import { MainLoginPageComponent} from './main-login-page/main-login-page.component';

const routes: Routes = [
  {
    //initial route
    path: '',
    // component property lets us specify which component resides at that path. 
    component: MainLoginPageComponent
  },
  {
    path: 'Posting',
    component: AJobPostingPageComponent
  },
  {
    path: 'Generate',
    component: AResumeGeneratorPageComponent
  },
  {
    path: 'Update',
    component: AUpdateInformationPageComponent
  },
  {
    path: 'Post',
    component: ECreatePostingPageComponent
  },
  {
    path: 'Select',
    component: ESelectingApplicantPageComponent
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
