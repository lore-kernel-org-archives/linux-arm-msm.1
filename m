Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086A81EBFE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136126; cv=none; b=K8AtCZ/f7Vviw12zh5TOSbfCpGQifcA0NdZ5oa2UBKtpWsyk5KBpBFlCcTNLhPBbK2214Su9/3DyLMkVPu53oTmE2knf7Uye3/2YMh9AQGu8ca/dPofPOiHQbAqu7TMiL/SF2BusqIeCVxjA2clR506OCaIaG1tRR+NXFVLo/d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136126; c=relaxed/simple;
	bh=5gTQD0boQ1ilO/JLWUnLWcEAU002dv7Sx8o4V7MlDP8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kg6sMC5xfpIfjLY70aDBtrmgTCzmgkr3M1wUZRXLTMVIPsCV3zuIInOw2RV9PuumaqXt/qeF7radG9W1LKFvP3dWXdG9D2avB05ZDX18rdvkR71cuwPPPaQ/1nkGGQaxDNL0aZryPYjrV/+OwhXGx26YRy9ElkZXCnAvHiEX8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eDs8VUTs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pb97HtLE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eDs8VUTs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pb97HtLE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fnQb2381692
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=crKknPLPq3cWKwHUWqi14U
	28b1SrzD6KXx97IuuHm1U=; b=eDs8VUTsIYZgeeoUzpQLChKGWCaICavmz3jQcd
	a+OzIlA8Ap+QroysNNubcjlb3k024fO/SOGfVxaOrKhh/zArSK4UpuOrdWOe6Y5r
	wtWLLltF3OgezNw9yBp6NOu8MGjlEmkPs6TFcJEIXSd6cU6wmEHZTbqPot4B+GqC
	zASw5iR+0pXJ+2uJRgX8mt0ii7UtC5ESUkK/B/AaLwuzINwvedLBVXtw/bL6gvwD
	pBOsktZnhIrvc7qd9SAGZUgAtNSsFvqsprJU/ti9UaXpdtHY1OBoP+f6y95USSEy
	UCfKM6x8cy6J2HCppIj3Sg3JXQBOTUEuZ5v/DVBeb5uFsEcQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vcw89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:08:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso34594346d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785136123; x=1785740923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=crKknPLPq3cWKwHUWqi14U28b1SrzD6KXx97IuuHm1U=;
        b=Pb97HtLEkLUJ3r8w7Tlji/z1bdJGsICHSYJtTkC9u6Z7XK2a42SS7Q/FOR//DZL8/E
         KB0tY0U2yuTDtoKJjMjzlx3iilk9O9ZPsoj+/VpWXmxbGIlxnAPQ/WGlUvLztXwWFCl0
         egbMGc13LS8eBZx6InFw5gW/54xahVVg+CVJqHU0hQkVnkkgXod+Fjibx2I77zgtsbzL
         o9ifp27LXs6h/NBBC3/wHcwzSsvtEhdogvf7QywGBgjx+bH8qPm+7P3D5uSWI2oMVERo
         bTfC5HCjUWp0KdyXswyKVnGiGVwv+AWuav2uUaXRFajA5HUosUiFu9OPwrRdnK5u1w83
         b40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785136123; x=1785740923;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=crKknPLPq3cWKwHUWqi14U28b1SrzD6KXx97IuuHm1U=;
        b=mU2DhLBPPmEEEI1R74aNdV0F/pZkdsmJ2+5Ac4DELpaelsTM6N9HIZ/jL+zykTp3me
         1e90r0UaPkGH4Du/XoagbEhjLK00HowDCYz/Tn+nRFCAfTlzucj79sWrGJ6KbGKrt2AM
         uon4Iiadez5ICqgTP/3UxKUKXUHG+MHIHyVkQcVAAISvqNqVtA5eNnK9bY9oUyNssK3v
         SN6asu0ZnDbd/rmtAbAGKKnc4+B8jtqpsQVB1yAZdMsbLrkuSyd3+eQiv8F3a6ASrz+w
         fjqJ4N/ifqTZB0Xr6Y5hwFLpVQQRdOOz7ZepCGxey6pXQEPPuzgfor/9hO0Vacg54NKy
         KyZA==
X-Gm-Message-State: AOJu0YwZ1OZEOrhPNKdE/kmFKcHSIgVy+Tve45epaG8n/quirGIQ70Bk
	xNH2Utf24i/KsCSzFMuYSXhDMQ0129v65VEhWTe9XQF9/3oT/9MLKbSYSGSb79PjhhPwFHJ6oB2
	IlXWk49NCGu6JphhfAn0nWZwq5tqQ1EQ9Rw9vCwkV8B3nsTycHstst8bnvMhP930VSHxX
