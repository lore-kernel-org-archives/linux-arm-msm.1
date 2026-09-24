Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3937A4AF165
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790266349; cv=none; b=cm/jJoeHJ0nCi/P4dn7icEuBsWOnX43/4Nwv2VR9C+EPBLpvfc0rrmefZJINo3OKwmRnfsaWy+OxtPeX4YB3yOVajOCQ4dPNMOgeF5WXtdAu3fADOFHFRMqS4/bbevcnnAogxtQqNgL52WCXnm7US4JFkSYsAjw2eXKMpkFEoSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790266349; c=relaxed/simple;
	bh=5zuG5UuS9qh0d8OU0nqDCnaVm1PSJ5zAsjRRiz8X1y0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=etrTVUf+C2YjcG2BukjVIDrLFlkOuzHqIllnsKYGoltYrkxC/+IKYeeTZbJwDyQYqlQFM5hYkJiVKNMAaTHSE/WlyLmpc26pJnaXcqZJ2t7tG7v+kdMSHIIb4sz9Dpu0gN0rCCcsrEjDToDmwu60kxTWaAfyCwXefCBHtuQDWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QOs8ohX7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z1ItwsFk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QOs8ohX7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z1ItwsFk"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeQnp3754794
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:12:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=netTNOSNf1m
	B9nADQhFYC6zCCWZF+fa/FiwvU4W67EU=; b=QOs8ohX7LM9//DGcmwub4dRv3K7
	3+N4VnmrV2hvdhLu7UrxXuij/QndINHyZifyVNzKTHXMYHbTC7jWpN8GfnbygLjv
	qnW24PhK28JRv3D6L1ff2/KUtz1iU4k/Meg2IgI74MbhwXyuEns//YOsKG6Jkdro
	yDAInmzMDlIf1ThnMkPpzocl91pE47ktOgsRpmJafUaJpZBbAM55XHlwUs2bJ9G3
	TCCjhE+XgUbo0nT04l9s5WE0I1soQZACOR8K38lZHdTPJKnyRb0JK+eCj+yG1F3z
	SBxLVM865A0zsgToiCa77D+CpVMzODbr1+C78te8PIUktJaLRAtCfNDPpSA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstukmrm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 16:12:27 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-895241d7405so43377667b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 09:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790266346; x=1790871146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=netTNOSNf1mB9nADQhFYC6zCCWZF+fa/FiwvU4W67EU=;
        b=Z1ItwsFkkLHK+FQ7AQ3LvyBr6Z4kTVz5NCx5i5qljM12quzj0mKsaeYMeVTiG5Ibz8
         6nhi6SIbYaaTNuYTBeAYUzyQ4DpoRp8xzjJfHzED9rjBh6x/0skZfC5dFvhEVhaTc2QG
         sd7mRkEDvtUdGdOqffuLNXmPsFLm9UvdZSijJJ8lJQ7bGEd+0KIqtvbLhQLyMQagESL7
         vnIWp1xiK/CK727VY6fG79piyaaGUp6kPvdNFPTKFRPum/dKlrIQ9GcQYgIBJe/uT58n
         AH9hNnJKnHXGBfN+C7tHSFQIgrc2hwLV/o/wXK3rcxxNDd58wjDPU3wOM8knKaQT4wxb
         17XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790266346; x=1790871146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=netTNOSNf1mB9nADQhFYC6zCCWZF+fa/FiwvU4W67EU=;
        b=0MQsgbzgoY8VpQJwtXh6MaJ8KN+lMawKS5Mk7pqS3oxahjU0q6UmjeIDtSXPXcIEmX
         OfFZPuv6/lz0xPSVqbSaB0Tj3yLaazEEFIDz/yTqmdNJMDiPmXeQj/UG31MbH1jagr23
         XEenDuwtw3Y0cgnLOsr6B1cvGjfKICBQ/SLhc4ZzYJJELTaNcsfQtd2Lhz0dGvh+h2ij
         P6/Y3fr9qxWLAobJPJIDZmv3bSIoFlSdviNgBOYm18IZ/wOMOf30tEUAuV8KCdbwjTiU
         ygvZZUoxxBy2HX8YdJVSASxRaouHigYkdgeq06cXx0urek8iftPSCzNeCO37LFLuFOpS
         4L6w==
X-Forwarded-Encrypted: i=1; AKwUvBwILgjH1WicmEwvF90FoFtdgvPiAkvff4mDxC79l1eWSB1xu0+8e72iz23OuC6Y9OLeywbvJPkWfzE4MjGn@vger.kernel.org
X-Gm-Message-State: AFuF++nVFFOxY/vNp0+f6uvNN66HXr2agrWt9/2rBe3hi0g+2qs7fLoF
	V0xyL891RsV0V1unROVA1XsC4nOc5zOONmk5NzPfYH5nk26neaI8/eiLRJBc5KF+ZZB43/wVzJD
	6GaXhvJBq9gSOufENjUvw+eS7JxItcQclyCpSkDA+T/wXHtqYgBvrV3+t8m4RgNbv6UZv
