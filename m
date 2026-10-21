Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573087;
	b=S1emLzlFOo8o5reQY87RyUigOlQqAmDpJ9bZvZx0GGQN8NrZl9jTiStGATDdcOOyRgga
	 E9b8vQFRbd0ScB80f3opAVJ5he1E2HWopaDk8GoTMrbAmb3ghybt4a7i+VUowSR3T3Bg3
	 xvRlA9VCua2rvY2aeLIHV/uwD9emLQG96f9uExNc1gUbMkV0HMkKdzmwgOyL5gQt2RSXQ
	 hckodIbRJgbAICJJ2DxmoFT/p0AVfssNdirFdApeq+ISxAbI8MhCff7nWNERb5krbNTzn
	 GVXeBfwomEp4ZaJKzomtu9Bh0/VRQvZ5jFAvtUHwDs3xVik6d3ut4cRXiQyOevZeUAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573087;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8ZFiJaYV0wG6Mf8urSzwz9QKuDKvIUO3FJOEVgQm81M=;
	b=BPW9GDHAK0tHbwJirpLLyg5YRwTjPtFw7EdPVpqhTbR8UD7d4KNUSurOpxxNFzeplg4B
	 j4slKgjnjdWfL+WCoHeP+iNvz0SixPx/EFX6QfkEmbqZrRd2IPQ1psF7MqNQdVsDqUZ9p
	 0P/1Hqaovtkc2fMGzOdPfJZNQO/Qwp/MUtfnz5lEMq1sJ+iGfdNvvjCusIawBUrKnuy1U
	 QurxNahBhpTR4o+n/dTF6R2+bH688pxxYD+q8l0FIHLRtJNX58DJYJstHL2T+juo3H4H5
	 8s1Fo9Dy0r9HaGwAuuQN72GVGJz1g9/G4w9JQhhyKgk2zrTLfbYXUpQ3Ri1Rng8JdEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoR3xyfE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QIOhHQAg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806DA606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 806DA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CoR3xyfE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QIOhHQAg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L88mPk571708
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8ZFiJaYV0wG6Mf8urSzwz9QKuDKvIUO3FJO
	EVgQm81M=; b=CoR3xyfEu/ZkX8lBFWZsJc1CI1EhZQ9n1eGN2bLpbYsmOOso8mk
	TRtxnonqfH5tAsozA+q7oP52VLzCz/x1MSGscPLd91EeIJq5D0xz4+uxhz5EdITK
	ZeMCHK8f4/mLKOhzbsDEa6kymlWDAnsgbpORkACvj+6AjlKOhwd4hKy0Ee7dy/Br
	5HOMreQMKqx9d9+nhGhjkSX77JsTC30hM/lcAfELw0KszxdeDPBEprLcDmAKU11N
	4d0d+r4huzDHGXnT4QChxCQFdMOnlvjElkvhgR/6xLkCqwbDuQmbaGpNAu7qzD0Q
	tnm6CTmybe+c7BY53S6AuixLwsuGwdpIBZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajk4j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:58:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so52744585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573084; x=1793177884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ZFiJaYV0wG6Mf8urSzwz9QKuDKvIUO3FJOEVgQm81M=;
        b=QIOhHQAgxbCIxhBeRhmevsUcUS0QRYXsHUxwXJxE6Wpy7JIOG1hQqVTW2td/eBz+OL
         NBNd3IZmgkIsxkUEhsv991WUbSoMjbi30rkBsHjkB+pRl2tlOfWb7jPdPPGOL5wMefN1
         HvHk4xUBpcSoLPiv0bPWJrV/qYUHm96CZLA8Z4xpaqWkm04+tt0THWxLAjQiBAnPHHgD
         PrR4uj3AHRh5yFNoNGADvOffAr+K5UYGUkCUsjRFWz9tcNqKh+LDxOPyBau2pW5OsKjU
         kV5Q+6s/QW4Ax6osHOhTtAtRGEm7ck6FKw/9M2XCJHLfKkrNdqRNtNs5qIKif4sXiFK5
         /ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573084; x=1793177884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZFiJaYV0wG6Mf8urSzwz9QKuDKvIUO3FJOEVgQm81M=;
        b=DBiycV15XXGvTqMihZZfi0Hzf25bDlOImaXqKSPgHWtHHPnUqG4ZngYaIqTTGW2KIN
         qlCXIxQ45+9myxkPE1dq36bE80Ya2WYal4uHiLr2URM+j5kMpHQziM6WWNGmSFWg19i3
         GZkVZXayG3rk/QR9Cue/91bo9nJh1teHSaxgdHvndbBedawEeCmqXmksS2P8kho1+FIz
         1FfytnTazHREkqtrZDSM77xSbnvKWxMTz4BCHe/Nf3kAzwNO8p+oq0oFF9IlALCDu/6Z
         +TDbHq2wCslDEnAuaX3JFbYQHUowsijgkzrD4Cr86ZjHltZOw2wI6IUu3PxWG7VcmDvn
         DVvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA4UEFAo+6JIm2yJhRDHN2yd3IuqWlV+/NBba4dgHaBf/OjyQeiIzQ3XDfjhmwf4Q7JnzSx9Bmrhxzzb7p@vger.kernel.org
