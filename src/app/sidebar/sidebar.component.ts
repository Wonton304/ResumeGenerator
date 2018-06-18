import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {


  applicantOrEmployer:boolean;
  constructor() { }

  ngOnInit() { 
    this.applicantOrEmployer=false;
  }
 

  switches(){
    if(this.applicantOrEmployer == true ){
      this.applicantOrEmployer = false;
      console.log(this.applicantOrEmployer); 
    }else {
      this.applicantOrEmployer = true;
      console.log(this.applicantOrEmployer);
    }
  }
}
