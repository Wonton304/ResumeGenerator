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
  hardest$:Object;
  easiest$:Object;

  minIsVisible:boolean=false;
  maxIsVisible:boolean=false;
  avgIsVisible:boolean=false;
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
   this.maxIsVisible = false;
   this.avgIsVisible = false;
   this.easiestisVisible = false;
   this.hardestisVisible = false;
   this.serverService.getMinimumProficiency().subscribe(
    serverService => this.min$ = JSON.stringify(serverService).substring(29,30),
     (error) => console.log(error)
   );
   console.log(this.min$);
 }

 calcMax(){
   this.maxIsVisible = !this.maxIsVisible;
   this.minIsVisible = false;
   this.avgIsVisible = false;
   this.easiestisVisible = false;
   this.hardestisVisible = false;
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
   this.easiestisVisible = false;
   this.hardestisVisible = false;
   this.serverService.getAverageProficiency().subscribe(
    serverService => this.avg$ = JSON.stringify(serverService).substring(29,33),
     (error) => console.log(error)
   );
   console.log(this.avg$);
 }

 getEasiest(){
   this.easiestisVisible = !this.easiestisVisible;
   this.hardestisVisible = false;
   this.maxIsVisible = false;
   this.minIsVisible = false;
   this.avgIsVisible = false;
   this.serverService.getEasiestProficiency().subscribe(
    serverService => this.easiest$ = JSON.stringify(serverService).substring(34,38),
     (error) => console.log(error)
   );
 }

 getHardest(){
   this.hardestisVisible = !this.hardestisVisible;
   this.easiestisVisible = false;
   this.maxIsVisible = false;
   this.minIsVisible = false;
   this.avgIsVisible = false;
   this.serverService.getHardestProficiency().subscribe(
    serverService => this.hardest$ = JSON.stringify(serverService).substring(34,38),
     (error) => console.log(error)
   );
 }


}
