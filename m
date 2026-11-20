Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172858;
	b=cKc0xKDGBuud2phPdvbvYmiBLlr/OKIz/i/qDtfLkD1bWZAhFBSLPoaOpiLTQoMuxf3L
	 Mm8YoOyyL+LE6q7wAFS6eTOBKKwfd+r94mXJWvkkBAWFXEmhquMiGEPSMvI1wWMk/5WdN
	 L3UeN2o2GuSkwPEmYNEZ7mbx5ewjhC3PRwIBrd+lxsDgLAZCqL2/H/q+laal0Xs3N4/kl
	 jhRBNpdjjI0dsy8neUOI9Sz7OU3GmbrHdx1AwyuUJbP8QRAJEbYY9bXgP4YvqrJSPkcej
	 dYEVVU4CLty0Z3UzdDSzOejtQtI9E37HdhC3R44s2HNPmOWh6Z2FVyFequcRyq9Ze2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
	b=xj0tWY8bKYLfg9mZOePOP2B3qf2BoAmqtFa7Q+Or/UcV0CfL9ImlrW9rDp/1/Mj2z5Q+
	 iK0FtJTzBOYqlJ2JVsCve1jVd7fsf/tlVbvnjeASxrGGnActg3vYuHUePOLo2qn2XjUcz
	 IWC9PtpYWzC9DsR2FO4DE5nvMGYJwwG+b/cAeBe6SXYKFqroVzVNRs/xa+lE89vtMrcqO
	 u4wWHpC2Nxc9j/jtrMiHZERjzQ6aeIHhAfjlGuGWAtLOWec14AKOoWRsufsLnZmfyxUj8
	 c0m0wh8kz0BEfGj+kvglKP78ruJmetmCamtJKNwT1ltiXNhEOlaW/P79OQBoWxkI1oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GTksC/Y0";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cgTeMHV5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CD160A262C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CD160A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GTksC/Y0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cgTeMHV5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxMu556462
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=GTksC/Y0bKEnnPw9
	KWJMW/0LYKMseO9DPrOptuVo0CoIc1uzdDo/pGQvMUvP1Rvp9itBe4lxfI3YMrct
	hNlUsrpyWDkLVM2AharxTeVzkRw2n9VB/DT4wadGuvHh9b+NKRCRxql7pH7v2UhZ
	mZqqLkNFSwVCnkJYQ6l8xhsR0o3nVGXsD3cWmPJPdqWEiU2pL/iofmYDa+RErjze
	zIL/ZkJld/6+cX3JmMILKva6+SUTpEUn37O/cx2tHijkn57y5K4Vh1GkIqNzw/gV
	9xhyY7hbI1jHiKlk+CMPcKlAgvmcpMCyomuwfUhrzj4E/euJmn6bzVJ0PBKLPI4y
	D6Il1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fsbhe1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383435e46f9so604841eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172857; x=1795777657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=cgTeMHV5uXmGkb3t05ajSI9lp6sTHFBEVAnoz17x57ol+B697LyK5pmS4/x0Sy1K4k
         kMcgpZhxylEgNT5hCjabkN3oREPhbLONawMN4WVYWperhoGPgyhEGSEAp0262jH+S2Sr
         QKia+9xVYQTxZI/2wkGbJbo8BQ6z5CNHdc89P+USgH9eVbpq2QuMb89Yck3u7TayUgts
         HGeePLLOqllL9RYGWuIkt1c8wJgQEz5Hl+/AJlEbOALYkhzau+MtLKIVJYI5OoHwns2y
         1cIHoM8Rrm4Nn1iEKKxC84YBtoNlreOGARxjwVOuAPbt2HIx1kCLas6cTC8axXAmVzdh
         2B/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172857; x=1795777657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=ZaIH8REDV5n2wvKMJiXtXZOT+zFbXA73ICeTdUbtmhcke6YAwqrmchQI3ZvLAlH0fc
         SYdaMi755U0jYt9ZjH65nW1YcTPen+2GsxPnQohzm5xtzd9DYK4Rpf4Kc+CMQ9LHARho
         w2+sR1ffxX9zaWOc+H8HXixzM+jmNACGk+XubD2nV+EoSWy79HHZROthQe3LPUM/uQzx
         TbF0+W0WzewhcJ5bu6CRy5NO5HeuUVlqIdQAdKWiYx8ilw2DcOJ1oFp4o6wH6K8FrvcB
         xG+X1Inh4hXCCmg1NB7Lev9ible/nSKAzCT67mXIiW0EWYHsW3NhWjSABK0OOflgdj0u
         OD7g==
