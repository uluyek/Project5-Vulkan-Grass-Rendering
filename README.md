Vulkan Grass Rendering
==================================

**University of Pennsylvania, CIS 565: GPU Programming and Architecture, Project 5**

* Keyu Lu
* Tested on: Windows 10, Dell Oman, NVIDIA GeForce RTX 2060

## Overview
This project features the implementation of a real-time grass rendering system using Vulkan. The primary goal was to simulate and render realistic grass dynamics efficiently on modern GPUs. The project involves using compute shaders for physics calculations on Bezier curves, which represent individual grass blades, and implementing various culling methods to enhance performance by reducing unnecessary computations. Advanced graphics techniques such as tessellation were employed to generate detailed grass geometry dynamically. This README provides an overview of the implemented features, including force simulation effects like gravity and wind, and various culling strategies, alongside a comprehensive performance analysis demonstrating the efficacy of these optimizations in different scenarios.

## Final Rendered Result
![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5.gif)

## Features Implemented

### Tessellation
I picked the triangle-tip shape from the paper, which is a combination of a quad near the ground and a triangle further up. The border between these two shapes is defined by a threshold in the interval [0, 1). The interpolation parameter for this shape is calculated using the equation
t = 0.5 + (u − 0.5) (1 − max(v−τ,0)/1−τ) for blade geometry 

![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/blade%20shape.jpg)
![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/grass%20shape.jpg)

### Forces Simulations
Different physical forces affect the grass blades, simulating realistic movements and interactions:
**Baseline rendering with no force on**

![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5no%20force.gif)

**Gravity** 

![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20gravity%20force.gif)

**Recovery**

![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20gravity%20force%20%2B%20rec%20force.gif)

**Wind**

![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20all%20force.gif)


### Culling features

**Baseline rendering with no culling on**

![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20culling%20off.gif)

**Culling feature -- Orientation culling**

![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20culling%2021.gif)

**Culling feature -- View-frustum culling**

![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20culling%20frustum.gif)

**Culling feature -- Distance culling**

![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20culling%20distance.gif)

### Performance Analysis

To evaluate the impact of various features and optimizations, I conducted several tests focusing on frame rate (FPS) as a function of grass blade count and different culling methods. Here are the insights and results:

General Observations:

- Implementing culling significantly improved FPS, especially at higher blade counts.
- The combination of orientation and view-frustum culling provided the most performance benefit.

**FPS Data**
| Culling Type                  | Blade Count | FPS at 8 | FPS at 10 | FPS at 12 | FPS at 14 | FPS at 16 | FPS at 18 | FPS at 20 |
|-------------------------------|-------------|----------|-----------|-----------|-----------|-----------|-----------|-----------|
| Distance Culling On Only      | 8-20        | 12194    | 10880     | 5950      | 1830      | 580       | 160       | 40        |
| All Culling Off               | 8-20        | 11648    | 9390      | 3523      | 1104      | 324       | 85        | 21        |
| Orient Culling On             | 8-20        | 11800    | 9860      | 4620      | 1375      | 400       | 107       | 27        |
| Orient and Frustum Culling On | 8-20        | 11900    | 10360     | 4800      | 1580      | 500       | 134       | 34        |
| All Culling On                | 8-20        | 11960    | 10630     | 7500      | 2700      | 890       | 245       | 64        |


**Reference Chart**
![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/565%20performance%20analysis.jpg)

**Conclusion:**

The data clearly shows that culling is essential for maintaining high FPS, particularly as the number of grass blades increases.
Distance culling alone shows significant performance improvements at higher blade counts but is less effective at lower counts compared to other methods.
The combination of orientation and view-frustum culling strikes the best balance between visual fidelity and performance efficiency.
These results emphasize the importance of culling in real-time grass rendering, demonstrating how different culling techniques can be leveraged to optimize performance while maintaining visual quality in dynamic 3D scenes.



