package api

import (
	"net/http"
	"testing"
)

func TestShouldCollect(t *testing.T) {
	r, _ := http.NewRequest("GET", "/", nil)
	r.Header.Add("User-Agent", "Mozilla/1.0")
	r.Header.Add("Referer", "http://usebunseki.com/")
	if v := shouldCollect(r); v != false {
		t.Errorf("Expected %#v, got %#v", true, false)
	}
}

func TestParsePathname(t *testing.T) {
	if v := parsePathname("/"); v != "/" {
		t.Errorf("error parsing pathname. expected %#v, got %#v", "/", v)
	}

	if v := parsePathname("about"); v != "/about" {
		t.Errorf("error parsing pathname. expected %#v, got %#v", "/about", v)
	}
}

func TestParseHostname(t *testing.T) {
	e := "https://usebunseki.com"
	if v := parseHostname("https://usebunseki.com"); v != e {
		t.Errorf("error parsing hostname. expected %#v, got %#v", e, v)
	}

	e = "http://usebunseki.com"
	if v := parseHostname("http://usebunseki.com"); v != e {
		t.Errorf("error parsing hostname. expected %#v, got %#v", e, v)
	}
}
