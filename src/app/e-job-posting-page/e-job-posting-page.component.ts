import { Component, OnInit } from '@angular/core';
import { DataServiceService } from '../data-service.service';

@Component({
  selector: 'app-e-job-posting-page',
  templateUrl: './e-job-posting-page.component.html',
  styleUrls: ['./e-job-posting-page.component.css']
})
export class EJobPostingPageComponent implements OnInit {

  posting$:Object;
  min$:Object;
  hardest$:Object;
  easiest$:Object;

  minIsVisible:boolean=false;
  easiestisVisible:boolean=false;
  hardestisVisible:boolean=false

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
   this.easiestisVisible = false;
   this.hardestisVisible = false;
   this.serverService.getMinimumComplexity().subscribe(
    serverService => this.min$ = JSON.stringify(serverService).substring(21,22),
     (error) => console.log(error)
   );
   console.log(this.min$);
 }

 getEasiest(){
   this.easiestisVisible = !this.easiestisVisible;
   this.hardestisVisible = false;
   this.minIsVisible = false;
   this.serverService.getEasiestComplexity().subscribe(
    serverService => this.easiest$ = JSON.stringify(serverService).substring(26,29),
     (error) => console.log(error)
   );
 }

 getHardest(){
   this.hardestisVisible = !this.hardestisVisible;
   this.easiestisVisible = false;
   this.minIsVisible = false;
   this.serverService.getHardestComplexity().subscribe(
    serverService => this.hardest$ = JSON.stringify(serverService).substring(26,29),
     (error) => console.log(error)
   );
 }

 delete(jobPostingId:any){
  this.serverService.deleteEmployerJobPosting(
    JSON.stringify({ID:jobPostingId}))
    .subscribe(
      (response) => console.log(response),
      (error) => console.log(error),
    );

  this.get();
 }

}
