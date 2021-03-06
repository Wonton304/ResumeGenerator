import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';


@Component({
  selector: 'app-a-resume-generator-page',
  templateUrl: './a-resume-generator-page.component.html',
  styleUrls: ['./a-resume-generator-page.component.css']
})
export class AResumeGeneratorPageComponent implements OnInit {

  jobPostingId:string = "";
  applicantInfo$:Object;
  applicantHas$:Object;
  applicantMissing$:Object;
  generatedHobbies$:Object;
  generatedAwards$:Object;
  generatedExperiences$:Object;
  generatedCodingProjects$:Object;
  email:string="";

  attribute:string="";
  roles$:Object;
  names$:Object;
  proficiencies$:Object;
  types$:Object;
  returnAtts$:Object;

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
    if(this.jobPostingId.length > 100){
      alert("character exceeds 100");
      return;
    }
    console.log("id: "+this.jobPostingId);
  }

  collectEmail(event:any){
    this.email=event.target.value;
    if(this.email.length>100){
      alert("character exceeds 100");
      return;
    }
    console.log("email: "+this.email);
  }

  getAwards(){
    (this.email == "" || this.email == null) ? alert("Please input email!") :
((this.email.length > 100 || this.jobPostingId.length > 100) ? alert("Input too long!") : null);
    this.includeAwards = !this.includeAwards;
    console.log("awards: "+this.includeAwards);
    this.serverService.getAwards(
      JSON.stringify({APPLICANTEMAIL:this.email}))
      .subscribe(
         serverService => this.generatedAwards$ = serverService,
         (response) => console.log(response),
      );
      console.log(this.generatedAwards$);
  }

  getCodingProjects(){
    (this.email == "" || this.email == null) ? alert("Please input email!") :
((this.email.length > 100 || this.jobPostingId.length > 100) ? alert("Input too long!") : null);
    this.includeCodingProjects = !this.includeCodingProjects;
    console.log("cp: "+this.includeCodingProjects);
    this.serverService.getCodingProjects(
      JSON.stringify({APPLICANTEMAIL:this.email}))
      .subscribe(
        serverService => this.generatedCodingProjects$ = serverService,
        (response) => console.log(response),
      );
  }

  getHobbies(){
      (this.email == "" || this.email == null) ? alert("Please input email!") :
((this.email.length > 100 || this.jobPostingId.length > 100) ? alert("Input too long!") : null);
    this.includeHobbies = !this.includeHobbies;
    console.log("hobbie: "+this.includeHobbies);
    this.serverService.getHobbies(
      JSON.stringify({APPLICANTEMAIL:this.email}))
      .subscribe(
        serverService => this.generatedHobbies$ = serverService,
        (response) => console.log(response),
      );
  }

  getExperiences(){
      ( this.email == "" || this.email == null) ? alert("Please input email!") :
((this.email.length > 100 || this.jobPostingId.length > 100) ? alert("Input too long!") : null);
    this.includeExperiences = !this.includeExperiences;
    console.log("cp: "+this.includeExperiences);
    this.serverService.getExperiences(
      JSON.stringify({APPLICANTEMAIL:this.email}))
      .subscribe(
        serverService => this.generatedExperiences$ = serverService,
        (response) => console.log(response),
      );
  }

  getCodingProject(){
    ( this.email == "" || this.email == null) ? alert("Please input email!") :
((this.email.length > 100 || this.jobPostingId.length > 100) ? alert("Input too long!") : null);
  this.includeCodingProjects = !this.includeCodingProjects;
  console.log("cp: "+this.includeCodingProjects);
  this.serverService.getCodingProjects(
    JSON.stringify({APPLICANTEMAIL:this.email}))
    .subscribe(
      serverService => this.generatedCodingProjects$ = serverService,
      (response) => console.log(response),
    );
}


  buildResume(){
      (this.jobPostingId == null || this.jobPostingId == "" || this.email == "" || this.email == null) ? alert("Please input all fields!") :
      ((this.email.length > 100 || this.jobPostingId.length > 100) ? alert("Input too long!") : null);
    this.serverService.getApplicantInfo(
      JSON.stringify({APPLICANTEMAIL:this.email}))
      .subscribe(
        serverService => this.applicantInfo$ = serverService,
        (response) => console.log(response),
      );
      // console.log(this.applicantInfo$);
    this.serverService.getApplicantHas(
      JSON.stringify({APPLICANTEMAIL:this.email, ID:this.jobPostingId}))
      .subscribe(
        serverService => this.applicantHas$ = serverService,
        (response) => console.log(response),
      );
      console.log("applicant has: " +this.applicantHas$);
    this.serverService.getApplicantMissing(
      JSON.stringify({APPLICANTEMAIL:this.email, ID:this.jobPostingId}))
      .subscribe(
        serverService => this.applicantMissing$ = serverService,
        (response) => console.log(response),
      );
      console.log("applicant missing: " +this.applicantMissing$);
    this.resumeGenerated=true;
  }

  apply(){
    (this.jobPostingId == null || this.jobPostingId == "" || this.email == "" || this.email == null) ? alert("Please input all fields!") :
    ((this.email.length > 100 || this.jobPostingId.length > 100) ? alert("Input too long!") : alert("Application Analyzed!"));
    this.serverService.applyApplicant(
      JSON.stringify({APPLICANTEMAIL:this.email, JOBID:this.jobPostingId}))
      .subscribe(
        (response) => console.log(response),
      );
      console.log("applied");
  }


collectAttribute(event:any){
  this.attribute=event.target.value;
  if(this.attribute.length > 20){
    alert("Please follow the input guidelines above!");
    return;
  }
  console.log("attribute: "+this.attribute);
}

getAttributes(){
  if(this.attribute == "" || this.jobPostingId == ""){
    alert("Please fill in all fields!");
    return;
  }
  else if(this.attribute === 'role' || this.attribute === 'name' || this.attribute === 'minimum proficiency'
|| this.attribute === 'type'){
  alert("Submitted");
  }
  else{
    alert("Bad input, please match the input guidelines above!");
    return;
  }
  if(this.attribute === 'role'){
    this.attribute = 'technologyRole';
  }
  if(this.attribute === 'name'){
    this.attribute = 'technologyName';
  }
  if(this.attribute === 'minimum proficiency'){
    this.attribute = 'minimumProficiency';
  }
  if(this.attribute === 'type'){
    this.attribute = 'technologyType';
  }
  this.serverService.findJobAttributes(
    JSON.stringify({CATEGORY:this.attribute, JOBID:this.jobPostingId}))
    .subscribe(
      serverService =>this.returnAtts$ = serverService,
      (response) => console.log(response),
    );
    console.log("returned : "+this.returnAtts$ + "attribute: "+this.attribute);
    if(this.attribute === 'technologyRole'){
      this.roles$ = this.returnAtts$;
    }
    if(this.attribute === 'technologyName'){
      this.names$ = this.returnAtts$;
    }
    if(this.attribute === 'minimumProficiency'){
      this.proficiencies$ = this.returnAtts$;
    }
    if(this.attribute === 'technologyType'){
      this.types$ = this.returnAtts$;
    }

}

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
// }
