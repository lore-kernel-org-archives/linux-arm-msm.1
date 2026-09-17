Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEBA308F03
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619891; cv=none; b=WwHzMUsoko8pWDZIw16/Gdqhf1o8Z2Cr2acW7SLWwBnwU+6IvbysJF6U5BTYn6MbzarrOenKniO/cW3xSksZsEaJ0vYZCZjZ3QAkvfhwrLPi22rnmDTFWShP5GTeYCbJYcaPgIB3DFuIrXjeGdEgPhbKJDfqMq45UcNkdtKRsDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619891; c=relaxed/simple;
	bh=rVj0wB6TfE9jUwIn6RbEtT1SRMnMNK1dShgiCP32JiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEZuH84AlwCI6fYq6I0P913jVa2M9/dJsgnUpSlz97e2qaYAmXeX2l5yUdHIIgBxH3oWTZBy96ZxN6dqOsLce1cF3YQt8PnyvP9YhmEhFaCc21SKYyVszObAriSqo2GXdrH7ZkaUkKcQ6rUllUlJyuCgVUCHSe6krUvhzN1pdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqa1HH7+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bgio4LI1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqa1HH7+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bgio4LI1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H1K7eR3559634
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Weq3dJ7H18I/Y0osm5dexfiimeQYQYBP4jA0iRYxto0=; b=pqa1HH7+Is03wUq4
	KzZiJ27lho4IVMgfcTc3aIqyDZU72Dku5byw5yjtIz4Jw5V9d18oNacVHbNiRZ2+
	89+23DsuWLqT3rTB+JWJ1X+xBsT5fF7H5mWoAg9Iton4/bmJN9xcaLGML7krmu8L
	xT9w/Ncnnjci102a5urYloVw7j7JuTrZSHHk3cXa5hKhKJJY5xuvW5dfh4jmoo1z
	cTPc8hMr5LjPLoazTvyhWiD/3G9PkoknJf7HPU3cfwEZTPJ8exn7+QxUAUzz3HuV
	R1Bn2dLjW2MpDvc0BMUzYuYPJ8ZfOVmN51Nnj33gCP2+3UTfoM3MhKB13099Ye69
	egvJGQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hacey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:38:08 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4afc810bfso405485a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 21:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789619888; x=1790224688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Weq3dJ7H18I/Y0osm5dexfiimeQYQYBP4jA0iRYxto0=;
        b=Bgio4LI1BQRuZi+MedBsQQcNIVcuO3l5v7X/NJXXnLeQMeU8Ssx1LQzA46VylzU6QG
         nIrvYvTIBxwSAiDK5exd/4RrmBxQpygqT5OdiDKdwYUCEXHmf+hT3xcM4ztOFxPqmAYP
         JMNgC/76crNzpw6UzC18Y0GhLlgHKT904xBllhRfFsncbabXPhwxfCuY9N95I2kK7Mf5
         dKtbgSsLRrW3yFTjndtZy8T+WPTYVTKN6nOh/a2k6FhpIc5CdjbRAz0pWQIouz1w+MNa
         3G9NLrPq278ZyBigufW6keRS48Dt7Hm5w5rITIVRWqyfD0+KTvejdNaB25cKy2NonGvj
         zuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789619888; x=1790224688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Weq3dJ7H18I/Y0osm5dexfiimeQYQYBP4jA0iRYxto0=;
        b=TFSRxxoTleox/8V2SaKs8G9iHLE4Cek8ApnTmGGNAXoCptGYgqvqELss4CJ6ODRoxt
         1zxcwREPwPn3yG2UM40y0ojn/cYtdnA9Nm3xwur08aU9TNRKnlo+UyJ5GT406UJCXaja
         oej0wEigHLA/M9Qp4rpHO7/ynhvN4IuU7DzgrYKNWYVgfOPUO3pgkA6+GDmQU/lwG7/G
         nizmJcoerAznp71WH+PfDFIhEMZ7RjMq+ceE6UpvX3QsEzju3Kda+H1b98x9CKISpqBh
         Nz/JYbZxSghIJfZs8gk+B83oxRLMByFOnGdAKpIq/nrRp82hReksXnL54H7uL4bhKLo9
         PXtw==
X-Forwarded-Encrypted: i=1; AKwUvBynFb08Gc9AdC5myFze64uM6yERsrDnDdEYRl6FxroHxRw5lccoeUVuGMe07G8D0FfnQlNaIoavfQ291gmk@vger.kernel.org
X-Gm-Message-State: AFuF++n+8EyoxVBDfbVM0r3/bBV1vkKg1FBvg+TmXOw4K3yzFDFa0g8y
	3f+KSHY26JJzyF8kqipSg6p783XoPosg791yUc19k5zLu3ZaW82ILzid4xkRNYNa4CYs22YXlOC
	iw17k+E392HRutf2lXERbaIjHcJUGONWUf5ZXmzjY57wfiUUbPCAI2smJk3EVp3MqiUoB39+ok4
	bE
