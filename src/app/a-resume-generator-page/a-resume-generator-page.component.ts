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
  returnAtt$:Object;

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
    ((this.email.length > 100 || this.jobPostingId.length > 100) ? alert("Input too long!") : null);
    this.serverService.applyApplicant(
      JSON.stringify({APPLICANTEMAIL:this.email, JOBID:this.jobPostingId}))
      .subscribe(
        (response) => console.log(response),
      );
      console.log("applied");
      alert("You Have Applied!");
  }


collectAttribute(){
  this.attribute=event.target.value;
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
      serverService => this.returnAtt$ = serverService,
      (response) => console.log(response),
      console.log("return att: " + this.returnAtt$);
    );
    console.log(this.returnAtt$);
    if(this.attribute === 'role'){
      this.roles$ = this.returnAtt$;
      console.log("role" + this.roles$);
    }
    if(this.attribute === 'name'){
      this.names$ = this.returnAtt$;
    }
    if(this.attribute === 'minimum proficiency'){
      this.proficiencies$ = this.returnAtt$;
    }
    if(this.attribute === 'type'){
      this.types$ = this.returnAtt$;
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
}
