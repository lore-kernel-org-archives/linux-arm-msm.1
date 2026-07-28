Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399E341A540
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236300; cv=none; b=i3/dC70hsqVgPEpUrASAy46CXH2u2+5f48dhg1fJ6VnTicDI+LXmv/znYfBFLW5EkyO5lpPQG+xkJ4UIq2kNxeRxSBMs+DRFKE0CVwca6Oaxg3IKDzddnRx1cdBhi+1er2/Os+bWsCOwcZOj52N/roL275O/S0BPCtWdeZf0HSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236300; c=relaxed/simple;
	bh=5zx2ofaYUI00OPGY3EucqyCGbzuEunr/MYv2rozPK20=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NkY9b7tQZZIoI9v49mj1V6+x+ilap1vn1KuFMiUOamPWkDAnFaWuh8TRCyO3hwzmWBKFrC69xu2L09NPkTLuLLw7ZiyC+bhiICR2ZdQ8dzYRWyY3XI0/OT9C/nlN9pTcIgoiS3/4jGIbvCzg7GKlQ2+txIs3S2gXiuj0UG1+uWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcfOAk/5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HMeeV7li; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcfOAk/5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HMeeV7li"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgNjZ2699186
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:58:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ErdR8C7yXGHX0KEoDnDmVw
	01GhSdYqhFnFaz5IIoFNA=; b=DcfOAk/5R2WPHXpcWCobYfh+Pfn5El1+3N55Ze
	hPslQiwF/C9kW9V0GmSz9UlZ+besbUbLvPef5HB6BoPqhx4qRtlgKcIUQy5ubjL6
	JHa7ZicKmSMInlQ1Fw4TfvXMJxDIShKcfJ+bsq3kmlG7npZxGRYnK8coHJkvEAr9
	s6ud6FWkSQRRbeYKB4Y+R7Vh5Z2MRDQobzfh72mpTXMDYyL1Gg62iizJVdz6lPQN
	nVGMtIioanHBrDQXt1XgeHwuH4m7Q5eVYznFFBQRSEbOE9zIXoyHD82vgnf9xz/o
	h0A1I7WsupqCBNQCiIm5/Nrq0T8pyxLLRbIoYnS+K/1FRakQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptatg6t3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 10:58:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so70678625ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 03:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785236294; x=1785841094; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ErdR8C7yXGHX0KEoDnDmVw01GhSdYqhFnFaz5IIoFNA=;
        b=HMeeV7liJTuWNtAOy2JizDtxF92EgNGQfqNr5HvWqZSUZ4HAfEJ+otcFLq9dqtI292
         TyzRMI8KYZvLrmcwrnjxI+swyaFEwL0CXiWwBItUHARVim01DlTuFQOsRrRo6HxP6E3H
         lW9dSO7byOeV7JbDBaUUQ6CWkCCsKg9+IqIHKNhMicfBljeb53T5IEaeBfyBS+uTM0iA
         Z7IbyQWTL44CaETWQW39emV6rzw6864h6oOCCmqq1rr92zNtKVz8EFJg+i+Ox2vKtssv
         L+KufmJEcgHshsXsFhFLsZHwccPq7nGtQwPi1FSbdOypuCDs/vaqJ4itRZHG2dlWje+5
         jFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785236294; x=1785841094;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ErdR8C7yXGHX0KEoDnDmVw01GhSdYqhFnFaz5IIoFNA=;
        b=ewI+aZOG42wphDTEoJM4m5tnvTqO4SK+q6/SE4Wq+FIwc8qbAq5K1golpUH/zBe3Lb
         fMhmMruCB154t267WWUrj4wkYbeblznOKHBTgLMpcWf+xmQY+ZqTZ4XE5Jq0amFTK05l
         h2DQNAcInq8ayj4pFR0StSnr1scDNCKFJG91OilCqGsvEo6IV/EyiXbKBeeIBrohg0Cg
         lLTKddTu/1rcVrunZ/wOlq69zPLdX/c0OejEb/EcpP/ULCm8mJA8AgC+mOfmOrslX2PK
         v8KOiQWlmiIiUGkW+lVBBH81OPsSmvob94h96tCEUPLo+j2trcXkdfqH+6q+FVD5HWWg
         x+bA==
X-Gm-Message-State: AOJu0YwQDjFYi9b3Z+RUEHDkn87Qir+8CQ8NoZoJHfqjgduuonGLMiUt
	9CunRmCzaxbZNA0wU1KpXu/b6oThEbYisQhCbRAy6DxQ4mQy2zagVL949R5SrVSfuD1+2KUkbwr
	jrqacY4cviY2Oh90bNomkNW91B4nrJ9LW53J8YoDeHjYSlzKsuAGxtoN/3wUgsmzlT9eL1unctJ
	V4
