import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Http , Headers} from '@angular/http';

@Injectable()
export class DataServiceService {

  constructor(private httpClient: HttpClient, private http: Http) { }

  connectJobPostings(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/ServerConnect.php');
  }

  connectResumeGen(resumeInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/resumeGenerator.php'), resumeInfo);
  }

//TODO: make these scripts

  getHobbies(email){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getHobbies.php'), email);
  }

  getExperiences(email){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getExperiences.php'), email);
  }

  getAwards(email){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getAwards.php'), email);
  }

  getCodingProjects(email){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getCodingProjects.php'), email);
  }

// up to here

  updateJobDescription(description){
    return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/test.php', description);
  }

  connectApplicants(postId){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/applicantSelecting.php', postId);
  }

  insertNewCompany(companyInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/loginPageEmployer.php', companyInfo);
  }

  insertNewApplicant(applicantInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/loginPageApplicant.php', applicantInfo);
  }

  generateResume (postID){
    //return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/.php', postID);
  }

  createHobby(hobbyName){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/hobby.php', hobbyName);
  }


  createProjectInfo(codingProjectInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/codingProjectInfo.php', codingProjectInfo);
  }

  createExperienceInfo(experienceInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/codingProjectInfo.php', experienceInfo);
  }

  // need updates
  createAward(award){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/codingProjectInfo.php', award);
  }

  // must include id to select individual !
  updateJobPosting(content, id){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/codingProjectInfo.php', content);
  }
// update needed
  updateTechnicalRequirement(content, id){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/codingProjectInfo.php', content);
  }
// update needed
  createJobPosting(content, id){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/codingProjectInfo.php', content);
  }
// update needed
  createTechnicalRequirement(content){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/codingProjectInfo.php', content);
  }

  deleteEmployerJobPosting(postingId){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/deletePosting.php', postingId);
  }
}
