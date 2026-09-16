Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D904825B6
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563397; cv=none; b=sLlMHIp/VR1ookWhb/cWNLb+n//6dDdpg8S5nsEBci5qww/+JGcR/06KqMCb2Ux7QA26hSM2bLX9N8xEaffpGJKVMyLASLjfJq8dK3ag3kBgq6ZYM5ySotnYQAKUtjc96Q3S/fa54sqLDSoVJzAITInmBZwSY8oZzd5iWZkwqIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563397; c=relaxed/simple;
	bh=8i8Qr9F+LzOgZ9ctuIJBF35YtOXaQS3m8/GHuRgFMB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxNGzgoE3LNxxuFH4NK5DTZncZHvIfeiPbykJOcoHYrseNbnUKkLE3Ljbwa+PikZdUsSwJtDsiXuOq1CY5b1x1+FeSPl1vPkg5pIQXTq1dDGDiJuckecmU/FZ39Uh/ddKTS9GBgz662zo42o+lFQNhZu6G+RmD5RRqD35+HvJyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nbp/aGFT; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nbp/aGFT"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4858bc96fabso614257f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 05:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789563390; x=1790168190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Or2QBqTu0XO5TqiywS1dagQ1+7oN0y+saD1nDD1L5c=;
        b=Nbp/aGFThc0TqUAMe9pcBGO/bubx37S/UvFKBXy2xy3P3Jqz5jVwN6pi4zruuZi+5I
         BXrbZyG/rAmburTNcIj/qxlqmVyduCHRANhQt/C9bsqZC0LkazeoJnkLct2SixIlK0fa
         g49RGTIeKE7+ffI2wwg9W9c8CktJMMdVbOdE5KgqmdZ8Cjt4Dhn2XG2mtzOyywaDYefI
         Yq1zeyzFLsmNFvLoq+sLLkxBUvft+OhFEnKxH52N23DgYacKkUKSa7k1nAIkq9KDOhm4
         xVtbjIWsqaSP1VH0qZNEeou5BTx9cRPQ+YyTQqNCqajNlbrozrZdh8pkUP6w5UqT6Wbl
         MSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789563390; x=1790168190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6Or2QBqTu0XO5TqiywS1dagQ1+7oN0y+saD1nDD1L5c=;
        b=2GJe6HjzwR4LPYh8QfN0N3BtO08Tb41mRG5MEUXtvRG1WZ72zKAIFTMbq7odJ8rpdW
         QvJwt2ljYCpBMctX1RNVCGfFMbK8T2iWKuu1r7/h8td0WL44eR8n/rXM5zoDUAY+1EJN
         +YwsS/EUjeMdCMD5lEfixh9+gc30qWpLjpWvHfPItEMFNjp+2VGGA9HW7qacRtHB5+NI
         Q+eXpTwxdfxea2y8yIggH2CDcTNnlBDfzL6L4xp125IvOhcfvv1xl2jQr+ypDB7IbYa4
         tnha0tdUt0rFw1kxG5xcWHg+FTEohwfFmVMQtEd9GRaEn+ItU9PkQvs/Qav2zveJBUJv
         Oy3Q==
X-Gm-Message-State: AFuF++nTlvJ9FBKRAY5OpC7u8+tfL3jNZhIXXGsLUAWflflaf1PsBNjC
	fPMNwlXG8igSWhJw1hejDnU1gWkqLCUoQI+v7gdEhuYGnxXqKJO9Dc09
X-Gm-Gg: AYBFou2XKSgKeBI1WYCYCdWjTacAw/Zdqn9fyjVo5M/j06Pih3wGMQHe/ngBQYn3c71
	W7/wQ+V6Vb8GxtbFkM6zat6OR58h/NWDBjkx/cn7yV0B5NRpyUE/gH8ZLh30pHqvlhyGs54Fezk
	BfGe5GCrrhlzdc/6aMPzkrxqH+PB14fnxYEb0Z9hqb869p3h5mBMOkpuUkGZ9NQ9HgsK/pAoD9G
	/V/yr8l1TdPCq484BeCMuVDGekYIDu5zhgtcbiCIog2abge/myCEpYqJfN5uCLvR9zWt60L+wyP
	s3GpJrA9+gye9kghdhPVC/gXLL8/03Ma3KGK8PPlVO+5huiMh9vcf57CWGpIRCOQfp9JLwVcD0j
	k6COIpEnooYrOjspoIGIhU5L0DvmBzrIndb4dkpoGxGHmC3HJjq8x71ArzR4cAn4aTtQEwHob07
	VCbOH8BiatprNzzgpRq5gZqoNBKfM8Q+z955VZfoEewkZbMNp9IASwrtoshO1mXCK7sV7ED6leG
	mX42vMKgRA=
X-Received: by 2002:a05:6000:460c:b0:487:8ef:5303 with SMTP id ffacd0b85a97d-4870cf44007mr3126887f8f.34.1789563389559;
        Wed, 16 Sep 2026 05:56:29 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm6750729f8f.24.2026.09.16.05.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:56:29 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/2] phy: qcom: qmp-combo: hold a runtime PM reference in the typec callbacks
Date: Wed, 16 Sep 2026 14:56:18 +0200
Message-ID: <20260916125619.4587-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916125619.4587-1-okerixx@gmail.com>
References: <20260916125619.4587-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qmp_combo_typec_switch_set() and qmp_combo_typec_mux_set() tear the common
block down and bring it straight back up, calling qmp_combo_com_exit() and
qmp_combo_com_init() with force=true.  Both release and re-acquire the PHY
clocks.

Unlike the PHY operations, which the PHY core always invokes with a
runtime PM reference held - phy_pm_runtime_get_sync() in phy_init(),
phy_exit() and phy_power_on() - these two are typec_switch and typec_mux
callbacks and hold no such reference.  Releasing the clocks is then enough
to drop the device's last reference, so clk_core_unprepare() runs
pm_runtime_idle() and re-enters the driver through
qmp_combo_runtime_suspend(), which disables the very clocks that are being
torn down:

  gcc_usb3_prim_phy_pipe_clk already disabled
  WARNING: drivers/clk/clk.c:1259 at clk_core_disable+0x298/0x300
  Workqueue: events_freezable pmic_glink_altmode_worker
   clk_disable
   qmp_combo_runtime_suspend
   pm_generic_runtime_suspend
   genpd_runtime_suspend
   rpm_suspend
   rpm_idle
   __pm_runtime_idle
   clk_core_unprepare
   clk_core_unprepare
   clk_core_unprepare

qmp_combo_runtime_suspend() only checks init_count, which is still
non-zero at that point, so it proceeds and the clock enable and prepare
counts underflow.

Runtime PM is forbidden at probe, so this only becomes reachable once
userspace opts in through power/control - which is exactly what the
comment above pm_runtime_forbid() invites it to do.

Hold a runtime PM reference across the teardown and bringup so releasing
the clocks cannot re-enter the driver's own suspend callback.

Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index fa1a91e67549..f6d3320a59d9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -16,6 +16,7 @@
 #include <linux/of_graph.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -5179,6 +5180,8 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->init_count) {
+		guard(pm_runtime_active)(qmp->dev);
+
 		if (qmp->usb_init_count || qmp->usb4_init_count)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
@@ -5265,6 +5268,8 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 	if (!qmp->init_count)
 		return 0;
 
+	guard(pm_runtime_active)(qmp->dev);
+
 	return qmp_combo_reconfigure_phy(qmp, new_mode);
 }
 
-- 
2.55.0

