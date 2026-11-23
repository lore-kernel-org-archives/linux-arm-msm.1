Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415317;
	b=FpXk4IKB12pxwaLkIaNIhRwQm5wD7UESspQrUbt9HUB7EYrh2YJrt3e0R4+UCtEGNJNQ
	 vqgGQ++QYIbEhjTWsiSX3kokQQ9e7FifoESd27ixBKY8yWUbUGO6VBKQb6jnAfxEXyyjO
	 OZ9Up5G/s1crIo+BDBZ8tH9tMCbowjjyerEYJz9xO6Oe50TyCm/+owlWXoeRwk4Mo7YBS
	 tnhQT15uno0CLd11C3Kx5jQikC+cT9VBRttOHLl9vg7rIQtCvDM4FPWHKNYeulLQADW/d
	 1T/lUXFnIOw2ArpXlQt3FUubqp/XVAMX28WKV6G0FShyNQp4pRpTFEgdWkgjwHdoSBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7jE14HdSGUxu+kNCgz8YCByS2YjxAG/unxVTFjowcmo=;
	b=e+VKIwyaHZ5V5JCSyK22z+eIJgBhCKtvrMB0jB1HZEUwOmiu5GrK8rwjSZADbCw5EW08
	 s5aGXI+do0+cU5X4btFyan64w0weNKeNT+rzGZ7V69iQ9MIr2OHvakahxx14DKhKyi+zV
	 c5y/h5FpsGWR3dBZb4uGuK0xRZ3OPyzXeYwWsb8Y+M7ufm8Rhu5mkvBe7sQgQT423zyKU
	 BuBd3V8H4qSf8hiSPhUPh3yvbLnK+vsbhl+iITRQU6qRrQI68aBorX/qfr35HOXs47Vb1
	 t+TSgit/GXxRR8JQ2aQ9520Na7heDEJuu7zt5MoLxk7Vbhi5D4X0ZP5I+B6jOEC2XEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hm9ZovAq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KGp2X6d5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944CC606A334
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944CC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hm9ZovAq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KGp2X6d5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN6PSjP3712943
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jE14HdSGUxu+kNCgz8YCByS2YjxAG/unxVTFjowcmo=; b=Hm9ZovAq/ieEPtL5
	SmzBAIDzw90zsmsdJjDNC7NMZzqg36hQkHgfI0chlmuHzMydev3InfEATmvLJQZP
	4caBimnxm2c2ZjdOahFQ1xc/VK/ygZAVntLiSq756PBE3R72PL5wazFCI5hEmTTM
	W7UXIsvjR9f4nWvxC27KgH/V/S+GP7iN7qWSSKzUeG4ZzBNZEaWEa8m2XBG3pcGr
	wu05SP1M5SnAYgKJ6lgA7bO1xXisxiJT4b3wLOvDx57enc0anMcnsUVQR5HvxGzO
	2rqExpD3YyLMIxmrr0fuxucgSjVwsLuDBpBykwKJEVIscMl2PqRHzzVORUwGulXj
	gg66oA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g7400ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:28:35 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8615cc92488so2495888a34.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 22:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795415315; x=1796020115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jE14HdSGUxu+kNCgz8YCByS2YjxAG/unxVTFjowcmo=;
        b=KGp2X6d5nHvUlmS0s8+abOhN02YZxjsb+w0UH4pye1OSlcrFimgsBJj2ShBAD5Ra+b
         jhO9wKR2r7KtdJaj+aIoGQISJmGPAvNvj4tVUjrS2GFfUhcHZk0Svzg/xUr3EFhdzwBR
         sib69Ydf5eriPP2Gsmdh9ubLbc9Hx2qfjBjZtfeLqL1JuqbN1BcrR6DByPvFXbP4QKxv
         a4VFw2aTG1FYWkUustnvbMGmzN/lT+TxIcYBs/CwuSGR2UbEFulAWgfuEb09vUXVcEKn
         /s6afaFBq2XlK4jUzM2qChOHbioIIM0nNEQxNaJNvWBJoWhCHJLKO3C+0nIfPuQsdoPz
         9QXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415315; x=1796020115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jE14HdSGUxu+kNCgz8YCByS2YjxAG/unxVTFjowcmo=;
        b=Gg+PSAGUwS+mNcpjGKXYN4Mope12aMJfxdQsuD43MwkPLSQEo74i0SgHER71KFDUIY
         39mKbaaZSFEJlvQ2mOTbwP5MFATjNawKdWQ59iMAqEohuUw3nwQPaiq6yw/IjYbmsHbh
         HotzEwEGulgLOJIyPnbpAWIf5b3a2dTWx8twogDqisPNUiZUuA0HROM2/1s++ZW/y7kf
         86MKPnrvk802Alt6etB8wLDAySLxFwuurcRJfH1jMXCgVc6cMBE2m6v+ZGZxHnYwfaaX
         XsmqJJp5XhQGgdZJFEO9DPUG/v3LK4PiqALQ9x8IjuqrSBiNI/FOi3iHSkO9rW14G1EL
         p5cQ==
