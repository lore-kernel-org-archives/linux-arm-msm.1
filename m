Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721024;
	b=bHozXKtxu2Xz0ABVqp7l7WoKMirqWcIz2ySjj4LZrLSWuOaKAyO8dRskRtTOi2r9n8TP
	 lHaZ3SFk/Cox7JiHx3n46svk8eXDFVwPPQbE4ba2mplMd1iO2W7LVdqtoU+xp5TtD/8k9
	 NoMrDC7yB/OB4DcDi67v6rrsrUmakMr8Pu1em1tINS1j+KLneZN9H5FhXdJeYRZqC8RP5
	 OcCj6IO1gIMq7VyH1ur2XIdpHJK0vuV04/xoyjeDbVpCBW9iQ9ra8wttuchgmsSJwStuU
	 BZgKgifpg3Qmq+7H5s2FKwfLH1s5d6omGHyxR2xUvPWN3Ei0yKdnsRUQrJ5CQxM8tEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721024;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jJ8OA4RPTELpLZSA5iN/xtX0aLgZVnzlPLdkwHZAd/U=;
	b=Ol6j08pfYM48c7hsodckLWwlm718vJRw5gEuSNtylf2GFjMAoRaU04yATkql7GyChGe8
	 y5s3rCxMzal+jwWJb7NfzrNBt4n4uQXC/mN+5uKQPXywfyjtaSplLbkAN2/CeB7PuopSb
	 ULawEurmziUAMfYeUgJx1xFTGjhRoHbC9MDFpJ3Ouhs7/zGxKcmOP2Fudjf/a70oKX9HH
	 wGqimC1ZxqWuXEmZKRYc+WdCAqd3bP+FbN/l5xSbuoviOEMFAnkDbjyCOtUUTfskUkCkF
	 642JyuaJJgkTA2kPj+5y1Wp8EyX/Am7Y6PMskcBImsT2u+jupuJPrO0a1yD1yabykLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orKEvC1Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0CE606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=orKEvC1Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9651F000C6;
	Thu, 26 Nov 2026 19:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795721023;
	bh=jJ8OA4RPTELpLZSA5iN/xtX0aLgZVnzlPLdkwHZAd/U=;
	h=From:To:Cc:Subject:Date;
	b=orKEvC1YnJYVi5pt1voRgoQIgurMzCM8UYYY72SjMwF0NLOnOPV7VMvbtfLek1gc+
	 1Epw3FEtta0CvwVsOXfruqpdrfTWkuzcA2K+jn3sORRnbXxOT+m56nIbgO7l+HaL44
	 57Q+hTbt1CssD1veNwnsjTksNrJdrZSp4Y5BTTXVTwIJJypHhZpwayTzCHu0CjiwmF
	 P785mRWLpzHMLmIb3QNzA6Y+281PQVTe0e2u/FwnQLs90PCB4iWNsLfhwyxw+ELTXZ
	 BrPsuBrmVjEiWvxhf1fBhUIpAZB6cwyFkFYg+z9JV6H5417l/P2NdY147flg2obO+a
	 TerWkHeQQX28w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm driver fixes for v7.4
Date: Thu, 26 Nov 2026 20:23:33 +0100
Message-ID: <20261126192334.5073-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.4

for you to fetch changes up to c44eef6401b625f292f51e854e5a829e2e6748e1:

  firmware: qcom: pas_tee: handle a NULL resource table (2026-11-07 21:28:49 -0600)

----------------------------------------------------------------
Qualcomm driver fixes for v7.4

Fix a NULL resource table dereference in the PAS TEE service when
restarting a remote processor whose firmware has no resource table.

Correct the RPMh RSC read request length for version 4.5 and newer,
while retaining the existing length for writes and older hardware.

----------------------------------------------------------------
Jorge Ramirez-Ortiz (1):
      firmware: qcom: pas_tee: handle a NULL resource table

Maulik Shah (1):
      soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes for read request

 drivers/firmware/qcom/qcom_pas_tee.c |  5 ++++-
 drivers/soc/qcom/rpmh-rsc.c          | 14 +++++++++++---
 2 files changed, 15 insertions(+), 4 deletions(-)
