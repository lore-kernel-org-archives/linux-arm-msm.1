Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A63B2D18
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787549715; cv=none; b=TdLg/7pLGTSjvBdgf5ANIqJcn8KEJpxf6EmjsSzBLNYJorF2F2fNyP+S6HvJIhF7KGTc3L2BvoOEODNViRL9G/B4wZy9PQSM+AQbG6+REY7jFcm7ZkIvAIFsx0gaOb0J1N7gpBWjg6YuBe1WpbBriQuzOOKqDaCV4EzhUV/JEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787549715; c=relaxed/simple;
	bh=FEpgr4DpokD/ru+VDPieVlGjiUmp15iFP2mJXKz/ICU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p6pwUAAc7+4EFIVHoaLBWvJNrzHisiw1TLODZ53NVXH/oFr7/hMT6EQSm7USnIERznT9dJeACtGohiSmVrE6SjxjbtB8hex5+asWZMYgY5PoE5gVpwe0T2BqnwXMWVsEMclkEkIlnXHbCzl1QIMJDMICtGHgLvhicgwVI6/T/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KNVoGAxG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cblu5BL2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KNVoGAxG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cblu5BL2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RC8i3066897
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:35:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jG3Hgyk7P1A7+B4l6oy9D1
	dles3YcASNJ+tr/p4S27E=; b=KNVoGAxG3sYf7VYLV5zTgIl5N3EOx+cLfAJhu1
	jsns+W+Mn9aBJ4Vw+ujkkvfMHmDIPGvs8/QjpWMNpqtInw1PatNasw8ubNDGSnRz
	VMMhe+KJ8ZxUtQGkwm1vqCqwYOp44I1Ct7WKg8cAwS4uJEp6BKvoEgL5L8Ke+Z1C
	4B9DFqagZPVqXzf/H7SE4oLaC7fh1zXmri4fIpwGj58H4Ppvetl+KhDikSms4ND2
	WtgtoQZ1qHbQ6IDtZoht+TBI4qDMgBVJKHbSTVCqVCg/MpHmtx86RUwN5yszr+Ii
	RUFYh7jKEAu92gmFb69VhlkFnW35OQoj2NkVSulyzb7vCjTQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpgyet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:35:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so4860716a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 22:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787549708; x=1788154508; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jG3Hgyk7P1A7+B4l6oy9D1dles3YcASNJ+tr/p4S27E=;
        b=Cblu5BL2grLMnARLr527WAvjN5yPT1LpTiaomHBRSsG3sCC/pCUbLtXBIyMnR3kirD
         GBZ50ruOU3AmvV72psUPaV4YyOEcJ0TcBLYenG8kAi/OkcfyqIX4uPpvMxWX+5xioQng
         LBYsvi5LclFu6yVZMPThPLZlG2iioVuWph6eNoZ176BNDcNt3xuxfA2v40I9fq7AUDo3
         vCgui2lsyr0gF5xYkx7deVDuQNhKcqx7+ugCBjLFEMOsTokLU5Ngm6foUOsgFHP7yhGs
         dhdc32saHf3MlalRh5gAb2uIE+TM/TRrklxLY8N6l94f6VvcNESpP+tadYgx1EnKvsis
         cDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787549708; x=1788154508;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jG3Hgyk7P1A7+B4l6oy9D1dles3YcASNJ+tr/p4S27E=;
        b=oqPtbu9uKCdRBSOz5E84Deuvit1ZFvr4Ytt/JajqJOlknwJmjUh6rNQRuKMLeN+x8t
         cx6Wt9oUb25iDcJ7XBaW2Dl1GBxocRLNzaBzxDy9NpJ971lrOTFMtXO5uvg0rFLmwrZo
         waakpvRmm1boVo2WLnMssAeg+Or2xxOXmHOZARR4CcbX1QDwtInaTYN5uNQVZTzZ23TY
         ubA9MwviAtq7Hj55tcYXa7A9/BUIX57irD+WgHKV+gSQLvszNf3W6/Esb2SkMO21we0b
         ohN52IXKrrTC/2YnI7Ed8QVG4PZTrLPv00bvam2D09yj/1eurWtNOho1IuWSp982AooC
         6owQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpa0yjdBxX1NvzSVTw0c6DZp+vfZzM9ArysLcxtKSsaCAjzm8iqtmFV+PyfWXkQb5h5/b4phJvBiuR0Nrnq@vger.kernel.org
X-Gm-Message-State: AFuF++nm8nRs3f8106mDRBmqqO99HXrBSevSlozfFNtEP3Got3I8WWlH
	PIMwAz6Atba0cMCsWJo8B509ueEYnZZNN7UZeYJSm9DcIlsm3Czw4v5XaRB7s6XZGs0wH9tcIgH
	LiQy6e+xi+9+Bou7QIhKOF4OPP9onDLftz6sw0chle9maVkiY1B0Aa7JvduMjgoifk5qr
X-Gm-Gg: AR+sD13ZdtEXiyw49KtTped9LcIqVX9bfEC51Cc/qsUvg0Ou4HS1n7fqDQw1P9qfh03
	pprD1oJMJWswmcTWQ3zLpzUb2U6FPoqiKa0yAPPKcY8o4syJnn57zsmDx096v2ZTlPCCXC5ftRk
	JjVRsDqrOU+iqNZsoj7QrwPH8N2yhXj6wgkJNuGqm145HwjdBvau9okHv4IXYXBKkimS3gASANy
	hu7zyVLTd3YUnZjFFE4ug2WNwmYi7uAIMHYUt4JtlMGc6R+wQM5yRedHLtCX2qoJEtQAgb3LjSc
	xjAVDXw18Ov6ILzfSueaDt94MD1EPMa0IDO6Tl+TWznAFaIF5AFdx71IdcNElxk4kETEY353tJM
	32D5OwUnZcv0pae5xYpwirJLsZ9/sBloZONk=
