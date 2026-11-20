Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182186;
	b=RgEqoc/kuyngk2NnwW7kn5JTaQM2tQNBzjKD9vW5W7iwu+Xkn6tfxk+11XacSDmjZp3t
	 Z53nr1Ig/H7TBATpSqGMnTp2Qj5GxYD1A8iz/FMKomx1jxcsQbA5ZIy785lKufKnFEGeR
	 1M0tIgjLXJyrCzKHzWQfZq7ecAoPNPkJkuezhgUt/HxvWT3V6mH7Do/jl8PR7F7f5BkK1
	 rI1zK24ZEvTN4nRYG7I7T4haOqInI21/1TKJPwVNni6CDMm1D9yGRvmbZHtR6O7a8spXa
	 NSj/8BiNK35RnFc9vWeTBh4gkkyiuY8uoNZKvLXY0OeC216AieGBemR7HW7QssGiyHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
	b=rjh38wQKU95C+A8AaORqGnURpd9TAXZt261rwGwVp+bSKlYajYFt+n/W1JU7pj+AQpbA
	 gwe/C+7uIkwXjOqn8ki1oo6N6shJayF3mclt7v+7ILQeOB0LqOQM9RYxMQkcaVHPHkHuq
	 2IEP04Dp57gfQ5B1R6b+hKVlFINPXVoWu/Ats18FXfNkqQAnJi5ZJNHw189gATj7g9PTN
	 BrOTuPc60Iv6Iwri30LMnDD62Z96b43gY8wUbNY8/+7EDXD0DrrtRB50zB9AYOPxfc3qb
	 SRmyWsD5fyxJeVwSWXG1aRPjUnRSrC5Qwezs8fUm2ZBUG0gznwG/EoUj69UVPjdKdpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghWQDbGm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2ueehAa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB4460A2624
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BB4460A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghWQDbGm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2ueehAa
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjqXc1681897
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=; b=ghWQDbGm/RfEzbMb
	9mYr4PyVHHfjH6865baF+WOueDP8HHspGjuacGVEWATd5rru1puooKpX3QbLS1Py
	BzdFjH6XXUE6YeF/yXJvjP9ibnmLX9MRyNf9ZfJxLcDsIHHvcg4x5Xff26tzCgER
	N26d06GwT7Hav+H1/g/t2ycw/cPuBOb0nAtK0fMtOA9skk6tOzs2jj3sMBrAHrnM
	zaZvoKKqWHkZ2G636TI8Tah5pZxfpfLMhDa0VheZF/naDI7mwNEoqNk8u+3s9oE+
	7e4z25Sem+AJnOtVy6oUYbWgI5QIv9qb+ZWE7wBMf30ZQxPNi/axKKqEXu2s7XQc
	IJu0uw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tq9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383165e9b0fso1015097eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182184; x=1795786984; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=N2ueehAaT/hJZu7Ga7iCO6z+N0Xyjj4JZ+Ohz5QI6V0mU+jxie7rkmo7ywsbbVXVjb
         t4LtdbDLLZmHSK4kQP+v4U3vxd2H/xF9dI5r01lLij0+Vs06bZESAuAf2vdY9sZltybF
         2ZiL7yZMp3ANbk24t+tLiBgoixMeudvbvOz97Lizai4RwclQRUy6YfEwwdKoETLo8KDM
         yT0ZcrOVHsAqNDvyeqWHVADZK8ElA14Wb3+yTlLNj+eHveaFU/h+MsoZCIi1qkdw9fKE
         UjIsEhVauWrAZnvEYyEXj6f25R5IDulULsglwifdjooR06/KpTlEZjo9vDBXXjB4ekkq
         qtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182184; x=1795786984;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AVidbSNiizNkNTzgOXhRluYV4j9L9EQKnRCU13pMpyM=;
        b=aIW19xHdsSHjTZxUcnVLY8C9E4oAykrXmWXk09GkJFgw/yeoBj26M/68ioad5zsKSx
         ovcuSc7IT613ZRYL5VnpI6Lpv19oOK9c5cJRLeVUdcq93qT1X24kZFSORV7ygryAhDnc
         vy7SwLkM9ocfYowbeTNdRvU96VWZymCYZyepm3SoFo8IFU71zJXTC3zcIFHazm/htPFX
         d+zEzA2kRm1+asCAil0ZfypnWM1Th9JxM6ZBZjBNG1v/odEL6QTCNnXgUHwDCR3eMXm8
         INfc/17QCNi6SsCQ/W9zeaR5iBA6j1LTCf690z71xAjJXibKnTjNTaGoZz8hCixxXP3L
         Y6Qw==
