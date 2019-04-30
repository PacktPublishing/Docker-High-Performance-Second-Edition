import jenkins.model.Jenkins;

pm = Jenkins.instance.pluginManager
uc = Jenkins.instance.updateCenter
uc.updateAllSites()

installed = false

["git", "workflow-aggregator"].each {
  if (! pm.getPlugin(it)) {
    deployment = uc.getPlugin(it).deploy(true)
    deployment.get()
    installed = true
  }
}

if (installed) {
  Jenkins.instance.restart()
}
