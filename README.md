<!-- Improved compatibility of back to top link: See: https://github.com/lucaspittam/Arctiq-iac-Mission/ -->
<a name="readme-top"></a>

<!-- Arctiq Iac Mission -->
<!--
-->
[![LinkedIn][linkedin-shield]][linkedin-url]


<h3 align="center">Arctiq IAC Mission</h3>

  <p align="center">
    Terraform-Ansible-AWS
    </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## This project was built as a demo with the goal of leveraging Terraform and Ansible tooling to automate the creating and provisioning of AWS multi tier infrastructure and also using Github Actions for CI/CD. Thank you For Supporting!


<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* ## Terraform
* ## Ansible
* ## AWS
* ## GitHub Actions

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

This Project sets up:

* A VPC
* Two private subnets
* Two public subnet
* An internet gateway
* Route Table
* An internet gateway
* 2 security groups
* An SSH key pair
* Two publicly-accessible EC2 instances
* Within the instance:
   * Nginx
   * npm
   * node
   * git
 
 
## Setup

1. Set up Terraform Cloud Credentials

1. Set up AWS Credentials

1. Enter AWS Credentials and Terraform Cloud API Key on GitHub Repo As Environment Variables

1. Enter aws_region and t2_instance as repo secrets

1. Edit versions.tf in Torraform folder with created Organization and Workspace.


 ```sh
 terraform {

  cloud {
      organization = "Your Organization Here"

      workspaces {
        name = "Your Workspace Here"
      }
    }
  
}
```

###  Push to main to run

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Lucas Pittam - me@lucaspittam.com

Project Link: [https://github.com/lucaspittam/Arctiq-iac-Mission](https://github.com/lucaspittam/Arctiq-iac-Mission)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/lucaspittam/Arctiq-iac-Mission.svg?style=for-the-badge
[contributors-url]: https://github.com/lucaspittam/Arctiq-iac-Mission/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/lucaspittam/Arctiq-iac-Mission.svg?style=for-the-badge
[forks-url]: https://github.com/lucaspittam/Arctiq-iac-Mission/network/members
[stars-shield]: https://img.shields.io/github/stars/lucaspittam/Arctiq-iac-Mission.svg?style=for-the-badge
[stars-url]: https://github.com/lucaspittam/Arctiq-iac-Mission/stargazers
[issues-shield]: https://img.shields.io/github/issues/lucaspittam/Arctiq-iac-Mission.svg?style=for-the-badge
[issues-url]: https://github.com/lucaspittam/Arctiq-iac-Mission/issues
[license-shield]: https://img.shields.io/github/license/lucaspittam/Arctiq-iac-Mission.svg?style=for-the-badge
[license-url]: https://github.com/lucaspittam/Arctiq-iac-Mission/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/lucaspittam](https://www.linkedin.com/in/lucas-pittam-3209bb22b/)
[product-screenshot]: images/screenshot.png
[Terraform]: https://img.shields.io/badge/next.js-000000?style=for-the-badge&logo=nextdotjs&logoColor=white
[Ansible]: https://nextjs.org/
[AWS]: https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB
