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
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/resumeGenerator.php', resumeInfo);
  }

//TODO: make these scripts

  getHobbies(email){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getHobbies.php', email);
  }

  getExperiences(email){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getExperiences.php', email);
  }

  getAwards(email){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getAwards.php', email);
  }

  getCodingProjects(email){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getCodingProjects.php', email);
  }

// up to here
/**
  updateJobDescription(description){
    return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/test.php', description);
  } */

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
    return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/resumeGenerator.php', postID);
  }

  createHobby(hobby){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/Insert-Hobbies.php', hobby);
  }


  createProjectInfo(codingProjectInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/Insert-CodingProject.php', codingProjectInfo);
  }

  createExperienceInfo(experienceInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/insert-Experience.php', experienceInfo);
  }

  // need updates
  createAward(award){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/Insert-Awards.php', award);
  }


  updateJobPosting(content, id){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/updateJP.php', content);
  }

  updateTechnicalRequirement(content, id){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/updateTR.php', content);
  }

  createJobPosting(content, id){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/insertJP.php', content);
  }

  createTechnicalRequirement(content){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/insertTR.php', content);
  }

  deleteEmployerJobPosting(postingId){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/deleteJobPosting.php', postingId);
  }

  getMinimumProficiency(postingId){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/aggregateMinProficiency.php', postingId);
  }

  getMaximumProficiency(postingId){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/aggregateMaxProficiency.php', postingId);
  }

  getAverageProficiency(postingId){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/aggregateAvgProficiency.php', postingId);
  }


}
