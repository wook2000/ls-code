/*
Step 1: Design Type
Step 2: Declare Type
Step 3: Check Type
Step 4 (if necessary): Override Type
*/

// Step 1: Design Type

interface Profile {
  email: string;
  slack: string;
}

interface Person {
  readonly personId: number;
  name: string;
  age: number;
  profile: Profile;
}

type PartialPerson = Partial<Person>;

interface Course {
  courseID: string;
  grade?: number;
  verdict?: 'pass' | 'not yet';
}

interface Student extends Person {
  kind: 'student';
  readonly startDate: number;
  track: string;
  currentCourse: string;
  coursesTaken: Course[];
}

interface currentStudents {
  [studentId: number]: Student;
}

type Staff = Person & {
  kind: 'staff';
  title: string;
  isCurrentStudent: boolean;
  isAlum: boolean;
};

type CommunityMember = Student | Staff;

// Pick<T, K extends keyof T>
type NameAndAge = Pick<Person, 'name' | 'age'>;

type CurrentCourse = Pick<Student, 'currentCourse'>;

// Omit<T, K extends keyof any>
type EmailOnly = Omit<Profile, 'slack' | 'phone'>;


// Step 2: Declare Type

function isStudent(member: CommunityMember): member is Student {
  return 'track' in member;
}

function getCurrentCourse(student: Student): string {
  return student.coursesTaken[-1].courseID;
}

function bioDescription(member: CommunityMember): string {
  let description: string;

  switch (member.kind) {
    case 'student':
      description = `${member.name} is a ${member.kind} currently going through ${member.currentCourse}.`;
      break;
    case 'staff':
      description = `${member.name} is a ${member.kind} currently serving as a ${member.title}.`;
      break;
    default:
      const _exhaustiveCheck: never = member;
      throw new Error(`Invalid member: ${JSON.stringify(_exhaustiveCheck)}`);
  }

  return description;
}

type BioDescriptionFunction = typeof bioDescription;
type Bio = ReturnType<BioDescriptionFunction>;

function displayBio(bio: Bio): void {
  console.log(bio);
}

function assessmentTally(...points: number[]): number {
  const total: number = points.reduce((total, point) => total + point, 0);
  return total;
}

type TallyParameters = Parameters<typeof assessmentTally>;

function getStudentInfo<T, K extends keyof T>(student: T, field: K): T[K] {
  return student[field];
}


// Step 3: Check Type

// Step 4 (if necessary): Override Type