X-Gm-Gg: AYBFou0oJ9x1HBVgQJv3QehZOO3/TRfCl9TBvh9DyUVY9OQx5IpGwLzJ58UToT6HPb6
	dqPk6XBZ7U0knIWapIZHqUPAS4NSnETL1kiQw7w6zUS0IgjavOosYCPRsAMU2Dx7r3u5sjf7zv6
	yTfiyVK2ySVJX6FRNuAE8svM2S+vmmeBENUdeMCB/7d8/9pOXnOE2hckyoqOiizT9AV8yMbP/Zu
	xk4w51GZ72rbaFOrjyCBaBmhOhass0wdXav8WRZMJBLJa8UtRiaN9lei1byenxm10Kk/XatcJpg
	7pUX7HqYuDp+aJ+GOXrbUtJm5F40oQ06HbNBG98wZFpD7TnAGAHv6qMg6jZU/MstnI/4qKb8Cms
	FtnRYNNYmt46Cc594ZpWecOqEGOyHjAE5oCev
X-Received: by 2002:a17:902:cecc:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd9ca3f088mr31792585ad.21.1789619887857;
        Wed, 16 Sep 2026 21:38:07 -0700 (PDT)
X-Received: by 2002:a17:902:cecc:b0:2d8:d4d2:d139 with SMTP id d9443c01a7336-2dd9ca3f088mr31792245ad.21.1789619887416;
        Wed, 16 Sep 2026 21:38:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a9fd38sm12357376eec.13.2026.09.16.21.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:38:07 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:07:32 +0530
Subject: [PATCH v3 3/8] arm64: dts: qcom: shikra: Add gpr node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-shikra_audio_dts-v3-3-9a49e1ca6370@oss.qualcomm.com>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
In-Reply-To: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789619867; l=3434;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=rVj0wB6TfE9jUwIn6RbEtT1SRMnMNK1dShgiCP32JiY=;
 b=E/QoJRcoYrzbLaxCBFVJf8MAU767a1GSDtIZUCe6ts+uE8hTGtI9uebyKU07z5nYxSsbjKsRs
 bBokGBHoB4dAmSxAAlX9mIwI+xYhjkJl6RgP3B6ESbboLTmQg6O9Rpz
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX0WyJ6Rv2oBzC
 WwoqlwrEPu1Kl45hnKhaMmUEwVqyFnG02zsAInUcO7QWKfJzXCFGE2X7T/BANwuVtMHT4Cv3xOr
 kv0xOdEbwlvyPKuMNYpjQWarO4BCHFzxC3ZThUDLj9Y3IpAHcu5Q/DjTp1SIz25ry1WFORwh106
 mxzm4h3Yn5tYO6V7isEPgElVpmLMXknwMhyPsHKFcxOYfxj+EKweHfuY9Kh5B1m5dauOZhrcgWm
 EPuguBDKt6Ap2DLkjpOCgU8EGx9C5hkDigyuAt9BG5tj4AP1nWuec5V5TW/kJxORiyVBOIL2ciK
 U9JEtTDVC2Zvd4pyGYsSM/q/29VPlAU+wNGPgXZ/Vbr8NXABS8kmUg09DJymFBDX/P+FzHhXmNb
 VIw6zDlOp5RtHF/RbPINuvV9vv8FUXdln5g6KSkrm8MvSTFCHtt9KV8v7bTJ/DXpqibqfTL/j8Y
 pjQ72/GlmQM9kJLB71g==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab6eb0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=T3D8ljLgrI678HBggIwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: VUujCkXFrudgwXAOJD8P9op3n12cF-Ep
X-Proofpoint-ORIG-GUID: VUujCkXFrudgwXAOJD8P9op3n12cF-Ep
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA1NiBTYWx0ZWRfX8v4W3SmMd25f
 hPdg4+bROs/fNZGg6P9WBOHYkqrbeN+S7fkOjRuY2PELjuOIArrVD7dOznn5LddFhdmlqTSURfv
 qO/CWNk71CsejScXH82KEzIkX1z3Ev4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170056

Add GPR (Generic Packet Router) node along with APM (Audio Process
Manager) and PRM (Proxy Resource Manager) audio services.

Add a dedicated MDSP carveout memory region for audio usecases on
Shikra and mark both existing audio heap and MDSP carveout regions
as shared DMA pools.

Update the Q6 APM DAI node to reference multiple memory regions,
where index 0 is used for control path buffers and index 1 is used
for MDSP data path buffers. This separation ensures proper memory
allocation and access for APM communication between APSS and MDSP.

Also add shared-dma-pool compatibility to the existing audio heap
region to align with upstream DMA pool usage.

Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 49 +++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 7633d274e090..21e4e6a7e12a 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -16,6 +17,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -476,7 +478,14 @@ smem_mem: smem@86000000 {
 		};
 
 		audio_heap_mem: audio-heap@86200000 {
-			reg = <0x0 0x86200000 0x0 0x100000>;
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86200000 0x0 0x40000>;
+			no-map;
+		};
+
+		audio_mdsp_carveout_mem: audio-mdsp-carveout@86240000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86240000 0x0 0x100000>;
 			no-map;
 		};
 
@@ -2410,6 +2419,44 @@ glink-edge {
 				mboxes = <&apcs_glb 12>;
 				qcom,remote-pid = <1>;
 				label = "mpss";
+
+				gpr: gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "modem_apps";
+					qcom,domain = <GPR_DOMAIN_ID_MODEM>;
+					qcom,intents = <200 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							memory-region = <&audio_heap_mem
+									 &audio_mdsp_carveout_mem>;
+							qcom,vmid = <QCOM_SCM_VMID_LPASS
+								     QCOM_SCM_VMID_MSS_MSA>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
 			};
 		};
 

-- 
2.34.1

