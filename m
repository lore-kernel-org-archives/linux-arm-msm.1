Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B723BA22E
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091243; cv=none; b=Gk1GkKfN+LCDs4ecakX0gJb+5xoy9EfZtsZewxsETn8UKBYDYfZr9g2cM6en+ohRn6ukOS5zDT/qSgpIV0bzUcS2tW9iihkw3oJr5jdSgdKEpdZIBTY1+DuUcbLYVqMawtYRko5UfdadXBnA66Av6d4cT22Q3C88fUH1mWkIbXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091243; c=relaxed/simple;
	bh=BMiNkCPiO468nEt4UeIuRByv8wATgUIvRadtC/T85dQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4Jb1182pQQXjFZhopdoH/f2+1YJiCuvkqQSKfifT0iF7pFLG6f2/ONxW/k4lpacbM34+su0iGXzNHwag1dX36QIq5nS81nhyBAkEnqeO4gDHqxOXJxVAWR9v9ltKbADZuOsx154ubBN7NfGiR2KmuNKJ3SbBjf0YXP7+MPOOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RvqH5LBI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bP1ssZz2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RvqH5LBI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bP1ssZz2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777ta674063210
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMuIsxdUFs18R0cuq4USYM2V6kpf9roc09ZDBS7QeFE=; b=RvqH5LBI/otIpIPQ
	MAdV78/3KJg+Ir7eT9/vWxLOccTP0JTwfRb43p7Jy88LBQPgT0/kqOiOAmgcAYaP
	nERQWruK1LBezTTL0ubv4Hoj4eNBMb8XXnUaUtuDon2dULv6H8037Sz/6qWxW8Cz
	Zyn4VAALIJqc6bnWtULJdAAWO1A14vHdg+5iZIOKS+r82GwlxuemIj/plDFx/YC8
	YPhbukkTUbg57NcYfe6GaTcaHuCwA4BeF+x62LnORd0VR6mgvsd6nQwlIOlNYqce
	GYBvMZ4tvsZj+RVXhkCgx/tBEpBqKxRAccplOhKh0zosSIurUtbBpEsWITKKFAsd
	Bf0FHQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hawwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:27:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6ef846b33so1471287a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091241; x=1786696041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMuIsxdUFs18R0cuq4USYM2V6kpf9roc09ZDBS7QeFE=;
        b=bP1ssZz2QAT42gwBRAGDjL51UQF5mSAWe7CyVPq59ie++qDz+ujoQd4Ek38NBHAEdW
         RM/gwmAJac6VUIqqYh9DINHTyozCMFOOeIqg1rnx/0DiVBSs1+SDkxNJaENE7sxAem1x
         +CYB6NKyBjCYGjKjf5+TwE9/C9iwyUbAPM3mW4a5DiEdmlv0BlxwZDwLKPFoxazPjyOc
         qT+1R+hv8KR3HhHZaWBoye42thPIImmB8lOFaG5Z0/ENyZ04qeEs25q5v7+TNgqSNPud
         9qi9+91YNQIBSHRJtsC7eYN3e0gTs8h4eKQMvD3dc367nI/GdCAOYFkVUa39m6WpcU86
         yIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091241; x=1786696041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMuIsxdUFs18R0cuq4USYM2V6kpf9roc09ZDBS7QeFE=;
        b=mwvNuL6DUK4cf3+K769Qo9GwfpeNoPtk8NeJh6KEVuTYVg8mUQd8UUBnME3bPrzBBU
         EUv+weNOPxZhgUchL/tafNhcd+247gVOJy256T1LomTMsjwxIYOhDu+FIZBKAhdvoYs6
         mTrpOOMjZDhcHF6GLeRX0R2+/TDFjvJBXwI61jIPtT3jAoI+E3c+QvzwV1YD+IgCaMRC
         pB1gQncC1Y7do/WJrxafARCah+BKW4DamH+YMNUHL19gcPMuEpwdcaPYEQy03NVP92Z7
         rOX7JcNx3+Cojkk54gMUKV26gTvHFUmmZVeea7kLIMpw+TT5g5GbjgP0URxU2nU4R7Lh
         3V8w==
X-Forwarded-Encrypted: i=1; AHgh+RrpGuXM4Buz2KyT74eTC/MWDzGbyGLWcMOooK6797vlPEn9gIV6hf3+fTwgroUuJ247gDd7LQw/TZMLngCZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRXd9F7r4bjwGkySUMKeBkLaPV41wmG+0TPJwZLBWdvCj0Iu+
	rD5q+YwbNX05vQnxHeMOM+NKw9dO+6VA+eXzlKvbxa2Al0oiZpkVPXY/WN9EVnDC4MPPUlI7Bnj
	d/GqpCrDdbI/AxsfFKU9BjlH+VW2bEz75ungSnFh7yJB7fhIhYl1pRuBabU8/wNQJyoYN
