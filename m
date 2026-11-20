Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182175;
	b=KzK9kNqbgUWAwoQFRoktehixsUzStkFilvglzrkxmIBvKMhtARNZxoTPgFx3vw81jylJ
	 wJdZK2uBzERokVgqWSMofksojZ2MN2qAfDE+xA04RC2ImNbJKT9Uu5Qa6RHE6DqXX/NwG
	 mK2hnGZjTRP+YjSdc//H6halfG4TKAdfsVy+sV4gI3WTetwoR86MEnIwERlnuS1IfggKh
	 YndHKBXW5YoDH1zUpjw0XlMRPcEvAxl7YFmsbbeW28VEvI6jMLgQVMql5q9VlTdVx00Cc
	 AX5t9mVhHyBm8d0253zPTsdTrZ7Y4QO0YQjc6MpepPV3lfgzbEgV9E72nJ7RXXHg2Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
	b=Z91c3TTcJBSzRO8X+Mo9HNlkxZDwN6hkGgkKz8DgFrNRQdUEav0SRuZFPouas3VwSbaY
	 ekMJlX3B6Phd/LbUV6Ya8RtBBqiX1tzF7t++N2NPI3x1t6jqfm9/yN1+FO8Tvj5nCQnLB
	 pVN+3T32TlzzQwIGt1waF2NNRyho56PLCyYrZ8DA8RCsfh1ZT029RIV77xWoOlVIbjSdV
	 OZzArTsl0Q+16/Mbwffo6QYQ+iMV2bLB3QkuBFRCIHhHo1E493eSc6jUYGp1vaNiaQX6L
	 iaeViT199b8ncaNP8By13j81iutNfMrUsosvaeZQL9+m1rVTEtOUxbOnYw8KPYGWt5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAUYNwmD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+lLWnxc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247F7606A32A
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 247F7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CAUYNwmD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L+lLWnxc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkLNF1170033
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=; b=CAUYNwmDCpzBPdlm
	MyKbSiLl1f2o1knTbSC9nBMYV4a/fq8yGsVUuE8CFNlQln/+pNv3bU7gXKPDK+l5
	E6mRJiiDzGU1kNTyQPytCjoIu0290cpZ61ztxLqHPzh+tMALv2OCB+PPNc7Sr1Oa
	iM7e5+6ppMAvc10SEt6O5IOI4RbiH0sq+BFw/j6DxNwYq6OcSnOm2Upv78dpccdk
	25IhQSyb41vRNA/SWWTM8V7xf2QZWeDBVWxKRPcvBm3iIVYkqcQkGH2OW2usdcXn
	aM64fYKUfxmFjbd18C9ZULu51nNA6GtFuzVniwrz3nL4hwkEDgT7DS+T2DUVt94Z
	CjK7iQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uy65-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:42:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so992870eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182173; x=1795786973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=L+lLWnxc2rsi6XGzfLO94COz6upI4/gUJgsuX5fsCAoKX9qw5GDMdAa7yFjNYYqVqZ
         PQ3PIeXT52KyEQQ4YYmUBcTD36rhgZVtXSQUpgN6kQDtI0+Hz+3X+VxNPJn3zw7U1hfh
         zwo80VEFsh7flPSIN5ASOtcpep1IYUlX8Lka+JLsiviDDPnksaIf3/fDBfuiTuHCrgBm
         NEbNBTBTl//yAh6E9Mq0EazX11CkWKCUJ8hhTJywFaeAZ1lxf7t8g54gWir044h68UR/
         +56bVq0P/pR4iAtm/h6cLY2OCa46bUWzJYGD6uT3TJlHV+oVgBKgQKk3i3SRktPRRHnv
         N+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182173; x=1795786973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNsUn4dSC9kKr5schE1mZh9un8wSnTsQUYTEKMmA6ZY=;
        b=hQvNWJp6g5wLdk4ICpvt+wTM+oesgZMH1dpHPcCDg7VOfKBE4vKgRDguwG12wUNWUB
         dpm0r0svenKMB+57zFBQsHczSCpseVheEwN6iXLTzmDXHD3jN2hIB/J+GpRfX8/Fi9d8
         QxPWy+giT0icqMvJ6ATlPcfbI9Ul2ErimrD9se5zds/X03LKq5Z9r+C8rR+ZlLyHppov
         J1N3FVExAzwM/ftflXrZIdUX3zCKYs3otCiA5kE/RMe+Y3HxikCwQRQOPjtuGGNv3X7q
         qKu+KTshNmBYQHoWu3LvNUu3P/069OMZ1bFT9O8jM9+jIGAKVdM2z+R61jT4Wli6KTf6
         5flw==
