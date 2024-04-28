text = 'mi codigo de FreeCodeCamp'
custom_key = 'python'

def vigenere(message, key, direction=1):
    key_index = 0
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    final_message = ''

    for char in message.lower():

        # Agrega todo caracter que no sea una letra
        if not char.isalpha():
            final_message += char
        else:        
            # Encuentra el codigo para codificar o decodificar
            key_char = key[key_index % len(key)]
            key_index += 1

            # define el offset y encripta o desencripta cada letra
            offset = alphabet.index(key_char)
            index = alphabet.find(char)
            new_index = (index + offset*direction) % len(alphabet)
            final_message += alphabet[new_index]
    
    return final_message

def encrypt(message, key):
    return vigenere(message, key)
    
def decrypt(message, key):
    return vigenere(message, key, -1)

print(f'\nEncrypted text: {text}')
print(f'Key: {custom_key}')
decryption = decrypt(text, custom_key)
print(f'\nDecrypted text: {decryption}\n')