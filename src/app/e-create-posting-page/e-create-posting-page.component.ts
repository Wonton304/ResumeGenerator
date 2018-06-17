import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';

@Component({
  selector: 'app-e-create-posting-page',
  templateUrl: './e-create-posting-page.component.html',
  styleUrls: ['./e-create-posting-page.component.css']
})
export class ECreatePostingPageComponent implements OnInit {
  item:string[] = ["Company Information", "Job Posting Information", "Technical Requirements"];
  itemType:string="";

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
  visibleAddress:boolean=false;
  visibleCity:boolean=false;
  visibleProvince:boolean=false;
  visiblePostalCode:boolean=false;

  visibleCompanyName:boolean=false;
  visibleCompanyDescription:boolean=false;
  visibleCompanyDomain:boolean=false;

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

    if(this.itemType === "Company Information"){
      this.visibleAddress=true;
      this.visibleCity=true;
      this.visibleProvince=true;
      this.visiblePostalCode=true;
      this.visibleCompanyName=true;
      this.visibleCompanyDescription=true;
      this.visibleCompanyDomain=true;
      this.visibleJobId=false;
      this.visibleJobDesc=false;
      this.visibleField=false;
      this.visiblePositionTitle=false;
      this.visibleTechnologyRole=false;
      this.visibleTechnologyName=false;
      this.visibleProficiencyRequirements=false;
      this.visibleTechnologyType=false;
    }

    if(this.itemType === "Job Posting Information"){
      this.visibleAddress=false;
      this.visibleCity=false;
      this.visibleProvince=false;
      this.visiblePostalCode=false;
      this.visibleCompanyName=false;
      this.visibleCompanyDescription=false;
      this.visibleCompanyDomain=false;
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
      this.visibleAddress=false;
      this.visibleCity=false;
      this.visibleProvince=false;
      this.visiblePostalCode=false;
      this.visibleCompanyName=false;
      this.visibleCompanyDescription=false;
      this.visibleCompanyDomain=false;
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
//Collectors for Company Information
    collectCompanyAddress(event:any){
      this.eAddress = event.target.value;
      console.log('address ' + this.eAddress);
    }

    collectCompanyCity(event:any){
      this.eCity = event.target.value;
      console.log('city ' +this.eCity);
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

//Collectors for Job Posting
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

    addItem(){
      // awaiting for format decision
      if(this.itemType === "Technical Requirements"){
        //TODO: handle adding technology requirement event
        //can have 1+ technical requirements for each job! Must update accordingly.
      }
      else{
        //if not technical requirements, update as normal
        //LOCATION JSON
        this.serverService.updateJobDescription(JSON.stringify({ADDRESS:this.eAddress, CITY:this.eCity, PROVINCE: this.eProvince, POSTALCODE: this.ePostalCode})));
        console.log('sent');
      }
    }
}
