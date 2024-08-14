terraform { 
  cloud { 
    
    organization = "aungkohtet" 

    workspaces { 
      name = "docker-akhlab" 
    } 
  } 
}
