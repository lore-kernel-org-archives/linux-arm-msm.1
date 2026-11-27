Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795752945;
	b=0zyrZjHPyq+9maNhR6IeEHO1icpbK3fObcmwb+gkv77XSKjiVFjpHzHmV/AdjYPjH+a4
	 AGgwylwOAS5u+B8EsqC8eE+5sa4K8l8lRnmyPrq/pPlYRVgOzESvSEWaLzG0WxY64sG4B
	 2qaQkkVpv8RxSSPLOgCriI4FEURFnOGYuH/Xo/hZ+QVHH8OsN2eVssTwATAP4OP6B1pHN
	 Hmphmz8/u7Lkx9ZE1pPq3PELytofRyFpaGdX3qmp3OFgLuQEQSGzLptmA3i6ktQmCJ2CB
	 2iJd0kMp7+5S/k4pc1o6Y2aWxPVihbQQaE19Xt+apPFhSR4KO9QF3Xx350HbG+DJDNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795752945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vcGliw+7wqAFszZojNHo0dCVd9IfgOKk+UEIkhYPkKg=;
	b=Nt0COFoIO0dMKlSN6lD9XiYR5BGeBl1giks24EMdUN258jdmiOjPKJlkVP81PHcZ8rii
	 GUTs8F06zPpoqRYYI0ZwdVRTz1IJriheLuADlWcFUWKALzP9/RcVVR/igCUeOQ456wIrW
	 /eNm3wB0PNzjRl8eQeRD/A4pY7OCugGzvJFrYTPP5n/P+Hmk68NeIHzUIfnjmmaMXe9Fb
	 IZbozczbNDlt6EzAwmt83vpLQfTzd63a/t17yahN9qkxM4Cmqtzqk9JKRLKsVRLAKUJ6e
	 Sp2NI7zynC6v7lL//39S6QCJIy3lX8AaocMPafm2aQoP4ylQaZ8nYHPiXtt+sIsplWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AStwkWGC;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513EF606A330
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 513EF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AStwkWGC
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so73535215e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 20:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795752944; x=1796357744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcGliw+7wqAFszZojNHo0dCVd9IfgOKk+UEIkhYPkKg=;
        b=AStwkWGCB120T6+0AWLd6honjy97savonXLiMy84mGXUgI48lU2UO99gz780rwByVQ
         rjNqqHFqrriiPY0SfMsZQfNc7sDoZRgMKTQZpUD+DfaM9XZdJ9Ocr8tAmM7D8TjmL3Ps
         gelajoU45/Fn2UycfRsuG/pc/pjFv3Ibwrxk0oyqetuo2ShXpBQLK9kgB4/gcHHI2kyr
         ngOaUaNdvchUHRfzWJnQ63vp3f6YoNvlxADumhSQYUovbriwmUnbosTS58S9UGmsBCeh
         kf5P9tv7+TVjkoR419qBeT6fSeq785Wj6bCLxsV8GRfdCgNRhXy7hs5/JRLZsE6VrIq1
         mMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752944; x=1796357744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcGliw+7wqAFszZojNHo0dCVd9IfgOKk+UEIkhYPkKg=;
        b=H/KQeoSdCuVA2sUvDE5WeEYVDT5DaNK1raeM62BDDbat6fr2cVDyjiQcPHowKLAF/Z
         KPrfySaC8TjAyA5u0nMALLh4aeoox+SmqgrRkSHi4td8ikFGNC5j02pouQuE6lXa3uhW
         IHisMBpBJQWDsmKADjQqfrEJ0j7/Nj1RH8n37bmfIEZ+RZtaJOtOR2EA+C5/YHjlEkK3
         gYwQoD6arKJQBwf1a3Gw0a15bwzsgsch+TOZM7V4HUwbdIoNTNuBxcMGGoSDagjqDojA
         C9sRDAo5Ixa7+UWeHxewVe9AG3oEoTDyts2mYdf0IzOWr0C21YrMlq8mjUBf+SPt5tJY
         /6SA==
