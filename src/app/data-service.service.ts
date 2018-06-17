import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Http , Headers} from '@angular/http';

@Injectable()
export class DataServiceService {

  constructor(private httpClient: HttpClient
  , private http: Http) { }


  connectJobPostings(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/ServerConnect.php');
  }

  updateJobDescription(description){
    const headers = new Headers ({'Content-Type': 'application/json'});
    return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/test.php', description);
  }

  insertNewCompany(description){
    const headers = new Headers ({'Content-Type': 'application/json'});
    return this.http.post('../api/loginPageEmployer.php', description);
  }


}
