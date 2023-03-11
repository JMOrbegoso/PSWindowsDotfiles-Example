# Example Dotfiles

Open any Windows PowerShell host console (Except Windows Terminal) with administrator rights and run:

## 1. Install PSWindowsDotfiles module

```PowerShell
Install-Module -Name "PSWindowsDotfiles" -Repository "PSGallery" -Scope "AllUsers";
```

## 2. Configure Execution Policy

```PowerShell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass;
```

## 3. Import PSWindowsDotfiles

```PowerShell
Import-Module "PSWindowsDotfiles";
```

## 4. Clone this repository

```PowerShell
git clone https://github.com/JMOrbegoso/PSWindowsDotfiles-Example.git $HOME\PSWindowsDotfiles-Example
```

## 5. Install Dotfiles with PSWindowsDotfiles

```PowerShell
Install-Dotfiles $HOME\PSWindowsDotfiles-Example;
```
