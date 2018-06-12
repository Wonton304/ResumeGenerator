import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-a-update-information-page',
  templateUrl: './a-update-information-page.component.html',
  styleUrls: ['./a-update-information-page.component.css']
})
export class AUpdateInformationPageComponent implements OnInit {
  overallDescription = "";
  constructor() { }

  ngOnInit() {
  }

  collectDescription(event:any){
    console.log(event);
  }

}
