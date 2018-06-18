import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';

@Component({
  selector: 'app-e-selecting-applicant-page',
  templateUrl: './e-selecting-applicant-page.component.html',
  styleUrls: ['./e-selecting-applicant-page.component.css']
})

export class ESelectingApplicantPageComponent implements OnInit {
  jobPostingId:string='';
  candidates$:Object;

  constructor(private serverService: DataServiceService ) { }


  ngOnInit() {
   }



  collectId (event:any){
    this.jobPostingId=event.target.value;
  }

   selectApplicant (){

    if(this.jobPostingId != ''){
      alert("Submitted!");
  this.serverService.connectApplicants(JSON.stringify({JOBID:this.jobPostingId}))
        .subscribe(
          (serverService) => this.candidates$ = serverService,
          (error) => console.log(error)
        );
    }else{
      alert("You need to input postID");
    }

  }

}