X-Forwarded-Encrypted: i=1; AL+hErHIHMukYJyL768hC+Bf4+G8mDWUw+G+CjkahRT5vk8b724eEkwuI9wuRUfmFP+y2bOD189m/BE7+BXLSnwx@vger.kernel.org
X-Gm-Message-State: APuU4Z85HZr2LQyzv5LD/8JdpCHP4/La+jcrfE91t4RCN7EyVIB5m4M7
	JEzD94iOpPbFyjPbT/av3VdXWlSuwRiCW/rtAv3Q6HD9Rx/saKUxlHWMYTwGl20nxtvaFl4OBlk
	+xbz+CJ6W8gUt2nmxckCRMgV1foTLyyTb/Mc/b27HoPEhW+8p9f5W3Qc5rZyN3FXw1qoe5hZiZa
	Fw
X-Gm-Gg: AZFdTZcoexFPF2RrCTAtNkIVumbCLW1Hc6lonjS/7zVddw3An8Vk3c8WuLBP5zR+eNX
	hsyNWtpUR2d4H3+F53rDbfmV/GD+7nVbJ1kFmGiuX0Le+5mwiARLRAezoadPJohzsB4deTuLwxd
	5O63LaHxRERLYG+77KW5HH0aqFcPDPTrDwkhSBoLrIdyhSdESjKqIj1jM0d47Qzj/iRbc/WH/i/
	Y1NFdH7ywdi3R/mIrRKtejsXfViQmNluJ1WKEJW2NJ5R5MOd4zjxMaOkGc8bwhye00MWFCldUvB
	cXEU2S+HIRfntgSvCmHSXLC7+7MD9Cdu8nL0VXRa/tPxfDm2a/hda2LNF0uwfCaL+OVkLtLspjx
	o1sDx9gFwX4WIdrAlwPENbk+v2ONrCxQR06VKJ3zAudSDnbg80eaQrfxCyCV657CXYvPIXodW+X
	vjZ9E=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4218402eec.7.1795182172851;
        Fri, 20 Nov 2026 05:42:52 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4218365eec.7.1795182172191;
        Fri, 20 Nov 2026 05:42:52 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:42:51 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:36 +0530
Subject: [PATCH RESEND v4 05/20] arm64: dts: qcom: monaco: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-5-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1018;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=1lPh+lGGWLKglbX1purFejDWg8n5fwBJBYl3rhWzR6U=;
 b=oUfXjkp08+mArsrZiKnkDBUGoVmuJ2eZr5NDLzeoQIP9UyDpL2QqdSa5M5lOtFa9uE0FtdArq
 WMGUW2T+o9/CdUf/Y5BNFEnVKbWTupmAIgS5HZe+BEAMk4mE8b6FF/0
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX4X9ySVxZwe/Z
 duR83IWhTsWlgnqZrIjoDfp0PlSFV83fjt2LMwFIJBbhHejiu8W9dQgGtRKnx2LgqYFiUedGOh3
 zFxcFU9o8i8Mk6lRzNbyH5sccLvvEXc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX2AldRueX7P/f
 sR89+nCBpiKspnYYprF6/X9U+H0D4BwsKSnQmFeC1gnOWtkRfJRJMuJH86BATHZGZz4QQH9HSrc
 BF1oHB3ZbYJ11Ej6oqRY555xB0VAHDBHEL5h6SEPfVEhXc4aAxK6ht4p3l0m2Gw1SwH2cIzZfYv
 nRFb3K0mBUEWKfv78YycAnF5a0trA3O8dueikFVXJi2dYlWWZRh3+X1bfS96T2DPo5jQ2TKbxz3
 V7uzqePOwvIg9Dl99WUYbaP9vWXQs9WeuZti+Yrm8JSVlNZJuZY1TGUn9SeC+03vAlcBV8tewln
 yNC1a/Extm090iX7OzQVkQtMI7aK7R2z2pHa5J1Si6RIAIhUKcOUcBddLjd/cQwh91iCm4AD6fL
 iYVUPIqggP+dSzJZ1NKXEikans6YIb0gsuvVWKzpaXJrLvZg3tCcgrQC5Ob8mRnyPbJdAJPCfqc
 nUD2iwkSPtYSITAoyEA==
X-Proofpoint-GUID: I2VnAXD3FfUL4aAmfxDPs9Hea63l9yQx
X-Proofpoint-ORIG-GUID: I2VnAXD3FfUL4aAmfxDPs9Hea63l9yQx
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b004e5e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Jjng17ChVe8r-G2aFk8A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 3541313a79bf..13214aa77279 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5113,6 +5113,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1

