import { sql } from 'drizzle-orm';
import { sqliteTable, text, integer } from 'drizzle-orm/sqlite-core';

// Users table
export const users = sqliteTable('users', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  firstName: text('first_name').notNull(),
  lastName: text('last_name').notNull(),
  email: text('email').notNull(),
  password: text('password').notNull(),
  role: text('role').notNull(),
  address: text('address').notNull(),
  status: text('status').notNull(),
  timestamp: text('timestamp').default(sql`CURRENT_TIMESTAMP`).notNull(),
});

// Properties table
export const properties = sqliteTable('properties', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  title: text('title').notNull(),
  price: integer('price').notNull(),
  deposit: integer('deposit').notNull(),
  propertyType: text('property_type').notNull(),
  room: integer('room'),
  furnishingStatus: text('furnishing_status').notNull(),
  address: text('address').notNull(),
  city: text('city').notNull(),
  state: text('state').notNull(),
  zipCode: integer('zip_code').notNull(),
  status: text('status').notNull(),
  description: text('description').notNull(),
  agreementStartDate: text('agreement_start_date'),
  agreementEndDate: text('agreement_end_date'),
  timestamp: text('timestamp').default(sql`CURRENT_TIMESTAMP`).notNull(),
});

// Features table
export const features = sqliteTable('features', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  propertyId: integer('property_id').references(() => properties.id),
  feature: text('feature').notNull(),
  bedRoom: integer('bed_room').notNull(),
  bathRoom: integer('bath_room').notNull(),
  sqFeet: integer('sq_feet').notNull(),
  locationUrl: text('location_url').notNull(),
  parking: integer('parking').notNull(), // 1 for true, 0 for false
  basement: integer('basement').notNull(), // 1 for true, 0 for false
  floor: integer('floor'),
  floorDirection: text('floor_direction'),
  numberFloors: integer('number_floors'),
  timestamp: text('timestamp').default(sql`CURRENT_TIMESTAMP`).notNull(),
});

// Images table
export const images = sqliteTable('images', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  propertyId: integer('property_id').references(() => properties.id),
  imageUrl: text('image_url').notNull(),
  timestamp: text('timestamp').default(sql`CURRENT_TIMESTAMP`).notNull(),
});

// Likes and Dislikes table
export const likesDislikes = sqliteTable('likes_dislikes', {
  id: integer('id').primaryKey({ autoIncrement: true }),
  userId: integer('user_id').references(() => users.id).notNull(),
  propertyId: integer('property_id').references(() => properties.id).notNull(),
  likeDislike: integer('like_dislike').notNull(), // 1 for like, 0 for dislike
  timestamp: text('timestamp').default(sql`CURRENT_TIMESTAMP`).notNull(),
});
