import { getPages } from "@/components/templates/page/page.helpers";

export default function Asd() {
  return <div>Page</div>
}


export async function getStaticPaths() {
  const pages = await getPages();

  return {
    paths: pages.map((page, i) => {
      return {
        params: {
          slug: [page.attributes.slug],
        }
      }
    }),
    fallback: false
  };
}
