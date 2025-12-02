### Problem Concern Act Timing and Status
The statusCode of the Problem Concern Act is the definitive indication of the status of the concern, whereas the effectiveTime of the nested Problem Observation is the definitive indication of whether or not the underlying condition is resolved.

The effectiveTime/low of the Problem Concern Act asserts when the concern became active. The effectiveTime/high asserts when the concern was completed (e.g., when the clinician deemed there is no longer any need to track the underlying condition).

<figure>
  <img style="display:block;margin-left:auto;margin-right:auto;padding-top:0;padding-bottom:0px" width="640px" src="cda_problemactandproblemobs_timing.png"/>
  <figcaption>Problem Concern Act Timing Detail</figcaption>
</figure>
<br/>

A Problem Concern Act SHALL contain one Problem Observation (templateId 2.16.840.1.113883.10.20.22.4.4). The Problem Observation is a discrete observation of a condition, and therefore will have a statusCode of "completed". For instance, a Concern may contain a Problem Observation of "chest pain" that is still ongoing:
 - Problem Concern 1
   --- Problem Observation: Chest Pain (effectiveTime.high is empty) 
Or a Concern may contain a Problem Observation of "chest pain" that is still worrisome but the problem happened in the past:
 - Problem Concern 1
   --- Problem Observation: Chest Pain (effectiveTime.high is present and in the past) 
Many systems display the nested Problem Observation with the most recent author time stamp, and provide a mechanism for viewing prior observations.