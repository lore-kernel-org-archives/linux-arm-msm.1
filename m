Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828EB3F39EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784803158; cv=none; b=nBkHj3/77bqNkWB9iuDlkOp5Mtqb413qja8uk0sGteZuoqmpLcBXHU6PXO/rhG6oVd31kBAi6EDnlgFCO0uaNZmQGVceIhxVqTBkkfov4sEr7ER/n4d9+P9SqAj+DTfaeq6xmm6J2tn/CgVP7yoKgduiqDBTW6wszHL03vn0+kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784803158; c=relaxed/simple;
	bh=95aRlnqGGcjXiiM0uMEb3A+wNWlk0AP0T2azwmwkXDc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BOMLSLA125IniyjyKNcoxBbzMQ3Ha0lecMvNauE+RgvJQbKt2yEi3kHgGCrsTEnKjUm5qv8ljbS9fuENfrAeNrtldvZp4fCW2SRUkWqeXLiI2zemObPTr6BKVjoQZ8zJEAgGi1MFoInkJSE9MvbXoeJUfyvudFMw4x/ur+ucwkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SKOzv3Ft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiQZMrP0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SKOzv3Ft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NiQZMrP0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qUZD3260948
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SjKJs+Talp5i5s1FC33zjJ
	TMZ2uKeAJS7dad2YjJSPc=; b=SKOzv3FtVQ+I/avpr+mnxraoXYtZ/lL3/kdQit
	1PH207QgmUcTwUz0w3cNXF4RxF46Ut9XsEf4yEMf8tjaRi69fzSGo2ndYl7GWblK
	q7chxSZEYtZWJSnefp7mImXvNOR+4GjCjbazN1DhmCNccd29d/IfSu4xsgSHVEmd
	kJAU826gBVKA6xQnwy7lRLXfdK1MGXK3346NV1N8gy4t7e7kflOn0uGsa0GTg3SH
	HlemRph0UJHmAqp7kvKbECNKiZgMD7YzEnqTN8WKF2jZ9LqBMgt9FwqDiZhqBh6v
	ChLOHRgDS6W3zwlLECkWO6XQt/WkZf0Bk/OHwkuQwpTxV6yA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkafw1q6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 10:39:15 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486c3411c8so799383b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 03:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784803155; x=1785407955; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SjKJs+Talp5i5s1FC33zjJTMZ2uKeAJS7dad2YjJSPc=;
        b=NiQZMrP0bM+TgDIyzkygp54tJB0qfIBkG03h/7joTwtgwIw8wuSqQxHi/8SYyCqjAw
         2x5AwVqvHpUc5XFBlG+UK7aR7EiG9b3ojqhl/Oh1OesVAu+NbnB/qrubgRduIM9trsNR
         E7ojOHhhJOsCtoCHKl1I3FVQOI4fmOr3QqLBfehwcrqUOoLVhLgqWlh3uJKrjKR0HSsw
         MuvZE/RdCb16kzw5jRHxp3mcNW23JkMvxM9dwVKzPdekmuCRrwnY0l+9cM0FbbHDrNYE
         B40ZdSpQUeVcyHxEDiCrsHCnO/qTzdrWQ3Jw/T5DhPrP43kEP+Gi04R/ThFr3v93i/6L
         OcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784803155; x=1785407955;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SjKJs+Talp5i5s1FC33zjJTMZ2uKeAJS7dad2YjJSPc=;
        b=hW/kJFWx4jYDs7+jCae1guPWiJT7Ahn7TN4KHLQmBQgMYbEpaFA70sGI8zGXudJCt4
         R/1GiuCDFnbymjzC0l9raSGQB+q4J0elqVnyu2yT7C6hkdfOZvS7g0YQa9FFL6qlYq1j
         ikeoSb3zb5r+VpfSdQBCibds1Fr0oknScuWL4/jS7CMEKEmJmBqw3Lca1YzG1UrnX6vf
         pJ3vrujFsauIS1stl9hvPQ77nXyYjdk9jlFNVUFPmtrGe/aYKeXLRIwSs/9tLO7wsFRc
         cCD2BMjVEypPft9djCfCbtoB3aA4vfxg2TEgIz5xg57zx8AMG+UuOAfbzb9XStcJ5pdw
         ZCHw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0UdYZHgjxjCFxK/lsrg5gBb0Xey5GOUBpSKUcqdJjKfjBY5jqZ/V9cd9QDTm2mMmd+vhiGhBEW3jL9tEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzivxymFBPVIxkokjrtsrfcYYSWbTBLa+TxJ87/x3m3Fv2VTRt6
	8qTEce7o1fge5qMprtCeftOnMeeD4+meSyZORx0/nP8R8HGGEhk7WUu0KtwnrtJ//sjlgdB78Tx
	ljUJ+EL0DyHIoprJrdP75cKzw15/9wsXReg5jQV5OnTRi6cDLB1K9tcRm0cjXgqABe91X
