Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1A5244692
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091395; cv=none; b=rQ/iuNH9uZJOm8pV9rj3PmbpYE92N2Pn8OE9luoCe3kWQYspP257oqMpSDQOMAi7zar2gavN4FPPUigWHR02kQcmD2XFylIpDk2HHJZOns/swhlcVtfalRDxN3cMld+p34AlpPn2bB7GVebqdeZjgJMVMs6hGnZo43qDb0uDE20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091395; c=relaxed/simple;
	bh=NcRnqd4sYJJReoylC3D1doq6zdZci+40LL7wjhg+ZGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfnQbjm9phVqN2KSYVeGimSFPHkRz67acVaGI1c6ml6zX5bRvAm0xfeVZ5vgqOPUnLH3yrkIZmAeVj8Fah0d/lrI1xeL7/arv+x+pseX+B//cJR2CzVzrNjwKnG3FhpesgaWKbrGBqKX8TheMCJAbZMm9Gp+IEY8Ca2wpfZLoc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dbNbyIFx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HQuaJzO7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dbNbyIFx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HQuaJzO7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67783PP43252457
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AkLrwKPFHCepF1iEyuo4eWPPMwpLyRzoLjLjsp/fIrE=; b=dbNbyIFxHiFrPgJr
	oBcBSEo+25R5oMNLHCUpxQD3fdKKnsTSL+LJmDpy+2v41xnIQHAnnF3566cJeWEw
	Xs0Y1D9ruN6JbYKfwLTjQyNgZs7BNyeFeYVH8E7aISQOz1YQ1f5j6D2p/fTwxC/E
	GNfCnmcFTbX5xIB+S+uYUmSI0n6+IBikV+srmavapxdDgqmDx/vpnvfXnab2iVcB
	2EDXm+fscDyOZRhWrf0QhsCAJ1oK/+ppRmzjGaUsGrLLEWomuAuy04zxFHcIzB89
	FnutQAVOpl2g2YOjdQT+g+nbELKkjwdQyVxuSuBfFx0bKOuCBYWqifVrWewYXH86
	kvrsTg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6k32nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:29:52 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so40374665ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091391; x=1786696191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AkLrwKPFHCepF1iEyuo4eWPPMwpLyRzoLjLjsp/fIrE=;
        b=HQuaJzO777/ccPPo6/tIyozK/NQ9n+Rq7oLmU5xQDUDz+cn8HSqRriYXwnbPILWCcP
         peSSzfPxZsnnJgXbcDhRAf6DK1R08QwubZbHhBWax3djkYlWCXKp6ha4fszcKExvFj6k
         jx3FCWRmH6YQ8a8Z5ZXr/zI9CIqcL7EnEeHWDMmqVIFv05vDMIaQiWPI3iS0QDKd2ONV
         f4mBfQzM1ZG8C3qn2RI6FOzujpQQcMBzmdR0L3wKHIXVDoRUb1aaofqVZ6x+2psDub3j
         nLuszmD8zRz6+Nh18WXFfwCwuHqwWyNES+xq7aW0mlmcm61O5FlW2dbHZrciKc1vo6lX
         H0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091391; x=1786696191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkLrwKPFHCepF1iEyuo4eWPPMwpLyRzoLjLjsp/fIrE=;
        b=BS8NL4NDeGwhKBXovDp0vv+lkD+T8sjJMEXQVhK2+lVzhVQJdHIqDBLtdDtzx71Et4
         1ekh1ECjwZyl+D6a/Gc7rNHCD5cCyPVjK3XjyMjL+cgs4T3VF2+PXd3l6vGmuudaNSCz
         uJbf8TBTwxsjVLfnQ+gDUcTVhbqMsGpL+g0e9mFZmp3Tv5h6B1UDjTicbdjhwZK6vSc6
         D6XBTrqFOMREznFhI0iqbx+mmyztVoUmAe0Zupu7SXAel5/TMdPbe5OvVnuWJvX2vf3k
         F6VYMfUaxINPX9RNeocuYOJROQpK7P4UVrnqOPF/H0Kd4Fp7RzbzXoQcRm3/hiEqJ1TC
         kyLg==
X-Forwarded-Encrypted: i=1; AHgh+RqDVtqmolkkoJCwvCwFVf8O2ATpwSAT7uYrOvz2UbNlNccTjryraRiwcHGKN1doctzsbR1BTWItHLfD3bF0@vger.kernel.org
X-Gm-Message-State: AOJu0YxNdusD2Ay3rzBlmw2jQR0IzrE+cYlL+N7oSBdK89dBYXjBWQTu
	5C35/kYF2iSuKR2vs2m0BkXBYzT6u6S8rgKno1l5UMguu6zFJb2908AwyFqcdayKIzK8zEWNgIl
	lSMSM6nfwOYApz0hXr52eojTCwFT9E5+WZDokR9PeWmAvquWEfRap48hp7RjROmgUEfc7
