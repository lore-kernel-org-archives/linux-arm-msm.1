Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC393C1F4F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059270; cv=none; b=uIOhrn2mQnY1lInlVc8mGi6BV9D4aDRbixo9cGcGlJwcXxMjDrgoeqAiS4YAjozskEITowAQX6bGW06J8L0wT3KofWTPyIaXnMxK9P+M96RgdSTdL95eIaeKSpYO4bDWvftiLq8D/i163g5TjH0pJ6INpIWNPoEU0niB4NY4w48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059270; c=relaxed/simple;
	bh=fGjDN+TR9qzbMdmKyv5iFbl972FV/2fTSE4TOdH69ac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QycDKjH/cVp2jLnc4AQD3CSvaTmyZTmPwX79rMC1kRblg/L3ym07qXOUB/VX5zGZz/HKMQuphIxl+AhxPEbI97OIwtwzowzrSanu7nDITXuS2KuTd8PpkDjJgGj0FwxHz5Sn4G61bocwk0gQ65LxY332nFaL2GyiJnxhb+j7I3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnutPU0d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LzLaH20X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnutPU0d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LzLaH20X"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00hRF2579521
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:41:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bF1FC0baVWF2IIEF+LlbyK
	xiCAXSPEf/MQwu2ywUz0I=; b=FnutPU0dG7kgoOC0Rw/CZ1wKe2BviFJf9wmG2S
	ScnSjNrNcRc2E/A9QPH5ROPRPNN74kyxXZcDsetrgr/QiSJAerqOgiF7xXIAHOU0
	QVOZhHPaSruf7h4kE1/ZZSnWGxt/4qYkxH1Lv3nzP4U8YgWnj4zsweYXCAEPAFUX
	nvMQzxBedwzwwcJCbcBaMpIukcJUgS7bXcXC2hSNb+sFvhFi3JRVqkk34ZUeQ2Xg
	fe4POaJ2H/ADK9yj/X7VoEahNKsZsqYqbA1JU6Xvk40PYl+WU+lpQS+qZPIbIBL6
	akUupz3bTKWDM7fg6wScRckM+BfYWfWkValeCc1mq9WgQi9g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gub32a0n9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 06:41:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc44d708055so1564549a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790059266; x=1790664066; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bF1FC0baVWF2IIEF+LlbyKxiCAXSPEf/MQwu2ywUz0I=;
        b=LzLaH20XNgfgHRKjhJeTmAqjeFCAiUXnHM/tgZOsfMEiCN67He7Qv48J7UjppspkgY
         RdOJbLJsZk+9wbtXzNlIeI9n77qeGis/S/tltlxEPdfp/1IevRP7R7NYhmC6VNyEZOaj
         qYst92QRzVWczRZMgHRtkg5aeqWzvaouiRaJd7Px5Cn/ObatodLHqcWgZhgCcro3aFmm
         fQnLtoCuPZzrq17wbbUXXn52ZC1sQTbaEblKRSUWgHDkwqhYXFeL2yYChYjHtMRJJF8W
         Muv2kUFIY7pYMLKHMQu4IJwnD+zRHdd/7vhbhT8SobkX0tDiaLhtaAYc1zM1FMCOs5FC
         Qk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059266; x=1790664066;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bF1FC0baVWF2IIEF+LlbyKxiCAXSPEf/MQwu2ywUz0I=;
        b=FfKWXUCUCnNDrNitPEwUZDUAIecF9x23sJfH2ROkiZ68LHyws+2mEk+oLaTWJKK0ED
         JRjsb1abJLEYIOpa5MVU7UBfXL4/0gn5xo8hmFzaSFYbztNE8t7jR4eMc9lUYtLlDd7A
         Jlapp17v/+DN9pXSDjCtZmloYvCgQH5BithNWq+Yp3gQT+RYBtgkrqn+pv90hE06yMkn
         0ut8NrAAdZSLOBaQ4blN+A0PB08N7Z3aUzNH51ToebthdfD2HYUwOwWZyycmgwQzsrms
         o/gS67CWpSqgsnT8EGb86Xsvy3UDWSHV5N5JawhF1EoV9utd9dXXcFkbbgV1z99Uml93
         9QMw==
X-Forwarded-Encrypted: i=1; AKwUvBxr50KtJfQ5KX5/a/iyCOYfHY5oj9+wle9UT00ZhuoCN2thTG4SpLn7zKIUdNxN2Dvg1Ih++jwOEt3zTWXU@vger.kernel.org
X-Gm-Message-State: AFuF++kivabBYH7NjXXXt0wnZSE71GEibCbUgodgUYp+vmtOp0KlH3sb
	2AVdcuHyHIZSwOeeQm6RdBBAJE1eRgI19zyOnI8GOsLG0f4v3f9bhyd5nB+ve7ZP5r5+5kX8Q0H
	10SLC7FFUV3ZB0FcL1Fvw1wqCHQf5pKWRqXW88NL+qVO1ZcI4eBYAwMu6OmpfEJNUAFZ6
