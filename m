Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06376396560
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404574; cv=none; b=Y4oHjIdRaCd6DoFwhUPdoI/FvA7ekfXVMkZvWZe77XvXJKAVdN50wu0Env66oYwyCHrIZNRccN6YzYmg9zQPNFTVaXVric8BUOGeEg2bkXEhcAB7JH2EDDNtc3IqDUAl2LSqOwbHExkmqqXtvSZf7xsz5gHhUphUXVd1fEmO+uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404574; c=relaxed/simple;
	bh=gYrrWAAu3UM4XmJOH+Y9uqQA/KhAPozl/f9r3EEBGVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eOMWq+fZLXHZiPvc7fpYnWfIXQv34lmFKTtypdvl17NIH4UWkHZNRKnXRxo+ss4Hi0n7V7il6/dn+sMhSaVWd0rDyjP9kH8K4PYAjsyIdEk/cJfb3G//E5hFYx9IutwP5ijm7TTJu0+bt7q0SekJ/luiE/CYRAxztBNwBtj7J6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fsGJnlKU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/KxtgH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fsGJnlKU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/KxtgH+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6PGsc2570329
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:36:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=; b=fsGJnlKUrvRKOa+a
	zAyk2+LTcFZFkQqre/fTyeJfYN635EqIYqOu/h/TF5/p0goUR3BUt2RXwXgtW30N
	TrgBTwGzq15K1/FRzJbCW4I6E2CdL/HPxLVvbPLKZAPWM2XPGHKO3hVv9KidIYTg
	mPSchRbemm/8K/gijEnc5dAxKlazauYq3Z8wuanHT5iqbgSdVc81as9Ou/zErmV1
	VHut7zj3uIY6rD+C0kWFrh4U9JwIJZyR/gld8Awb1WgEELAy4KsDurV8+CAs18IQ
	gnclWAhuV8aNLmILjnWj5ueOBYwdHz01LOa1fCv/wSV94KG+uUrC9ZGycMHs/FHj
	InLnNA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6e80926-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 06:36:11 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3411255eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 23:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404571; x=1791009371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=;
        b=H/KxtgH+kcsjDNhozA2dZtekWcF4ja0R6BvVjLIq467I7bp0aDWoz0N/F1PRGEC3ZX
         qlGDqS8Otw6XpYo7BYsbsH5sAFh1DZR2aIj6BhiCOh6pkYDnDnH1GT/8bOnup8hwHjtn
         S/TxLnz6bPzs7vK8+XoU412IH6QT8GX4Ah6LneyABlwepFZSFnuqFbOkOOqOvhPJ36vr
         wAMRtWa7y1AkEB+6dE11Jk6it7i+8tLom17nEAYJEHMR/5icv9KrgTLsnEOj+UYzCkI9
         kyhU+XcMTROMOckk+vT/GF2Y/JGh4G534XibL9koq+sBkE51FfWbtY/MSFKAkO31AdsS
         7WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404571; x=1791009371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=;
        b=PNtWWShxJdM8nnv4yhAZrayUngmSuwnptjtbgcmeFQ32Mxpm7M1W/+fBxbM208mZce
         Gc1cxOnZbS17ma/F3Xzs3IhGXU1zk2fAJqSp0xNUP7jI3wDjYyg95CKxIpCET1Gy9+5i
         fiiI6DxlTB7gjzaox71STJLKT+U6mjuwjgVfZoNIq/QzcYDAsu1jWXFHW4oA3l3f5ESg
         mEhCKJCcdLMl3iO5cNSFLpra4ABYXdgWmFC1AhPINfb2rKCw59T0T7DjNzSXeE8U0hNe
         9Cm6HBut1fKLsaskh9bn/AZZx4BaTZ98VQUr3JgmO/p/Z0f1QfxH4d+Y9RTQA/85uxMD
         AkTQ==
X-Forwarded-Encrypted: i=1; AKwUvByILdthuxEnvn39KZC4ZPrkuRrgQuKzq9tYn5damIsG5YvvKMVBhq7n6yktPEI/6sv0a41XynD6zBmdg8lo@vger.kernel.org
X-Gm-Message-State: AFuF++nBA7nNeXwUvtMeMhpyU9B7LZFtjv+KHtORCqE7FITBLSvA9c67
	Wfz38Y3L8BNDFXANcxUWarpQ+qCXwsAREnDxNk21omceeOzIlCehVDl6xYg+QIRcQ7LbGMlII5b
	e8CVPH7zHnc5JnYCYupGFcPN36rRbtX+o87OviawNEKrLfw4alCn/1Vj0IrR9q/DxyOhT
