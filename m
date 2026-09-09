Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C5D576EBA
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965952; cv=none; b=teXhiE5MmPfU85/CFLtz4pF14F9u+ooN3U5hIrhtrENXn/cikk2t2UyFm3/Pukhd1ELfpuKV0+FHh2XZGlovroQkOKKmXG1FwqbTw9fJx6hsIQUJcs0obCAQHRvLyZiPYK2O1hL5mwmXFM0lvieq5bz7zxYZpzdu58iB6yOVewc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965952; c=relaxed/simple;
	bh=StvgNw+pe2omeRrHk3YDQ6MIS0/aEVQbNU4SMSBkStc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2C58gcNqD4N8C317/xjdVAxPPOv9l5jeAjCDX3uw6ahLBinXPIfALH/vLlUWzgHTQgJA3usHWcxW+1/b7gYsWKvt+e/Kn0A2h1HhZ+SV4ANHAjKgNM4A1QQ2UfS/7LRUeQ9KaltHPJ5mBTqW9On4L1zTZj0yhWDNZNPTgtSyLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ivr9YxH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M//FmHuS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ivr9YxH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M//FmHuS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2Ox2019097
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 14:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BwY5ExWkZyWwE89sG5pR6kP1iflIUkO/ZodZnwri+kc=; b=Ivr9YxH7qjz7TFd7
	PPE6qaKTy63Q1+zY8AVilirKheZNz/of55OSehtZ+CSR45s91teD8CocsE/MftOE
	t2Yvft1JPgkD1Pb6bR62FtFIuJUM/t7I9n10M5SAR5/To9X12bMKWrbHefjPRUUk
	YwECt2ZvQ5KwQyf/Fod9l3jL0yZ8bJO4FbJStq2sPnYcE8eh+fYjJzKbee9unQ0B
	Q2fOsmgXzNsdMqSSnqqliBb/z/sxuZlTqXIRb5JzCdL6u6DvKraQEnj+Dyjod8bF
	pKrBO/0QVAxI10BoHGCepbs0rabt9wbVjjaSsKcoPxKEkjQbl1igtdU7bAha+7vB
	4sbIhw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x900g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 14:59:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc487bd6bfbso3288661a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965947; x=1789570747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwY5ExWkZyWwE89sG5pR6kP1iflIUkO/ZodZnwri+kc=;
        b=M//FmHuSWeO+6MSVPaJ4i6L9kT7aQh+/2urVeXohMqMAxU2JkxzPdPfbZB1BFmIo87
         YL34u8EpTAAy9sdsel5DHkPAdDgHWF0qtp5sLAY54+uOQvnkAzQDcVUcDoYD4/ECAUeI
         zcUfqPAlICtDtubfzWIuEohepVFziLvIbDmbZ86qXo1rdG9/XctdJgYAQKgH0SLkT6P+
         OCV9bZaHjGxQDG7myMJI7B/uIz0J2lQJE2TNqgb4TGVEJVe7bQosNijQJ9XYAiyyCxzk
         WKRU/9lW5xLwPIG/eqSV1fW0FCKG5Lt0uvpJpjsRokCxIPf9g29QnXAJwGw5G6BcvHNS
         NVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965947; x=1789570747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwY5ExWkZyWwE89sG5pR6kP1iflIUkO/ZodZnwri+kc=;
        b=jzT1bJ9LXUsH/oINLpbjtf2QNCm/IsplquK9vfVDIRNUeBS+czqQa+LyphvhXGTf25
         oY8YEZfxDIZJwM1E6t4YGuOpQyRpmz6j9DCl/u9pJtMYrAsbJkrm8HxGaFt9Hk74j479
         ZLvf/6Sig4DRKZpXL46FWR0S6ta8Lnn8s8ZumtIafBOLvxZmS5+l8WzAVDaPFrsv/qvv
         oWqUsWhf7PlaP4kQbkvEjzZDV63p378KjUfE2lHMMLxL3trO0MiPXzjb6wOA/I17S9I/
         jHkgGeqch49PnQN7aWihyjw6J4SIztEYRdv+w20ZgycMUVkyZbrzTvhNUZ8V8hKvH+XX
         Y0qg==
