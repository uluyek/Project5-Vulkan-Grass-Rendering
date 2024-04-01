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
![]()

### Forces Simulations
**Gravity** 
![]()

**Recovery**
![]()

**Wind**
![]()


### Culling features

**Baseline rendering with no culling on**
![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20culling%20off.gif)

**Culling feature -- Orientation culling**
![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20culling%20off.gif)

**Culling feature -- View-frustum culling**
![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20culling%20off.gif)

**Culling feature -- Distance culling**
![](https://github.com/uluyek/Project5-Vulkan-Grass-Rendering/blob/main/project5%20culling%20off.gif)


