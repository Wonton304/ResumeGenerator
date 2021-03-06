import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Http , Headers} from '@angular/http';

@Injectable()
export class DataServiceService {

  constructor(private httpClient: HttpClient, private http: Http) { }

  connectJobPostings(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/getTechReqs.php');
  }

  findJobAttributes(jobAndAttribute){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getRTselect.php', jobAndAttribute);
  }

  applyApplicant(jobAndEmail){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/InsertAppliesTo.php', jobAndEmail);
  }

  getApplicantInfo(resumeInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/getAllAppAttributes.php', resumeInfo);
  }

  getApplicantHas(resumeInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/applicantHas.php', resumeInfo);
  }

  getApplicantMissing(resumeInfo){
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/applicantMissing.php', resumeInfo);
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
    return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/insertCodingProject.php', codingProjectInfo);
  }

  createExperienceInfo(experienceInfo){
    return this.http.post('http://www.ugrad.cs.ubc.ca/~s3z0b/insertExperience.php', experienceInfo);
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
    return this.httpClient.post('http://www.ugrad.cs.ubc.ca/~s3z0b/deleteJobPosting.php',postingId);
  }

  getMinimumProficiency(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/aggregateMinProficiency.php');
  }

  getMaximumProficiency(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/aggregateMaxProficiency.php');
  }

  getAverageProficiency(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/aggregateAvgProficiency.php');
  }

  getEasiestProficiency(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/nestedMinAggregateProficiency.php');
  }

  getHardestProficiency(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/nestedMaxAggregateProficiency.php');
  }

  getMinimumComplexity(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/aggregateMinComplexity.php');
  }

  getEasiestComplexity(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/nestedMinAggregateComplexity.php');
  }

  getHardestComplexity(){
    return this.httpClient.get('http://www.ugrad.cs.ubc.ca/~s3z0b/nestedMaxAggregateComplexity.php');
  }

}
