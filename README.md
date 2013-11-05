cougar-archetypes
=================

A set of maven archetypes for Cougar - kept seperately so we can easily version them independently.

To publish/build archetypes, chdir to each archetype in turn and run:
mvn deploy/install -N -Parchetype

Archetypes depending on released versions of Cougar should have no parent pom.
Those depending on snapshots will need to have the oss sonatype parent (hopefully not too often)
