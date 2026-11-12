Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491377;
	b=HOTnn4Ue+1d5a2aZTE7+tayqDduDztwKdf81nOQgKbyjvXWyfevzB/tqDBZb6YwFn3qy
	 jdSKrsZCukGVHByR2ZyaM8HlhIvs1Vbt13id7fpx+S5gwRcKLOgR8wkukCLHVrTgDYN0c
	 mK+eRE5zBFqVs/nPr5tlK6IYM+vkTUGiOtLWZaEZBGPYelznGD0ox8lUWRGPQWD5raFWx
	 6RocgUZlS4fFQKANojzszNN5WWdb7WWhD6GtmJ0FXMxRp7jgQBef4pwTZC3XpM1rxBvKl
	 5nWnUac6fAUg9qTskM1mmOLiaswlLdWvNHubv/kRpa9NwT8gDclI8rp6U8Ed7pMF4Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2vHG4fjXWFVR+UOug7O+NH5YlX7OSBRB9SJwAE/JWnA=;
	b=WjuWiaHcmaTd7yBcjv6m2u7A36ZB8qsmTppqViXmx1I1BA94a3YYL3+0RSiu9e/J1ZGh
	 Wz/TnFXFJ8AZerb/0yfUW42qog6BWNd+z9u03IuDtUf0nQPCNYinji7DRrql9A7l0EZnZ
	 lwYPqp7Tfoa0Z5jO2wO43UcZAC2cgAa6ZlGkSfqtoFPlMXXFVit+SNBbiV7twZuHLeeOL
	 Fksg9SVOF6kQn/SRT8oPM7P1hGRACw7DTZsNK87WP9roTRloaMxT6tLI13Cc/aZa/1Ni1
	 6HT4VMLhxejyTeB0dkqcRuf3rjwb7Vr3ahSp+7Xhn4YxgD3NDB9bS8dHNznWaSO8sBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="b80b3/Xu";
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1293D606A8A7
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1293D606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b80b3/Xu
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a9f9473029so3536674b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491376; x=1795096176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vHG4fjXWFVR+UOug7O+NH5YlX7OSBRB9SJwAE/JWnA=;
        b=b80b3/XucWAvkorPAcPXrSbu/T5ngQ7xU55B3sEoq0kWuXSr3jk/K95ufVNyALs1mQ
         It/fh4+/vaVtl+3W3nK3Tya3xGeZiyt6oOJlWDUNpsYz06WeERQfu9Fpf0cjH7EdprcO
         yyUvW9lm+MqFn/wp88qecQJXTfuo79RAuskBik7l7DKZm2tsDg4GRCWjJjfvl9kpQUCT
         Yc/MJUJenBluKUBKjJvWg4pUxa/L8YkSAWS9TkpalvUtS1oMNl2WirfmQIkY4YyRtUYc
         3BnAnnPVLjb+Og8rmMGS5AIK7yjpHVAQJXqQA+gs0XzmvuoDHcUfgEFeqMFZ+4L4X8rR
         SFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491376; x=1795096176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vHG4fjXWFVR+UOug7O+NH5YlX7OSBRB9SJwAE/JWnA=;
        b=avzzRhukApnOdyLxjMJg9PWLcazVYPzHKf6hmDUgkiLBRaP8bqbw9ZnAU6xu1AkYHM
         MmBzQ2lNVszBJ/KquoUMZ20FoDXQu+TR+BKmWBw/6+jHrsW9nRu8mgtop/lk+06YO388
         u3z/DO8TrBRwAQN3tKNzCCHhkGiLECm/0NoWhVgLQzONCViqnvrboOTRZcg87lDG479o
         P1xtGI+u6tbE4KAL227zABgoKjy80tAJkHblpO8bEd5dEUibBfwyo67E4W42BFtGwgHd
         GIVApwKFhOKcZFYxwUWfpo8zLWwYktKHdByitpm/Ft3U5DBXqrY152bMKjkoggIbmNCV
         jY6g==
X-Forwarded-Encrypted: i=1; AL+hErE8JL5vUyCXXHzeQKRJHXuzaQ4R7DOECGCnuC2o5q/dlhEaVg5YsZSprPCBaJEiyCtODh3AIAjp0hmtTFmt@vger.kernel.org
X-Gm-Message-State: APuU4Z8MO/Y0O00eZ0vNkmm4Pg5DggzxWMT1OKssriDwdX1p9oGkL8od
	x+Gfl5AxZLZ+Le68q5jLgJGXlcZnyYPk2grWO0DA7bWPQ+owE24tzfnx