X-Forwarded-Encrypted: i=1; AL+hErEVkoDpPy+w3iugUOFh6Och6fCaoDbQLhkgP+/3O2eGwNr2pDhH2BP69iSHkEgXJUAs7qPCH/H0ND1wrf4y@vger.kernel.org
X-Gm-Message-State: APuU4Z8V6SjH/pumRb4QXo/3jWzTiIFaUH3thFUQC3JotBm6lk+IUAmI
	dF0EuPXhgCYpxEQvuZs5v961YMkq8yWgPvhsmZEhDpBuPfibGjH7DnPRs6Ob9S2bS3I=
X-Gm-Gg: AZFdTZe6s8EweLHmF9Rtnsdo00a1lUTwiz5WzgEICtp9aNgO8FO258SiQdazpIIsBPS
	E9m5M7o17Hud/ZR15yWMD4/GaDy9Jkxo+gkExSuoUYNhiQR0JNyrGpzvJ2ODSqyVowgqUR1lZLc
	bvB6rmSNbNzhJBnCgzGyaXWdy6AfnkAxeYXuAXKqLhOYW0IG7rRDBzwPJmMvjMztsBJZiHw53Cr
	t5PKjVzIAk9pcEj9OkHnaryYoY9OebA5spli9i59SU7fiigimqPP1W9RSW5r5TL3ux0g+j5qwfj
	7BW4gP0FSMyJDS9Aw6TC00X9dLo80K3Jmk//C+OzktNU4LlJbdNm8PA4ee28Ww/VBirCtT0vCIJ
	DXcmQL8ZN7B69Euj174xymTPZ6gqheOj+t5zt6hbhUL5QyG9Y1PxpRGJlOMb0ccGQurhnMYQ53s
	Cy3YNZow93vwHU/YoNnQ41FpiterePd1APXj1KKw4LXL/sGNLBpWzjwpQFyFcw8oQlARUFPVheB
	0KhOUVIwJhuMDnmDLFzrWb5wh6wybG41mDK3Y9Wnv77U5Qo2qlZ3YFihgM6dpwf57Gvc78uwhej
	be8rWretYqrtbQ53ZDY=
X-Received: by 2002:a05:600c:4f15:b0:4bb:6861:657d with SMTP id 5b1f17b1804b1-4bb88923954mr541062325e9.21.1795752943655;
        Thu, 26 Nov 2026 20:15:43 -0800 (PST)
