<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <title>User Profile Setting | Bootstrap 4</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="./resources/css/fishInfoList.css">
  </head>
  <script>
  $(".card-header a").click(function(){
      $(this).find('.icon').toggleClass('fa-plus fa-minus');
});
  
  </script>
  <body>
    <div class="container">
        <div class="row">
            <div class="col-md-8 offset-md-2 col-12 profile-main mt-4">
                <div class="row">
                    <div class="col-md-4 col-12 mt-4 pl-0 accordion-group-one">
                        <div id="accordionMyStory" class="mb-2">
                          <div class="card rounded-0 story-card">
                            <div class="card-header rounded-0 pt-2 pb-2" id="headingMyStory">
                                <h6 class="mb-0">My Story</h6>
                                <a class="float-right" data-toggle="collapse" data-target="#collapseMyStory" aria-expanded="true" aria-controls="collapseMyStory">
                                    <i class="icon fa fa-minus"></i>
                                </a>
                            </div>
                            <div id="collapseMyStory" class="collapse show" aria-labelledby="headingMyStory" data-parent="#accordionMyStory">
                              <div class="card-body pt-2 pb-2">
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>About</strong></h6>
                                    <p class="section-content m-0">Write something about you.</p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Introduction</strong></h6>
                                    <p class="section-content m-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                    tempor incididunt.</p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Achievement</strong></h6>
                                    <p class="section-content m-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                    tempor incididunt.</p>
                                </div>
                                <button class="btn btn-info btn-sm">Edit</button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div id="accordionMyPlan">
                          <div class="card rounded-0 story-card">
                            <div class="card-header rounded-0 pt-2 pb-2" id="headingMyPlan">
                                <h6 class="mb-0">My Plan</h6>
                                <a class="float-right" data-toggle="collapse" data-target="#collapseMyPlan" aria-expanded="true" aria-controls="collapseMyPlan">
                                    <i class="icon fa fa-minus"></i>
                                </a>
                            </div>
                            <div id="collapseMyPlan" class="collapse show" aria-labelledby="headingMyPlan" data-parent="#accordionMyPlan">
                              <div class="card-body pt-2 pb-2">
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Current Plan : Basic Plan</strong></h6>
                                    <p class="section-content m-0">Your next charge is $1000 due March 8, 2018</p>
                                </div>
                                <div class="body-section mb-3">
                                    <ul>
                                        <li>400 Orders/Month</li>
                                        <li>10 GB storage</li>
                                        <li>5 Users</li>
                                        <li>Mobile App Access</li>
                                    </ul>
                                </div>
                                <button class="btn btn-success btn-sm">Upgrade Account</button>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-12 mt-4 accordion-group-two">
                        <div id="accordionUserInfo" class="mb-2">
                          <div class="card rounded-0 info-card">
                            <div class="card-header rounded-0 pt-2 pb-2" id="headingUserInfo">
                                <h6 class="mb-0">User Info</h6>
                                <a class="float-right" data-toggle="collapse" data-target="#collapseUserInfo" aria-expanded="true" aria-controls="collapseUserInfo">
                                    <i class="icon fa fa-minus"></i>
                                </a>
                            </div>
                            <div id="collapseUserInfo" class="collapse show" aria-labelledby="headingUserInfo" data-parent="#accordionUserInfo">
                              <div class="card-body pt-2 pb-2">
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Name</strong></h6>
                                    <p class="section-content m-0">Michael M. Finn</p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Address</strong></h6>
                                    <p class="section-content m-0">
                                        204 Pent Tower, sweet street, London.
                                    </p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Contact Number</strong></h6>
                                    <p class="section-content m-0">+91 9977001100</p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Email</strong></h6>
                                    <p class="section-content m-0">michael4747@gmail.com</p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Website</strong></h6>
                                    <p class="section-content m-0">abcxyz.com</p>
                                </div>
                                <button class="btn btn-danger btn-sm">Edit</button>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div id="accordionSocialStatistics">
                          <div class="card rounded-0 info-card">
                            <div class="card-header rounded-0 pt-2 pb-2" id="headingSocialStatistics">
                                <h6 class="mb-0">Social Statistics</h6>
                                <a class="float-right" data-toggle="collapse" data-target="#collapseSocialStatistics" aria-expanded="true" aria-controls="collapseSocialStatistics">
                                    <i class="icon fa fa-minus"></i>
                                </a>
                            </div>
                            <div id="collapseSocialStatistics" class="collapse show" lass="collapse show" aria-labelledby="headingSocialStatistics" data-parent="#accordionSocialStatistics">
                              <div class="card-body pt-2 pb-2">
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Followers</strong></h6>
                                    <p class="section-content m-0">233</p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Following</strong></h6>
                                    <p class="section-content m-0">114</p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Posts</strong></h6>
                                    <p class="section-content m-0">100</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-12 mt-4 pr-0 accordion-group-three">
                        <div id="accordionMyTasks" class="mb-2">
                          <div class="card rounded-0 story-card">
                            <div class="card-header rounded-0 pt-2 pb-2" id="headingMyTasks">
                                <h6 class="mb-0">My Tasks</h6>
                                <a class="float-right" data-toggle="collapse" data-target="#collapseMyTasks" aria-expanded="true" aria-controls="collapseMyTasks">
                                    <i class="icon fa fa-minus"></i>
                                </a>
                            </div>
                            <div id="collapseMyTasks" class="collapse show" aria-labelledby="headingMyTasks" data-parent="#accordionMyTasks">
                                <div class="card-body pt-2 pb-2">
                                    <div class="body-section mb-3">
                                        <p class="m-0">Completed Pre-Orders - 90%</p>
                                        <div class="progress">
                                          <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="body-section mb-3">
                                        <p class="m-0">Completed Orders - 40%</p>
                                        <div class="progress">
                                          <div class="progress-bar progress-bar-striped bg-success" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="body-section mb-3">
                                        <p class="m-0">Design New Ad - 20%</p>
                                        <div class="progress">
                                          <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="body-section mb-3">
                                        <p class="m-0">Conduct Feasibility Test - 60%</p>
                                        <div class="progress">
                                          <div class="progress-bar progress-bar-striped bg-warning" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="body-section mb-3">
                                        <p class="m-0">Conduct Domain Analysis - 80%</p>
                                        <div class="progress">
                                          <div class="progress-bar progress-bar-striped bg-danger" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                          </div>
                        </div>
                        <div id="accordionSaleStatistics">
                          <div class="card rounded-0 info-card">
                            <div class="card-header rounded-0 pt-2 pb-2" id="headingSaleStatistics">
                                <h6 class="mb-0">Sale Statistics</h6>
                                <a class="float-right" data-toggle="collapse" data-target="#collapseSaleStatistics" aria-expanded="true" aria-controls="collapseSaleStatistics">
                                    <i class="icon fa fa-minus"></i>
                                </a>
                            </div>
                            <div id="collapseSaleStatistics" class="collapse show" lass="collapse show" aria-labelledby="headingSaleStatistics" data-parent="#accordionSaleStatistics">
                              <div class="card-body pt-2 pb-2">
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Today</strong></h6>
                                    <p class="section-content m-0">$400.00</p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Last Week</strong></h6>
                                    <p class="section-content m-0">$1140.00</p>
                                </div>
                                <div class="body-section mb-3">
                                    <h6 class="section-heading mb-1"><strong>Last Month</strong></h6>
                                    <p class="section-content m-0">$8010.00</p>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>