X-Gm-Gg: AYBFou3qa3C51IS96rtZLEkHn9WLHE2rIuJDkSRDDwl2BfhtcTZMsmSLjUHOnv+qQIz
	09PSl1pAfDi2FiDb/Sd4UhUZhietPnAteDWtKpcJ2Y+jZ/C2Kst2NLnrmGzrPGmeNoL/qKpC/Tz
	dIpIiU3i76svvN8nja27IFm2zWg16r8OWwfDboYTXtaAcXybDSRE2ob2Q4aA7oNv+fQbp+V+exu
	xNzG9TRirrfBiVAqZRFvvh44xDI3GYQuylVluG+dlQhSBkWdcMul20NCTxSZLLw2S4Jy6FaiSby
	p7HGoaVMz1q2HxV1mdtqNShLdlGHTaizxUOIxtPxnS1M3IhnWtqCJd8DNZRlZyVj3EQ/20MqieM
	OrwFY7ocJhk7pvkAs/McP4QoNBXWKKLQ=
X-Received: by 2002:a05:6a21:918c:b0:3dd:a00a:170e with SMTP id adf61e73a8af0-3ddec83f186mr230958637.41.1790059266474;
        Mon, 21 Sep 2026 23:41:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3dd:a00a:170e with SMTP id adf61e73a8af0-3ddec83f186mr230931637.41.1790059265981;
        Mon, 21 Sep 2026 23:41:05 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6131eb19sm2655870eec.27.2026.09.21.23.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:41:05 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:10:58 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPkismoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMj3fScytzSIt2UkrTMCl0zY0MTUyOzJJMkAyMloJaColSgMNi46Nj
 aWgC5+nnIXgAAAA==
X-Change-ID: 20260922-glymur-dtfix-6314526b4b02
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790059260; l=2058;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=fGjDN+TR9qzbMdmKyv5iFbl972FV/2fTSE4TOdH69ac=;
 b=xz27AUKgWmsq4cpueoiNJUMwVqgqR7+PFLGu/Kha7alD9Gla1nUUTqijulaH493mGZ2COslfR
 Ll7xy0d7Zv9DZE4K2oY6n2ocbiuKWU0nfOOG5JECOs5/w3gi9opuvGy
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Authority-Analysis: v=2.4 cv=B8ssQ+tM c=1 sm=1 tr=0 ts=6ab22303 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=lQw7s4k734Nnm4ZOuq4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: P7bwW_VX0ClhUvU73mTEG1Sw8iTNSFGG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NCBTYWx0ZWRfXxJPd3vQBQDUF
 uat+EKBuftlY9LzAPuN5eKanChP8hoiLuGTrV0e02qw7CPOIGIKnypVpnHLtAanrLVEj7r7TxB0
 ZY/5gbkGlA5U3mRfDbKy6K6U9y+o02Nio7s9SJEw7ju2rU7LPu+EHNYzgFRYNcR1BI/W8JZRZj+
 84uqTnJONfrPH2FnEA3r5+EjyaL4+/PmWkekD3uYl0QsQenNL/NAqlWsp9JdawqNJKGG2q1RgS1
 CM5aj6a6cXUhXqEZ8rhaAnEiFby9nMUku0Q6he7AfmCHd18V5ZX1/DNdRUxIRTI6whPTKikzdvn
 e8lqzsxDzGgxn6ptaFS6HrtWgafOrYZMMXFOIoAtdX5XRO2tug5Jt69rOK83uQQOPjYvJ3PpJwy
 R2EOsVL2vgtlH2p0K0axTxOQ/NomMwnJEE+E0xWIHbDPm8DWVXzdWK8t9miapc5kH+NA7i14/Io
 Q3HBA3sTizn3Co6/SHw==
X-Proofpoint-GUID: P7bwW_VX0ClhUvU73mTEG1Sw8iTNSFGG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NCBTYWx0ZWRfX+gu08qgsRyeM
 pwXthINN1FVMVbZ8RyeJNxDWfvTouTIQTs7m6zl7iwkm/r4o+wdE631/DKJpo0UaL8XyRJxPnWX
 QnAbR8TLdXP5tQ5ruL3Kw5+GC3iPZ8I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220094

The reg value of a compute-cb node must match the SID (the lower
nibble of its IOMMU stream ID) it is associated with. In the cdsp
fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
14, which don't match their SIDs and leads to SMMU translation errors.
Fix the reg values, and rename the nodes accordingly.

Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..51fea666efac 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8471,9 +8471,9 @@ compute-cb@8 {
 
 					/* note: compute-cb@9 is secure */
 
-					compute-cb@10 {
+					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <12>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8481,9 +8481,9 @@ compute-cb@10 {
 						dma-coherent;
 					};
 
-					compute-cb@11 {
+					compute-cb@13 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <13>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8491,9 +8491,9 @@ compute-cb@11 {
 						dma-coherent;
 					};
 
-					compute-cb@12 {
+					compute-cb@14 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <14>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-glymur-dtfix-6314526b4b02

Best regards,
-- 
Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

