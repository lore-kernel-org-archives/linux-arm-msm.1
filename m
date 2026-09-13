Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAB93F928E
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325460; cv=none; b=fY/BFwBxWNjqvV731cRvISjbjBvgTK1sYJBUutkz+7jxckVfcqK/ZErp78Pq4XZN2vH/Cw25poZOzytEOako9HpbL2N3/q5vMOKfaN7raR48o57FGpV5a8byXY00QcEQpNAT+00s53eBWS7Rh3RQmMbPQO5aaeSQL3wxBa6L0TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325460; c=relaxed/simple;
	bh=aMjd9aYFnA7xUvSYKyRihpubAtnTpKk18gq2dPNLq2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dlMC7lKIXlM3dmOx8xFRCg3oEQRAx9I42uDmolEeJOa7kGOpZ+VxmdxQnjS0N90R4RnUJoa+2H84yXNHVS33qpePDHaFCV7JAThpxGz0FOCNv+CrGK1LJHzp/Nnn3htt/vtMdSNWRwnZQosLiL6ZOEOuQzKMoCvSGA0sACdMVPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJNAYki3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NYL9KUWe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJNAYki3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NYL9KUWe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI3GiB1193268
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:50:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=; b=YJNAYki3njIkq+3+
	s+Hk5kP4GzGY9RxHHQ/vVFz7fa/f6eH+PMCeG7cme5Ys+4tOMXlRnbAzDyvtbH+P
	s1BExDqtq/ocY4wpnMYftO40rgVTVGq1PqQSJlB+rs0REo0vyfbe6GRpzc1bkeOn
	g8x7JoCyjEtdiCvlZUgidvyGPaHngQpBx4N1WTYiBIF1X7s4rEXulTduuXohy7z0
	Xx3TJ7UZMk4/kP2VnnZzFildFhqvZoMnu1LuRG1b5zFEScNzC5zDLA21h3oGXyZF
	ccX99/SMhWSQetrQHibf08e0PYQSwZA0NMT+TUNDDxNO1NJaV3/7SxrRBELt9LTe
	Mzwj4A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh3t98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:50:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd1631d291so28121725ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325457; x=1789930257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=;
        b=NYL9KUWedAE1XF35/wWOCl5GhPMYwq18kUw7UsxmyY68nPpIhEWv5yo1mJR2W099PS
         mKGiJYZi2vYXy/y0/vkpQ9BRuXS0WXlmrZ9DZoy24/L66xVWAbEUbrQxrqq7t7Nprbrm
         VBn+2gHQDeEfSkG441tsYtB2h/XrGoGL0TMvntEUaR3suyU8q74WTLfXwgKw1KQpNF2k
         R493jMNNAzxRARU7xkk7hiO+zGQcraboLQpOc7GmmJ/h4NAKQMM444x77Lb6BiST+NCs
         iuJC9ohK2i9kVKkl4yAoHf4ebwua+T1sA5rWVyTFqbR8UJIMFqWWARoNQyp4Ta5qPvDO
         hrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325457; x=1789930257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+x7UtvEzgjdSrT4tt1OzVc4/3CO9RvMlBltyh/a/30=;
        b=AdDPNnnK1XfdpY0u0vh3SFcivEOLzcKPeIYiOl4ot3PvP8pt6DWasWk5iBUdjrJAx3
         qOAqwLMTDnEPTBhmWED7khEsQPAL7xceuMUdnPyxgJRwVq0KTN+r6mk2Go84HkYo4uOW
         UPUEEoVHfnkUZBfyHE5WypojmgOomgS5N7S/iy5q8QICLUnqjjT1F6Ey3DaPu/hYi+9l
         Ak+Vfe1FwU6VlVNsfShU9Km5IqdupkrkX8GWFg3cLGE/RQd7KtkOpIjdL7VWXrknmzs+
         C5ULsg5ms1HGGQSWl7y+ge2XV30Vamj1Ryn0zyrPGKCLG1SrMQq5uNGqOo1SH/YkGG3V
         irGg==
