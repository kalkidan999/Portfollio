import Footer from '@/layout/Footer'
import Header from '@/layout/Header'
import Head from 'next/head'
import 'styles/global.css'
import "styles/layout.css"
import "bootstrap/dist/css/bootstrap.min.css"

function MyApp( { Component, pageProps } ) {
    
    if(Component.getLayout){
        return <>
        <Head>
        <title>Portoflio</title>
        <meta name='description' content='Free content'/>
        </Head>
       {
         Component.getLayout(<Component {...pageProps}/>)
       }
        </>
    }

    return (
    <>
         <Head>
        <title>Portoflio</title>
        <meta name='description' content='Free content'/>
    </Head>
        <Header />
        <Component {...pageProps} />
        <Footer />
    </>
    )
}

export default MyApp