X-Gm-Gg: AR+sD10vZOdH2djrNQ604Id5xb0GSxRwVf2LniatGQS6+5R/DdNeSU0EVuW0BzAeBZy
	cqFS/gSVmQUnseoleQ+fVSOAUqv2yYNGE176ZTNHIJxlzGqxkK2QcEArQpaRUSlWBIeyUJhrupM
	yYzlxLlu9Y8kah7e1EnWWg9ujJpx3v100DqaOIqofSpI5eptm8g82DBhbiui4ObE3CCphB02RPO
	GJFse7GgyrnTRzByh54umrD0BB+df63YyyoZj9gipMSgq2pHy2OuuX4NNm7JWW/Jfimsm4lIJhD
	SdZZhcUflVdMbLf0n+Dg4XOXNFrqFxaY84D92unQDfSi/wxHXpu8VezGcNwCPgn4L5ZGoxQjou8
	v1SIm/TePyOsdyPAWhL+CQdDWmjwE/OH2lJU=
X-Received: by 2002:a17:902:dac9:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d106da916bmr78029075ad.13.1786091391459;
        Fri, 07 Aug 2026 01:29:51 -0700 (PDT)
X-Received: by 2002:a17:902:dac9:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d106da916bmr78028595ad.13.1786091391005;
        Fri, 07 Aug 2026 01:29:51 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:29:50 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:55:05 +0530
Subject: [PATCH 21/22] arm64: dts: qcom: sm8250: Reserve low IOVA range for
 Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-21-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1959;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=NcRnqd4sYJJReoylC3D1doq6zdZci+40LL7wjhg+ZGA=;
 b=auEYeGTqw9u/jY8bZHyRlvHqygyLAqvH2EgGnBZRyhg/6vz6QP2OWV2o/qO0Oz0dn7weBlWkC
 pS4i55lzkgYAiC4v0C65/sDbMD1zOKlr98coKgZOc9Xl0+515s8qXER
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=RpX16imK c=1 sm=1 tr=0 ts=6a759780 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: PlCdtlVOZzOjonSB1bHt7ttbclTPqSbV
X-Proofpoint-GUID: PlCdtlVOZzOjonSB1bHt7ttbclTPqSbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXzH0ncQv/ExUH
 Ng0yKgh69gBtuXmWgMnTaOHDE3pYcz9RbIvTODTo6pkOfiyAxzoANImkLlus/f405GQ9Shy8OcE
 ylIWvDgX5/9gkFicKr4oMG5cdJKQypepw5w1sbiAR9JDAbZGV/9+W3JMHXPc4leZLaNQPOvc0rH
 WeQTBH3Ic5NvNaTnev5LMsxLp6kYOQl8N0B+UPyqzt/xRwRDnIK/Qwk5vkMAdbytmGfpFEW9pVx
 d0myFuqSShg2repCu9zFBZlEtJcFOkvCiR6ySFqJQT0V6slCERJqfk3XbVYv0QsXJVtl1NBtMiq
 R5ClFAKRAjftTiaqayFXCEt97L2RI/GLq3FPXdo7F8UikJLiboG8RNX0A1jEWNVw+3bmbmuZTtE
 JM/6F6wlUg+3G9IUxUYDE5GFo79OQPaVr8B7FpKVzSoH/XwESSjyp7FIoDcaDTAlZeScTS8IJIz
 GcobKxKvr3Svydp6vQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX+xq+8X4jeR9L
 2q2sFMrARxK4BeFVf4zeqNM3pTZCqvD7hYPq2rZD0rp47o5fqKkt9zLVLkgfmSYDepKDAl/uHkV
 AjxyGHC1niYfMNfRmAZFXe9okYYvj8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070062

Venus VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the venus node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e9fbfb8d01632ec65e3e7f9e5bf2a..4183414c956aa9cb71dd5cfac3d24f34886592ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -872,6 +872,17 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
+
+		/*
+		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		venus_iova: venus-iova {
+			iommu-addresses = <&venus 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smem {
@@ -4353,7 +4364,7 @@ venus: video-codec@aa00000 {
 			interconnect-names = "cpu-cfg", "video-mem";
 
 			iommus = <&apps_smmu 0x2100 0x0400>;
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&venus_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
 				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;

-- 
2.34.1

