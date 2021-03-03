using insidetrack.sample as sample from '../db/data-model';

service CatalogService {
    entity Projects  as projection on sample.Projects;
    entity Tasks     as projection on sample.Tasks;
    entity Members   as projection on sample.Members;
    entity Customers as projection on sample.Customers;
    entity Users     as projection on sample.Users;
    entity Status    as projection on sample.Status;
}