X-Gm-Gg: AYBFou1+g9nwcWATIwwmuvxoGzIb2oDOlxj6bRuo78RqM8HvzZIDvL9uWdXdSSybl56
	aVO6g9O1O9/h0m1ljWN0bdEcVEhGcdyalVeFRBwMS1mOoP2+juz720IEPQyvuE12vfDwuOh3612
	sW0KApZfCWJ9uMYx45enP1eyqTp5tHLUvV3pWJtBL7lVVsY+shv149QAa7xne+3+snM/fwxNGsM
	1Q4O98u7KxCj5DMP/LwAvODa7MMqKuCahxXNfUflQpmuoDDBvpAnnNQarR5zeoTEWa9R7n8UGX0
	FtVClksLFHjE2t+YRsh32NNE0emiwqkxrj1HgCAC0hkteUAKvSxFgusuy7KGSPuXWXvneyMKT+W
	gYhrq3gpMk38fil1OXMFd0CAL6/RCNdynVfkdvzGEyVnBNj5ObZyvo32fYgkWZfoJ7jyhxoCS08
	Y2HkFOubvzlrsB/TmXm0k+nM7h3ZDCmlxu3WvyLLtIYeoZFogNWxoke7IeSeObhJsz7hRCUiVR7
	+JjGmqhSyiKLNVa9B99a1wYErxatAPiW47nl3CCVSSk8TBMISGJHYyV6nzFMocI44MB01rDAliS
	8HIekGvEWXzP6AFWcbfVI0i//BEJk2fevYWSrU/wSg==
X-Received: by 2002:a05:6a21:407:b0:3e2:7882:f14d with SMTP id adf61e73a8af0-3f2ffac4031mr5937239637.70.1794491376116;
        Thu, 12 Nov 2026 05:49:36 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6c51sm3550580b3a.14.2026.11.12.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:49:35 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	jingyi.wang@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] power: supply: qcom_battmgr: fix the battery current sign on Kaanapali
Date: Thu, 12 Nov 2026 22:49:26 +0900
Message-ID: <20261112134927.95-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261112134927.95-1-26rote@gmail.com>
References: <20261112134927.95-1-26rote@gmail.com>
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

The Kaanapali battery firmware reports the battery current with
discharge positive: on a Lenovo Y700 Gen 5 (TB323FU) current_now reads
-9.1 A while charging and +0.57 A on battery. The power_supply ABI has
charging positive, and upower reports such a charging battery as
discharging.

Other firmware behind the same callback uses the ABI sign [1], so
negate the value only for qcom,kaanapali-pmic-glink.

Fixes: 16a7c32e586e ("power: supply: qcom_battmgr: Add support for Glymur and Kaanapali")
Link: https://lore.kernel.org/all/20260829054546.86210-1-jan.brummer@tabos.org/ [1]
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2: no code change; reworded the device name.

The sign is checked only on the Y700 Gen 5. On v1 Konrad asked Jingyi
to check QRD/MTP; no reply yet:
https://lore.kernel.org/all/0e5b7d2e-e141-4ce4-a873-b65bd9ef3c4a@oss.qualcomm.com/

 drivers/power/supply/qcom_battmgr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index d6e3edbab..58e103e08 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -316,6 +316,7 @@ struct qcom_battmgr {
 	struct pmic_glink_client *client;
 
 	enum qcom_battmgr_variant variant;
+	bool current_inverted;
 
 	struct power_supply *ac_psy;
 	struct power_supply *bat_psy;
@@ -1574,6 +1575,8 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 			break;
 		case BATT_CURR_NOW:
 			battmgr->status.current_now = le32_to_cpu(resp->intval.value);
+			if (battmgr->current_inverted)
+				battmgr->status.current_now = -battmgr->status.current_now;
 			break;
 		case BATT_TEMP:
 			val = le32_to_cpu(resp->intval.value);
@@ -1804,6 +1807,9 @@ static int qcom_battmgr_probe(struct auxiliary_device *adev,
 	else
 		battmgr->variant = QCOM_BATTMGR_SM8350;
 
+	battmgr->current_inverted = device_is_compatible(dev->parent,
+							 "qcom,kaanapali-pmic-glink");
+
 	ret = qcom_battmgr_charge_control_thresholds_init(battmgr);
 	if (ret < 0)
 		return dev_err_probe(dev, ret,
-- 
2.53.0

