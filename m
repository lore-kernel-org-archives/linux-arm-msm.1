Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172906;
	b=nWWbKx2kc+PgHg6rHkrw32O/K8XNuf/48uM4LPH4N/fZoTn6Y2ACQXcyWW3Xjneb+xzR
	 mtV+dP3IVDchn3HMKexlWUrLs+vYgEP9eecL8LGx0VF4xa3iHo+LCWeYqVKULkEpFcr8T
	 cli+oG9fOM/RkLFFO42UKWY49W0seTRBUCFO92JvkYL6kK9eNM1tX6cbyFRmiL2hOwuDK
	 ETsvFh95GQ3AagVS32uLPy3YMHsIPoo3w8jHl4LaIha3v37kDCoKUErh2V5ghcZEYWhjg
	 HXX+a2lV4RTGfRg/JM8Ar0uAt5xXXeqbjNNCbyl7ZbwBKYxUZL9zYdUWL3Fnrh8IS6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172906;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
	b=gw4Idsl8dNY1asYaBP/TIQARDNLw/LpwCb5LlPaDfUvmQrRpE6gwp5TglA+o83Fh2gJY
	 h6qunrTk3g6SH7DQJdkBp7F5scG7Zkt3Yf629qGerbIG75m8lepe8PhGJvp7s2teCqMYK
	 szZE8I/cUg+edwC5k8mFsBllfRFloAEnWM6z6i+4f7GQnm+xECNbAwOeasYMY4AkpfuhB
	 h5BW8t+udJc8cHG5/Au576wBTI+dtizE8Yy6D+J7W+4WEOcqPg9TJqtqneY6yiEmL4Vak
	 zv9ifeHaW365xg1JaS8+l45rkcLX7RiUz/t5Vd2YWB+kIgB4yiIM+2JP6s/iTJ8qOJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFgqblB1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCeFH0R8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319CA60A6F46
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 319CA60A6F46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFgqblB1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aCeFH0R8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoST1462867
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=; b=kFgqblB1KyOqBzjl
	SI8BRPIVJCHt/dZOvNY/RF9Var1F1JFJYPJwoH5d/m3NEMAs7RoNmUPSAKp0G9Ct
	nwveGZltxWkQSbrPADXZgyrtI26A5FofYrfhOWmexCgsziC7nmQlvlzOQiVn/aly
	BGaa+hQeQ1Ir9dYdKfXJMJ67wRO/lfYjaddOKVUW39B2Mm48ybfT4ZJLT4bJ7/ad
	xbgENLiwFp59D0b2uIPRf5qotAdPhwzfGEGtQshjtO6iof7pfVR4TyGWnglOImsT
	qwITw4fRx1y6399xeihkKRCDamzcClB1DBo4LaOPrKuBga2gfWkZVvNAuAjfVp+Z
	mRmZ4w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guah5w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38131260a5dso1973140eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172904; x=1795777704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=aCeFH0R8Fj/QVtvCuZmc3QYz5D8+NsM33oOlYtUxxoeulhzzN7/fIxRWwEEcWMr4lP
         ioYQKhYjrSYblZWLGIgKGhPsfLjmRleHTqffSv9OJERuSWuojdDnxx8/ZW49wHhb61XK
         s1Sw/PVW4hoH5sg17vLw596nBamh2R0XWTx3imdmF/GIs2tXSutnabG65xy+6/wyYqnD
         4a4XZnm1d92T2bQ6qB+QjtsTofL3Y2DY1Vr8YyTL86rZBm/S0zqeJ43hWb1Hc/P+fcF/
         vl/tC9wBkQhaJ1LeMjnyhf1FYCczJ1VC1VOUfm7/hc1LXKzkPausFrlLeoM5E/Sz1y2V
         lg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172904; x=1795777704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWLejDBY6cxKAWalyM4UrAn1z5uDI+O1UHK3W8xEzBI=;
        b=V6PE3515/yp0i1EO5rkkFmas42wtzP2dYiAr26AE1m0e34O3E59WNuJYYwG8V9Elgv
         H5ZmdiBg9W+9i6XMZM94BeQ0FfOccy6MM/Qff3TZiB1un0Lo4rEqWzs9/WyE3z5RGRSu
         bj3oJbDZ68OBq6xhBINgx0loSF/tyJOByyGBtM2WpEa8a1hq7Ylp/XvCeP8hyMRSdKyc
         d7GQGXSLd2gcvoeQFoNJNRiDCamvT1tS+f8JsCjwcFj2GSYDuAafrYVf6Xxjy1inPRGA
         27j/gF43OLkbWMH3LwEl7jBDh4TubaY09LK2iYinfgvDdpJfONDOg0he2vE+km9fTDrG
         1Xqw==
