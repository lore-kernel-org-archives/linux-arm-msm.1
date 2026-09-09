Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17C856510E
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966900; cv=none; b=UCHuR9vSQDywF2mJeELMhccsiMAObMnKd+rrENrDYpo6+2JzEuwkXSEQOCra8KHZBgidhznkvYZXNfSn5YNb92w8OqEVTPkYE2me3jQDZDR2WH2vpkz1UrLcmwQOD+v5gbKgBLhGuC66dpx3Ok86Pw9fXpSywnYWnUy2MBvhZH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966900; c=relaxed/simple;
	bh=f0k8e1Um/2ur8NWvk6H6Nte2peT/Kha5SrTEFCWanko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k19hrEPmG+7qRTP6u2qG/VNKm2l6DZxlN0DjVfpX7G7p4xp8cGEWrLxxQnVCmJH64ZF3aYZI0rCSA0jbmUwbPIkAh+1KN6yzZPAUoI3Plww+I6Dg7ULOpzZYdpU5lslmi4Qg9jxZ/wao2Cnu5PlvbO9085YLbxdqMW3cDgoBcyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGjDr6IZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGjDr6IZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so39591605e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966897; x=1789571697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DMQlD/kvEb1R1nr991pm2owfqsmrRszs+IoF8p64UKQ=;
        b=pGjDr6IZSRWBB32IhejURDsJT2Fkm8+DHgkzpDmCweN3rcBjg87v6l/Zi0yLnBQskf
         3Y8UxcNSuRJ075RCpxQea9XmJ4mmyAVxpF0NX6QCIuCwhd3DBR6uQMrWcE9EOB7S9LS5
         eXo2bVMdezg4RQKOPg5Yhf5tGi50wY4r4tIyPIdeITP5+c6d8Z4tcf4lzfc+GmARPDCQ
         ulusZh0Qij3nti+FCsF1XlWzi/IkHjrr768yJsWzpsimBsT2CUSNItDzPbe0QQc+FCYG
         fswWaaBhQyxXNGgv5sdnHSGvc+AJUe0obA4dtq75zhE5CFmJc02KVa6R8qKQshyJQsl3
         3j9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966897; x=1789571697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DMQlD/kvEb1R1nr991pm2owfqsmrRszs+IoF8p64UKQ=;
        b=h9PtLCwN7vMa2ZPtGLib0W7xHWtkiojmgliiNtoiYkWG0MDOLfxRv0cvJ14lEzxvaJ
         nbLUL2bWMzX42eAWKtU052ZASvpH/6ZDewG4aznOp4wT8zimouO9SEgoThuNVv5Sn8Rd
         BDkiPMWufVID9uSz+duOd8s+JH6ds3kyL9Fm82cUUGRZ6wy70ugTunt1lhrghgq0159v
         cHEIzsNbX2tH9fRl7YtY8jZokDctWdq2daeKdpRCTccFIqcQ3eH/5444dp6tjD9WPlKa
         AZHYSXotqNSY1/SCSm8HKMv9rO0eVPgs4AnlUbRTul+LjCeD9LnyQ/shp6KL42gQnlZF
         T29w==
X-Gm-Message-State: AFuF++miHbEknDUdrn3lWvC7RAsNboNYHqHWwojLLJ94pZR5OmiJ+4Ym
	p+wVNPC+ocjvvCSijQpV/noeMZJbyBsQ5a1GorvBT2aWMPmAW4/VKB35
X-Gm-Gg: AYBFou3ovAEknan5ChxvGtOAhYQDZK0Np/UjAhYmYkINRlIWLTtGqq0k2+owrpOdxT5
	QmT+jxy8xM527xlJuKo0cIR5kztBs/VQbrd73eRa82XgUtY7SF14VfyoBVkJOvqUqSbUa7FlCq+
	E1oCka7xT4P5QGWdXKBMKbfR96xf2INoR8RUGA9rL02X/znT96JuY7HqKdm+cSmcrqEDNDrg5wU
	cUYSgmJKql2DiDKmKKNHz+EW4cgzbQ5IdxJJTQJ6hvAJKP+PyqN+d1iPTR0DesOYVTfvgiNA7RR
	K3BZrff0KtyNqo7/kSgYGpGHELfSj6Myd5tFmCABN8t/cbwCCJzqo+5nYScXNGyT7TxQBL6c8WS
	qRaZt+oS7XCzAtQor4flnd9yU+L1FEkBfxdQ3pPIefzobSpACgEsUddUcZni+WT67ROTw2Nr/XV
	cuvDOwSjLn0zOjkBt1Au1NhZKCgIMqv8pSJ/RkPcaOP+T3KgoY6JbMi6TWEEi1QMqE09iAg5IUT
	wh/T97ly0r3ngPLRXibzON1GYmZvMk5uxMrJuJBJAk=
X-Received: by 2002:a05:600c:8b48:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49cfff9f6efmr275799555e9.21.1788966896538;
        Wed, 09 Sep 2026 08:14:56 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm483644155e9.0.2026.09.09.08.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:14:56 -0700 (PDT)
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
Subject: [PATCH 1/2] phy: qcom: qmp-combo: do not decrement init_count on a forced init failure
Date: Wed,  9 Sep 2026 17:14:42 +0200
Message-ID: <20260909151443.10276-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909151443.10276-1-okerixx@gmail.com>
References: <20260909151443.10276-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qmp_combo_com_init() only takes a reference when it is not forced:

	if (!force && qmp->init_count++)
		return 0;

With force set, && short-circuits on !force and init_count++ is never
evaluated.  The error path decrements unconditionally, so a forced init
that fails drops a reference it never took and init_count goes negative.

init_count is a plain int, so the damage persists for the rest of the
boot.  qmp_combo_com_exit() then sees a non-zero value in

	if (!force && --qmp->init_count)
		return 0;

and returns early every time, so the clocks, resets and regulators are
never released; the runtime PM callbacks only bail on exactly zero, so
they keep touching hardware that may already be off.

Both callers that pass force are the typec_switch and typec_mux
callbacks, which tear the common block down and bring it back up on an
orientation or altmode change.

Only decrement the count when it was actually taken.

Fixes: 2851117f8f42 ("phy: qcom-qmp-combo: Introduce orientation switching")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index bf4d29fe1719..7d740ed0ce16 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -4253,7 +4253,8 @@ static int qmp_combo_com_init(struct qmp_combo *qmp, bool force)
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 err_decrement_count:
-	qmp->init_count--;
+	if (!force)
+		qmp->init_count--;
 
 	return ret;
 }
-- 
2.55.0

