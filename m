Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172876;
	b=nzCjI6jSxhKKB8r/qZQy/EcnFeJDuz3jYvLllwK6U9GkDvHkJx+V/CFegmp5bPhlUj82
	 yBvDITlPD6vyLS+g2FyH8ne7FAk2hona9wLTGkZNG2DwnuEWblc5HDiWAn5UNd8204n3z
	 irCK4uyW8RRvd5tU4fHiKuHbmM/uHZ7fZJRFmDpMtfGKZuNyMBEo5RAd0qKe81DlTVPt+
	 tE0HuzcU+s7TwEg5UGLmgpbUP9dOTSLzro9V79SOo2fhbgXfV9nFreIcXX904fX0Zrvy2
	 R58ljPMS9LuDOlkLsawLpFhA8nKKAV5u8LS2Ns0Id9Y/V83INj4ZHuRF0uEmeHNnJ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
	b=kSPK9fnO+zeeCmDiDgs098l2z6ayPiqX/u6p2BjTZ5vHvK5twZuDb2gf+rdlY9UQr+P1
	 +q3RRvqJX4e8JXjkrbQWufo6bND5+MiegqBjVMmvttoWIEtEtSv5TjOq3/Rs7AqO71IKz
	 hVQ9lA18p3Gj87leRIEfYm7Bcckpot+OW0XVd8ilQaKuMkeXPB8uHfq4lrNYMdtgaHziJ
	 b9wdADGEDCKOYte76rtKxaFYdUZ2+AJpfFyeINHPxG/9pWqryolcd6KwE2cX0UdQft4zM
	 H2+T+GbZqhkYVmyltSlGI4HO5mH7K3L07/YZ8CGV+GNmF1Wc4MuDSG3Piz9BziyrI7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koskxqCn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyqRLmY2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D2D606D879
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D2D606D879
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=koskxqCn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XyqRLmY2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjxUq1060571
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=; b=koskxqCnq8MhVs/C
	CKwbThD06UaTkkfRTXXCUuz1i+bZzwHF0FcDd8BbxC/exytm6F6k0wa6AzLt3+HZ
	NY/SiCJ7yITHOeZg2qfJtHrfWWIxBHvSlvFtVTCDmANaO1RLAkLotiYHc+Ox8v8e
	av/Zer2K1JHA+rrda/7zA/CcxMUIs7MfkJlgQar3IyarKxWueOMIROmjooMqjM0x
	bfLWuQLR/K0SR7itT8qW/XgKVL2zr8uqRJ6lNL365dpr2Mj6F188YXVfwFnN0La/
	a8uBfhYvu8BtYMnvk/1S8meK7CzASWp7L7lc2dp0g7o0Fu4hFChq/51TMErRxWr/
	8oOB9Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fykbaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:07:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso848324eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172873; x=1795777673; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=XyqRLmY2732/cZaqegBmfRtwXrAIQz8lRdnRDKsb0sVYSqSCuPwcvxxYRSlgTHfLDj
         Dq43tEPsX8cg08M45CrtWq2jbgZFfIDFb21iXHSDcSXE+xyQXOH+o2/xmyXJtEGlP4sk
         Ji08ZCIiRfDKpgsCnw+W+fX2qRvgk+BCpjLZUmE9xgTwmbe891+VMdqDAyeivyl+0Apb
         buY612HEfbgFqQCJVk4KMPZ6zEdVTL8GvYx/+gmdtQsJ/9kslYkohU34bFgkTX6+C7Cf
         3lravH3SAhMRCrzaxWxE4YVfQctgr2vb6qAiWb1A2w11qhgklTluByD0n3KuXkasu8jk
         APEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172873; x=1795777673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsgAVR1Jug2GNmU8u/c7byKbreoEO8JhUT+pe3+6U4o=;
        b=gH9/J8q8ZFrkK23qRWv/zDZ141AtWFnUFM58pPfpRbZVhTGHMXdQepS8Y1mVYpDGsO
         MSwsn0VGxJdzwjVrZ0nlcdVMiBIgIkbPrwF8jIC1VuktHGJoIy1NSDgnmVSU/cADByBg
         kb+09H91letYF9V1h1HiV/lmgk0YKIEl22MZNPiMIJ/p/sWLdX+VN9lOxPoiV4ov7AUT
         V65EfIr2Q9UOSQIP+Fc6q04Nw+zvVJFNVVy6aAqw6+orlO17rc2Ei7srCHMHvAibnXir
         cFvhdYAmTuwPtjynlgkpsY8ly4ncYV7fTfV+AOWCrH5mNOQZz5dCk794NIsR5r3qUe2U
         TjEA==
