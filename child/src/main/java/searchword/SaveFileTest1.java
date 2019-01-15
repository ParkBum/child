package searchword;

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

import java.util.Collection;

public class SaveFileTest1 {
	private static Logger log = LoggerFactory.getLogger(Word2VecTest1.class);

	public static void main(String[] args) throws Exception {
		Word2Vec vec2 = WordVectorSerializer.loadFullModel("word2vectest1result.txt");
		String filePath = new ClassPathResource("word2vectest1result.txt").getFile().getAbsolutePath();

		SentenceIterator iter = new BasicLineIterator(filePath);
		TokenizerFactory t = new DefaultTokenizerFactory();

		t.setTokenPreProcessor(new CommonPreprocessor());
		InMemoryLookupCache cache = new InMemoryLookupCache();
		WeightLookupTable<VocabWord> table = new InMemoryLookupTable.Builder<VocabWord>().vectorLength(100)
				.useAdaGrad(false).cache(cache).lr(0.025f).build();

		Word2Vec vec = new Word2Vec.Builder().minWordFrequency(1).iterations(1).epochs(1).layerSize(100).seed(42)
				.windowSize(5).iterate(iter).tokenizerFactory(t).lookupTable(table).vocabCache(cache).build();

		vec.fit(); // 학습하기

		WordVectorSerializer.writeFullModel(vec, "word2vectest1result.txt");
		Collection<String> lst = vec.wordsNearest("소음", 5);
		log.info("5 Words closest to '소음': {}", lst);
	}

}
