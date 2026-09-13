Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116033FE66F
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325496; cv=none; b=u0k84GNCHq919vxVwgKPqVFCn0e6AmmI66UhxMAxm1MAN0FsIcGQUFd41fJ7Z93muND6T+o66hTw8Qh0GuMxKRvT6CalkYxo7LkV7GGPv+S64roOnglTJDJEcNNCVztfib5MBayv4WpIM5mjPCiLUZ665Y0xJ807wUbs2E5dGQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325496; c=relaxed/simple;
	bh=gYrrWAAu3UM4XmJOH+Y9uqQA/KhAPozl/f9r3EEBGVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGULmJowUBFxSLo8041Yro0yrb1rBAWs9seNYCQYE5CKED0ruPFJpuzCV4N0A+ADZ+HghAb3vpBwuhdooW2k0bdpaMD/+e2kp5aRskSvkOa+hq9y4V519IZJZwZGclkQ3RSL5JIJmCkR9ct5IsnjuFcoU4q7I/rdEtgB8XZ935s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAsOj25G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=buKVnLmK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAsOj25G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buKVnLmK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2kxl1192767
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=; b=TAsOj25GPSVtV4cZ
	/HOAuRYeNMie3g7dc3xikFe5ZDW2CAiyHAw4p0icaxSyabynTTk33tA6b663XjV1
	e03lpPhk0qEHYGfRKcVYOZ2NyfqK/6OMbqQh48vZ9USwls4ASZl8rZ6l55ug3GDv
	O9KOGR8iUibadvxRxA5pmHjsap/iNDLppaGaXQgVj43OnVmrv21R4b9NzDsCzkCn
	VT9n2siWRZI6CmeSbOn97Aic+LrVpdD7XeWv/PFZlBOXDHXsYQf7uH3gVIY4E0QS
	qxaAKN/dfh1syEopLDv1eEt/sEIMOfRvfdoGVzA4fghCkeKLfqK8SCWqKTUaFx6o
	Td0P0g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh3tac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 18:51:29 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso2106706a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 11:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325489; x=1789930289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=;
        b=buKVnLmK1g1UD7Q7mdUt5S2dCc8WivfxA7Y61Km1UDtn1bgNN5WxoHPdpSGPiUBVMu
         ZFleQdDWsAEPfvYvbvd8UAnWwEWNKFL6dCnll+wQGLXpO1A3minue0pfjNG2T3x6TlV0
         HgfUkUtx6IBCUjMY/vx2mpGBTEb8y/5S9A2kJuFbVLsPEbBNv+cHAuqRUmzQwHw3b+9J
         g4AgxTOXB/Fxb7mLu4r9TyhTKXMoe0suovegSjaCSYA3zemMGgz4FLOfR28JLzuHGOpi
         RDnWotQWyayDQhDk35CMOuG4EjzLtCJCGErApQHp4Zz1IICmpvRa8sp0fsAZcLi2xWeg
         bxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325489; x=1789930289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCZiOT9vk+oD3cSiqrNWNn+aGN0ogRGv3H9bL1TqTw0=;
        b=UphgGAlHLBFVKzUjr0ZrxZgj0JXfBWDRBL0Ula3xXMvjCKd3zS+GIrjgI708vWjBVH
         UNnKM3TtaeGcwOsP6+LdZMDmoB4AYyGj6T02almzf/8F49GJDb7N7u1NXXHF4aI3wEUH
         vWFxvbAod+9oeCO2EzUDEtgxTqrXVZ6S7tdrKfUpNSK0PDFLjrOUOQPNVaeWeZt9GH70
         HoNVr2Q/xw8ivobukw1l0qTtkr1t60nt5PA5x2ywLf3iGbgIcdo1aWmhLkc2GUlqkZRu
         B82S+lkCvsr2oP6CTkG1sYhQruEdCtJ+2KnrHWoAeIkDP2TqEaLqozrUCIJdyMxPHR/N
         GfBg==
