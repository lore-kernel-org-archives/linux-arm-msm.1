Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0766D4A5EDC
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155458; cv=none; b=lUuQi8+mK8IFZ4TWUDzcOxZ1UaDwrrpNPnebDscQLcACNCvNLBStl3ywoPYw7aP5XV9fvtvGRpWbsDAZjbQpj5SGuZAXVifut+oPKX6uymVNrloX/jJCsjUeHXpByG00HHOFsMip3E5NmsGaRKGMujIXQGSwhjp2LQ3x6tH7bZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155458; c=relaxed/simple;
	bh=cLOybjYHCQvvw5wwBKe6pH7jh6gVXSd5dIMqBdQIGhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvXDB7sWBc5eezMKcCjuxkw8FpNUAUhBNoQZppMouQOMp6K5MXZuQvora4p1S4gv9elRjHh/oUV0kdCPS3d/VrO13Q6pPGkRMRUt7FLdS1n2M0KwzB1qAkH+mXuTE6J2CEArm7ZD8kWLFzck/HQcjtnJevFK+fs16uqw1P+l+qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IoaqLazv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JlCPe8qP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoaqLazv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JlCPe8qP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAATZ73069372
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:57:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4BRKa4/qcmK5eNR5mJGC0017NtZsgVMDiU1xJ7wXN10=; b=IoaqLazvSatn5KXX
	jztR9O3qiCmUC9ThsRLZE2+JjTESQMwvAaF7EpoWqXNWFvu/L4P990T5WLC5n0IT
	pX1bp4A1oKFeNCWZR9BipKNK5bF26jSCCucNr73nEkvoqgWGpE+edlkQvXx0Ozx1
	OPJwkmItu8tavAXmjuvrGxXKpEKBmg135etRNz5GlVubB9azll5+8nbUDloz3Qqw
	LcKnIrg7E0c2xmgLTnX4VyS/3+s/p9LdNbjJIkVxNV5op1c6NH0MjNi1wWPKIu3O
	ayj2NOqCKdu68JaW1xqS5RTceCsr6OEZ9TtuAKl0dW12mG+S/ldD10y0n/zo/dhQ
	coGoEQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262cdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:57:36 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-152d1363a29so22654901c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155456; x=1792760256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4BRKa4/qcmK5eNR5mJGC0017NtZsgVMDiU1xJ7wXN10=;
        b=JlCPe8qP6x+Bt78WUdiUQ9bhk+hLKJwdoBASmCcUj0ju7lUIKUS3tyWHwAJ/e+v8bH
         aSm5MU1BdRCOWDjPh6BqyfxchBNtZqXYxzxis95UZiKgiuPG/KgKX1M2ofYPwcSjlK2E
         S+ysopAMdURxGEbePKqDnzZieSwXIF8vqmO57qqwXBRTMzwcnEzOxUr660M5ehl/kSOX
         R0nLuZQ+crOV++T+K+YlHzZ6+GIl5DLdtD44LtT1tvbzvK0J7gsSQsJkYd7EQDxY4lBC
         YcdrVilM0vMvP0XnTdZcw3Mi3iCEDfGi4+AX7JvitCp5Dfy+e189WBPpoQT2UocFE4hP
         VGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155456; x=1792760256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4BRKa4/qcmK5eNR5mJGC0017NtZsgVMDiU1xJ7wXN10=;
        b=cv/2efcdYO/Ofco7jrTYMxEPmOn1kiYdVOgvN3pzIj+7l3FbVh6lyDDPRppoU+2o3J
         3v39vDCTLw9Dd9y2ruhE2n4d6c7nWd/aOdTrkD5qcslA1MdUax8uaswiwQdcBCR9XJH2
         T0UA+gueT8qegZT28Y5WOedkE2cyvKjGiozqQAHaBslup45fYl5xfqoJbsncHZ0NbvYH
         /+FEHyg3TNOe4By46PmM45bNzSsByNV0cK04Gik6bX5Rt0sSnCzjXCLL00UZv+nvk80v
         gRfVN45nbDJIXVMHAO256agaSofQQYyxpjwBBEh2VCV5+Ne8fqqMbySNCw/2cCsdtEev
         Vw9w==
X-Forwarded-Encrypted: i=1; AKwUvByhiLr7wdUWlb3iaIZKVfovIltftOsAkF2TRp83dkkhQ39UFKCHlhjJGuPVxV4GzGWVFASD8LvyQxpvjrkq@vger.kernel.org
X-Gm-Message-State: AFq9FYLwMLB/J9UABPjApZnxdSNPJ46R4gS8xrlyFlXM77aJeyhFU+8m
	owF3lcLKOp9tPAvWLywGqjFo9Jr7D7+irIeuzdR5ItfoO6AWSc68rPJtMPIyuoJyk/Yz96lkL76
	FN0DCX8XyzLKEN6T84h3kHeVcfJ6NqCNo38vaNBce90l2yDaMiZ5OTMXX0EhTtOteHJeU