X-Gm-Message-State: APuU4Z8TiP2K4Smab1zphBZr9G6P6kwQmX1nA/r3LkdF96osla0ijprg
	Cgx86FyktCc0WN6NqQwemqNjQaHjU6qcYnwe380tZpADk10F1paIPt7RAjK7jBft6j7OgKhnofC
	Sl3NdQdU9iR3wMVc1DqQSDub2T8940un5G39C9BruN+Mr9raPFnG4xQjV7F6QFyiWUV1G
X-Gm-Gg: AZFdTZeXkwxt2gNJ7ZYa04PHCYM/i/WzXDm74abZ7RcFSgqimtWWUb4fiRM7xFaRRDB
	3PxFEOPYIzsw1VdCSsoDsk3XEtOUyjyfMldPM5VBsvfWY9WC/y5zTzoICWdlYyCoL+RS58sDMPi
	GvFuNeDJQObCVRNoWTDg+QRLRfEQIvjFtAYFilIB2YUnOa3iEwsZIeOjpruem8N3gxelyHWcExd
	fsl3fLKwcwc03LP2WxDQQh4Sh3JiDoOvjctP4aKhrCPigPYcG6jJ6yRMyzRWY3WzUPKudo3enzI
	MvrtWgU1XZKGcYmbcxfIBV1G3nWor2A9+XbXdPQQYnhoYLgb1bfqsChI5Fy15ek0kos21nqQx5H
	5rzy3FVr3XXvRTvR+KzZIzNnnIZhrXZ/yg9ka3fPwRkP3D0nWB3ZwMuuOAV1fEbamSTk8lbqnT6
	d7cjy6aPK7k8OPY7bFTMfAVhIsAA==
X-Received: by 2002:a05:6808:4f09:b0:4b9:a8ac:479 with SMTP id 5614622812f47-57a0a517207mr11469721b6e.23.1795415314934;
        Sun, 22 Nov 2026 22:28:34 -0800 (PST)
X-Received: by 2002:a05:6808:4f09:b0:4b9:a8ac:479 with SMTP id 5614622812f47-57a0a517207mr11469693b6e.23.1795415314442;
        Sun, 22 Nov 2026 22:28:34 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8762533b6e.17.2026.11.22.22.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:28:34 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 22:28:07 -0800
Subject: [PATCH v2 1/4] leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak
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
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-1-2e885f60fbeb@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795415310; l=4509;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=qdbu+eG7Y65JRKBsJusLOMxB0Z1QznzOHG3Z+dDHywo=;
 b=qGZNnnmUF82PoseQ1K+NRaghLNnQ6Ot66Eycw9RdO1AUhm6Za3EsVf4ZEIt4i2t/V1sTrevy+
 oP8YUK2hs2BB+60P70UdHk5pqMu9lynzegX1DLViy4tIj8J7lBEnnGX
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: 2HfzT38F5ICy1iLIMC4cQKuaalMn-pb7
X-Proofpoint-ORIG-GUID: 2HfzT38F5ICy1iLIMC4cQKuaalMn-pb7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX/KT4BQmeUnAR
 tlhNa7Mss4wtoi8/mX+8IxWJu21SY2NS3PlT2Za/iDJJeglQxGzOgLcMPQn4k1DVoB3n0tzHOXh
 Z6DEikJPu+/UMXmYcXE/vumtv1LWy1c=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b03dd13 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MAa_CHwBwOMXYDkmoIMA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX4oMWw3zGvvnq
 vGR4LDK3Y23EfyjTDRTD627HoEeeGXG3efcdczHDRAgpzXhSo96n16F065UGsoeDHKRbUb+J5l3
 4aWA+u67feZsSlEmic9dJGtrDfpse59uho/1XcIDn8YSzUAlnAJosqZyZ9b6bpvlxsutKY3rvsf
 ZMuZFv6irYVUbKRf2WfZnHhsgB+wdWkIjIYXGC1SmFFFaNdF6S9IfiwJVuCptCBPW/R3pF+mPri
 p8rSFrvrYt/wcT7hR4abU7aFBjdIOhFFqoBM2CRuMS/a4T8RjvsphrlXAQ9rq+jmKF9JQLr5ooW
 ffw+X70serlMOi6ycONpnYJkivZex06aKryt+TOS5lXF1zWGCG+MOUnfgQpDDgazQK7CcCLsGFX
 F5WXDrINpDgxAldxq+wYUaZQVXj1hQlmaxeSu3rP4TnGuCsg8z6g6KicDNqo1dBN7/rrqYMJjt/
 8rVk+0CLbgVHRi61ABg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230025

