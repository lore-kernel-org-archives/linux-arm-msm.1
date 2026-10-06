Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C23D891F
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 11:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791286482; cv=none; b=XRbt0IsS8DRwAXL2C8ySaf0f+jr035Syt2Tg7VT/qPMzLJpoxKDY/MqKT1R3XuuRRGRrBzjIsvpfnyO0vgr/pSI2gpSEbxYYMG4KadzlwQWi+d/hqhUISsZQ4hMdZBsrpjClxKJ3mpLepRzUfnqsKb4RDJiLXOkOBY4DS4Nu88o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791286482; c=relaxed/simple;
	bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sivcribMOn0QsNU3aDjfP/31UNhYivPLLitVmNohX6uazYtL+UtWXxqiU0I0ZqaQ3mu6LjNS20SvsTl1RSTpaFLsJME1YeT54vvNCwV1+QhOvj3K8s/XOMlBd79Q1enl7x9/oLRnCjGIfKQw2baJPczzKS6rNZjLemmigdVyIMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaGfpqZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y+guGx+2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaGfpqZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y+guGx+2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BPMxn1045904
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 11:34:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=; b=WaGfpqZjdGPd8grA
	UlnPO20duchkDDD3HhGTwUCfhxCvNseSN8weivXt0gn1t0tNpDxS0NktmrxB/nyg
	NgLqZ86sONkFYhwpwgBzlJ5hlRaAz7WZ5gnFqdHjbONHjQt7A5hEIUmGgGyCPgPH
	1TqIR1DiKfsAGq5w99zvXnB5451hdb8gumKUU7yQxItpPvdqIY+JeJ84/qyKWUir
	iFqhb38F+/kJb46M+z+ixJhvzxpvAFPejca1MD8e3D8dGbIDCY2Aqsj62f/ZJNdk
	Zurkhs7IZ0vQPOEe6eJyXmCRdve4XMrVWaN/fuvjrKaWvQeZmBfnx7bsrml3usEN
	rBCA6g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbgcga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 11:34:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb48f41343aso570560a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791286478; x=1791891278; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=Y+guGx+29qJpQ8D3Bo2MeKj2+7jc4EoDEGwaIiwbeDe6iAvPM1ELYeJVnHjZGvT3ib
         WALEy+P4Ua05Xn1fUQhPOwGZN/EEh5L3zkZ45urgu+FasINJAe+lD9HwRr7g0epPaWtD
         1cE2MQlBkUUlh0NiCXjOM259sxCEsCVwhSweiNEjgzPc6SjUBT4DAykyPoi07nX4LnST
         gBsTr65H2yEZTl/O4zXNuWVHZCnXy6xKnsvrTb4OyizUKRL5jchqQ+/otmEdv81xaozf
         u+ft7FJbG3Xy1ocWooHNIkM3pEiA52mmR4np5T9dfyncxkeWikhm4D7eTFvpgu/KFyVH
         ZeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791286478; x=1791891278;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=wuxciQJeHAN1VL4YfNqxUy7eWBCRWfZsemX0mId9G4qNnoK8LuPKqEWViu0nsH0cu8
         FSS32iZ7og/VGEONgJilp9DhDQZVsuBGQ/teA545lEiCb3wGMpaJpKQrGzr778erggkx
         Gq9mZkcZvDlVG66+Or5f78fwGgLKcTnneFky2uDOS4Ho8yTBWEMIW+xhG2g2/WHJ7dJV
         ibQmki1b2nJkf+aHp+6Aeu9iDBTcXdp+kypaJuGk/GHAY7Qc2Ir1jcywr8DQcGhm9fWT
         vQ4HAjROFWy2ZGz9Uj9wfoC/z8Y5HoTaJW2fsKGYSZ3X1HVQB+7W445J8wzxHyqt5tYd
         HA7Q==
X-Forwarded-Encrypted: i=1; AKwUvBynAfV/tMf1e3bURskcLWg2oXBTEnNWUVjaYnj35ezrH3c8XmM5gtAn9Yc9381uTW7j02efbIhPpEOTn9Mg@vger.kernel.org
X-Gm-Message-State: AFq9FYLALGLX4wbjle/UgQtAWMGy1tjzK/fLYmC9PioVF0aUBGM0iHDr
	AdsK3CR3oipRhCzKknj+mgiiG/DZcRU5KegkREGBd0WtYqdBcKTB/FftI2hwFYX/cBPBvn5yeDQ
	MOu0ZauUARIW3YeSXfkWvqfovXcOhrZZlqN+tsw9pTgepOf+hKySVbKpNk0A1IB9cKpV3
