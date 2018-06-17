import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Http } from '@angular/http';

@Injectable()
export class DataServiceService {

  constructor(private httpClient: HttpClient
  , private http: Http) { }


  connectJobPostings(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/ServerConnect.php');
  }

  

  updateJobDescription(description: any[]){
    return this.http.post('https://www.ugrad.cs.ubc.ca/~s3z0b/UpdateJobDescription.php', description)

  }

  
}
