import { Injectable } from '@angular/core';
import {Http} from '@angular/http';

@Injectable()
export class DataServiceService {

  constructor(private http: Http) { }


  connectStore(){
    
    return this.http.request('http://www.ugrad.cs.ubc.ca/~s3z0b/ServerConnect.php');
  }
}
