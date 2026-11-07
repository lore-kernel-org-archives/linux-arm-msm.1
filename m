Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013317;
	b=eoIn6xlwuyhFYd/3NaM0DxB0OiCex5uDX3DC9Xkyryx7QPWwMiE/oWa7m023TrQnW2nW
	 d8R85jvPGT9JI9DXJz3PXxKJOk7dg2QXM4lrEFXm87oBfuiaU+uSIst0QQGuEI2MH7m5b
	 7vHiz4wBgEE+5x0f53L+nw3+9sjmm+Ltxc4/gv8ESHE1bpdGIaRSQRZIePBwmesvTPY8M
	 YjOK8oOMqma2hkYvLXYocqe5Xdp6CnvftJ5cL6N1dZ90+kHHUfTm+3eG7pKOhJFxFMADW
	 JeOud5zouC5vyxqOPi52Vj/Mh+79gcXA4q65g/jFKSYtgC/HjGh+284SqsahY4aWgGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cN0tCITC8eXPQy35PjW1mWs5jmaxcmaoAKTS/bpvNk0=;
	b=FMAkFsONiorSzhOmi9YP3ZDnKoqUNpr0vik13cdtPr8o77CUMTSICwgD8DJn6pEhh+tf
	 KaekacXFO4gysAdmlQ3reyRDxsdUctRCkV23D8+IpybOfQGD9MeEVHOrkhvnsjHMKnHxS
	 dWs9R7pyOBxngzWbIDBAFdD/pLcC8niuKOcaxxdkC4jUeo2IveJ+CH5+dqv/becnihJEc
	 MVP1QYrlDGyDDjZIdZ4lup/LDEvhVbLnhYdjvfo2Prpft7wZ4aozk1/5EHlt1dDBR9bS4
	 gvZZLCK2vhrBiIeIdO8nVlTvYkBhBT8sDf8UphbY7kP7HNysR2RvDtq9pmq5xAy7qCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tt8i+Av0;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A73606A335
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:01:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A73606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tt8i+Av0
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so6359705e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794013315; x=1794618115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cN0tCITC8eXPQy35PjW1mWs5jmaxcmaoAKTS/bpvNk0=;
        b=Tt8i+Av0DNcEmrTRD5tlpQBbGP8qftkJlX4dqwthTFr5v4WAADtmnT1c3SFS+AAr3d
         R4zKMpeqTdYFDDTtN6URosa41uUgH4uPp5XeN4sLHAfALjOQCNc9CbaLrSd3Hoxl1pf3
         Ub8WDnR/bWuZpBHRpjjSQyU+mab7xTsdGYMlqNhuESPkTk3GGTYIPO3ZLy3klWsceKWV
         8XYTHWw0tU7WIppuiAtzwi+K1OtMLA9pa0niimLmmANSMvH60OB0zjlXlQh5ouWHgbfP
         T7fx+5u2aU1N3l6NFO/ofRmrRl1o/GsIIow3AlKfKfWXFW3f6p7BqOOtuHNYq1Pgpn6G
         v5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013315; x=1794618115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cN0tCITC8eXPQy35PjW1mWs5jmaxcmaoAKTS/bpvNk0=;
        b=ACDvxPheCY7P9JvRYSalSfw+/NtoMRImIN5qdnlrem3hUrp/YkJnXd3Juqqh+KVbAt
         Z+cUYidsUvbELmKqtmyxU7Bst+wfVXdi+VwUI3iw/YAsrlvJ08uoRIwtGmwgDYPd5Usx
         6SBHAhGEhKkpg0cl0B58vcDEktL7ZM8m7rx8L+LN2cPcb6JIIm1O9Pdx8BCUuVgdhvM8
         lik2RDe0qRDriiN7JHDRebXTBTaHuvoIu3s2ZxtrNzY0B3DRK3NflxwlRzFlk9G+VhJf
         OjnxtfI1jjabQx+lVwJ/TDq1xSOfrwJsGC9orU1oWXobK8S9OijKP25ZzcvSpebshNf+
         zjoQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2gHUh+qTAeNTDZ+qdlkhMFuCKzfBFcAEBhxxHQs/JIRIRji97NXD0r/s8CuLItvWJBe8jxTvRnRa/QIp6@vger.kernel.org