X-Gm-Gg: AR+sD10NQYmUhRUYOn6SFaUA0rRr+DtgkDIWlb8AwLAqdCpDTBQ5iDDIUl9iI9CwbWM
	9zFi30Lt0rqAiZyDgAqmhlMk1VMYSWe3WTuXTXja9jZO1WghGsyyQB7sWSmbcmefjI2OYgvmaTE
	AHhEN9u5Ne11/FQ71DHrhjIc4D+2g1qWDu+frwgrNoVYKSY/GW6z3LpWSSB6NalKBlxQZu3PkHU
	XSMzWte0nMaYhmojKvobSt1YPMqsPBKAvyahugzUI7OkUbrbMnA3XY6b8pXCuyxEgPy/z2Y2NbY
	kQEhoFdHQls2UEBpziAyteN+vJIwOYSN3bC+Cl1gx7bFrURD67Vrw29qycYzaTmO8oWUzoP3tUt
	dIoFGcWfz8UGWPYOdI30jviRri8PSz3+094lE+A5qygLYR6RTYTlrSFeWgYI=
X-Received: by 2002:ad4:5c8b:0:b0:8f2:22c8:e71b with SMTP id 6a1803df08f44-907e666fb1cmr119901146d6.24.1785136123182;
        Mon, 27 Jul 2026 00:08:43 -0700 (PDT)
X-Received: by 2002:ad4:5c8b:0:b0:8f2:22c8:e71b with SMTP id 6a1803df08f44-907e666fb1cmr119900896d6.24.1785136122759;
        Mon, 27 Jul 2026 00:08:42 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e8522e88sm58884446d6.1.2026.07.27.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:08:42 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Initial support for Qualcomm Hamoa IOT COME board
Date: Mon, 27 Jul 2026 15:07:15 +0800
Message-ID: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a6703fb cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cTtBGgEW6hCVUSiMXaMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: TQR-vRJn1i_SLzjFYamsfhpLFMdga72c
X-Proofpoint-ORIG-GUID: TQR-vRJn1i_SLzjFYamsfhpLFMdga72c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX6zUulQe2IKKG
 7W1HeOO6n1tTY7MkFTiPsPhfFXpvgVoxyr1h0knc5JxVDGurNh97m45Sb0XleE7Qb0598xGZb1K
 R7iulL9XdCZllzOJlW1+kz/7YRBZD1Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA2OSBTYWx0ZWRfX15HwnL9onBbG
 U8a/w34Dae5h+lI/i+svKBaV6Xvc94RNZXkWNQd7Qu2V7p4nNZHB3NbR/3U+3Ffr+btB+DRUSCF
 BcH1b1nSaR5ua8EortKN1miuNSJuIq9NRLxECk5zW883FBDDId19fMCnRQzsa1OiBCnJiH2WZ+O
 9335qfqSS9jE+VsYp3/NL1TmzfTKtOnHmr2MSt5k/QLSBDEMpFG1zLGisvvqCp2+jv3z/4a4H+K
 Fti2J9fivEHrJCdddPOC7+rDZLr2hW/as/BdrAyV2ExPz3E7LxgQEQT/Pm/Sc0xGhs4bP+pQ+bs
 yYS38c2zZkd36W84djr3d9lHET0itRm8KHHd/7i/LF5anCx4qINcC0i1bqBObqM71DQFYbTTMN1
 4YnEPiAwU8NBDjZT2gEzk9gqB5RDdjNCv/5HTOybSfDxTgGldUsWXS5Tkviq8OpBIgWTr7796cG
 4BLy6jAwZJ60JwaSUoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270069

Introduce the device tree, DT bindings for HAMOA-IOT-COME board.

The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
SoM integrates the core system, including a SiP that contains the SoC and
related components.

The SiP on the HAMOA-IOT-COME SoM is equivalent to the HAMOA-IOT-EVK SoM.

┌───────────────────────────────┐
│          SoM (Module)         │
│   System on Module (small     │
│   pluggable board)            │
│                               │
│   ┌───────────────────────┐   │
│   │        SiP            │   │
│   │   System in Package   │   │
│   │        (chip)         │   │
│   │                       │   │
│   │   ┌───────────────┐   │   │
│   │   │     SoC       │   │   │
│   │   │               │   │   │
│   │   └───────────────┘   │   │
│   │                       │   │
│   │                       │   │
│   └───────────────────────┘   │
│                               │
└──────────────┬────────────────┘
               │ Plugs into
┌──────────────▼────────────────┐
│   Carrier Board (COME)        │
│                               │
└───────────────────────────────┘

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---

Changes in v2:
- update commit msg
- fix binding error
- update pcie and usb DT
- Link to v1: https://lore.kernel.org/all/20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com/
---

Yuanjie Yang (2):
  dt-bindings: arm: qcom: Add HAMOA-IOT-COME board
  arm64: dts: qcom: Add base HAMOA-IOT-COME board

 .../devicetree/bindings/arm/qcom.yaml         |   7 ++
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/hamoa-iot-come-som.dtsi     |  52 ++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts   | 116 ++++++++++++++++++
 4 files changed, 176 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-come.dts


base-commit: c5e32e86ca02b003f86e095d379b38148999293d
-- 
2.43.0

