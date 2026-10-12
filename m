Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C09B3033E6
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810063; cv=none; b=a7v2B0r45Nbxa6QWxFhnbcfW6YzlYP1zt63Azp4n/WFQaoVPkbF/wrg8GgsV5iYsIy99jpjLFo+rNP1EsG31qk4jvevO5GHfNBeo/Q5p/aKYzcE+8wT2oPpx3iQQNNipIrUzW118CXgQkg67lEn0XJWvDkJe/6YAOQZPuMmaB5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810063; c=relaxed/simple;
	bh=+4zUTyq3J6D0WJWX/Ui2UZzNSTwF6xlek6vWAXjql6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MHWjUoqh7tip1jhMJxmzJc4in8gR8nI4xhOFNr+zw1pGBuIwXaIn8VH7+2W9SjrAEB0w346Hp86Sazo283FuepGalqoBK6slq5TJ3HqU+a+b2MaOe2LMrOa6Q++/yFXux2Y9i7KnlVTBqfzGfdl1+U0dQ5ckXWXbjy8yOptskDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkBG6TnH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkBG6TnH"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so841985a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791810058; x=1792414858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgN5EQTZPAe/8W26fAOdp25QZc56hSLNje2myOYBavI=;
        b=pkBG6TnHdrgGU7ztcFV75AZ28hr2eW0Xohdtxbprzdrs77tVL2CUe4qzfHMBGS7Uk9
         2/bby8kQwt4V+a3Dq4eJpJK7rA4uC1bPusqA7SSCr1SHLfDgtM9/d72rEliaNb10VAw1
         Q7aiigyxR4+Kfjrw8WLs3Nkb/bBFrzadGhY/crzsxklkczhi7e9jSgz03YfAce5MB3pP
         yYYEf3nvqSGcbvseaGowlJYJFCWrKfZhBTZWPi4Z2IDRGQtapDDeXsQ8y6aDdmINKlRz
         MPQe1X9jOcQQ8V1v6+WhQ55TJmDVg+lntdbg3TlkClTLEJDlLd4c4eKQUHm0syjrXvpT
         ICog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810058; x=1792414858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgN5EQTZPAe/8W26fAOdp25QZc56hSLNje2myOYBavI=;
        b=BO97z47YTGOUZG7H5xL08bWt36uK7oS3sCJBI7c1f7WkdDsuHYO+wAxlyXflKE8fxR
         N/0hbQWf3E+8lsc4QGFYl1PLMS4haUZtEnQP1xsaW5crLXINJNmnZOhP8OUoKfwlsOEr
         3r9COronHkuGTfFt8c1+Olpm1LeIvJHYKKVL+B2mCZ++D38a3Wm1fEHwYeaZwsPmZXrS
         8XhgjSWQayZLJmKwihEJzL7cisbh24LSFgDMz46XBs51acKltEW8eE+MFLQ80NjPkejh
         EfJVH53lND93PbQHKa/PIf42wPwt5+y8sHSd54c/18wW+nclhxdxPQxA3zCX9BkqMTG1
         yovA==
X-Forwarded-Encrypted: i=1; AKwUvBwWAWycNwPWishHdPOBAWs6I7QEjASFZnlJVD95/k7ARiyW6YUGlNbAipHLic6HDvsjFNF1AXVdUTCmjscY@vger.kernel.org
X-Gm-Message-State: AFq9FYKNpE8rPuRizsZNcZOELDlgyyo/7OZk5XHnO2qzakKUkksIzB2L
	osUtTSYXQUtQZcohm4+CsBbxoM4dIynaUXRqmaxxyCZ5uDBlVHj8CRJR
