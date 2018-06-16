import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-main-login-page',
  templateUrl: './main-login-page.component.html',
  styleUrls: ['./main-login-page.component.css']
})
export class MainLoginPageComponent implements OnInit {
  hideSidebar:boolean = true;
  applicantIsHidden:boolean = false;
  employerIsHidden:boolean = false;

  allowable:string="";
  add:string;
  postalCode:any;
  applicantEmail:string ="";
  holder;
  result:Array<Object>;; //hailin

  constructor(private http: HttpClient) {
    /*http.request('http://www.ugrad.cs.ubc.ca/~s3z0b/dist/ResumeGenerator/ServerConnect.php').subscribe(data => {

    console.log(data);
      this.holder = data;
    });*/
   }

  ngOnInit() {
    this.showConfig() ;
  }

  verify(){

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

  getConfig() {
    return this.http.get('http://www.ugrad.cs.ubc.ca/~g6b1b/ServerConnect.php', {responseType: 'text'});
  }


  showConfig() {
    this.getConfig().subscribe(response =>
      for(var index in response.split(",")){
          var singleObject = response.split(",")[index];
          console.log(JSON.parse(singleObject);
      }
    }); //this.result = response     console.log(JSON.parse(response.toString()))

    // console.log(response);
//     myArray = JSON.parse(this.result);
//     for(var index in myArray){
//       var singleObject = myArray[index];
//       var keys = Object.keys[singleObject];
//       for(var j in keys){
//             console.log("Value of key"+j+"is"+keys[j]+"in Object"+index);
//       }
// }



    // this.getConfig().subscribe(response => this.add = JSON.parse(response.toString()));
     // .subscribe((data: string) => this.allowable =data.toString());

    }

}