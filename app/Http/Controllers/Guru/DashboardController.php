<?php

namespace App\Http\Controllers\Guru;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\ClassModel;
use App\Models\Student;
use App\Models\Activity;
use App\Models\ActivitySubmission;
use Inertia\Inertia;
use Inertia\Response;

class DashboardController extends Controller
{
    /**
     * Display the guru dashboard.
     */
    public function index(): Response
    {
        $currentUser = auth()->user();
        
        // Get classes taught by this teacher
        $teacherClasses = ClassModel::where('teacher_id', $currentUser->id)
            ->with(['students.user', 'students.biodata'])
            ->orderBy('name')
            ->get();

        // Prepare classes data with student count and academic year
        $classesData = $teacherClasses->map(function ($class) {
            return [
                'id' => $class->id,
                'name' => $class->name,
                'grade' => $class->grade,
                'section' => $class->section,
                'academic_year' => $class->academic_year,
                'student_count' => $class->students->count(),
            ];
        });

        // Get selected class from request or use the first one
        $selectedClassId = request()->query('class_id');
        
        if ($selectedClassId) {
            $selectedClass = $teacherClasses->firstWhere('id', (int)$selectedClassId);
        } else {
            $selectedClass = $teacherClasses->first();
        }

        // Collect all students from selected class
        $students = [];
        $studentJournals = [];

        if ($selectedClass) {
            foreach ($selectedClass->students as $student) {
                $studentUser = $student->user;
                if ($studentUser) {
                    $studentData = [
                        'id' => $studentUser->id,
                        'name' => strtoupper($studentUser->name),
                        'class' => $selectedClass->name,
                        'nis' => $student->nis ?? '-',
                        'religion' => $student->religion ?? 'ISLAM',
                        'gender' => $student->gender ?? 'L',
                    ];
                    
                    $students[] = $studentData;

                    // Get recent activity submissions for this student
                    $submissions = ActivitySubmission::where('student_id', $student->id)
                        ->with('activity')
                        ->orderBy('date', 'desc')
                        ->limit(5)
                        ->get()
                        ->map(function ($submission) {
                            return [
                                'id' => $submission->id,
                                'activity' => $submission->activity->title ?? 'Activity',
                                'date' => $submission->date->format('d/m/Y'),
                                'status' => $submission->status,
                                'notes' => $submission->notes,
                            ];
                        });

                    $studentJournals[$studentUser->id] = $submissions;
                }
            }
        }

        $selectedClassData = $selectedClass ? [
            'id' => $selectedClass->id,
            'name' => $selectedClass->name,
            'grade' => $selectedClass->grade,
            'section' => $selectedClass->section,
            'academic_year' => $selectedClass->academic_year,
            'student_count' => $selectedClass->students->count(),
        ] : null;

        return Inertia::render('guru/dashboard', [
            'classes' => $classesData,
            'selectedClass' => $selectedClassData,
            'students' => $students,
            'studentJournals' => $studentJournals,
        ]);
    }

    /**
     * Display student activities for viewing.
     */
    public function showStudentActivities(int $studentId): Response
    {
        $user = User::findOrFail($studentId);
        $student = Student::where('user_id', $studentId)->firstOrFail();

        // Get all activities from database ordered by order column
        $activitiesFromDb = Activity::orderBy('order')->get();
        
        $activities = $activitiesFromDb->map(function ($activity) use ($student) {
            // Check if student has submitted this activity today
            $todaySubmission = ActivitySubmission::where('student_id', $student->id)
                ->where('activity_id', $activity->id)
                ->whereDate('date', today())
                ->exists();

            return [
                'id' => $activity->id,
                'title' => $activity->title,
                'icon' => $activity->icon,
                'color' => $activity->color,
                'completed' => $todaySubmission,
            ];
        })->toArray();

        return Inertia::render('guru/student-activities', [
            'student' => [
                'id' => $user->id,
                'name' => $user->name,
                'religion' => $student->religion ?? 'ISLAM',
                'gender' => $student->gender ?? 'L',
                'progress' => $this->getStudentProgress($student->id),
            ],
            'activities' => $activities,
        ]);
    }

