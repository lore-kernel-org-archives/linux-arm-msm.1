Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182207;
	b=MMn5mnGD1UvO8lmp3VJJj2IPwCQayidvwgJc5z1ZEzTYJ2W7ChUu8zR7QDrAC5AaE0av
	 DoovOLRsyFtCe2k8CSnApHdJCAXeYaDHNFtyzf7yh6M8p63yQlfy4qsPiAZid23bO3AGl
	 5wma+nzgAS/PCtkNoZrh4EG2GABclYBJSG1QWHW71p5zfLSMV6wHb070vdsHF6cc3/ov0
	 iTyMjPQ4s1vkq3t20jRZwVYNMae2z8DaRsj3Y7tqKDiZ6/YYXJ9MR7aQfMA/hHqtjBxHD
	 czYEz6KT06CrZ2ez39I69WPH11wz5WBsABmB8sGssWNF1U3b6EhjX70MIQC0XpAcpEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=;
	b=d1BhfLFvCla/8TztPNxTv8epWfoYe6CgvBSzIBFzH/p/icNdGRw8nicDUco58V7Pt1X9
	 YqiAop1XQo+enbGCegtJIVIj2ZXn0RYkGr+FiWOGPu/PzLvOFMOaP/IhWxVZqKJVE9gS4
	 whwlqjypYeX7E9jtBsa3JQFAjgIteaYskzmfki8ONu3bOSdMqZp7d3qORe0Dg3oNmcwgK
	 gmntiugSx6OSY6eZJgVTyA/Y8OpRdUXj3qvWDSkmvkt0VJBIoBTOaNgLyC+7KZNYDcNta
	 7tq8LJUVZLjLDsOmEtQIwi31QSd/B7CPD5nBLxtKHKqh4n5OVzJSKU2cyLNYox9IjUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HhRk0EOS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+nOMIHP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861B6606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 861B6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HhRk0EOS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P+nOMIHP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk1iU2433127
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=; b=HhRk0EOSDMm6nvZ3
	BAGnmzSLIm528Q5Si1IhHj3Tzlzrp+JyHZoLm2JmVEjVYgGMtQ4KjuDIIoaZ6xZh
	qOTJ504wX/EzA6aFbHNQvvUXGH51sDUuVgyLOrNVtUS4hyWd/C3F2nof8FkoVa7V
	LP+zkjQAXP6XnfeztLRHG8RAf8MaB6HMzEud2eSlUEl/epm5ssRgU8sGfR9u37/H
	98C94Gaa3ngMRSZBDCedHTdMIkWlbLJz3WhoVE2mj/PEyRdnQ2vuthmurKJjCJiu
	eIxymer2Qr+UZ398MC8juFurjyKcoWC0Ose6iOP/fkR02mNbNWnLKeOhsD2/cMqZ
	g1naWw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjja1pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso1015246eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182205; x=1795787005; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=;
        b=P+nOMIHPbNLizV2Gs8u6lfw1YiIrtcAYbWFfAQIfUPl2LVz5XW1jmP3MvO/rWUs4AE
         GzZDkA9ERkAg4e1cTT8f50a0NkXabEByYd466hKJ/To1pZ9XBmVoKd4PDxkZ4SSSeS8d
         HUEtdpQBStU3Hz8Ckpgl65LjN4SD9UfzUWkGvWLxN6Muw2E+fAW0gNeo6R0Sq6dUtstc
         Gy39KVSKS1DM74jeQxqLc77czGAsrNNxIZsCM8krLSCJAEsIuQCISI5wPWGoim+Uzivg
         ZPAccluAgatgouwQFBWMdXhvXHvDkwxVt4rQPSI+Ujf18r4wBArHg+9xtaFCvEx9GVnn
         e8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182205; x=1795787005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=11q+vRagsURgN003dOUkw2FqOxmyzwDRHyxoyWI810Q=;
        b=I3sivauXulDnJtPgAE///ueEc5vPA5rTmFEH+cMUVz3VjPHl9ycKF4rbLhZSBqCQ5c
         lIpiDIa35DMDsyRMSkc+YWlKLCJ7IyHQjIQGpYgKxA2V4H/dcGHIWTlXZPkGfaX3A+QR
         9HvCSteWRBd8XMGNgXYr9nkJPxXLFujStonIfhX9inAzqNB2Si0QmlxvC2eJc/RKkn4t
         4A9iHeul/CvNy+yGPe6Xi0la3cNJfbaTnjvTIEvSnDZgC3O6IqIEr/CCZUlgLDpqOIpI
         dEDApZ0wFpOXf/RQQ7HNTgKCQX2cZMe2uxpD6KWzcbgkjPeNxZAPjpwmGGI/KeF91V3y
         60/w==
