#include <SFML/Graphics.hpp>

int main(int argc, char *argv[])
{
	sf::RenderWindow window(sf::VideoMode(800, 600), "myproject");

  	while (window.isOpen()) {
    	sf::Event Event;
    	while (window.pollEvent(Event)) {
      		if (Event.type == sf::Event::Closed)
    			window.close();
    	}

		window.clear(sf::Color(127, 255, 255));

    	window.display();
  	}
}