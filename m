Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561203EB0F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282335; cv=none; b=DaPGPr3fN+U4Y+5BnWzb6cjIV6Fbs8D9N62bBSzBg3XugVu72ZthIljyYatxmy3yi9AlQjwne2FKxwhWV+Cik/kwZjbAVpeON4JZO9/H+xZW7BEOBlrQ/gWiqTqWhqpkY19lGRWFfro3KaRWZZLIu6Ho+q4DuHokCz6EnlWuaWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282335; c=relaxed/simple;
	bh=hYUWA6hHRWFZeBTK+ngbbDcvAT3eVLKP8fJugqcLyGE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dMyz8r7Mz6lyGD4V8s/m4VJbHzeK85wGehaRo5xwMus3wjghvHpxLuouMYPhDkDC9DLaAp8ZVxz4263pcRBAJ9tF1NeJTBrPPB7P+aZVxcF0oR0zDg1eK7conRLM2AA92CIO/Vvekh7B3aTCAB7m0SEYurmrLqddyc4qV1mr/y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVL7fYTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ePKyaChw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVL7fYTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ePKyaChw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H9utij1120336
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZuKmCF6V5l3
	azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=; b=NVL7fYTkXc6m4F12POIlR5xy2Eh
	U0uL1ozZPfnMiQDaxx+nn1+0XU1Am653iVkfUKyckjMZ9aLJtudaDwvTE4dlyHpU
	BXlBR6nE0ooOd9NmcQRIrwlZsK+39A8wEFIF4suqtqYK6zexZGsPRThKAB7wU8Fw
	A12Q3N1ZKdRGmymlQV7LjtkohkjmynzwCx2SL9IUOHhym6Ne+6XbmHuijkM1YSF2
	1QwPcjaCt3muY2O4Fb6PX7XqH+VkrdcHrT3enoLgfQ7i+mj1f5HznytqjBHAcEC7
	Oxtj4oDrEFJ0HQhdPJRwFOClcuca/4R9hGfoBWWXigHq+Wto9ijr1zGM5fA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78r07v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so10139197a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282333; x=1784887133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuKmCF6V5l3azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=;
        b=ePKyaChwwzU0QeFUWjtUWfdqn5PjcIBDkHAaUHbwoEJezyvzEk3N30oMsWVT6hvpea
         zZRKgU2EpA+fRhbvNDyqUPsaXVR5S5BU4XMR6pdM90cffGM7E++THsMx0LVqgL5Elzas
         U8bDvlXf7bwmvOMFVc/02BTrKjGwMoUzsD5cpUYIdvST9P1ai6IJYvYjp+mLNGIqKMJs
         b0bweiE++L2Inl+teFll+Qp8g6PUHeozDDtmNHbx9DCVjNfnLBBFInz8LVFKYR8A8FgS
         G4OTpHPJTwo1cqfnTDrwuYzNX8RR/VB8dsBpHC+3P3XAy6bh7ZMXyjggdLLyELWEknBC
         Epdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282333; x=1784887133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuKmCF6V5l3azfqav1X3iiiX2+TQLuQjPmRcthQvmI4=;
        b=isDUsUJbGrhFO37nGqsFnpB+hlBl/xPHLnbm/tooVU85mZghmazGSWXJJ9Z3Ei7hru
         Unsf/rihJSTvKDu2s0LZW7MHGYFM8lD921Dim/b/h+L5HPn9SCNXVdisH1IwdnIW0GZp
         o8RB8p5kTxh1WzfOXQ+PYo29UqqlMtQJXWagusKOI6ATeRRkpLzoym5GE+6v1pniFjLl
         ZJ7gpl6xXh0mXUo8tW2fewtjU0NzA24gFYfTZI8P6M5bq6t5nKOgx8Aw/oiRt3c28kee
         3w4FVQHAd5m3Ibwnv10qLE4rJxvl6d21HUsZl36P31O3zvXCs9AQdD4hcsX81vCwMKW6
         0G+Q==
X-Gm-Message-State: AOJu0YxiSFly/cTdPqbZhcIflIA8VVTJSv4iy4e1BD/Y2ibyf0UUOffI
	8ZPB4hrLauywbTit15E6YQhAkYsqzAxFqkia9L06GEbOyX7ys6hD3HIdlfWTuvkTR6X133u1es8
	KyCIcUXX0iJwcg0b1hyG31lL9ZzFILmGtBfnGlAJpZq9bE8IEsi4dllugSxelZNk5ukmg
X-Gm-Gg: AfdE7ckHRpPw9o6NXFGI+pLpG7oS8SFHqUWa8/rsLD4S2MIExRlgGkzDVrOQ7B897Kk
	hOEWO2yBFMpZif/X+sxVa+FZDxM9zOgZ/28WEP+2YfiRAVhqG2hIT4bJL24vjiYPH5r/cHRcymW
	NstyAergzt+i8pgot0iBoTm9jelZwQSI2G9qbvQjJpLZn8ADjhnStSsba2RMOB2XfHzER0iwGMg
	fSgIlsQTKIRd1Ppd/WyF39qdQe75VFsV0lcENrEDIDrFlB3dpaqaeYfMxvoeKbkRAne08Gm7pM2
	kmdvx3OU8h/eDSU3lXjP8rGABzMuqnjvH1AHPc/ttuGOJTGDNT51UNyxniN0pJ+yT/olD6NthXO
	70m9yn3B4Yrz+gsULzBRV6kfvwbCC5Jcowbwo