X-Received: by 2002:a17:90b:4c84:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-395df2595d4mr25232257a91.9.1787549708038;
        Sun, 23 Aug 2026 22:35:08 -0700 (PDT)
X-Received: by 2002:a17:90b:4c84:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-395df2595d4mr25232189a91.9.1787549707625;
        Sun, 23 Aug 2026 22:35:07 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327ff728ca7sm20166492eec.3.2026.08.23.22.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 22:35:07 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH v3 0/2] PCI: qcom: Implement shutdown() to avoid SMMU/NoC
 errors on reboot
Date: Mon, 24 Aug 2026 11:04:58 +0530
Message-Id: <20260824-shutdown-v3-0-81c14bb7a1af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPYi2oC/22NwQ6CMBBEf4Xs2ZKyCKIn/8NwKLCVGqHapVVD+
 HcLXr1M8pI3MzMwOUMMp2QGR8GwsWOEfJdA26vxSsJ0kQEllrJCFNz7qbOvUWiqsvzYaY3NAaL
 +cKTNe5u61D9m39yondb+avSGJ+s+21fA1fszG1BIUaBUZaWzZq+Ks2VOn17dWzsMaQyol2X5A
 mxL3Um5AAAA
X-Change-ID: 20260822-shutdown-fe8139dff2b7
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787549703; l=1640;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=FEpgr4DpokD/ru+VDPieVlGjiUmp15iFP2mJXKz/ICU=;
 b=qVCBDniZGpDpORb3ZKCo5I8+lRiMtuxWig4sylyQcDqZ7mw5vgQiUzoxwm5GaHbnpAAv4HJSX
 NydSRGgr+6tCk6SNPQ0vn4YMy3nr7bQm/9bT2NonDjn3BAL/agZhlEo
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA0NiBTYWx0ZWRfX7HVKnYGTfNu3
 ZNdbRw/qDIY6cFhE+7VdXnQAndLZBNQFe4fYSQfl6V501WVHmEOp1HLm+7umxlmDRjqOiwENDJR
 CfkemEOHVVqmGQAm6AUswHUh5didVX/6HNxLcLeuFl+Io/yqsxejJMuvdrs3OgGKtK3eTcwb9w4
 /30szFwVhgywEzDikeFndMbjwKxXWsY1o4XcG2ghr2eBwnGd4NL6SwZX1d4y8fy2se6flV0AH8R
 bZadVzjF1VXS6GDT7363oBHeGnfkUtj7JyueN5vkBuhwxH3K65a2AYG1qmSRc4A+TVyZTMLW5q6
 sLZLdnRVUrjUF5N+6PGaOBad5kMivwauSEUlNlxK1OiNvhzbmsNEEkQiwviUe/sTdFVasg+lVPE
 4LgWiKlwI21RLHv0YG2gAVzOVZw5eM/TtFJdNgsNF9aCCKwKUlGQ3HXgcLAd5zZ9L9crIaxicEm
 OZYZBp7VL+Da5Gx7qgg==
X-Proofpoint-GUID: pQqShNMjPKYeTBMieHPSLfychV9ss-nJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA0NiBTYWx0ZWRfX4UTCGIHHAzLn
 4Lm5YA5p3hsry2EyzVuv0TwZHqnFK/q8zmiDuZRYKkHK4/QWwMWpC6i24z7Wo3ocy+Ou88O6zjK
 uJMl8mYS2k4+Afxe0GElJLSzyKz2CYk=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bd80c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=RZHP3SvTWnTKgiXxB68A:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: pQqShNMjPKYeTBMieHPSLfychV9ss-nJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240046

During system shutdown/reboot, power/clocks to the PCIe controller get
removed regardless of link state. If the link is still up when that
happens, it can trigger SMMU or NoC errors.

This series adds a shutdown() callback to the Qualcomm PCIe host driver
that forces the link into L2/D3cold before shutdown proceeds, reusing
the existing suspend_noirq() path.

Patch 1 makes dw_pcie_suspend_noirq() skip the D3cold capability check
during shutdown/reboot, since that check can fail and leave the link up
if any endpoint hasn't suspended yet.

Patch 2 adds qcom_pcie_shutdown() and wires it up as .shutdown.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Changes in v3:
- Added null point check and use pm_runtime_put_sync (Sashiko).
- Link to v2: https://patch.msgid.link/20260822-shutdown-v2-0-520a68f1b4a5@oss.qualcomm.com

Changes in v2:
1) don't remove the endpoint pci dev's only keep link in D3cold.
Link to v1: https://lore.kernel.org/all/20250401-shutdown-v1-1-f699859403ae@oss.qualcomm.com/

---
Krishna Chaitanya Chundru (1):
      PCI: dwc: Force L2 link entry on shutdown/reboot without D3cold check

Manivannan Sadhasivam (1):
      PCI: qcom: Implement shutdown() callback

 drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++--
 drivers/pci/controller/dwc/pcie-qcom.c            | 12 ++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)
---
base-commit: c1366b72ad4e87be60b57b74635a3a0bc58d2b0b
change-id: 20260822-shutdown-fe8139dff2b7

Best regards,
--  
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

