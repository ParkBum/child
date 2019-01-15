package searchword;

import java.util.Collection;

import org.datavec.api.util.ClassPathResource;
import org.deeplearning4j.models.embeddings.WeightLookupTable;
import org.deeplearning4j.models.embeddings.inmemory.InMemoryLookupTable;
import org.deeplearning4j.models.embeddings.loader.WordVectorSerializer;
import org.deeplearning4j.models.word2vec.VocabWord;
import org.deeplearning4j.models.word2vec.Word2Vec;
import org.deeplearning4j.models.word2vec.wordstore.inmemory.InMemoryLookupCache;
import org.deeplearning4j.text.sentenceiterator.BasicLineIterator;
import org.deeplearning4j.text.sentenceiterator.SentenceIterator;
import org.deeplearning4j.text.tokenization.tokenizer.preprocessor.CommonPreprocessor;
import org.deeplearning4j.text.tokenization.tokenizerfactory.DefaultTokenizerFactory;
import org.deeplearning4j.text.tokenization.tokenizerfactory.TokenizerFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SaveFileTest1 {
	private static Logger log = LoggerFactory.getLogger(SaveFileTest1.class);

	public static void main(String[] args) throws Exception {
		String filePath = new ClassPathResource("searchword/result.txt").getFile().getAbsolutePath();

		System.out.println(filePath);
		SentenceIterator iter = new BasicLineIterator(filePath);
		TokenizerFactory t = new DefaultTokenizerFactory();

		t.setTokenPreProcessor(new CommonPreprocessor());
		InMemoryLookupCache cache = new InMemoryLookupCache();
		WeightLookupTable<VocabWord> table = new InMemoryLookupTable.Builder<VocabWord>().vectorLength(100)
				.useAdaGrad(false).cache(cache).lr(0.025f).build();

		Word2Vec vec = WordVectorSerializer.loadFullModel("src/main/java/searchword/result.txt");
		Collection<String> lst = vec.wordsNearest("소음", 10);
		System.out.println("소음 관련 단어 10개 : " + lst);
	}

}
