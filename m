Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E578453FD37
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962640; cv=none; b=emFiYM5kwKWsZIK5YaTORBtE0oIt5apPguVvKCaovxakAN5kLNE0lAGXOgbFM67YRvVLf+k3x7rZYzJfzXzurogNyjAQH19+Ru7SKVjP4uE2aHIXOHgPGO7/XoMgDnxBPBiHPCdR47fRBzANwnO3C67rRyBmfVGsa7lZYFTdIV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962640; c=relaxed/simple;
	bh=sag3Q5SZ/Vf4EaEXCrQjc6pPGJRvp/1eWzwYQiiLhHM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TgJJBFlJm+NfJUUKyqe+oyrbGOTkRWgcUZR9oF3P/E7nRaFGUyXOdjz9T0SMuIfc6ehw/Bsi55mvVqh44WOpv6x57kQHhAMythm48pNdQn7k9HBlmh8h4CkpqITsk6QtNf3E+mNAOvkxgOLYigvATqDpCJkQNg7HREOnpLGwXac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csFcISA2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csFcISA2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484392e3d33so4232189f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788962637; x=1789567437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C81wLIgV9CTs/F+PgQEY8c1J5nQbz2h4oO8nmOwUCUA=;
        b=csFcISA2c5/+vSPkFBIevWtJgW6rzJXX6+xjqHfKywrNox4fbZZys/bplNWGIu5Ay1
         2R6qC8ocZItnjJI33AKPqqve8Ktr0+0fRyO4qIyGDFsQiF+aRCzwFhnaMPTz2dibXXTN
         2mShAb3mwS35qJRO9TzYfW1mJavuqAZnLO+XIU8zkuKdDIkxN4HuxbqdYWSQXlwOR3GL
         LykLSqQTBDVZ9UU+dACZ+3qxat56PO9w5uGcppD4+McjscL5k5/SfcXg9mTpjUc1zgFb
         jGS4s/lzuWZFNze/fQNLuahTmP8/lCjwFwgkLvCby4FSzX3SoqgwTcJ2NcV29klqmaBN
         PfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788962637; x=1789567437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C81wLIgV9CTs/F+PgQEY8c1J5nQbz2h4oO8nmOwUCUA=;
        b=Vwl5HIwwgRBcHjeYcPRku7vZJdjF7WL31nln1SwKcVNeI2cRCLZ5+boxjyD0mrnk6O
         vIbszRWmd+sEZyUKqtFc/xOzLaTdLpcg7FnscgUfAVkNhhxnWWFcUkqCrwR9sFX980Dr
         WwbfKfxaxmGsHrQR8gcky0GVaZXTOkPqD8hVGldd5TFcWb9k9ZlWgc5yBU6LxhfB0CEv
         +/j+RWlW5KZmCUgLYiZVxvYC40Uy5dfIlDMPjXXDlA0BVDMYemnNOOMuXwxaP3hlU2nK
         I1dDFJlEbAHc8g0eC4u+jTKfxCRnGW5ELUPeU9nGxWonXxh5ddsLz4HYSfjqI00K1sy6
         Ul6A==
X-Gm-Message-State: AFuF++kNggltH7KrehXQ0yX73vZBUDzXeZF9Aq4teyPLs2Km02SA+oe+
	w2jF0rfE4FKL8gKRuM9JIkCNW71bL4eUskq3NLzXF27kPzNc+XEHmC1sk9LtC3fdoehsXg==
X-Gm-Gg: AYBFou0hXeGMdDZTMzdnTP6PMBraNP1mD0eKDYfahs/a+3HZcGvBTSYdX4yVnfQShqZ
	tlia/4nPCoNtybJOFlWoaDyU+N+i8b9I2YbTQ337ePZI0zhAsmoOsIAPLDB38+aDnvIEWT+SdG1
	A6ALyFmRyX442ugV1gW5RP7yVg2/jFqgz3vJuZKqjIe2pF5/FG+x7rJ/iz8MHZSp2VbAfFN1OR0
	74X1CtLCLwOkCMVT++K9ksktOcyv811sUVrofSpUnKapVrPprg7V7xuYm5WfvpdN/w3fNDKU1gy
	K/fsChzrwp8JSa6jmwAHVq0ie7a09jeh3iTpJ3D/vtqmqtJ8R4k6Qil0Cs+sQZkGVU/eWhWsIpP
	OpUKRjAT5u2dDA5RyqFrSSRAioqGghMfX2D2FgfsQrRW6ZwPFaKGFsuredCYyhyCLG04u7PKEjL
	FyOyTAWxQ0FkSnLfp66qdXxJ6y/tLofmkhTuori0yjugHvafl/VE3ihxgkNot8Zg5a1W1IWvfrE
	D8XgszcDSts40x0Q2xQHktV+cEynksA+kRLHk+Px8xwaVz3KANmNPs=
X-Received: by 2002:a05:600c:c1d7:20b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49cffe32f58mr232275715e9.3.1788962636654;
        Wed, 09 Sep 2026 07:03:56 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm44956952f8f.34.2026.09.09.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:03:56 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH] phy: qcom: qmp-combo: hold a runtime PM reference in the typec callbacks
Date: Wed,  9 Sep 2026 16:03:45 +0200
Message-ID: <20260909140345.4239-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
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
index d77fe94b312c..bf4d29fe1719 100644
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
@@ -4930,6 +4931,8 @@ static int qmp_combo_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->init_count) {
+		guard(pm_runtime_active)(qmp->dev);
+
 		if (qmp->usb_init_count)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 		qmp_combo_com_exit(qmp, true);
@@ -4997,6 +5000,8 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
 	qmp->qmpphy_mode = new_mode;
 
 	if (qmp->init_count) {
+		guard(pm_runtime_active)(qmp->dev);
+
 		if (qmp->usb_init_count)
 			qmp_combo_usb_power_off(qmp->usb_phy);
 
-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
