#Defining the most first parent of all other classes
class Entity:
    #Consctructor. Initialising basic attributes.
    def __init__(self,name="Unknown",**kwargs):
        self.name=name
        self.health=100
        self.age="Unknown"
        self.x=0
        self.y=0
    
    #Overriding basic method
    def __repr__(self):
        attr_str=", ".join(f"{k}={repr(v)}" for k,v in vars(self).items())
        return self.__class__.__name__+":\n"+attr_str+"\n"
    

# Example of inheritances of the parent Entity class
class Animal(Entity):
    def __init__(self,**kwargs): #Using any named parameters to define new animal instance
        super().__init__(**kwargs)
        self.alive=True

        for k,v in kwargs.items():
            setattr(self,k,v)

    # Defining basic method
    def move(self,speed):
        self.x+=speed
        self.y+=speed
        print (self.name,f"moved to new point x:{self.x}, y:{self.y}")

    def __repr__(self):
        return super().__repr__()

class Microchip():
    def __init__(self):
        self.type="Digital"
        self.software="Artificial Intelligence"

    def __repr__(self,**kwargs):
        return super().__repr__()

# Multiple inheritance
class CyberAnimal(Animal,Microchip):
    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        Microchip.__init__(self)
        
    def move(self, speed):
        return super().move(speed*2)
        
    def __repr__(self,**kwargs):
        return super().__repr__()
            
       
    

thing=Entity()
new_animal=Animal(name="Bear")
cyber_animal=CyberAnimal(name="Augmented Animal",legs=6, eyes=4)

print(thing)
print(new_animal)
print(cyber_animal)
new_animal.move(10)
cyber_animal.move(10) #New cyber_animal has a method of the Animal parent.
