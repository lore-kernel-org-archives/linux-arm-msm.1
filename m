Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA91E3C1418
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609871; cv=none; b=smqJUIgSURQgLSTZsoU+sVZNfTxMsFCXCtDnJoEzHkpqnF3qqmNAUPm4RDnSIKBSMspRzgLSHf+klmziIjhB3+iJfWgny8LDpu2bPulmtQS1Pg4LvjRGCg8NMYdbC2vLjrM/qW3EJl0wG5YqDuo00LMMNSCAaxaY0g++Rub7WRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609871; c=relaxed/simple;
	bh=C3ADu0wERV4RyfKiljauI4Ygtu901IBxPi0iNXD/Hpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NoaIsXktNLTdC8kak44BS+0Ml3wU9SzMZTi5wfPWNghqzn/96/6WzOMERkOXJydkAU0xzuBj7jjur9bu3s17s1r6BVvGtojMJep8FharHuP0p+0+3HGqzwslVTBq8tx1c8dG53ZgRMXsybOdPIkbBKAVToo2CfKw/Bf/8JN+l4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lw4+WpGn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sd2xDfkc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lw4+WpGn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sd2xDfkc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L3xuxY568757
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	izwOatTBTJ5+VqrNLsS/ZmxXZYE4vUIwX+47bjoUJ9Q=; b=Lw4+WpGn3ejvF8+s
	cE9zwCPoSdfYkO76gi2ZYYrFbaBV/+bb8xJkE/b3b4V+w408ftYS4TlLbuEgzXrZ
	wz8WuluyG2fCFkBahI4Jcc6ens3SNWACH4F50Jrd9fJ3NU3ElOaViMvZPq3MgVIy
	MrknEqbb+QupRJK13kZdRKBNWFhHfhj8zYdqsjVDudPgYvO922E+tqEs/DVxShkS
	XLjg7GgliiMHGuBAUEjW3LxKHeuyot8xvaQALViPSoi2YkHtvve+s4AklDBWMnwn
	xFwa/BuFmTLJ6DzgpMzVbMkssSUIIw1Uxm+BiB/zO7RYan9aFFHi0iZDKtoy05bk
	uHI5MA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvr5we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:57:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso2236061a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609868; x=1785214668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izwOatTBTJ5+VqrNLsS/ZmxXZYE4vUIwX+47bjoUJ9Q=;
        b=Sd2xDfkceUM4jaqKMkHKb0s4WkU3UE6QzU/BbRJ71Q9DuXDFzlWfdlmWh4Y73LT6fB
         e3RuglVDF6dm6KM1GMUTMH64b+xoSn0i7NZMa7X4cWVfofEZH6D3ABWBaC5iZ8PCqXrH
         nm3q+jKWHqkjBkNR9e9ECKnKQyhzHcuXfC7ErIi0OscZzlMTs4gQYr+C9xDvrqK8SZ3K
         gbscvc8zpDU9ZmfMwrntcZbihoZjETOq4qVAi12CMEfUmIFka+WYO28wnkDBuesIgQER
         eCAGRA4MQikA0+G6e/sbmhKls+bJON9slvukcDhCDSDHWAEl6NaJ0u3IbEufP2QvsWbO
         AyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609868; x=1785214668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izwOatTBTJ5+VqrNLsS/ZmxXZYE4vUIwX+47bjoUJ9Q=;
        b=n1poqfOkSWzoSpi6/erh2tZZW8ecqkVXsmiCJOi4skivSFWMlhQvJ/7oET7Wz75iW0
         FJ2CO6+84OXORFwSPiKBJ9+fZscHBkXQo/L9LAlddMGGd6bApsYeRPHHPFHXybAl+KsM
         RFx1JIHXzEKHZ4H78LJwf/LIscnA98csBG0oeWpOYbT5YLGh7So/G+LZK7U0Q9oPb+TZ
         2xS4lEALKmmI6fQDlPRHjMAvklw1HkacWtGvkTFyJKNFOF6HUzrRTkvnJXQR8sSxB00k
         957qS3jwl/s/iSIzIq34c6u+jidgF4Lr4DdE2r24kFRwsGfn7k05yt3Cy84D75C2ITgp
         7GtQ==