X-Gm-Gg: AR+sD10woI51YPY56eChrIZ5ey84xB/I+ELUhl1j5AM6DgqW1iczbMf9LroduJ/Cv3A
	1BCCTufvkceBB+13O9auRnOdQgcpjQBwB2SGKpiWGt17OTyRBwxX8F1sEt9z8HDA6cCvtU/nYwN
	tqwW2exf8Z75MYNyW+NzUc9lkGr8ZRDqQ3SoUeyhpdq2sA5UyoEpMLLxDeFtznOTonGLuN+jkKK
	2tZaAt2N9AHEyfUl1dR0ZMmFv1QMPkpy56l5CNX2PYrF69V/ctg4MpcSV7TOdOdTsTqfmP2blhP
	iDweYzorJggUX17rC/Q4rZ195MojL7LNEie11i1gyRvtPkDqAkUNlm2pJ6EKitDQRfcC0a2K+Av
	Uf7lfMbe1QcvquygBSSIH+mTb5TGvQ9j+JUtgEEBExu2Wg/UrWBfgdxV1WTQNg5rxJHGOqg==
X-Received: by 2002:a05:6a00:12c7:b0:847:902a:57c1 with SMTP id d2e1a72fcca58-84e2bb3282dmr2946923b3a.57.1784803154917;
        Thu, 23 Jul 2026 03:39:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:12c7:b0:847:902a:57c1 with SMTP id d2e1a72fcca58-84e2bb3282dmr2946891b3a.57.1784803154461;
        Thu, 23 Jul 2026 03:39:14 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2864469b3a.60.2026.07.23.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:39:13 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Modify interrupt handling for eUSB2 Phy targets
Date: Thu, 23 Jul 2026 16:09:03 +0530
Message-Id: <20260723-eusb2-int-handling-v5-v5-0-f32ea6c1a318@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfvYWoC/yXMQQqDMBCF4avIrB3QKTHiVYoLY0adUtKSMSKId
 2+qy4/H+w9QjsIKXXFA5E1UPiHDlAWMyxBmRvHZQBU1la1b5KSOUMKKefZvCTNuBpmc9TSZ1tk
 H5O838iT71X32tzW5F4/rPwbn+QOQsClIeQAAAA==
