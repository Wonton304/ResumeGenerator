import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';


@Component({
  selector: 'app-a-job-posting-page',
  templateUrl: './a-job-posting-page.component.html',
  styleUrls: ['./a-job-posting-page.component.css']
})
export class AJobPostingPageComponent implements OnInit {

  posting$:Object;
  min$:Object;
  max$:Object;
  avg$:Object;

  minIsVisible:boolean=false;
  maxIsVisible:boolean=false;
  avgIsVisible:boolean=false;

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

 calcMin(){
   this.minIsVisible = !this.minIsVisible;
   this.maxIsVisible = false;
   this.avgIsVisible = false;
   this.serverService.getMinimumProficiency().subscribe(
    serverService => this.min$ = JSON.stringify(serverService).substring(29,30) ,
     (error) => console.log(error)
   );
   console.log(this.min$);
 }

 calcMax(){
   this.maxIsVisible = !this.maxIsVisible;
   this.minIsVisible = false;
   this.avgIsVisible = false;
   this.serverService.getMaximumProficiency().subscribe(
    serverService => this.max$ = JSON.stringify(serverService).substring(29,30),
     (error) => console.log(error)
   );
   console.log(this.max$);
 }

 calcAvg(){
   this.avgIsVisible = !this.avgIsVisible;
   this.maxIsVisible = false;
   this.minIsVisible = false;
   this.serverService.getAverageProficiency().subscribe(
    serverService => this.avg$ = JSON.stringify(serverService).substring(29,33),
     (error) => console.log(error)
   );
   console.log(this.avg$);
 }



}
