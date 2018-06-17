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
<<<<<<< HEAD
  
=======

  insertNewApplicant(applicantInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/loginPageApplicant.php', applicantInfo);
  }

  insertNewCompany(companyInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/loginPageEmployer.php', companyInfo);
  }

>>>>>>> e4613fc2f535b29a34b39cb98ebc86a844150b6a
  insertNewCompany(description){
    const headers = new Headers ({'Content-Type': 'application/json'});
    return this.http.post('../api/loginPageEmployer.php', description);
  }

  generateResume (postID){
    //return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/.php', postID);
  }

  createHobby(hobbyName){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/hobby.php', hobbyName);
  }
<<<<<<< HEAD
  

  createProjectInfo(codingProjectInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/codingProjectInfo.php', codingProjectInfo);
  }

  createExperienceInfo(experienceInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/codingProjectInfo.php', experienceInfo);
  }

  
=======

>>>>>>> e4613fc2f535b29a34b39cb98ebc86a844150b6a
}
