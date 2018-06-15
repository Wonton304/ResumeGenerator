import { Component, OnInit } from '@angular/core';
import { Http } from '@angular/http';


@Component({
  selector: 'app-main-login-page',
  templateUrl: './main-login-page.component.html',
  styleUrls: ['./main-login-page.component.css']
})
export class MainLoginPageComponent implements OnInit {
  hideSidebar:boolean = true;
  applicantIsHidden:boolean = false;
  employerIsHidden:boolean = false;

  
  applicantEmail:string ="";
  holder;
  constructor(private http: Http) {
    http.get('http://www.ugrad.cs.ubc.ca/~s3z0b/dist/ResumeGenerator/ServerConnect.php').subscribe(data => {
      
    console.log(data);
      this.holder = data;
    });
   }

  ngOnInit() {
    this.verify();
  }

  verify(){
 // this.http.get('http://localhost/serverConnect.php');
      
  }

  revealHideApplicant() {
    this.applicantIsHidden = !this.applicantIsHidden;
    if (this.employerIsHidden == true){
      this.employerIsHidden = false;
    }


    
  }

  revealHideEmployer() {
    this.employerIsHidden = !this.employerIsHidden;
    if (this.applicantIsHidden == true){
      this.applicantIsHidden = false;
    }
    this.verify();
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
