Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9C646984D
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091193; cv=none; b=UpOLofDiitpmuZiRu5PtLFa1KV57BvssPWavjQbtJahYfGbFqtsU/SN8SvW/2EkA0GOGFNIO8MDUwZhKhEtLjoejbR2alwm+QGzNfvo9bwoGE+zdVRx7hUT1oUODoWNcuYvcimRqXMWpGKYD+lR4m1bed8syZqpJEebex7st/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091193; c=relaxed/simple;
	bh=YMI3vkw8hmiKF6TeqHv14c9+YFV1N/QsGGgnxq8OIyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPGMqH+mdVAUsIzleNJnsvNnDHSBpDeVfgBgvehLVz1pvsn2djGZyk8MA14QmoYpDrvETZGos/NwgSCElLaHPl/MnxEA/p4YKSljSmER3CldUGBg9rWC769VrFhVbyV8dWMyfL0jsrc/RWvg1MmnEcX5zz2MtBaARDDkf+jZ6Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDJd/eH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ckpg4b5o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDJd/eH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ckpg4b5o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67781mBY3176962
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7j/zIsZ+9bVC1qTPvzBPq6Ov3hCUQZH6E82uuV16mCg=; b=PDJd/eH7F0gki3zf
	3qX4R2W/Z06K6LplI6Lj4dfsd/npfJX+0LgMhi67iLr9eLBmXIHaXdtNWJ6tGcHe
	keVNSAOocVSArcE4U2s0HjPgU4OLKkU8ZiFNPqdfu4fj8PwBAiQr2RNMKb1KIJAW
	+rkedsE9JsbTNFE0hTEHsSzAd4w2v3m9HOeqyWVgHwfLCk7YcS6KK46ucl29a5Jj
	vn3neUth4YYk748EzZcOVvISn+yQllKTT6n38ghxGJ5SX8/f+KLnvchZuC3wqkUp
	jy9Ax9/RBW8jhd/CEoNwM8m5gdthBw39kmWKsAQGeRiyBQd6ZLUy9uB6jxektR6s
	rpY47A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jjxrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:26:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso4655659a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091190; x=1786695990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j/zIsZ+9bVC1qTPvzBPq6Ov3hCUQZH6E82uuV16mCg=;
        b=Ckpg4b5oyd0bF5SilJ+/9Tpk6XXxekJXkw0i8wWKXrWa4hVURViEkRRtlXO7dLG87c
         nfkbf6GlYgeOxQT6Qi6dlujSkY66FkM0YxG9+cBt2852t4GMmblYSGCyCUv1WAbdTkBo
         ghHoP6BLHdjMF5bozwDUSUfDL4e0CgkJAKlzAxSvG7B2hxFWFj7TOtfh1Hyvyff+VSMX
         i96Qz9mqvUB2eXUruQfltmueh6GkZPtHQwGCHmQG6bQYD4LfzYit8uo/XSEI6vhKLDCc
         LAqmwGZkdNb8ezXRf+RHAMFt6Bko39gC4R7bYg2UzisTXvBLAoqVU0mG9mh8m73FoeQZ
         1hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091190; x=1786695990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7j/zIsZ+9bVC1qTPvzBPq6Ov3hCUQZH6E82uuV16mCg=;
        b=ewXT7qcvsKeD8iZ3Z/omHDKg8Em+msbfrEr/At54+JqMcmK96q+uyDF8MLawceXzhT
         YdNlV0f1zkQn0JPxzuuLp4eVApIgiXGimSiX2NSbLMef7x4eFdWXMBatP9tGsJz2l88s
         19mrdjWMYGLEh5s6diYilTcnUhSVV6N97vaAXSng5sXSOvFYJQaZBU87CazRbmFPYr7u
         eSAAZKp/5A8nTok6BUirq4/EGBjK0Wm82NATmOrrMeqAugQ8b/UcIOwhMefpBb3SgSk8
         Yo7+0nbJ8ScpVRkn6uPQzjGMsGYRl6HCsIEItLpcwm5bRFG9lI4NaMkGE/wtbKn6pszu
         SeLw==
X-Forwarded-Encrypted: i=1; AHgh+RoyoXoTngp2suDXvPhg2EqNrBCO/X2Gjbzu+/8ah+iII2pLItOt8JfJ0KDNUwtekhZk48Ro8J2B9XSyv75/@vger.kernel.org
X-Gm-Message-State: AOJu0YwO/15iHd1q4mBrDrq5nmKeiqvM0lvuM6DwuscR60tNrY2f8cDz
	zczLjR1J2uuAzJYi2eVDH8cHqPfbkg9bS93RvbeSjs8Zq/qdH9LrpnXxK0s7JFwbjZgHDhfeSam
	xJw8TgI3GX34iromy6mcLz6aN+Kn6nhCpaRpWgmRwp/MnBDKMgwDn3f9GOtNF/giRH3IT
