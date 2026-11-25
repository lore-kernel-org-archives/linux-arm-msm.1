Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795594882;
	b=AoaI4vc+5+l2YMrKHpGuQSDznug5GgyISJWFbe1NdkV9m0/Ory29EQfEUkHZJaCliRhl
	 FOk9oSYNsCpuRZC93ujip7djVkCgyqjKRwG3KBU7dRXPET79R0j0H8mo4Z0csdqwDkpS4
	 wKTsX/YMuEPRdYqDwH9xU3/ti4gllsR8CYj6bM9m7KWlhAd1YaiFXYsH99UJEXBL1bDEi
	 +2cTfWjCwkIfGAJTJifu+fLEU7+KIFU++3C5TS3H8Iy5Bhx77ZKk3LrsAptptgEG4Der9
	 vEFchNvV1usEhOzkSUCds1Yc5i+GHqkYzY+m97PA1NPVw7vo6O79cKXnjwnKU4AOJ3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795594882;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DButlC9vfhwyiV/934aVxvWQylOVzcpu0HSHmaAFCVY=;
	b=G+VdgE7lGnzoSk7C7IgVSJlN6JprRWgwcOdAJ1YfWfN/TDYZDp4VCAIzQL+KcL9SsIjF
	 AEQFmsoQT7ZmQFAQMig5FV1xXdOHUBpbxBcn4YL9fU6yhj/yZilsxzhJWq/kgKrHDoVfY
	 4jSZsUCM7eMUOV5LIZJF2YHIRGs12KkrOSyHIehunT4jVYFdJ6UI4JdlMoUePQTM8oXqL
	 s0oKx4vcLPmEHPjdm/bErSPoImAWyjaRKYQQbMveUXLASTgZtRsdFGuwrFfq/JUkSKnX8
	 EiDWx7Odag6p9SuItIfi4FCmrr0tz3DgcN68QtSUmkScMad83pgwq8YhlFXGiXpBfoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQ6V7ofP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWdcVufG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A86606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56A86606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQ6V7ofP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aWdcVufG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68TYx2629330
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DButlC9vfhw
	yiV/934aVxvWQylOVzcpu0HSHmaAFCVY=; b=ZQ6V7ofPyXdvtRrBlR1dAKsM+B/
	pxuHJNTG1OaerYNKUmszsZPdRiXanp8MRsaZRcQkEl0nqip/Wu7NM0OThFtUhZwY
	HVP1f8JsC3heiP7gGYBEWr5v+a+h8nfZ2pBjKi1m1JnI5+8xDjeO1XihOcWsIpSO
	CO5agmh3zf8aeF+JUGzpVvD05kDvJ81gbOpbty+bwrR6axQSDM6sq2+Pqh9yFP2B
	vSS+kFLhK8E4YRvHWyTWhXLn6yzsdfrvbgvyza3vrl6Gqwh/uKKjd9dxDDJlNRnX
	GmnnLRIhDWVTZp/nZghTWbYwkJoUUeptI3uJTzS2mTQq0zQiRHq4hFXwwIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydb1nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:21:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f03aa5ff3bso72057395ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795594881; x=1796199681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DButlC9vfhwyiV/934aVxvWQylOVzcpu0HSHmaAFCVY=;
        b=aWdcVufGrIq+6e6UthEfQ5GplQyXuM/jmldE4n1fkzImQhF0bF2QQzRltXBhpaPrhj
         9k4LsXwt9L09DH5SRySvM7XWPLvnbknfYSJ6fNpTnk0AzuzEzDDjt9Iw7BoFASSwsUEf
         NxY3v/exr9qULnbZNCeVSoMMoQ1xNN1IgluKbt3ScmOd9UoXlf2eC3nuCEBaDfdthK5S
         w5KRZuEi67b63HztpqBSKW45c5rgWQJOmfXn6pZ8+tu0GKvQ3P9AT5PzNUde4x5jeUGS
         6qUsNwC/DbT5O0uzQtYq9uJfBZCITXeZTVNPa47e7pqNSC8NPFjb2QZHba+UvoZnNGnL
         IA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594881; x=1796199681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DButlC9vfhwyiV/934aVxvWQylOVzcpu0HSHmaAFCVY=;
        b=GCzypnP8ZwOsnfklZOq6bgZjJ9WeQ17TiBypT4qx8TjNnYr/x6k8n3ZoZvC1T2JFoc
         QNIoXomys/kXlpw/f5rtjc5fAXhTZYoHJYgSVF9CuvxzAlEhhSGpOCzMU6Z03Y63/xqB
         NDDb8tooS4ZTQM2xI/glw25mTAu8gb6pZMUid2jXxqtPmOUJRgKAr6FCZ4oCTzDRQJaW
         N+uoAy+qMWZUCc17vdtlB4j4tk6qeF1E9+rq7uUclZ54oXYnEt1LKvJOBcx+gDBV8pp2
         My3Pl2Tr4oSUi30Yq0Hu/X930peRJeOlQF6cSzOZFoNlhEHMeU+euX26ygrf0rhvIh4a
         PI5w==
X-Gm-Message-State: APuU4Z+ksSdVTcfxHvAdRHrvt+DKH/DAeNXG+6rwRPoWTprIZHVt30Zf
	ylf/eQKjOVxB7MvmNkj1wSMqOOXA6Lp6Mk/VDFaGZBv8o9ydAOyveY9PeI1MOizsybMdd+NvWXP
	M2Chbrz0bQjPvI1Kldtih/obvlrKi6ZclfHwE26ocfhS95sZXn76tn+85nBz2dLNrwzFT
