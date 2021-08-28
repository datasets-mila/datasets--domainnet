#!/bin/bash
set -o errexit -o pipefail

# this script is meant to be used with 'datalad run'

for file_url in \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/groundtruth/clipart.zip clipart.zip" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/infograph.zip infograph.zip" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/groundtruth/painting.zip painting.zip" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/quickdraw.zip quickdraw.zip" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/real.zip real.zip" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/sketch.zip sketch.zip" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/clipart_train.txt domainnet/txt/clipart_train.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/infograph_train.txt domainnet/txt/infograph_train.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/painting_train.txt domainnet/txt/painting_train.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/quickdraw_train.txt domainnet/txt/quickdraw_train.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/real_train.txt domainnet/txt/real_train.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/sketch_train.txt domainnet/txt/sketch_train.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/clipart_test.txt domainnet/txt/clipart_test.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/infograph_test.txt domainnet/txt/infograph_test.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/painting_test.txt domainnet/txt/painting_test.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/quickdraw_test.txt domainnet/txt/quickdraw_test.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/real_test.txt domainnet/txt/real_test.txt" \
	"http://csr.bu.edu/ftp/visda/2019/multi-source/domainnet/txt/sketch_test.txt domainnet/txt/sketch_test.txt"
do
        echo ${file_url} | git-annex addurl -c annex.largefiles=anything --raw --batch --with-files
done

md5sum *.zip domainnet/txt/*.txt > md5sums
