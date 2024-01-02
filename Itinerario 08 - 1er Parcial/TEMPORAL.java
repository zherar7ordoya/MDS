
public abstract class Forma {
    public abstract void dibujar();
}

public class Circulo extends Forma {
    @Override
    public void dibujar() {
        System.out.println("Dibujando un círculo");
    }
}

public class Cuadrado extends Forma {
    @Override
    public void dibujar() {
        System.out.println("Dibujando un cuadrado");
    }
}

public class Triangulo extends Forma {
    @Override
    public void dibujar() {
        System.out.println("Dibujando un triángulo");
    }
}

public class Main {
    public static void main(String[] args) {
        Forma forma1 = new Circulo();
        Forma forma2 = new Cuadrado();
        Forma forma3 = new Triangulo();

        forma1.dibujar(); // Salida: Dibujando un círculo
        forma2.dibujar(); // Salida: Dibujando un cuadrado
        forma3.dibujar(); // Salida: Dibujando un triángulo
    }
}