X-Gm-Gg: AR+sD11wVtoyHFiaAYjAoaOkAMm3WQ1o6ROc/+PIXniYloQ1mCvymGKpSmpjCMqzGHf
	f3MYpwWhFzyZ4Mzqok9iC8SjC0eAKzd68QpYToCDfxDkk9bE/kGf1dMhwgFyqPSSMlA+AbGzXn0
	gw4jB1Mv5Iyw0vniw3XbUHeze561q+IbwQs1r4yfzBCZW2yENCJZmFVLUyqziuKe7lUseTQvFSS
	VSEKYX0Qx05KiNIBtoMs9bFZHJQjOfX+jv9aO759fHhXjtM8m+pDAe65Zz+nXPMXrGyzIWgFUxT
	u8XTxx7f5ytFOkZdxD752WX7Rp7uBIYJYsMT3q0u/VwNsMSdKTa8+JjcAt7NbGg9nstJkR7Jbxd
	TIycgBMDMcAHqrnYUW3ExoUXwOAXlgkCOFa+6mrvwC4yoGOikVxe6ZGAko8baQV1MeDSztolxBf
	9aFrfLP/Zy0M5do1k2AdTbmtBrv7t3JD3VUn4=
X-Received: by 2002:a17:902:fda5:b0:2ca:20b1:3e0a with SMTP id d9443c01a7336-2d015c8fbcemr25029705ad.3.1785236294477;
        Tue, 28 Jul 2026 03:58:14 -0700 (PDT)
X-Received: by 2002:a17:902:fda5:b0:2ca:20b1:3e0a with SMTP id d9443c01a7336-2d015c8fbcemr25029415ad.3.1785236294063;
        Tue, 28 Jul 2026 03:58:14 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm42192544eec.10.2026.07.28.03.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:58:13 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] watchdog: qcom: Add POWERUNDER and extend bootstatus
 reporting on IPQ SoCs
Date: Tue, 28 Jul 2026 16:28:01 +0530
Message-Id: <20260728-qcom_wdt_powerunder-v1-0-de8d9e964e7d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmLaGoC/yXMSw6CMBRG4a2QO7YJ7cCqWyGElPZXr4kt3vIwI
 ezdgsNvcM5KGcLIdKtWEsycOcUCfarIP118QHEoJlObc22NVR+f3t0Sxm5IC2SKAaKC7u1VX6C
 Nc1TKQXDn73Ft2r/z1L/gx31F2/YD5ROl2XcAAAA=
X-Change-ID: 20260727-qcom_wdt_powerunder-d1b7918e12aa
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NSBTYWx0ZWRfX1rdneyrEAY4A
 JPNxrhMLRSReB+M1Rv23o2OFRpxesJW1j3Xpu+K8dcIzxcPaE+oHdRckG6MgdhCugB5skUE5YAG
 M8l0WSTYRz64cnPYm0vefhtPujDOabo=
X-Proofpoint-ORIG-GUID: xMpu3zKegnzTVZ9Rorbc53QeHLkNOeA1
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a688b47 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-yNzYYiF1uDR8yX7EwQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: xMpu3zKegnzTVZ9Rorbc53QeHLkNOeA1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NSBTYWx0ZWRfX6uOOba1IQeib
 3HoTSGOMo+cqiKDd4NoqykMHeMem2KAIn8uFaDWNDts7HKjNcOgrYyVj+sNnYL4HIqrUnpHxH/W
 fugM8014DDLrPqRcZeTiWooBXmUGJ7uSnIBTcaSRddGFecjgCjkpIZAB1s/UFPsthWMITam6Mej
 L590jdaOJtwaqqwGGdfUj+5q/LM+gMDpJrn2xH1+27bmazOpoAOLcOsY2B6knBg4FUt558bPQIf
 B8Eevyz2NEOEfdCqM8Vu442sQHP4M8ChiQX1tQwQqGJvS3aq2QFJQ0ceworfQ1Rr58eNRtoBLQr
 A6shxNL4cLh/ya+qMdAW7wjZgKccZi3HI8GwfcS+Ae60dCXq8Cgj1cs6wYO6SJnHDr1ndr+H2y4
 e9tqeG0whfz6abNt4U1B+mAfCdi3SI8NnF7ZWEhHPYciwZPy14HVg8rVbGsMUmlzEZiPDP52AVC
 iD/ZbURairKuBsN+jdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280095

This series extends the Qualcomm watchdog driver to report POWERUNDER
reset events through the bootstatus interface, similar to the existing
CARDRESET reporting support on IPQ platforms.

In addition, the series expands bootstatus reporting support to IPQ9574
and IPQ5332. Since watchdog reset and powerunder reset indications use
SoC-specific values, introduce SoC-specific restart reason data and use
it to accurately identify and report the reset cause.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      watchdog: qcom: report WDIOF_POWERUNDER in bootstatus
      watchdog: qcom: report bootstatus on IPQ9574 and IPQ5332

 drivers/watchdog/qcom-wdt.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)
---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260727-qcom_wdt_powerunder-d1b7918e12aa

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