X-Change-ID: 20260718-eusb2-int-handling-v5-e2b7d2f58b73
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784803149; l=2757;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=95aRlnqGGcjXiiM0uMEb3A+wNWlk0AP0T2azwmwkXDc=;
 b=sFSifNo1uwvjssJXARa1tPt8jF0YG84JsenqWOBkD77tPe7VwWU7nWjZNj7bKC8Pwm/rmawVm
 U8KV6/0qz/rCKJWaWVOuUZzqLHYguR50rGUfnE8ga/7ZYz8gcKiLyD5
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Authority-Analysis: v=2.4 cv=XNkAjwhE c=1 sm=1 tr=0 ts=6a61ef53 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xjCIpWma6R3UThYtaJkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 1leNPuUiaZOB7ZCKfEEyVz2xZCGHEbxw
X-Proofpoint-GUID: 1leNPuUiaZOB7ZCKfEEyVz2xZCGHEbxw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXywx1gpTETc+I
 bB7u0NnpelI6REXqV8o0RX/QTk+tB6lWJHu+NeTkd9QOSwtGY3rM9OI0sRD7IG8XY9/by+kQoVn
 dwpV+33YSP7KrroaiD07HAEooRjeZtA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwNCBTYWx0ZWRfXwZWPcUNC9ruQ
 ehvEDD3Wbxh7CMY5j9gCxxaNAHXNzK3apVef8zinVqJUXy2bDi0tJvyaMvDZXWTQDxF0oLmncRA
 QJ/8o6JgAlFmMbCK/KUVj1TBA4dHQfFLWiBt9zlzSJUfed+YxzgPSkJCg4lKmJOK15sn678slmo
 Z8q6hqkttPi7KczBk8KB48SuNALXN/Qs/Td1YlJRfilxHh927Hc8Op4TRweyfWZ3XX3SPv+MhVh
 cMrJyowKnLLuxdP6SgM6sVAyS613TGOSGjRPL+m2/zCLjn7xlRCPk4I9x+Wzcbxb+dt+7m+J3ac
 OOHeRaisWalwDcPzIhoD+wQZcAW2LCZflhHF2h11UI32fxOhw6JvS9ny+uUbOfMhPUV4zB/b3BA
 0dCuOCkLEFMKqalDrzWCbtsNmEnlVEdO8DdZM7HWdHFNK5rua23ad7NHu8vBJM7Lb+BEwqtYllm
 eE4YyoJWI6OvsqGsYJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230104

eUSB2 targets handle wakeup interrupts differently depending on device
speed when operating in host mode.

According to the eUSB2 specification, remote wakeup signaling in host
mode is detected via different data-line assertions based on the
connected device speed.

When a low-speed device is connected, the host repeater drives eD+ to
logic '1' upon detecting a K-state on the USB lines during remote wakeup
(eUSB2 specification, Section 5.5.14).

When a full-speed or high-speed device is connected, the host repeater
drives eD- to logic '1' upon detecting a K-state on the USB line during
remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).

Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
eD- line states, configure the wakeup interrupts accordingly

Add support for a new phy "type" attribute to be set by eusb2 phy drivers
and be read by consumers (in this case usb controller) and act accordingly

Changes in v5:
- Add support for phy "type" attribute and set it from m31 and snps eusb2
phy probes.
- Removed adding a new binding property

Link to v4:
https://lore.kernel.org/all/20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com/

Changes in v4:
- Moved to using binding approach as suggested by Thinh

Link to v3:
https://lore.kernel.org/all/20260511094422.3561509-1-krishna.kurapati@oss.qualcomm.com/

Changes in v3:
- Removed multiple glymur-dwc3-mp pdata entries
- Replaced use of ternary operators with if-else

Link to v2:
https://lore.kernel.org/all/20260505194242.1947891-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Updated commit message
- added supported eUSB2 targets

Link to v1:
https://lore.kernel.org/all/20260502095616.666938-1-krishna.kurapati@oss.qualcomm.com/

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (5):
      dt-bindings: phy: Add PHY_TYPE_EUSB2 definition
      include: linux: phy: Add phy attribute "type" and associated helpers
      phy: snps-eusb2: Set phy type to EUSB2
      phy: qcom: m31-eusb2: Set phy type to EUSB2
      usb: dwc3: qcom: Modify interrupt handling for eUSB2 Phy targets

 drivers/phy/phy-snps-eusb2.c              |  4 +++
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c |  4 +++
 drivers/usb/dwc3/dwc3-qcom.c              | 53 +++++++++++++++++++++++++------
 include/dt-bindings/phy/phy.h             |  1 +
 include/linux/phy/phy.h                   | 27 ++++++++++++++++
 5 files changed, 79 insertions(+), 10 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260718-eusb2-int-handling-v5-e2b7d2f58b73

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