X-Gm-Gg: AYBFou1nowTSAMA9tRdpYMefP4mqkDI95JmGXHV+BaNh5dym1JOuBFQB4PfrkxIPMCA
	OyNCout+cUIptD6FEmWYUp0nObaWDn2bw2+D5kd1zTAgJBucaluftXPeC9i2USECjyHYF68vCQl
	yMc8cSsmxsya/KMPIkOUo2LLrPxE5rk3/hZtFqcBnmvbDKeVCiLBuhErJTVhIdPV7dO+SvAGo3m
	uoN//xlAvLkwWbO5PgELf/E3Rlx9O5SVS5nMosfJmI+QXsdJGhR+PwtWGi5l6ZeIuypx9Da53+W
	86sTtvop+CESZipV95cAx9h5aQoLQJ4o4ws2YGSth0GKFX2JCxWt5tuh7rGTNQCHW63LFBvgo7O
	PJron0V3zMvh1W6WCJ0NpgWMerlQ3P9HzDpnBkJ6cnf1c4LpNu4H5kkSPXcqFl9j5WtUf+xuPRA
	AkLPfDnPTleEV2bpXK1zxEWL51I/wgbwXDRp9t7R+BqxIzAp3+qzg0nv4+4ze4w+wfWYp1cn8Te
	UX+45OnoAFEFQ==
X-Received: by 2002:a17:90a:d2ce:b0:39d:e54c:8658 with SMTP id 98e67ed59e1d1-3ab3a364f7emr7429624a91.5.1791810058210;
        Mon, 12 Oct 2026 06:00:58 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm19295887a91.11.2026.10.12.06.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:00:55 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] power: supply: qcom_battmgr: report the USB type from USB_ADAP_TYPE
Date: Mon, 12 Oct 2026 22:00:53 +0900
Message-ID: <20261012130053.442-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On SM8350 and SM8550 class firmware the USB power supply reads its
usb_type from the USB_TYPE property. On a Kaanapali (SM8850) tablet that
property is 1 (SDP) whatever is plugged in, while USB_ADAP_TYPE reports
the adapter, using the same numbering as POWER_SUPPLY_USB_TYPE_*:

  PC port                  USB_TYPE 1   USB_ADAP_TYPE 1 (SDP)
  USB-C dock, 5 V PD       USB_TYPE 1   USB_ADAP_TYPE 6 (PD)
  65 W PPS charger         USB_TYPE 1   USB_ADAP_TYPE 8 (PD_PPS)

Qualcomm's downstream qti_battery_charger driver also maps
USB_ADAP_TYPE to POWER_SUPPLY_PROP_USB_TYPE.

Request USB_ADAP_TYPE for POWER_SUPPLY_PROP_USB_TYPE instead.

Tested on a Lenovo Legion Tab Y700 gen 5 (qcom,kaanapali-pmic-glink,
which uses the SM8550 path). Only tested on this device; the SM8350
variant shares the property map and was not tested.

Fixes: 29e8142b5623 ("power: supply: Introduce Qualcomm PMIC GLINK power supply")
Reviewed-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2: add Fixes tag, collect Kamal's Reviewed-by
v1: https://lore.kernel.org/all/20261007123932.1664-1-26rote@gmail.com/

 drivers/power/supply/qcom_battmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 7716eb9e1aff..b24860d2ded2 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -975,7 +975,7 @@ static const u8 sm8350_usb_prop_map[] = {
 	[POWER_SUPPLY_PROP_CURRENT_NOW] = USB_CURR_NOW,
 	[POWER_SUPPLY_PROP_CURRENT_MAX] = USB_CURR_MAX,
 	[POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT] = USB_INPUT_CURR_LIMIT,
-	[POWER_SUPPLY_PROP_USB_TYPE] = USB_TYPE,
+	[POWER_SUPPLY_PROP_USB_TYPE] = USB_ADAP_TYPE,
 };
 
 static int qcom_battmgr_usb_sm8350_update(struct qcom_battmgr *battmgr,
@@ -1513,7 +1513,7 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 		case USB_INPUT_CURR_LIMIT:
 			battmgr->usb.current_limit = le32_to_cpu(resp->intval.value);
 			break;
-		case USB_TYPE:
+		case USB_ADAP_TYPE:
 			battmgr->usb.usb_type = le32_to_cpu(resp->intval.value);
 			break;
 		default:
-- 
2.43.0

