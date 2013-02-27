package com.misc;

import java.io.*;
import java.util.*;
import java.util.concurrent.*;

import static java.lang.System.out;

public class BlockingQueueTest {
    public static void main (String [] args) {
        Scanner in = new Scanner(System.in);
        out.println("Enter base directory: ");
        String directory = in.nextLine();
        out.println("Enter keyword: ");
        String keyword = in.nextLine();

        final int FILE_QUEUE_SIZE = 10;
        final int FILES_THREAD_POOL_SIZE = 20;
        final int SEARCH_THREADS = 100;

        ExecutorService filesPool = Executors.newFixedThreadPool(FILES_THREAD_POOL_SIZE);
        BlockingQueue<File> queue = new ArrayBlockingQueue<File>(FILE_QUEUE_SIZE);
        Future<?> done = filesPool.submit(new FilesEnumeration(queue,
                    new File(directory), filesPool));

        for (int i = 1; i < SEARCH_THREADS; i++) new Thread(new
                SearchTask(queue, keyword)).start();
        try {
            done.get();
        } catch (ExecutionException ex) {
            ex.printStackTrace();
        } catch (InterruptedException ex) {}
        filesPool.shutdown();
    }

}

class FilesEnumeration implements Runnable {
    public static File DUMMY = new File("");

    private BlockingQueue<File> queue;
    private File searchDirectory;
    private ExecutorService pool;

    public FilesEnumeration(BlockingQueue<File> queue, File dir,
            ExecutorService pool) {
        this.queue = queue;
        this.searchDirectory = dir;
        this.pool = pool;
    }

    public void run() {
        try {
            enumerate(searchDirectory);
            queue.put(DUMMY);
        } catch (InterruptedException ex) {}
    }

    private void enumerate(File directory) throws InterruptedException {
        File[] files = directory.listFiles();
        for (File f : files) {
            if (f.isDirectory()) pool.submit(new FilesEnumeration(queue,
                        f, pool));
            else queue.put(f);
        }
    }
}

class SearchTask implements Runnable {
    private BlockingQueue<File> queue;
    private String keyword;

    public SearchTask(BlockingQueue<File> queue, String keyword) {
        this.queue = queue;
        this.keyword = keyword;
    }

    public void run() {
        try {
            boolean done = false;
            while (!done) {
                File file = queue.take();
                if (file == FilesEnumeration.DUMMY) {
                    queue.put(file);
                    done = true;
                }
                else search(file);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } catch (InterruptedException ex) {}
    }

    private void search(File file) throws IOException {
        Scanner in = new Scanner(new FileInputStream(file));
        int lineNumber = 0;
        while (in.hasNextLine()) {
            lineNumber++;
            String line = in.nextLine();
            if (line.contains(keyword)) out.printf("%s:%d:%s%n",
                    file.getPath(), lineNumber, line);

        }
        in.close();
    }
}
