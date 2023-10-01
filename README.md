**4-Bit Optimized Nano Processor**

**Overview:**

Our project involved the design and optimization of a 4-bit Nano Processor. The development process spanned three stages, with each step focusing on enhancing performance and resource utilization. Key accomplishments included extending instruction support, improving the adder/subtractor unit, and optimizing various components.

**Key Stages:**

1. **1st Stage**: We constructed a basic nano processor. Components were developed separately and an assembly program was written to perform simple tasks.

2. **2nd Stage**: Significant improvements were made, including enhancing the adder/subtractor unit to handle 8-bit calculations, optimizing the register bank and MUXes for 8-bit values, and extending instruction support.

3. **3rd Stage**: The final design was meticulously optimized for both 4-bit and 8-bit processors. Techniques such as implementing slow clocks without using integer constants, writing components in high-level code, and utilizing DSP blocks in clocks were employed to minimize LUT and FF count.
Certainly! Below is a description of a **w-bit Nano Processor** that supports various instructions, including **add**, **mov**, **neg**, **jnz**, and **halt**. Additionally, the **8-bit Nano Processor** includes support for **sub**, **inc**, **dec**, **nop**, **mul**, and **div** instructions. 

---

**Instruction Set:**

Both the 4-bit and 8-bit versions of the nano processor feature a versatile instruction set designed to perform a range of operations efficiently. Here are the supported instructions:

**Common Instructions (4-bit and 8-bit):**
- **ADD** - Adds two values.
- **MOV** - Copies a value from one location to another.
- **NEG** - Negates a value.
- **JNZ** - Jumps to a specified location if a condition is met.
- **HALT** - Stops program execution.

**Additional Instructions (8-bit Nano Processor):**
- **SUB** - Subtracts one value from another.
- **INC** - Increments a value by 1.
- **DEC** - Decrements a value by 1.
- **NOP** - No operation; does nothing.
- **MUL** - Multiplies two values.
- **DIV** - Divides one value by another.

---

**Key Diagrams:**

![LUT Count Before and After Optimization](https://github.com/akw2000/Nano_processor_4bit/blob/main/screenshots/LUT_comparison.png)


**Collaborators:**

- **Joel Sathiyendra**
- **Inuka Ampavila**
- **Radith Samarakoon**
- **Udara Wijesinghe**
- **Kavindu Warnakulasuriya**

