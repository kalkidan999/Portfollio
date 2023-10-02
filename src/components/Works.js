export default function Works(props){
    var jobs = props.jobs.map((job, i) => <li key={i}>{job}</li>)
    return (
        <div className="work-section">
            <div className="work--intro">
                
                <div className="work-intro--jobtitle">
                    <h3>{props.companyName}</h3>
                    <h4>{props.jobTitle} |<i>{props.workType}</i></h4>
                </div>
                <h5>Oct 2022 - Apr 2023</h5>
            </div>
                <ul className="work-intro--joblist">
                    {jobs}
                </ul>
            
        </div>
    );
}