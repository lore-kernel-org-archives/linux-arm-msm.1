Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F3B3C3F48
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740101; cv=none; b=SGcmXi6IvNIn2diS7JFql5LTwUKc51CojRb+Y/Kfaj5IjgcV3DOzp6r6UJ8txcBiAyyaCytAsnAzcIqcy+1i2ByplqjmRL9a22X/fgpTf7vjQFlxi+aS4r9s0jrw5pdC28ml5R4Wxt5vg1N5ZBBsKWhoqvTDeV22HRbw8Jwzm04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740101; c=relaxed/simple;
	bh=otEHI81H4WDn9tOnr9Q2d2YY3f98Ld2GqVk/KVLqC6M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=srQxTlJG1FckZQ8CuzOc4O90U9VuRTbIKaZ4RhHZB72HJQt2EAyY5PzBiK/wyPE+egitKIu3x3S1r7MEBBUHg0J2PFyqEucqFgr67JkTQmpoY2ltuuFRFCTtjCMe1fmDvNzKcAjcieSwk2DX6Ong7/TG6TCDbZeRZNS0L1RqGnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hT52z4/i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AsnkKdT1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hT52z4/i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AsnkKdT1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGchQ630836
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=H8h1GEu+Qlj
	UORh54PMZRj2icU0G1P+PhnZ9VWrNixE=; b=hT52z4/inV1EHjsNenqVbTsZZl3
	b3WiMz0ZzKr5KUFaxO+N6QtWAlve08+JQHFXiuH/u7rxdcEkqjhzTDAqSWF1lMeb
	lnSyzHOuQzTQLx3DHGV0XrlErYUhwQxdSzfHucRkq+EhHNlch2kF4xO+S56jd83F
	xkRVDJQEEgWRRnRB5RxfafLwmbKxZAjJYZW72Hw8d6BM3FB8SKfBVggbjXy0Kigm
	Zi8WdbqlEpUGWzWWA9VExvzi+C4xNUdQ+Fqtp3ggbkjIXYLj54IY0WjmgdyeETh1
	z8WwXe7dOI53oEWxLJSXKm0LU9+AFz9jgo/+iW8IuskT27LDwPdppS/X/2w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k1nfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 10:28:19 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso1240647a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740099; x=1788344899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8h1GEu+QljUORh54PMZRj2icU0G1P+PhnZ9VWrNixE=;
        b=AsnkKdT1jjTNoHAOWwKPqocOIFXqfdaJwwFwvpCjkttjKzLOnzGB8wQoUMHE/DJPOL
         s3Pa+/NPKtsZBcpz5f3LCDUXMHiTMfAkDqdBMMQuVet8hD7OjMzQ2xU0ADfoGUTItdhB
         2T8m/h/j17o2T72HDYGtf7gvYyC0UTJ/4p5eFBdKCMQs7BpFVCSYG1USKmTOK62240Dr
         9OtK/zCiwVPjnMwDmWEpCNafeWIWOfBtYr3NuPktWH4VTxXvx9W1/FLjO6YTtyahKpt6
         pjV8hGeOTmWczPvLcRdWIrzDZfeBQ6/LKrZp3Ai/2vrd3l6PmikMJ0g9wBurOyHFsljy
         Rkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740099; x=1788344899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8h1GEu+QljUORh54PMZRj2icU0G1P+PhnZ9VWrNixE=;
        b=P44cc/Du18bxYKGL+ClHociYrQL22XSOUnvyH2WxmT8jUDWFUjKK2po6gjL8JmobM1
         TLwFmx0JLRkhRmzaG18pFXkgqd8trFTTGqInI9xRvO87Ts/Lp5gNKI8zNzrOd9ZzTmMS
         oGcaOGXdZagAB33SvJmTnUr/O3sFxksVt4K0AhdG0F033pMrEfT1thtT+eZFkvxxjUeE
         QQeYyT7SyhfP2Hh3cFlaCyTa9Fvb8Yh2Oa3ihFcG0YFb8jzBwkEFZXWG6xuPTY5ZUJ/9
         i7H0m9Hsqob5derv2pqYoqkmUNbaLb7T1KBCTPjAfkA7DABL6xg3MibGtfKGT0Z7MHNR
         7fRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7d4sslsKC7kOOVS4fz5dVhYiZdljoEDxk9DRe9/Q5odNAW68ArzECP8aj6E/8W/Wvo635J5eJMB3y1ezF@vger.kernel.org