X-Gm-Message-State: AFq9FYJUb6b2hUXDx6aeRGtVvEBOwixNJiSDtWXJI8gz10jc/UT6adcK
	dToXsQumlqVxjiXuI2VQVXOepGRoBhYHDHXcM52SXFrGEZEqkiH9NUEcwzugxXklclMGor5Ul0a
	Jc44qbl+PX8RDPOVwr/wrRuUAN7/ovgG8LuG6gJ+bqQjRMHsd0i64rBlzmO+059/9Zjg4
X-Gm-Gg: AYBFou0nZ52oSNRobG5ZjNKYwDyJeY271b3v9+Wo74R07Qiv0p3bN/BzgjAd9Lk94y8
	9LK+ZOPdTdK6JiUy4E3kEg6rSNSmkGgXxTsa2kN5YzUZQXA+Q/tldujp2Sse+8wQ4V8O0drgVQU
	MF6jhbvQMKc5oXUjqARE/pv0UrMSCcgaBzJuLRHAPjj+96tuBDUJpu1Jrasl1yk/dtEPyGPLZfd
	a0W/NOcj/k6FxZNc7AVsiPfaHhyq4djykJ1idOWZoFI+8FRLLtgOXHw+UrYvoPCdXCT6Br7SJyZ
	dT2XzyT9c+FJM2vGVA45sPACTwYVYXjsxl6zlSeOTS8y0c5DBimmYwYMLivXcyem5G003KOegcj
	iaaffhztShBPfv0p7sn+NQqqxog==
X-Received: by 2002:a05:620a:17ac:b0:93f:2cf4:e6dd with SMTP id af79cd13be357-93f57f935abmr306339885a.51.1792573084547;
        Wed, 21 Oct 2026 01:58:04 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:93f:2cf4:e6dd with SMTP id af79cd13be357-93f57f935abmr306336985a.51.1792573084055;
        Wed, 21 Oct 2026 01:58:04 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8d9e:b00d:491:1503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258424bcsm4058401f8f.55.2026.10.21.01.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:58:02 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com
Cc: andersson@kernel.org, Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER),
        linux-arm-msm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] thermal/drivers/qcom/tsens: Release parent resources on probe failure
