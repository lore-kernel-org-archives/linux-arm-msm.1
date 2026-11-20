Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182239;
	b=ccujgiUnDYo5BWKAihwZGOXwTxmCRtP4xdcIzHzIkS/12p+sQEK4oaBSWidcvQ7zds2l
	 Frp+GQ1yoE/OOwr0P2vYA/359+8XgyLTlrrrpO2TrnhdaLVr0dqjieGXzdI6HKLT3k6SW
	 rH3wEjSJQ5Wr12Ct8inPgriQyw9ZnDznNQ+g3XZDVEZtjYjFT4Ngqa6CiDRdznQzPgkFE
	 cuX0rUtr9YNNMhUkfrQ/JPwVD9HGsl2dvRI1ZcJ7J35tI5ro3053pscGGJNBcRD/8dvXb
	 J6jEAkBAUzuxudxANQAXuhIc3ewHZ3yrSRxSnOywROLd8E2JcmH1oeNGDQdY2Oi7nQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
	b=5ZV748v5FioHhna82JdrVq//MVPi3YH5RqEinQ3AR8NJalmCY3eJ+oOcQilgBUs5NhH0
	 cI22HkUAfX441zVQ7c1WotFaGJqPnyy1VAQifAMfnEDAt2B+Ezo9xY4NSU3WXrPk1C1Cd
	 FLsdLup8OuBCxyB/e9PimTOT8aY5YO9B4PK5CmDCc9i/yXg73nboDZ+tGSJ3TCIgbAxof
	 me/A+pD4B/RraKkWAxO8AeaWA/K+Z1LByagYpffeT84lIgVnWyTXfHT5GHaSmxMSRhfJW
	 Cj0LaK2LFb4WKZpnIbW0mW/9TfMD++AYjwT8yOlltSvBfeACVJo/FixhkxucIIkS0hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ALIrRl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MoYy/okl";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF66260A2619
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF66260A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0ALIrRl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MoYy/okl
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6mS3987229
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=; b=P0ALIrRlHSIpYwnF
	G7zeIIX381YdjzO5Tn+y8+uGwytHLwvvvCMV8Zn2ATImWYIuHDBlSNPbYj4HM5+N
	UAd+jeYYktMpph0XVMCk2zzQNAIC5ef/NIkpXZG9yDo9rzcAIP4goyyp+hstjDNM
	sSVG7oPuh/zet9xK48cYU8F+nO9fsl1y3aybLmYvffbrHB0ys39289NYvRtnMH9T
	Wy1l+KX0SNJC2KwCnU+JA8Vbb+yybaoXYW6u4csA2nZtaKrJ5PQg6XTlQUsbesEw
	CYy28QCLcGB6KAX1uG+/ce+1+91bQ5Pf22clCUSxs+34b/uHEYpG9aN7/GD06wRH
	W271xg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81q1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383435e46f9so743506eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182237; x=1795787037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=MoYy/oklkklBJGxYhwNTNXyS55sjkz6s2j1YN6DuFwuPaYXR9YkYM8ZMdhTK+qDxF/
         LGOVNYrPx7rdpaZx5aXye6lqsAdYt69zXXjzrl5NRn4foyt13ARjig4m9NKxlzKt8imN
         aVmRQALmXkuERHnoI6lHYX1LQ6YwprN1Qv60MYpHmKW8JASflriomHSMIF7GAB7C+jfx
         I7YpFgZ9pONtdthc/56MbBUqIz/T+2MaC0HAmhdsij6ErLynrCBe/YnNiG39nz8TiAO2
         tH/N/ofvj/8awCw4oRNAxql4AsdcTlIuruGBhDoplIojF/xnohOiUayoaadg7T/7oaMa
         /o0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182237; x=1795787037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aS7LLfFWKco/ZCfqEM+r+9fW1cESciSfAHUcC+2r1I8=;
        b=VqKIk16RdZtGScK3gBywA97eCVJsXBPxeUb1vWNSy+Lr9RMl5UaDbmoUi7FOFBpTvG
         rckrA/AU5danXdrGiiLIIh6D+Y8OH+876OxYV5iXCZD3BsJQShVLzxWb7Dvi5LcFktRy
         8U7LmUQNvHLPjWmwxK04LJ7fYq8Vd20ZMXzTdoEqLlAztnHIiqeAnzZCJZolWfccI7DN
         WaUMzwe2oOv4fmlswkC/7Ogp8T/rW4pPzYv5Gf32eA/UfhmvbJkTMTjJEQRKTm7o4X1C
         h4Zdshno/XN0NBkc+qRC32YWe82+xWG7pSRxsKXUJ2SFZj0F8mGIIifK3M1tzCRDE1O0
         LyWQ==
