import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http';

@Injectable()
export class DataServiceService {

  constructor(private http: HttpClient) { }


  connectJobPostings(){
    return this.http.get('http://www.ugrad.cs.ubc.ca/~s3z0b/ServerConnect.php');
  }

  

  
}