X-Gm-Gg: AZFdTZcu33mhlK9aljzKKSCJR8yJ2VwzxPqrSDf/GRcmW9rNc+c2SiWQOUO4u6SwZQq
	A2KnkxbnQHFR1Kf0e1UxUpIDWRGvkoYoMEyueSFw5kM0jQYLtQxt4XTjSZTRda9bHGTW9f28nZj
	N69+qsF3g/zCMVkBnT+31Dz6+TKfS9/A8HwjcFX1MWBbbEpzB8rCA7rWMnd7XmfkWYcYkCO83ja
	YYTYWuhIWCgSait7dXCB+UILAnBNmoSPvK/gFbZL75FIIWQVg7WFmEGjUvyurMhp8Sn2XHBLZW/
	UQg/oZiu/Invz71nu/N1xGfKtbW0wQuwbjmAiXRBr+9lrXpqlYvwiUEbbq0NU7dLcwE81c4yt1q
	zu0+SkGGAXyZpwuBI0kIAyXKqzdX/104Zo7R4QSQjHHYUGoJQF8j2T32tuE4BfRP8w47+uLGvff
	/4PuBLVvYG
X-Received: by 2002:a17:903:2acb:b0:2f0:a7c2:7d7c with SMTP id d9443c01a7336-2f0a7c27e29mr78192445ad.35.1795594880904;
        Wed, 25 Nov 2026 00:21:20 -0800 (PST)
X-Received: by 2002:a17:903:2acb:b0:2f0:a7c2:7d7c with SMTP id d9443c01a7336-2f0a7c27e29mr78192225ad.35.1795594880465;
        Wed, 25 Nov 2026 00:21:20 -0800 (PST)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0457fd68dsm73135825ad.39.2026.11.25.00.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:21:20 -0800 (PST)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
To: andersson@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sarthak.garg@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, nitin.rawat@oss.qualcomm.com,
        shiraz.hashim@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
Subject: [PATCH V2 2/3] arm64: dts: qcom: lemans: Add CQE register region for SDHC
Date: Wed, 25 Nov 2026 13:50:54 +0530
Message-Id: <20261125082055.488583-3-monish.chunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
References: <20261125082055.488583-1-monish.chunara@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfXysy2ztvmCcUu
 S5xV1/4XK9MCPAz3pSPX4aAkDxNn8N/BpJM0S3yNfGbOMfOCowIlAsA69GSNs3U17iaPT7X83js
 7fWJGTPvdkzF/HgB2RW1lr/r0u1BNMw=
X-Proofpoint-ORIG-GUID: QXimREgz65LkyHocbwoA6JQ3NQrZbXbC
X-Proofpoint-GUID: QXimREgz65LkyHocbwoA6JQ3NQrZbXbC
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b069a81 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=cLkUB6twTbeO1ZdPm1UA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMyBTYWx0ZWRfX/KOGyw0sJSUi
 Y++MNYnGW7jVQXzl9/81T3dUOgThfM2tFGiLXpw4YxFH8H+rJ3L5P7loICdoL27cWMoZdHxYunb
 bsLfXmo5rzkuQsCrjASHZJVqVfbHz8LPzD0O4+hz+WyCrNYZ+EYaWD8TI8YSLGjAZKSARjk5b9l
 flg7P7rJ7rtibgJCw3/0RVJnzZ5OceOzvQw8xNlH+Mnm6LjixmFr2DAHgq35CoPkuLou4J94P5T
 Kfg1xEDy3owi8bvrpKmYTcq8ZcsTEhdg+55LIFBIR5LqgBVVF7jG0W3nXcTKsGRFb1gXR14kmnA
 zXumFIk3EkdCFQl6j4J2eXW68RRd8REHa1gznB1FqNeAattfdhrYvqTx3DLtRwy4eDVkpxLsbcR
 +CPMPOLVJVbOsIcJD8xD21vqY027pNiKTaSph8vS2dKMxW0TN4aQHrW6gR65qM+YI0nAFA884Gt
 EanQRvLehlW7q2N5UEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250033

The SDHC controller on Lemans has a Command Queue Engine (CQE) whose
registers sit in a separate region after the host controller registers.
Describe this region in the sdhc node, along with matching reg-names, so
the sdhci-msm driver can map it and enable command queuing support for
eMMC.

The controller also needs the XO clock as a reference for its internal
logic. Add RPMH_CXO_CLK as the "xo" clock for this purpose.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-embedded.dtsi | 6 ++++--
 arch/arm64/boot/dts/qcom/lemans.dtsi          | 4 +++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
index 0be39bb9de1e..2ae492455fae 100644
--- a/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-embedded.dtsi
@@ -1636,9 +1636,11 @@ &remoteproc_gpdsp1 {
 
 &sdhc {
 	clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-		 <&gcc GCC_SDCC1_APPS_CLK>;
+		 <&gcc GCC_SDCC1_APPS_CLK>,
+		 <&rpmhcc RPMH_CXO_CLK>;
 	clock-names = "iface",
-		      "core";
+		      "core",
+		      "xo";
 
 	interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
 			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index e298747c06bc..2946853354f8 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2937,7 +2937,9 @@ apss_tpdm2_out: endpoint {
 
 		sdhc: mmc@87c4000 {
 			compatible = "qcom,sa8775p-sdhci", "qcom,sdhci-msm-v5";
-			reg = <0x0 0x087c4000 0x0 0x1000>;
+			reg = <0x0 0x087c4000 0x0 0x1000>,
+			      <0x0 0x087c5000 0x0 0x1000>;
+			reg-names = "hc", "cqhci";
 
 			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1

