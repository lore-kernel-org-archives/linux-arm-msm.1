Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434863DD52F
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 22:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165556; cv=none; b=T4+Ohb7ZzslKo8ZVxN9e0/9jUFlW2JnCNvWR5PjsDwlKqSC/WxSQA/1c/+R/iVfUCVeMpuVLWDm+uSmzcOk2mKy5z8KPaT4DkhF1oZXngX8GqDhBaXmbeOTwh6hxJl18pE02AtJj7NP1eTY075abt7fKbk6D+9MnrE3SxHwODWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165556; c=relaxed/simple;
	bh=ZL2A2cFHlRhAKSuQ9oyrYwVIfm2ZzCci0b8JvPtYKrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=W0FEua8HfL3OF8AVAIvm9+YVO/+DJ20cJcqKYUaVJv99vGDHbuTDldLpkYvZPzkvKz1IgjZfjVETOfzB15Ifp/FmAoFb6chMD17MW4XClrNOXz8nILVtClVwKUY+rMhvURX44DRe6yu/EE4ayTvwDsMhjrPIRmmNuL27M0RLGHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nz4fFmc+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XluIJ+te; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nz4fFmc+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XluIJ+te"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWdHh972171
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 22:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zrkXTFmlVQPcnpPC8U/nG2
	oDFHYiPrW26FCuVN6FIbM=; b=Nz4fFmc+3q+4nYFt4RGFkV8rHsuq9n7y0j/sT9
	6RBjPxeI7LETEmQx0wMaKjK5zN9HbHV3qWtGgXdaQweVtAvJkoy4jfQfBPurC9OE
	D4TGEi930v87yr864sGf8EI6Q/b8ssQ3er447C2YMnr6PoLar8y6GbBe2vUWIBZd
	U56U7UP7axarq8JU/UwW12/Hl84C2Fv5RAhwkmxmaCUBAo3PVdTWR64T0ZCuodKv
	xUcth9ZfBDiqv14PkaEVnDycK8PVEVVrGSCQNCLXi2gtaEZtiGZisYXhOO2jatss
	ZvV32ym29jvOUiMKwHMtmnzqPov8GqH/aWsI+9SAzEZ+XJlA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22sj7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 22:25:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088203so1518423a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789165547; x=1789770347; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zrkXTFmlVQPcnpPC8U/nG2oDFHYiPrW26FCuVN6FIbM=;
        b=XluIJ+teK8PgecRI6E4g7itV0x1ylRj7WB/XH5wmbeqCR4Bf/OCtXn6U38P4D7RyXW
         7bBbgu3TSddTN+tkmLQLQnpFC/3+w78Bp1UtSUp3Xdsoq8xFj3OPjx0Umc3my5V2sFfy
         nIA8GRfPGIn3G8HE/KIjdwPwFPmxcSQg7Zizqhi+hVzcNET7bBcvmdtO2jDid42UOXYC
         fjKZVLlyXq9+FuI+SCE7knjdh4b1KHnqMZ18r2hiK4hXWweY+2ZXB3/fdc1kzdr26BJI
         fvuU0iJZVOo9ZTF6F7rqp+qwMxj8Yygl92KQ9/rDZEeyipa81XtI3R1vzpjFKsPDVXM/
         AH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789165547; x=1789770347;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zrkXTFmlVQPcnpPC8U/nG2oDFHYiPrW26FCuVN6FIbM=;
        b=cE9wHQ/sU5aRyEcNRzD4aCdHLyb/pBHVEnyUd3xc0rErQinqcxz0To8+Gqjesh50U+
         gsUmtSEE2VcARPWrQwKF0hoDjb/I5LTAoAmuav4vi4T+TsfOj1+2rJYYxpwXmuePyWVb
         flOCd1EVKydt2zqpOhsVYIbvPu3zQaC7zI/5kd2GO4vGeT3P7admSSVFlXaQqpl+qdWa
         cbVuBBatOcuddJqmI5YfRyQZZEGh8HhD/NE+lDpAmY991lbp62QeWLT4vsojUAsPulCH
         NCWVKn36g7EKW7SH1mdTgqh2cUMGgE/WbMiquPrsmjDyD5d5kju15HRVEnKpIR1/pVoZ
         QyfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYyLI1/9ciwLGwTdD6jqk0BzPy4RXQBFXaHU4LX9r+M4As/VuP2wWEkAOmDvFw7ZGWH/qHVTnIc+pc3WGz@vger.kernel.org
