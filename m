Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CCB21D00A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369241; cv=none; b=m9WaIMe8jPhdTQLeOvRUkXwQKMWWrbxNH3JZ9hN9EeTgNwhddNMcC/AEGvt2zg/PHoXRpCEYlOE89sODE869Kvilucco7AAt6bGup3EiFlm1bm1p+n+u7KygoKRD99HepLBP+aPvxVd0N3kmiqq66VGg0nP2XNzq8Sf7mdIy5m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369241; c=relaxed/simple;
	bh=d+nxcZaJXyBiNmpgm/0+8neT46D9tfeM4KigVln2Cnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEcP8TvodJ4D1ZbGtoMxMEk/FR4t8dArfEh9MEq001AeipkiwPrHzDpTpWmiBP6B8MvGyCmFaKMgsISkIrxyHbtu7saIwk8L3M3XWmm5buuJJwrro20LSvd02CS2VMyFfOnhxkw0O/7TlpT6SqMv0+tbvp9Q/Mt8DHw2rcMMjoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eb9MBawa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFhjp7bh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eb9MBawa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFhjp7bh"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j2Z63902171
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cikvMWI5Z6bstJ9eTi7GFHzo1B5Z0fx94o90BusHGhk=; b=eb9MBawal/oSQo6h
	6hD0Kc8aARpbARfzkoRxyTR+mkKRzBuqES2HgBcqpou5TfEzjVYtbzexx2s1MbN+
	+Cl2l5Gb50SCZlVL9niPGgm0HCRJgd4LZUqL+EYYBKZMt55VtgcUK2K1hhM6VDgM
	mXLaEjefBS/Arj4mQw/qG5HjY3WAJshi9xhv+MlYYWzRADGy37szgpO3wELYR7pa
	/4eZOIguLyBx2/emgwamtFMYVRbwa3LApZQJ7Zz4pVr8H9DQ1B8mzYfvVPhjaKOC
	r2Th4i8qU+i7c63w5TDV8Z+Ath5Y0cNTwpw1W6pdNac7Ye3zubzdaBvw2EWXEUIp
	jVbBsQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5d1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:00:31 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so6091447a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369231; x=1789974031; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cikvMWI5Z6bstJ9eTi7GFHzo1B5Z0fx94o90BusHGhk=;
        b=FFhjp7bhT51BgmzLfzpsVwxlcZVlsc6iI/68cQUxAOFreGWuSROJJl0Whbsjz7BH3C
         SRkWXMQJKHVGYdGpLTzzKsw5lX+KyB262iJWut8rYbC/NcraQIkh/W7RwMW/DZfw/iyl
         fS+vRd2/HgcOIbp2dZ0D/abLZWFNmAYLQHdF8QRRtJ2s1XicVq7QZBqrVVnxHaPQhAS6
         PbrsTufGhiJPjCQ9D3Fp//0ktgzjgeggsK+dV0pV3E92YTZQai/WXPII3JzCJBUrPzBJ
         atpZKT7FQU8uGB80Cvp0+6aDmVAt4h2fbkZGYI5iHIAR12GYRUceE74LNTnVVRPxUoLb
         YG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369231; x=1789974031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cikvMWI5Z6bstJ9eTi7GFHzo1B5Z0fx94o90BusHGhk=;
        b=IkdsnJWiv5BTO1USSsjhdRjeVQJFDnWibL+C3qWaEenyoJc+LBfLA8F2xYdJ8hgKqD
         YFpLnWqXRRuKobN2+RUVvAi1Ms7UnZheic3Ps0Wp3gfWk0lzT+UpCWB6jMh/GwdnL2Qj
         3bL4vmWLUU4VABYxn98ezlR5JRqs1sddVDbZD0eH/iE9wfGGwrP2gcYRh0O3A6wtOP7W
         VjbVH6B5vtSEbe+jx1tzys/fWV/wnmSiky0QzvP0blY7jrmgSs3JKtEvb1lsy8w4btJz
         QqvmXTu/9urK1/81p4vzqG6xObdr60ayHsjSfsh3fAR4nxrL3wkLOfGUygBlYcNtXmyt
         F6Lg==
