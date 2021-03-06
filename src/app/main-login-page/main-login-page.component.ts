import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';
//import {BehaviorSubject} from 'rxjs/BehaviorSubject';
import { Response } from '@angular/http';

@Component({
  selector: 'app-main-login-page',
  templateUrl: './main-login-page.component.html',
  styleUrls: ['./main-login-page.component.css']
})
export class MainLoginPageComponent implements OnInit {

//private visibleSidebar = new BehaviorSubject<boolean>(false);

  hideSidebar:boolean = true;
  applicantIsHidden:boolean = false;
  employerIsHidden:boolean = false;

  allowable:string="";
  add:string;
  postalCode:any;
  // applicantEmail:string ="";
  holder;

  //fields for Location entity
  eAddress:string="";
  // eCountry:string=""; NOTE: design choice is for countries to be in Canada
  eCity:string="";
  eProvince:string="";
  ePostalCode:string="";

  //fields for Company entity
  companyName:string="";
  companyDescription:string="";
  companyDomain:string = ""; // is one of ["Health","Finance","Technology","Other"];

  //fields for Applicant entity
  applicantName:string="";
  applicantEmail:string="";
  applicantAddress:string="";
  applicantCity:string="";
  applicantProvince:string="";
  githubAccount:string="";
  personalDescription:string="";
  phoneNumber:string="";

  firstTimeEmployer:boolean = false;
  firstTimeApplicant:boolean = false;


  constructor(private serverService: DataServiceService ) {
   }

  ngOnInit() {

  }
/*
  get(){
    this.serverService.connectJobPostings().subscribe(
      (response: Response )=>{
        const data = response.json();
        for(const Location of data){
          Location.ADDRESS = 'Address is ' + Location.ADDRESS;
        }
        console.log(data)
      },
      (error) => console.log(error)
    );
  }
 */
  revealHideApplicant() {
    if(!this.firstTimeApplicant == true){
      this.applicantIsHidden = !this.applicantIsHidden;
    }
    if (this.employerIsHidden == true){
      this.employerIsHidden = false;
    }
    this.firstTimeEmployer = false;
    this.doesntHasAccount();
  }

  revealHideEmployer() {
    if(!this.firstTimeEmployer == true){
      this.employerIsHidden = !this.employerIsHidden;
    };
    if (this.applicantIsHidden == true){
      this.applicantIsHidden = false;
    }
    this.firstTimeApplicant = false;
    this.doesntHasAccount();
  }

login(){
  //TODO: do something upon login
}

  //Collectors for Company Information
      collectCompanyAddress(event:any){
        this.eAddress = event.target.value;
        if(this.eAddress.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.eAddress);
      }

      collectCompanyCity(event:any){
        this.eCity = event.target.value;
        if(this.eCity.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.eCity);
      }

      collectCompanyProvince(event:any){
        this.eProvince = event.target.value;
        if(this.eProvince.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.eProvince);
      }

      collectCompanyPostalCode(event:any){
        this.ePostalCode = event.target.value;
        if(this.ePostalCode.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.ePostalCode);
      }

      collectCompanyName(event:any){
        this.companyName = event.target.value;
        if(this.companyName.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.companyName);
      }

      collectCompanyDescription(event:any){
        this.companyDescription = event.target.value;
        if(this.companyDescription.length>1000){
          alert("character exceeding 1000 char limit");
          return;
        }
        console.log(this.companyDescription);
      }

      collectCompanyDomain(event:any){
        this.companyDomain = event.target.value;
        if(this.companyDomain.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.companyDomain);
      }

      collectApplicantName(event:any){
        this.applicantName = event.target.value;
        if(this.applicantName.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.applicantName);
      }

      collectApplicantEmail(event:any){
        this.applicantEmail = event.target.value;
        if(this.applicantEmail.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.applicantEmail);
      }

      collectApplicantAddress(event:any){
        this.applicantAddress = event.target.value;
        if(this.applicantEmail.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.applicantAddress);
      }

