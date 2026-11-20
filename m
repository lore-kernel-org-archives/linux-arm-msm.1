Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172828;
	b=Js2r5NYT8sTX0XyFLuPSfDHWz3D3dv/rnBF8KlUErFwu/q+HJ/oRhLPzgGEolWirZSjo
	 R85m3RwaYw/FxflHvsqvBe23J4kpFzOkeV2/Wf+Jri5gMNuoIDtFGeMUjtfBAw+mD1Jo+
	 IRRVaGMRfVcP1hfwgIxSr9Ko+yrUNSSzSOFJRMXjj0gpxYyKbvD4cSRBcxKo5plbcIPqB
	 eXyKWXX16AhJyN3ote5AbOcOK8UTphxNCkm/XSF3TkPOEk3uDHlQqRc9n7+XxTzj9071v
	 PTy+WnIw0er5OfDx453xtZsnQRIPICaFybCTvZi5KU7Qx7JL85rqxMwCVHyxo1zTOUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172828;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
	b=GrDsxxaduHYP2AsuQRP+znatKDvSzrYuFj/n66Mx8N/oMu9TPiplRY/A+98c1GdvYYm9
	 Mkq4MMxu3bu8Y9WVejTJ4pzktZVNbs7fmM8rlZCn99vK76kvcRrtuEX7mADBmcye5kvpB
	 nvCKpxyPaYzA3hxK8JeYublYLl78MH97nPkEDD3UEz5YN6q8HCWNhloNDlfaxedaLp+Sb
	 8agQ5FSN3bUw7RreUV17ICWd3XUlRvkdrBaaKNZAlPwx7G6y40N0YNxqZLvB7E5yNv/rO
	 zBfmCm0eXUjsnNHgOeJuF98++/S4vdjDYgtIo8UP38vIJzlC4168DIW17cbrURwGkIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blpj9S3j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VgeuW6J+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC4E60A2604
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AC4E60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Blpj9S3j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VgeuW6J+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6401528777
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=; b=Blpj9S3jBEpimAqR
	kcnxRQbtKRqltk8V1M9qtQpYbyVMXPlKJNXCkEk4qw6pHhw3kOBmuiHQorn6HDfi
	stMDbLOtYugmbrzXfUN7ks5CaHgJFmia9ruy5rydRPVgKmZ/ujFWUwQXwOQ4vcBr
	MJ5F3/7/Jh/xiwAdKF8J1tcu7YfgggUB6om0hBMGWvXd+wQNWY1xYzY0by7QKZpE
	b/IXdF2sSKg7lSq5Kdo7G4qRGGgkYd4GiTGz+rm9u7NWo7/OkuGFbx+3+a7yTXwi
	uzv/bbd+qZK92CSrYPZ7TLYAW6EwtMuZwh19jFHDuvbZnbWuoVVsAZcmMkSWiaEa
	3Go6aw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsg7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so591646eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172826; x=1795777626; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=VgeuW6J+EpSR2zAUlJWkLgweV6C0zFVl/6Yd8fym1MmZwVSUt5Uij3FRoU9zrYGuje
         JKZsnZIlhRb0UELh7tjEm46FKZW+zLsXMHGZnet9lj9ZT6mkYoeo678O8nNPLdmjlq7t
         y8eIZb1QH+rtJXfFnqjJQlFkgHgVmB5yVEWgt8xM11gcwKOaoWeQPUFecIrx+Dx0ox3R
         8xGe3BHd6fsBpSbyNZXjoyx50vyMkVlCWNekMHPhyPtq+wTsCyUIxX8MrHUTRMMTFI3t
         mrRSp+JOJFEgg9plKePZYv3IuF+nhDBrYg84IvL1C6zN/9lJ0LHq1w7bMlhtlFJsH6O3
         i0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172826; x=1795777626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RlON+ka271akEIm+UwwGOcUmfCI5oU7Xqxw16FqB4Vw=;
        b=mska0PPc21fO5YmrvDqZwNmSjuhSZjbnHFZ0jlxwNcIc6ViQY+WjmuiUdwpUEospr0
         OMYG1BIRbPuPEE70izllP1enKApSbeBBaO0fBS3z5CrJTeXw3rrSVcU6hQt1jzs1dRVu
         h75i8DPovhSuminWw6gSHo9FINMtLb3QzqgpdCNsjV3/BVgNRLsCmsOup9gSoXOg1aEa
         88RgotRMsnc8QDkqrnQI3TLQ36KDic2dltw4ioDgoyXb9ue4fCbYH3ZJtJP35uSLRdv0
         tPlWRm8uhr4GEuO018n+Ce9L7ZS2DIfbxjG1mCJ4jdmFmxy3+MbHYZfp62yRhCAn89Vh
         WVAg==
