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
  result:Array<Object>;

  constructor(private serverService: DataServiceService ) {
   }

  ngOnInit() {
   this.get();
  }

  get(){
    this.serverService.connectStore().subscribe(
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




}