Date: Wed, 21 Oct 2026 10:57:46 +0200
Message-ID: <20261021085749.3786101-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfXwYMrfVazpyDr
 vbnOwKo9SH/FhYwKwTXc4viDfiCpZ3OdxDUE3jo3L+V7HRT50p3ATkIlX3XDfc4bp4cgs9s+2gU
 QsLETFxABi1/DtQMzsWUI3CwC8uB10H8Un7Zx3Youg+Okt6TBGhHwkjKs4Ih7E4xD8R3QH/97+N
 /VLynyAfTclCirSJNDDP5i4OVhYn5d3G/hdD1d6/hQmwDwUTrEqs+EFLzOGzpAKE+W80/8Nu/JP
 kvzbXYBuECuNfVJ7ZjP+NJbXW9cq6w+TaW00iW9O/j5ElRYuLrLMgpdA2qY6tHyJBxCEn3QYZ/Y
 A8Vw4AZqm6SeKIxDiWiA4PFjrcxrcmNtWKQyj6x7fueZ5BOBw1GxkCFCLnH9yR5QiiUpvdlMWoN
 8S8CoqvHYCZWMmSip8aKsrETe+3YA//w9Di+qxdyDvRRpQSeoEhQ3OEly54p7fV2uy0JEvEbUPK
 pF8oC9cZKVYXHpIG5jg==
X-Proofpoint-GUID: mSJWAdR_yZon3emFb_xGO3fiZiVaY8Py
X-Proofpoint-ORIG-GUID: mSJWAdR_yZon3emFb_xGO3fiZiVaY8Py
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX8JXa/TduTv7p
 6l01NmH6txc8ffS2FYwKITzl8x7pY+h3NS1YXBR2a91/KdzHXTk551v5hWmvh9TKjvG7zCtjxgV
 32IEfSdmZm9q5C3iNC8Y++2/7Vlf0uE=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87e9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8
 a=uMi6mabLCCkMMC-zsVUA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210035

On legacy MSM8960/APQ8064 device trees without a separate TSENS child
node, the Global Clock Controller (GCC) driver creates a qcom-tsens
platform device without an OF node. TSENS consequently uses the parent
device for firmware lookups and managed resource allocations.

If probing fails, including calibration returning -EPROBE_DEFER, the
driver core releases only the child device's managed resources.
Allocations attached to the parent remain, accumulating across repeated
probe attempts.

Wrap the parent-bound allocations in a devres group and register a
cleanup action on the TSENS child. This releases the resources on probe
failure and unbind while preserving legacy firmware lookups. Keep the
group handling in a probe wrapper so the existing initialization path
remains self-contained.

Fixes: 9066073c6c27 ("thermal: qcom: tsens: Add a skeletal TSENS drivers")
Closes: https://sashiko.dev/#/bug/linux-7dc6dad0-c471-47ca-b493-8402752cf13a
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
---
 drivers/thermal/qcom/tsens.c | 37 +++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index b5ec70201e2f..4f69ce4976d9 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1374,7 +1374,7 @@ static int tsens_register(struct tsens_priv *priv)
 	return ret;
 }
 
-static int tsens_probe(struct platform_device *pdev)
+static int tsens_probe_common(struct platform_device *pdev)
 {
 	int ret, i;
 	struct device *dev;
@@ -1452,6 +1452,41 @@ static int tsens_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void tsens_release_resources(void *data)
+{
+	struct device *dev = data;
+
+	devres_release_group(dev->parent, dev);
+}
+
+static int tsens_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	/*
+	 * DT-backed devices own their managed resources directly. Legacy devices
+	 * created by the Global Clock Controller (GCC) driver have no OF node and
+	 * use the parent's firmware data and managed resources instead. Group
+	 * those resources so the child releases them on probe failure or unbind.
+	 */
+	if (dev->of_node)
+		return tsens_probe_common(pdev);
+
+	/* Tie resources allocated on the parent to the TSENS lifetime. */
+	if (!devres_open_group(dev->parent, dev, GFP_KERNEL))
+		return -ENOMEM;
+
+	ret = devm_add_action_or_reset(dev, tsens_release_resources, dev);
+	if (ret)
+		return ret;
+
+	ret = tsens_probe_common(pdev);
+	devres_close_group(dev->parent, dev);
+
+	return ret;
+}
+
 static void tsens_remove(struct platform_device *pdev)
 {
 	struct tsens_priv *priv = platform_get_drvdata(pdev);
-- 
2.43.0

