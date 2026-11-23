Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454219;
	b=Zb5GqJ/TRFD1jvNiCHayG/+CxlEsTht6al4O1E7y8o+8vB8fpTuBLI0VSGnSEWrFqChb
	 85KsepnlZaphNibPoqYLfnY2ulUSz2X1+zjZnIlU++1y0eB54tnGu3nUNjETMoBSDCjCK
	 6N6xUCJLHUshnte0WHZhkYWrYRplqv4HQg56CBB+Gmzv8vB2rfTbTj25VJ3bskIV9DIyR
	 Twjc+E4tUO23oYO4FmrCtkYPN42Ii1h6EF63Xra1geV8SsiTi2ZeKDfvvkbYI631w22YY
	 pBsWQNNSYa9dl0ldyYq1PQ6uq0KkOLt970WJ2lAq/aey0QrR64HemA6QO9UlMGoH1Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454219;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=;
	b=vCvhMLJccOymKYhLz1m+rPIt6TvS2/RGfL4jcm3/NEmvOEPxLvIJR9A7mayoPkz+i9Iy
	 VBS0ZTSxZEF6DwMp1pc+k6XuMN5x/tlnONvYV1HTqQfX+QN/fpmnGL0P/JEojnn2yGlcP
	 yxVDzvR4Dr5085P27tApyxfZnRHQTWJovrTGDaw1RoRMTS7N7oNR2T5d8Rc/Bk2ss8Q9l
	 1Zy3rkC/YNb/oXeTIcg8eKQ2yNQimo2KJJbjxfDf2HZCr9ngp/GwxC1tSJz0Du9mwGyH4
	 vrI9CYGJVvgTyIgYbbco09pGSZFrFZizHt+aYY/ORrBwHuNL8tHI38XNf3sc6QqHcwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G7W/sysy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=blDthgvP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B75B60A2607
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B75B60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G7W/sysy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=blDthgvP
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGkkE3025226
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=; b=G7W/sysy5QqXs5Pq
	CaLhW1/Blz687mycCaPbDHVxLSvWM06H80aUr4zkulSPqC/wzlqvSuCDSUmv2bPu
	uTd0Q64+cvOqAO/j9a8HQnsRuRS6R3PA24N0HULf7nGKT9IFpjnkKccRaTU98q+b
	jKJTY7KWflQQMk8WBZ7F7Bk/KvP5+MluOK5nyQxaFjcBS4QPT76DGCVdiXxqnkHC
	a6ln8WZS7Uozj29nRoIJFFG7TTCDio1ADrw3kdI6fCLK/xr5yz5j9FJPdfzktkLg
	TEJhbYYQ2wbLXHs9UvMUFQub+XpfZ2e5uzjX2/mJ6ck/A5/JNgzmKOqkDZbNT9Fe
	G874ng==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pajmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:58 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ee30bf935eso676464e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454217; x=1796059017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=;
        b=blDthgvP9zSQ1nV2JsakV/P1W0kIUqDUIiJxKTsOKfHfX4JOC+NbpgTsv4SdfqtiPT
         6cGkow2XVNwgHOUKD3tymqB7oRMnBNN6ewX1EY4zmF9AVGPOTXIh+eMhdgAaW2Ud3p1A
         oy9XCtDt5ZfTrTpqB09T0bsB2/7EebWAvb+Hb3CgIahCVyQNO5Xt4+w1tWQKBzsKlC4q
         gt9IWyGC6+UP+p3mnaSTrrg3QmQkO1OLbobEamD5RiDNGyxHpIM4DwDISUcsRY4SdL0y
         DN9S6+RRzeBq4fAZfMHUe27MnHRvE5UpHx8XGscytQojJ+2dXHMkc3B+nNWa7ksACsfK
         dlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454217; x=1796059017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mjuo6IAJB5tBLuH8vn7JpFFUdNExOKWH23AcZtfFr/o=;
        b=yj9khgwTGx1/5bTX75wnZNa4e3Uf0udTKcRNH2SogcjcFXLR4tXg5m5nZVPwpuCE5D
         4k79NS10I+axbQyJVurxyzxFKZkWTUaok6+PwbFfq2Sj5sZJFEWJjSUdPqljtZDm1QLV
         e9ADk6WX/mkmx1wEvunG3wzepELbwlvkq3DJkCkNOXYPys1G6NQLbnC8apwOTgSeSbaI
         uX7Xvzyz+2P+7IybFw4/8SBBxoaDEe22R2hME/MaTV5UNprsp14JxhdOlBfxfAz7sa94
         dmO24FBMfA/oUTVrpE2AXUWTVN1fi9Fd4KXcCcdr0mmreVX50oBoICVu8RiSfmvAl+3n
         3szw==
X-Forwarded-Encrypted: i=1; AL+hErEEvgeGp0lUtuBXrMZmmw2LDgJyLsJdVGhScTlxQcUVbFwbnfl8cr/v3I42uuv6J4nd92YgZS8F9gRtEVMO@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dh8pkEZmPEilgAsF624E1ixUQbEOSe13nPvQ/+9ZupOrdBw/M
	K0Yb7iFS58R3D9Q90sdn0DBw95gwUpfvz7DUy7BMhcs0ZPuRMqT/tvYOCzd3/WpBiPDmcXNjsC5
	ReLpCgx8LuU+T7svm+/cHdv7q553UJ0G4tI9Elx1CKObYFJZLY+rNFQ5pHGIXZV40kCNh
