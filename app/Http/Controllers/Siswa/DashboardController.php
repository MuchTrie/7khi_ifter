<?php

namespace App\Http\Controllers\Siswa;

use App\Http\Controllers\Controller;
use App\Models\Activity;
use App\Models\ActivitySubmission;
use App\Models\ActivityDetail;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;
use Inertia\Response;

class DashboardController extends Controller
{
    /**
     * Display the siswa dashboard.
     */
    public function index(): Response
    {
        $activities = Activity::orderBy('order')->get();

        return Inertia::render('siswa/dashboard', [
            'activities' => $activities,
        ]);
    }

    /**
     * Display the activity detail page.
     * Route to specific activity detail page based on activity title.
     */
    public function show(Activity $activity): Response
    {
        /** @var \App\Models\User $user */
        $user = auth()->user();
        $title = strtolower($activity->title);

        // Determine which specific detail page to render
        if (str_contains($title, 'berbakti') || str_contains($title, 'beribadah')) {
            // "Berbakti" in database is actually "Beribadah" with muslim/non-muslim variants
            if ($user->religion === 'muslim') {
                return $this->beribadahMuslimDetail($activity);
            } else {
                return $this->beribadahNonmuslimDetail($activity);
            }
        } elseif (str_contains($title, 'bangun pagi')) {
            return $this->bangunPagiDetail($activity);
        } elseif (str_contains($title, 'berolahraga')) {
            return $this->berolahragaDetail($activity);
        } elseif (str_contains($title, 'gemar belajar')) {
            return $this->gemarBelajarDetail($activity);
        } elseif (str_contains($title, 'makan') && str_contains($title, 'sehat')) {
            return $this->makanSehatDetail($activity);
        } elseif (str_contains($title, 'bermasyarakat')) {
            return $this->bermasyarakatDetail($activity);
        } elseif (str_contains($title, 'tidur cepat')) {
            return $this->tidurCepatDetail($activity);
        }

        // Fallback if no specific page matches
        $nextActivity = Activity::where('order', '>', $activity->order)
            ->orderBy('order', 'asc')
            ->first();

        $previousActivity = Activity::where('order', '<', $activity->order)
            ->orderBy('order', 'desc')
            ->first();

        return Inertia::render('siswa/activities/detail/bangun-pagi-detail', [
            'activity' => $activity,
            'nextActivity' => $nextActivity,
            'previousActivity' => $previousActivity,
        ]);
    }

    /**
     * Display the activity history page.
     */
    public function history(Activity $activity): Response
    {
        return Inertia::render('siswa/activity-history', [
            'activity' => $activity,
        ]);
    }

    /**
     * Display the biodata page.
     */
    public function biodata(): Response
    {
        return Inertia::render('siswa/profile/biodata');
    }

    /**
     * Display the biodata edit page.
     */
    public function biodataEdit(): Response
    {
        return Inertia::render('siswa/profile/biodata-edit');
    }

    /**
     * Display the lagu page.
     */
    public function lagu(): Response
    {
        return Inertia::render('siswa/lagu');
    }

    /**
     * Display the kegiatan harian page.
     */
    public function kegiatanHarian(): Response
    {
        /** @var \App\Models\User $user */
        $user = auth()->user();
        
        // Get student data
        $student = Student::where('user_id', $user->id)->first();
        
        // Get all activities
        $activities = Activity::orderBy('order')->get();
        
        // Get current month submissions for the student
        if ($student) {
            $submissions = ActivitySubmission::where('student_id', $student->id)
                ->whereYear('date', now()->year)
                ->whereMonth('date', now()->month)
                ->with(['activity'])
                ->get()
                ->groupBy('activity_id');
        } else {
            $submissions = collect();
        }
        
        return Inertia::render('siswa/kegiatan-harian', [
            'activities' => $activities,
            'submissions' => $submissions,
        ]);
    }

    /**
     * Display the beribadah history page.
     * "Berbakti" in database is actually "Beribadah" with muslim/non-muslim variants
     */
    public function berbaktiHistory(): Response
    {
        $activity = Activity::where('title', 'LIKE', '%Berbakti%')->firstOrFail();

        /** @var \App\Models\User $user */
        $user = auth()->user();

        // Determine which component to render based on user's religion
        if ($user->religion === 'muslim') {
            return Inertia::render('siswa/activities/history/beribadah-muslim-history', [
                'activity' => $activity,
            ]);
        } else {
            return Inertia::render('siswa/activities/history/beribadah-nonmuslim-history', [
                'activity' => $activity,
            ]);
        }
    }

    /**
     * Display the beribadah history page.
     */
    public function beribadahHistory(Activity $activity): Response
    {
        /** @var \App\Models\User $user */
        $user = auth()->user();

        // Determine which component to render based on user's religion
        if ($user->religion === 'muslim') {
            return Inertia::render('siswa/activities/history/beribadah-muslim-history', [
                'activity' => $activity,
            ]);
        } else {
            return Inertia::render('siswa/activities/history/beribadah-nonmuslim-history', [
                'activity' => $activity,
            ]);
        }
    }

