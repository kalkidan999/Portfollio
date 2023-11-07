import Head from "next/head";

function Blog( { title, description } ){
    return (
        <>
            <Head>
                <title>{title}</title>
                <meta name="description" content={description}/>
            </Head>
            <h1 className="content" >Articles</h1>
        </>
    )
}

export default Blog

export async function getServerSideProps(){
    return {
        props: {
            title: "Article Title",
            description: "This is the article description."
        }
}
}