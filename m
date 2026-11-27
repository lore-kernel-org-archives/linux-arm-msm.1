Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795919;
	b=07Z/t58eEZg+GJw1I0uOY4fLvPKjeTcLKUhCiUB6tcbx0vXECCs5M6OUzL0Yxn+tkLud
	 2r2RqE+p/CLGVefZ+IniwQRvFZDgQAOlrKqcixFKzrYLDYQf6laXg+GnbdXG+1E7UFwgA
	 pcKQJcQkqdJeUiu1Lcn54qJ3CaQpxiC4LyLm4YWOuLyfcY2Ik0oOjGrTHxwneohNfaEdX
	 hgYAUYt2FFDxx7ZiZS5OZ6GuIa9EtsDTDflzSeuz1zELSeM0vFk62q2zkJ2A/IEM3SdwR
	 G5HbgEKKG/hCTXXW0uI7ZW6G5QsaHrlEtcGj7fARnlTVDW60LZz1VqoamZjqaGW5+TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+89SsGqrKXpNl1VbEyve5ocEzVv7utcbsmiw7j5Nt0s=;
	b=X5e6KIlnnYuTeLqZjKpy3G4CTY2TJYiENDmhtxjh3wqzlX6GL1LNkaHZQt3zYDN7Mitq
	 fefNEIV9J1W7Sw69xUDuCa12vBO7ngjBvX9PuvSOp3A/HsDIhrrtF4IoTp4wNjqv2uJuO
	 NKhysZ0MdkBXYQcyYXDQz48a8vz98wqhp5K9KFb0p9C8Q8vrSj9FNxDrse4Hqd9fKjUiQ
	 81S7sWlfHEgsg7wILFcqEixxUTEUwGEZKt/DPDFgG4h5eoUfrgzVyUAzf2Fba7RIeyll3
	 J70gfu29f7x8eNsYmaNw1cqpRtj1+RI8SPXV1VE9BO/+8U++ud7nPu//X7ze3YbNo3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JIRqjXJU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS06lRa+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373F606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E373F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JIRqjXJU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aS06lRa+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpq8R2212381
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+89SsGqrKXpNl1VbEyve5ocEzVv7utcbsmiw7j5Nt0s=; b=JIRqjXJU4yV1esiX
	8YqP/dzIhowWvXwstGoqxkdOTrkpHqfL1StjG4UtX6daTpaC30llCw4V4L9AOsqN
	1srNlENNfoT5Eb9DJX9v60mUegKvGyABQUMRLi0IXL8Ae4UVF1D//ILls8/XJcHw
	6D2ZNaJjQXg9Rnu2tYPHuiWfRUuxYK3h6wVvovhRVkt6Yyz/w2L+687Bk/FlwBXG
	6mjsx1gnJY3srJq+o6FSHicsZOWuX4ovP1Yi/DPuJ7bEE3pMVxjCvEvQ8JA29Y4a
	RKVXH46CxxBbGlwDyCLcbjtEBMwzGAQxf3IBbTRv9wTaUBQqa9ggFL+5clDSLGKS
	pTMkGg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55uqyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 16:11:57 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b4d09fefd7so71981287b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795917; x=1796400717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+89SsGqrKXpNl1VbEyve5ocEzVv7utcbsmiw7j5Nt0s=;
        b=aS06lRa+8ZOZ7Rgvgy94gEFQuX+Iez7wCX2l4LibJSMB7qzCxnps5TFRvUnDj6JnQ7
         grFUPG6LOBRxFVoMZToKDlLGGUelU0om7Vwkri0U5ga4bSFLzgp71bdywkmGu63W3KWX
         twnhVBy3tPxjgY89vP/VWi14kqriJRKa7GlBi9kKh7+FX/FQoWOSi6vLJqDOCHy0WFS+
         CcObiQHU8D5LDWU8k8DET+PEjWAhfTjjeEWT9RrHVaDihZXYn6iEwpqRapsIEZjLg8wz
         3cXVx+QI8uqBsEeIxXcxOX14hlYzdwY6LtsTPyDLX3hK5yHVE5bJszevLgauRtY3iCLZ
         ieLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795917; x=1796400717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+89SsGqrKXpNl1VbEyve5ocEzVv7utcbsmiw7j5Nt0s=;
        b=IYMZzc84eKwy96B6X+1JqPAPmx5O2sp/LCHUM1FzpfnmmK1yJcTKIxXYLwuYrzMEJL
         spA/YrU3eQjeFmJfKq3u5UPmAGUChlpfk4RaFSNM/kvsbNj9n0Mq9qW1PgLIbC8DZNIQ
         jlohpH59jUo0Dof3580RMFIaFqFZ8jTJB3/3lgp09t0b+VGI5QY3fFGtCDq7kdGN9qbl
         I9SC32Dgws3cqaHWRG9GWuxDs4k63qpfO5WV/lC15gkDBt96UyvBUxb5xsH68vVXGARq
         rk9rATtL8Ebg5XRbUs/pnG9CFqVyJX5XnSwmn8LH7W86R8EnDfQ30HbATqF7r6rosT6B
         tSVA==