X-Forwarded-Encrypted: i=1; AKwUvBykkLXfFGc43SKZ6ALfk/YTS7JZZJehSoPH59Fgi5M15ObZcMtqzXKmFBcTkhniSvNJG5JGAHDl2G10JayS@vger.kernel.org
X-Gm-Message-State: AFuF++ltsJboD0qrt+tMEoCNajmzCJ/6cwDE/IpKPZ8OkvYlPmapeXpC
	xa+a8huy1aNjwaOBYQMWDbiNVbc+sQI6NZfkRpx7V3btrYd6o4sp+YyZSGwRxZdve+fkVFi63Io
	C2byR4fZY6q/S46FYhzGXyIJTVfQ4YlRbp7rM4RHZAXV9SulHcQpOA/YXzdRYi5tsM9h1
X-Gm-Gg: AYBFou1Mkou4cfvCSpRgh/Gl1P+REXqQ2YtZMLDo0znUrr4P1DijBa3YCui7qv+U39v
	Px3yxVs0DC/mfGQWOhQB+EBvgURumfNowCgJXb7sUR6Ooq3zzopYSIi57IVPy6WYnZNiURiEb6N
	WdI3rL5paD5L6+rGZrZZ+Zq6LSCovu+vZ0chU1bkDBJ0T7Epyps/0faAgmn0tHjeM76h2v0Mddf
	U77M59SCMQONgboKsaXyjQHmG6hCBFaQSKzIUWpDC0bHrZujFYhXhhH56Cpytxt6bRakr418C8f
	+vVEqwzXdVLqsqRi+55uUUgWV2IxkiYb26XKfhRCu50JZ9aPGuJp87h8VQPzIM+6zqBfHh/lEae
	RzVPKyEWBcaLRneX3U1ITyJSW7xeAZcDy7f0=
X-Received: by 2002:a05:6a21:7e0b:b0:3da:f32e:b3bf with SMTP id adf61e73a8af0-3daf32eb452mr21465271637.17.1789325489150;
        Sun, 13 Sep 2026 11:51:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:7e0b:b0:3da:f32e:b3bf with SMTP id adf61e73a8af0-3daf32eb452mr21465215637.17.1789325488682;
        Sun, 13 Sep 2026 11:51:28 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:51:28 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:30 +0530
Subject: [PATCH v4 13/13] arm64: dts: qcom: sm8750: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-13-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3606;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=gYrrWAAu3UM4XmJOH+Y9uqQA/KhAPozl/f9r3EEBGVc=;
 b=Y4eeAu0k6A/PwtRusPc6pQKOgvqS3Nq4tR3EDHA8bebt+tl9fO5k0LCZEe/M4OlMMlya8km8d
 rDFwu/fzA7bA9mLcVEPilGt8+xCC5/GeMbmbLGH7nxkzQP7G9Vb/84k
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: yEe3nkyLuHFxPE9R6S0LAkUOIS4ufHun
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXwZRIUszEs7TS
 mn10WsMGalUOPcXetkeiZCYwq1eYgdgg737YfoJGATfpG3uYZVhzupI9zoy5uSKxZq7l2nQLFdg
 FK0qibXH5Fbe6Wji2PR0aSZLEgfvCDYIvFGNAy0RMo/El13jyeDIg6j0VIV+4L1eObfHvRamuz+
 xWrOu3nq7uIGgndUueNosO+MWMDW3ry7a6+aVvDcZ8gR9f7jImD9m+JvWiXIrjHQt1dkORNRY8b
 1fxEETdB0GxlQObFoLW6h4zW7kXU0jcF93gx0DvMYRyieVshuMFrJdd5hfTvUanmOxsojAkvBEb
 knLzmYWAOvwVbzYMquhGaJVjcXVW/zuQismaaZ+5FbD9anY+nSe1bbko8RxMPIbh78edqKO2X4l
 3wgIgADz0itttvfo3QkhmHKwDhGIstU8xpDBD+YLDXp8DR8D3KF06fb3Mu/nJ3col88GGdzvxbl
 nXrOP4ACPE7NOvxRdkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX1UqEOkjL1wGt
 jvMX+G8k6i0lBUrZEBPSKWsmn6DapTYJwLaY0x818CGMTuVRG9t6Snr1UL6vX+DcSZHo3HMVtIC
 QPLSETb9BauXPuemgRzAMe7cfkPj4CA=
X-Proofpoint-ORIG-GUID: yEe3nkyLuHFxPE9R6S0LAkUOIS4ufHun
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa6f0b1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22
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