Received: from [127.0.0.1] ([109.79.27.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442995sm686987465e9.2.2026.11.26.20.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:15:42 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Fri, 27 Nov 2026 04:15:31 +0000
Subject: [PATCH v2 2/3] media: qcom: camss: csid: Stop using csid->id as
 both index and identifier
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-camss-routing-fixes-v2-2-b7152f0af49a@kernel.org>
References: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
In-Reply-To: <20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11784; i=bod@kernel.org;
 h=from:subject:message-id; bh=UGflnTsEgdvXRSvW7ZsZwKK7GZ07E+E8bHIBW12M/Zw=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBrCQPoRT8b7+1STyXiyjWAB6oRcBIuON0s5OyBs
 ZS8ChTaWhKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCawkD6AAKCRAicTuzoY3I
 OlDAEACZcx8tVhWZJv/NptjP7CGLP59mANLXWhoYDs/PBUAzXIlZ0WSDPhkUT/m3RYwNhNniUTy
 nBahFwez1xXEnckyTphLe0WN0L3RxUfSS0caN6u6sJIgcpVXDqojB/EcNIAyDYpqcKZQnEIXEKW
 TIm7Lb2rvhfo2IAYNWOfmq7lqbCwl6qydeyW5cO2kfPSNIfxVYObftUGNODmu6CGOsc4JjIQQM2
 SC/YR4sjGuDgwN+yxRAVtjFVXobGPM5eKTL2BIEGZLHT93Jypu4AA8APYGS5P3qURZW3CeHLBEP
 FoO7O0E+yosx8dNw/j/9mQ24RxJ93Z6vErIcLhQDu3MJGm419ZuS6vJaAWnXEIfCoTbVwhCT04A
 HJyiptMUgUhMJNvP0l2OnyzG6Wq43ld4wIcw3UajsiC8LM4uvQkomKeGcPK7BLVgtWyC4hidjhi
 JYVxbaLnoWSBir3MFpLXORIii8x1CT/yG0+9SBKQv0/1dYJtxaNBdc2rci4lHm1VrE4QVjC7dfD
 u7qYJ9VRGjKGzxm4QBiEYS4cXEZDHIMy+yOXJd7hD4T/rRkgANmSFxKuvJ4JgDSFzer3puosok+
 wuCLHMMd4A3Ui/1gST96+UoiG3vdORpiVKDi04dhfKfR/RYQei7wZTF8svxNOqHGVHBaZakxi/H
 8usSJ68zazV76AA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

We have thus far used csid->id as both a hardware identifier and as an
index to the array of CSI devices.

This is obviously not correct, but has thus far not been obviously
damaging. Removing a piece of dark silicon CSID2 on x1e80100 we see that
the reliance of csid->id as both hardware id and index is a brittle
happenstance.

A previous patch enumerated a .id field in the CSID resources structure.
The purpose of the id field is to denote hardware identifier.

Instead of maintaining both an hw_id and index field in the CSI
data-structure pass the struct resource field to csid->id.

Use helper functions from a previous commit to differentiate between CSID
hardware-id and CSID index where appropriate.

A level of granularity doing csid_index() and csid_hwid() in separate
patches wouldn't work as we need to change the subdev_init() index and the
meaning of that index atomically.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid-1080.c    |  2 +-
 drivers/media/platform/qcom/camss/camss-csid-340.c |  6 ++--
 drivers/media/platform/qcom/camss/camss-csid-680.c |  4 +--
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  4 +--
 drivers/media/platform/qcom/camss/camss-csid.c     | 34 +++++++++++++++-------
 drivers/media/platform/qcom/camss/camss-csid.h     | 17 +++++++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   |  2 +-
 drivers/media/platform/qcom/camss/camss.c          |  3 +-
 8 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-1080.c b/drivers/media/platform/qcom/camss/camss-csid-1080.c
index ec56ba85a0fa3..95b035d80f1ea 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-1080.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-1080.c
@@ -329,7 +329,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			}
 
 			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
-				camss_buf_done(csid->camss, csid->id, i);
+				camss_buf_done(csid->camss, csid_index(csid), i);
 		}
 	}
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 42ff629ce410d..08cc88707ebe2 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -138,7 +138,7 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 		val |= CSID_CFG0_ENABLE;
 
 	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x df=0x%x port=%u vc=%u)\n",
-		csid->id, enable ? "enable" : "disable", format->data_type,
+		csid_hwid(csid), enable ? "enable" : "disable", format->data_type,
 		format->decode_format, port, vc);
 
 	writel_relaxed(val, csid->base + CSID_CFG0(iface));
@@ -175,11 +175,11 @@ static int csid_reset(struct csid_device *csid)
 	time = wait_for_completion_timeout(&csid->reset_complete,
 					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
 	if (!time) {
-		dev_err(csid->camss->dev, "CSID%u: reset timeout\n", csid->id);
+		dev_err(csid->camss->dev, "CSID%u: reset timeout\n", csid_hwid(csid));
 		return -EIO;
 	}
 
-	dev_dbg(csid->camss->dev, "CSID%u: reset done\n", csid->id);
+	dev_dbg(csid->camss->dev, "CSID%u: reset done\n", csid_hwid(csid));
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d5..35d3970cc4d4e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -228,7 +228,7 @@ static void __csid_configure_top(struct csid_device *csid)
 
 	val = CSID_TOP_IO_PATH_CFG0_OUTPUT_IFE_EN | CSID_TOP_IO_PATH_CFG0_INTERNAL_CSID;
 	writel(val, csid->camss->csid_wrapper_base +
-	    CSID_TOP_IO_PATH_CFG0(csid->id));
+	       CSID_TOP_IO_PATH_CFG0(csid_hwid(csid)));
 }
 
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
@@ -417,7 +417,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			csid_rup_complete(csid, i);
 
 		if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
