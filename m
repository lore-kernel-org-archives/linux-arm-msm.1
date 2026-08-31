Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDF13AE185
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788146490; cv=none; b=ML3mUt4sz7g3oxX7NtGvLC2FyJ8rbVXyTRjJoLMYpqQKtLe5xQRS/St6/gC3OmCBbTAmqjqdYNNu20Ymbo3h0H1hBDJVeQsmoxmfFdMuU4ibIhi1yPEYYqP1vjug8iSqRiIQTaVmM08s0sRXTZxcvauLX1+haeOwDn2q8YtScUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788146490; c=relaxed/simple;
	bh=Qo1auokYYhVIFaBJtPQFmiVUQCNJkFUL4nNSwi2XFZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXbe5RNkb8vwxHir+Nxh0oqSTQYqgs5wm/MF/fmx23triQ+lzFDPkdoZmvqQS3QctDKAWMd2Wap0gHv6s0hxp6N98tHs9ldGT1l9Eas9cbDmdKgll4sjn+FFlCOyE8acRIrGKQvlBpYT7KqfpoTDvftwBhKZbxePRgCkAlIbnI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2Lue4Th; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OZWLQdaL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2Lue4Th";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OZWLQdaL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bWK51621754
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=T5xLFRY6QC4
	gGYyfGZe54JVlSYu/D3Sb6Z4L8g9c4Mg=; b=B2Lue4ThYUDpYiazk9ZTm98xxF5
	xoDfbW3xdn/vFU06JYTkOX3IJT9qcDKHVs2dqzFEwCMkBAYzbPT9gnVM+7/aLbSl
	iivhQ1GwNKs8lLEFnkV8j0uyUBdBnK423sCJ40QEL9D/wXay3gVjds9lLfSPuUko
	Q8/h2mG7QFa6OEJIjR5hbfabFfitMZr7f8dLovijh2ngoW4UbLEU/Lh61qC+icsd
	V7FVixTmZ+1kOgGXpcXLR/BJqMPsXwOmihaH3HgzE8ep+XHfBL/WAaFEZjMXk9tH
	Nl69dlHsU9htmllNuGTGsGQHg+l11LnhQDSwJYhiCL/lrRmrVIrthGkuAUg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbr6dv893-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:21:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3990706a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 20:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788146488; x=1788751288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T5xLFRY6QC4gGYyfGZe54JVlSYu/D3Sb6Z4L8g9c4Mg=;
        b=OZWLQdaLipJ/FY42rya0dNcltTw/DpFAjN8GgrX490HPRIuu1MIbJIO/H4o9hzfkBH
         dy/kKfowG0nMccKdIZTS5RhNhUCBdrFd+nPS+cl9mpme2H7djUYadm6RcZbq34RUqxgp
         Ii+6JnzbB7qXhxg32nfzqnluX3TKIi0X+f7Vgx+yUGuiSW8XdyHEwtCLLZMfTsRiXzSd
         N28qHeT5lN9qgAo0sNjNSFBXgCUQdoI2oiBfSDMkx6NW0NY+E4qQGCp+kqCJJ0AqkRRP
         MvC28XHT3vxgP8HWGz4qZQl19/ucyxB8ef93/7YEo+6QS8+ecmtV7R47PVc2zxW8C8uq
         UzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788146488; x=1788751288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T5xLFRY6QC4gGYyfGZe54JVlSYu/D3Sb6Z4L8g9c4Mg=;
        b=lnt4c7G5vVdcnbm0TwfE8kUxKKGnubxwCoxyCiLF4oFt/SG92aT7Bs8goOvsno2DD8
         +szbKvBW0j6ycz5918O+DGh7DJD7WnRHUNXxZA35d6f4Lv2qVDSanVyXDwrqMdMZy1me
         VADE56tz7HIozT1MvzQSC8a0b1E4Rvow0xCG/Gp6C4Rzp+5aNstSxWHzQZOmxttk+wCV
         f2nVa2Mc/cEgm54g+49Zc3f6QkNMbdQLaP1DnHeqO9myTA9rCCEtv+3yBcbE9kO3dzWr
         90NO94tFMzcZ7iH1Vh4s4HnTa4xqkKn0uXFIEbq+3ImW/vvFmY9WFs8vYpV4pmcpqqmu
         YcNw==
