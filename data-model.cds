namespace insidetrack.sample;

entity Projects {
    key projectCode : String                   @title : 'Project Code';
        projectName : String                   @title : 'Project Name';
        toCustomer  : Association to Customers @title : 'Customer';
        toManager   : Association to Users     @title : 'Manager';
        startsAt    : DateTime                 @title : 'Starts At';
        endsAt      : DateTime                 @title : 'Ends At';
        toStatus    : Association to Status    @title : 'Status';
        toTasks     : Composition of many Tasks
                          on toTasks.projectCode = $self.projectCode;
}

entity Tasks {
    key projectCode : String                @title : 'Project Code';
    key taskId      : Integer               @title : 'Task Id';
        description : String                @title : 'Description';
        startsAt    : DateTime              @title : 'Starts At';
        endsAt      : DateTime              @title : 'Ends At';
        toStatus    : Association to Status @title : 'Status';
        toMembers   : Composition of many Members
                          on  toMembers.projectCode = $self.projectCode
                          and toMembers.taskId      = $self.taskId;
        toProject   : Association to Projects
                          on toProject.projectCode = $self.projectCode;
}

entity Members {
    key projectCode : String               @title : 'Project Code';
    key taskId      : Integer              @title : 'Task Id';
    key toMember    : Association to Users @title : 'Member';
        toTask      : Association to Tasks
                          on  toTask.projectCode = $self.projectCode
                          and toTask.taskId      = $self.taskId;
        toProject   : Association to Projects
                          on toProject.projectCode = $self.projectCode;
}

entity Customers {
    key customer : String @title : 'Customer';
        name     : String @title : 'Name';
}

entity Users {
    key user      : String @title : 'User ID';
        firstName : String @title : 'First Name';
        lastName  : String @title : 'Last Name';
        fullName  : String @title : 'Full Name';
}

entity Status {
    key status : Integer @title : 'Status';
        text   : String  @title : 'Text';
}