X-Gm-Message-State: AFuF++kqoTOAL9jNwpi8HL+FH9SxDfkmg+8mQillnCgXgLw0wueTKM6f
	HB5M/MN419lhPQoiDK4Mz0XA/D7gpe6gDeWWWVlBoHt4MzGpMWwReio19yfdlZzHSHYbN+KqiRr
	uKU3aSy+r7ftYYhjrdM2GHWHtkOQQ7wbzlEfhcIyXMvMIKi9BTc5QF7w1X82aYjRQkUZl
X-Gm-Gg: AYBFou2M1ook+A7gFDsYy3rSU0wwgmMHmFmeMNJsZtuESylPxHnIoeI7QHnmFGYTGau
	sTcBuCjU5dRd9vvdMAe9IvC3qPuSjICOiD5ucp7tACqdZHG4Oow6zlaEH7daW4n+jdBmeNmJXiv
	IvKJzNb7NJsDP8Eje+7xqRL+aejRBu1ePKuMME34qheM6Iq7Hchxn7dFiTytYiMMPjgyE3cEnUQ
	s4v1r22iahiCX02VU3ShnqK5rgADDaUwRHlEJtxcu+sFzT9fB5jz62RbtR/sXbUX3mtuhzUoODj
	krGgpaZEygDXFrfHg9rOgyZWdh85GrRmksPxoOg+506rNsjCybHabjnoouUaXj+gqJOwKyCTUFK
	vnPFzOpgkyABEN4HY5iHicTV6a5zpOG0=
X-Received: by 2002:a05:6a21:138e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3db0e48256bmr382370637.28.1789165547004;
        Fri, 11 Sep 2026 15:25:47 -0700 (PDT)
X-Received: by 2002:a05:6a21:138e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3db0e48256bmr382332637.28.1789165546468;
        Fri, 11 Sep 2026 15:25:46 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm9213321eec.25.2026.09.11.15.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:25:45 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:55:38 +0530
Subject: [PATCH] iommu: arm-smmu-qcom: Skip fault-info reads when suspended
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-priv_call_runtime_handlers-v1-1-fc0c3a17523f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOF/pGoC/yXMQQqDMBBA0avIrA3EGCt6FZFg49hOiVFmVAri3
 Zu2yweff4IgEwq02QmMBwktMaHIM/DPIT5Q0ZgMRpubbgqjVqbD+SEEx3vcaEaXsjEgi6qnsrJ
 1Za22GtJgZZzo/Zt3/d+y31/ot+8RrusDGsMagn4AAAA=
