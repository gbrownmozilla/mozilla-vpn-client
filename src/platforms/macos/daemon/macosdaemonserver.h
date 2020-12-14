/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

#ifndef MACOSDAEMONSERVER_H
#define MACOSDAEMONSERVER_H

#include "command.h"

class QLocalServer;

class MacOSDaemonServer final : public Command {
 public:
  explicit MacOSDaemonServer(QObject* parent);
  ~MacOSDaemonServer();

  int run(QStringList& tokens) override;

 private:
  void newConnection();

  QString daemonPath() const;

 private:
  QLocalServer* m_server = nullptr;
};

#endif  // MACOSDAEMONSERVER_H
