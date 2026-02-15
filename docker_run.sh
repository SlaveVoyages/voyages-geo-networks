docker build . -t voyages-geo-networks:latest

docker run \
	-v ./tmp:/srv/voyages-geo-networks/tmp \
	--name voyages-geo-networks \
	-t voyages-geo-networks:latest
