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

public class DbWord2VecTest1 {

	public static void main(String[] args) throws Exception {		
		String filePath = new ClassPathResource("searchword/daycare2.txt").getFile().getAbsolutePath();

		SentenceIterator iter = new BasicLineIterator(filePath);
		TokenizerFactory t = new DefaultTokenizerFactory();

		t.setTokenPreProcessor(new CommonPreprocessor());
		InMemoryLookupCache cache = new InMemoryLookupCache();
		WeightLookupTable<VocabWord> table = new InMemoryLookupTable.Builder<VocabWord>().vectorLength(100)
				.useAdaGrad(false).cache(cache).lr(0.025f).build();

		Word2Vec vec = new Word2Vec.Builder().minWordFrequency(1).iterations(100).epochs(1).layerSize(100).seed(42)
				.windowSize(5).iterate(iter).tokenizerFactory(t).lookupTable(table).vocabCache(cache).build();

		vec.fit(); // 학습하기

		WordVectorSerializer.writeFullModel(vec, "src/main/java/searchword/result.txt");
		Collection<String> lst = vec.wordsNearest("홍익", 5);
		System.out.println("5 Words closest to '홍익': " + lst);
	}

}
