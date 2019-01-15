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

public class Word2VecTest1 {
	private static Logger log = LoggerFactory.getLogger(Word2VecTest1.class);

    public static void main(String[] args) throws Exception {
        String filePath = new ClassPathResource("searchword/seoul_new.txt").getFile().getAbsolutePath();

        log.info("Load & Vectorize Sentences....");
        // Strip white space before and after for each line
        SentenceIterator iter = new BasicLineIterator(filePath);
        // Split on white spaces in the line to get words
        TokenizerFactory t = new DefaultTokenizerFactory();

        /*
            CommonPreprocessor will apply the following regex to each token: [\d\.:,"'\(\)\[\]|/?!;]+
            So, effectively all numbers, punctuation symbols and some special symbols are stripped off.
            Additionally it forces lower case for all tokens.
         */
        t.setTokenPreProcessor(new CommonPreprocessor());
		InMemoryLookupCache cache = new InMemoryLookupCache();
		WeightLookupTable<VocabWord> table = new InMemoryLookupTable.Builder<VocabWord>()
		    .vectorLength(100)
		    .useAdaGrad(false)
		    .cache(cache)
		    .lr(0.025f).build();
/*
 * batchSize 는 한 번에 처리하는 단어의 양
 * minWordFrequency 는 단어가 말뭉치에 나타나야하는 최소 횟수입니다.  => 1이면 1회이상 언급. 2이면 2회이상 언급된 단어.
 *              여기에 5번 미만으로 나타나면 learn되지 않은것 입니다. 
 *              매우 큰 말뭉치에서는 최소 수준을 높이는 것이 좋다
 *              
 *              
 */
        log.info("Building model....");
        Word2Vec vec = new Word2Vec.Builder()
                .minWordFrequency(1)
                .iterations(1)
                .epochs(1)
                .layerSize(100)
                .seed(42)
                .windowSize(5)
                .iterate(iter)
                .tokenizerFactory(t)
                .lookupTable(table)
    		    .vocabCache(cache)
                .build();

        log.info("Fitting Word2Vec model....");
        vec.fit();

        log.info("Writing word vectors to text file....");

        // Prints out the closest 10 words to "day". An example on what to do with these Word Vector서울s.
        log.info("Closest Words:");
		WordVectorSerializer.writeFullModel(vec, "word2vectest1result.txt");
		Collection<String> lst = vec.wordsNearest("소음", 5);
        log.info("10 Words closest to '소음': {}", lst);

        // TODO resolve missing UiServer
//        UiServer server = UiServer.getInstance();
//        System.out.println("Started on port " + server.getPort());	
      }

}
