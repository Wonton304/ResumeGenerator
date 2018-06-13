import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-a-job-posting-page',
  templateUrl: './a-job-posting-page.component.html',
  styleUrls: ['./a-job-posting-page.component.css']
})
export class AJobPostingPageComponent implements OnInit {

  postings$ = Object;
  constructor() { }

  ngOnInit() {
  }

}