X-Forwarded-Encrypted: i=1; AL+hErEvQ28wZmLmOBClvoHemEGV9vIS2k8yJoEAjrOSXzloI/dFlJMtJ8ZbJCD7XdoGO5w9bIfeyRUOsqf4T2kI@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ep4cVoliY3TQj2Va0Jlw0GyTCJJ/v7cE8vCHtJ2y0yfpXo6UK
	C8BsOiPPsiEuzUdZzSM5Z5JMG+Lhd3WYbDVsJWA3VUg8CGwG8PbBB6wqWQpN3hZ4rdo/GTYxT00
	DmopwCnGwI1Gkv7ZTw33yNrir/QsPQA+4uY/qyTLVR9JkmenrRXIdpRGAVE85r3rhopcU
X-Gm-Gg: AZFdTZf+QDOy3dJZk+Pzp5Oapl1qXF2HU6TUGxCy04wx5elspx7bFHkSr7ZMbEyYB+L
	ppSZpXhOilK20GgSdzI7pKod+hsiHFGbcPpJyWfWIybs2Fk2/HqpbF5M/xDSvpUDDyaObFGZ6Mr
	XN0+PC3womkpeSeur571cdVnfhn6qcisAptQgOzQOoLi1FW7VBi+eabMRFusd957qVVWKKcaV40
	3Z74MeK6RGvxCLk2PachnobQ1exyYxOjlPO5ayQSCoPAYqd2YcQ8SBtyKTtFz98PMVtoYUWSMcQ
	06fptmA7zt36xMcQlcedUuLMUQYuOlWq2yxp7h0wVo+flyBPdVcbAv8rJ46my7n+aetz17OUmcY
	7UR1yN02msK7rTl/ScfKmvpir4C9oI1K1M5CrjxwPGdask2Lhcg70G5xT4z+Xx+fLhDKuafj3aZ
	2xzjxi
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2801667eec.14.1795172872596;
        Fri, 20 Nov 2026 03:07:52 -0800 (PST)
X-Received: by 2002:a05:7301:391c:b0:384:df31:69fd with SMTP id 5a478bee46e88-3856fb6a672mr2801610eec.14.1795172871888;
        Fri, 20 Nov 2026 03:07:51 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:07:51 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:53 +0530
Subject: [PATCH v4 12/20] arm64: dts: qcom: sm8450: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-12-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1046;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=XGSCDo+PAJtTWrK9Yli/KgTXld6tpUWo0Tp3e8IW/LM=;
 b=9gz/rvKKgvNjj6uwIais3rFdCGo4IChAppqwi1Llk7+aKXWKIB4Wq+mZFHmQafF1TTafELH8Y
 idSDNiNfrnNDmSgmeMAPynBcUSsHZD0PwkqIfI31IXZryVAff+gET7+
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXzpZa/TFB02on
 C1yweRfPdQtpFoXwLbG3T0Ux+vbRfynKcAqwV1vjMGRUZruE/tRxZ+0iuUjyM1YmRicLCpeFBzU
 bLuc8vdlMX7TXZI6aab8QhJUOY0WI98=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXzymRcdqUii5y
 y9NB/+yRsLYcwwPObmbn1GwKZrLX2q4Oz92osCY6Vu2iejmALNC8m3QL+e8M/3ndpPjJS8x2WFD
 368250I/JZModJFbV579flOeU0TTGz5TMyEwVJ6cNvL0TzgUodJfp3gV0oikQW3QO8R4hpEiKYd
 +hi5g5FK1h0NEDcpiS/SdI0xvYFeCdGSGHr01b4io13itgXOzFNmxLj3K4c5xYDtbZQ6eIaLA7q
 7lyhM0T8y2nqdAN8We7aeGpct0ZbioF+/iWbrdCb82qX0AiLd0DKZd1cyvBFD1K+r5p2UGxMVh3
 rfRWNG5XVVY30+Xs1Ru6/KDxQ4+IwBNRJs4cNC8KOJw6Fmt/FWRtQyk8Bgp7ZpIoPTx+5JaFeJJ
 W0G/TWCzeKI8whK/cJi9UZhQO0sF6F9xDqGCcEUS4T5gLPbUKOsJk69Yimfylj82xdNr8CFMyfj
 se/3Qk2ewE0acuqHw4g==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b002a09 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fzENmhSgVi5qTvzIpAsA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: acafQiDrD4fxbbxciQtZ34AtGbgFlnKl
X-Proofpoint-GUID: acafQiDrD4fxbbxciQtZ34AtGbgFlnKl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SM8450 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 8f84668169fd..f7dab346cc70 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2619,6 +2619,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

