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
  generatedHobbies$:Object;
  generatedAwards$:Object;
  generatedExperiences$:Object;
  generatedCodingProjects$:Object;
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
    console.log("hobbie: "+this.includeHobbies);
    this.serverService.getHobbies(
      JSON.stringify({EMAIL:this.email}))
      .subscribe(
        serverService => this.generatedHobbies$ = serverService,
        (response) => console.log(response),
        (error) =>console.log(error)
      );
  }

  getExperiences(){
    this.includeExperiences = !this.includeExperiences;
    console.log("exp: "+this.includeExperiences);
    this.serverService.getExperiences(
      JSON.stringify({EMAIL:this.email}))
      .subscribe(
        serverService => this.generatedExperiences$ = serverService,
        (response) => console.log(response),
        (error) =>console.log(error)
      );
  }

  getAwards(){
    this.includeAwards = !this.includeAwards;
    console.log("awards: "+this.includeAwards);
    this.serverService.getAwards(
      JSON.stringify({EMAIL:this.email}))
      .subscribe(
        serverService => this.generatedAwards$ = serverService,
        (response) => console.log(response),
        (error) =>console.log(error)
      );
  }

  getCodingProjects(){
    this.includeCodingProjects = !this.includeCodingProjects;
    console.log("cp: "+this.includeCodingProjects);
    this.serverService.getCodingProjects(
      JSON.stringify({EMAIL:this.email}))
      .subscribe(
        serverService => this.generatedCodingProjects$ = serverService,
        (response) => console.log(response),
        (error) =>console.log(error)
      );
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
