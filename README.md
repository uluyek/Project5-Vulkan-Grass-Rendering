Vulkan Grass Rendering
==================================

**University of Pennsylvania, CIS 565: GPU Programming and Architecture, Project 5**

* Keyu Lu
* Tested on: Windows 10, Dell Oman, NVIDIA GeForce RTX 2060

## Final Rendered Result
![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5.gif)

## Features Implemented

### Tessellation
I picked the triangle-tip shape from the paper, which is a combination of a quad near the ground and a triangle further up. The border between these two shapes is defined by a threshold in the interval [0, 1). The interpolation parameter for this shape is calculated using the equation
t = 0.5 + (u − 0.5) (1 − max(v−τ,0)/1−τ) for blade geometry 
![]()
![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/grass%20shape.jpg)

### Forces Simulations
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