X-Change-ID: 20260912-priv_call_runtime_handlers-7f3547544040
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789165542; l=3706;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ZL2A2cFHlRhAKSuQ9oyrYwVIfm2ZzCci0b8JvPtYKrc=;
 b=wtl28Fbdd6qYisueH5Nk753b3YTVUJyX0jmUcgObLW99BpkEMzkerPCmXfpJNlpCsF2blsOhf
 aSlOmE9xVBnB3e3iXcUCRaQvOyaulsDfn9heSVcHUyAhbNIgn7IHefe
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMxNyBTYWx0ZWRfX2Ug2a0YEKnCM
 nxwxrLyL2iQ1xB16hcxosLuqzCUZ3mUHiFHuYcRPfxIuxgHoHj9zZf1bP4RxvlAlNb6m+Dy56eN
 pWKWjUU7EmyBDAhsjsweuTplLonE13PGmMCsXs111aCPdUAZsIiBIdX/nC57OuMEZSshEHCGqF7
 a60/1dk8xNCn//2O2TsFJjjBzK5iBNXq4ZP1VOzFnjEc/SWKNWtvtRriyPCqnoEbQ91jOhwp/sS
 XD92cEpSMjsz3wYerWjg946l6f4L9ZQH0JxXdmK68JQPpBg10Y9bhQ9fxHgFp8/LA8i0DDd77MH
 5sp/9NmyV8zepBnsBGkqPUmEbm+woVz98patxYTRobnhDdu++Z5/1Pc2DmwiKQJtLRk2CnU5zv1
 pcBrAWFfqUGkwtLt+NNaWDfoY8O1p8+gCBL3uH+KoraQFHBGcaTxKhc6/yO/MImZgrV3nYd5ymz
 SBgZSOh0Ss0q8XiiZgw==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa47fec cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FyyklSoAK86a5T4BgM4A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: mT4xvUWGhEg9QMyrkpDJyTdbOo0oshaN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMxNyBTYWx0ZWRfXx0MgEvbLwRLZ
 sVImiCQrTqA1cKx3QpwsV4C/1pJp3cjm9JdbLaBlNZeG4OuCh4vCul/t3bQzbDZovHKVGOS/k44
 SDcnNfeC3Cnp+LyIdjdsadjvSUHuWNQ=
X-Proofpoint-GUID: mT4xvUWGhEg9QMyrkpDJyTdbOo0oshaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110317

qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
holding a runtime PM reference. A fault is raised while the SMMU is
active, but the GPU may drop its power vote before the threaded fault
handler reaches the callback, allowing the SMMU to runtime suspend.

Accessing the SMMU registers after suspend has started is unsafe and
may cause subsequent register accesses during runtime resume to fail
with a NoC error and an asynchronous SError.

Use pm_runtime_get_if_active() to keep the SMMU active while collecting
the fault information, and skip the register reads if suspend has
already started.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
holding a runtime PM reference. A fault is raised while the SMMU is
active, but the GPU may drop its power vote before the threaded fault
handler reaches the callback, allowing the SMMU to runtime suspend.

The failure sequence:

  GPU context fault
          |
          v
  qcom_adreno_smmu_get_fault_info()
          |
          | GPU drops its power vote
          | SMMU starts runtime suspend
          v
  SMMU register access without an active RPM reference
          |
          v
  later Adreno PRR private-interface operation
          |
          v
  pm_runtime_resume_and_get()
          |
          v
  arm_smmu_runtime_resume()
          |
          v
  arm_smmu_device_reset()
          |
          v
  SMMU register access
          |
          v
  NoC error / asynchronous SError

Use pm_runtime_get_if_active() to keep the SMMU active while collecting
the fault information. If suspend has already started, skip the register
reads instead of accessing the SMMU while it is being powered down.
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..b1787a4ba0d3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -129,6 +129,18 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 
+	/*
+	 * A fault can only fire while the SMMU is active (GPU is issuing
+	 * transactions). Use get_if_active so that if by a rare race the
+	 * device has already suspended, we skip the register reads rather
+	 * than triggering a cold resume which would call device_reset and
+	 * destroy the fault state we are trying to capture.
+	 */
+	if (pm_runtime_get_if_active(smmu->dev) <= 0) {
+		dev_warn(smmu->dev, "get_fault_info: device not active, skipping\n");
+		return;
+	}
+
 	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
 	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
 	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
@@ -136,6 +148,8 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+
+	pm_runtime_put_autosuspend(smmu->dev);
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)

---
base-commit: f61bb3920fa8cb44b84d32e0fa9fbaab4eb00c80
change-id: 20260912-priv_call_runtime_handlers-7f3547544040

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

