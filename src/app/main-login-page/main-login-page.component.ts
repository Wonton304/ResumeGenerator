import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';
import { Response } from '@angular/http';

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
  visibleCompanyName:boolean=false;

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
  }

  //Collectors for Company Information
      collectCompanyAddress(event:any){
        this.eAddress = event.target.value;
        console.log(this.eAddress);
      }

      collectCompanyCity(event:any){
        this.eCity = event.target.value;
        console.log(this.eCity);
      }

      collectCompanyProvince(event:any){
        this.eProvince = event.target.value;
        console.log(this.eProvince);
      }

      collectCompanyPostalCode(event:any){
        this.ePostalCode = event.target.value;
        console.log(this.ePostalCode);
      }

      collectCompanyName(event:any){
        this.companyName = event.target.value;
        console.log(this.companyName);
      }

      collectCompanyDescription(event:any){
        this.companyDescription = event.target.value;
        console.log(this.companyDescription);
      }

      collectCompanyDomain(event:any){
        this.companyDomain = event.target.value;
        console.log(this.companyDomain);
      }





}
