export default function SkillsComponent(props) {
    var skills = props.skills.map((skill, i) => <li key={i} >{skill}</li>)
    return (
        <div className="centerDiv">
           <ul className="skill-name">
            {skills}
           </ul>
        </div>
       
    );
}