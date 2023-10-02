import Lottie from "react-lottie"
import * as animationData from "../assets/animation_dev.json"
import SkillsComponent from "../components/SkillsComponent"
import "../styles/Works.css"
export default function Skills(){
    const defaultOptions = {
        loop:true,
        autopaly: true,
        animationData: animationData,
        renderSettings: {
            preserveAspectRatio: 'xMidYMid slice'
        }
    }
    var skills = [
        "HTML/CSS",
        "JavaScript",
        "React",
        "MongoDB",
        "MySQL",
        "Firebase",
        "Dart",
        "Flutter",
        "Android",
        "IOS",
        "GIT"
    ]
    return (
        <div className="skills-container">
            <div className="lottie">
            <Lottie 
                options={defaultOptions}
                height={500}
            />
            </div>        
            <div className="skills-section">
            <SkillsComponent 
                skills = {skills}/>
            </div>
            
            
        </div>
    )
}