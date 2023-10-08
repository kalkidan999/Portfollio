import { useState, useEffect } from "react";

function Dashboard(){
 const [isLoading, setIsLoading] = useState(true)
    const [dashboardData, setDashboardData] = useState(null)

    useEffect(()=> {
        async function fetchDashboardData(){
            const response = await fetch("http://localhost:4000/dashboard")
            const data = await response.json()

            setDashboardData(data)
            setIsLoading(false)
        }
        fetchDashboardData()
    }, []) // is empty array to run when the context is mounted only

    if(isLoading){
        return <h1>Loading....</h1>
    }

    return (
        <div>
            <h2>Dashboard</h2>
            <h2>Posts - {dashboardData.posts}</h2>
            <h2>Likes - {dashboardData.likes}</h2>
            <h2>Followers - {dashboardData.followers}</h2>
            <h2>Following - {dashboardData.following}</h2>
        </div>
    )

}

export default Dashboard