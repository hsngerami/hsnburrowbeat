// Config is put into a different package to prevent cyclic imports in case
// it is needed in several locations

package config

import "time"

//type Config struct {
//	Period time.Duration `config:"period"`
//}

//var DefaultConfig = Config{
//	Period: 1 * time.Second,
//}

type Config struct {
	Period time.Duration `config:"period"`
	Host string `config:"host"`
	Port string `config:"port"`
	Cluster string `config:"cluster"`
}

var DefaultConfig = Config{
	Period: 5 * time.Second,
	Host: "host",
	Port: "9999",
	Cluster: "cluster_name",
}
