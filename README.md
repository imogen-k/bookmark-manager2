# Bookmark Manager

### To set up the database

Connect to `psql` and create the `bookmark_manager` database:

```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

## User Stories ##

```
As an internet user,
So that I can revisit internet pages that I like
I want to see a list of my bookmarks
```

![first story domain model](https://github.com/JR-G/bookmark-manager/blob/master/img/first_story_model.png)

```
As an internet user,
So that I can save internet pages I like
I want to add urls to my list of my bookmarks
```
