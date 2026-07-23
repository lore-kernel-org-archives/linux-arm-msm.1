Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB1379C28
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784827955; cv=none; b=u39WZ92+58QleFj2AtXP22GVxc+dCa+yuQws1TTA3gMecL3gaXpWFfesApa+YKg5yCRc0BJoUQe35bgP6dV1Se7kIylD8L74fQOS9c8AdN5uC9Hlha29A5h2k3pPk9oLPK2YXzsJhF3kZIjEByBmJmcVeEDYBfyPWD4a0pqAbCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784827955; c=relaxed/simple;
	bh=7PjDYgzCGbqqLRFenpnkIZNEKNXhW0mgpo/OnGOnsmQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u7h9DIIOpAfPsfrBov5glqBrDJ3a3aO7TkA2/o6Y2kVFfHjy6j05ada4/TtQdGljMMGktMGpDZPaP7yk2vdlKI169PWhByQ5bFzbkuWzZoaaD3EFDf/i8NeQvceLQZ6zB/Z0evsgcmk/IFH+454NrnLSMh4YSW3eN5a8TWGDLfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foRDqk4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gx8/WRWz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foRDqk4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gx8/WRWz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NHWGQS407764
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jeSDnodhkmS2IHhQ4xjSKE
	lKzfIFuPKovj25uA4Ziso=; b=foRDqk4R88mcGjhHnX3BS6OswENLCiivUMRUCq
	+1yh9mOGnSHaWpDCTU/AQ3sqr/HAtjqBDVmdZymr6ul2g1qZuA7rnroQfrHwiD2E
	7C6PnllDDIX2div8wUZjuggz4h4gNX774mn5u4EbHH7HUaAPMQoEGn5PcXCuNZje
	JPlV+cH8ZPggAgJg/rRaCvN/cK140tyX2/G/fFZ6QiOCrhpQRHgVHhV8AlIikWPB
	y6XacinrKOQJSR/g6k2ctdvTbxwxa1zY8xVDjQIDCd8OT/stdliFCPG4cVyLMERR
	DSUr6GGrs9IJS9jXyZztsMAVWsgKwfi0rDy9qwcQLc8aNm6w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu9jn0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 17:32:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so1274677a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784827953; x=1785432753; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jeSDnodhkmS2IHhQ4xjSKElKzfIFuPKovj25uA4Ziso=;
        b=Gx8/WRWz2ltdcN1GN/T2zKNlaU+dYx/CfG1edBCD6mUuRi1DqRg14nWsWBZGQsGgBl
         mg7+IsfMcuXIt2+Blk+ij5LQXUJVK4LsBwGr0LtgwAFBstifr4Q8qR45yZvuiMnR7Fas
         ToUos9QYjwGWqBXo30S2AYSAPgzf3vc9dtDjSzLuVmu40nFRvSft4U/vUtRjYc1q48ax
         35uPoCLGVfYMrWNKjtv+KZklE+da9upEGvWaueOm+VWQJfX43apgtVaLZackLrltoBRS
         y4CRyctLYBW7LlhUvooEOPDGAguse6KiDWe78f4ZAKWZXlJ/70HyPlMzNqwtFbHvGegp
         Dhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784827953; x=1785432753;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jeSDnodhkmS2IHhQ4xjSKElKzfIFuPKovj25uA4Ziso=;
        b=XTE5q2XWKvCatzVgZl3rsA0Dv8E/NY74hoM6PRGbuYJRib0+jgAgl4bLRo9JpTCxBf
         xfnP1edONnPW1puGlX+FLnMZpS42dP57/CZOfRdtcbCVlQMXudAIvnVGLSbqI8mldFeJ
         miQ58XRVyVL0hN3P2KEyXyirZdIMoDRUn2mqxpNOiNkbcmVai1nUfMDspUT41rEI3hH1
         jsTNuSJ3hJVyQ7Y29ph8d5GLo6zEuUYBQ7YWY84mYzeeLrArKflcUPH5TWhnjM2raML5
         oEkexbEJ4AhYrvq7nxdoymgNb2IvHMvNtWxfRWLhdos6Ji0OhP/+zQLHZpc3WazRUeaZ
         gORA==
X-Gm-Message-State: AOJu0Yypr7uqDWJ/idogsIFWU5lp4l1aRXUyD22Wy++xh8gHcxKvJRVS
	7p8Lo+/djaa+SSa6kE9W+6qAfKBTjtMrJjocXW8iVwrXJZqZw8241JljQCoOgHSwcuU6EvbuIE6
	Jhjdb0VlIf4NPD1mK0Pels6y38wBvJKTCF6ndns3OENHWsOkd/HQ/GQDWt219Hj6hAf/1
