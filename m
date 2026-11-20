Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172863;
	b=Cj6+Zgb1XQy2y7AIJJoCDlQT1pD6HjuRR2VD8EjTmCsiwDVjTvtEwkNOgw4HIEUXnFs0
	 BUNdUDbrRM2g2/m8v5ZX+N3vzVhnV3h3dR2HYDqsVsThFp8Ta0QDiQayPQM0iJRfE6KEE
	 ZFZb5Pcu0fIunPAHVCkF+8luMO29bJVvj+84rnEKcEegnZznc+lM4vlF7o5/gkI8jIVi8
	 ea1SiG0vGjmIWsrxgZSFL8NR1IdWLE3a4PGVpVuoqT6O/BN5hALnVb6a5zVUERtUStxdV
	 Tg3eWbbP4vr5Ee15GGKPqaEfNF/zBTIIyPJgP4YZKSQeA8BLRkuUODKfl7zMhrN9lPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
	b=weaTFVJ47xEUc77XSuP6KWTdbs63iiQXGNfjLREuCfrDFONAlHfiax9bdtPDMA/9rnVS
	 xC42+l9eUmy4Jut0P8d2wUeElvnyY/AaG1aKw7HEAqltTDFkUcZuk4gWcSwOWvgjGwBPv
	 cdP6HLhD9iqSe3iM3d8pUvr80uhV8dlkX6q/Sme39/nXV1CaTzivJCapT17fhT/qwrBgl
	 QZDVn83sFfDtcwWO0xLrraRkvF2k60k0bdLah8ubF4SmiN42upBF7WqPjaz5yQyuV29bc
	 w56JjanahdtQtMXCGgxJ/eoR9oFiJN5cKLVuIIslaQ6kN8XZ6tQg1ZagOmvxQ/CsTHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD9RHG7z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWPjB48h;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F9606D844
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D5F9606D844
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eD9RHG7z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cWPjB48h
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjpLT1462905
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=; b=eD9RHG7zNlekuLQO
	Umc9O8xT3sNIDqKFOpEJw2iDgZ3UfIvS+T35wGpJlX84qZGQC+eeIoUvJx/gnzIK
	Td8+A1/IePDCjvYYhmGwZ/a91lgNKSzXfm4B0oEksUvnsEjqmq9q/O81ui6T+2du
	ZfjLYl38qtj7dwtdRaXN2w48AVpxdhG1ig1/BwoN9eXvxdRXMuOCyS08baF3/LnM
	2wxO8Cm4QZr1cIpLNKHcW3cJzRP0mg/mSEzriD8CKv4oXCVw/GR27B1MxNDZZtZB
	2h+PMVP+NyI9oHIACyZJhGWKA/JPDCDXVuRTH1n2z3QZjJJEfhinBUVZKY25aNEM
	Ims5yg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3724667bc16so592073eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172862; x=1795777662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
        b=cWPjB48hnKmYKu25mJWz8MZ93llQlUruAvcfYL6VfAlG65mBPwBNBZTnqOZ2bNBLXk
         qJSL7OiYtfiA9OK0MKfVQ/SJP/D8S7AgwbQpOf/t9WE4kBQ++l52D0CCjbM3av3sm9nC
         V3tCk2/KOuOSUM7gzuuzT2hnSQsZeZwGfMiVGScEvgTgtcurjZcFUsCy3jy6055BApoL
         Cdh6/v7eWXPX54zgwBub4GevXobP1RNBAIooz6bQyKYXpEzlhkeGJ/xLd7Vi03FUL+89
         LlMsFv3qn+edDBp9RaKZ9HrXw46Pv1O1WvGFQ2sesWa51j/rBUkWTELQjjf0Vzt2vwGD
         0ZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172862; x=1795777662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/39YU5MZYqo3QJs/gpCcGuqyuQd4Jmu1xV4WICEifQ=;
        b=LQlcEBm9POK7iyRgAEePOju2bhh+9aRF/zkUfDtnS1NYEiL9sml5w7PV4RbERVV2Zj
         fBo940BsX178OVEnLyEl+oN3GnveHvW/4OWHTgm4REciqkmeF/8ebt5Fgj7AE99wUb/P
         ozUAkd+YxOUYnAeFWkPef1u5pdQ9HVdBMH/VX/Xv/Tn5gX21X3LGv3NZ8paiF4FSj1bJ
         le/P3YlQqZss8QTBh/NDWtS0+m/onoyEs2ISFqWpnfBr4YpLEDRJBhga4/LW8vWxaXBQ
         vCvhuUHpQTNpI8AVHK4pEubEc/gpafYa0KLXPTc7tG70s3z6c17KyTuxdtU7Rl7D2W/q
         ZgFQ==