X-Forwarded-Encrypted: i=1; AL+hErGiVcs51/kmjw29ph3rmvYgfaJGuB1ADRw23GvzJz4w7MQK9fipB+iGX32TT7+TB4ihIPbEvlARtK9lJGBq@vger.kernel.org
X-Gm-Message-State: APuU4Z//uOC56eoua8ce93R3w1NLDuouhkgmfGITUaH91W+a1kg+Ld8M
	DjW9OkAq2yTxrQndRODfOuiFDg8vIEMe1vjtjhpPqJonkaahR5T3vinQ5yBmm5dYlbjzMqJ2jkp
	noC+Kk/BgNtPx+/BhpGYTxnl4Ijjcu+rmlvwtx6uzPjv7MGOXIQHTNmOoNHYR9SAi+NsPJZEqXH
	x+
X-Gm-Gg: AZFdTZfA9+VMefVj8fHFxhFGjX3egcbkCt16mfppKAeOM+WoJyUGGAUJ8/M+Jjpa9uM
	A26txdwb6mjcbjs51RvNjUCHghmQkjdy17YV/DUzp3Pu1MnFWtIXmhkiecBEqS5PFMh+Iq5cGAz
	f9jvpxm+Aeqar87phjAdXCLYrLHeTcHNJU+uZE15JVmczAmRRFZI+VZwm8pPI7kRR8XYjEFmdWI
	fUDjUyNzUiPflaM+ua+zVVWXXN4Ah867aEPOzfV2mpX91Uqo7ABefDLKw2xAQwJULBX7OhUv8U8
	vqNdRtO+irJmEJ1wS2VKn4u1YGo4FJ8o7/FW2h29+9Z+TqlUCXLvjDbbBqe53D5SUWsN5G9oh5X
	Z/KwvS0h752OKxaIr2YVdNRrBd3FYzTIiAxlvurOfB/VQTuFChyVaZLpKtpQe1Wcr/0nQ1AWS7K
	ZC8cc=
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr1270314eec.37.1795182236939;
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
X-Received: by 2002:a05:693c:88db:20b0:386:1920:ea0c with SMTP id 5a478bee46e88-3861920f023mr1270274eec.37.1795182236327;
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:56 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:48 +0530
Subject: [PATCH RESEND v4 17/20] arm64: dts: qcom: glymur: Add HSC_NOC
 interconnect for adreno SMMU
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-smmu_interconnect_addition-v4-17-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1054;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=kQCr9BRTX/wWuCiHnkZ4IEloHpuZO4nxnn6nFDJWtJA=;
 b=PirKNama1rX6T3O90xikO3zJbs4R1zjvKCN9rN+lImGmZfjb6w8J3IBREFB0LIbBUhDXscinh
 nJcYe4iqZY+AV+QgHvh2Wx4pbn05gQe7wcOegQFFyLLe3xuIl+tN0Pg
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX3PPvib6K9Z5T
 /lUFnTZ0nTulLLcyUvmYtj+BMT6gXrKH8Nd1fBJk/MT3USTFVKW7r61Lc87a4xRC10ok/vmCQQa
 F3Omvl6QfbdjIfcSYUrBjhy1M6psR+6aVUewuCDgXjwQQ1gQGaEUHfWEL5Q+Je6m1V/ongLX4ft
 rX+2ul+/lUcC+QRX5PkPF8V3DzdCT2BNFl1LV3D/AwQnCXitkIzPVeXMC/t2PdBvdgVUO6Dh302
 crctXmzqUXALzcmjHPHBstrh1le7Q6yywfPk6P+Y9+5ydbVmbUWx5i8OuDRH+hlp+/F3jAnNmBW
 NbLN05pCsQN3A3F2TzElmC7VDnnM/bqlyuyJoie7vcEagx2XB9YpEw7NKtyMr86zBycFMst6KPA
 4a1Hl7xm5h7DQa4PGpgOGY403CpObN4tj7po/irbHS44Q+97JyzbjgWBbJ+6BpjGk1Sc757ndc6
 vkGuj9L2/AG/IxRJ01g==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004e9d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=a6KFA2mGowSrcUvabvcA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: 72M7IoEKUDBQoVblKOiQPu0ggHwafKNT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX7XankSslV/ve
 c9Sb6q2agw/UfmHOcxL74KzYRtUVDLwjRSBVcKRB10HQKHYZoedXOxGQEzcBAXjul9Aij/sqjkz
 83+Zh5aZT/p++zEQvT1mge7Bnl8UTDI=
X-Proofpoint-GUID: 72M7IoEKUDBQoVblKOiQPu0ggHwafKNT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Glymur the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on HSC_NOC. Without an explicit
interconnect bandwidth vote, the HSC_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index cdaf842814fb..ae3cedcaf9d8 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4378,6 +4378,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&hsc_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipcc: mailbox@3e04000 {

-- 
2.34.1

