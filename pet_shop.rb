def pet_shop_name(pet_shop)
  return pet_shop[:name]
end
#
def total_cash(pet_shop)
  total_cash = pet_shop[:admin][:total_cash]
  return total_cash
end

def add_or_remove_cash(pet_shop, cash)
  total_cash = pet_shop[:admin][:total_cash] += cash
 return total_cash
end

# def add_or_remove_cash(pet_shop, cash)
#   total_cash = pet_shop[:admin][:total_cash] -= cash
#  return total_cash
# end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, pets)
  sold = pet_shop[:admin][:pets_sold] += pets
  return sold
end

def stock_count(pet_shop)
  stock = pet_shop[:pets].count
  return stock
end

def pets_by_breed(pet_shop, breed)
   result = []
     for animal in pet_shop[:pets]
       if animal[:breed] == breed
         result << animal
       end
     end
     return result
 end

 def find_pet_by_name (pet_shop, name)
   for animal in pet_shop[:pets]
     if animal[:name] == name
       return animal
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
    for animal in pet_shop[:pets]
     if animal[:name] == name
        pet_shop[:pets].delete(animal)
      end
    end
    return nil
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
    stock = pet_shop[:pets].count
     return stock
end

def customer_cash(customers)
  customer_cash = customers[:cash]
   return customer_cash
 end

def remove_customer_cash(customers, amount)
  customer_cash = customers[:cash] -= amount
  return customer_cash
end

def customer_pet_count(customers)
  customers[:pets].count
end

def add_pet_to_customer(customers, new_pet)
  customers[:pets].push(new_pet)
    customers[:pets].count
end

def customer_can_afford_pet(customers, new_pet)
  if customers[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, x, customer)
   # find_pet_by_name(pet_shop, new_pet[:name])
   if x == nil
     p "Pet not found"
   else
    add_pet_to_customer(customer, x)
    increase_pets_sold(pet_shop, 1)
    remove_customer_cash(customer, x[:price])
    add_or_remove_cash(pet_shop, x[:price])
  end
end
