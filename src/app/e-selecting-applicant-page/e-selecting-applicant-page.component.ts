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
    if ( this.jobPostingId.length>100){
      alert("character exceeding 100 char limit");
      return;
    }
  }

   selectApplicant (){

    if(this.jobPostingId != ''){
      if(this.jobPostingId.length > 100){alert("Input too long!");}else{alert("Submitted!");}
  this.serverService.connectApplicants(JSON.stringify({JOBID:this.jobPostingId}))
        .subscribe(
          (serverService) => this.candidates$ = serverService,
          (error) => console.log(error)
        );
    }else{
      alert("Error: No inputs");
    }

  }

}