-			camss_buf_done(csid->camss, csid->id, i);
+			camss_buf_done(csid->camss, csid_index(csid), i);
 	}
 
 	/* Issue clear command */
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78b..a8b969bb4ad9c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -158,7 +158,7 @@ static void __csid_configure_wrapper(struct csid_device *csid)
 		return;
 
 	val = OUTPUT_IFE_EN | INTERNAL_CSID;
-	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
+	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid_hwid(csid)));
 }
 
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
@@ -316,7 +316,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 				 * CSID from VFE. Once CSID received bus done, need notify
 				 * VFE of this event. Trigger VFE to handle bus done process.
 				 */
-				camss_buf_done(csid->camss, csid->id, i);
+				camss_buf_done(csid->camss, csid_index(csid), i);
 			}
 		}
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 77b7d016210e9..123c097ee54bf 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -616,7 +616,7 @@ u32 csid_hw_version(struct csid_device *csid)
 	hw_rev = (hw_version >> HW_VERSION_REVISION) & 0xFFF;
 	hw_step = (hw_version >> HW_VERSION_STEPPING) & 0xFFFF;
 	dev_dbg(csid->camss->dev, "CSID:%d HW Version = %u.%u.%u\n",
-		csid->id, hw_gen, hw_rev, hw_step);
+		csid_hwid(csid), hw_gen, hw_rev, hw_step);
 
 	return hw_version;
 }
@@ -690,7 +690,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		 * switching on the CSID. Do so unconditionally, as there is no
 		 * drawback in following the same powering order on older SoCs.
 		 */
-		ret = csid->res->parent_dev_ops->get(camss, csid->id);
+		ret = csid->res->parent_dev_ops->get(camss, csid_index(csid));
 		if (ret < 0)
 			return ret;
 
@@ -726,7 +726,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 		regulator_bulk_disable(csid->num_supplies,
 				       csid->supplies);
 		pm_runtime_put_sync(dev);
-		csid->res->parent_dev_ops->put(camss, csid->id);
+		csid->res->parent_dev_ops->put(camss, csid_index(csid));
 	}
 
 	return 0;
@@ -739,7 +739,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int on)
 err_pm_put:
 	pm_runtime_put_sync(dev);
 err_parent_put:
-	csid->res->parent_dev_ops->put(camss, csid->id);
+	csid->res->parent_dev_ops->put(camss, csid_index(csid));
 
 	return ret;
 }
@@ -1101,9 +1101,11 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	struct platform_device *pdev = to_platform_device(dev);
 	int i, j;
 	int ret;
+	u8 idx;
 
 	csid->camss = camss;
 	csid->id = id;