X-Forwarded-Encrypted: i=1; AL+hErEidjCtrEGVzv3Ggg3FOtSgfjqx7fGraSySsLVqbFLzxGIckEKVp0Ijkk9RbAdiXM7pMi9Ke5TPENEZUGq0@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ar1RCiwV5i0M857ZxmKA84wZB1s9gc3rv25NTa9ajbrsrxEQy
	3MDXxyU396/3gNtZ7jgn/CfDGvJqUKnnBFxk2txVZ+WsG/xgCdrES7F8qznklsfMk86RKxtD6a5
	IP7MR+fm05gL6zqPulmqFfh234hPDI/pq/shB3X/dVRHjwUkiTxFCcqOO+uc15llDxtN7
X-Gm-Gg: AZFdTZfUExdD5tU3ySwTt00scbyDMHDVkJP0K/v7eKjtXZNcexvXhLpGhFCWnl9QJZ6
	cZBO4nqWEDA3S+3wj3KZuqJ8J4KjS7JjmmiqjUoFnRfthIubvSNM2Wc1zQhDK484kbBfX9pEz86
	MQRdo9SZioZbxvRWSFy+oBh8ncEYPiFrI7621ys/UPtmb9HCqb9SYU/oSN8nKC99dJ0rZhVI1DT
	ZCttWlNQdyQBN5tlk0jrPkCqyXPGw6EHKc6/AObCbTN2nwsoa0HdjYusrlY3Bd44ipyEh03SxC0
	DtlQlQBV7RWJ9sF+JB2DejPdHgBK8cQZIZQcngl27JWgiC+lLhLlVvtBfcQkwSbXjOcBYO1/Ykm
	Vh3KtKCwYURJrfKDL1gXKDd2kOfiX7AX34sBTLFyWBVQum4c7obgLq1yN+qXzOwsDzh/eC1FWeX
	o8lT1uOLfwlHDXqFF0MGTTD+NlsQVmeGB4sboEXfs61TGHlWbtZvVGzq5pKOuWVeRVvhEATSkZu
	dQlINRtYhoV41ynaBYxy7tFk245
X-Received: by 2002:a05:690e:43d6:b0:67d:ad6e:f90b with SMTP id 956f58d0204a3-67df43d0911mr6289379d50.31.1795795917083;
        Fri, 27 Nov 2026 08:11:57 -0800 (PST)
X-Received: by 2002:a05:690e:43d6:b0:67d:ad6e:f90b with SMTP id 956f58d0204a3-67df43d0911mr6289363d50.31.1795795916435;
        Fri, 27 Nov 2026 08:11:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:11:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:51 +0100