X-Gm-Gg: AYBFou2lmNNjNRdmOT5rCI+Gl8gpEHzsp4j/3Fs8sACE6W/b2CaWvNQF3LAuLlL0ssT
	FPPKe376KbAtidJwTKTsNUxI6EeD9/AiwxQK1PVUmAQ5cBJMwiZCDQcPaR0C3QAmn7tKqnW+xSz
	4RyfeqQt4tYr45J+jtdRU0WmUO3ZJr32zFEhhI8n4VPBJUOmL4KKeH8Sk0a+adxN6RFI0bEmcE+
	GztomUh4B2uDO8JpvYHtHbyAYSbtawWWscKx54gl97QDBDsCe7ShDXvGTHfTy1qscDGZ/7tU+qC
	cnetpw6sB3EkJyNPLrvdUyTqJKt5rgsToSb6s9rJ5NNXa5QVYQjtouLsjcP4FZGNmt4OF63OHyj
	WfwDqpssNLuL0Qmq43aPDglaR
X-Received: by 2002:a17:90b:1b09:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3a87368608amr554172a91.18.1791286478367;
        Tue, 06 Oct 2026 04:34:38 -0700 (PDT)
X-Received: by 2002:a17:90b:1b09:b0:3a7:a3c8:8f4a with SMTP id 98e67ed59e1d1-3a87368608amr554137a91.18.1791286477300;
        Tue, 06 Oct 2026 04:34:37 -0700 (PDT)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a709a4e80bsm9330092a91.4.2026.10.06.04.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 04:34:36 -0700 (PDT)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 17:03:28 +0530
Subject: [PATCH v4 7/7] arm64: defconfig: Enable UefiSecApp TEE client
 driver for Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-7-bf1c8e2a64ab@oss.qualcomm.com>
References: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
In-Reply-To: <20261006-qcom_uefisecapp_migrate_qcomtee-v4-0-bf1c8e2a64ab@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791286430; l=1240;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
 b=YjzJU1dcgPuRriBWDp0JHYX/56t9ZNJrr/NFnoRLRhaU93MIfOhqsRAhHc9ATIoUjByrLvAxM
 FlNUuIfbYJRAELZQYbjvZMUCWNweCX+rXzhJxDIzEorlzYt8MeeWCg0
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac4dccf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=L1DwG8FsHRaiiIOMTvUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: BFZaThJmQ2u9gpHAoQxHFQECxi1KPCQd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfX0jyUIwG/o9Nc
 zp76KdGaFJ5twkxZlMoyS/rbW1InxUA7B1QZHwEjWkkOXKnizDUvbYAAhIi8pYPRFeuIU7SN/Zs
 P2YJYlJkUu4Ywzu+QVw8SfSfPBDIV2E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0NSBTYWx0ZWRfXxoNi5e2vTkR+
 OSBu2KksEMd7omqIk2hYBXVyqC4cTkeZR2cQp0FUFN/69v3W2JVt9qq43JP4PYT0DT4QGWefvgQ
 EHEnIYcbkURUrQfwIsLHH6tBSaK4dTfince+EQPcnjioYX0hbA5Rh/RLjHSYzrGhtqdWUKr+Ikn
 uJCbDtM5HaXAh/BfS2OFKU/IdmCHo9CmEdHeTwwSYsQh20tQidbEsv9sbGCr3VmKP12bxfgODvF
 duqMfyImXJfmFKcLc7jgcqm5xavpUJCmtP2wcKJLRuIWAAShh3EcCC1Uh4fZWJkDFQGv0C087h5
 yal49BksRubzQwDt0dhDzvLLiUqNpMIWPgfaP37qDyAI3nTlPVP7Ms8pMnM4NfC3tVBrd/Cstqq
 Srzu7xwyRtJm1FEuIr3TjcJtVjSRbJ+lkuV9yGmx+XCAUzze8Bg13qVML/xoUvcysU7r6VVdyYP
 jA9tL3Qb2A+6bsEmXnw==
X-Proofpoint-ORIG-GUID: BFZaThJmQ2u9gpHAoQxHFQECxi1KPCQd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060045

All Qualcomm SoCs starting from SM8x50 provide access to the Qualcomm
Trusted Execution Environment (QTEE) through the SMCInvoke interface
implemented by the QCOM-TEE driver. QTEE runs in the Secure World domain
on ARM64 CPUs and exposes secure services to Linux running in the Normal
World domain.

This change enables the UefiSecApp TEE client driver as a module to provide
access to UEFI variables on Qualcomm SoCs via the uefisecapp Trusted
Application running in QTEE. The TEE client driver communicates with QTEE
via the QCOM-TEE driver.

Access to UEFI variables has been tested on a Qualcomm RB3Gen2 board via
the efivar tool.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..a8525878c679 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -277,6 +277,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_QCOM_TEE_UEFISECAPP=m
 CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_TEGRA_BPMP=y
 CONFIG_ZYNQMP_FIRMWARE_DEBUG=y

-- 
2.34.1