    /**
     * Display the bangun pagi history page.
     */
    public function bangunPagiHistory(): Response
    {
        $activity = Activity::where('title', 'LIKE', '%Bangun Pagi%')->firstOrFail();

        /** @var \App\Models\User $user */
        $user = auth()->user();
        $student = Student::where('user_id', $user->id)->firstOrFail();

        // Get all submissions for this activity
        $submissions = ActivitySubmission::with('details')
            ->where('student_id', $student->id)
            ->where('activity_id', $activity->id)
            ->orderBy('date', 'desc')
            ->get()
            ->map(function ($submission) {
                // Format the details as key-value pairs
                $details = [];
                foreach ($submission->details as $detail) {
                    $details[$detail->field_name] = [
                        'label' => $detail->field_label,
                        'is_checked' => $detail->is_checked,
                        'value' => $detail->field_value,
                    ];
                }

                return [
                    'id' => $submission->id,
                    'date' => $submission->date->format('Y-m-d'),
                    'time' => $submission->time,
                    'photo' => $submission->photo,
                    'status' => $submission->status,
                    'approved_by' => $submission->approved_by,
                    'approved_at' => $submission->approved_at,
                    'details' => $details,
                ];
            });

        return Inertia::render('siswa/activities/history/bangun-pagi-history', [
            'activity' => $activity,
            'submissions' => $submissions,
        ]);
    }

    /**
     * Display the berolahraga history page.
     */
    public function berolahragaHistory(): Response
    {
        $activity = Activity::where('title', 'LIKE', '%Berolahraga%')->firstOrFail();

        return Inertia::render('siswa/activities/history/berolahraga-history', [
            'activity' => $activity,
        ]);
    }

    /**
     * Display the gemar belajar history page.
     */
    public function gemarBelajarHistory(): Response
    {
        $activity = Activity::where('title', 'LIKE', '%Gemar Belajar%')->firstOrFail();

        return Inertia::render('siswa/activities/history/gemar-belajar-history', [
            'activity' => $activity,
        ]);
    }

    /**
     * Display the makan sehat history page.
     */
    public function makanSehatHistory(): Response
    {
        $activity = Activity::where('title', 'LIKE', '%Makan%')->firstOrFail();

        return Inertia::render('siswa/activities/history/makan-sehat-history', [
            'activity' => $activity,
        ]);
    }

    /**
     * Display the bermasyarakat history page.
     */
    public function bermasyarakatHistory(): Response
    {
        $activity = Activity::where('title', 'LIKE', '%Bermasyarakat%')->firstOrFail();

        return Inertia::render('siswa/activities/history/bermasyarakat-history', [
            'activity' => $activity,
        ]);
    }

    /**
     * Display the tidur cepat history page.
     */
    public function tidurCepatHistory(): Response
    {
        $activity = Activity::where('title', 'LIKE', '%Tidur%')->firstOrFail();

        return Inertia::render('siswa/activities/history/tidur-cepat-history', [
            'activity' => $activity,
        ]);
    }

    // ==================== Activity Detail Methods ====================

    /**
     * Display the beribadah muslim detail page.
     */
    public function beribadahMuslimDetail(Activity $activity): Response
    {
        $nextActivity = Activity::where('order', '>', $activity->order)->orderBy('order', 'asc')->first();
        $previousActivity = Activity::where('order', '<', $activity->order)->orderBy('order', 'desc')->first();

        return Inertia::render('siswa/activities/detail/beribadah-muslim-detail', [
            'activity' => $activity,
            'nextActivity' => $nextActivity,
            'previousActivity' => $previousActivity,
        ]);
    }

    /**
     * Display the beribadah nonmuslim detail page.
     */
    public function beribadahNonmuslimDetail(Activity $activity): Response
    {
        $nextActivity = Activity::where('order', '>', $activity->order)->orderBy('order', 'asc')->first();
        $previousActivity = Activity::where('order', '<', $activity->order)->orderBy('order', 'desc')->first();

        return Inertia::render('siswa/activities/detail/beribadah-nonmuslim-detail', [
            'activity' => $activity,
            'nextActivity' => $nextActivity,
            'previousActivity' => $previousActivity,
        ]);
    }

    /**
     * Display the bangun pagi detail page.
     */
    public function bangunPagiDetail(Activity $activity): Response
    {
        $nextActivity = Activity::where('order', '>', $activity->order)->orderBy('order', 'asc')->first();
        $previousActivity = Activity::where('order', '<', $activity->order)->orderBy('order', 'desc')->first();

        return Inertia::render('siswa/activities/detail/bangun-pagi-detail', [
            'activity' => $activity,
            'nextActivity' => $nextActivity,
            'previousActivity' => $previousActivity,
        ]);
    }

    /**
     * Display the berolahraga detail page.
     */
    public function berolahragaDetail(Activity $activity): Response
    {
        $nextActivity = Activity::where('order', '>', $activity->order)->orderBy('order', 'asc')->first();
        $previousActivity = Activity::where('order', '<', $activity->order)->orderBy('order', 'desc')->first();

        return Inertia::render('siswa/activities/detail/berolahraga-detail', [
            'activity' => $activity,
            'nextActivity' => $nextActivity,
            'previousActivity' => $previousActivity,
        ]);
    }

