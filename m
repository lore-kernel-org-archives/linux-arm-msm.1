Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674183EC810
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466731; cv=none; b=Hv5iyaCzw/2m0N8a9XPYp9Y62JdCGUvxjTZEfaZ/4SmMPKWPsSRxgBAOt7EnHUgz8qP45AinPiAKyU0kKLlHjdYeryikwJUopKvbJJT79m5M8xIqOvc6s31+JebYaDCgVixiyl45udRiVQMyBJ+j5pdkd0ae+F8PpruHSlurxV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466731; c=relaxed/simple;
	bh=w0KU42+syaTFT0xM8Dc9f2AY9d5Ag12HxWsryGUi4Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JVmx86/ysLOL3VK/yAuvyKdHfCXfA1ch3DWRmfmjrWlCG+UWo1E1ZnUjsxL8LrLrZVnkbgg1WdvLJfuu6S1vOup764E3rLdKAujPsRCnt+uho1FJYy5X1vWZ9VoPWRi1lmjBE8G8KrhzqZBmeWz+Z1TfcKn5mpQibxhnNnOQtBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPkgacUZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iFpxJIhJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPkgacUZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iFpxJIhJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BGOH001170038
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 16:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Az1df+eZr6fjyO2aeOutje
	3AWJiysIdCLaDwuT7hK6A=; b=SPkgacUZTVt6TTkXsbwZ2rONyoOANtAAn2+itr
	xoXSrxCwpgJ/sEHF/HfVhuPgFVtcXbBe5be8TjCWs0u0R+ZFfGwtkv6kyBYEO9OG
	R4HuYHU2tsARLwQvcURNiEOJHEbVvNFzz7FL50NwSRV3U/z+9hwnveb3occD3g4g
	IWBqx0ftP5P0yKiJd/gqadE/8wFpXqsle2wN2jD94ysJezIlWLmlXBlQLRQRf65i
	ZUDsYEWM6saVwxUPZj8WbxKlfc0rdtIWRDMcHLIzCSbqraFdrq+s2n0+JsODm0fx
	4uCj0+R9SDYp2rlPOc9YTqlU5i8EhWSjmoYAyzsd8Lry/G+A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc1k80-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 16:45:29 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d02df2bf09so1770305ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786466728; x=1787071528; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Az1df+eZr6fjyO2aeOutje3AWJiysIdCLaDwuT7hK6A=;
        b=iFpxJIhJs7sbxJ04doK0bhCsK3Tpfsptf2hgYAjo8oEZ0vIv954auAH0j9rIr9Hbef
         YRY8sSh4dTZ1OnHP0ra4sr3rXDTcXw6bSuI5qhwpGSuPqgrL0vkbyl0jk6UrjMgH3uPp
         +8U2x9Zsy/YMc6xbpuUI0svZ2+IWMB4LDQjfjZGdJeChyHOLy7cKcY1vd3776fquM2Dd
         IzH8tbrG3i/dZ9LJpsHWf3FoXjhzOSfRJhQWk9fT8gCis6wl3PeK7WfcKZKxTwmhE1lF
         YBBn6Cb05frLITCb43N9V3GNGwLrv2f8InkI8i0dK2EjoFVi98t1RlF1YRuPMOIlU9CH
         KgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786466728; x=1787071528;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Az1df+eZr6fjyO2aeOutje3AWJiysIdCLaDwuT7hK6A=;
        b=C685SpwLOXcyU8/RNywivPZ6IDs4sE7ivPgY6LfqqoL2fadZWzxRrR3jq24ON7vs+J
         3SI12EoMgZe93UPi8kqxjU55lD1TOmxCbNQGoDMBnHA0IcJIm3uXzp4Xq5LxbldCWRfh
         sKMELsZ5fW6I3pGAnTzad5P+1GbqErmb45YQGws1ITSmJWo4177r3eVZZAF1iz/8qnjk
         cGzhVaF1d8o6ZuUmN9KCYSxWyanYp0ULKiYL5Rb75peMJCPkyJsqissqvuZV7ZnuXpvz
         2FRqZGLI8CUISCNdw4dAuAn8mVU7jCE/gx6l3nKh1bN5LIudte5DdnoLL0lAqe7D5iL8
         U+jg==
X-Gm-Message-State: AOJu0Yx6RcsyfTp6sciL0yeJluB/bu+Ip3r13MdiMRMHcx9HKSE/Pqx0
	3oO6I0xCeNbYz36H24GS1LgUKYFhPt/W7ArGr+ENHfI8yMCpryUlfEIU32fm3lKY0XbRmSyD1ER
	NAtks8WyFMJYM79rJpL9It0p5G2VVc4qGjSDvZ8dcERrCBAzHhSFhblSj9rohR3LKJfTd
X-Gm-Gg: AR+sD12kHL4otOvPsaArNL3KjKmuR+TAHrZtI7on82AbSM2dIlRgYFObxa5K0Q2LWtD
	7CBj0+NXYONdQpXAU1DQmb37Jvr4P79VTZS/Pi256HpZDJelLCYsGoCHYYew5QQblUmS4i+GaAQ
	wd4H34TM0Ikjnnevt0Is3AEyKEChtXxO0Yy42L1tfLKYE4MGInfvkmlFDJS/994xxfBDdinnOED
	ECcixBk4Ral0wAtUFs9qpq4s5kKkFPRtKReP7JwByJXsnv1tznZ/Nx2Xsmp/q/tlS0XBKabKs2F
	Rchqvyko6utNC4b6ZtvPKa4YxHOUBj6Ld6UkquyALNAS7sTa+YmWe08u0BlDhJhCtHxS2v2b8ct
	I89AFWBL5zGqcu+zZE3F4gMr7IWgIHzLl/om85H4Wp3lpc3pLsz+aUK4lKhaKBFJt0WPnW5/zQN
	pmLs9xzDJZ8Df1/fiLJl3HFBvScIY=
