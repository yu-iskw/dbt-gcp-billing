# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

setup-dev: setup-python setup-pre-commitm

setup-python:
	pip install --force-reinstall -U pip==24.3
	pip install --force-reinstall -r requirements-dev.txt

setup-pre-commit:
	pre-commit install

lint: lint-yaml lint-bash lint-pre-commit

lint-yaml:
	bash ./ci/lint_yaml.sh

lint-bash:
	bash ./ci/lint_bash.sh

lint-pre-commit:
	pre-commit run --all-files

generate-toc:
	markdown-toc --maxdepth 3 -i README.md