X-Forwarded-Encrypted: i=1; AL+hErEMUdKtqaFHggH8Tv48v8DykF4ilSjTJGZSgTcPwyIYnJj6vLBP+oDz/iVxEwFp/wzFE2tOeEDg7Ui1xvB0@vger.kernel.org
X-Gm-Message-State: APuU4Z9XYYj42jThEq/1iii5Yipn4WOeOecufeemm5Fpgr6ZWOlEeYaN
	V+zfn/eDxfw3xwC4A1grY8hB1ncqwmCGIgNisUC5LTNoXeZvOihc5SDz4iRdEMYJi3Zvr/IISrq
	RNtve/f11ZGIqNzNG1V3w78fQTQm+bIUz64CPf1uUVSdYYmYnMwok0p+lIsfL/qLr8zfFoQ3OS6
	s+
X-Gm-Gg: AZFdTZciNG0Yxwie9HIJ7BXLvhvfDRmOvdQUhkWGQBQ26qrUjQWxka3Tr1//aUVZFiJ
	rATffKHO9xpg44L9VufordPctRFjiJSHrDB8wfYc/RFX9rpcLJtSqFFgmLnxor5uapUQ4saZQbO
	v6YBjK/Zem8iHLiZutwuWuM62r2B8TslqVwfwlv53PmmOyvpmYH5DHdPbc/Gw20Au5oZYWNlZt4
	q7UVAzWR2P1Gdqrn5ZEGKsMdT9HIEEA8SU9mimhvDFTEDIV8FL8PvW5BKuS9ctjRO3ckZAqh0/r
	aMw2mzEJ6n7/G4p8aEGbL6bF31px2ot06w2JKH+vl4ZftBQjygPe68vLlOaKfFK2/Hg9Bg4LWMw
	+FGPGVCXD0r81dnnOWgA7NvSjYuuVorICOpnDZZoyIvNX1O+l3bseZ9GVM8wrZszqNKZHixQBvF
	bwCm99
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr2356044eec.36.1795172856925;
        Fri, 20 Nov 2026 03:07:36 -0800 (PST)
X-Received: by 2002:a05:7301:18aa:b0:384:eec:aba0 with SMTP id 5a478bee46e88-3857073eebamr2356002eec.36.1795172856199;
        Fri, 20 Nov 2026 03:07:36 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:35 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:50 +0530
Subject: [PATCH v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-9-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1040;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ifRBUNcG4S75b7wOEESAYY95LUktSUoyNzDBhGxm1EA=;
 b=KzrRMDQ38ir/SxKkvx+iCgru1CcWgzgR7RMiwJB8A/IB8fNZyYJbRgu2266qsmg84BVFLa9od
 DKvONyqaL8uDPLBnrRXftBGgOY2FyIAJWqfqhcL2OUH4V1i97q6YVJG
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX0FZHMNQrfUR6
 SRIU1oIdGWPrNdC1wuKDKiVW7Jxua6K9zQ/YFdcBcpEvJHeIvbzjb4deDZWhZk1B8eSafK6rihy
 RpkHmOVlxTgs+uwe4kDXB61B36B4h4uZ2d3ieD2O70tXQJCAOwhXSp90UTe0veC0PnpUTw6OJo7
 D2EoTKWzaAd26SEOPJ1KXjPhye5//GqQbWWkHoojthUTGFSlNDlRvWfOv+FHaV9f4tsVTBch8Nz
 gT/vTIlH1hMl0bfYbVhv3XrtJC6VTQ8MFBEg//kAvSmi8RDgTy0m51N+6yBaXMcA/edNz+RzDlV
 QNJzXOZyeWb+NClY1iD8T6WNqz6iW18frh7nDf2kWZhx4W9reJgMaNsrA090+4OAKgU7xea+dW/
 jiwVMmGh++wrEg2NXDlPPDyRjs007gEHtZa6vGm6RDDGqurjo7OoKe9BnFnJLIyKzcYPG7TN29t
 T6JiAj7rA5/HbdYnEMA==
X-Proofpoint-GUID: tOonJ9a5ZdgOQuVlAjjJBmzO4KQAJZf4
X-Authority-Analysis: v=2.4 cv=DeiCOftW c=1 sm=1 tr=0 ts=6b0029f9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=tc1TWAvYerzeY2VvnAsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: tOonJ9a5ZdgOQuVlAjjJBmzO4KQAJZf4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX495bvy8RDphs
 B1Smgk1q50/Ulc3j8za2IMCHHAFttMeLjMYjZScHH+mGpW08C/mPTQgj7FgKGhcNK9VwhZ6KY3A
 fTkKzgTXEBxJS5YP/1ZGMAAGFN6OF+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 7b9966e8fd4d..4edcb06dbae8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2566,6 +2566,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1