X-Forwarded-Encrypted: i=1; AL+hErH79qtwB8GBEKdkyPZhxlrldMV5Js+YWXgXPFGORxUxcAX52X9SegXZoiID8mC4K6DZCnar6cY9HuHI3YMs@vger.kernel.org
X-Gm-Message-State: APuU4Z+yKSsLO4PYMHFzsrORXYUTTCzNWexzh4KFobnsv+c51eItWYYu
	dU2bkcybLLPU2jvLicQDGE6yr3/kaG/yK2rYOs/09VlBtXDl0FxYbunCWAaYAoQJkUrISnb74fk
	IqDvCMECvu5WsMrjjiN3/PqCs25N0hgUsvR//p4gy40OHs2RH3uThpy96JlejmOGOZj95
X-Gm-Gg: AZFdTZfC3IWt/ZGREq9fg7MtJgffy312qAePJ+8Cwu+bj01xEqMimlK96yROm97wS8F
	5SwAS91Bk207KMOgzOHvAlsIT/S5lq0Qd9Js3jmA18xz+MM6T8rp/8+w9PgH9guOe1J8WjvSaOH
	OxY6i4mpXmq2mXqfJNUpTzXiiv59Teqj/37kVsqZUKO3TGJrzeI98G0JKM09r5s6HvT+LfCzUlG
	vhxMaJ6AHBCx8HypkpVTqr4W5IMm0IH6Q0IZ8zwv0NGbM7aOGVpJqrBAWb7jIeut7Mm8soOVZbX
	e+B/28nN8t/P9g/L01pDwPAMgtJWBdQYuYHi/PveDnOpK9WXHyE2xHn+kvVgAPTXMThA0WX24L6
	bLJXcKpPQA2BpBkn89t3i5JaCFagav3UtyOQOKUnlcDbyidUkx/Z7fq4nPw3PNJ+8koiQivoI4h
	+dgJun
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr2845770eec.2.1795172825841;
        Fri, 20 Nov 2026 03:07:05 -0800 (PST)
X-Received: by 2002:a05:7300:e9c4:20b0:383:6f73:eb34 with SMTP id 5a478bee46e88-3856c6b00fdmr2845713eec.2.1795172825017;
        Fri, 20 Nov 2026 03:07:05 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:04 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:44 +0530
Subject: [PATCH v4 03/20] arm64: dts: qcom: kodiak: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-3-cab8ee8be0b3@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-cab8ee8be0b3@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Val Packett <val@packett.cool>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1065;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=nfp8+SD9J7PQP1TIlHLZz6YXOr5xoEhGVTCZWtBdhd4=;
 b=9enQAwhrtiAROoFA0A0yXkaYWGcoYyy6fPoNMJULacdk9ULbL9BFKhSfPzmdlWfAc50CSpTuM
 BXgU2EZNUdlAiuErjAsMTVcYGtW9zxqDvZf9rLcNWXZVHqRoHeGmXEN
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-ORIG-GUID: Qkcv55ZzqEowv5KYhvDyC1a7I8p71XGV
X-Proofpoint-GUID: Qkcv55ZzqEowv5KYhvDyC1a7I8p71XGV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX1lLNBolV2jBv
 AgNaM9HTUMcarYs2yu1iIsL559vtmSuT+ifkBp1oNjabX30Fi6Ms1WTq8TEz5dLvqwsrizm/CQD
 t0PDW5SnGyvLlH/ttbM/EXidIdMjKm7i2vRqlUSs0NDUpZ5JO0gjxdavdOKaXB60pp2BzmlEmz7
 ZzXmpqaBoFNjWde0lKHBZqipvlA19DgFHqqpt+vHZfUjMvsoWfEJ0oLCaZGTIlmOLxpwNAEG3tl
 u7teSVVKBu3g/YlKbLkxsSKk2ZTZYNRzRDQoc/pxQP/GqHDM4KLuS6drnMHev8Utv7omJhm4zjX
 GqowVqhbscMuwCQ0YkW+rIqbic7zTSzvBDICRd/Molocm6CQ+Dmf0yvRbYYaqfbIovAETAuiswA
 bowvgUYEyW0+hfrMjNMjdA7Pvbez6ZMPm/hfM4fHCox2aS2Vx7X03NgxEa0lC3CbKQiYG0wm2UN
 3BPH/FgUOatpO6WxYrA==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b0029db cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wmxX9RSyIuGEu2EnybwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX0Ha7RSBk+QCW
 nTGQGWqIuljT8K0zEhw9XVWPK2y0pHObMlYuXxYnYDsumlDZz6IgdVaPwGjXoz+44R6GXWmVSi2
 tjVmJqlk+aq8uIxXkm1NzBMRkgvSILo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Tested-by: Val Packett <val@packett.cool> # sm7325-motorola-dubai
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 10e9a5279ed6..c142c7cb509f 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3413,6 +3413,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1