X-Forwarded-Encrypted: i=1; AL+hErHY9tmp2W9LotrsadSi/hB9vDmbrG4pFQhpTwl1a0Xv4Ai0fLNWvezFBWy/QR4zWa8CcQcHRGHMIskI0Dg3@vger.kernel.org
X-Gm-Message-State: APuU4Z9wAfIKUi0O6ZMKeSxGCVMJqc048m8f+jrErmnCwFwr99MiSMEF
	CaLR2UN4O8LL7OxfiKEXH8IKUiBvUD4JfDD42JeRvRzmblHgoWAHgl4B8Qh7aBUWKK18i8AxY0e
	GfZqocCi5QKxt+ZvCuvtQaNCTBxUkv2yHVDeVaWzPUIT4LSJA5ceeWo9HBH2AQVfJz3vu
X-Gm-Gg: AZFdTZeA7lXmnkZFTN1wEwILeTAVpGoyBspXPlhnQexDCiQnFDBY5BkQ6bqdlsXSFzV
	O4HCElQi4yU83J3wVUBfghdFoh+Ph3FbJ2WIJ42EzsqCYHCYlOvep40ypunaoBN7ZtmYxfbIFmR
	GJViWTKh61/NCaUfo+K23FWBk5B/eQVgNMswjQ3NjT6UyIqfrXWTGt3GjIZKhremd53+BC8CZTX
	jGoFUHtr7D27ckA8hcTrT71EfCEC9m4rFCg8w3mATNdsNZl0742jdO4ye3Zbyu2Ryv9eZcFa3E4
	NHM3v5yiK8qJ3CFB8pOiqGTPaiOwzAd0/TSQ3ECR3104ClIL2k6Ch7kFZwjTEuf5nptI1iLamG+
	VhaojVtVggbBUL+QHW08p9Wd2DmUcHPUkIyI+tj3axMOQYB9PTLMfjXlvdk56+6sP6nST5SXnrb
	im1rVp
X-Received: by 2002:a05:7301:619b:20b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3856f45057dmr2756084eec.22.1795172903779;
        Fri, 20 Nov 2026 03:08:23 -0800 (PST)
X-Received: by 2002:a05:7301:619b:20b0:36a:1d6f:917c with SMTP id 5a478bee46e88-3856f45057dmr2756040eec.22.1795172903140;
        Fri, 20 Nov 2026 03:08:23 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:22 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:35:59 +0530
Subject: [PATCH v4 18/20] arm64: dts: qcom: milos: Add GEM_NOC interconnect
 for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-18-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1035;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=uW8nrRF4SJLtr5/e82lnBVVXICez3ZPhzw4syEcDxKA=;
 b=UVzRHXN0oJO9hdlh7U4rxJrqxQy1l3cZ5Rlb2hk0YTnyggdfF/MY0VgoShryhbLhtW6NCInlJ
 H0MBMdEyI19B4ktai3TXrSA7fgr24uRXz7FNw2lNnZDAoaeKB6/8rsU
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXw16YaBC5pOYp
 RmRyrbbrhX+e+JR4gXlFyg6GeMLFBUL+MC2qmKHH7c4Y/n16+F7aSKj2w/ZFTXPt5BVF/td9ksn
 fXIwtvqzK4EtnPFX0vqT7F71CaCKA1DIv56V6VQE2hjNfiAzYvyMeNd0J5GeIofqEofdkExzwZn
 8zEifMq/hEIsVzDTMW+yol1Nr56aeaYqZ9p51AUEGdtuILcz2vgLLmmK9Bu+gnLYpSiXx3e6fYT
 BZUiB8PXCl5+nmbJtw+kkNfWjC3UhlRIJQRbgFRZ+HcXeXZzo5+OWXjXxW63V0p4upK1dx9ozgn
 nTOwwDM/OD+UA1EfLm6+tC4Anh04bHIZdEBQwdSdbFRSF76MrBxvSafbMs2NYbAZxUu0yLzFkoe
 4n79CXd/mBFAsCk3CIrSV1k48YtwaGVhestmgSJOpydsuel4w+t1SORh6NEDEya7rP6OTSiZjMZ
 tfY47Y9MyLAeyYUPabQ==
X-Proofpoint-ORIG-GUID: Fr9W6Ce_fUmB8Yg9MdN-Z-FDqJCV7UPs
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b002a28 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=iSr-qRAn3DWi8jR0IaQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: Fr9W6Ce_fUmB8Yg9MdN-Z-FDqJCV7UPs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyhDaimtnS49S
 5Zv/3oXxLrXuLBce/W7uXlJFDz5XR9J2OMW1Mb1XgptnY4x7t8TC7mrs5G5wrgLLRw1WOss+/qK
 b4GEiVPlw0m1iD1RFsR9vBrkMMaityA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Milos the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 9cae93b6a610..49ea0a8759f3 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1988,6 +1988,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