X-Gm-Gg: AR+sD13Mx+aPx56RrWSTcE39vRtou4m6xbxwv6vGLn4PZbXlvSQUW+2pt4KLDZ3Lh5m
	TsQW5UqrVsttKIy6u4a4Xt46Gid+sXVYEB2su5GWlYbKTLYi58KfAe5zGkQQFDSpspAm9a6pweF
	oGZoIh+ESdfxSMT1UDOvhwIuTnvhkRKE7b0RqSR3Z4AufZz2QD46uSuiJYJCna3hri3TXZ/Ny91
	KYzvRFJdxGQISjNym3j34+5Grf2vOh/JMJXN3iptbYwu+Q+7I4eRXvrIeQeWrZqFvT5vi/Hk9oT
	FxYxG2cphiqiIIcoc/7pD+Ej0vdhHroaErT8gSgF2eXfNHCnTJ1qLr3PIxCkg1pbiaVrd0QtLZX
	vZC8ikuuXsbxyKYTwuBtMyibiolNb4nxCen6YrVMsVOO1/8Rbl+8ZCgfA0TVw7GmHdAfVxA==
X-Received: by 2002:a05:6300:614e:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c44afaac10mr4452998637.10.1784827953032;
        Thu, 23 Jul 2026 10:32:33 -0700 (PDT)
X-Received: by 2002:a05:6300:614e:b0:3c3:8651:b317 with SMTP id adf61e73a8af0-3c44afaac10mr4452962637.10.1784827952623;
        Thu, 23 Jul 2026 10:32:32 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm26466497eec.30.2026.07.23.10.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:32:31 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/2] Fix usb controller properties on glymur
Date: Thu, 23 Jul 2026 23:02:24 +0530
Message-Id: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChQYmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyNj3fScytzSIt3S4iTdtMyK1GJd05REC6OUZEtjCyNzJaC2gqJUsAR
 QV3QshF9cmpSVmlwCMkepthYAKlVl5XQAAAA=
X-Change-ID: 20260723-glymur-usb-fixes-5da82dc93827
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784827948; l=780;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=7PjDYgzCGbqqLRFenpnkIZNEKNXhW0mgpo/OnGOnsmQ=;
 b=/pCxV1Alj6DJxLEoD0MtZH76ln5HkyhbPXnZOO/mV+tbmNYNCjYmdhuksRWiX8WCqMJGJ85N0
 BQ1unr4kEbJCYe7bpKtbzVetrtpdJkUMrGdNn3JVm8W97+g/X1RtOAI
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: 0Sfg7KwMYAQIplr2kfsqM1XYWOJJPZ5U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX70dP0Vj+GwbV
 zmV2g5+lmmgSuQHrwU7Xu1rvEcdGgXF6Hz0M1wl0Os+qAcm1Ki4JIxq8QQHhWwv30FPOnk00Mwk
 7gJWE8WzGfJJh2/5adTQgX6LDTuWn5ITPauJ+DUP1wEy2fx4PhM7E347PE4xFpddAlHQg8N1Y+X
 skUbnWjAvi1VBAJC6f7KfSxVPJsgdkjpto4z77zZNAeFqhOefuerSKtnJb11CXkPFA0Dx0oWtxb
 9foPDHmXQYVNpOvTptmigqT0VidWPAhDVSOuiNrFDDjnUUqwmuvaaKtGV6xyNhnXcPwVdH0dD6V
 RSKXNPKWzuZnPoWvD2IRRIoXWjA4jV31+XflT2Bv042hjAJeN6hPbwe1955yFAG/VS4IyLGMPdd
 uqoODULm1B7o8n2D7LAIp6TsXpJmYZcVvvNM/q/8tSmOLrsSxt9Dziz18uIg8ghpdq3ADXKziO6
 IQnHxYZJWIdv++tc7Og==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a625031 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=CMDM14fy31CpCENrng8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE3MCBTYWx0ZWRfX6juUIYTUwif2
 lf7UqBGBIpjuDFHe4OgYxxuvkVJ+y5ie4Rijn+/v+VWzU62qaYVP/mOIBAnQ8k3hXAn/d3YnXVc
 fNBx6bovg9U23iW7+qpaf2FZx/nTSEY=
X-Proofpoint-GUID: 0Sfg7KwMYAQIplr2kfsqM1XYWOJJPZ5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_05,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230170

The Glymur usb-hs only controller is role-switch capable. Also all
controllers are wakeup capable. This series add these missing properties.

This series has only been compile tested.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (2):
      arm64: dts: qcom: glymur: Fix properties of usb_hs node
      arm64: dts: qcom: glymur: Configure USB controllers are wakeup-capable

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 9eebf259d5352b87080d67758f483583d9e763d7
change-id: 20260723-glymur-usb-fixes-5da82dc93827

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

