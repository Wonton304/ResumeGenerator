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

  connectApplicants(postId){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/applicantSelecting.php', postId);
  }

  generateResume (postID){
    //return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/.php', postID);
  }

  createHobby(hobbyName){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/hobby.php', hobbyName);
  }
  
}
