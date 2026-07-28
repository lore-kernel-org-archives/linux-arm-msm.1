Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079A525C818
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785202302; cv=none; b=X4ojULbSOSa+vxaKbg4P3y/+OS2jw8DXy8VWe/DsLXENJllmz9Spu23Hcfda6S1d+HDxpyzJSEFNB46AehmYeSmY6QHEadA44xnlUATRS7E3Ey7oFqvMY8cTInc9ohLpYx+U1HwCeanIwNjaS0be3j9ZMcovyvkgLNNjsID6Iys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785202302; c=relaxed/simple;
	bh=xN3XdDgIGoruQW2AwPCdjZ3rcxzT9LsA5JnV72gCxjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RtzWQdmlC3Y8n6ZFofMrlKziyfoUapH1Kb3W665FLcVzOOnQo6zTz7OemniWp3KL3xWq2E5uDc3JVtVYLVorzIfdpWRoJWU1Ukm3LxuYOb64gxtzkGEbV59bQbETj5om4mD10FY0b5nYvQrPy9hXf7juJvOt3O2ObxHTwEsAydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org; spf=pass smtp.mailfrom=quora.org; dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b=VsalMrGt; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=quora.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quora.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=quora.org header.i=@quora.org header.b="VsalMrGt"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccf2360620so31167695ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 18:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quora.org; s=google; t=1785202300; x=1785807100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NV9OX3HfsztmSf4OIPL5ZR2O39v4TxztWNESgaKRtxg=;
        b=VsalMrGtZM96C3PiFobwI3SVpMlEHO6538kUUbPGmCus3AdlG/rwYyMIl2oaEAXgGd
         ESB3+nbelD31swgMz7wHwiZxpUTTCTpSdPenyIs6rap0Sx9J9N4wPgO+cgLoKHV80IuX
         H3dIsu1KGoxBBIQcn+wwbSgYjMuTMVE6jsAko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785202300; x=1785807100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NV9OX3HfsztmSf4OIPL5ZR2O39v4TxztWNESgaKRtxg=;
        b=Qa6OUyWaaee9wIunCPBKDmJphj3ImuEv1+kfs2pSpV7K5h8dbVFnPntk0/BTKHJIV2
         qmhL3dcS/WgsEE7iwaV6nDcQhrDTz9qyZU2ghHQ7Sai+4SdMmEPTAQukr158IWIUvRzV
         LSJIX3v2MXRGU0ParO9v5TVsgVgwml+2nJPb+1WXWE2X292FM6HYsOb07A7lWd+BpwjV
         Le//nabcQJBN8IW9f0C/QPpWtmP9ihMSpe/IPtDgMPMU4GbyEWytiBWzmu16TukhiiQF
         MRD4WkUrBhB0DVheN1C35frnVqriQo9Ii5fQvIPoPmGYz7uwbqIP6IjjwsQGqzLIspa+
         2e1g==
X-Forwarded-Encrypted: i=1; AHgh+Rqh61PeyMmewXRAQrjYt3NDjUlQJjpM6xipxZIHhAkI+cMHIZYCzRpyNuhH3t6yeYeSKdfcMCdIhJEWIuP+@vger.kernel.org
X-Gm-Message-State: AOJu0YwFjx/C+KnNhRmbAG9mmwUFTDXUX1o885fNP3sJyQD9vypEtzIC
	AycMRlPE7ykN+fnKuzqjrbNkBj7uHeFa06v1v6Yvst4+UVB+4N6WncQU+dLhogu/v58=