Subject: [PATCH v3 1/8] media: qcom: camss: csid: Add an operation to read
 the SOF timestamp
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
Message-Id: <20261127-camss-hw-ts-v3-1-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX0wnf482oM85n
 lD8fCH3moIOxTVrgAOkGt0DlsblyOIozkIJDkXJaqT6p316bwxF0r6oxYfWxBxWqOaU8YfTE4vm
 8UwhugCj/Hazw6lj/tX865GDPi8ZFqE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX2CNUFBMHH0ly
 ogug5lym4o8oQ1BApK/eu8N/hiNLNsyil8kHeFcQLZbQ6Y9CFW656NaG6FI0ocgtAXx3z1oYczo
 feHpbBKINdGYSYJyg0G5B+rW0kFae0NPfCfJEzRCV7RDmscsKJmpCnjtYg6p1u4x3PVhPjmG25P
 65guksnMONRDt48ZVywUTZ6WkwvFw5pXqsqLq4cpOfW4UPaWRZm9ySvoj3ESnkaBUVQA87c4EJm
 STcFzAiKUU7b+iCdKgsbrt7xkgQbSHAjQolh1/dByZN9E2S/PqYY0Yw3pG5j5m8r/NjwJVvEaNd
 JXFLEA1eN3CWAdypeO/i/QcEzCTFuhgbCaHp2sCx6qBlR/h03OgFnPshCZwaibVSm2/LMcwj21F
 Ig8zwvErF1zhf8I/dAJjZzZO7Ce/15AbyS+Kf8lMonRiSv04agGKN8pZ3zNmm9R5Yqetf5zlq3l
 aB/qHcP5d5g6Ypf1Slg==
X-Proofpoint-ORIG-GUID: eDVtD3vf_cO5LF-oACrYLIVdV5uUXe0j
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09abcd cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=n8IlR8rfZ27013JM:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aSPAdgkBS_4Hla2pHDQA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eDVtD3vf_cO5LF-oACrYLIVdV5uUXe0j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

Modern CSID revisions latch the global timestamp counter at SOF. That
counter is the ARM architected counter, so correlating it with
CLOCK_MONOTONIC through ktime_get_snapshot_id() turns the latched value
into the time the frame actually started, rather than the time the
interrupt handler ran.

Add a hardware operation returning that counter value and do the
correlation in one place, leaving a CSID revision with nothing to do but
read its own registers. Keep the result for the frame being captured so
a consumer can pick it up the same way it already picks up the SOF
sequence number. Revisions not implementing the operation keep reporting
the time the SOF interrupt was handled.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 112 ++++++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h |  19 +++++
 2 files changed, 129 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec854ae5b78de9997b68c7a81d4207e1..436478fe1f65642ff11ae3707df726d619801a8d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -8,14 +8,17 @@
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
 #include <linux/clk.h>
+#include <linux/clocksource_ids.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/timekeeping.h>
 #include <media/media-entity.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
@@ -37,6 +40,16 @@
 
 #define LANE_CFG_BITWIDTH 4
 
+/*
+ * The CSID latches the global timestamp counter on SOF. That counter is
+ * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
+ */
+#define CSID_TIMESTAMP_WIDTH	56
+#define CSID_TIMESTAMP_MASK	GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
+#define CSID_TIMESTAMP_NS_MUL	10000	/* NSEC_PER_SEC / 19.2 MHz, reduced */
+#define CSID_TIMESTAMP_NS_DIV	192
+#define CSID_TIMESTAMP_MAX_AGE_NS	(2 * NSEC_PER_MSEC)
+
 #define MSM_CSID_NAME "msm_csid"
 
 const char * const csid_testgen_modes[] = {
@@ -779,9 +792,11 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (csid->phy.need_vc_update) {
-		/* Set to -1 as we want to do atomic_inc_return to read */
-		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+			/* Set to -1 as we want to do atomic_inc_return to read */
 			atomic_set(&csid->sof_seq[i], -1);
+			atomic64_set(&csid->sof_ts[i], 0);
+		}
 
 		csid->res->hw_ops->configure_stream(csid, enable);
 		csid->phy.need_vc_update = false;
@@ -1370,14 +1385,107 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
 }
 