X-Forwarded-Encrypted: i=1; AL+hErFD61X6PkgCE3XjLD0t00t3vQG+6mc/f9Q44KOH8CsJvVOmZl72Mo8ewnSMcN2pLQv0QVgIAF1SAZx5e0kE@vger.kernel.org
X-Gm-Message-State: APuU4Z/YIIcnzuVa7ip7+CH7UhwpRdRFQQ3fin6PWpyKqFjGTVwAoW5m
	FYZdZ+ft3So6HvV3+4RQTchWdB5j0BIrozSQg2kQIDIIUpFsD1c16J27Wi1LYkdUODLyuEmgB10
	UvRTC+EsZ/D+AM37TPZd3wsU75vEmZBV3HpcChTF5l6+c8ece8RcUmXvzBLy+k5IVlfqKURdJM4
	OZ
X-Gm-Gg: AZFdTZdiAeq8gwQCVsxVZAQBprqIMcwTn5abPaFp0u1dfUxnEOxGdyFML/gCSGL964W
	9p2qzicpMl3q9ERwGzeH7461ZFDqy4qul5p75OJx6Uv4hyizPi7kAsOHuHPoxMlFWt5S0CEIf2V
	VIqpIgK1OYg1g6uaFkkDF5dRGxGXi/FSZoRZjrzy9RGbHHLmB90xFnj5d1IX9Z94GfMk7aQq23o
	5naZDlkEtIySIb8x+HTMjNPyRx/4Ag4LaQEdRYlB4mhtnZMKxoX1csocd5l+yuieoXI12bwwtXG
	ntmlW77SlaruGQdHSlQmYQCY03+moSRCJ6vv6+tycfquIinr7Ro+nHKYHDV3GSppaBssN7puEJ2
	HB04f+4Es4gPtZ2EBfUj4VXyxCTf0p79aJzi5DvyFuj2sYQpMvU/69WgODQ2VzYP+JG6O6dcAea
	0cK7k=
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr2084208eec.37.1795182204923;
        Fri, 20 Nov 2026 05:43:24 -0800 (PST)
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr2084180eec.37.1795182204261;
        Fri, 20 Nov 2026 05:43:24 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:23 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:42 +0530
Subject: [PATCH RESEND v4 11/20] arm64: dts: qcom: sc8280xp: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-11-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=PpMW0q5rEXx+xuC5PzlM9sk9j9irWo68n5zPzl2ij1E=;
 b=Pkjaoy76t19TmVXyKiraf1je5qnYdJSqZ9wPp1wouYn2rcPq2jp+UCvggSvaMM9z1JceutZzn
 GG8Y7hYOgMVCfLpH6IlRbXGGvBGWghMLIBz9aEHYzIxRKnjldYDoHOB
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b004e7d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gJkqCKp5Tu2al1pXNpwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX2qNwoLatI70T
 Jg8OEX1D1rHD5aeKHwsvYllbFTm3lllP5kFKoHsQZ91Ppz8/oJUhHrKJT0ZK+kcWfFmutM+EE/V
 REHn5OgtldZAJDu2Px41TxCLQUEYN9s=
X-Proofpoint-ORIG-GUID: vJx0b-RobyBlsiCzeUQrkPcLs8zGiwjr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX6lgggZlcLgMA
 FppTje5LW4/z47nic+789LSmMJZx7gMTZycNTijyaDH64fH0VvIzy/RmqpS+hlRfxjj6P96rT3X
 aXjgCQXpOpiOfxGWjz9SN8hFCS41ueCIq2JK8jHsQBsUqHR072tzKWMv668QS+1tIt9syNP84PL
 03En1kwaYfg4hKkiYw8Iv8APUel358946ide55lX60NL/rK8KDbs/29QU6sOErhuA+KyFV9Je+x
 4EHkr+YhFoDUE0QxDpix3Kx7dchxWv/9sJcGddqGUZjEh8ifUBeSZMt3Ay3dj/whKmSfcs7P0Di
 9kjL3mjLS5yl36vDDMvkTStWw45JGZEBtME3G5YrNv+uX5iO02zxmcQnV/3drqOnywX6llrTfL6
 trq7WUW0wtlMoqxc/EUl8rbPHB2wZToBH2iQtkSpSEsf9pRag759cHW6N69GjxqvfshwvQAGDyw
 w9sFsnN+9xzk2nQUr4g==
X-Proofpoint-GUID: vJx0b-RobyBlsiCzeUQrkPcLs8zGiwjr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200054

On SC8280xp the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 703b4f4e2059..74c53e70f0ba 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3564,6 +3564,8 @@ gpu_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		sdc2: mmc@8804000 {

-- 
2.34.1