The LUT resource cleanup path currently treats identical high and
low indices as an unallocated range and skips clearing the bitmap
allocation. However, with a 2-step palindrome pattern, the high
and low indices are identical, which can leak the LUT resource
because the bitmap allocation remains uncleared.

Resolve this by tracking whether each channel uses a LUT separately
from the index range. Mark every channel using the shared allocation,
release the bitmap allocation once through the first channel, and clear
the LUT state for all channels during cleanup.

Fixes: 24e2d05d1b689 ("leds: Add driver for Qualcomm LPG")
Closes: https://lore.kernel.org/linux-leds/7e474cdf-fcb2-468d-844d-f8afb5976d16@oss.qualcomm.com/
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 24ffe079f221..5d0d015d67e7 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -111,6 +111,7 @@ struct lpg_data;
  * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
  * @pattern_lo_idx: start index of associated pattern
  * @pattern_hi_idx: last index of associated pattern
+ * @has_lut: channel uses the associated LUT allocation
  */
 struct lpg_channel {
 	struct lpg *lpg;
@@ -147,6 +148,7 @@ struct lpg_channel {
 
 	unsigned int pattern_lo_idx;
 	unsigned int pattern_hi_idx;
+	bool has_lut;
 };
 
 /**
@@ -393,15 +395,19 @@ static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
 	return 0;
 }
 
-static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int hi_idx)
+static void lpg_lut_free(struct lpg_channel *chan)
 {
+	struct lpg *lpg = chan->lpg;
 	int len;
 
-	len = hi_idx - lo_idx + 1;
-	if (len == 1)
-		return;
+	if (chan->has_lut) {
+		len = chan->pattern_hi_idx - chan->pattern_lo_idx + 1;
+		bitmap_clear(lpg->lut_bitmap, chan->pattern_lo_idx, len);
+	}
 
-	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
+	chan->pattern_lo_idx = 0;
+	chan->pattern_hi_idx = 0;
+	chan->has_lut = false;
 }
 
 static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
@@ -624,7 +630,7 @@ static void lpg_sdam_apply_lut_control(struct lpg_channel *chan)
 	unsigned int hi_pause, lo_pause;
 	struct lpg *lpg = chan->lpg;
 
-	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
+	if (!chan->ramp_enabled || !chan->has_lut)
 		return;
 
 	hi_pause = DIV_ROUND_UP(chan->ramp_hi_pause_ms, chan->ramp_tick_ms);
@@ -668,7 +674,7 @@ static void lpg_apply_lut_control(struct lpg_channel *chan)
 	unsigned int hi_idx = chan->pattern_hi_idx;
 	u16 step = chan->ramp_tick_ms;
 
-	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
+	if (!chan->ramp_enabled || !chan->has_lut)
 		return;
 
 	hi_pause = DIV_ROUND_UP(chan->ramp_hi_pause_ms, step);
@@ -709,7 +715,7 @@ static void lpg_apply_control(struct lpg_channel *chan)
 	if (chan->enabled)
 		ctrl |= LPG_ENABLE_CONTROL_OUTPUT;
 
-	if (chan->pattern_lo_idx != chan->pattern_hi_idx)
+	if (chan->has_lut)
 		ctrl |= LPG_ENABLE_CONTROL_RAMP_GEN;
 	else
 		ctrl |= LPG_ENABLE_CONTROL_SRC_PWM;
@@ -818,7 +824,7 @@ static void lpg_brightness_set(struct lpg_led *led, struct led_classdev *cdev,
 		if (brightness == LED_OFF) {
 			chan->enabled = false;
 			chan->ramp_enabled = false;
-		} else if (chan->pattern_lo_idx != chan->pattern_hi_idx) {
+		} else if (chan->has_lut) {
 			lpg_calc_freq(chan, NSEC_PER_MSEC);
 			lpg_sdam_configure_triggers(chan, 1);
 
@@ -1118,6 +1124,7 @@ static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *led_pattern,
 
 		chan->pattern_lo_idx = lo_idx;
 		chan->pattern_hi_idx = hi_idx;
+		chan->has_lut = true;
 	}
 
 out_unlock:
@@ -1176,7 +1183,7 @@ static int lpg_pattern_clear(struct lpg_led *led)
 	mutex_lock(&lpg->lock);
 
 	chan = led->channels[0];
-	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
+	lpg_lut_free(chan);
 
 	for (i = 0; i < led->num_channels; i++) {
 		chan = led->channels[i];
@@ -1184,6 +1191,7 @@ static int lpg_pattern_clear(struct lpg_led *led)
 		lpg_clear_pbs_trigger(chan->lpg, chan->lut_mask);
 		chan->pattern_lo_idx = 0;
 		chan->pattern_hi_idx = 0;
+		chan->has_lut = false;
 	}
 
 	mutex_unlock(&lpg->lock);

-- 
2.43.0