X-Gm-Message-State: APuU4Z+yylE8El0a9FBxuJoWKiiaiPqsSraqwDtoDjco+x8n2xy2+KHr
	ZmKtLAL+Dg7CIgPhK3tZFQxC7nqqenpbB4+OnvyxrRAIb9Pq+fJns201tDlnYG+W5wk=
X-Gm-Gg: AYBFou3bCvJiGSaA4CJFH6wp4dkLFASpR0QjoCPfpjOs8ozCMIZFwQHkiwgt5YcYrhn
	I7i0XR92NkmDMioku6/2t0wPSZefvHaGcNIA2OO7dMy+w7nUZSkUW1rHnA++xasHgYajL3o6O3b
	BHiSeAIOj2D76LI0JMM2Vus4Eg8uhh5fj5BOBQS8cRzxugRznzmK0AQrcuZdXgkVCelkK0QrfkA
	TfYQk3XmwxzJONZvuYTm69OryrAPvUtwPKVgHn8S/NANiZjkkrJJKpqbTxdMVFBT9cupT1fyROR
	IWnd1YWLloHEzEBWxmtecTTWnOll+PvVObmYXZzRx9/8Ag72BssggbkShexIxP9gSDhnqJFmqu7
	1Y/AdRWK83U3vtM2+twzvL6eq0LIUcTCijkv4O6IOHFJcvSSwbiGSARFZqT/pz8rzYHJaPYLC5b
	WRGhthjaIazgSMFCnhscme9mvOmOtznDA7kyha80Uye4wkSuH/l09pbchH4O7ZnYMhscl55c+jl
	NbXCp3kX71QdruAPA+15b9fSa/OnkSZIZ5LTbgYsb8I2BEGqttk2jhu/rCqDO4sX2KliWUOvnJh
	2YqB7z0nCrxQLHqGwHcYow==
X-Received: by 2002:a05:600c:4eca:b0:4a8:b8b4:6226 with SMTP id 5b1f17b1804b1-4b6dfba9e37mr74959715e9.28.1794013315215;
        Fri, 06 Nov 2026 17:01:55 -0800 (PST)
