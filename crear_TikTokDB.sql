-- Script de creación y carga de datos

-- Crear la base de datos TikTokDB
CREATE DATABASE TikTokDB;
USE TikTokDB;

-- Crear tablas de la base 
-- Tabla usuarios

CREATE TABLE usuarios (
	id_usuario INT AUTO_INCREMENT PRIMARY KEY,
	nombre_usuario VARCHAR(50) NOT NULL,
	email VARCHAR (100) NOT NULL UNIQUE,
	fecha_registro DATE NOT NULL,
	país VARCHAR (50) NOT NULL
);

-- Tabla vídeos

CREATE TABLE videos (
	id_video INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    TÍTULO VARCHAR (100) NOT NULL,
    descripción TEXT,
    fecha_publicación DATE NOT NULL,
    duración INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
    );
    
-- Crear tabla comentarios
    
CREATE TABLE comentarios (
	id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    id_video INT NOT NULL,
    id_usuario INT NOT NULL,
    texto TEXT NOT NULL,
    fecha_comentario DATE NOT NULL,
    FOREIGN KEY (id_video) REFERENCES videos (id_video),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
    );
    
-- Crear tabla likes

CREATE TABLE likes (
	id_like INT AUTO_INCREMENT PRIMARY KEY,
    id_video INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_like DATE NOT NULL,
    FOREIGN KEY (id_video) REFERENCES videos (id_video),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
    );
    
-- Crear tabla seguidores

CREATE TABLE seguidores (
	id_seguidor INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario_seguidor INT NOT NULL,
    id_usuario_seguido INT NOT NULL,
    fecha_seguimiento DATE NOT NULL,
  FOREIGN KEY (id_usuario_seguidor) REFERENCES usuarios (id_usuario),
  FOREIGN KEY (id_usuario_seguido) REFERENCES usuarios (id_usuario),
  CONSTRAINT chk_seguirse CHECK (id_usuario_seguidor <> id_usuario_seguido)
  );
    