X-Gm-Gg: AYBFou11/yozE27bByXcYlXx3Q2tineB1i3lKPfmVvQM+Zi0qmiR0CqC29ZyB5ipVAJ
	HAQvBNnTdd4O+uu/cZVlKm8PoUd+7hlp8ozFl6ehvu4K3Bs91H93eXEtGn4Qh3jW6of6gjrWdEn
	VKGk9CM3E+sMQGfhtmFQJx8SPDbSV+wfxp7wV9zpjw4q9uLou5Ko4XqIherD+jFS6RCO1/m0clm
	air9sULjQXcqb728DvxXY1LnLI6heueqfkRzsfP0T8DbxE7l5Oa5vDto8mGW4pLPuC2axozmxAB
	Hf8T6AwE3ByRtEP34h5G0xXjoBPemqQFW4Bg2naL+GBLmlt2uYNpzivfClWl+vxbKIf3Jwz7rfF
	j/Z3J22Jn5fGDsKvt7mZRz7nTmXFY9Zsw2d6vKVzrlsrB1HxUuRY6Wz1cSjk=
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1795599d50.71.1790266346210;
        Thu, 24 Sep 2026 09:12:26 -0700 (PDT)
X-Received: by 2002:a05:690e:144d:b0:672:b007:dad with SMTP id 956f58d0204a3-672ed38252dmr1795554d50.71.1790266345547;
        Thu, 24 Sep 2026 09:12:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91425cd8416sm9698296d6.17.2026.09.24.09.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:12:25 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: sm8750: Fix videocc clock inputs
Date: Fri, 25 Sep 2026 00:11:52 +0800
Message-ID: <20260924161152.1162301-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfX0Qk7CJLIboVf
 fO3iXolk3ramoE8zyz/DKV3MvbwNBBN9uHNfP8EV8N5OrOLBA42fy6SdHxsXWRFcSPVDVDyzA2u
 mwM9SUlun5lDGJgCvPbgy0AGWgaaLzs=
X-Proofpoint-ORIG-GUID: tSPUG0voJ93GckvqSgxoHWNaI_rnh9ys
X-Proofpoint-GUID: tSPUG0voJ93GckvqSgxoHWNaI_rnh9ys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2NiBTYWx0ZWRfXzUkoORIdnwNH
 UToGSAIVdXTTVZndm0fvJOfUinOYlk+w35nGSw/yOVNQmRftyokL5PSrq9gZtx/FVHQ5honhx+Z
 g/FOUJoV2jSF2R3wOitk/UO9+4KSwr8Ig+f1Gx2d4o0uYS1g7Y1taEyQ2qbFmpsk/MhWmLu5uJu
 fvmzkRQ0hk+uBXtLTEGkKr9gKff3Dtbr8AMHQZtLOG/1e0BoxwOjXfdey0vHyr/NMsNr8Qe4i79
 5SkSmX022ui/6fOrJmbZ952LJw8l22ZXGrUp6mUT5Q+9JgOrpsw7wkFTGxH/Vb4OKuUTMnrNea2
 CRjtrrh5EZNmjLKD1m1mNVtw7iSlX859GJ/0alCGXC47i0piQs5HkqN4iUMF1N1CmONXh6XKHE9
 COOQZpYnD8m5Ir2+jCVenUKnzQ8oItJi4Fjx4ll5XjKNEHQ+H2R5hTfB1YgInwgaVwBVNCx0bDY
 PbW1y53FpMM0VnO4WGg==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab54beb cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=dhDJK-fFnsGTkC4caXsA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240066

The videocc node passes GCC_VIDEO_AHB_CLK as its second input and stops
there. videocc-sm8750.c declares its DT inputs as DT_BI_TCXO,
DT_BI_TCXO_AO and DT_SLEEP_CLK, so the second input is the always-on
board XO rather than an AHB clock, and the sleep clock is missing
entirely.

The missing third input leaves video_cc_sleep_clk_src unable to resolve
its parent, so it registers as an orphan clock and cannot be rated.
The AHB phandle in the always-on XO slot is not resolved by the driver
today, but it implies a parent relationship the hardware does not have.

Pass bi_tcxo_ao_div2 and the board sleep clock instead.

Fixes: c0d11ff90475 ("arm64: dts: qcom: sm8750: Add Iris VPU v3.5")
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 28cf22da854d..e092222fd8cf 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3117,7 +3117,8 @@ videocc: clock-controller@aaf0000 {
 			compatible = "qcom,sm8750-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;
 			clocks = <&bi_tcxo_div2>,
-				 <&gcc GCC_VIDEO_AHB_CLK>;
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>,
 					<&rpmhpd RPMHPD_MXC>;
 			required-opps = <&rpmhpd_opp_low_svs>,
-- 
2.43.0

