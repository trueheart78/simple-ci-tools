<?php

namespace Sample\Tests;

class SampleTest extends PHPUnit_Framework_TestCase {
    protected $instance_var;

    public function setUp()
    {
        $this->instance_var = "1234-4567-7890";
    }

    /**
     * @runInSeparateProcess
     * @preserveGlobalState disabled
     */
    public function testValidity()
    {
        $sample = new Sample();
        $this->assertTrue($sample->isValid());
        $this->assertFalse($sample->needsHelp());
        $this->assertEquals('sample', $sample->type());
    }

    /**
     * @runInSeparateProcess
     * @preserveGlobalState disabled
     */
    public function xtestNotWorking()
    {
        //get this working
    }
}