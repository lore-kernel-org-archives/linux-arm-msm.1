Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C536730C16A
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 19:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832984; cv=none; b=Us5W8pyMvqA1Ovqsw3dVaEqbm0MzvKZn+qi2UQH/+4bxmDaXS2GggSc7wBtl2L79soJGh5EH0S4dG/trJIyrTVTisbNaXkhjJgxJpF5Gq3gfzjY8MZcpNpMK6GNcZFupFSYzIJl6X/7IFbiWn9nRXK7scWlvAKsimXu5iADUiYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832984; c=relaxed/simple;
	bh=lWJ+Ju6ZzenE+PyJO4RAWpMIyVFeLEootAvByf0Rc6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eWFUjypxm8w8sgK+gb+2sb/Jlu33VV8ugZHwidH+2g3UU6qpYAdmQ3lSUfrEKy/H7TnrlN1ymiIL7peQ6YUC8sQlZhdPfxAQCHwvUAbp5DYoIitXzmWmYsVNrLG6K1xm8NJIICMxsle7Ls7krUVqmd5GnyYXilWIO+vwMt8vuzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XAYxFsA1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XAYxFsA1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1301F0089B;
	Mon, 12 Oct 2026 19:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791832983;
	bh=gWD+mFFh2PYQ5iuNSwqJ5xxnNC7WprPuBEo7h6CV0Vk=;
	h=From:To:Cc:Subject:Date;
	b=XAYxFsA16i/953N2ybyvOB2TD8zOn33xK9QVy6+L9qyiAAJVeUgdCAKX9rHJ01JpZ
	 Wjzo1SAEqttUYH4hMjlrzey09zY1wje9V6VZaykCVZlUSPzS94c5XbYmDvM47ROiTQ
	 NUUmDb9gpJYAb8mfysC9EOYQ3WfQi2VbrQFOuuo3pEJe1pgXK0ors2B203qIsM0wKj
	 UwYuBMJ71A12pzZyZTwapzPrgTbckxevf9Bbe3QEQ5B/B/FGrDUtk+plpiXIRmckd6
	 pD4Oaci7nD/mJz4DVQF5NFNpu18ubfSo+JtSLgjc9HSzhBQOYANeUYV00OClwx6EQI
	 J7JixN3iQ6Fjw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm64 defconfig updates for v7.4
Date: Mon, 12 Oct 2026 14:23:00 -0500
Message-ID: <20261012192301.13361-1-andersson@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 897cf6d54f366885e190e75b3a221e7b3ae35065:

  arm64: defconfig: Enable PMIC5 Gen3 ADC thermal monitor (2026-09-12 14:18:26 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.4-2

for you to fetch changes up to 8b8d8aa9d482b08d5315e4d26631b9891c90e02e:

  arm64: defconfig: Enable EMC2305 and PCA963x drivers (2026-09-25 12:39:04 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 defconfig updates for v7.4

Enable the EMC2305 fan controller and PCA963x LED controller drivers for
the Arduino Ventuno Q.

Remove explicit Qualcomm clock driver selections now provided by Kconfig
defaults from the ARM and Arm64 defconfigs, including the obsolete MDM9615
LCC entry. Allow the SDM845, SM8150, and SM8250 display, GPU, and video clock
controllers to be built as modules.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

Loic Poulain (1):
      arm64: defconfig: Enable EMC2305 and PCA963x drivers

 arch/arm/configs/multi_v7_defconfig |   9 ---
 arch/arm/configs/qcom_defconfig     |  14 -----
 arch/arm64/configs/defconfig        | 121 +-----------------------------------
 3 files changed, 2 insertions(+), 142 deletions(-)
