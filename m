Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF5043B6F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183432; cv=none; b=q3rK7peMEiubTAuAuLISvdEe9W0CSHuzf5Qbza8Ksy7Na8hrr2xh8YHfPydq1uyiswDqc59lCcuvEythOKIh8uStdop/UrD+uoWQ9wc9DVsrwDfIAj0+/qPX5JNbmrwmE7U9gmUBMKkJ+RcC7udrM2/qL9HzxvAmcaVPaQ4Quu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183432; c=relaxed/simple;
	bh=nbI13m/StU8b8bZ11kywO1OROX66Dspe4XXmpDY1Pig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cQBMt5VeSMpZ75YDTfd0CB0pHqnzCvywQwO61x3KDAVK3QDt4KZ9o5gk5QI9Fa1rMZ+0GKetW8iK8dO/vxxtQ69GB45uokcd9ALzpVqmnM3Dh+5UxTBZ1Q8YSZo2eIeRZ/KfIFyIMT3NX/2RgePpoDZ82GVW1WGJgjpG8B9r03M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=emPtKRK2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KGZM8ZrV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="emPtKRK2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KGZM8ZrV"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VBAQ7j2763700
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:37:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GGvmEtrf3r8j9vw/t1qgIE
	OjG+THa4qhYcz64m3UBgo=; b=emPtKRK2c+enF90aBn/VFm9G0SeHYRbjnkgh6Z
	KIpcsMclVk49nlW5UCD+eEPXpoBpNi0XBzdBa2r61VYkZo+4g8z7LIDIXw/rMr54
	oJzwW6fLPV70tETB9UoXwe0a/7BNTPud3JtyDGy4HXxVYRwwUmK6O6COlbfGbU1W
	+58SBqbuWJecbzkZZ66zNekzi64taE/WMUPhwAdkz/cEQ8eSb8RPateI0XeXT8fv
	0OvHpJa5SpHrRrEYHtEzm+fgEj9impoiU5jEGcN2EZMh+79KhdwyHYfsjE9arZfG
	8GRoiHQ2VIa5BoXaAKgeEqmCWkdIgF8AU9+MWgF0QQQAxwiA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6vcs24g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 13:37:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-396901263b6so5488920a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 06:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788183429; x=1788788229; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GGvmEtrf3r8j9vw/t1qgIEOjG+THa4qhYcz64m3UBgo=;
        b=KGZM8ZrVRwVYmnQsderCCRg+2sOBnqWAUyAn78geXZ+FyUk+oxG0mmgE3Cgr5qYGll
         DmWHqd/k4kO+c6xxcmY4I3uDN/rE0mO1z7h1XX2RqEB1mnxcnXl/NA1QWY93I9dz1mPr
         rtGjzwTDTXumA94xB/AI7fqMD3QlqNXPZLyuASLarGlAvAFUXLrGpKPqcaBmKqPKdMn7
         lJRD3qDoUwRDKdwuKwMeEoFHSyLXvZWt9/7iAo7ECGz8X/QtkeUMn2ead71ySGkkx1HY
         +8W2Vs0XFC3cCThxkqxmP/rNE3BAPCoSpoTAK1scRZquIv3XPhNflvMhCSfR010EpyvT
         2CGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183429; x=1788788229;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GGvmEtrf3r8j9vw/t1qgIEOjG+THa4qhYcz64m3UBgo=;
        b=CXGvV7lY3ORuolR5gDjtJQ/8Yjyd3n9DvEdWhoyvZa0zdWAeU8o7faw+aUb73nldEC
         t8i4WcLs2lA9s5gNBpZsm7mebyF1kiC/9nc8IexNnNZnaxeTcN06SuJwbLkEa9B/KcNH
         j7d+K62bqps6r+HQ7ZxdQ0wPDoRMnI45PwobpwH4bgawZtPPTWWcqeYxRwmpjRDTBHT2
         LzNOILAG6F4opEGaW0inIvXAELZxmKGUvNim4lUPqKD8cn+1QC1SSMD8vqrrkkWWZcoT
         qwfqNLXNKmy7WQyvVi668Z0DckxKzCdDPN8tlF2jmdZdcbHjFhRctYVsXY3Y2XezykPb
         nKAQ==
X-Gm-Message-State: AFuF++lbv49sCh+OrRhExJWhmvu88Phswha80n1r2VKtx2xAh2aN76OW
	Y4SJKP4SRs37BFcnmi5/s0QLkya5GMkKkCtiH7iT0Yuqnp13+ZttWWZD8QX2Yv+uELdBboBeK6q
	VYuFzc4PuX1R9z1Ved49Js0m2NG/UJLivPkqxRa6pkClbuc9dKxBWl61dZg5xxbeN5E2B
X-Gm-Gg: AYBFou2Z/W+ewPCPcpZg+RlCqd/QrNbkaiWHw8V7TjegRFVj8rQRlGDU3X6zRsYSwAe
	6scW33qGY+SEdo2DN66/aRXG0v1hvB/LjcyyA3n9s1enrFtSYXgrjFr5i7HR5YLoL1QdP3ZIR9D
	5q1SCe5H/JFYtSRyxauwIUlCFt+bGWu2je6qMUJuoCnCgrsc90RcqC2LeWwqbTKvahM/UwF/wJb
	YN0T2Tth2/y+szej86Bk/8YsYO6pin+jp4B3D9924cinRLJ+VogM/loRQ/2BJKcYUuyxpwunklm
	z88P++TDwwZgiib+zWilII+FdVOQdcyu47es4k3mH9YN4gZh76Dq4l91pfQBHzqm8R2IpHG8B6s
	aFIiItIYcsVqtlKC4hxWG4U52nXyc8sWefA==
