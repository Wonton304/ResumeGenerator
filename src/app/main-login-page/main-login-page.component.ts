import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-main-login-page',
  templateUrl: './main-login-page.component.html',
  styleUrls: ['./main-login-page.component.css']
})
export class MainLoginPageComponent implements OnInit {

  applicantIsHidden:boolean = false;
  employerIsHidden:boolean = false;
  constructor() {
    // this.applicantIsHidden = false;
    // this.employerIsHidden = false;
   }

  ngOnInit() {
  }

  revealHideApplicant() {
    this.applicantIsHidden = true;
  }

  revealHideEmployer() {
    this.employerIsHidden = true;
  }


//   function revealHideApplicant() {
//     var x = document.getElementById("applicant-login-box");
//     if (x.style.display === "none") {
//         x.style.display = "block";
//     } else {
//         x.style.display = "none";
//     }
// }

}