X-Forwarded-Encrypted: i=1; AKwUvBy1LfGCqoSSaygJolFmbOmTynRFCGgutjGzijMSO6slYX8iLFuOndttGDpuUtOtqXKOtur8EDgsTo4pTRMo@vger.kernel.org
X-Gm-Message-State: AFuF++nmaO1qWOhdnQa5GflaihB+FznUadJE8/825KzoKo7mw4g0STkk
	qn+GjV+UwycIhfr09v0kzXQQxre3jLvR0O49jVh/enVe1DOssjBIwJWH7WFXMSsdEd6hN2qv6LB
	61ptbc2MTf2iOkzKR4tsgxlinJTmx/bz8asVWKxYD/XdZSqUrpcvdqjIa/9rmIKgrnFw1S51z0q
	rU
X-Gm-Gg: AYBFou0lMaG0EzkW2yrIWiIEjkmkL7ZptT2tPLkyYQT7q735zve/+3j/BrJZ6t66mjJ
	9FZmFVN/J+2QOAiMJNFXuc8KSMT6ZLPO9gWCYw5at4ROCTNOVMcaZeyCmD1m5RggowzxOUOihT3
	Le2vC7k3mHOtGnIbuO5TE98hMl2bA7oRyrbAaQG2z1EFWuj0H7TsIUCmcUQ5KWqxOKB+s7cMDld
	PSMnJnPMnlW20pctahdKOPOBXslagX8oQ6+hxAGZiTX/gbheeohbrCTSUmHuMj8zpVO9aN+mIkO
	w0KOClZAlzrmWJz5ykCFHfye9MC+bHpyoHWc9Vs6mv9r58/ul7iuPD5IWffW+5H33Rzvn6f4dsf
	vh3ks5W0rxVgAITaNZbz1PnaxK/O2ud+2mco=
X-Received: by 2002:a05:6a20:9389:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3da39d13c08mr59841817637.8.1788965947335;
        Wed, 09 Sep 2026 07:59:07 -0700 (PDT)
X-Received: by 2002:a05:6a20:9389:b0:3d7:eb3e:1c58 with SMTP id adf61e73a8af0-3da39d13c08mr59841748637.8.1788965946852;
        Wed, 09 Sep 2026 07:59:06 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:59:06 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:19 +0530
Subject: [PATCH v3 12/13] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-12-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965841; l=3422;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=StvgNw+pe2omeRrHk3YDQ6MIS0/aEVQbNU4SMSBkStc=;
 b=b/mUTIVBUglZDbnOFxIiJehQ/XrYuF7nJRGrtjY1XZlBH+TGoQWrJUEEG7WCGnRhkWGD8Db05
 o0SQiVdLKb3CZ907/VF0Dkm8PNycJxIskf9osuYA80mt1p4b3ZzgLgR
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXyn2aSahir550
 GlACqRHeG9UAc0Ytv/b9F0cEP+RQqk2Bygf0koM1fF7h4/cxxVkkXzf2PjaGamiRd1LCX2wPyEa
 dLH3iwnUTRTbJw/b8+wHnPhDPJHDr2M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX6udlAVJCPuE6
 jdfm5Qog3rL7CG/x0N93aBuTagWx3mjZBBXp9yjp6mtlG4So8Lh3xdx2zkLJldoysRtWVQS9+xy
 DTzDaS6Xv/QEYHSLzNVDqdmZtxyMO1ArB+WPYkklOZdULvhoXdeHaVIE3czKO2O7Iqltyq99l41
 ztRBS5UbDisYuq45wuL6hasGQwY3F6MG6MHiNDzGHRZsv1L00bSI4KJVVYi0ArIfRkc4tP+6P2w
 P3Wj+F1HHGSOKErXZ9DuOG9hxeT7UQd2oKMy6lvc23lGSO/oNrJYmQ9pcZcyuLBG549rAghDtXz
 0eo+FWt//T1fkaUmJulHHFCWtnlHfdppeypXhStgt+F9/4RdUM3E/5PzLSBUrXTXOKnrzkUw+wF
 5K8YKYGVH7BCwagERy5VVkYibgC76dT15cS5UiCecwzOE/zG6/Qz/SEd3v2ufJQm2/zrpgu1+L3
 AeulD7FEvFpMommDcNg==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa1743c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8
 a=w7pRem5UOBajBC5HA0sA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: T_82IQJ43zUpRUeHKNvBFoW3KSEZFaU8
X-Proofpoint-GUID: T_82IQJ43zUpRUeHKNvBFoW3KSEZFaU8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Tested-by: Daniel J Blueman <daniel@quora.org>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d533f2ca42316cea6fb34997feb75..97dad9c7f7fc47451d14620700aa5ec9ff0d09aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5275,11 +5275,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5287,6 +5288,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

