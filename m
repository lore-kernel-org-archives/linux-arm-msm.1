Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70879416875;
	Tue, 18 Aug 2026 09:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046114; cv=none; b=G+wHOZnCzaa+aLh1ouEpXA4di0Y5qIhYKPVBY8ULpoEOsOO4kG6vArm90IOtYrZQjytj/mYVLwpum/m2UclRN7g3GeaXHkh+z30xe3BRNkDhSkgL4QFsb0DZIM0Ps1T6ov9uDVmnx7crED/6GXyFdFtOlaOAnNNrKpQvRG6AO0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046114; c=relaxed/simple;
	bh=msJS/BfkucL/UQowOG12tXwi1tKcZ6MfhdI8/gbN74I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=t2gZUY2X7FscS/bX2F7BQlWu12eNradSzRE80cWWTfEvG58dUnL+oRz2+l2rGWIm/PlCyB7ZnV51J+3uI7wdd88bCpXYeG5/hdOD5JNC1poGICWfQpiR4rVTXcoAjOM82YRZj0SqICbbxBR3wUkjYRtTIyzVQSyhFo30AghsA4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ifqx4YUb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ifqx4YUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6021F000E9;
	Tue, 18 Aug 2026 09:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787046113;
	bh=nWYBGvQx/kZJboElef64r83FDezGbcoiuWoTxQ+0x6U=;
	h=From:To:Cc:Subject:Date;
	b=Ifqx4YUbwYrd8hUIPl/ImLt2UmuT6e0YZZmrvfd6A0bFfw6USxQoIdA0wS1fQsMEq
	 urByW93jDMN7wFwBum99oHpUXTaXz1A5ijGxHkptctGR7FYl4lDoNxo6bKNWASXsFY
	 qiAso0ZblFoDL7DfaeDkDrvjA2PeF0iUJJqC34+KoRISK13kdgaTqKzDmlQdE9DVCN
	 6125EpysqSbGxvuj0a2/RmE3x3mJ9hjHWIRoCQpMoQmbJrsLdkraC05/KOYdriJE33
	 joUc/1zes5aHUBQRNOwivfF2MGBuOCz131h38AOPl5jCTqvbvFB8/560u/dMvijJRc
	 2KHE+bmgVlAKQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: make QCOM_PDR_MSG selectable
Date: Tue, 18 Aug 2026 11:41:41 +0200
Message-Id: <20260818094148.3838539-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Selecting QCOM_PDR_HELPERS from outside of a CONFIG_QCOM_SOC
block causes a build warning:

WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
  Depends on [n]: QCOM_SOC [=n]
  Selected by [y]:
  - QCOM_PDR_HELPERS [=y] && NET [=y]

Avoid this by allowing QCOM_PDR_MSG to be selected as well.

Fixes: f2866e6a27f7 ("soc: qcom: Hide all drivers behind selectable menu")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I noticed this after some last minute testing and would like
to include it in my pull request for 7.3 to have fewer regression
fixes.
---
 drivers/soc/qcom/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index e0629e9328c8..2b524154d9fb 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -90,9 +90,6 @@ config QCOM_PD_MAPPER
 	  implementation of the service. It is a simpler alternative to the
 	  userspace daemon.
 
-config QCOM_PDR_MSG
-	tristate
-
 config QCOM_PMIC_PDCHARGER_ULOG
 	tristate "Qualcomm PMIC PDCharger ULOG driver"
 	depends on RPMSG
@@ -315,6 +312,9 @@ config QCOM_PDR_HELPERS
 	select QCOM_PDR_MSG
 	depends on NET
 
+config QCOM_PDR_MSG
+	tristate
+
 config QCOM_QMI_HELPERS
 	tristate
 	depends on NET
-- 
2.39.5