X-Gm-Gg: AZFdTZfiodyZmjdShxL2Z00WW/fUyU96QvaWiqsNkqP4ABH19OG/L5MkPts3+TJ5IdI
	1ap3aSJJmGp9uqBnzxK+x/F7Uq7JNKweDKR7cYRBMUeI1KGe8GziAVDcHEIypu9gzBf5Vw62T2B
	eELgFm02ogwglpHv5YMDA5m3oYtJGFtFULjcCzMP0uk8DyywNBMw0p/g0mDJAkoCzu3j9VY+EaR
	aUpjf0qAxXsJIt3J5YcR8P9VazP1c6pdYK4s6463ZbU96GhfY0CfVkpAzPFlA26eS4ZtSceu9O/
	XtI1jLm2NIGb/XRzrTZCrG72dnURvplgybl5dok1FlKQb+Ni2r1ZmyuiKoN6a4Kz+Fmr/Vjr68V
	/DuONr/wTgFawC/CrAlatXIJ6ZnBUoLgGaAZaILy8C68qRMlrCUu21ZYZEFpJai5ybprFmlIRlj
	/Jx0IqxJuSsqDPR53ny/CN2BN4aQeWCp23aVWFISffZW2rzSsUK2yAB5H6cJZR3Rn6idPlz+OXY
	5io/tvZMK+sFA==
X-Received: by 2002:a05:6122:130a:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ee8af25ffdmr5612724e0c.14.1795454216984;
        Mon, 23 Nov 2026 09:16:56 -0800 (PST)
X-Received: by 2002:a05:6122:130a:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5ee8af25ffdmr5612646e0c.14.1795454216357;
        Mon, 23 Nov 2026 09:16:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:55 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:51 +0100
Subject: [PATCH 5/6] media: camss: csid-gen2: Report the hardware SOF
 timestamp
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
Message-Id: <20261123-camss-hw-ts-v1-5-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: lrxF0CQW_9wq2_K2PtFvZhj9Zt4r3b2C
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b04750a cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX2X6yQxeQt0rO
 mzzd476MJf72yJcXRMSZF4/BNcqr26THe0B7abQchXsLfZQNEIxrVRu0krTWdn6hP4D00fyLJGY
 VAQmle/+bXpZqaarC/+zx3GCfPZlF0M=
X-Proofpoint-ORIG-GUID: lrxF0CQW_9wq2_K2PtFvZhj9Zt4r3b2C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX8Voncn3lNnUj
 hbzQmjRcn1ILS1K0DIwhBfXVF8v5kgImP9KfIWW4L4CUhiZC9K9FlBNCd3i34rSD1Th+S/8ycvq
 1n6HBtKUxlaUx5eYGq0D+eCaYIDd75v/aWsCHSnRp3K/iA0pFBMqoHJTly+1LytSfJjGZlaz4Dc
 3dpQGLxf8Iu1U2fZ6MQ6Xqhy0WXhoDuf6kRyAT4Pu/INAbfnJbo+/N3sF19q4SuYxTLU772np4e
 XXJKwaLhZ/F6WJMgumI515f/fxwP4vPCJic/UoZjmvMpu/vNEcxO2g4uYgZTSQCqRjGs4GJPZ2r
 MV9c0poO4mbEqHcbWXpfbv4rEr0KNvJS4V+BOfwioHEwYZcI5lapONf0dlctm1OZXrlXpSBYfqF
 /ginrtWXfB7K70IOAEdrV9tLnPrd3uVlY/VwnjHOQfnIcHJQ+Woik5kjFnP7WGGaMtTTcqha7kh
 1oOqcSuUQ+XcOq+oNaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The CSID latches a free-running timer value for every RDI at
start-of-frame, a timer that keeps running across system suspend. The
driver already enables that latching, it just never reads the result,
leaving the frame sync event to be timestamped when the interrupt
handler gets around to queueing it.

Read the CURRENT_SOF pair instead and hand it to
csid_timestamp_to_monotonic(), which puts it on the CLOCK_MONOTONIC
timebase the event carries. CURRENT_EOF and the PREVIOUS_* pairs are
left alone, following the reference Qualcomm Camx code which only
interacts with CURRENT_SOF.

Upstream CAMSS uses a fixed mapping of RDI to virtual channel, hence
VC0 => RDI0 and VC1 => RDI1, so the event id indexes the register block
directly.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index ac085ede704653a532aa1ab77b2845471d1e6900..a2da70d5533314816fdacfb8b07248860d243b58 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -376,6 +376,20 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
+static u64 __csid_sof_timestamp(struct csid_device *csid, u8 rdi)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR0_SOF(rdi));
+	hi = readl_relaxed(csid->base + CSID_RDI_TIMESTAMP_CURR1_SOF(rdi));
+
+	return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
+}
+
 /*
  * csid_isr - CSID module interrupt service routine
  * @irq: Interrupt line
@@ -403,7 +417,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 			val = readl_relaxed(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
 			if (val & RDIN_IRQ_INFO_INPUT_SOF)
-				csid_sof_event(csid, i, 0);
+				csid_sof_event(csid, i, __csid_sof_timestamp(csid, i));
 		}
 
 	val = 1 << IRQ_CMD_CLEAR;

-- 
2.34.1

