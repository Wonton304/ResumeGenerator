import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';

@Component({
  selector: 'app-e-create-posting-page',
  templateUrl: './e-create-posting-page.component.html',
  styleUrls: ['./e-create-posting-page.component.css']
})
export class ECreatePostingPageComponent implements OnInit {
  item:string[] = ["Job Posting Information", "Technical Requirements"];
  itemType:string="";

  companyName:string="";
  //fields for JobPosting entity
  jobId:string="";
  field:string = ""; // is one of ["Software", "Hardware", "Firmware", "QA", "Project Management", "Other"];
  positionTitle:string="";
  jobDescription:string="";

  //fields for RequiredTechnology entity
  technologyRole:string = ""; //is one of ["Frontend", "Backend", "Web", "Network", "Firmware", "Other"];
  technologyName:string="";
  proficiencyRequirements:number = 0;//is one of [0,1,2,3,4,5];
  technologyType:string = "";// is one of ["Language", "IDE", "Framework", "Other"];

  //visibility fields, will change with different items selected
  visibleCompanyName:boolean=true;
  visibleJobId:boolean=false;
  visibleJobDesc:boolean=false;
  visibleField:boolean=false;
  visiblePositionTitle:boolean=false;

  visibleTechnologyRole:boolean=false;
  visibleTechnologyName:boolean=false;
  visibleProficiencyRequirements:boolean=false;
  visibleTechnologyType:boolean=false;

  constructor(private serverService: DataServiceService) { }

  ngOnInit() {
  }

  activityTypeChangedHandler(event:any){
    this.itemType=event.target.value;

    if(this.itemType === "Job Posting Information"){
      this.visibleJobId=true;
      this.visibleJobDesc=true;
      this.visibleField=true;
      this.visiblePositionTitle=true;
      this.visibleTechnologyRole=false;
      this.visibleTechnologyName=false;
      this.visibleProficiencyRequirements=false;
      this.visibleTechnologyType=false;
    }

    if(this.itemType === "Technical Requirements"){
      this.visibleJobId=false;
      this.visibleJobDesc=false;
      this.visibleField=false;
      this.visiblePositionTitle=false;
      this.visibleTechnologyRole=true;
      this.visibleTechnologyName=true;
      this.visibleProficiencyRequirements=true;
      this.visibleTechnologyType=true;
    }
  }

//Collectors for Job Posting
collectCompanyName(event:any){
  this.companyName = event.target.value;
  console.log(this.companyName);
}

    collectJobID(event:any){
      this.jobId = event.target.value;
      console.log(this.jobId);
    }

    collectJobDescription(event:any){
      this.jobDescription = event.target.value;
      console.log(this.jobDescription);
    }

    collectJobField(event:any){
      this.field = event.target.value;
      console.log(this.field);
    }

    collectJobTitle(event:any){
      this.positionTitle = event.target.value;
      console.log(this.positionTitle);
    }

//Collectors for Technologies
    collectTechName(event:any){
      this.technologyName = event.target.value;
      console.log(this.technologyName);
    }

    collectTechRole(event:any){
      this.technologyRole = event.target.value;
      console.log(this.technologyRole);
    }

    collectTechProficiency(event:any){
      this.proficiencyRequirements = event.target.value;
      console.log(this.proficiencyRequirements);
    }

    collectTechnologyType(event:any){
      this.technologyType = event.target.value;
      console.log(this.technologyType);
    }

    updateInfo(){
      // awaiting for format decision
      if(this.itemType === "Technical Requirements"){
        //TODO: handle adding technology requirement event
        //can have 1+ technical requirements for each job! Must update accordingly.
      }
      else{
        //if not technical requirements, update as normal
        //LOCATION JSON
        // this.serverService.updateJobDescription(JSON.stringify({ADDRESS:this.eAddress, CITY:this.eCity, PROVINCE: this.eProvince, POSTALCODE: this.ePostalCode}))
        // .subscribe(
        //   (response) =>console.log(response),
        //   (error) =>console.log
        // );
      }
    }

    insertInfo(){

    }
}
