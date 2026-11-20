Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172911;
	b=3lgObmqOUqc5QkadwN4KTZ6JkZpVkUDDm51YgSVvMHRu+JkY8jKbIBVLkV15rWnAh+dP
	 stUXNuIzc3nqMrIG9eyuq1FnlTxpnwCu+LDcoQ92LUbUcAEnDHY/vYaOGaXY7XPNdARB2
	 tQyFtuwmMVhidRsK8w95gRh4FcelxpIi8MnULE4K77GnTlkr76t30dEEtIangp2KVbolc
	 xrfhxrrwT+m+hNNSi30YD5JfxcHE0SAUe9bxyVI/rfVk6LlhT7sP5n0RJIN69qP6SOLjN
	 z5LpGeqlpOrUknLpsmaTuVcL0ednWINb5nUGsqR6W5HYJf+kEF02pqlWbxRFecdg7aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172911;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
	b=iMplp38qdeuNW8FjQSyNcR7E3q8er7HUJ0urdrLDbuJvfUFI2fTp/t/kB3sRes8t1u1E
	 NE3xCpkXy+0+7dZ+/txAGtIqZEj7LZ7BiFrhUHhjk/N2iIJ7ZcqVri+ooQY+taEJtswfw
	 i7EAo/vEnEJ7aqI5VqqO8I0JEBvTElklh70b+Nzp7nkZlanFhvbnM7xYcLs/Rzy/Te71l
	 iGHWgotVNvaMJMn3mFBlGGBPj8i5Iza/qPradGlJjbWk+E0lrLjIQg9XBQPMdlGv9ZecO
	 dqiL80+SdI4ij51Q8Wf3Ea85DYmCjZcdWcPwbr4UsALVhPxMc+9B2usnqA1bwZ+DAnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpGetJGQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AG6N7N2e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C6606AA09
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF8C6606AA09
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PpGetJGQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AG6N7N2e
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk26A2433183
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=; b=PpGetJGQ7pBoK2Dv
	V2W5Gw0cdxOoP1ZJ4IwxWGSC1dqg5+8NDZ2ba8egXMhLsthVoHZFC9RfMXQiuAF5
	gBR4XyAeyHp+ueZgRRzVj4kFHvK1/O77TW9MAiEq9fiOdF/LEdXyudnNQRpedwUu
	tsgyvP6Tn+vHlA3uH7pwnizO5Kfmlr36hZNohqvK7iMgaC6u8DPKNNjNvsoag+AV
	Z9aFk2pYt7bue2Wm3eRtj12Z8z+9DDCGSzr2CnkJ+U0UROzb3VMeu1cUFK9HoF6T
	4NHBraoGBIaWon0bwvQpjiAb1if90/U36LzxRg+VAGGjn2InlLHzM2Sky8Jqz5Zh
	avi0Qg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjj9f4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:30 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso2463427eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172910; x=1795777710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=AG6N7N2eNbu3D9wq9BgGDgmY/1tHmMeNvNfcBNWK+tB0Gnd0u+XiPkRB698OJ0EuD6
         NY1QIigSBaptm+Ms0xIcv61wVElwix0MuCOKZYmQNB/HNmW4wsgXqTyz1UsyLNt3glFO
         phI0mBxYgfPlP/r81hk7r9nnlDg4j1okjxdPpcEaToZMkMz07rvSziOPrYpdcjM/6d8T
         7WblWcdL5NWNQ3Sf+8W3CrglQVGwN7933XZOD+c9bDv3OxXHn+01IPD2+ovB/xMpT//6
         GjgmPcjLrwGwG896zaR1kS/00aIxFC+d5NKa8jRgG8Dpje4gYgSQTpXtp8Uy2ATFNm1D
         31+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172910; x=1795777710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aASYEpmDyUR0PcwON2bZC/zaz3rpAzma7SBkhcBHJVQ=;
        b=G/pXcuf2OzSmm/OK8YhyvFZy8xeKg6PRUdizHTaY5aMGf4csQMWGscUELysd6SegVc
         e2g4Xwg+LBPYvoinjBGoVGKUFW6lXQGFBoxsShb3sGl6fGk7hawtS+W58vMpT0SvduaV
         u4yYeOGRsAYlcrkdJUPZiVWmyLACG10p/mNAakMV/pJT+ZZha5WcM3F7Wv7k+L2djwrO
         VukAoCLW1cNFuR6XIeqH/PwvzqX0qgLynRadxzTgfJyEZ1mZl/typmOX3QJkpzBKUDKa
         +eXLQgKB4W4vRglaXc8HMvES4cMMaYyhwYcR8Sfx1mD5Rd8lU8mlTPIZEQuyL5K/bVtO
         6hhw==
