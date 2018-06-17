import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';

@Component({
  selector: 'app-a-update-information-page',
  templateUrl: './a-update-information-page.component.html',
  styleUrls: ['./a-update-information-page.component.css']
})
export class AUpdateInformationPageComponent implements OnInit {
  item:string[] = ["Hobbies","Awards","CodingProjects","Experience"];
  experienceTypeArray:string[] = ["WorkExperience","VolunteerExperience"];
  categoryArray:string[] = ["Personal","Academic"];
  experienceType:string ="";
  title:string="";
  overallDescription:string = "";
  dateRecieved:string="";
  duration:string="";
  itemType:string="";
  organization:string="";
  role:string="";
  complexity:Number= 0;
  language:string="";
  category:string="";

  applicantEmail:string="";

  visibleDescription:boolean = false;
  visibleDateRecieved:boolean = false;
  visibleDuration:boolean = false;
  visibleOrganization:boolean = false;
  visibleRole:boolean = false;
  visibleComplexity:boolean = false;
  visibleLanguage:boolean = false;
  visibleCategory:boolean = false;
  visibleExperienceType:boolean = false;

  constructor(private serverService: DataServiceService ) { }


  ngOnInit() {
  
   }


  activityTypeChangedHandler(event:any){
    this.itemType=event.target.value;

    if(this.itemType === "CodingProjects"){
      this.visibleDuration = false;
      this.visibleDateRecieved = false;
      this.visibleOrganization = false;
      this.visibleRole = false;
      this.visibleDescription = true;
      this.visibleComplexity = true;
      this.visibleCategory = true;
      this.visibleLanguage = true;
      this.visibleExperienceType = false;
    }

    if(this.itemType === "Hobbies"){
      this.visibleDuration = false;
      this.visibleDateRecieved = false;
      this.visibleOrganization = false;
      this.visibleRole = false;
      this.visibleDescription = false;
      this.visibleComplexity = false;
      this.visibleCategory = false;
      this.visibleLanguage = false;
      this.visibleExperienceType = false;
    }


    if(this.itemType === "Awards"){
      this.visibleDuration = false;
      this.visibleDateRecieved = true;
      this.visibleOrganization = false;
      this.visibleRole = false;
      this.visibleDescription = true;
      this.visibleComplexity = false;
      this.visibleCategory = false;
      this.visibleLanguage = false;
      this.visibleExperienceType = false;
    }


    if(this.itemType === "Experience"){
      this.visibleDuration = true;
      this.visibleDateRecieved = false;
      this.visibleOrganization = true;
      this.visibleRole = true;
      this.visibleDescription = true;
      this.visibleComplexity = false;
      this.visibleCategory = false;
      this.visibleLanguage = false;
      this.visibleExperienceType = true;
    }




  }

  collectCategory(event:any){
    this.category = event.target.value;
    console.log(event.target.value);
  }

  selectExperienceType(event:any){
    this.experienceType = event.target.value;
    console.log(event.target.value);
  }

  collectOrganization(event:any){
    this.organization=event.target.value;
    console.log(this.organization);
  }

  collectDescription(event:any){
    this.overallDescription= event.target.value;
    console.log(this.overallDescription);
  }

  collectName(event:any){
    console.log(event);
    this.title = event.target.value;
    console.log(this.title);
  }

  collectComplexity(event:any){
    this.complexity = event.target.value;
    console.log(this.complexity);
  }

  collectLanguage(event:any){
    this.language = event.target.value;
    console.log(this.language);
  }

  collectDuration(event:any){
    this.duration = event.target.value;
    console.log(this.duration);
  }

  collectDateRecieved(event:any){
    this.dateRecieved = event.target.value;
    console.log(this.dateRecieved);
  }

  collectRole(event:any){
    this.role = event.target.value;
    console.log(this.role);
  }

  collectApplicantEmail(event:any){
    this.applicantEmail = event.target.value;
    console.log(this.applicantEmail);
  }

  addItem(){
<<<<<<< HEAD
   if( this.itemType==='Hobbies'){
    this.serverService.createHobby(JSON.stringify({HOBBYNAME:this.title}))
    .subscribe(  
      (response) =>console.log(response),
      (error) => console.log(error)
    );
   }

   if( this.itemType === 'Awards'){


   }

   if(this.itemType === "Experience"){
     if(this.experienceType=== "WorkExperience"){

     }else{


     }
  }

  if(this.itemType === "CodingProjects"){
    if(this.experienceType=== "Personal"){

    }else{


    }
  }
    
=======
    // awaiting for format decision

>>>>>>> e4613fc2f535b29a34b39cb98ebc86a844150b6a
  }

}