+	idx = csid_index(csid);
 	csid->res = &res->csid;
 
 	if (dev_WARN_ONCE(dev, !csid->res->parent_dev_ops,
@@ -1120,11 +1122,11 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 		 * between the VFE "top" and "bus" registers. this requires
 		 * VFE to be initialized before CSID
 		 */
-		if (id >= 2) /* VFE/CSID lite */
-			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
+		if (idx >= 2) /* VFE/CSID lite */
+			csid->base = csid->res->parent_dev_ops->get_base_address(camss, idx)
 				+ VFE_480_LITE_CSID_OFFSET;
 		else
-			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
+			csid->base = csid->res->parent_dev_ops->get_base_address(camss, idx)
 				 + VFE_480_CSID_OFFSET;
 	} else {
 		csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
@@ -1140,7 +1142,7 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 
 	csid->irq = ret;
 	snprintf(csid->irq_name, sizeof(csid->irq_name), "%s_%s%d",
-		 dev_name(dev), MSM_CSID_NAME, csid->id);
+		 dev_name(dev), MSM_CSID_NAME, csid_hwid(csid));
 	ret = devm_request_irq(dev, csid->irq, csid->res->hw_ops->isr,
 			       IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN,
 			       csid->irq_name, csid);
@@ -1215,7 +1217,7 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
 	struct csid_device *csid = v4l2_get_subdevdata(sd);
 
-	*id = csid->id;
+	*id = csid_hwid(csid);
 }
 
 /*
@@ -1378,6 +1380,16 @@ void csid_sof_event(struct csid_device *csid, unsigned int id)
 		v4l2_event_queue(csid->subdev.devnode, &event);
 }
 
+unsigned int csid_index(struct csid_device *csid)
+{
+	return csid - csid->camss->csid;
+}
+
+u8 csid_hwid(struct csid_device *csid)
+{
+	return csid->id;
+}
+
 static const struct v4l2_subdev_core_ops csid_core_ops = {
 	.s_power = csid_set_power,
 	.subscribe_event = csid_subscribe_event,
@@ -1431,7 +1443,7 @@ int msm_csid_register_entity(struct csid_device *csid,
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
 		     V4L2_SUBDEV_FL_HAS_EVENTS;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
-		 MSM_CSID_NAME, csid->id);
+		 MSM_CSID_NAME, csid_hwid(csid));
 	v4l2_set_subdevdata(sd, csid);
 
 	if (csid->testgen.nmodes != CSID_PAYLOAD_MODE_DISABLED) {
@@ -1505,5 +1517,5 @@ void msm_csid_unregister_entity(struct csid_device *csid)
 
 inline bool csid_is_lite(struct csid_device *csid)
 {
-	return csid->camss->res->csid_res[csid->id].csid.is_lite;
+	return csid->res->is_lite;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 6e329789826ca..a0a4ec41e9264 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -280,4 +280,21 @@ void csid_sof_event(struct csid_device *csid, unsigned int id);
  */
 atomic_t *csid_get_sof_seq(struct media_pad *pad);
 
+/*
+ * csid_index - Get the index of a CSI decoder
+ * @csid: CSID device
+ *
+ * Return the index of the CSI device.
+ */
+unsigned int csid_index(struct csid_device *csid);
+
+/*
+ * csid_hwid - Return the hardware id of the CSI device
+ *
+ * @csid: CSID device
+ *
+ * @Return CSI hw id
+ */
+u8 csid_hwid(struct csid_device *csid);
+
 #endif /* QC_MSM_CAMSS_CSID_H */
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 22b8ffe183b03..25d2419434b6f 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -883,7 +883,7 @@ static int csiphy_link_setup(struct media_entity *entity,
 		sd = media_entity_to_v4l2_subdev(remote->entity);
 		csid = v4l2_get_subdevdata(sd);
 
-		csiphy->cfg.csid_id = csid->id;
+		csiphy->cfg.csid_id = csid_hwid(csid);
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3b569a6e88150..0a0af184bc9db 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5328,7 +5328,8 @@ static int camss_init_subdevices(struct camss *camss)
 
 	for (i = 0; i < camss->res->csid_num; i++) {
 		ret = msm_csid_subdev_init(camss, &camss->csid[i],
-					   &res->csid_res[i], i);
+					   &res->csid_res[i],
+					   res->csid_res[i].csid.id);
 		if (ret < 0) {
 			dev_err(camss->dev,
 				"Failed to init csid%d sub-device: %d\n",

-- 
2.56.1

