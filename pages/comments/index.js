import { useState } from "react"

function commentsPage(){

    const[comments, setComments] = useState([])
    const[comment, setComment] = useState('')

    const fetchComments = async ()=> {
        //// GET Request from API
        const response = await fetch('/api/comments')
        const data = await response.json()
        setComments(data)
    }
    const submitComments =async ()=> {
    /// POST request
    const response = await fetch('/api/comments',
    {
        method: 'POST',
        body: JSON.stringify({comment}),
        headers: {
            'Content-Type': 'application/json'
        }
    })
    const data2 = await response.json()
    console.log(data2)
    }
    return (
        <>
        <input type="text" value={comment} onChange={(e) => setComment(e.target.value)} />
        <button onClick={submitComments}> Submit Comment</button>
        <button onClick={fetchComments}> Load Comments</button>
        {
            comments.map(comment => {
                return (
                    <div key={comment.id}>
                        {comment.id}. {comment.text}
                    </div>
                )
            })
        }
        </>
    )
}

export default commentsPage