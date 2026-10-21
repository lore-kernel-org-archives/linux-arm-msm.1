Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573092;
	b=sCubGrcwaQLKKzP3duXQ5yMuJRExhPxw6o4HppASkH+Vr/GBoE496QAAFed1aiatBd4f
	 EB4VA7YcGboc/ZC7tLgGAiOI7jHgk5tVzovXyFKEA4XIkevpAvI1BfGvdfNYBWGJrR7zN
	 6WEBFJi0YlzOodaxbSdGFXbW3Da1LHqqWOp8VdhmLb1taoR0QnyasWsijqROjRLEzd5XW
	 yFi8zkFpf6yopG6CuN5bloe5BUZjsK9WAgzJyAlzsv0RCcYjAoMJjww7NF9SoEMl5Tzpo
	 gOgpHvbsoFLwgv/fDj50ksQ20HviflmI24Ew7Y0HIylMQKpb5E4CNgDXz/mCQrSt2BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573092;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Q5XfVpN7VVz9w3E1kpowPrPGfkMuKV+ilfnKpbzYapA=;
	b=SYiXAa3y8LQ1vXA65RHs8h9gXg7tXH5m84ukFzjStV0381B+mdAOB/lphKtO4w07J36l
	 3yXzIW/pcqffVvWKjTzFFK44BtO0LxiEBl1CMugHHSy7GNUfeZZaTvKz4I5sqgbSK7WUA
	 YNYqUCzQkbckvuG+7Yw96SQiTRYEiAKgILj+WvXwuY1yKs6qiqG2g54Zg/KTzLCuGqtNO
	 QVp6d2V2Ka5Mf/sM2Kq8+m0+144WwVR8CHou/hWwg7AVzd5vxQ+bNzwftXanNAXKSm4ff
	 w9ggS4A5lYw0uMt/DVy8oMHsd4yfrsXdd+FJaG7rZUaqmjLx5PpK3XJLkpchUcu+L3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGocis+G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCoii+IJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD559606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD559606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EGocis+G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OCoii+IJ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6R9793360
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q5XfVpN7VVz
	9w3E1kpowPrPGfkMuKV+ilfnKpbzYapA=; b=EGocis+GJfmifeKt56tSqQ0eCmx
	RQgs+iGvdP4OXocWg4G5yIdKOme5wFr0HgqfK+KrBo3TdQ3o8gvKD6HeI8bhg2Q8
	IdhVdlWzPe5zsCy5K3Hm1+5xJwY/N71Yewr12FcA+hIt348V22a+cwfii/s6ZZPA
	PoXPY/npgkJ63Ij+T1avAvySceXgb3QIXZ+c02ENNsSjUN9bPtTfmZqm3HbTmX7+
	aSLiaSkFdiifZWOZ0V2ACAgEXxgliaPVOLaWS1FkxrzaT81NgwqPcY7sI5UuWfkF
	ZUoXgoOWPOmmDIiZ3nRvKsRQkeS2O3Qdirmywvz0OnqqAnGPzbD7FDtaSKw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk59v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:58:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so99235285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792573090; x=1793177890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q5XfVpN7VVz9w3E1kpowPrPGfkMuKV+ilfnKpbzYapA=;
        b=OCoii+IJFnPFSUaX+VVi0wb1c7NGLWp/eV4gYEW2cyMgZYNFmcFdT0h7MNLaXX/zOY
         plODvMbLJjiVaMvTTczmUt3SGkFDV3r+LZuGfOo1FAXwQwif7X/7FA7azoNhG8QUP8J4
         xsVRBj4LwFgkuXv1y1O65Ac70wGDmxBd7Jjghq7/5RZQuqPPWqEIPBl1lHPqkF2S4qnk
         h40AkXpx1LlW8thpTDZuv33oLdo8AqCVx9XOTXiTiARRAFh+pGOwn9WJr4Ngmg/Vh8W/
         8n3dWyIAPEqyYN9Jo8A0/UooQE74O+T5HuEBzLzZKp2R8ANOyl6xm/oZ1QZV90dTGQ4p
         r5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573090; x=1793177890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q5XfVpN7VVz9w3E1kpowPrPGfkMuKV+ilfnKpbzYapA=;
        b=tAky3hBr23HfomM7uzN1SJWgUwGX2aBYluTEraz40r5e69MO81foeFF+u+dnFL26uo
         d6yxvds2KiW/yBHKdOfW6oP/1nQN0lHZmObuM5XuZxcu0yYkuCWBXoZMAs2h0S7bdsX4
         ZrQNd3kOz+CrlC2zCuGUMZNn2THQ/lMrMWkBVuYy/2d9jPGAYHf1L0Kg/rf3BTgB3hsh
         1yFLt/u/6bW6bIGpLDgg26Em9eBOizqI/P5hONxs8DgDHJ/0DCRHc7nreDdxptCOlPf/
         xdi/9uOc+Jl5T78xySNUCfluMue4m2Ee+8ezqk/UocAZYfHU+oV3sOSAV4eLZZvYZ11V
         GKHg==
