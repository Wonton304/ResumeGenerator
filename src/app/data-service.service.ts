import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Http , Headers} from '@angular/http';

@Injectable()
export class DataServiceService {

  constructor(private httpClient: HttpClient, private http: Http) { }

  connectJobPostings(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/ServerConnect.php');
  }

  updateJobDescription(description){
    return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/test.php', description);
  }

<<<<<<< HEAD
  connectApplicants(postId){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/applicantSelecting.php', postId);
  }
=======
  insertNewCompany(description){
    const headers = new Headers ({'Content-Type': 'application/json'});
    return this.http.post('../api/loginPageEmployer.php', description);
  }

>>>>>>> b34d91ee5bce216003fd268717792cc81099639c

  generateResume (postID){
    //return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/.php', postID);
  }

  createHobby(hobbyName){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/hobby.php', hobbyName);
  }
  
}
