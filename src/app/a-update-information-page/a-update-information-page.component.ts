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

  visibleEmail:boolean = false;
  visibleTitle:boolean = false;
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
      this.visibleEmail = true;
      this.visibleDuration = false;
      this.visibleDateRecieved = false;
      this.visibleOrganization = false;
      this.visibleRole = false;
      this.visibleDescription = true;
      this.visibleComplexity = true;
      this.visibleCategory = true;
      this.visibleLanguage = true;
      this.visibleExperienceType = false;
      this.visibleTitle = true;
    }

    if(this.itemType === "Hobbies"){
      this.visibleEmail = true;
      this.visibleDuration = false;
      this.visibleDateRecieved = false;
      this.visibleOrganization = false;
      this.visibleRole = false;
      this.visibleDescription = false;
      this.visibleComplexity = false;
      this.visibleCategory = false;
      this.visibleLanguage = false;
      this.visibleExperienceType = false;
      this.visibleTitle = true;
    }


    if(this.itemType === "Awards"){
      this.visibleEmail = true;
      this.visibleDuration = false;
      this.visibleDateRecieved = true;
      this.visibleOrganization = false;
      this.visibleRole = false;
      this.visibleDescription = true;
      this.visibleComplexity = false;
      this.visibleCategory = false;
      this.visibleLanguage = false;
      this.visibleExperienceType = false;
      this.visibleTitle = true;
    }


    if(this.itemType === "Experience"){
      this.visibleEmail = true;
      this.visibleDuration = true;
      this.visibleDateRecieved = false;
      this.visibleOrganization = true;
      this.visibleRole = true;
      this.visibleDescription = true;
      this.visibleComplexity = false;
      this.visibleCategory = false;
      this.visibleLanguage = false;
      this.visibleExperienceType = true;
      this.visibleTitle = false;
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

  /*  $hobbyNameUpdate =$obj->HOBBYNAME;
  $applicantEmail = $obj->APPLICANTEMAIL; */

  addItem(){
   if( this.itemType==='Hobbies'){
    (this.applicantEmail != null && this.title != "") ? alert("Submitted!") : alert("Please fill in all fields!");
    this.serverService.createHobby(JSON.stringify({HOBBYNAME:this.title, APPLICANTEMAIL:this.applicantEmail}))
    .subscribe(
      (response) =>console.log(response),
      (error) => console.log(error)
    );
   }

   /**  $awardNameUpdate =$obj->AWARDNAME;
  $awardDescriptionUpdate = $obj->AWARDDESCRIPTION;
  $dateReceivedUpdate = $obj->DATERECEIVED;
  $applicantEmailInsert = $obj->APPLICANTEMAIL; */
   if( this.itemType === 'Awards'){
     (this.applicantEmail != null && this.title != "" && this.overallDescription != "" && this.dateRecieved != "") 
     ? alert("Submitted!") : alert("Please fill in all fields!");
    this.serverService.createAward(JSON.stringify({AWARDNAME:this.title,AWARDDESCRIPTION:this.overallDescription,
       DATERECEIVED:this.dateRecieved, APPLICANTEMAIL:this.applicantEmail}))
    .subscribe(
      (response) =>console.log(response),
      (error) => console.log(error)
    );
   }


   /**$organizationUpdate =$obj->ORGANIZATION;
$experienceRoleUpdate = $obj->EXPERIENCEROLE;
$durationUpdate = $obj->DURATION;
$experienceTypeUpdate = $obj->EXPERIENCETYPE;
$experienceDescriptionUpdate = $obj->EXPERIENCEDESCRIPTION;
$applicantEmailInsert = $obj->APPLICANTEMAIL; */
   if(this.itemType === 'Experience'){
     (this.applicantEmail != null && this.duration != "" && this.organization != "" && this.role != ""&& this.experienceType != ""&& this.overallDescription != "") ? alert("Submitted!") : alert("Please fill in all fields!");
      this.serverService.createExperienceInfo(JSON.stringify({ORGANIZATION:this.organization, EXPERIENCEROLE:this.role,
      DURATION:this.duration, EXPERIENCETYPE:this.experienceType, EXPERIENCEDESCRIPTION:this.overallDescription,
    APPLICANTEMAIL:this.applicantEmail}))
      .subscribe(
      (response) =>console.log(response),
      (error) => console.log(error)
    );

     /**
  $organizationUpdate =$obj->ORGANIZATION;
  $experienceRoleUpdate = $obj->EXPERIENCEROLE;
  $durationUpdate = $obj->DURATION;
  $experienceTypeUpdate = $obj->EXPERIENCETYPE;
  $experienceDescriptionUpdate = $obj->EXPERIENCEDESCRIPTION;
  $applicantEmailInsert = $obj->APPLICANTEMAIL;
 */
  }

  /**
  $categoryUpdate =$obj->CATEGORY; //category is one of personal or academic right?
  $projectNameUpdate = $obj->PROJECTNAME;
  $projectDescriptionUpdate = $obj->PROJECTDESCRIPTION;
  $languageUpdate = $obj->LANGUAGE;
  $complexityUpdate = $obj->COMPLEXITY;
  $applicantEmailInsert = $obj->APPLICANTEMAIL; */

  if(this.itemType === 'CodingProjects'){
  
     (this.applicantEmail != null && this.category != "" && this.overallDescription != "" && this.language
      != ""&& this.complexity != null) ? alert("Submitted!") : alert("Please fill in all fields!");
      this.serverService.createProjectInfo(JSON.stringify({
        PROJECTNAME:this.title, CATEGORY:this.category, PROJECTDESCRIPTION:this.overallDescription,
        LANGUAGE:this.language,COMPLEXITY:this.complexity,
        APPLICANTEMAIL:this.applicantEmail
      }))
      .subscribe(
      (response) =>console.log(response),
      (error) => console.log(error)
    );
  }
  }

}