    /**
     * Display the gemar belajar detail page.
     */
    public function gemarBelajarDetail(Activity $activity): Response
    {
        $nextActivity = Activity::where('order', '>', $activity->order)->orderBy('order', 'asc')->first();
        $previousActivity = Activity::where('order', '<', $activity->order)->orderBy('order', 'desc')->first();

        return Inertia::render('siswa/activities/detail/gemar-belajar-detail', [
            'activity' => $activity,
            'nextActivity' => $nextActivity,
            'previousActivity' => $previousActivity,
        ]);
    }

    /**
     * Display the makan sehat detail page.
     */
    public function makanSehatDetail(Activity $activity): Response
    {
        $nextActivity = Activity::where('order', '>', $activity->order)->orderBy('order', 'asc')->first();
        $previousActivity = Activity::where('order', '<', $activity->order)->orderBy('order', 'desc')->first();

        return Inertia::render('siswa/activities/detail/makan-sehat-detail', [
            'activity' => $activity,
            'nextActivity' => $nextActivity,
            'previousActivity' => $previousActivity,
        ]);
    }

    /**
     * Display the bermasyarakat detail page.
     */
    public function bermasyarakatDetail(Activity $activity): Response
    {
        $nextActivity = Activity::where('order', '>', $activity->order)->orderBy('order', 'asc')->first();
        $previousActivity = Activity::where('order', '<', $activity->order)->orderBy('order', 'desc')->first();

        return Inertia::render('siswa/activities/detail/bermasyarakat-detail', [
            'activity' => $activity,
            'nextActivity' => $nextActivity,
            'previousActivity' => $previousActivity,
        ]);
    }

    /**
     * Display the tidur cepat detail page.
     */
    public function tidurCepatDetail(Activity $activity): Response
    {
        $nextActivity = Activity::where('order', '>', $activity->order)->orderBy('order', 'asc')->first();
        $previousActivity = Activity::where('order', '<', $activity->order)->orderBy('order', 'desc')->first();

        return Inertia::render('siswa/activities/detail/tidur-cepat-detail', [
            'activity' => $activity,
            'nextActivity' => $nextActivity,
            'previousActivity' => $previousActivity,
        ]);
    }

    /**
     * Submit Bangun Pagi activity.
     */
    public function submitBangunPagi(Request $request)
    {
        $validated = $request->validate([
            'activity_id' => 'required|exists:activities,id',
            'date' => 'required|date',
            'time' => 'required|date_format:H:i',
            'membereskan_tempat_tidur' => 'boolean',
            'mandi' => 'boolean',
            'berpakaian_rapi' => 'boolean',
            'sarapan' => 'boolean',
            'photo' => 'nullable|image|max:2048',
        ]);

        /** @var \App\Models\User $user */
        $user = auth()->user();
        
        // Get student record
        $student = Student::where('user_id', $user->id)->firstOrFail();

        DB::beginTransaction();
        try {
            // Handle photo upload if present
            $photoPath = null;
            if ($request->hasFile('photo')) {
                $photoPath = $request->file('photo')->store('activity-photos', 'public');
            }

            // Create or update submission
            $submission = ActivitySubmission::updateOrCreate(
                [
                    'student_id' => $student->id,
                    'activity_id' => $validated['activity_id'],
                    'date' => $validated['date'],
                ],
                [
                    'time' => $validated['time'],
                    'photo' => $photoPath,
                    'status' => 'pending',
                ]
            );

            // Store activity details (checkboxes)
            $details = [
                [
                    'field_type' => 'checkbox',
                    'field_name' => 'membereskan_tempat_tidur',
                    'field_label' => 'Membereskan Tempat Tidur',
                    'is_checked' => $validated['membereskan_tempat_tidur'] ?? false,
                ],
                [
                    'field_type' => 'checkbox',
                    'field_name' => 'mandi',
                    'field_label' => 'Mandi',
                    'is_checked' => $validated['mandi'] ?? false,
                ],
                [
                    'field_type' => 'checkbox',
                    'field_name' => 'berpakaian_rapi',
                    'field_label' => 'Berpakaian Rapi',
                    'is_checked' => $validated['berpakaian_rapi'] ?? false,
                ],
                [
                    'field_type' => 'checkbox',
                    'field_name' => 'sarapan',
                    'field_label' => 'Sarapan',
                    'is_checked' => $validated['sarapan'] ?? false,
                ],
            ];

            // Delete existing details for this submission
            ActivityDetail::where('submission_id', $submission->id)->delete();

            // Insert new details
            foreach ($details as $detail) {
                ActivityDetail::create([
                    'submission_id' => $submission->id,
                    'field_type' => $detail['field_type'],
                    'field_name' => $detail['field_name'],
                    'field_label' => $detail['field_label'],
                    'is_checked' => $detail['is_checked'],
                ]);
            }

            DB::commit();

            return back()->with('success', 'Kegiatan berhasil disimpan!');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->withErrors(['error' => 'Gagal menyimpan kegiatan: ' . $e->getMessage()]);
        }
    }
}
