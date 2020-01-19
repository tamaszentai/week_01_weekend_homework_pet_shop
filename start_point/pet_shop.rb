def pet_shop_name (pet_shop)
  return pet_shop[:name]
end

def total_cash (pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash (pet_shop, cash)
    pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, sold )
  return pet_shop[:admin][:pets_sold] += sold
end


def stock_count(pet_shop)
  return pet_shop[:pets].count
end


def pets_by_breed(pet_shop, breed)
  pets_array = []
  for pet in pet_shop[:pets]
     if breed == pet[:breed]
       pets_array.push(pet[:breed])
    end
  end
  return pets_array
end


def find_pet_by_name(pet_shop, pet_name)
  for pet in pet_shop[:pets]
    if pet_name == pet[:name]
      return pet
    end
  end
  return nil
end


def remove_pet_by_name(pet_shop, pet_name)
 for pet in pet_shop[:pets]
   if pet_name == pet[:name]
     pet_shop[:pets].delete(pet)
   end
  end
end


def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
  return pet_shop[:pets].count
end

def customer_cash (customer)
return customer[:cash]
end


def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
  return customer[:cash]
end

def customer_pet_count(customer)
  return customer[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
  return customer[:pets].count()
end

#############OPTIONAL###############

def customer_can_afford_pet (customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end



def sell_pet_to_customer(pet_shop, pet, customer)
  add_pet_to_customer(customer, pet)
  increase_pets_sold(pet_shop, 1)
  remove_customer_cash(customer, pet[:price])
  add_or_remove_cash(pet_shop, pet[:price])
end


def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
  else
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer_can_afford_pet(customer, pet) == true
    add_pet_to_customer(customer, pet)
    increase_pets_sold(pet_shop, 1)
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
  end
end
