import Works from "../components/Works"
import "../styles/Works.css"
export default function Experience(){
    var ciyaJobs = [
        "Developed iOS and Android driver application named CIYA!.",
        "Developed iOS and Android client application named MOKUMBUI.",
        "Flutter, Firebase, Google Maps API for real time location and RESTFul APIS for handeling backend logic, Third Party APIs for integerating payment methods are used in the development process.",
        "used PlayStore, TestFlight and AppStore Connect to make apps available both on testing and production."
    ]
    var belcashJobs = [
        "Developed iOS and android commercial wallet application named Helloopay.",
        "Developed iOS and Android buy now pay later application named Helloopay Corporate.",
        "Developed Backend application with NodeJS and MongoDB. It allows to manage e-Commerce datas by performing CRUD operations thats pushs recent products on the database and retrieve data using APIS.",
        "Developed Web application to that is used to manage ecommerce products.",
        "Developed iOS and android loan application. The app allows used to request for a loan, view loan application status, delete loan request, view settled loans with their details.",
        "Developed a backend application with NodeJS and MongoDB. It allows to manage loan data by performing CRUD operations.",
        "Developed a web admin application with flutter. To view, delete, update loan applications users requested using their mobile applications.",
        "Flutter, Firebase, RESTFul APIS for handeling backend logic are used for developing apps.",
        "used PlayStore, TestFlight and AppStore Connect to make apps available both on testing and production."
    ]
    var kkJobs = [
        "Prepared information architecture, took responsibility for coordinating the evaluation, development, and implementation of departmental record management policies, established and maintained office records.",
        "Coordinated customers, provided solutions to their issues, conducted information analysis.",
        "Reviewed the company's electronic document and record management system."
    ]
    return (
        <div className="expr--section">
            <h3> <i style={{paddingRight: "10px"}}>“The best way to predict the future is to create it.”  </i>  (Abraham Lincoln)</h3>
            <Works 
                companyName= "Ciya Sarl"
                jobTitle="Software Engineer"
                workType="Remote | Part Time"
                workingDuration="Oct 2022 - Apr 2023"
                jobs={ciyaJobs}

            />
            <Works 
                companyName= "Belcash Technology Solutions"
                jobTitle="Mobile Application Developer"
                workType=" Full Time"
                workingDuration="Aug 2021 - Present"
                jobs={belcashJobs}

            />
            <Works 
                companyName= "Kolfe Keranio Subcity"
                jobTitle="Information Management Expert"
                workType=" Full Time"
                workingDuration="Oct 2021 - Jul 2021"
                jobs={kkJobs}

            />
        </div>
    );
}