X-Gm-Message-State: AFuF++ml5rSJl8pLt/tTrEZWQmGvLKtlZdZHr2fND/MKtXYq0nX14+do
	+4Styunb9Iz5Ic4DJD8a6AZPhb+4otLe/vQMUXyMHLiGU+k/uDMYxPdy5bucmMgJc2m95dTctrx
	FrI6B94NprN2tBnlxG1wUACHsFdG8uAn+Jg29AUoINX0KeeNIZZTpEIl+W5kJdUdtT5ZB
X-Gm-Gg: AR+sD12MzMuhmBIRIYIPcJqEZ4AlYA9RCtP4jxVfj2YEi1jiAQllKX8zX4boTTfkK+M
	qqn7EAHxHu9XA9t12djDXKrstyC7RPlqz1Qv0erXK15aHk1htb+4GiJD3YHoOxX2CaZwetuvLLy
	BgHOZO2/wqu6mRgviDeYwk2uKSZCUW5NvqnvQHs9jDx+zOgk8yqfA91Ckl0kWIpIIlIqsF4mG3S
	mhFky1Hee0Lg7wL5MYmd2kjZms+yo6E/mqmhHKEbIdJqk43jiOBLNGlQxwGX7pX6pYP5DUIHGwa
	/G0pe3I90uEhGMqL8GU31y8gFOjci6s+pJQzZYpVc0v93TGJzX0/+lZubGhnnSDOgwhabnFzQlg
	SW/5n1KD31bwyo0wbaHi1oyf8wHlvUxJhI83bN1VR38/eqUfg8QIZfuJBEXp1
X-Received: by 2002:a05:6a20:a110:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3cf7596a65cmr10578912637.1.1787740098636;
        Wed, 26 Aug 2026 03:28:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:a110:b0:3c3:33df:4d9a with SMTP id adf61e73a8af0-3cf7596a65cmr10578819637.1.1787740098114;
        Wed, 26 Aug 2026 03:28:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60c291sm12935669eec.6.2026.08.26.03.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:28:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: power: qcom,rpmhpd: Add NMXC power domain index
Date: Wed, 26 Aug 2026 18:27:43 +0800
Message-ID: <20260826102746.633076-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
References: <20260826102746.633076-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ebfc3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8T9gEdC4W5p8owDaN-wA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX9IACymf5JrU/
 KSwhDXf9ajwG5Hjy4cJ73gSz4YJwyiAt512SemH/p8+CpPYfyRfFctaC82Atet5gKBD2r8tJzcJ
 sOSRUeeDYpdc5M8AHpAlFAXfyImHXpI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NyBTYWx0ZWRfX/+Qd4W/pA6vo
 BmHhDHp/uqVCSjgtoxwgDO2SyLL1zBW6MIRVG44AR+9klRlex9ZmMbz8B4vM0Kb72qWo6hWPoyQ
 TOZVg/0JcCt12FXiMGeKM7UdOxuq8pvBvS9YsBvXBpQ2dze2Zfjot3oXsZOwJoYspCATk5Aaqrd
 uu2tQGiBoU0WnrddqUC3MbJWOXNiE3AYxkbL/OHG9WFHViOxmLT3qBg47nyEcLbumomF3r+KAjq
 KCHwtFyfCzoTkm+iOIceoq4XDZO33p5rkPVgjjRy80MyEoWY7KruK0WSPrcoUoyqCBBRWMrIuba
 fidlBqXb8OBQMePae0lUALtZNsYJwzJugktVUXqm1k34wPxF0tOjoXprTqStpmRxmCi4pZutC4m
 Bmk+3CSJG3yKcI4lf8jmy4r77RAmwN8M8mKENkSOAHmFcOPD2xXMWdRP5ZK6+8PcLAgk8YgrESy
 kmoYsYXG9aCKG1PvqAg==
X-Proofpoint-ORIG-GUID: -XekKgTx_jzWaBHF_wUF3KsNrkkt-Gdq
X-Proofpoint-GUID: -XekKgTx_jzWaBHF_wUF3KsNrkkt-Gdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260087

From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Nord routes the NSP (compute DSP) memory rail through a dedicated NMXC
resource instead of the shared MX rail. Add the index so device trees can
reference it.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom,rpmhpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom,rpmhpd.h b/include/dt-bindings/power/qcom,rpmhpd.h
index 07bd2a7b0150..92c8408dbc57 100644
--- a/include/dt-bindings/power/qcom,rpmhpd.h
+++ b/include/dt-bindings/power/qcom,rpmhpd.h
@@ -32,6 +32,7 @@
 #define RPMHPD_GBX		22
 #define RPMHPD_NSP3		23
 #define RPMHPD_GFX1		24
+#define RPMHPD_NMXC		25
 
 /* RPMh Power Domain performance levels */
 #define RPMH_REGULATOR_LEVEL_RETENTION		16
-- 
2.43.0

