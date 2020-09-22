## Description
Seattle Grace is based off of Grey's Anatomy, but you need NO knowledge of Grey's Anatomy to complete this final.
Hospitals have many Doctors,
Doctors work for just one hospital.

Doctors have many surgeries and surgeries can have many doctors.

You will need to create all migrations. Make sure to read all instructions, tasks, and user stories before getting started.
## Database Information
* Hospitals have a name
* Doctors have a name, specialty, and university that they attended
* Surgeries have a title, day of the week ("Monday", "Tuesday", "Friday", etc...), and operating_room_number
## User Stories
```
User Story 1, Surgery Index
As a visitor
When I visit a surgery’s index page (‘/surgeries’)
I see the title of all surgeries
And for each surgery I see the names of all doctors performing that surgery
```
```
User Story 2 , Surgery Show Page
As a visitor
When I visit the surgery index page
I can click on any surgery title to take me to that surgery’s show page
And on the show page I see the title and operating room number of that surgery
And I see a section of the page that says "Other surgeries happening this day of the week:"
And under that header I see titles of all surgeries that happen on the same day of the week as this surgery.
(Note: You do not need to use the created_at or updated_at columns for Surgeries)
```
```
User Story 3, Add a Doctor to a Surgery
As a visitor
When I visit a surgery's show page
I see a field with instructions to "Add A Doctor To This Surgery"
When I input the name of a Doctor into that field
And I click submit
I'm taken back to that surgery's show page
And I see the name of that doctor listed on the page
(Note: you do not need to handle any sad paths)
```
## Extensions
```
Extension, Hospital Surgery Index
As a visitor
When I visit a hospital’s surgery index (‘/hospitals/:id/surgeries’)
I see the titles of all surgeries associated with this hospital
And those surgeries are grouped by operating room
For example:
Operating Room #4311
Appendectomy
Cataract Removal
Operating Room #9500
Tonsillectomy
