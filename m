Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0CB49E142
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860105; cv=none; b=HKdvaF2G0W7NTUi8c5ZaWmlWSxwaGePiHEQB/YWsk7DczlP1O0XrHkPpIPO5aqXg+/mZW3TLiZtNFKvJy57qvIgTAuTTVz/lEdPzX52Ylxw01bSkGhWZumzxntCfUBNfnpUyX/MkOaXbhwE7wZoDPde1bQIUXZd5D/ZPsppBAxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860105; c=relaxed/simple;
	bh=ITSshaCesLL9A/oJmGtCMcJUZxPz9xZuhttKLebAg48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I+qFUbQ0hpPcI6R/OifJAJUIbDpkiUDUYrc/JKiqTt6cmT0utAcVobGGarGqdHQKrZ6sUn4IsJ2mpDH0SBrViqJ3mpYZmfgQcM6Q8wUM8GGweXskINZeH4M6zQRTxzrR1P/KAqSFNTu3RxgBByRA2PVZXwFyqANfSh7ncmH1Drg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AG2Nr8Mh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RhSH0gYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AG2Nr8Mh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RhSH0gYK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CskIE2176837
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 13:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FuGN+Vgz5EAUSxZS4ALKIW
	lpxou3EH/JM3OuCR9DI9M=; b=AG2Nr8MhNbeFh2zr/46dZOL5fe3rESGmPnghoZ
	IRUXKP0JaWNlrh6Zeaf6foYxcjHcjqIG0unv1XjQK4QiUmlLsWW/AS8bsePCwl59
	wCdllQJAOMtaJ1eWP02dAbX8SnV6kPYFIFk5nVNesfEf8pjK6kXwSxxZRAWsVQ2I
	CoQOuzj06r8XTeYcvOk9ue5Qx2FRhVKJwfs2AHgVE5b862m7affLFgzYeFYbCUTZ
	ULP4Z3r7ncihwcA4z3RaFGmxfwMWiO7nFm4Ys2BzjhsuiawoNq4A0mdUfEjoPwrP
	hYI8st7D0k2XVpgcKS78SHQkmSUEOYJgW36ecpS1sXMYB68Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsxre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 13:08:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-887e45c7063so987876b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 06:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790860101; x=1791464901; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FuGN+Vgz5EAUSxZS4ALKIWlpxou3EH/JM3OuCR9DI9M=;
        b=RhSH0gYKFaXGXFGOKZEFX1CE41CUcvMYn9taYjqhJqOB+6spvuUUNShWAo0eJ9gf/2
         v84sYWtRz7i1p3FbZSQtopL/JKW1pVFnoWxQoVQpAraG5o82dzwFbMzGXdre+XQJGgV9
         Fo+3S/xBOW/W9pqCDmo2REUJshS9hrLJQTnzanCscijtxKxvPF6vt9qaiqpiAPyIJ83R
         t1E/K0fb473hi17Z7DhpvOCzmclJs9E2bR8ojowdQQkdry7++H6HgfXNVCAzwGmQqnyc
         4I00HqBij7l1pCvWAR+mJQqllGSRu3rqRxmAhJI73FmW4QBO0eARBSsqEMuYwkYfCZTo
         1ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860101; x=1791464901;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuGN+Vgz5EAUSxZS4ALKIWlpxou3EH/JM3OuCR9DI9M=;
        b=UUZ0ZBh/4+3dCU9wjoszpP78TPd53qU4Pa5MtFLudG4BOgnTAAao6HkBiPO3PC1XHo
         y73FB8GU0RxwA53fzmcgISj/39Lv6UafuthGPSdtQ423e4VGaHL5+ELAJgMWmqnf1KvB
         zLT4cyKLG8aFoeBshNycptmLvbWO5IzsrEsMNBFhNc8W94DMYblY/yLNbiuRv25VMiCv
         P4g99QrnLHFLzceQyzoQEnx843kYbEXimHe2vU2oUqm4Mg8ZiKoj6+9S83+NJ7wQOhKp
         QkXy9topGQ20Ria2dwjztc5dWp4S9hdLRfD1etj4rJe+WBqCO7tPbXTU0yqghcQvhcFK
         itXA==
X-Gm-Message-State: AFuF++k4lSZmA5rcgC4UqKECvWtPSFd/InXWvkdfcM/rh3J9jmQ+vIx2
	wwp9JwIC2dYZJSzs/gnoYi+zZV1+r9FcAyCxTM7DVV1Scotowe/XFC1YuSUBccFdT6mKkktMdw4
	NDLp9f0Y69Cp8jTKeN+pPJL3wThf0707KVaF49uQw7ywXayEfDWAP7RVXUyfuDjfwZh5Q
X-Gm-Gg: AYBFou0I/lx5987zBXG7LES2mBjm8mgFseHFV9y7xl4h30Cxj+TBPmk8jLdmTA4OouX
	G+7wWkOTvd/FWtHC6REjUO3bTG08nZFcjVEXoIaSeMmqG/c/4Wk4d86yp8Mr/t1629+9nGdI4A3
	G/ihAmaFbFkHhuXEPreBxc7yBvh2oTtUb5r/T2DAdytk+x98UZKW5zresd2h/ylXx0oWIHL4/mS
	2/o8azVfkUHLpfALgh6pSUZOz+r3DAhs2ivLVgE3FEDIxvtlspA4tXzXAwLEHcCJ/8hAX+cS1VY
	b0OVNxaocqKYdcElX0tvKaJ2eLsGFTKaY8G7ywM4E3+9CrHrmHE6ZwwyrOxQG8q8EtwUIYpqhnj
	ONNP+MU6AJrBMWojZow==