+atomic64_t *csid_get_sof_ts(struct media_pad *pad)
+{
+	struct csid_device *csid;
+
+	if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
+		return NULL;
+
+	csid = v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->entity));
+	if (!csid->res->frame_sync_en)
+		return NULL;
+
+	return &csid->sof_ts[pad->index - MSM_CSID_PAD_FIRST_SRC];
+}
+
+static u64 csid_timestamp_to_ns(u64 ticks)
+{
+	return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
+}
+
+static u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 ticks)
+{
+	struct system_time_snapshot snap;
+	u64 delta, delta_ns, now;
+
+	ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
+
+	if (!snap.valid) {
+		dev_warn_once(csid->camss->dev,
+			      "CSID%u: Can't use hardware timestamp, no clock snapshot\n",
+			      csid->id);
+		return ktime_get_ns();
+	}
+
+	now = ktime_to_ns(snap.systime);
+
+	/*
+	 * Translating requires reading the counter the CSID latched from.
+	 * If timekeeping is driven by something else there is nothing to
+	 * correlate against, so report the time this event was handled.
+	 * Below CSID means clock-source ID.
+	 */
+	if (snap.cs_id != CSID_ARM_ARCH_COUNTER) {
+		dev_warn_once(csid->camss->dev,
+			      "CSID%u: Can't use hardware timestamp, invalid clock source (%d)\n",
+			      csid->id, snap.cs_id);
+		return now;
+	}
+
+	/* How long ago, in counter ticks, the timestamp was latched */
+	delta = (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
+	delta_ns = csid_timestamp_to_ns(delta);
+
+	/* Fall back rather than reporting a nonsensical timestamp */
+	if (delta_ns > now) {
+		dev_warn_once(csid->camss->dev,
+			      "CSID%u: SOF timestamp predates CLOCK_MONOTONIC, ignoring\n",
+			      csid->id);
+		return now;
+	}
+
+	if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
+		dev_warn_ratelimited(csid->camss->dev,
+				     "CSID%u: Too slow! SOF timestamp is %llu us old\n",
+				     csid->id, delta_ns / NSEC_PER_USEC);
+
+	return now - delta_ns;
+}
+
+static u64 csid_hw_sof_ts(struct csid_device *csid, unsigned int id)
+{
+	const struct csid_hw_ops *hw_ops = csid->res->hw_ops;
+	u64 ticks;
+
+	if (!hw_ops->sof_ts)
+		return ktime_get_ns();
+
+	ticks = hw_ops->sof_ts(csid, id);
+
+	/*
+	 * For double-buffered CSID registers, the CSID configuration is
+	 * only latched on the first SOF, so no timestamp is captured for
+	 * that first SOF.
+	 */
+	if (!ticks && atomic_read(&csid->sof_seq[id]) == -1)
+		return ktime_get_ns();
+
+	return csid_timestamp_to_monotonic(csid, ticks);
+}
+
 void csid_sof_event(struct csid_device *csid, unsigned int id)
 {
+	/* Read before the sequence number below, which arms the first SOF */
+	u64 ts = csid_hw_sof_ts(csid, id);
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 		.u.frame_sync.frame_sequence =
 			atomic_inc_return(&csid->sof_seq[id]),
 	};
 
+	atomic64_set(&csid->sof_ts[id], ts);
+
 	if (atomic_read(&csid->frame_sync_users))
 		v4l2_event_queue(csid->subdev.devnode, &event);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index ccafdbf3a9fe0c282da68ccdd04661b3fab81ff5..f7c0935ea25cee5ac87cca470803a7391c12f9f0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -111,6 +111,15 @@ struct csid_hw_ops {
 	 */
 	int (*reset)(struct csid_device *csid);
 
+	/*
+	 * sof_ts - Read the counter value the hardware latched at SOF
+	 * @csid: CSID device
+	 * @id: CSID src-stream ID
+	 *
+	 * Return the raw counter value of the most recent SOF
+	 */
+	u64 (*sof_ts)(struct csid_device *csid, unsigned int id);
+
 	/*
 	 * src_pad_code - Pick an output/src format based on the input/sink format
 	 * @csid: CSID device
@@ -179,6 +188,7 @@ struct csid_device {
 	const struct csid_subdev_resources *res;
 	atomic_t frame_sync_users;
 	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
+	atomic64_t sof_ts[MSM_CSID_MAX_SRC_STREAMS];
 };
 
 struct camss_subdev_resources;
@@ -279,4 +289,13 @@ void csid_sof_event(struct csid_device *csid, unsigned int id);
  */
 atomic_t *csid_get_sof_seq(struct media_pad *pad);
 
+/*
+ * csid_get_sof_ts - Get a pointer to the SOF timestamp variable.
+ * @pad: Remote pad of a consumer's sink pad
+ *
+ * Return the timestamp or NULL if @pad isn't a CSID or the CSID doesn't support
+ * SOF tracking. It reads as 0 until the first SOF of the stream.
+ */
+atomic64_t *csid_get_sof_ts(struct media_pad *pad);
+
 #endif /* QC_MSM_CAMSS_CSID_H */

-- 
2.34.1