X-Gm-Gg: AR+sD13yKjmFqIEYe2clxuJQcC+uXGC6HnFprPQ50+kuWG24sPrr9mCja/sqg9TUUvZ
	E2FBPEEE949naL/L7pSqxfJ8q3K+7gs6MhUhcoN5QOtqJtNZlxfu+6mBraQ2st1x+fYVi8Dm9y+
	aq5zlXHHOwY1vxgPkQpa1HlAfA8G4uCwpWjWBB7128GcU3FR0GiqsJz6MwQAF3BUsKkXtBXRdqo
	nOq6nI7SGtowLcgQZ+bcZKoz8RD1qYNByGjVD6VkQT5BGCNnZiIfOr+cgsKEL32rEy7htJWI4oX
	jDYnn4pYaYEMIgVarGwV2qAMn/rHNu9jLjlPCscFhRhTPnlIH1+Id06zxmDHKgMVtbs7sdqq8yR
	18V8sOCyWJamL0BXFhT6M7rAYwC0TX0OjkPW4Xhg+mauHB1+Q38BYsB4vepRF0V1oyZX+BQwYH7
	89fTKt2JoHewq9h9Eqizk3Wh6zuFacjhQFr/IUjehcB1bY13cvvFLOu5SXWnsFwlaXykhlK/rXA
	X3tQ7rahRAJh6p2F9f2//3HvGy/+k7UWcQyBaAHxXVK8EBzCso2mRJF9J6zEEfFIDhPjIYSDQuL
	LLbKJE2mIrOQBk1z+tekgp4OKAfmYKP+5FLUGJNRYlVOIY2h9Rv4a8YimP+iNJX1G+UbJfeQsB8
	8OAODUhoWi1m+bMC33N7B4qOkUw==
X-Received: by 2002:a17:903:b8f:b0:2ca:3e3f:4956 with SMTP id d9443c01a7336-2d015d43f76mr3129095ad.44.1785202300262;
        Mon, 27 Jul 2026 18:31:40 -0700 (PDT)
Received: from aegis ([2001:fd8:4d03:6b00:7871:9297:7799:ea22])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde81cd27sm43655545ad.79.2026.07.27.18.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:31:39 -0700 (PDT)
From: Daniel J Blueman <daniel@quora.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel J Blueman <daniel@quora.org>,
	stable@vger.kernel.org
Subject: [PATCH] soc: qcom: pmic_glink_altmode: use a freezable workqueue
Date: Tue, 28 Jul 2026 09:25:49 +0800
Message-ID: <20260728012549.14502-1-daniel@quora.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On suspend wake, the DisplayPort altmode setup often executes
before devices have compeleted resuming; this triggers a legitimate
warning:
  i2c i2c-2: Transfer while suspended
  WARNING: drivers/i2c/i2c-core.h:57 at __i2c_transfer+0xc0/0x9a8
  Workqueue: events pmic_glink_altmode_worker
  Call trace:
   __i2c_transfer
   i2c_transfer
   regmap_i2c_read
   ...
   ps883x_sw_set
   typec_switch_set
   pmic_glink_altmode_worker

The setup doesn't succeed, leaving the DP-alt monitor non-working.

Fix this by queuing the work on the freezable workqueue instead,
deferring the setup until devices have resumed.

Observed and validated on a Lenovo Yoga Slim 7x X1E80100 when waking
from suspend with a USB-C DisplayPort monitor.

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 619bad2c27ee..939a444ebe6e 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -450,7 +450,7 @@ static void pmic_glink_altmode_sc8180xp_notify(struct pmic_glink_altmode *altmod
 	alt_port->mode = mode;
 	alt_port->hpd_state = hpd_state;
 	alt_port->hpd_irq = hpd_irq;
-	schedule_work(&alt_port->work);
+	queue_work(system_freezable_wq, &alt_port->work);
 }
 
 #define SC8280XP_DPAM_MASK	0x3f
@@ -501,7 +501,7 @@ static void pmic_glink_altmode_sc8280xp_notify(struct pmic_glink_altmode *altmod
 		alt_port->tbt_data = *tbt;
 	}
 
-	schedule_work(&alt_port->work);
+	queue_work(system_freezable_wq, &alt_port->work);
 }
 
 static void pmic_glink_altmode_callback(const void *data, size_t len, void *priv)
-- 
2.53.0