X-Gm-Gg: AR+sD10gCDrBFe0YPJlSolkIlz8ucV3TPCXUZAsDPU1z4w8YB6mkFc3I4zNV+a7anE8
	aYr6tDOhmIYwSFW48lWDOhr8a2+fyak5vdCdEyaFxSdozeKJg4U6MWyPt4/wbWpnYtdCu/rp01c
	cvN8Lm+zd6NUPt1fGyxbteEFFxZxzylcbwHE6dApfp6WyQhVHHD3ZFoXgaWjM+aQoBE1V/PF2nk
	rQCMMk3YI7qSdFjbKaoxLlnkyUrII0zIUOz/HxatqKKRBsbKLriKUNaGpY9MAgdxN77/HkZ2gqq
	+t+zQqJjO+itJ1iyk0z1osWpq/kB7EB4H4FLv4oxjborGxGf9aCKBPna4Zxwac+qYdpbLpp+0xp
	v9eITU/cl/PspJN535goI500bKlCrc9Nv3p4=
X-Received: by 2002:a05:6a21:3393:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cb9c0712b1mr14897708637.2.1786091240600;
        Fri, 07 Aug 2026 01:27:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:3393:b0:3bf:b7e8:68ab with SMTP id adf61e73a8af0-3cb9c0712b1mr14897659637.2.1786091240080;
        Fri, 07 Aug 2026 01:27:20 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:27:19 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:53 +0530
Subject: [PATCH 09/22] arm64: dts: qcom: sm8550: Reserve low IOVA range for
 Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-9-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=2803;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=BMiNkCPiO468nEt4UeIuRByv8wATgUIvRadtC/T85dQ=;
 b=+9s+DT3q9yB9p1l57cZ5losphsn4UuYHu8zuUlZ+TREXTSLYs4cMV7N2VYnTpnPpMJkT3cL3U
 sjdfZ96hJi5B/gFzN8mM3UasPzWoZcavIrWTWtXqsesczCRFCStoLik
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a7596e9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iB3bJDkhKBw2G02gjNQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: nYjEb6Twt8jAagm1llN_FjgjkuWN5B6I
X-Proofpoint-ORIG-GUID: nYjEb6Twt8jAagm1llN_FjgjkuWN5B6I
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX1sg7YD8hH30u
 +8jVpGzyb7d9GhTif/7/7NlQ5nU8fx29NHojDEpu1c2K5pd9GDhkhdwGC/1X5LEWPLtHLH57QGN
 ZmiRxkYktJDe0ylT1jTdzZDR9EB7cHg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXx2hzFdhYQdZk
 +1PvASFG0jZdun6YKjrFsxNO7pOm2fCUb0XxYZRn6F33fLpxd46KGlY6Jeqtrpl5ct8BdTL+ZMP
 T6wxa8dWRh2Pob1Je/DHeFMT7JOos+VKoe2G9TDT8D3evZSxK4v2NYHAW9Hb0azRe5Mt+4WUPPX
 ZcB6lkfLxvtjOzdr/raty/L3dOcsCx/4v/+SKlGzer6Td2uG5J5F8ybvRFV4dDAXDWj/hfzyIQ+
 YuTlgc38Moj72bz9L9KXWdQe/1CHcAVF3LJqsfXB4kXZDfYKNwGr+JE7XdMu0ITxCi/l+VyFxl9
 ScwqtGMngPSYrwBwfOYIhxazVWdcvmn+waYDSJm/3VpLwlFjJnuscEyizVPfa+Voc/A9ioQA4os
 k/TpGcSMecteYStorPPq18uRxSYl6DkxQMUFCmIzGBiCCyxvDq+TVzGRKxjvOzOyNSNtbmMEmc4
 DhkXt/a1nau1tGU/esA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8550.dtsi | 11 +++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi  | 13 ++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
index f0acdd0b1e9384e684a90f7f49cf63633cd70d53..4306ce69b83da9ef5d80309d5617d723947dc796 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
@@ -158,5 +158,16 @@ mpss_dsm_mem: mpss-dsm-region@d4d00000 {
 			reg = <0x0 0xd4d00000 0x0 0x3300000>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0e701e709235c6e0a5efd7f8447dfa6ef6f6e21f..1eb725a584b26bc11dbc34eeeebf91d3131a916f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1088,6 +1088,17 @@ hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
 			reg = <0 0xff700000 0 0x100000>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -3686,7 +3697,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";

-- 
2.34.1

