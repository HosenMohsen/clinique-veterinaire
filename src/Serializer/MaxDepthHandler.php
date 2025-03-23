<?php

namespace App\Serializer;

use Symfony\Component\Serializer\Exception\LogicException;

class MaxDepthHandler
{
    public function __invoke($object, $format, array $context = [])
    {
        throw new LogicException(sprintf(
            'Max depth reached for object of type "%s". Consider reducing serialization depth.',
            get_class($object)
        ));
    }
}
