Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987928;
	b=sJ12Ru8rtcPx3w/MB0UWwsblt/jig2J72rG6xan+XDBcWSATU/qNWJsnt4mhu3F+RhDY
	 CIp3h0TvnNbE1QLdg/eFdww9zOnR46xMeYC9pxfJ7yurybXHED9VD+mbLKb6JtYAIGURI
	 o9/gvVzbX4jjyphl04a6D4cfw5c19IXaHpTVcPzFL0TyiZ6O2GyurnwUvIDrWaG5vpv17
	 2t/jaAmQuoQPMCMkLTgtv7iwUX255VZ25gkx9QbDp4ezl9R988KGbN3zqe+24k6DQH6wq
	 JSdMX1+h+B34Wj8ONBSOqH3ltGiGmxuGX97RABOG2NS4D2tspdg18ODPVooRqGAzlkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=;
	b=mst6hBhVaZJwGgQJQmlcCIcibA4/6BdMsp+/u2YmtNCcdV7Ygsp6i2nYLFgtTGx9coSD
	 +SzfBXtu7ZFgZZwb6L9eGD/ksePNFy5/ZQPbJsEmy9oUnYmTVlotP1NqzsH623m0SOzBj
	 Wcyre4VLc4gWfpEmcjsztWGk0UMs8CJkUVtz2L6FXyT5kF89auTnrsPU8sni1/GPp9HCx
	 HUTw5txD0pmW4U/QEyWWEB1UXr6HsmGdVs8a/9E/heZpu5GUHL04JCCmfSA2o/0vdECcI
	 oY7pH80MpMBNTeKedfTGlgdv7mohVvXUwMlrqpAwtY6IC746pwAoOPbytEu1NZTAALw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFxrvPYK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxglUxdU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15174606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15174606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aFxrvPYK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxglUxdU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V1Sf2106293
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=; b=aFxrvPYKjI5Xw+07
	nIsWPl9AsqzVCvWbXVqYx/6ST8QP8zShBeJJ9acWuQh3BfHqtNXT5mK0u8WGtnrS
	cXUBkMDoWZHICymN2ly/bjTkL821sxV+6PcMbkRkRZN1BgbWLgQ11AKVMgW+RyEt
	PyjJZvno5hIX7KaNFJsgBElEBk4JPzfOp5hXeKXmJqA8Iw4+oW/POjeEFU1ud9vF
	7Hc276F6KD3Bn07FJel+msonq5kT2zp3J+fteWeax+Wf6QveO/V9GSGgtOWccVdS
	Wn6bXYWwOcBSm281MYU8PSRGCEYh+GneY7RhA2xldCIl1U3zYG44bSu7xQEDpRbo
	dwKQCQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8stmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:26 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92109408212so11671816d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987926; x=1795592726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=;
        b=QxglUxdUn5PNgbvEIiew8GWulL4KW5QE/QrsMcGvSUSQ46ShwE0QjtYFZiG5pae+3M
         Qx8hRv1u0hIJgVIWNMT8Hh/JyXL5t0SExK5MEriClAlozQzIfWioSEv9xMlrICmJj+r+
         K0qKf9OoR5RsWahgbAhGaNzVFknF2/epodTBWGCsC/6EYGJmRy9yk7smerxM82DrMP60
         V9Oz0K8FQclDf6pqsOhEodADNjYLqZdvGS1/1iq6MsOa5q5fAyzfXwLaOn6m0UiB01A8
         O9aKm1n1OVuFb7dgGtbAt/9CRByhPiW0HScg40YxCTeT3UuG8CirS0cr5jxEVJbCFP6w
         4O1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987926; x=1795592726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kB6pa0Bm7wsI5L99Lqxz6kNj6rQFY6FcZYdNhihCalw=;
        b=laaxob1WIWCO9JS1+CsENEeATfHc/lv5+WeFVBYVW1IHl4WokhHb0apdGmPWrbEX2H
         QMF/u8tlpsoTiP4e5MsjFyb0gLiQTU1vvCeZBZ6rufRCDOxpVjKnDUYc/BwOUlQxJCtP
         nQhWrtKFG4FG+HDVx4l8sQlQ/XaG87+fWnV+XsqDgdu/52R090Cqj7u3wWKYuP94xMRE
         ezADg/7usbmcSglGHMire1KQdguf42ipq6RKXMxnn9NN35Is5OsQLsOkN+z66NTGQAk2
         joIaRY2I3LAHd2F6I7bRoeQ0KSffl8Gf5r8sm4WjhieZth95Oc0Eflje7GtHucF7+P9b
         9ZxA==
X-Gm-Message-State: APuU4Z/QHtAt1J/kI08uVhLHqF6CN1I1VFBcAQ2TrD4vGXmhq91UG0gW
	X1pWnt/BJN5kY/yUY4ermTjLkztvzKCtKhUEK5NfuApQqSc2I7YkGghCKBOLbsijMGkvUb8YSoK
	+fDfQjJrlhE7Naf2d7LhbDKFl/R5VxS04jlIVBA+QyKQNnk6KwsilOvhRAQYItFohCGz3