X-Received: by 2002:a05:6a00:c48f:b0:888:add:a07d with SMTP id d2e1a72fcca58-8880adda0femr1863710b3a.29.1790860101034;
        Thu, 01 Oct 2026 06:08:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:c48f:b0:888:add:a07d with SMTP id d2e1a72fcca58-8880adda0femr1863690b3a.29.1790860100420;
        Thu, 01 Oct 2026 06:08:20 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888198cebafsm1037468b3a.52.2026.10.01.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:08:20 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 18:37:53 +0530
Subject: [PATCH] arm64: dts: qcom: monaco-evk: Add off timing constraints
 for vreg_l8a
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-regulator-off-on-delay-monaco-v1-1-db0fdd69c262@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAChbvmoC/yXMSw6CMBAA0KuQWTvJFBOIXsW46GeKY7BjWiASw
 t2punybt0HhLFzg2myQeZEimirMqQH/sGlglFANLbUdXQxh5mEe7aQZNUbUhIFHu+JLk/WKgc5
 9Fzy53hmoxztzlM/vv93/LrN7sp++Kez7AV6bFfeBAAAA
X-Change-ID: 20260910-regulator-off-on-delay-monaco-d0376dc0b7b1
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790860096; l=1883;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=ITSshaCesLL9A/oJmGtCMcJUZxPz9xZuhttKLebAg48=;
 b=8Gz8SbPEYErUal571ILel5P3NlX0KZjkSmjBzbIeuV8hZ5JubQfZs5EUm2yc2iavGeW0LTd9T
 hdbrBPC7q8AB8p74vD68tjlFY8oTaVH7JFl9YIW89ZmGG+CubVuxbmM
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe5b46 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Xt4dusijb_yHOFS2GB8A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MiBTYWx0ZWRfX1y78bcltU/rh
 0Gb5f8p1i8uY+aLdXuZdN/tk5v/CrYu0HyJW3ViBrjO6mnM5mAPhdMkT//jmfMr+UO6dJihR0OB
 WWX1ZtDxVpu91Mck/ozPvZUQxExGy/0=
X-Proofpoint-ORIG-GUID: lO8sM_rJQbCDdHDTLnWtrKF4YoOElGcC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MiBTYWx0ZWRfXxLLZjwqqnzW6
 mEBEKS5+hkyp7qkSZxZhGOFfp+M7L7KlaJPGQQzPgPmr7D4by3VN218fURMyXTlQZW63w12xxPY
 BCBqwVAoe+Ia2n2aFq1ddlZfr5XA/dekm9mj14QaZUN7Wv+aEhwvbHsTFiHMXY0OhlW4DbVgX5O
 McUXSwzNnuB+QRWA4o9ZabJGDRqztS9DDn4gjy1OZccNgAg/GEhexLWiVx5kokuFTQy5A6qRlzn
 ZeEUT/dvCO+1KpwIq+QwWI6MoIXoOtBu/6ilxOkYQhrsidNA4VF40b2Inhlg+WpnPWtyF5ACLc+
 Ws1UpHw8iKKSpDw+ucAxqxATPIda2OvRiOktH48dhH/eK2qOdh15ZaErexr6YHjoq58Rg2DGmnh
 dmbEyWCMFERN+ezFflv0MesyMuZ3Qn6XWKqEWarJL6TxgnCj75ZlPbbZlkFCJF6nJ1BArqzf91e
 AJj9iNWcqM4YDtA8L1A==
X-Proofpoint-GUID: lO8sM_rJQbCDdHDTLnWtrKF4YoOElGcC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010052

UFS on the Monaco EVK can fail to initialize after probe deferral when
vreg_l8a is re-enabled before the supply has fully stabilized. This is
caused by the increased discharge and recharge time introduced by
additional board-level capacitance in the shared power supply design.

Add the hardware-required off-on-delay and enable-ramp-delay for
vreg_l8a to ensure proper power sequencing and reliable UFS
initialization across re-probe scenarios.

Additionally, set qcom,regulator-off-debounce-delay-us so that quick
disable/enable bounces across probe-defer retries don't power-cycle
the rail in hardware at all, rather than needing to wait out the full
off-on delay on every retry.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
Depends on the regulator/binding series adding
qcom,regulator-off-debounce-delay-us support, posted at:
https://lore.kernel.org/all/20261001-regulator-off-on-delay-v4-0-258ba9612da8@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..80f8e34d6ce0 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -240,6 +240,9 @@ vreg_l8a: ldo8 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
 			regulator-allowed-modes = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-off-on-delay-us = <10000>;
+			regulator-enable-ramp-delay = <10000>;
+			qcom,regulator-off-debounce-delay-us = <15000>;
 		};
 
 		vreg_l9a: ldo9 {

---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20260910-regulator-off-on-delay-monaco-d0376dc0b7b1

Best regards,
--  
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