      collectApplicantCity(event:any){
        this.applicantCity = event.target.value;
        if(this.applicantCity.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.applicantCity);
      }

      collectApplicantProvince(event:any){
        this.applicantProvince = event.target.value;
        if(this.applicantProvince.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.applicantProvince);
      }

      collectGithubAccount(event:any){
        this.githubAccount = event.target.value;
        if(this.githubAccount.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.githubAccount);
      }

      collectPersonalDescription(event:any){
        this.personalDescription = event.target.value;
        if(this.personalDescription.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.personalDescription);
      }

      collectPhoneNumber(event:any){
        this.phoneNumber = event.target.value;
        if(this.phoneNumber.length>100){
          alert("character exceeding 100 char limit");
          return;
        }
        console.log(this.phoneNumber);
      }

hasAccount(){
  //if on emplyer page and u have account set false
  if(this.employerIsHidden == true || this.firstTimeEmployer == true){
    this.firstTimeEmployer = false;
    this.employerIsHidden = true;

  }
  else if( this.applicantIsHidden == true || this.firstTimeApplicant == true){
    this.firstTimeApplicant = false;
    this.applicantIsHidden = true;
  }

}

doesntHasAccount(){
  if(this.employerIsHidden == true){
    this.firstTimeEmployer=true;
      this.employerIsHidden = false;
  }
  else if(this.applicantIsHidden == true){
    this.firstTimeApplicant = true;
    this.applicantIsHidden = false;
  }
}

submitCompanyInfo(){
  (this.companyName != null && this.companyName != "" && this.eAddress != "" && this.eCity != "" && this.eProvince != "" && this.ePostalCode != ""
   && this.companyName != "" && this.companyDescription != "" && this.companyDomain != "") ?
   ((this.companyName.length > 100 || this.eAddress.length > 100 || this.eCity.length > 100 || this.eProvince.length > 100 || this.ePostalCode.length >100 ||
     this.companyName.length > 100 || this.companyDescription.length > 1000 || this.companyDomain.length > 100) ? alert("Input too long!") : alert("Submitted!")) : alert("Please fill in all fields!");
  this.serverService.insertNewCompany(
    JSON.stringify({ADDRESS:this.eAddress, CITY:this.eCity, PROVINCE: this.eProvince, POSTALCODE: this.ePostalCode, COMPANYNAME: this.companyName,
    COMPANYDESCRIPTION: this.companyDescription, COMPANYDOMAIN: this.companyDomain}))
  .subscribe(
    (response) =>console.log(response),
    (error) =>console.log
  );
}

submitApplicantInfo(){
  (this.applicantEmail != null && this.applicantName != "" && this.applicantEmail != "" && this.applicantAddress != "" && this.applicantCity != ""
   && this.applicantProvince != "" && this.githubAccount != "" && this.personalDescription != ""&& this.phoneNumber != "") ?
   ((this.applicantEmail.length > 100 || this.applicantName.length > 100 || this.applicantEmail.length > 100 || this.applicantAddress.length > 100 ||
     this.applicantCity.length > 100 || this.applicantProvince.length > 100 || this.githubAccount.length > 100 || this.personalDescription.length > 1000
   || this.phoneNumber.length > 100) ? alert("Input too long!") : alert("Submitted!")) : alert("Please fill in all fields!");
  this.serverService.insertNewApplicant(
    JSON.stringify({APPLICANTNAME:this.applicantName, APPLICANTEMAIL:this.applicantEmail,
      APPLICANTADDRESS: this.applicantAddress, APPLICANTCITY: this.applicantCity, APPLICANTPROVINCE: this.applicantProvince,
      GITHUBACCOUNT: this.githubAccount,
    PERSONDESCRIPTION: this.personalDescription, APPLICANTPHONENUMBER: this.phoneNumber}))
  .subscribe(
    (response) =>console.log(response),
    (error) =>console.log
  );
  }
}