X-Forwarded-Encrypted: i=1; AKwUvBzMNKO7UB4Alix+TdQ/xEgcjsvVOMlOMCdwMrvZ7/4ji4ICNoMKhcu34ch6Ir37zvckIcgyGihE63WjMIhX@vger.kernel.org
X-Gm-Message-State: AFuF++mIKukZ6De0PkINqA250RC0ZDoTXIDISAz/RsmwuLC8/+/WJZ+E
	kMf2Z82ZBFEmrQYh5JRlEyjFjyfz9yBVQ66J0vykAp2nlRZGcGehM6byuEabbrIVp6TXvLrl1z1
	zFxx4z6hbcl8jbaGmTqBoJdMKmVlnMqV1C7faelK5zUBgZ1Zabnp1Ac8XoYvXoQXf2i9f
X-Gm-Gg: AYBFou1IB1EgX8/lKzatgKBmSMxJAP34qtk+C3C+7VhToCmjSzVofMCcuX9upVwvk7Q
	+h8Y48mZq9nS8Pd2fO21SydvF2zZwsn8KZ/nMF5axC3jgXomAV+A0wIYmQGlGFm0e+gyTwzm0pc
	lgRwLDRLb/aUjCMsB6KeYJlx9P/zT4KaBMGDgc/PnBLpOEmkPh7W5wLHp2Tlknsm0ABgdAttFPA
	KiMii9LAfPIkX45MYL5sc2ewHQ1hRNcdF8TI2vaRxrdfhamQMFNjAHsvmP0nqDj+GQIH0d/XCZU
	QgSSzGiOtL5SKRji8yyOr/ZVhIia/HkNhQDu9yrBep+6pSY/W6B05EAb6MORTHtMMhhSkGXVyTh
	Prn+Z6yyiPMYw+AZyD44U/QHxHsxEjqo8sM8=
X-Received: by 2002:a17:903:1b4f:b0:2dd:40cb:a054 with SMTP id d9443c01a7336-2dd40cba32bmr186298745ad.19.1789325457344;
        Sun, 13 Sep 2026 11:50:57 -0700 (PDT)
X-Received: by 2002:a17:903:1b4f:b0:2dd:40cb:a054 with SMTP id d9443c01a7336-2dd40cba32bmr186298245ad.19.1789325456919;
        Sun, 13 Sep 2026 11:50:56 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:56 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:26 +0530
Subject: [PATCH v4 09/13] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-9-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3295;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=aMjd9aYFnA7xUvSYKyRihpubAtnTpKk18gq2dPNLq2Q=;
 b=ZXgALxYrEDfJi1Rg2+EUjjxP35Zcnlz2ROOmWEgGpZSrc29xppYSwMvOKEmMNW7/uyfWNBC4y
 sVLprhTofZqCu2TryGSwv/LXcUAHmysw9hzNK/80x8Ok0LA9go2gFBV
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 9TPUU27G1mv3G5P_jnk6WqeqWNHEWEQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX/Y0byoz4d09h
 8tJ7g85vaQ+wvGETq/8gRpDdd8cnEXLrQd8GBMo0FhgXxFf3xYeqWBWsMPE0Uw40/OD0mGxU0hE
 nKEmCrpiKxBdszSBzk49Kxk7HpHhQUU3sYv+0AIN+dYCQyCPZkkwq9UfwADcVSMy4svG7fPoX/K
 L3erDWhochKCin+3bO+ZSIxtPTNBbgy/Z76fr/ctYps57MK9Rq48vYIwlZrWKl5b1HtumFT9ZAI
 2mrUx78U6MjfcwLIXzZzTGs/H03Rnd3Ixz+L6hZRWuaZiYSUpYjFut+krAng1pGQj7olZaHJ04G
 cf+VEoBPsAxmaoSsT99hrsWbFuTOF7xJgCkNT2awBhkFMsOdkbm3jhB7q6SurmlC+ASeLuEI8RN
 aSk2NPT0cepi1YGfXoxB3nxnPRrLg6kDlmPVRKgUMqGfY5wU66aj59IpskdN69CeCVskarKoLC4
 +D5wi3IZKGc3POikN6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX409lcP1nNj5k
 dURfP981jP2dgkemiuXruaEZMAnuXtBM2KAiXb9zdQJWSfb4LBaYqFhMs6c+cPi1QZXhj12VmEC
 31nXEYMbbyeTXiHjFMudCOyBr5BcUEc=
X-Proofpoint-ORIG-GUID: 9TPUU27G1mv3G5P_jnk6WqeqWNHEWEQa
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa6f092 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

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
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 23604436add303348867f890890f2f7af4f831af..60164b853ae0764cdd79c4680490e66a548b0613 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3690,8 +3690,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3701,6 +3699,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
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