X-Gm-Gg: AR+sD12PIB0gq8bQ76eXxBmp8x4S4DwNUmcvIGgSlA302Pb199nkvpaIJpOukou9ZHn
	89nqwm9qG6W6kPB+RgAAxHROvdB1G4fWaob+hlkSQ88q+aZvFk82v2y56RhkNei/hMv9WXu/trh
	oJqCMT6RLgdXFwFi8NZw6Ri/3/twq/9I2HXeSUE2wdg0kDkSVJR/7L6fF7ZwACMG5T1zaQZTa40
	ZpOkSFfF3a9sF7xqAxlIx+mThUiOIvyxh9zGW8eb/hUS/mXSYg/SFeYmmeHT67yjaUXoaxl8NCF
	mabPTF1QjZmDvs0phmM8z3Qi7i4Y48bBNSNwsBpF+dGvk6+B+p+mDO4bMACPQ9L2cIodWkETGEu
	MbvGbbeNkq4y1UivID0cK7MJ/og79+SbpHe8=
X-Received: by 2002:a05:6a21:4c0c:b0:3cb:853e:850e with SMTP id adf61e73a8af0-3cb85dbd1f2mr26403337637.13.1786091190524;
        Fri, 07 Aug 2026 01:26:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c0c:b0:3cb:853e:850e with SMTP id adf61e73a8af0-3cb85dbd1f2mr26403288637.13.1786091190097;
        Fri, 07 Aug 2026 01:26:30 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:26:29 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:49 +0530
Subject: [PATCH 05/22] arm64: dts: qcom: lemans: Reserve low IOVA range for
 Iris
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-5-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1934;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=YMI3vkw8hmiKF6TeqHv14c9+YFV1N/QsGGgnxq8OIyY=;
 b=nlhEf9NlcAAHsMhV8gipliTwfBY+PUK9FEDOlMy9KhfsAoyYLeWc1J0uhItzpqcotydC/Mw0u
 jx1MioKYMpcCtUXFjWvbS+mcmeRgtYZEfZ9wAUajYAl17i5NYREvD9t
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfX9i2k+savweWa
 wEn+R/2eqEDbFsINuxaFXzdmiCLYRUJHofiSFAxAZC8KUcnPNN/7OBHbfB5Ln8C0Kzg58VXGXts
 T1uuP+ETyYYp56ifzWrpVUa7285t1GaHE9LUqs8j0jbqp51UkTWLbqYthfrHWwDp4oeO1tT6+sR
 tT4WEWK+ujtWj06tgg6n+VDHvvXHn5bMw52287ghJwbftgiS2/B1jj0UdQuW4fut7EKWwU+2KuA
 HelkDXNopOnN73A8pKKqybaQ4SeMWs87YD9zMK0DkSwBLxzbavzN4/dZPDGVcK3o0DKroqMsuMJ
 ZU3nfS+YdC2+mjZd/cHUfXMfU/U1Fjd+cyg+Js5zUzO2w/MEyXU5cDFTAqw+DqLUdg32FgzZ4Ox
 iYDheBGxEMqca9VjfZdzVLWjQbbbqCFFj6cCx4O1TsOpfLxXQWL5qzDPNy5ILiXSwWXHBFgKjYN
 Z4GZ//AverXOmtssdoQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfX97rg+kA172Nh
 81lQWqDUZbFGUuVG1sAQf0LddJhUhhxZaolnQPN1vWtzHoq2U9ES2JsACPhpJOXfIqebb22LZXl
 bDphhFvrcd+5PdsyavpBBUmmLPdV9MI=
X-Proofpoint-ORIG-GUID: zOIV12vZuu8Ni61NDTBvshGV_m8XMm0e
X-Proofpoint-GUID: zOIV12vZuu8Ni61NDTBvshGV_m8XMm0e
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a7596b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070061

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 7bc95052c64f ("arm64: dts: qcom: sa8775p: add support for video node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256911e656ab1ecdd92aca135d92f39..da0326fe244850f92e080e648722b4aa0037da7b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -862,6 +862,17 @@ cpucp_fw_mem: cpucp-fw@db200000 {
 			reg = <0x0 0xdb200000 0x0 0x100000>;
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
@@ -4957,7 +4968,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&pil_video_mem>;
+			memory-region = <&pil_video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";

-- 
2.34.1