Received: from [127.0.0.1] ([109.77.115.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291531sm24526375e9.15.2026.11.06.17.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:01:54 -0800 (PST)
From: bryan.odonoghue@linaro.org
X-Google-Original-From: bod@kernel.org
Date: Sat, 07 Nov 2026 01:01:44 +0000
Subject: [PATCH v3 01/11] media: qcom: camss: Introduce CPU latency QoS
 during streaming
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
Message-Id: <20261107-v4l2-frame-sync-v3-1-e5bf7073a35d@kernel.org>
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4141; i=bod@kernel.org;
 h=from:subject:message-id; bh=MC2tO+LZrLf5zzRExbvRDUfAuASfGGTJ0bSBkOMX364=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7nh8SVPQ7ia19gMcC0jbaypy+nmjcM0mq86pL
 xdSDos9LOeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau54fAAKCRAicTuzoY3I
 OmUVD/9FCrMRm4VbFvpsZRtaoYFlduya415tQSN7ulIWwMib3VyJeCNdnbEoiEDqd2i4rWUkXwX
 zov+H4UGSSI85kkAUDP6x6PEfnsKyTmhjcmeteKWBhG8XmQf8GX7Wxo0Uev4viWc4aWCIqB9ari
 wMcbtcBVbqsKiRL8F3bQULtX3NlJiz7YfQ7HVsexSpxA3AyXnnpQwkLJVLk9AcCesCGRK9/VLlM
 bX3urLZ2Iet668qq8rRmJ6yezoUWbLzVBqJ50a+xzrzmcbsk6REOsOoly3zLsDeD7EFa2qIN9nz
 vbQ1iFx8uI2e7KpKqQz5ziWHCmSzOxPUsJ5VZEDlHjpfSGSbWoRTDt4zyAriT1t2fmEuOu4UR5j
 iWIEq5+53cZc1QY9f8PbKCmc/2aklt7RW0yjjErtnsnf03ZUK3wOv6u/blWMDwgHGQ8hQxmMJ5F
 uITYVmjuzlB10Fp6aerh/rH87rVAvmNF59pqnsZlSEopdY3YWfJ5jDqI58WaPUKMo7PcFFrB23W
 WicdrDVFBl2D+rVrttNoluhBnSzb3Z53cib1c2D7C5ksiNZIcYd/DlkVNrkkQj6iif6GyXMZRsf
 q3SqCLUfkhvYkyufFNrJjSAl31lismh/j0uV0c7f7g7WryNBrIEXL+O1RXqcISgmHiCFdbKckEF
 JrjUlHGyDXB4Ayw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

On a quiescent system - for example the X1 CRD booted to a simple ramdisk
rootfs during development of V4L2_EVENT_FRAME_SYNC it was observed that
interrupt for buffer done could be delayed until after the SOF for the next
frame.

Fiddling about with the interrupt bits, clearing them and changing the
logic of V4L2_EVENT_FRAME_SYNC to buffer completion didn't work and besides
"felt wrong".

Tracing it looks like this:
<idle>-0       [000] d.h1.    36.374380: csid_isr: rdi0 sof=1 done=0
<idle>-0       [000] d.h1.    36.406601: csid_isr: rdi0 sof=1 done=1
<idle>-0       [000] d.h1.    36.439910: csid_isr: rdi0 sof=1 done=1
<idle>-0       [000] d.h1.    36.473245: csid_isr: rdi0 sof=1 done=1
<idle>-0       [000] d.h1.    36.504786: csid_isr: rdi0 sof=0 done=1
<idle>-0       [000] d.h1.    36.506350: csid_isr: rdi0 sof=1 done=0

Tracing with /dev/cpu_dma_latency = 0 looks like this:
<idle>-0       [000] d.h1.   556.149115: csid_isr: rdi0 sof=1 done=0
<idle>-0       [000] d.h1.   556.181338: csid_isr: rdi0 sof=0 done=1
<idle>-0       [000] d.h1.   556.182880: csid_isr: rdi0 sof=1 done=0
<idle>-0       [000] d.h1.   556.214643: csid_isr: rdi0 sof=0 done=1
<idle>-0       [000] d.h1.   556.216185: csid_isr: rdi0 sof=1 done=0

The second is the pattern you expect CSI SOF followed by data.

We will require SOF to track and understand which data-frame is correlated
to which camera stastics and parameters frame. On an ordinary system with
several things pinging off at once, WiFi, display, keyboard you will be
unlikely to hit deep idle and hence unlikely to see the long exit. However
we should design for the case where the system is otherwise quiescent with
only the camera streaming.

Choosing a request of 300us - 1000us seemed to work fine but cutting the
margin finer, similar to the value on IPU6.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss.c | 11 ++++++++++-
 drivers/media/platform/qcom/camss/camss.h |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a9..52bb19f5fbf3b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5834,6 +5834,8 @@ static const struct of_device_id camss_dt_match[] = {
 
 MODULE_DEVICE_TABLE(of, camss_dt_match);
 
+#define CAMSS_CPU_LATENCY_US	300
+
 static int __maybe_unused camss_runtime_suspend(struct device *dev)
 {
 	struct camss *camss = dev_get_drvdata(dev);
@@ -5846,6 +5848,8 @@ static int __maybe_unused camss_runtime_suspend(struct device *dev)
 			return ret;
 	}
 
+	cpu_latency_qos_remove_request(&camss->cpu_latency);
+
 #if IS_ENABLED(CONFIG_PM_CLK)
 	return pm_clk_suspend(dev);
 #else
@@ -5866,12 +5870,17 @@ static int __maybe_unused camss_runtime_resume(struct device *dev)
 		return ret;
 #endif
 
+	cpu_latency_qos_add_request(&camss->cpu_latency,
+				    CAMSS_CPU_LATENCY_US);
+
 	for (i = 0; i < camss->res->icc_path_num; i++) {
 		ret = icc_set_bw(camss->icc_path[i],
 				 icc_res[i].icc_bw_tbl.avg,
 				 icc_res[i].icc_bw_tbl.peak);
-		if (ret)
+		if (ret) {
+			cpu_latency_qos_remove_request(&camss->cpu_latency);
 			return ret;
+		}
 	}
 
 	return 0;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0d..7564a7c46fa24 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -11,6 +11,7 @@
 #define QC_MSM_CAMSS_H
 
 #include <linux/device.h>
+#include <linux/pm_qos.h>
 #include <linux/types.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
@@ -141,6 +142,7 @@ struct camss {
 	struct icc_path *icc_path[ICC_SM8250_COUNT];
 	const struct camss_resources *res;
 	bool legacy_phy;
+	struct pm_qos_request cpu_latency;
 };
 
 struct camss_camera_interface {

-- 
2.56.0

