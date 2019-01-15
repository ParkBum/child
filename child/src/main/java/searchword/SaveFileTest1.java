package searchword;

import java.util.Collection;

import org.deeplearning4j.models.embeddings.loader.WordVectorSerializer;
import org.deeplearning4j.models.word2vec.Word2Vec;

public class SaveFileTest1 {

	public static void main(String[] args) throws Exception {
		Word2Vec vec = WordVectorSerializer.loadFullModel("src/main/java/searchword/result.txt");
		Collection<String> lst = vec.wordsNearest("소음", 10);
		System.out.println("소음 관련 단어 10개 : " + lst);
	}

}
