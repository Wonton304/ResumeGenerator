import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';


@Component({
  selector: 'app-a-job-posting-page',
  templateUrl: './a-job-posting-page.component.html',
  styleUrls: ['./a-job-posting-page.component.css']
})
export class AJobPostingPageComponent implements OnInit {

  posting$:Object;

  constructor(private serverService: DataServiceService ) {
  }

 ngOnInit() {
  this.get();
 }

 get(){
   this.serverService.connectJobPostings().subscribe(
    serverService => this.posting$ = serverService,
     (error) => console.log(error)
   );
 }


}