X-Forwarded-Encrypted: i=1; AL+hErHj+2g+UauXj2Bg/7azGOLjzJ9CyRfW3t3n8YiPHw5ZJp3LvWrebmVnhvQGCQNo3mffIEYrmS2BqryDFxrf@vger.kernel.org
X-Gm-Message-State: APuU4Z+omOakRvjGR3iCKrDqugx1pfruYpUCUv72gJCFsLXrjjNFQLdN
	vuRIhww6Z8tirPqcceNQvFklEs7rKhD8J3aWRovSYfHDIdrVdKtVo+/F0ZeqtDEDOJ4sMZh5+pg
	dy7uM+dukfPlPXCNLDUgs2Y5AfMwjp6o12oEUca2MyKko53iXvNJUCM863R4YajXApVfp
X-Gm-Gg: AZFdTZe39dicWj+6G0/PFw/tigqXh1ceVuOOO3PfIs4E38/jsy6YoSQOj+9Z/MGpIxe
	wCLBA08ypyBGlRzL0ajM+Px+CD3fssrzFOauIq9AWCOxxgIKq8GIbNCUbEBseVdmsLN74Ihpx2K
	Ugfy3Qzm6OnuuK2Y8jvVM/gi+MFvtZ4gy7/BY5/3cfTvbczgjNcvEI5M9Ie4dITgjOzVmZmuWTX
	fadJxhq7v4svsT8UN9sWUP8YBY57knLXcOJGMV5DNKd9x7tiDWGfaInh4HZYt3juUClWShOhEYP
	ugvXQCLnTNPmDfo7zzTv8rKMrtBi2Pb5Rd27PriqoP1qESTvBxqsgPEwgNjgntsajyBAIHN7RRB
	5uirs8JlS9VZx5+zioTHJqf2az8RM3jbAhdKl9YV7YbhM7SW05xIDJwftt8VOrsgIMUeQKwIzGf
	EQBABX
X-Received: by 2002:a05:7300:f794:b0:381:c31c:bfbf with SMTP id 5a478bee46e88-384b496a36amr4160551eec.21.1795172862132;
        Fri, 20 Nov 2026 03:07:42 -0800 (PST)
X-Received: by 2002:a05:7300:f794:b0:381:c31c:bfbf with SMTP id 5a478bee46e88-384b496a36amr4160488eec.21.1795172861446;
        Fri, 20 Nov 2026 03:07:41 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:41 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:51 +0530
Subject: [PATCH v4 10/20] arm64: dts: qcom: sc8180x: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-10-cab8ee8be0b3@oss.qualcomm.com>
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
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1335;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=BJI9Qa+ALwqIsUj0DfJo7B+SV6DPkM10cbLytxJMbcM=;
 b=iDWhFdAcUQz86qchqaGgo72B4dP/xA4xeHvIsaSCpx5fY419WT9WrzE1fBkWEtNJC2d3KiBmo
 LIRDLJ0PBAlAUyr9Gm5xL/jT1k3Sol2uGi8bvu3WZCc4c3ZmPDmZ741
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX5XgFycUETqfH
 +BrwumNOyaKYwrdQadl0DEF3LLDJV7n2Kz7a8+mnXpcIhUbmW6jJ27eYu/PDWM/3Tt4rY5l+IOv
 tnvcI9g7OazOADWJrtX2e2gUJ/QB94NMJjjdOFe4sRi3onQ0BQSmzx9gUP85/4kjo3UreF1cL9/
 nogdA8EGfFzNdrDCZdv1HHlI6C6kKBfjjPXPlIou2KAXd36rCWbV7H0i42u6vLxnWHQ9aWXkF+p
 N2Z8CL0xmRys7ZyQh2awc0ehtZsLHvsF3sgba5ZACpZBjbAWxSDzQSLwhvdL8vB3jhyhu1xPXs+
 gNKuiMg4FaBCwoig/5tzmX1/4KY05NzG/on4gbeqMvlCK0YayyS2BFEMMelwdVCvoHT2PmV8LUD
 cBaZqJbMCGh3eiwUszZGaoLz7tcGKySqxI+ZPCCgiSxn21+yGJglsSZmiXi2sIl+ABJkUtpzvi8
 l5w0gizRdOw0fhst5iA==
X-Proofpoint-ORIG-GUID: azERT-67WJ5jKr4slfMAEufLiVD77y8c
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b0029fe cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=UZQlob4mJqq41ALSq9YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: azERT-67WJ5jKr4slfMAEufLiVD77y8c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX2RSo5qVwv+y7
 /nAgoX9TDfUKDllsUMbkepDhNULefaQCU8K4uP2MOyFx8k8LD+AS8qKzL8sz2+Hm8wi1TciJlUd
 u1YpG6aGopTPSoDt/ScyMItB7ra7dd0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SC8180x the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index be79608b7161..88a39e5e8f07 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -2280,7 +2280,6 @@ gpu: gpu@2c00000 {
 			operating-points-v2 = <&gpu_opp_table>;
 
 			interconnects = <&gem_noc MASTER_GRAPHICS_3D 0 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "gfx-mem";
 
 			qcom,gmu = <&gmu>;
 			#cooling-cells = <2>;
@@ -2410,6 +2409,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

