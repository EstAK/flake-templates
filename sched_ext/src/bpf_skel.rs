// this is required because the bpf_skel.rs file is generated at build time by
// the build.rs script
include!(concat!(env!("OUT_DIR"), "/bpf_skel.rs"));