X-Received: by 2002:a17:90b:1844:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38e4b55af0emr1994045a91.33.1784282333019;
        Fri, 17 Jul 2026 02:58:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1844:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38e4b55af0emr1994027a91.33.1784282332540;
        Fri, 17 Jul 2026 02:58:52 -0700 (PDT)
Received: from hu-mpratyus-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm2661071a91.2.2026.07.17.02.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:52 -0700 (PDT)
From: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco: enable audio ML offload memory and SMMU mappings
Date: Fri, 17 Jul 2026 15:28:25 +0530
Message-Id: <20260717095825.3962666-4-pratyush.meduri@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
References: <20260717095825.3962666-1-pratyush.meduri@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfXzBTlaTVNf1q5
 C0GILAzchJSqne7dYnDbePW7DJJnTdOa72zEqVmtiqmyhf6emKMRC+/5XHDPN5d4CGMxqSKiQWs
 3Qp6GbKFG0tC2ZxSvl/yD/CXhp5AAh4YiAc4l/ecNCgUXGzSBulDG6AjeC0OZdR+O5elDUt4UrH
 9WYSSBbyZsJjo/3GTzBSJzfvjLvxq2KTb8+vZocdImqEx1kRcaLLFwvip9t542YU0rUgqTqViJ5
 x7gJcdTAO5xNK7tFTtBNUOCIoiHlaQZPfeGJPIHfo//1sfQOUbJMmuxFV/YSLDwQ4OzpiwgJWYJ
 V2r18Ec28Bgy9XzJAkO8/Qb4ABu6TuzmH5m8URf3NJVAApG/bbiq96Q8ZnjBX0kvPPO62KpCjN9
 9oDkJ5F5Zh7UpfO8DnRQ73FtHmE9i2ej0NwU8DRSJ7/mNaBm0VVTNo1GzEat6BXUsrmroMJbqS9
 FDHVLLR3y4NWf5j2pbA==
X-Proofpoint-ORIG-GUID: Gq9kjQXP_0FMNfPiP1DNBM4qTMtEe3fs
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a59fcdd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qtuJx3-IUi5I1-Rgc4kA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Gq9kjQXP_0FMNfPiP1DNBM4qTMtEe3fs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OCBTYWx0ZWRfX0AFHokCz+2nW
 It09/B3spdLYF6s/AeUrWt9Y4flQNIkx/aHjGiMKKGChQla5B9bNy78PyjW7fJfdQ63qxxD5foi
 +/JGuC6cXQCGA89IN+7R2ZIfiTSK7tI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170098

The audio ML (machine-learning) offload use case requires a contiguous,
physically addressable buffer shared with the audio DSP/SPF, and issues
DMA transactions through additional SMMU stream IDs that are not
covered by the existing ADSP mapping.

Add a dedicated reusable shared-dma-pool CMA region (16 MiB, 4 MiB
aligned) and wire it to the q6apm DAIs node via memory-region. A
dedicated pool guarantees the alignment and contiguity the DSP expects
and isolates these allocations from the default CMA region.

Under the EL2 (Gunyah/hypervisor) configuration the SMMU is fully
enforcing, so the ML transactions are otherwise blocked and faulted:

 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2060
 arm-smmu 15000000.iommu: Blocked unknown Stream ID 0x2062

Add the ML-related stream IDs (0x3060 mask 0x9, 0x3062 mask 0x1) to the
remoteproc_adsp iommus property in the EL2 overlay so these buffers are
translated by the SMMU instead of being rejected.

Signed-off-by: Pratyush Meduri <pratyush.meduri@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-el2.dtso | 4 +++-
 arch/arm64/boot/dts/qcom/monaco.dtsi     | 9 +++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-el2.dtso b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
index a7e3270f8609..97bb8287cec3 100644
--- a/arch/arm64/boot/dts/qcom/monaco-el2.dtso
+++ b/arch/arm64/boot/dts/qcom/monaco-el2.dtso
@@ -17,7 +17,9 @@ &iris {
 };
 
 &remoteproc_adsp {
-	iommus = <&apps_smmu 0x2000 0x0>;
+	iommus = <&apps_smmu 0x2000 0x0>,
+		<&apps_smmu 0x2060 0x9>,
+		<&apps_smmu 0x2062 0x1>;
 };
 
 &remoteproc_cdsp {
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..d971c0ea1b30 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -729,6 +729,14 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		audio_cma_mem: qcom,audio-ml {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
+			reusable;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0x1000000>;
+		};
+
 		aop_image_mem: aop-image-region@90800000 {
 			reg = <0x0 0x90800000 0x0 0x60000>;
 			no-map;
@@ -2844,6 +2852,7 @@ q6apmbedai: bedais {
 						q6apmdai: dais {
 							compatible = "qcom,q6apm-dais";
 							iommus = <&apps_smmu 0x2001 0x0>;
+							memory-region = <&audio_cma_mem>;
 						};
 					};
 
-- 
2.34.1

