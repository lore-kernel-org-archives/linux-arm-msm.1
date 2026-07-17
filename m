Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE5A3A1A35
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320966; cv=none; b=ZxsdXXWll7I48Ja1vUFhdXCOtxKTDc6DwSg5aeXBOPDMy0DwurM4Al15nnHste+L2TqFdUCyjIlZcOo0Vq8lSwU32EfBUljVrJc45qEcfx1SAShW6BJrnvym/7TEc6FGsLwnJRMaUb+CzjNPzxu0kQ6kua0YgyfsxDoGk+f2hxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320966; c=relaxed/simple;
	bh=VxVfs90+RVyIFj8A0qDzTyazRfecJmozpZRL0X2Homw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwrd4aGTq1MqEDvqCqWbQPihDC6oTKmfBvM97ZtZSRa9FDK1khq/ZdgyEIlMvRfmFh2jOv78gbDHtQeA1l70T+duLAHUj6Td1hytwx2cSqhCaBBZ6s+mhtibpmtjAs2f5zmVsGGnJx6Hur/q0NqIQqdm/+ZQbhkJy5PNJBu/sj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GD3fzSng; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R27g43d/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GD3fzSng";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R27g43d/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtj7I2887286
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=; b=GD3fzSng4mzaN34w
	lyG3oR0LBYUx3m+Qt/0ZhEE4VliGMDFm6RGxkvWJGSIITjX0E0PIklvvwsPM6VH2
	kazsXfSDaTgjfy0QA0mp+cdKHIegZGn+dKWdOUtkksdJ6EESL7y1JO6MHn7zmnL7
	sn7zeT/ui3A60R2MOqcqLdahw0HdPzn5/q3ZGdaiUVQw0QxcaELNswEc1Keb8wWh
	PYvfue02YKfPd2zbto0SUbUBpe4RJRJGlWFhIHMatbYBdq1KMPdYE8RAqCeYtx9o
	J+kjitAFjiqDO1dexz7SHzgKYcnvP1DPAHd643M5Grm+4UrXs1o7CSOceq9ex3ha
	U5RzAg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfjma7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 20:42:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381abcccbf4so4735231a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320962; x=1784925762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=;
        b=R27g43d/BvnWL1klHGO8FLlXfgQQJdssOgOy7x/bDc+4BDVNiiApYtoYp0/dTYzQBy
         kTZiaZpuEjg5FiH2NF3PtnJsFcGdfdLdTxFUH+o9qLmNO9zFwxVgomhprS1Kb4a0xCyd
         sIygVMZQ3Gg0tUWl9R1ANOKfNZKh4793pM40scHo9ULtW50Hy4dRjGicvq6ly5C4Aoo4
         vzMOwMTN5YYGJXFPBKhiWGZELoZUav/3IUSQXpFkDQu/QymbVSbagZqW/e0vRjiU8GSY
         8oRSYArhql7D3fz3NQHdf5vDo9GXQBL+LqZS1minSTXLn/mQUTx3eTRhRLx0p9ZCG+ti
         i3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320962; x=1784925762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=;
        b=Oc1+1u3V150Ha3XHdZaklaoDTLYnokNFz5877056XEkmlvDBedoGu2HNfK+IEt/Oeo
         pi+uD07xRG5omlz2DvGvmkdvWCgz7KP5tr0jqe8DnVgDOeWgk4a0kTmstD3KKQVBIMnb
         kBxmioChiU3gv6xi1s7OAOSzHrX+2FxNzhpCLlVuCUwU9ltEmZWtFfOh3kBb/gU0jGji
         /HOK1DX6UN7bmuAkEHB6Rx7wWOu+c1YnIG1lkQ93/ECqSLgiN8rdhHDtTXtEjPUfiVhO
         cQBVt8OZ1WW3htUqZGCtcQwtDwxJjYe1dru4+z02Hm4kXNpHxIWtpfcqn/77nBM10te7
         5pzg==