    /**
     * Calculate student progress percentage for current month.
     */
    private function getStudentProgress(int $studentId): int
    {
        $today = today();
        $startOfMonth = $today->copy()->startOfMonth();
        $endOfMonth = $today->copy()->endOfMonth();

        // Get total possible submissions (7 activities per day)
        $daysPassed = $today->diffInDays($startOfMonth) + 1;
        $totalPossible = $daysPassed * 7;

        // Get actual submissions
        $actualSubmissions = ActivitySubmission::where('student_id', $studentId)
            ->whereBetween('date', [$startOfMonth, $endOfMonth])
            ->count();

        if ($totalPossible === 0) {
            return 0;
        }

        return (int)round(($actualSubmissions / $totalPossible) * 100);
    }

    /**
     * Display student activity detail page for input.
     */
    public function showStudentActivityDetail(int $studentId, int $activityId): Response
    {
        $student = User::where('role', User::ROLE_SISWA)
            ->findOrFail($studentId);

        // Mock data for now - TODO: Get from database
        $activities = [
            1 => ['title' => 'Bangun Pagi', 'icon' => '☀️', 'color' => 'bg-orange-100'],
            2 => ['title' => 'Berbakti', 'icon' => '🙏', 'color' => 'bg-blue-100'],
            3 => ['title' => 'Berolahraga', 'icon' => '⚽', 'color' => 'bg-green-100'],
            4 => ['title' => 'Gemar Belajar', 'icon' => '📚', 'color' => 'bg-yellow-100'],
            5 => ['title' => 'Makan Makanan Sehat dan Bergizi', 'icon' => '🍎', 'color' => 'bg-pink-100'],
            6 => ['title' => 'Bermasyarakat', 'icon' => '👨‍👩‍👧‍👦', 'color' => 'bg-purple-100'],
            7 => ['title' => 'Tidur Cepat', 'icon' => '🌙', 'color' => 'bg-indigo-100'],
        ];

        $activityData = $activities[$activityId] ?? $activities[1];

        // Generate mock tasks for the month
        $tasks = [];
        for ($i = 1; $i <= 10; $i++) {
            $tasks[] = [
                'id' => $i,
                'tanggal' => $i,
                'waktu' => 'Masukan Jawaban',
                'jawaban' => '',
                'approval_orangtua' => false,
                'bukti_foto' => null,
            ];
        }

        return Inertia::render('guru/student-activity-detail', [
            'student' => [
                'id' => $student->id,
                'name' => $student->name,
            ],
            'activity' => [
                'id' => $activityId,
                'title' => $activityData['title'],
                'icon' => $activityData['icon'],
                'color' => $activityData['color'],
                'month' => 'OKTOBER',
                'tasks' => $tasks,
            ],
        ]);
    }

    /**
     * Submit student activity task.
     */
    public function submitStudentTask(int $studentId, int $activityId, int $taskId)
    {
        // TODO: Save task submission to database
        
        return redirect()->back()->with('success', 'Task berhasil disubmit!');
    }

    /**
     * Display student biodata page.
     */
    public function showStudentBiodata(int $studentId): Response
    {
        $user = User::findOrFail($studentId);
        $student = Student::where('user_id', $studentId)->firstOrFail();
        $biodata = $student->biodata;

        $biodataArray = $biodata ? [
            'hobbies' => array_filter(explode(',', $biodata->hobi ?? '')),
            'aspirations' => array_filter([$biodata->cita_cita ?? '']),
            'favorite_foods' => array_filter([$biodata->makanan_kesukaan ?? '']),
            'disliked_foods' => [],
            'favorite_animals' => array_filter([$biodata->hewan_kesukaan ?? '']),
            'disliked_items' => array_filter(explode(',', $biodata->sesuatu_tidak_suka ?? '')),
            'favorite_drinks' => array_filter([$biodata->minuman_kesukaan ?? '']),
        ] : [
            'hobbies' => [],
            'aspirations' => [],
            'favorite_foods' => [],
            'disliked_foods' => [],
            'favorite_animals' => [],
            'disliked_items' => [],
            'favorite_drinks' => [],
        ];

        return Inertia::render('guru/student-biodata', [
            'student' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email ?? '-',
                'religion' => $student->religion ?? '-',
                'gender' => $student->gender ?? '-',
                'nis' => $student->nis ?? '-',
                'birth_date' => $student->date_of_birth ? $student->date_of_birth->format('d-m-Y') : '-',
                'address' => $student->address ?? '-',
                'photo' => $student->photo ?? null,
            ],
            'biodata' => $biodataArray,
        ]);
    }
}
