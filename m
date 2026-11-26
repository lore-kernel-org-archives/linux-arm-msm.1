Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725565;
	b=onxrUp7u6FedLSciyPk8t4uET70ZACxiFhkkXMjGzraSMYYN4pGvhoCRvvI9OemM0mtT
	 CaxvcCSInlXJ/GSY49K/UKpRSCxhxSAVRc943zGPOcG8yzIe73BMx5ZgdAr9sR38j49sQ
	 RsovVu+oUJNrDfGzdphoQmS6Kxobf3Yc0WYzurj2MdsHaFaQEFnXKZ7p3fTOaZL0VK+uW
	 tZBHRcIl/GlpnjmSj9naEmmDNIHDpwPrjH9+m0MgDkCYIsaKWgimM+ltCo1xsMwITASlf
	 TPHPHD+SPxagEzx9xY0ywOeIKCctjoG9lVJ1uBN9kXCIzbj4XfUnI5HQ7VvWNW533wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725565;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/W9cEBWU/T988b+0x4Z/R0bFFK0jxwX4qWW1NiYU7q4=;
	b=0x0mAEh6jr/kIQSiNGK/gNbrunZO9F0iwVxUDUzVmxERQSfGgdK9ED3imiMi9TcOZO7t
	 SCQoFpnoajQ755mNSTANT4cWbUqGJMlK56Pz7HncpRxxsVoeXv0c/LkFewBZOMFyKw3vD
	 WG+5t7+wo2MGdcgkLKukCjUHt7GIvcuDaMmcmKyHWXKr2vCHrf270feDqG+6ocl978c9P
	 jqpbDdtVE0LmQ4lwQPieKB5bISiaG7wBaQitJogqHcNxWZK4ZY/Tx8EGiuOdLr6HnTLw/
	 +baCKBqU4PK6ImZxGxATZjlm9cQEiErHotA5QzEXR0ClPAW+EoQoHbiOs/17YytXpSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DPsOvRi7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E0606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 20:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DPsOvRi7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32CF1F00893;
	Thu, 26 Nov 2026 20:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795725565;
	bh=/W9cEBWU/T988b+0x4Z/R0bFFK0jxwX4qWW1NiYU7q4=;
	h=From:To:Cc:Subject:Date;
	b=DPsOvRi7JlUHB6r3QAfIzuV0MqSgjLqJ+RgLGNMLVsCMd0BRKaPwFrV8miul1LUVa
	 toKCp6ENx4D6Zo8CJ1SBUNdFYc1w56pppalY1Oz0PteP99eX3SD9DRApx8e9NoHcNo
	 Xuc+srs6Kyb4UuunMI6Z/mVCDhuWfv1nOb/YJibXzSMuSacWjNOYMLIG3/SXUhDYtr
	 V0zwp0HLsARyrxZXu07+TwYTBRlzX1ZfKzse0YsvNwOtAtIkt5XFJu58iz02cyfLXy
	 TZU/pZURl+M9fgurE0EpgmNX5qfgE3k0J0CFnNPaaAqtTF8wfUC2/yuo1VqFgLfbGB
	 oY+4J7L0lcqkQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Waqar Hameed <waqar.hameed@axis.com>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v7.5
Date: Thu, 26 Nov 2026 21:39:21 +0100
Message-ID: <20261126203922.14074-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-7.5

for you to fetch changes up to ae2005cea2e4f84692268e54199bb03f5c6f4558:

  arm: dts: qcom: sdx65: Align multiple property data (2026-11-07 16:00:03 -0600)

----------------------------------------------------------------
Qualcomm Arm32 DeviceTree updates for v7.5

Add initial DeviceTree support for the Qualcomm Kuno SoC and Kuno IDP,
including the CPU, clocks, power domains, interconnect, pin controller,
shared memory and UART console.

Clean up formatting across Qualcomm Arm32 SoC, board and PMIC DeviceTrees.

----------------------------------------------------------------
Hardeep Sharma (1):
      ARM: dts: qcom: Add initial device tree for Kuno SoC

Waqar Hameed (32):
      arm: dts: qcom: pm8226: Add newline between subnodes
      arm: dts: qcom: pm8841: Remove superfluous empty lines
      arm: dts: qcom: pm8921: Remove superfluous empty lines
      arm: dts: qcom: pm8941: Remove superfluous empty lines
      arm: dts: qcom: pm8084: Remove superfluous empty line
      arm: dts: qcom: apq8026: Add newline between subnodes
      arm: dts: qcom: apq8026: Add space between OR-operator
      arm: dts: qcom: apq8060: Add newline between subnodes
      arm: dts: qcom: apq8060: Align multiple property data
      arm: dts: qcom: apq8064: Add newline between subnodes
      arm: dts: qcom: apq8064: Remove empty line at end of node
      arm: dts: qcom: apq8064: Add space before line comments
      arm: dts: qcom: apq8064: Remove tab after property name
      arm: dts: qcom: ipq4018: Indent closing brace properly
      arm: dts: qcom: ipq4019: Add newline between subnodes
      arm: dts: qcom: ipq4019: Align multiple property data
      arm: dts: qcom: ipq8064: Add newline between subnodes
      arm: dts: qcom: ipq8064: Align multiple property data
      arm: dts: qcom: msm8226: Add space between OR-operator
      arm: dts: qcom: msm8226: Add newline between subnodes
      arm: dts: qcom: msm8660: Remove empty line at end of node
      arm: dts: qcom: msm8660: Remove space inside array property
      arm: dts: qcom: msm8660: Align closing array bracket
      arm: dts: qcom: msm8916: Add newline between subnodes
      arm: dts: qcom: msm8960: Properly indent subnodes
      arm: dts: qcom: msm8660: Align closing array bracket
      arm: dts: qcom: msm8974: Align multiple property data
      arm: dts: qcom: msm8974: Align closing brace properly
      arm: dts: qcom: msm8974: Add newline between subnodes
      arm: dts: qcom: sdx55: Properly indent subnode
      arm: dts: qcom: sdx65: Remove empty line at end of node
      arm: dts: qcom: sdx65: Align multiple property data

 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 arch/arm/boot/dts/qcom/pm8226.dtsi                 |   5 +
 arch/arm/boot/dts/qcom/pm8841.dtsi                 |   2 -
 arch/arm/boot/dts/qcom/pm8921.dtsi                 |   2 -
 arch/arm/boot/dts/qcom/pm8941.dtsi                 |   3 -
 arch/arm/boot/dts/qcom/pma8084.dtsi                |   1 -
 .../boot/dts/qcom/qcom-apq8026-asus-sparrow.dts    |  32 ++
 arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  27 ++
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |   4 +-
 .../arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts |  26 +-
 .../boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   7 +-
 .../qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts   |   1 -
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           |  16 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |   3 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi |   1 +
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi |  11 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts    |   3 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |  11 +-
 arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi      |   1 +
 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0.dtsi      |   1 +
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi           |  24 +-
 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts           |  25 ++
 arch/arm/boot/dts/qcom/qcom-kuno.dtsi              | 444 +++++++++++++++++++++
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |   4 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |   5 +
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts       |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi           |   6 +-
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi       |   3 +
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts        |  18 +-
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi           |  24 +-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts          |  10 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |  14 +-
 32 files changed, 658 insertions(+), 79 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-kuno-idp.dts
 create mode 100644 arch/arm/boot/dts/qcom/qcom-kuno.dtsi