X-Gm-Gg: AYBFou0yszrt40BblKHpipEUl48i3sSwBo9PsBzsSEY+qs3F7eWp/dMyBUqtbvsZnwL
	XT9jvnAtqnVZiQ+1CtQY7kvdB6nfb5fe5Dy4BCd8Tu1NGV5rNQcZ0DbI0af8UXVtPyS7evEkgdK
	Z0/8CxeauZB/X390p0uIy8RKZXTwWkDb9ae1GLu0FlMd8ZhwR5Lq1lhYuY4hIPuM6tqxGhYBDjE
	LHbtGxjLLbl4r1B24VZ5pUHoadTSX4h1J4988t7BCHiBOTTNQGj9KqbO62R2AF4kf7cZsn9u+XR
	/K1/Xp1ehtaENlwmfPc9w4YiKsdiEkqjmo3+2qKQpbG82ZIFORNFGzE9NyKjuW/8027PogGE67z
	DJx/iHbAsnsQDt3XEKFrjU01lZ73sjaYXVg==
X-Received: by 2002:a05:7022:29b:b0:15a:9834:73f2 with SMTP id a92af1059eb24-16a5fe7c16fmr32012263c88.38.1792155455281;
        Fri, 16 Oct 2026 05:57:35 -0700 (PDT)
X-Received: by 2002:a05:7022:29b:b0:15a:9834:73f2 with SMTP id a92af1059eb24-16a5fe7c16fmr32012229c88.38.1792155454681;
        Fri, 16 Oct 2026 05:57:34 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831996071csm6188285c88.9.2026.10.16.05.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:57:34 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:27:20 +0530
Subject: [PATCH 2/2] PCI: qcom: Reinitialize MSI on resume for
 firmware-managed controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-pcie-controller-reset-v1-2-51779736cf12@oss.qualcomm.com>
References: <20261016-pcie-controller-reset-v1-0-51779736cf12@oss.qualcomm.com>
In-Reply-To: <20261016-pcie-controller-reset-v1-0-51779736cf12@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792155441; l=1653;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=cLOybjYHCQvvw5wwBKe6pH7jh6gVXSd5dIMqBdQIGhA=;
 b=u6CYb1nS3ZIWANu/Ndou484Xr1UDbc8DADXKWudJjpdWVOUhWgmB3rhPXIvoMs2A3PzL9pQ4q
 Llg1CZWl39cCsoODoA+EY9zMbsPAsjJBqd2HsBLmJnP5LC4TcStaH4k
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad21f40 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VdY5-eERFFFFdNr3g4sA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX/5tXqLiI0XeI
 CqEIjwUWJtWX8wDLGA/0qMhfyK+NslyBQMm6tgOdru4o34vs+eXdFZrEKnIh0v618KkB4KoAWkt
 OhhpnQK1a8b5+G/VuEAecdsPn3IYor/4iQ08xU1O64jhgqTWhFTnUgu5lMOZv6B4ATsTAHz4au7
 r5kfWyc9adIi8uL9WYWMP1YR49/wZr1BdMoXD3964jrGav4rsZdHD7NIU7ohTa+P4NYmdOCULU6
 yRC09c+jwaLvCEiy1FjijR/9iISCn2ME++CuItiqbW+uxCxXndVLf52GJAThkTNdyjXWQLyh1XN
 xcIDFajAdZfNXPrbV/Qiz68qJGYquP7LqJdARJNYKC1wIU82K2R9w1U9vynMvmy9/qFjQD1TNvJ
 xxK3HfFFtMY+N3u14HdCzXZuSM9Zqv8ujX7JnhE820PYeu6GCgLxVU+u9qqr5IikwZq8kM7muMN
 18qLOSxctqzc2VvMsEw==
X-Proofpoint-ORIG-GUID: mESUsbaWuuXkfCT9rjE_7P4PR3W2rfBC
X-Proofpoint-GUID: mESUsbaWuuXkfCT9rjE_7P4PR3W2rfBC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXy/3tyvLVCziT
 QvGWmbxiXwqfnoVrh13r2uOhoMqHxErej/3ubciu/3TcFOxHEpw94cltuo0yMf5f80IEJlGr2Qh
 ojZg9H0/GXxvB0bVNkN+cJ5qVgucea4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160051

On firmware-managed PCIe controllers, hardware context is lost across
system suspend. While firmware reinitializes the controller through the
power domain framework during resume, the DesignWare MSI registers are
not preserved across the power cycle and must be reprogrammed by the
driver.

Retrieve the DesignWare PCIe context and reinitialize MSI state during
the resume path for firmware-managed controllers to restore MSI
functionality after resume.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 744455ae90d4..116622843d2a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2324,6 +2324,7 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		bridge->ops = (struct pci_ops *)&pci_qcom_ecam_ops.pci_ops;
 		bridge->msi_domain = true;
 		bridge->reset_root_port = qcom_pcie_fw_reset_root_port;
+		dev_set_drvdata(dev, cfg);
 
 		ret = pci_host_probe(bridge);
 		if (ret)
@@ -2551,8 +2552,14 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 	int ret;
 	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(dev);
 
-	if (pcie_cfg && pcie_cfg->firmware_managed)
+	if (pcie_cfg && pcie_cfg->firmware_managed) {
+		struct pci_config_window *cfg = dev_get_drvdata(dev);
+
+		if (cfg && cfg->priv)
+			dw_pcie_msi_init(cfg->priv);
+
 		return 0;
+	}
 
 	pcie = dev_get_drvdata(dev);
 	if (!pcie)

-- 
2.43.0