X-Gm-Gg: AYBFou2MqEPg7giwbTlWFQIw9d0rklXpwnhkkpgS+HZcOQINGeigacYxGJYnLs1tqej
	7H2eXgRt3B5syYRp7nMD/UhLFfOLNWUV2NXTx6eyokGbI8CaMI0PH6U/3XHrWfKZbimwmUQ5Aou
	aw47EX6GAOlrMXPw1WYulfFeE+O9JtqF1/XRiNsOLBAgUBbJcZfe8IW1ew6Fu9eD08TwpnXCTB+
	Q1piLMiguXwIR5i7NKb+fJEbkawSYn6Kg/gIxnuLsLmPT7eOxA6igoo0eMsbgjyOJiAeXsxfc6p
	VJQvu+rDkf4BS5VxAQVLPFi6FllWlFhDpO9pij8A1eKdbJzLTfk0hXQ0nPEsZIiuP/v1qmgiJ8Z
	kNV6XdJ2E+VvorCmgPmAOIK4Vhqtq1wFS+A==
X-Received: by 2002:a05:7022:ea8c:b0:144:fa24:9eb5 with SMTP id a92af1059eb24-146d077b371mr2309488c88.34.1790404570699;
        Fri, 25 Sep 2026 23:36:10 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8c:b0:144:fa24:9eb5 with SMTP id a92af1059eb24-146d077b371mr2309453c88.34.1790404570022;
        Fri, 25 Sep 2026 23:36:10 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:36:09 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:12 +0530
Subject: [PATCH v5 13/13] arm64: dts: qcom: sm8750: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-13-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
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
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3606;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=gYrrWAAu3UM4XmJOH+Y9uqQA/KhAPozl/f9r3EEBGVc=;
 b=cVzYlf+21Qkyg31UkTICAHS8cqDTjwIJ490Z1MDqYpbsVQmWntw0Ar2fcyFNznBufUXOkcG4j
 YauIRGQPqGbDhovDhtD4mRId4TTMMwo+RWWGvsrloF8EecXEEQKcEjS
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: B3S5OfCNUY-DXzlD7cPexAigVb3Vjbm0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX/h2FxKqkrAYk
 9jzKkLQIXWL71gdFz2px1ylY7BCdqGmeBRkmZHuzNU629DB4jm6R8X80fiXSiUOA18lTxFKe+cD
 xiQYlDpJ8q2WBHtZEXsCu1qo+MesNPIWoNAZoqbhLVMIjCsXjAjmIdqWd1e3RFjLuTe20ui1vgy
 VFfOX0n3suiyp73qoe8TLa1oR6nMIlAjQjukZlrAVq5p4XhhEx/yY/pjdnHvFAZAkPJ2BCcCWnH
 vN7F3TrFY45KYjMG2c8qGsRnBxxUg116N4myffxvZIK2W5ngidngcv1BF7lnWD/2VRJFYNRoZ/0
 cM6GKXVg2E8Mhy9+QzA/tDhIbhgHvEQjkHyom4dmNcNaRZaQBFicgOI5+6YsdIA11YdrmYmSw14
 NTv6XgIcQzoqBtLVaOooGv4S1iSyLTxS42+T6xURE2VZSOCqgfak0HNlVgFaftzYdV/dNJJPpXE
 J6g65LpYZv4PnpdEcZA==
X-Proofpoint-ORIG-GUID: B3S5OfCNUY-DXzlD7cPexAigVb3Vjbm0
X-Authority-Analysis: v=2.4 cv=aIFlOr9m c=1 sm=1 tr=0 ts=6ab767db cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfXy4tk989mS8mR
 OltYwahj7NdTtqofqqrfD8C2XmMq6Z/2k0tTGv6VyY+Uyu1bbjNlqEya7JRy7Pxkr/EXzljOTgb
 7uhYeQqUWsgnY/sTdyVLcPC43HlxiyA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

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

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d01413b8e86be3f6330354aad05f2..2e1e07eb5b6aa49850a7a5572ef9e755e298b799 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3025,8 +3025,6 @@ iris: video-codec@aa00000 {
 				      "vcodec0_core_freerun";
 
 			dma-coherent;
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -3059,6 +3057,10 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "core",
 				      "vcodec0_core";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable in boards where the proper signed firmware
@@ -3066,6 +3068,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