X-Gm-Message-State: AFuF++kdOlYEsUQ42/IrC9xjsesd0yp3bFxH9bVsfCs/zJLtAO6hHLME
	ATuN9JZJvQuJ/GtbX70AEZGVtug5hn9z52KwNc/CHMIzxDL+ZeJrflAwm1UVvH2g4DaurI5Wpvg
	vPhvT6CyRFSCAcer2ZF0OZVj+g116HAI9qUw/RPjAG0F4dq/udeCnShawX7MGIfSKPt5b
X-Gm-Gg: AYBFou00DeVQxvJmXLHFWrwh2p/NIWCpKofZajY97uJmU6u/FKyNb5NWpgtag565xx/
	TGZ5zhaMXaOIAF3UdtLZvzcLCFaf/en8TnkWm4N+mrFke8q6/aN/wfECCbyz14vsLXpHYYrx0gh
	lmDm3opbKtaJS2cZUTsgp505T9JuaKwRUMb0he3PZy6qbxg7loUlFt+yfYykABAmnjQ7A+dqPKM
	lQ7x5EQSnur2CkXwtPh8VooKEkrnfwN8AeX+COf5HjwU9YoLRH+SqFwUNdb2JY0200QIO+k7nKF
	JcNJ39bL3vl+WTqlIEtbPEbG13h7WV1Nsabh2hsOIiAlHg2lc/8u7N4QizjumAtXtEbIeDWqQ2g
	nDWSr7ID0LKsQiKfREVpz4mc/Sctj
X-Received: by 2002:a17:90b:2c88:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39dec0c97f1mr3107444a91.20.1789369230780;
        Mon, 14 Sep 2026 00:00:30 -0700 (PDT)
X-Received: by 2002:a17:90b:2c88:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39dec0c97f1mr3106460a91.20.1789369225409;
        Mon, 14 Sep 2026 00:00:25 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:00:25 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:40 +0530
Subject: [PATCH 08/31] arm64: dts: qcom: sdm670: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-8-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=1602;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=d+nxcZaJXyBiNmpgm/0+8neT46D9tfeM4KigVln2Cnk=;
 b=/EmaEEwQzujOd2dfTdskvCSGmKK47barw+wLlotCaPd7lHDsMDZcmlf8qsE5RZLt2zHlix+7z
 DmjelfHWELsBSzBf+6z5UUb+xRYLRtAiSLSE/7MeHD0luSHCs6JTgFS
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX9hx3QGzSnF11
 sOzt9hWf76xEu3CuEOP6ju12us5vipLxXNraqz1fFgzmb8jra3XS6BSzXhnoaWD3sVVW5T3JkKr
 xqjx1jcIeh4bC56fQmfpprZAGlB8ixE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX+sZOrayLaQwI
 On4TqUFLK4s/4jmEdZG6qOQWGaN9pM+3KFuye70SAQ2U6WKx7Jf/DgeTbzvKMfN+/yWY/C5Fl6Z
 lwd7F852xaiZXQUFJRgujLqQOCbOUjzv3QrzXV02wbuOksQSbJEIi6w9BySZarKCStAmNRpmsso
 usoBnQmKexMMAL4JJxSzL3irQnQ6c+5ypjYO8W/ZKxLp2YZBhRVx6xhOWW3h5n9NaKpNWq1dW2w
 QearOn96YnxDzgLShW3svHFQEYXVKjlbtyJvGeoIOm8Pl+PMR3rKHPnmB9V4Kj32rM4KqkbSo30
 Rw4W5GskWBmDXPIBi4QNI0ITg/B+a+Ii8sPPVZr2FZHL28h3jCwM2BGkpMHwS+KJHNTbvnKPdKz
 O0lqTVaM4xjL+lLeZye4z3IPFTzeAKrlUqg5QJWoUMziArZdqYGOKGZCC4cDbp4M+2hd30urEyk
 1CeL7fZ88wilEXAcPog==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa79b8f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=xA_MiKJNHriC2EwIB0QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: zJJIWEzLLTvjRI1XZt7WX4eDlBt1gTde
X-Proofpoint-GUID: zJJIWEzLLTvjRI1XZt7WX4eDlBt1gTde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 5c60ea36f04a..1fae9bf16120 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -271,7 +271,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "little-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <915>;
@@ -281,7 +281,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "big-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <526>;
 				exit-latency-us = <1854>;
@@ -293,6 +293,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;

-- 
2.43.0

