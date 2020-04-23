namespace Hack\GettingStarted\Students;

use namespace HH\Lib\Str;

/**
 * Data container to represent a student
 */
class Student
{
	public string $name;
	public string $grade;
	
	public function __construct(string $n, string $g)
	{
		$this->name = $n;
		
		if(Str\length($g) == 1) {
			$this->grade = $g;
		}
		else {
			$this->grade = "F";
		}
	}

	public function get_grade(): string {
		return Str\format("Name: %s Grade: %s", $this->name, $this->grade);
	}
}
