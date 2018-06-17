import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';

@Component({
  selector: 'app-e-job-posting-page',
  templateUrl: './e-job-posting-page.component.html',
  styleUrls: ['./e-job-posting-page.component.css']
})
export class EJobPostingPageComponent implements OnInit {

  posting$:Object;

  constructor(private serverService: DataServiceService ) {
  }

 ngOnInit() {
  this.get();
 }

 get(){
   this.serverService.connectJobPostings().subscribe(
     /*
     (response: Response )=>{
       const data = response.json();
      for(const Location of data){
         Location.ADDRESS = 'Address is ' + Location.ADDRESS;
       } 
       console.log(data);
       serverService => this.posting$ = serverService
     }
     */
    serverService => this.posting$ = serverService,
     (error) => console.log(error)
   );
 }


}