X-Received: by 2002:a17:903:1b6e:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d32bfc7800mr27796635ad.10.1786466728017;
        Tue, 11 Aug 2026 09:45:28 -0700 (PDT)
X-Received: by 2002:a17:903:1b6e:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d32bfc7800mr27795595ad.10.1786466727430;
        Tue, 11 Aug 2026 09:45:27 -0700 (PDT)
Received: from hu-imundaga-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315ef0f42sm10833335ad.14.2026.08.11.09.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:45:26 -0700 (PDT)
From: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 22:14:59 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: Fix missing SMMU stream IDs for
 ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-adsp-smmu-fix-v1-1-a596d284c455@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIpRe2oC/yXMQQqEMAyF4atI1gbaLqR6FZlFNalG0JFGhwHx7
 lZdfg/ef4ByElZoigMS/0Tlu2TYsoB+DMvAKJQNzrjKeGsxkK6o87xjlD9ab0IdyUUiD/mzJs7
 z02s/r3XvJu63OwLneQE8AF/ycQAAAA==
X-Change-ID: 20260811-adsp-smmu-fix-180a9fd2fdd8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>,
        Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786466722; l=1575;
 i=iranna.mundaganur@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=Mk2Np9ki3XpBgYJDc1xTT7kUuXO3iiQ2iPzF7/tNnOg=;
 b=dZDeuqWDoCDb4k2d+OiDZs1v0Ir/linqPGQ/zGjx8SqKXCflpot60dzLrvEsPvvg8TJtEzApB
 4a6SMvyCRFqDUAMuUYNj3su1hWR8zoPQOVt/JBqQZOJ+aZqn6YrU1sF
X-Developer-Key: i=iranna.mundaganur@oss.qualcomm.com; a=ed25519;
 pk=qZkaG8hiLPYolwXtPIwJ7KOANYrwGq2VTzoGYW/je9I=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzOSBTYWx0ZWRfX0OJokiAoGCcc
 sj/Y0opeL2qlQDbrIs7SA2j4L6DA2aukCrtwItdh+S2Epow6o+exl7PWXudgNpfWDVMZcbkhRWu
 7Zy+a8CH8swSPOB3nwj5ECDN7h+ho90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzOSBTYWx0ZWRfXyWRA5roVVO/x
 04aD6qD3qGpixqe9oMMEc+Pfqrf0w5MYwE+PYPImdpHFPCKx8K8sHxlBorKZsebdrFK9vQA4thx
 nEXeGvUVW8FaBvMEY5QLA5uxgV8o5GamJwgM/cy4yPUhpHnG6iqIobIKri5dIsq9cow0/uJVpJm
 ghvthTmf2zOgBa9czMglalhxqv234PLs8pgCZLzwUBhUgfKx7+cvzngDKFHnEoP6dDWC64hFNjO
 8m6vGARAiJffrBeMM+XljnpPOcZOMb4E6om7G2TtcfycmYuncM3gqVwUfHjK4nR62n05D0Qp6G+
 64x9IQgls9DQMWrUFHeEg4/L8ju98IBBoRXqKYDWJFZu9wEqxsCc5D/0wpGpxrquhYtau7eviXI
 m0P48FFgzRyDO96bDkbFHlCYsXUYB9iBeq7ll6yI1zosFT6KnOIzpRTeXF1Zhul4S87Alheu1M8
 2LsVlKigrTNY05Q1yGQ==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b51a9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VSdS9sEGBZfcQe81IwYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JBiKdgqPwC04svOBXC0swnWH7SEbC7hF
X-Proofpoint-GUID: JBiKdgqPwC04svOBXC0swnWH7SEbC7hF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110139

From: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>

Add the missing SIDs for the LPASS eNPU masters to the ADSP
iommus list. These masters are exercised during audio record
use cases where Environmental Acoustic Intelligence (EAI)
models run on the eNPUs.

Currently all transactions from these eNPU masters will result
in global faults; fix them by adding the additional SIDs.

Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
Signed-off-by: Sairamreddy Bojja <sairamreddy.bojja@oss.qualcomm.com>
Co-developed-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
Signed-off-by: Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index f04058d2e089..6b06e0acbcf0 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4084,7 +4084,9 @@ remoteproc_adsp: remoteproc@6800000 {
 			compatible = "qcom,glymur-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x06800000 0x0 0x10000>;
 
-			iommus = <&apps_smmu 0x1000 0x0>;
+			iommus = <&apps_smmu 0x1000 0x0>,
+				 <&apps_smmu 0x1040 0x20>,
+				 <&apps_smmu 0x1080 0x0>;
 
 			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
 					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,

---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260811-adsp-smmu-fix-180a9fd2fdd8

Best regards,
--  
Iranna Mundaganur <iranna.mundaganur@oss.qualcomm.com>