X-Forwarded-Encrypted: i=1; AKwUvByuHJ8AXqmna0ZcBJrEPMFUQG2Q7FrP3XbDpkkRIhsDbbgBjwSzJzJbvKdqPeC33fxk7vXt5ObcOjPt8f5r@vger.kernel.org
X-Gm-Message-State: AFq9FYJyjqQVOnuQH6FPqegSHplDBD7w52pPXfn6QpgMvvjBQsPgoNcA
	ZGYiAeO2bCnseNFCTS8u3MHeBnxI+R+Nmkg+Dh775BEva7nl8c8tP04ybY+sIlg1U0JJCICNMv4
	pUuMvWbmKz9LAF9ISW0LmTkiaL4hIu6atd0ng8OrSPHLQb72+1v00uYe+Gp9HJF0mcRS+
X-Gm-Gg: AYBFou0/gdNjjwjtNlJfCyN8HlayKwkGKJK4XeEytMAoOQlzc4CxtB0SiEMzXQMetvE
	w1x34ggmHFnhtokvSVTXFvjcXnB24PkXy3+7OS8Vl3PuJNADTd4Cjbfkg7zxOr+HWZSveXlEad5
	NSgibdKcZrUC5k29V4kP67uJPJJEaGP3bfwvq9jiJKQGVrkdBRzhBf7nfITMhJHTOKaobh/9hiK
	Xh/qmS63gEeyoHkW2pcvEekirakwZLVz17eEF37jL07oGiBRm7ofFkH7SbUE8GQl6y0BqLc9pUG
	YS87K4tvpM34uGcjIN4bJORssf4LUVRDSDUg3MEj4CMahrE35l8I5W4oJE6OJNxXezL1Rd1AcMy
	KTl9knkKfRfjq7ORfCmcBwWPsHg==
X-Received: by 2002:a05:620a:2688:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f4c99f2e7mr729419685a.39.1792573089716;
        Wed, 21 Oct 2026 01:58:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2688:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-93f4c99f2e7mr729416985a.39.1792573089271;
        Wed, 21 Oct 2026 01:58:09 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8d9e:b00d:491:1503])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258424bcsm4058401f8f.55.2026.10.21.01.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:58:06 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com
Cc: andersson@kernel.org, Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-pm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] thermal/drivers/qcom/tsens: Disable hardware on probe failure
Date: Wed, 21 Oct 2026 10:57:48 +0200
Message-ID: <20261021085749.3786101-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021085749.3786101-1-daniel.lezcano@oss.qualcomm.com>
References: <20261021085749.3786101-1-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX9DkIU8XWE1W3
 5QUVM03Tg5ZmGYV4qUK5Cn4+sGXKb17ghNHiFi/UNsYRAan0APaFcmZ//Zxa1VAKyy7zdaHvXXV
 fj8shSoJ37+OuaKd7lYDQV1QjxK5fnw=