X-Forwarded-Encrypted: i=1; AKwUvByB7SePKHUwAIJRoRmjnjZujjDh39VRLXlyh8SSoWrB4NtZTJ2SdHCY4Exvl7jLY/Pz7juacVHnmaaOLWDD@vger.kernel.org
X-Gm-Message-State: AFuF++ke/3rlcE1wyql6L9eVu0IlITOHC2YOGoEaXrHU+0ODRuGbVKKI
	OCoMjH9pW4poqa88ake9K4dvy4ULOCJAJIMX/IV7yLxfIpNJGnkkkGH3xaSbPRcNd24oaNft2Dl
	b3+f7v7sXq2Sfqyyar7pc4fDD3ucJ0Rr2SMvEiO2KhRG7v6VwUBicPfIRrSqaOQEPJ1NZ
X-Gm-Gg: AYBFou05STrhGcrUZqw5L042Rzrui8q7BTbZwCmhLi6J1E74BnBCh9iFO2dlspmxVJH
	ZkcOzIGK1K+Mo3AcR9OOHdmNIiuEGxbzygGwQ1KUGeOb+s/7DTmm2GHyUHVKVJLH+fmbz0eG1NO
	kQAJJM3uVoLDHG1coEyrfAjdV/HP64Lx5s1smoUhmrYIwUgckAVRNqn4IVCdEOixGdLBrvJywA9
	k7ocZqmtkjQ8lhFcGp9atl3+SFFlCDGoV6COm9nP0PDDxiADk8jBqCPNVT+QGkjrn4ltg35c0Kg
	aVCreq5GZYSVrGiOt/5stg+06SDOUA1sfygP3KBypgWoDx2LkGgEl+4aaOGb1hC1ockluh+3ISi
	xhqyL6rBBhXeqsnpo89Gm0FRB5nYMVKNVCZiqo2PduUz3dKdZl82c9e2ONRP0
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr31846941a91.15.1788146486778;
        Sun, 30 Aug 2026 20:21:26 -0700 (PDT)
X-Received: by 2002:a17:90b:384e:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-396d104d0bfmr31846728a91.15.1788146485315;
        Sun, 30 Aug 2026 20:21:25 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm25599208eec.18.2026.08.30.20.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:21:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 3/6] arm64: dts: qcom: nord: Add the SPMI PMIC arbiter
Date: Mon, 31 Aug 2026 11:21:00 +0800
Message-ID: <20260831032103.341633-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfX36ZPJwbttnqj
 tFsmzP8rRx4I3mRtXlL2od4G79+n3B8UMs04mupaj5QLZ7YQf3jQOLBitejG0ynfJ/RgeQrNK+B
 5XiS2jLgOeM4GFZFc6gZlwkg6t86EEcwu6mlWpr6zbdW+TbKvHFPxpG52nFoR4FU04QKkYqX3cZ
 n4la5Il6SJLpzAxpHniUDf3JgQOlwRh5qpXsydoy/mSzXfDWDlJWo67+sV1GzsfGDk9Nt6I53Q3
 pMlwP3wBhMmzMMyi0MmSVyiLBq7aGFfcgOj0JVxTTLXZ3JeF9zBHZ0nYART1+btea67fe334jZG
 kyNCPSozvNqoOGPhWX5ikUNNnLpYvkSdzdbXp6/NktnuSZX2A0Ad66AF/pzLUKVcU2B5xc6hXc2
 jNSHnMgk7Ve1vZt5peP/SDqOMMaAEmb8oWANfBtJJ40mb0xznFO1jpfJ94DbaiY00C7Xy2bBhtY
 WDYjlNP5bK7i28zW3Hw==
X-Proofpoint-GUID: oOwfNqjZjzBFNMHuGWgNMgHgsZJEG88N
X-Authority-Analysis: v=2.4 cv=Zakt8MVA c=1 sm=1 tr=0 ts=6a94f338 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=eAws4zb0lv8ujySLY5IA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNiBTYWx0ZWRfXysneJFiOEEga
 I8Uojj8TbBsjczpLZrY+x4SSY+wsOvF/V9EAZOjP8a1LPAxPz2AreLW3Eb3gpiN0HFwOZ63XpbW
 PPXIO7Lz14JgiYX24ag9mRqzHcmiDQo=
X-Proofpoint-ORIG-GUID: oOwfNqjZjzBFNMHuGWgNMgHgsZJEG88N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310026

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Add the SPMI PMIC Arbiter node for the Nord platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 03703324f487..83760341456b 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1865,6 +1865,28 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			#clock-cells = <0>;
 		};
 
+		spmi_bus: spmi@c400000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x3000>,
+			      <0x0 0x0c500000 0x0 0x400000>,
+			      <0x0 0x0c440000 0x0 0x80000>,
+			      <0x0 0x0c4c0000 0x0 0x10000>,
+			      <0x0 0x0c42d000 0x0 0x4000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,nord-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xc0000>;
-- 
2.43.0