X-Gm-Gg: AYBFou2cAoPRx5d9ArdcfdHKzGQBHuXkPxPBvhgXbMS8ml5haTEaNfBB6l8WsGXUWmy
	2RPpTo9VId2voQN9rpHkoXBh2oGjWuz3M/bRM1lqnpp6uyo2kTeXrAJUlXBdYDkaN8SsZ6B8eFw
	BBZ+Ss6Izdhi3IopvhopekQniUfzMCNenDsA1/eISO0+WG6GURDxfN+6UIMCE/bxZUOPkIIulh/
	Nl+vqcWWMS5SPLfkf3zx339jdXoZDVIcQgQq/pNKyKB6Q6WpdOftjE+yxdnpSpAB9g/wqSq0K+K
	xsRdkCLjyJuKGNeTzBZksO8+ro0JGvARjjlECWSuPxNtcmjMICc9Sp+9yLc8caH3h442YP808jC
	F3ROmv3lncjB49LAdq2gwY/DZ1N5aT0Qpamw0IkbxfRbYfd6U5zf/7Q67BjwJt5qrO/2exg2+3l
	W5xQIONiBPkK8YZ4uhfjwcyh5HSorPr3TvZ495WlfN
X-Received: by 2002:a05:620a:7008:b0:93e:d051:8f19 with SMTP id af79cd13be357-949995b5a85mr336680385a.40.1794987925939;
        Tue, 17 Nov 2026 23:45:25 -0800 (PST)
X-Received: by 2002:a05:620a:7008:b0:93e:d051:8f19 with SMTP id af79cd13be357-949995b5a85mr336675985a.40.1794987925459;
        Tue, 17 Nov 2026 23:45:25 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:25 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:06 +0800
Subject: [PATCH 2/4] clk: qcom: camcc-eliza: Declare icc path dependency
 for TITAN_TOP_GDSC
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
Message-Id: <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=1296;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=N47i4mUAgUxwVA8cbwb6AJJ/1VLcu7+A2P0QHeIkC7c=;
 b=lpOId+xT4VeWxoTALhDcRN4ApvIdF5ETHZLAs5kUrt+u1qaKi2x64xSrrOAp07xRWnquikUGs
 FFC5bNsQTGnDMDhvVIeLciCRnrja6daKitVbzcaB1boDcW7s7diO7KR
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: _yB1XzemD-z-C5y7h4-6uvqTYsYjFDuo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX/d1JirF8jC3a
 KPo+WKc+uC+Bsrp14UaFlAwQiJex2kLkFPRlmSUbhcqx+SxnqbEv04uVRoWAidm7NEesnnlflrm
 c6QW581Pt5BLdtS+U6vWAwwnNIEIrOs=
X-Proofpoint-GUID: _yB1XzemD-z-C5y7h4-6uvqTYsYjFDuo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX5TjPZ9S4Lr4J
 BRjWIKTCuBHsrwc9EvTn6Te5ryjGz/cH7i2+P4nllqgohE/RG6fe+YTL7yUmoiVbiOY7K7TFskj
 mXGnO1j8Wg3xXJw8IPJ+Ki+0VJ8waY+ktzyquREe0b3l3JxF/WbRHpKr647xRfTRQ8N85ZQiugR
 /vq8uvxFLFo99+1g6BTHfYyjzhf/CrTRPOVkeI/b8d8+Nz45/0oJGednZk+qIE72xvvru+rKM2L
 SJG2ojtF5xLBzWB6XCl7ilP5PPIrvESO43JRDMq9aRN5sbGohQzrySRrqGKbAn75owM+6qtlw82
 YgPkvgZE35hAc8fh6rQ9guO/GMCc1RFkOO/qykKlZGnrs6KfymDJJQueu9sqM6OWmq6iQEhU1fY
 NFQKh2WQKnGMvHTq3lTVa9v3yt21flMjXM9bFISrRFfOVLMVIQItSQrU2DzWkXtkjVB58tq5O93
 3g6fMd2rfeNDSywJ1sw==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd5796 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=schgL9W0h6o9fvJNLFgA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
without any client vote while TITAN_TOP is still on, MMNOC attempts a
power collapse while camnoc may still be active (QACTIVE high). The
power collapse then gets stuck, and so does the MMNOC BCM, so any later
bandwidth request through it times out in RPMh:

  Error sending AMC RPMH requests (-110)

Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
voted for as long as the GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-eliza.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/camcc-eliza.c b/drivers/clk/qcom/camcc-eliza.c
index 7348f4dde65aeacc27182a926a8c0e5b88eacd74..389fb580985ea8b667ab8cc41c6675c0d9057a42 100644
--- a/drivers/clk/qcom/camcc-eliza.c
+++ b/drivers/clk/qcom/camcc-eliza.c
@@ -27,6 +27,10 @@ enum {
 	DT_AHB_CLK,
 };
 
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_CAM_CC_PLL0_OUT_EVEN,
@@ -2526,6 +2530,8 @@ static struct gdsc cam_cc_titan_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct gdsc cam_cc_ipe_0_gdsc = {

-- 
2.34.1

