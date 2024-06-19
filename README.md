# Pic Seeker

## Objetivo
El objetivo de esta prueba técnica es evaluar tus habilidades en:
- Navegación
- Expresiones regulares
- Descarga de imágenes
- Habilitar zoom en una imagen
- Integración con dos fuentes de imágenes: Flickr y Unsplash

## Requisitos
- Xcode 12 o superior
- Swift 5.0 o superior

## Descripción del Proyecto
La aplicación debe permitir a los usuarios buscar y ver imágenes de Flickr y Unsplash. Algunas fotos vienen con una descripción que debe mostrarse en una tarjeta en la parte inferior de la imagen.

### Funcionalidades
1. **Navegación**: La aplicación debe tener una estructura de navegación que permita a los usuarios:
   - Buscar imágenes.
   - Ver el detalle de una imagen seleccionada.
2. **Expresiones Regulares**: Usar expresiones regulares para validar los términos de búsqueda.
3. **Descarga de Imágenes**: Descargar y mostrar imágenes de Flickr y Unsplash.
4. **Zoom en Imagen**: Permitir zoom en la imagen utilizando gestos de pellizco.
5. **Tarjeta de Descripción**: Mostrar la descripción de la imagen (si está disponible) en una tarjeta en la parte inferior.

## Estructura del Proyecto con UIKIT

```plaintext
.
├── README.md
├── [NombreDelProyecto].xcodeproj
├── [NombreDelProyecto]
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   ├── Models
│   │   ├── ImageModel.swift
│   │   └── SearchResultModel.swift
│   ├── Views
│   │   ├── ImageCardView.swift
│   │   ├── ImageDetailView.swift
│   │   ├── SearchView.swift
│   │   └── ZoomableImageView.swift
│   ├── ViewControllers
│   │   ├── ImageDetailViewController.swift
│   │   └── SearchViewController.swift
│   ├── Services
│   │   ├── ImageService.swift
│   │   ├── FlickrService.swift
│   │   └── UnsplashService.swift
│   ├── Utils
│   │   └── RegexValidator.swift
│   └── Resources
│       ├── Assets.xcassets
│       └── LaunchScreen.storyboard
└── Tests
    ├── [NombreDelProyecto]Tests.swift
    └── [NombreDelProyecto]UITests.swift

```
## Estructura del Proyecto con SwiftUI

```plaintext
.
├── README.md
├── [NombreDelProyecto].xcodeproj
├── [NombreDelProyecto]
│   ├── [NombreDelProyecto]App.swift
│   ├── Models
│   │   ├── ImageModel.swift
│   │   └── SearchResultModel.swift
│   ├── Views
│   │   ├── ImageCardView.swift
│   │   ├── ImageDetailView.swift
│   │   ├── SearchView.swift
│   │   └── ZoomableImageView.swift
│   ├── ViewModels
│   │   ├── ImageDetailViewModel.swift
│   │   └── SearchViewModel.swift
│   ├── Services
│   │   ├── ImageService.swift
│   │   ├── FlickrService.swift
│   │   └── UnsplashService.swift
│   ├── Utils
│   │   └── RegexValidator.swift
│   └── Resources
│       ├── Assets.xcassets
│       └── LaunchScreen.storyboard
└── Tests
    ├── [NombreDelProyecto]Tests.swift
    └── [NombreDelProyecto]UITests.swift
