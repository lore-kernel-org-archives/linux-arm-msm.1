Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD393CFF6B
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068491; cv=none; b=f14/EPJh46G4zWWz6qj0lJxh121NbRTcPlwvwQgYvXZog5EoR6AiiWdoNWBPNUjyaWa2JytWKnoS/zriyV41BGz5Tm0ea3rfX6Y9TUNY0COt7IhepQcKcFGsKdi3RfC9c9g8vE4g71LTHfI0//n7EICvHKnusHe/v/m9+tBhyZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068491; c=relaxed/simple;
	bh=NM+SVCwRjrTn0Ct0OojvIaz+v6i9CmljcmsXUs7015E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tw0lBR2lPyJlmCYqNU/Z5scIIgAKktU0soy195/nyn5KM8vEkOUIw4wlkbgIfnOlE0sKr0enjdPjaaFc1BKmEFI77E6zE5JZnDJ31QcYGn5sCBCkbCRkn20qw1+KMQM9R0AAOFZb2ap/1fGbC1iU8RUVyt43wKw6NHFBsDKUVNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSGGlsNv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XUFtvsg4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSGGlsNv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XUFtvsg4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0njW1427494
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VplzGt0KGttO7fI6MDL4GLu3+FXO0PZKPRbhx5iOWvk=; b=XSGGlsNvbQzho9Kg
	Zb0hgWZx7H4uyNxlO/Xoa9vBIfiK0biFwqVFD/szYLP2kYhEvOhVbhLszYBLYepo
	dPGFvD9wo1+cI4G13XgVRj3A4dAp1BuPAYMwGP8uMEQlU9Kn/TTdl+b5PLiJFwAw
	M9ws4XWmpum4s+v0Zp4L1VKCVumRhQvXY3rHcgRIzgqwB56/oNan7x2w698Hdll0
	GJw5kJ+f7L1ho429uyI/A8PDarirg4xox4MDr2YHg8BAAhmuVabqOvr/+FpI16ZW
	qB1IHw0vYIFYVzqhX/qzH2zHI9kmEhcvdB9+bC8zBRV+3c7hbjy7jgmOg4DVAnBA
	nB4g4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb19ftg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:54:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso104074995ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068488; x=1787673288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VplzGt0KGttO7fI6MDL4GLu3+FXO0PZKPRbhx5iOWvk=;
        b=XUFtvsg4ipy0YvwRY1A/ozeQLoUxpC50/exniidyAYhLZIiRWfpk0QJU9xlvokV0Cv
         UecRh+P1xHSXiIo8+iffImFH2pvHSPX+4fBiXap3eiKOB3+phG3WEQ5XvHW0fjhi5zpW
         haJmr1Tu8R54bnVtpQaJZ1ctxUvDTZriVYRd5C5nT1pmuOeAzbZjh/iLPfXqgO+Dia5e
         oXW0f8HeoLWaVgJHGgERjcP4fRlN/EwAKt65fj6w4hl8AKvrJwFTm1aE/9TCtduuaLh6
         gHYivWAozxXY1xWVFCekQc+E5x0E5tjgqiu0mNQvFSn8TD5E6QbQqqUqcKya9gq017s7
         XsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068488; x=1787673288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VplzGt0KGttO7fI6MDL4GLu3+FXO0PZKPRbhx5iOWvk=;
        b=lH2sFiTu7zBaBL8C0Co4lT9oDkI9drWH3kMdeQeDmaBQh48UyKTfJTH+/gwd0FLUPB
         CbcA3CpRddzsTwvbsjp4PMED7FRlldmM8sw5XdH6CCcpcVBIYjb0aKtmkaKCcS8W3/nw
         QSHE9B2r6FyuV+ADgUxFmB3P9ICc5mmOXshPYUG3e3ul6VSZnF+Q6JdS3RiswQJyCSDf
         xivTVFwEgFjYIxKJqGVcpL7DZ2KGOJHhkeBy20jFWkmblTxPOdLs+/pJ2EGemBldh9HM
         jpB2mJatdFK7063bks8o205NUHFD28yZMPmMbJ78zFqowuwwT0Ya0TOUSzZlcMGTNAOA
         Dspw==
X-Forwarded-Encrypted: i=1; AHgh+Rpy7myj/863SSvay+0R9JHdKT3eXQ+sWjQXpr0PMy9eKrBpxJnaUkdJvskXk5COirxdn6qFz16dSbdtzIIQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzeR3tuVN6qMRBkuZTJu1MhgrwCTvUMUg/B3f4n5lOD1Uj45cik
	twKoPhOW8H+XnZCz4Sllky4rhXgQogutejTiqp4WY1azKuzBurVuAZYFnwlfzuPsa6z0Egia4ZU
	d4wshpjLd80JmEPUzPyTGqgwvNT3l6XuUj0+zBqIicnXfBBAW4tXUy2nE8h0pq++K2hYFa3XXgg
	6B
