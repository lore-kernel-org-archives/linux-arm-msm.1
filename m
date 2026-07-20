Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1133642D765;
	Mon, 20 Jul 2026 14:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784558351; cv=none; b=cvZnJfnW/osnD8ZJS7VdvlyAr+1K9NJfYTuPWE66v6KRUENwdFMstYAKADB5ZoM6pD8Jur8rcopFDvWTrbphTsTq/za8GBz1MxbxGie/O+wmKp94ZY2De3v0LwuN3V5i6eMXSdQczIbkzdWFzuPGnjzcIUMRNEMtLzHoV+xemC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784558351; c=relaxed/simple;
	bh=ad1NcOz4yhOWbSOvXE7RxXxJ+Ecyd2xei1gAOHh3yaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ls5CvW6M0w6GfcA2nbPvlh/CGGKkilI7Gpdm1qgUV/0ll+vEdZLl3IO/cYT3dY45X0lh3hV+DRY4NkG5idTfQ075LM7mZckP83Jf9YYHwwTQzWCxoqiv85xu1okQ7JYYD6FDn+rw0eyqDd9rgeNlvgH6hYpqR/dgGiKolU3bDRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYx6/COq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYx6/COq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDB51F00A3F;
	Mon, 20 Jul 2026 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784558349;
	bh=RH7b8/M9Iqr+mKMhIhiEz3pCA5rvqi9VOrHVDedd8xE=;
	h=From:Date:Subject:To:Cc;
	b=fYx6/COq2lOvftHRjYvd07ix/R9JqmAPZ9+s+9sSYoiMCf3PmE8ZaXf4LJ9Fp/l+L
	 03V5VMYq62K5MN6dcZTjjRXhZ9FbQz78OxorGBvHWOmYWqLKveva7s29m6/K0B77JV
	 YWC2RHlBkaUtUvQEpK0IaShzWURVhbGpYsWENb+Uzv9vFSnFjPjJRGqZKF7KaJVypC
	 v0FNkSKQWIfoBAHhxzCnuQB6foxHl0s/VYAH3owfVVB/EcfUfOcoRYCM3CBrGxGbCo
	 7jJe9FR0AZ+jU97yY34RiTlkKmGZow+ddIVhbangH7/sdmZUrEnEXlk56ALVe49HSC
	 D9lEGXtM265ZA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 20 Jul 2026 16:39:02 +0200
Subject: [PATCH] soc: qcom: pmic_glink: Avoid losing early rpmsg probe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-topic-pmic_glink_defer-v1-1-94c0f233f2f7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMWw6CMBBG4a2QebbJWLkYt2IMkeEHBrU0LRoTw
 t4p+vg9nLNQRFBEumQLBXw06uQSjoeMZLi7HkbbZLJsS64sm3nyKsa/VOr+qe5Rt+gQzCkvmfP
 iDJGKUuwDOv3+xtfb3/HdjJB5v9G6bkdHk0B6AAAA
X-Change-ID: 20260720-topic-pmic_glink_defer-34600458ecc7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784558347; l=1639;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=PrkzywiLlb10skr/qnHh7RGrIb1c96GS4eTsxwtCcMs=;
 b=6wC6LepjKVewiup2onQpxs7EVrxFBEZ1pa2uGgB0d17E8TNbrPyj2W0ohIA/xPZhf8BhJTqHw
 82G7A+kt6WuAhzXxgAQqts1HY1RUuRhr6OB6tVCIOdyPwIc5YLhKK3k
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The PMIC GLINK rpmsg device can appear before the platform device has
finished probing. In that case pmic_glink_rpmsg_probe() sees
__pmic_glink as NULL and returns -ENODEV, which is treated as a fatal
probe failure for the rpmsg endpoint.

If this race is hit, pg->ept is never installed and PMIC GLINK clients
never receive the service-up notification. This may leave the system
with no Type-C functionality and without battery/power supply
management.

Return -EPROBE_DEFER when the rpmsg endpoint arrives before the platform
device is ready.

Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
Assisted-by: Codex:GPT-5.5
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 3042261578aa..84fd0c82c0c4 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -250,7 +250,8 @@ static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 	guard(mutex)(&__pmic_glink_lock);
 	pg = __pmic_glink;
 	if (!pg)
-		return dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
+		return dev_err_probe(&rpdev->dev, -EPROBE_DEFER,
+				     "no pmic_glink device to attach to\n");
 
 	dev_set_drvdata(&rpdev->dev, pg);
 	pg->pdr_available = rpdev->id.driver_data;

---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260720-topic-pmic_glink_defer-34600458ecc7

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