X-Forwarded-Encrypted: i=1; AHgh+RohBf2C1QISIxQmqsuO223Q/pagH/MYAbBPyNk3lkZ41kvlHMGKXwO/niihBDyh/TEYybysXa7JFsHcGOoQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9R2T6Y9yy8XtVN/GD7Z/ZOk9kvqRBRyJWhAC7V3zrQqE/Fq7
	zEyxptT/vAwjnHUoR/wKG/M1qGYUvA4HT+uLV3JIWzGaNvNF61lDJ64WMzgp004PF5pw9SiK3V9
	tI8An6WYQrTX3+Wexdh9WwQityW+6LuMwdf6HqzBkH3Wd6hip5TvAR0arH7YsyBaF41Yw
X-Gm-Gg: AfdE7ckLLnEWBT2lVrsY+AdPmmqYoA1lUjyJZltqGLOw/Q31XJYJ1hfezq8/kd1wjNj
	fZfCZh1X0DzsEUufUrL8QeKRnL7p8SLeTWW+7ncjDNfU82zKro1Bxp5E3qfFo/kmvLPOEddbPk7
	PEaj2uwn1zqam7fsllbDeLjzqQo92DU8LRggndadGvQTWwMBl6CzpDEzjRym0gOmqcbdRjTh2f4
	qhOz54IzPsSHI5nCdaVD6S2ZJiabrL5MQGAdMMnmvGresOCKW7oexqcT56SL+nmKZdXVJsnTABM
	Q46Vh93MxLXi4eiXptgzt/Jy7qmx5o2pg2dZlcgmfUapDi72DrwuNTe80CfChew0QYKgv9wRPUO
	fW0BoNBpJi2G6LfX/1K3r5Z70
X-Received: by 2002:a17:90a:d44e:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-38e4b3d0fdamr4149518a91.1.1784320962256;
        Fri, 17 Jul 2026 13:42:42 -0700 (PDT)
X-Received: by 2002:a17:90a:d44e:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-38e4b3d0fdamr4149477a91.1.1784320961810;
        Fri, 17 Jul 2026 13:42:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:31 +0530
Subject: [PATCH v2 6/9] arm64: dts: qcom: eliza: Add GPU SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-6-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=2286;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=q+INaEIUNj0EXeDmcw5Jx9wg9/Og5BIcLTww5DoAVnA=;
 b=Xr36ABXncw9ToqIETUKiq9f7DTuutD8YoPX7Fr09ffFks3kKWGRv7D5+Z2AlU0qI/PcuMN7JI
 vyF+B9p/KGSBhQbdfWh2JQz3GCVlOhZthUh2mx0IpSvMqUeKCWSYaS+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX6Rq0dTShv1LI
 SPdI5uNQZ5t5jHgTHUE2S436yQivnmQCbstMhgrK5EY5WSKUfm8tkjQYAXqgSq9wi11yWkg5M5D
 peF6VEtDGZGHI4DaaAQK7Ir1aQt00vODBp+UCjVHeeSoRZcyQPXUEm3qTdp7R3uZ643pzQbzzWV
 +f5ijV74onFaMq2kP9M7Tfp1cuFUAbEtaLmkQ+Iqv+LuR8kl/dYnvKl+Ucc+8lKAqv4YzQq75kP
 hH4EKQIH6qzdWKYeUyg3b8qs917U6jmFRANicWP4CXolHqYBH97+0hUVkOGpbeXJR7ls5scMeFO
 3LuTX0G9pfMVlyCpZ7Ai3WDYpTrhAQn+l7/0Jsl0SQtMKnCD4qhdRsXKcTAYN+0dh3RD/6pexUz
 Vtdgbm+kBlmjmZIfTlgJnlrucUVr57tts1e5phQ71qlEMTSx7898H+miRgvin03v6Xz0gSUI+nY
 RBlG2Um+bYGXAwFtl2w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMyBTYWx0ZWRfX2IgjIaJAVayg
 7HcdQ2J33jMATAYnAUkA5dGNtadnnxIX0wG9VuWx90eUAM6eD+0b4zc3pZVTxfBykHOiiS/cjuF
 vE8cmapPvvNX//quZLUn4bEtQXV2xug=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a93c3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=IlPRAfYEAefbqxDJwzkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: GIvfsBA7SCsWWzEkEW9DFRDBU7N3Y1z2
X-Proofpoint-ORIG-GUID: GIvfsBA7SCsWWzEkEW9DFRDBU7N3Y1z2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170213

From: Abel Vesa <abel.vesa@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index c5635f22e2a7..e5b8377e6c3a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,eliza-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.54.0

