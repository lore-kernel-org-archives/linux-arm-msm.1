Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B198560AC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083222; cv=none; b=OtfC7pPIcmE7W879zTNIIxjQpq2NpHDtU/Z6feIqO75aloYCv49y3ApcyXaDMCJAKR1YDIqV2Tcbf24vdPm9oWpWXMfJKmZa9HMP4NXb49Q1q0CHcKEoh4YtY2ybSJO9qx8axel75ZBiWroUQh2RGdrHXmy3hzdtX8QuERILdZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083222; c=relaxed/simple;
	bh=saM8q2d4TeRMKj1qCwu5lLvjlB4BdHiz7cCPjpamtLk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CKUUZsEB+TphUBc+hfyNKAHt6Oc9+TIojwmHdkJ8L8kvnyWkpDNRgg2G5dV9EltdeLwS1a2YaFkN4jKQYAUHkotXhlhSfDldK7LlxYqBVuQ4amtYjYiQaTYK3OPuT/UEIvhgMNI6EUdZQPZHOAagvEbYOxiS/a7Yk1znN3R8ysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfcQaXYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfcQaXYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77FEE1F000FF;
	Tue, 22 Sep 2026 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083220;
	bh=m9HjGywjPaQr5NFO+zlg6UR9BceYwmkoX5kRlGU4PwM=;
	h=From:To:Cc:Subject:Date;
	b=nfcQaXYsRW6faJYRdUKJ5aPfQ3kzWOknnksNW0BJkblAJ/T+7/aj83G8fZjUBbTvZ
	 eTzxtS5P4F+STY3hGuHo8MLi8sM0AxeDX2RtJVHxvSFcgAl1fjvo03SlRhpj+TZ2fU
	 1rnArbAjaGf+yCCo2rYk178CRjOARJ/20J6T6/MwvyIz204JeSB90REhwE0Jf7N1SQ
	 aohcn5yCKICdIRZshYJhwGNfETSfiPx50NNMXxVWlyfaIcTgbAuq5mv42ofqAtok0r
	 rSOdo0i0QVMASiKzAhyes6auC2+SVKCOlsIVaJA8CV9AgsdB8FH3JQlDM2+bvgvXJI
	 Z/6k+2xJ2y1Wg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dale Whinham <daleyo@gmail.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fix for v7.3
Date: Tue, 22 Sep 2026 08:20:18 -0500
Message-ID: <20260922132018.358932-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.3

for you to fetch changes up to 35ce3c571297aee13c6da604d022929fd1aa9efb:

  arm64: dts: qcom: x1-denali: Fix microphone distortion (2026-08-31 10:08:35 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fix for v7.3

Fix microphone distortion on Hamoa and Purwa-based Surface Pro 11.

----------------------------------------------------------------
Dale Whinham (1):
      arm64: dts: qcom: x1-denali: Fix microphone distortion

 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