X-Received: by 2002:a17:90b:528f:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39907e113f5mr1208473a91.16.1788183429285;
        Mon, 31 Aug 2026 06:37:09 -0700 (PDT)
X-Received: by 2002:a17:90b:528f:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39907e113f5mr1208384a91.16.1788183428726;
        Mon, 31 Aug 2026 06:37:08 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm43323985c88.4.2026.08.31.06.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:37:08 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 19:07:02 +0530
Subject: [PATCH] PCI: qcom: Skip system suspend/resume for firmware-managed
 PCIe
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-skip_suspend-v1-1-ba2d877e22b1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAH2DlWoC/yXMTQ5AMBBA4avIrDWhfoKriIjWYEiq6SAScXfF8
 lu8dwGjI2SoggscHsS0Go84DEBPnRlRUO8NMpJ5VCSx4IVsyztbNL3oMqUzJctBJSn4xDoc6Px
 2dfObdzWj3t4H3PcD+QGWL3AAAAA=
X-Change-ID: 20260831-skip_suspend-a5bc5b29fb34
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mrinmay sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Rashmi A N <ayiluri.rashmi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788183424; l=2084;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=nbI13m/StU8b8bZ11kywO1OROX66Dspe4XXmpDY1Pig=;
 b=DwHFxvONOcl3BS5GrIZb2aKOzzbydp94yk4fACGz1RdNlgoKugek0XmhGYeumAPtACD9bRf8U
 lPhg9G2CicHCpSGYdz3nrn2nkEtsgC/hAm/JFS8AlFous9WA1dPXiHG
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDExNyBTYWx0ZWRfX0UeodP6EhgWI
 4A73hP9fMgru/8/Tiiv4RzT3uhS6UC6/ksR0ijGtXmxPHUIE+D4GhnN1sbPEqiNJY8l4Z4lj3P6
 mt8ChwWYFYFKR1Vknw8vxE4UuvJoFOJ5uKqEQC4z1sfr3+K0zxHy9dkXTveEAXuCDMo/l/8TKUn
 ApGQLE4XpoKEq2qFnYNbUoae2O5nDj/SZkq42xUpUf2d1iztz86A/L8UGShFZfclQQ7u6gdKmcP
 Hre+R67yQSokVaLZuWZHI1fufl8ierhs4eve7qD4cPnFsmzTCS0p8iS94bukDnJJ/dR8ye+eA+y
 vb3O/w3CSbO9e79XNjQ2JaE55ZOjsSp+YuEI7/V7Nv/ytcyeHhfLDDJrfyuZm15un1ByNcsBGz9
 oLGHCWsVMa1hbjKgR++R9ubWzVFcD5aVAK6a1kalhFIUAYidncNiXFHk8gc35JZ9I+O3w4TKDa5
 OBlFPNDRUAAfy6Fuz5A==
X-Proofpoint-GUID: CsyDLqj4_mrG72v9lcKNUET3ZQ4XyXeS
X-Proofpoint-ORIG-GUID: CsyDLqj4_mrG72v9lcKNUET3ZQ4XyXeS
X-Authority-Analysis: v=2.4 cv=Eo7iaycA c=1 sm=1 tr=0 ts=6a958385 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vTU8PHaab79fjezaUvUA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDExNyBTYWx0ZWRfX1kEM4fXKM4eK
 KPuFYLWLR4cXV2Z9Wfs1Quw/BoLZRPiGUr+MlUvt1EdbbiyYtOwVDHwAyPoLzmUcBAOb394+Ej9
 pGmMRRIdwpdq8ffbWoDxzMDXSaz4ijw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310117

For firmware-managed PCIe controllers, all resources, including clocks,
regulators, resets, PHYs and link state, are owned and managed by
firmware. The host driver must not attempt to manage these resources
during system suspend or resume.

Skip the suspend and resume operations for firmware-managed controllers.
The associated power domain transitions are handled independently by the
genpd framework through its own system suspend/resume callbacks, so no
explicit action is required by the PCIe driver.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
Hi,

Firmware-managed PCIe controllers rely on firmware for managing PCIe
resources such as clocks, regulators, resets, PHYs and link state.
     
Skip the host-managed suspend/resume operations for such controllers.
The associated power-domain transitions are already handled by the
generic power-domain framework during system suspend/resume.

Thanks,
Mrinmay
---
 drivers/pci/controller/dwc/pcie-qcom.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index b58a607b713f..56f0d039e36d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2341,6 +2341,10 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie;
 	int ret = 0;
+	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(dev);
+
+	if (pcie_cfg && pcie_cfg->firmware_managed)
+		return 0;
 
 	pcie = dev_get_drvdata(dev);
 	if (!pcie)
@@ -2399,6 +2403,10 @@ static int qcom_pcie_resume_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie;
 	int ret;
+	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(dev);
+
+	if (pcie_cfg && pcie_cfg->firmware_managed)
+		return 0;
 
 	pcie = dev_get_drvdata(dev);
 	if (!pcie)

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-skip_suspend-a5bc5b29fb34

Best regards,
--  
Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>

