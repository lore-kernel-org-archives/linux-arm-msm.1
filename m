Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEBE3914E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785430192; cv=none; b=GEJ22nL0JFJpOTF1TP//L9tv7KCm/55HIfIZXZvbknJBIyblBgWubHCcke23cyjVTHat4puw9KJGKmuoMBDJZD/hY9L3Xu15vbTjyoxXlf5zXOHVazS9krNTZyQQb/inVoYwcb7wjJ/8Jh/Z17H+yvX178nmUV/PvxnaKovFwmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785430192; c=relaxed/simple;
	bh=5HY720UattF8MoILRsPa3vIxvXykHCxwvkm03RDlI0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIPr0rrVILKrEr9h1TuWpAvqhi8IHZDlgF/73ZNwTQw9sGLBKvmAGNzjUG4Wb7/UCjmW5F+9FVAxOxhHNdZDPHkj82HCpRv7OI0mStk63827zS6BwuNu1r1YdsOruNmo7985nDqEqoMVSrI1RWnKTxLWg2VYBBd91LPtNosESjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdTS+wrw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdTS+wrw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3488D1F000E9;
	Thu, 30 Jul 2026 16:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785430190;
	bh=P99q5g4wyD2KldzYnXtXrIbQfUIhqAH5fUtD1PWms6k=;
	h=From:To:Cc:Subject:Date;
	b=hdTS+wrwQcvIhkyt38zuP3uyCBSYF71Av8w26LZegudizTaG4RdQV/lafKquMofgy
	 4PYjM4mSRKQxbOuibv+vHK54rKtfpVYgh3H9mOotB8aSJZzGxMOPvIYqDYCZMj8880
	 UHYtRTZ2HqeiNrXIxUftHn4XRKpTCdwgL98eT+VIpWYxYt3G5/BBC/BXmwEmBbnS+h
	 zA3GwJj8Yf/599XvIHwUHO2O/Sk58Srj3LCVK5kJpy6iWcGn4dOfWS8A6SBjw/J9QR
	 LWnvMT3vCcAjmwa2Nc8aIy6w4jDjtay22w09/0kaRgaeH4OVt4VQiN8ZqPGZBxgb2z
	 cImVh5oCiJDiA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.3
Date: Thu, 30 Jul 2026 11:49:47 -0500
Message-ID: <20260730164947.177468-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.3

for you to fetch changes up to 9c1bb154d40b36434e919865cbb2b23da58a963b:

  arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver (2026-07-07 22:04:24 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v7.3

Enable the Qualcomm reference device embedded-controller driver for
Hamoa and Glymur, the DMIC sound driver for Monaco and Lemans platforms,
and the BAM-DMUX WWAN driver for Shikra and other platforms using A2 BAM
hardware.

----------------------------------------------------------------
Anvesh Jain P (1):
      arm64: defconfig: Enable Qualcomm reference device EC driver

Ravi Hothi (1):
      arm64: defconfig: Enable Sound DMIC driver

Vishnu Santhosh (1):
      arm64: defconfig: Enable Qualcomm BAM-DMUX WWAN driver

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
