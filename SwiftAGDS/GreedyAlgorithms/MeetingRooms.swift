//
//  MeetingRooms.swift
//  SwiftAGDS
//
//  Created by Hiroki Minami on 2023-04-13.
//

import Foundation

func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
  let sortedIntervals = intervals.sorted { $0[0] < $1[0] }
  
  for i in 0..<sortedIntervals.count-1 {
    if sortedIntervals[i][1] > sortedIntervals[i+1][0] {
      return false
    }
  }
  return true
}