X-Forwarded-Encrypted: i=1; AL+hErFzqOAmXHM9UhiP3CpkRDjQ7XsXaT7oFiwZDZ7iSQddrcQOHbXVbPnsVbZacSjL5glFqNSQ8p/BjAfTGckH@vger.kernel.org
X-Gm-Message-State: APuU4Z9C3A1WxyG+rUaUzqm161kMJK2cESIkXymh7PmYc6uVUbZsPD+f
	xMgJembiu+VvNpWdTDPObxzIoqZwImQfVd2dXDeZJE0NLxjC39HzOwukToi5rh9pwnjygvqmpt+
	NCm0NlvYBzJ0a8tifzqB9UgD+uw1PZiocP+AALh75HzZqFtFQWC7qMTeU4qW4xKQpurEh
X-Gm-Gg: AZFdTZf21xNdMSa5GWNnwljkajyqzzYFqmdOG2YTkPB7I4mBlWsWjbne5I83UK1rRJf
	cvbuZId21tsTUYPwm34vobSTHb2Gr/+ZEK3vg9vsq/WVm0NZEfYW8sZbeCTrPDcyHRJKvhOgYEk
	KRdHG7Ega+BCrHhJuGkqGVs8z3U930JO3v4DxcNO5/GmBZeT5y++wsqkfS4FMIGJM2k02hpTFJx
	guINxjYRgcUJfR4oFBRpund6Es+LaBLJ8X1PwVPhWNNy0pe/N0XucYpfWnAAadFA2yDMojt3VqN
	8avTOkM0tTVE17kaOD1fAfqS2N+fZiyJTeb495OUA+vgBHXRKDGVdtwUXe9P1Xh6Ide0rSB02Uj
	bdv0MZVVoFowveL0/07U5xFw2+Tj7a78//tYWvHLZmVLJLnwy45AcTQ1nBRl/fLKVn1SlyaAolY
	GwDZ1w
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr2548332eec.14.1795172908901;
        Fri, 20 Nov 2026 03:08:28 -0800 (PST)
X-Received: by 2002:a05:7301:9a82:b0:369:4c3f:8a5 with SMTP id 5a478bee46e88-3856ef45385mr2548284eec.14.1795172908315;
        Fri, 20 Nov 2026 03:08:28 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:27 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:36:00 +0530
Subject: [PATCH v4 19/20] arm64: dts: qcom: hawi: Add GEM_NOC interconnect
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
Message-Id: <20261120-smmu_interconnect_addition-v4-19-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1056;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=aYGbyD3vlcsShV5PIBfgPkIOIPXgEFvWy/UpvGRwvdI=;
 b=PmL/7/OIAhKe6+7Ml8hww8O3m8ab/UwFs5/yUv6UukBwizaGo3hlxGIlCcYx3COfKyuE5mfYT
 POM6ORiOASJBu3Embpz97TTwUKRZxIR3vDX5gO3izhLjXm5xK1bvqGt
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b002a2e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-u0lSa1b7RXV9CCC13MA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6/rdGPyYltT+
 UfP2MTGCPt/oXK78QkbMQkOVJ/PoA/m6+W/a5GaejtwSowJJA55mTplW6VyFHs0LF6FLHUZwXOX
 MvK+Qkw+BmKeOlX250vICzqcljie994=
X-Proofpoint-ORIG-GUID: lpZTlKtNWKpVtr-lq2ASfGSLJh8Ypbu_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfXyvfdAFPFoHBP
 jeseTit0OAF2mR60/W51WKpe0OHR7/3t3lWAvHFujSu/sdZcM67go2nqDz7++0OVSFd+kODtMb6
 J865/hQtX0ypb79sCHw1v2KbJ8NB6L7fpDQ2/hcr9EW8xmvBELvaJ6BUPgCp7brZH2MuyFpNd9I
 2MYyLXjpfWAg11fNWepM/d8ilaX9d64emWGVvki3Q1pBQvFab6B9sU1vmbe9VOGhNWOTL2laphK
 nqqe6or1eCLX1H5IxGlhlfZwuRIyKhvv7Zh3J7e8mHfBvuZ1/0215P+PxD/R2JKEYe5Ry5zUI3+
 ClhsZZRrQWEo9KCOirn53SFxOPGS7+kZOtmQ6B7kE7N50GpoIV5tiij0GMDbtrpvRYvrRuCPJ1H
 XGA9TZhD5QCR43WGt9T3cueGs3Muez/3/HJijOoX132zzhhhKKQWXgQ0P69O0gDtnobn8XI706Q
 h2UXTjAD9XChf5fCAXw==
X-Proofpoint-GUID: lpZTlKtNWKpVtr-lq2ASfGSLJh8Ypbu_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On Hawi the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 77d704fa6cf7..bb60ed9384c6 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3685,6 +3685,8 @@ adreno_smmu: iommu@3da0000 {
 			clock-names = "hlos";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		remoteproc_mpss: remoteproc@4000000 {

-- 
2.34.1