X-Gm-Gg: AR+sD12g2LAZf22ynJnpSe/S1V7ipiLlRbvqby+EMX0pSunp5BU2ydksoeIYz7+wHvS
	D0lreeY1RpK/3EfxPFlhk6bXt5LxXGs1tKf+5DIEmzmiwqlvK3s9zZgbXXEegKB4HypyTV53rO8
	64NJ/ELltw3yXU9nlnHiBmEMLNloj2R0ow0W3GsDbV/s9Cw3DrhpMOXQ36g9qLZOKXG3hy/H90S
	qfwbXuStzHgiRz+wJ2Wk280xLsb+47CqFckNw7OcqoFzz3amXkm11w+B3LlTZsULgVIgnFV2nO9
	jqgDWdAtWcjjfhcTyXpz3+UynoAvEKoRMHeSo4QV7l8FosF6SxfBCDh0Kd7wU+HfOhdxERBi1hi
	k3ELYM+SRwhDmn7fVK6BXX7qBFzqd7OUo0w==
X-Received: by 2002:a17:90b:278f:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3955a7c464bmr13640461a91.13.1787068487406;
        Tue, 18 Aug 2026 08:54:47 -0700 (PDT)
X-Received: by 2002:a17:90b:278f:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3955a7c464bmr13640382a91.13.1787068486871;
        Tue, 18 Aug 2026 08:54:46 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:46 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:16 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: sc7280: Add dma-coherent property
 into venus node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-3-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068461; l=1397;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=NM+SVCwRjrTn0Ct0OojvIaz+v6i9CmljcmsXUs7015E=;
 b=OgtH7SwjOfbutdA32u3izUhOzp9rsimX/RNBwDxYSTZyfJZF6qsTp34Ukh3wBNtwbmdVkbW8x
 pREOpr5kWa2Cy9CrYn6o4DEOLYYR6iOKeG2/4Svn1rvsvPHAHKlkR1Y
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX5S5hyK3MYRnw
 PtB9PnZXK6Tn2DVpFsJeWMtppGC2HL8raZpYA9G9b/LPEpeqcL8pwGuv1Z+x2JgduifaT8IbFPZ
 POv/yLAp8wiS3Oax8FK9tZ3SqQG7CCKxDZVZ4xYmd/Fj1p1MWcPw8TT0MrDC3fq2MQhECX/2EO3
 /Ht3sViYLzzzliZRzeO7Ig/P5KUHy8jSSvP02HjykDbV7cNnOisjXqQIbWcnPpCO5Zlea2vMeix
 v4cOWmotWi9KlHVeUFSZUvByBjCv7LLMauz9hXxxHbcpo4i8yAUTwHLmG4hkKes9ChwUyy0ZRtn
 RUxkqm1Pg+eYPpSHMCVLVmf+06psr5FtNYuZPeJ7Ot2TN5/peTuW7xVilkIFzefA+HBo6bYwLRi
 4CTcpZzlfCLxRiup4ui/l+MotSKLCKfaUXQDcisRjRQ/sMsXlPs/tUnf+mowt1sChxnaYpzW/yq
 SJ8sU59BEgxxqlcg8oQ==
X-Proofpoint-GUID: KiV0prTZTDCMo0GAUJDngNM6qoIvYC7z
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a848048 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KiV0prTZTDCMo0GAUJDngNM6qoIvYC7z
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX8Qif3NydCH1p
 /nCCJGcqps65X3nzi/ucE4bd2so0f8Nt+k9vNUPEigItnWV10e/gUQAdpSEZB3jbhDUZYtp8PR0
 lLqIzSmGjTe84RJQ97/yAT1kuMdaUxo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180117

The venus video hardware on SC7280 is IO-coherent hardware: even though
the driver does dma_sync*() calls for the input and output buffers, the
venus node still needs to declare dma-coherent so that the DMA mapping
layer relies on this hardware level snooping to keep the CPU cache and
the DMA buffers in sync. This avoids the unnecessary cache clean or
invalidate operations performed by the dma_sync*() calls, which are not
required once hardware level snooping is enabled via dma-coherent.

Add the dma-coherent property to the venus node to describe this
hardware capability.

Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c8..b8f5705ebfc8 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5025,6 +5025,8 @@ venus: video-codec@aa00000 {
 					<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
 			interconnect-names = "cpu-cfg", "video-mem";
 
+			dma-coherent;
+
 			iommus = <&apps_smmu 0x2180 0x20>;
 			memory-region = <&video_mem>;
 

-- 
2.34.1