X-Gm-Message-State: AOJu0Yx/AtBQ7D1t7e8oakw/LL40U/Ee0VfdfF5tv+fWVTMnoRcx3sb5
	oEcbhPkTln5+Mbo6ZzGln88pYab1AVo0/6IMAvUjtTpro+bUq9x0108ny5jYFVRrj455pNMliJu
	QOmFqSwtXDMuGDoaoYVaYklXr2uCoK1eL2qKXq+sDORjrJwhTfK6F/2X1mZf8EzWD9bge
X-Gm-Gg: AfdE7cnaoEEFlxu439uUTUghqSCKvYLuCNi7zYHL1vBjgQaIYsu2HhMW7obmEGzYKiA
	BH0Inm7rfpoJnGI/EG9Kl6hpanNuEpMn3roiFvt86pmmMv654mmnipYNDofrGokC4YfKlD5nXXo
	Pzz9APXYzu+1BCzwJTcJ59JVhW/m3r7k+NRp9HWYybs+RHb7nwpA/QiRWPPEWvLr8rLKaLKVeC6
	hzUARgbUXCHmlQnVFyzGdBzwRx1alWjvBVQfG3tihQdhm8Hm3TJ2f4hPxzeSPUKLb0wpaDjUXrP
	usOzh0Bh+O8sLBdrPuelfyCjZRDgnNM5RHe+f5CKJ2W4dYYNJdi/UkIOaFqQKySPAQah3vVhe23
	WN/2d9v0nJIu5r3mK1Mhg8ShRkU5w1wgmXKSQcIuqQ1+kUj5+dzJFoxk=
X-Received: by 2002:a05:6a20:244c:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c3ad80d53amr17094013637.24.1784609867893;
        Mon, 20 Jul 2026 21:57:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:244c:b0:3bf:6237:4d4a with SMTP id adf61e73a8af0-3c3ad80d53amr17093987637.24.1784609867434;
        Mon, 20 Jul 2026 21:57:47 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm42110862eec.24.2026.07.20.21.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:57:46 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:57:36 -0700
Subject: [PATCH v2 3/4] arm64: dts: qcom: kaanapali: Add camera MCLK
 pinctrl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-knp-camera-v2-3-a21c3f0ecd55@oss.qualcomm.com>
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
In-Reply-To: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: Q_HZjO8M6mK2IS5j-6FpzXLSD-wVG_n7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX/ZsxcPfNM8Qs
 N76HGYIG1ypx/eDPRTzZCrBCFLtlnyE6udKMplSB0ttukYp6lVcRHyfbTuicf7DtXpDYjSnx+ZA
 DX6ILBbmq3efnN6DBtULxM/bD63112c=
X-Proofpoint-GUID: Q_HZjO8M6mK2IS5j-6FpzXLSD-wVG_n7
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5efc4c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=butnsgrUGOw-u3YEFNkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX1IB4DRy2B4b3
 KLJ1qd1rIhwm73WQnbmOjMrVZSBTF0fDgiY5zth8RBn02jY9OBJz/I1XglTEtwktN3H271lmnlI
 4cgQB0Z+cu2kury+ptP8uDgTtrifZxfussxtyG3lZgMdWBAAG9xVTPe9Ksk12rR0t9thVhInIVa
 9vfnZPHqcHg2AnrNDDIe4sZg1GCHORFdijnRrI6Do/9MxKcwqS8i/q+HrnHtfws/XFPMfui3JYK
 b5EsxGjeMQyGhRSFWs9zF9b5RY4erz7Xhqre9LCNkMjDc8+LZKnB27LC2iJ/jnEZhVNcGJBmiE8
 x4IQkGQitQMtUapAZC+ewOkvRH6G0D/LwpD/MegIBbGf/tgneQF4msN5Da7pwcroYNsIm3dMs3N
 t7l9KEGlftyO1LnIbnzhvq9JB7MI7AoRcbuzoN1d317Qhgo7a5eg0dSh+yJKKmPF5wT3qwaJyYJ
 JvADX6JojfYHO7S4pJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210048

Define pinctrl definitions to enable camera master clocks on Kaanapali.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 56 +++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 6cc7b32386c4..669a74bd9d24 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -4348,6 +4348,62 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio89";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio90";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio91";
+				function = "cam_asc_mclk2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio92";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam4_default: cam4-default-state {
+				pins = "gpio93";
+				function = "cam_asc_mclk4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam5_default: cam5-default-state {
+				pins = "gpio94";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam6_default: cam6-default-state {
+				pins = "gpio95";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam7_default: cam7-default-state {
+				pins = "gpio96";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio109";

-- 
2.34.1

