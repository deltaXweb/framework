<?php

class Route
{
    private $url;
    private $callback;
    private $params = [];

    public function __construct($url, $callback)
    {
        $this->url = trim($url, '/');
        $this->callback = $callback;
    }

    public function match($url)
    {
        $url = trim($url, '/');

        $path = preg_replace_callback('/{([a-zA-Z0-9_]+)}/', [$this, 'paramMatch'], $this->url);
        $regex = "#^$path$#i";

        if (!preg_match($regex, $url, $matches)) {
            return false;
        }

        array_shift($matches);

        foreach ($matches as $key => $value) {
            $paramName = $this->params[$key];
            $this->params[$paramName] = $value;
        }

        return true;
    }

    private function paramMatch($match)
    {
        $param = $match[1];
        $this->params[] = $param;
        return '([a-zA-Z0-9_]+)';
    }

    public function call()
    {
        if (is_callable($this->callback)) {
            return call_user_func_array($this->callback, $this->params);
        } elseif (is_string($this->callback)) {
            list($controller, $method) = explode('@', $this->callback);
            $controllerInstance = new $controller();
            return call_user_func_array([$controllerInstance, $method], $this->params);
        }
    }
}
function view($viewName, $data = [])
{
    $viewFile =  'resources/pages/' . $viewName . '.php';

    if (file_exists($viewFile)) {
        extract($data);
        include $viewFile;
    } else {
        throw new Exception('Vista non trovata: ' . $viewName);
    }
}