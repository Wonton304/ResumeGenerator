import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';


@Component({
  selector: 'app-a-resume-generator-page',
  templateUrl: './a-resume-generator-page.component.html',
  styleUrls: ['./a-resume-generator-page.component.css']
})
export class AResumeGeneratorPageComponent implements OnInit {

  jobPostingId:string = "";
  generatedResume$:Object;
  email:string="";

  resumeGenerated:boolean=false;

  includeHobbies:boolean=false;
  includeExperiences:boolean=false;
  includeAwards:boolean=false;
  includeCodingProjects:boolean=false;

  constructor(private serverService: DataServiceService) { }

  ngOnInit() {
  }

  collectId (event:any){
    this.jobPostingId=event.target.value;
    console.log("id: "+this.jobPostingId);
  }

  collectEmail(event:any){
    this.email=event.target.value;
    console.log("email: "+this.email);
  }

  getHobbies(){
    this.includeHobbies = !this.includeHobbies;

  }

  getExperiences(){
    this.includeExperiences = !this.includeExperiences;
  }

  getAwards(){

  }

  getCodingProjects(){

  }

  buildResume(){


//send info to php
  this.serverService.connectResumeGen(
    JSON.stringify({EMAIL:this.email,JOBID:this.jobPostingId}))
    .subscribe(
      serverService => this.generatedResume$ = serverService,
      (response) => console.log(response)
    );
    this.resumeGenerated=true;
  }

  // calls script
  /*resumeGen (){
    this.serverService.generateResume(JSON.stringify({JOBID:this.jobPostingId}))
        .subscribe(
          serverService => this.generatedResume$ = serverService,
          (error) => console.log(error),
        );

        console.log(JSON.stringify({JOBID:this.jobPostingId}));
        console.log("thisisresult:" + this.generatedResume$);
  }
*/
}