X-Forwarded-Encrypted: i=1; AL+hErF6P9waSw5+0O13EHwDSuuRp6DmOkTrRXGPnEROSNm8wWdx9BMO0AA16OwH8PXxEbD5nxJqO5H4AjSDosbp@vger.kernel.org
X-Gm-Message-State: APuU4Z93EtL30ulvS2BIAA2v+3k4Mi++u09WgkfMZ5X0Pt/OE98+26ED
	Ur/snCqX8iJCLM68dMdYFxposPDqsana6jW/QyxbybwbudCY/JYkBWwQ5KZw0BoC21h2t3hR+tr
	hgdlDTAw833dij+hJC+ZLoO0YrdHzvNAoJ3D63bIBvuQXdpadj1kPcxVeQqa18u6b3WB8Ws6Oy6
	iG
X-Gm-Gg: AZFdTZd883zfXSeunqbTeRDy2hyeA+su41ZdNveQ5r24PZt/138Dl2qh6x7u1Pz6Y9J
	u4iBTLkeSHVWnYZzeNzweZXbeI++DHnCI20jRoUGUqQjdPXlbX+ymOCfhRecOBif+hI9+xysamX
	uPZ24179m7XEMUoaSGlEVD++rV+pYpu5SHr5h0hKfDU/y0kpf/cGzMevT8vlEirqOu7y74whAry
	PCPDN9Ee1HxNLjf0tvIicEKGBUafXj658KGxHBEEqB0/ZG8ZTM41/bVyom93dF970fkb6h1XwPc
	xUP2k66ETpRuyPdfHH1RUhF2bSeZqX/1XOyvpxKtgbEEK5dxqrpgyZoSjTkJd1XdxC6qLCHEx6d
	NJyMJPYqpnQFhD8YznPf6gBfc3zRkEnp7PCUZluamMR1CEi22Epcex2D8CkxkhodpLfdAl31TvI
	aA1dk=
X-Received: by 2002:a05:7301:182c:b0:376:e950:873e with SMTP id 5a478bee46e88-3856f659994mr3192404eec.12.1795182183433;
        Fri, 20 Nov 2026 05:43:03 -0800 (PST)
X-Received: by 2002:a05:7301:182c:b0:376:e950:873e with SMTP id 5a478bee46e88-3856f659994mr3192369eec.12.1795182182790;
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:02 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:38 +0530
Subject: [PATCH RESEND v4 07/20] arm64: dts: qcom: sm8150: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-7-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1053;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=9j6IWx76cjPCAQZYybv4iXqHVebU//kZAlxNICMxwEI=;
 b=Q5lXe6lJujeOj00C7B5u5JWgPIuSH3J9emwvnAUTAiwf7hbY2q8uNHI/0TWnEjU25aY5pCK8+
 qR0GG8stZHICFvs4wha1pqrJMlaprkX+Iyva1ZcsqdjrOm4ImQnvkfF
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004e68 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=2mEde68aHbpXMYUSS8oA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: vMsdoSfpPSnqiZjJsq_7RF7kuIxpi08V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXzZZTN8Qs6RBH
 xuGWeA2TJxG23WiNC21RH0t8f3o0uuIcGM3SYeXyuNcnLSHafvOlq9SZM2MRcQsrTbBw/eGQiTD
 18PShawM1QocHrz/KOk/5s90p3jF1lOqsPA73zt80tSbUZ46gqjTk5Kz9qBbxLxvLJ1g0GXvTmU
 6IEy/pgDeemLF1R4YxG3w2taVCcATiM20Giqi79JqEpFAhlTsvizdQpp9qhkIyXkMKYxdyQuM01
 zJU4btesDEilVSvCw2dHqYZ3dC6JqqRR8oOlXxBV0mg4Pb+rMFkTlAa/0TG54Dgo2Hi6rJ7jVj/
 xMp94yv3FlwWS+S3gkqahB5mDWcAx+Xrjj3mRhLbkd4yHU1PwJZLv0j3orJK3BgUOB7nzeOlCSG
 LWqt2UQAwe3bRPG5YtHFfCmHcwX8AYUw5yzJVRu85fM/ew0/xz42LCO//y5OVWGEs3tRDwUphMZ
 GOyTUenRy0bry1njvQQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX1+KZSdrga/YU
 BIIe7O0GXX8JlLk5b5DN7dtyh59MsutJERpt4L/5V0tD1//zPYqCUN3e/fUWHyzm+ezWvumtB0p
 hVoheeION3gTwWYEsda4yaXZlSEsodo=
X-Proofpoint-ORIG-GUID: vMsdoSfpPSnqiZjJsq_7RF7kuIxpi08V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8150 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index b9846b424a93..4b2ff316db72 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -2396,6 +2396,8 @@ adreno_smmu: iommu@2ca0000 {
 			clock-names = "ahb", "bus", "iface";
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		tlmm: pinctrl@3100000 {

-- 
2.34.1

