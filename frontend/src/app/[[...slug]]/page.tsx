export default function Asd() {
  return <div>Page</div>
}


export async function getStaticPaths() {
  const pages = Array.from({ length: 5 }, (_, i) => i).map((id: number) => ({
    id,
    title: `Title ${id}`,
    content: `Content ${id}`,
    slug: [`${id}`]
  }));

  const paths = pages.map((page: any) => ({
    params: {
      id: page.id,
      slug: page.slug
    },
  }));

  // console.log('@@@ paths | ', paths);

  return { paths, fallback: false }
}