X-Proofpoint-ORIG-GUID: AfCi9S2E40yAtLj-7scldgOJOnlssomR
X-Proofpoint-GUID: AfCi9S2E40yAtLj-7scldgOJOnlssomR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfXwSma94mBZE/3
 SHCeqTXOTuHDnLI51BsWDnaSYx9DCQdI10fXCRBrL/7tJ3QlXhk4cqMZuGvbd/AqxwMVHuDREQw
 pgOsKBXmy3m+iUaVA9RDLzaD0cyOQq5T7wlIpSac3/8bK9CJq4tJIV5huGHHb6GhpShBnrkNkBP
 H8AoelVWITy28Xd0lPi3/B2VS/aqGoZTwPDaSm/ijE89gaefxK9szjxKqgpm0tLFQdk/m6ONKkj
 ouCkbeg1fBZiBaMrfIt8OZaWnfjjsXl7pOHvLXHivNWUq2ZWNccVkvo0IrZCUIE+G1h0APmFr2Q
 En1cLXxZAqDgVADOBjxxI/xxEcc7zBn1eO9wEYS32Fy8ezmMLsPUDuWagCGTz9dCO/YLQpW0FAd
 OnTgUu29oN9mFG4o8FZrD1DjqlN2NDsZNLCdovhkI0B9HPZofzA31RroXL/AJA8fPqWFElIVNsc
 +vwALwOHJsP3JW6/x+A==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad87ea2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=u24PIR98rQV_9BJ0iLUA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210035

Hardware initialization enables TSENS interrupts before calibration and
thermal zone and IRQ registration have completed. If calibration or
registration fails, probe returns without disabling the hardware. Devres
then releases any registered IRQ handlers, leaving the interrupt source
enabled without a handler.

Factor the hardware shutdown sequence out of the remove callback and
invoke it when calibration or registration fails after successful
initialization. Disable hardware interrupts and call the optional sensor
disable callback before devres releases IRQ handlers and register maps.

Fixes: 634e11d5b450 ("drivers: thermal: tsens: Add interrupt support")
Closes: https://sashiko.dev/#/bug/linux-4b873699-7a0d-46e9-b768-169916c70d1d
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Amit Kucheria <amitk@kernel.org>
---
 drivers/thermal/qcom/tsens.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 9134637a3458..57d71159bd4b 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1374,6 +1374,13 @@ static int tsens_register(struct tsens_priv *priv)
 	return ret;
 }
 
+static void tsens_disable(struct tsens_priv *priv)
+{
+	tsens_disable_irq(priv);
+	if (priv->ops->disable)
+		priv->ops->disable(priv);
+}
+
 static int tsens_probe_common(struct platform_device *pdev)
 {
 	int ret, i;
@@ -1450,15 +1457,22 @@ static int tsens_probe_common(struct platform_device *pdev)
 
 	if (priv->ops->calibrate) {
 		ret = priv->ops->calibrate(priv);
-		if (ret < 0)
-			return dev_err_probe(dev, ret, "%s: calibration failed\n",
-					     __func__);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "%s: calibration failed\n", __func__);
+			goto err_disable;
+		}
 	}
 
 	ret = tsens_register(priv);
-	if (!ret)
-		tsens_debug_init(pdev);
+	if (ret)
+		goto err_disable;
+
+	tsens_debug_init(pdev);
+	return 0;
 
+err_disable:
+	/* Stop hardware events before devres releases IRQs and register maps. */
+	tsens_disable(priv);
 	return ret;
 }
 
@@ -1502,9 +1516,7 @@ static void tsens_remove(struct platform_device *pdev)
 	struct tsens_priv *priv = platform_get_drvdata(pdev);
 
 	debugfs_remove_recursive(priv->debug_root);
-	tsens_disable_irq(priv);
-	if (priv->ops->disable)
-		priv->ops->disable(priv);
+	tsens_disable(priv);
 }
 
 static struct platform_driver tsens_driver = {
-- 
2.43.0

