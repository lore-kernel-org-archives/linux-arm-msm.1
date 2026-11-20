Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172916;
	b=IBh59hzs0DkFBXresXuzXIUKr/U9iJYhSBzO0vLGnx7cWLx2W4ZF8fkdItqsrtaRGoE5
	 DxJshjIo8lCMeRBtw9bZ58Ku197V+stdOdV9SHfSyRQezE+MiqOA5YN/W4qIcp7CfIuYu
	 LYH9qLKj4GM5X/W/zmtUh5c1hrncDF83sR/Cks7JahLVwrJN9jXU+NW0Z60T9rhbGKDy+
	 xfJSgezh0jsRtHHrWW5EX8zUkyqzpOtQ/eJIoTaEXEZt54KMO04Psv+4W7JbArlvpjsWt
	 JArzbhyZMaGxpiNpdUE4eapjj3aQuLjHQ2cBfIO0gLXguX7JN9gwnOF5hMKlsZg5qtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172916;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
	b=Dn1lgqkYAttdBoFvhisrrFSWpxfTsROWViWT48A9C6vlWKmvcMOi2aHBsPxb24xzDUe8
	 yPQzMN1V/VU76VFchHUqcxbOFACHRn+hmKjJ23M53jNQUF45Xu+RIHTjvdQLI8ghp++zJ
	 MeCHCWWg/PtE46EeC0zlxwXmu6BPhP//OT7wdpzV7KLVxhImvTN2Feb0Igx3EhEkOAGZe
	 VqcoXYRdVNxQGvO04MyiCcKivjGszqJiQiWdBpcr/f5TC0+QP0IiuIdwM/MAb4xAEwrNZ
	 US77dGcp8xPbgYMsqGRlx2sN1U8vLA7oG1DFlzOLIfi/MCT8zPWus4SUM1yWr64wrZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jDRa1RoT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LOto5TcU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00BC606AA05
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D00BC606AA05
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jDRa1RoT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LOto5TcU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkHXd1017120
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=jDRa1RoTaVw+kV4J
	iIijYa9u00DawX4XZajLV97ka6+MLEQEBiV/fMXc2mMzpYlSptndOwbjGglq1A89
	OMH1BMildAfBYUFQtDQ29psB8zoo7r3mp2inArRf57qeL7fml9Ua/E/HD2Avgs08
	X6PGKImROaZV31P1FdjyXf9YtRv7ojUQ9V3nkpwY7JSGOuml2T/ahjm3dA+GD7ko
	ElBYa1MES5HNqGrZDoR0o+1gUktwWeKqOStxJokhQOfb3b28tASG+uO2EHMV8D1D
	cZxmO35EZY+KHxbrowW1rHgHg4uqUeydrPP4aMDQ268wzHiqoePtZ76ovX+3rQ0l
	plqC8w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqs7py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:08:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so2195891eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172914; x=1795777714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=LOto5TcURhUTpWJTQRMSCEwQaQB7g2bcy/2rQiNBMGiWUzvLuN4zPvyZBicLhSOtLG
         UaISabyeekm7n/UI0O9+JacbG9QKPciOhfmw/sF0i5N44HiQZ3KRxUkf2UiCHqQa2EBs
         67fIlNgpljvAJRKeo9CMbeMAN0l8v3qZEGi32aYJmrE4CKatuNSH+mGaFIvp2C53eME+
         CzQk+/bq6LM6EaYMwrKkoPgDc1hq11hrxpa8a4pdl4wIcTtOvqd3XJoO3pn4IXAaTWgQ
         SDV5wUBBCaWZmf9OALG0J49nBCYkzyx0qQ9EODBsUtkPMtv2penQNxnbvtgUloWwmKan
         +dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172914; x=1795777714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=QYjpSJtvNqitpz7n9S4eR8eliHWu60e+/bPpUVHP9pj32Jk4J0CYe596au7CdmCdst
         t+8Oi3aKjgr0xTvgRIEs8Il+9KxhEmbk4kgIAVgYASSQVtROtTxilAQixHm1nUr8D2IV
         idxg2mKTWa6394YD3O0zrTTeUUL311J3bS5kAjbJcaJ/2j/REctBOLp8CqC5pdLcHzcA
         OnvQCdY5AVFk5Liatsr0eSWCtC446SSlTSmKWi68rTAILh453CpkksL6V4FBjuFnCoFK
         sh3JkUAzJVgHHXw4f48nWHdl2EAkbOqljnaUPdqt6pRPNkHnsko21JraaHpv1P5tihNY
         8fdg==
X-Forwarded-Encrypted: i=1; AL+hErGY64YS3dXkBUwcroqV0lYZ/H64RAK6Sp5Rijb1wgPKsNEgQa55CJ8IrIiLED4rWDZKGcivBQfoeJeAWvtR@vger.kernel.org
X-Gm-Message-State: APuU4Z8baBbP7MBdj26SDgcUIN6HKuXEiH8G6yWWidnoODLZfQKaWuVq
	ZqinZ62FwWBEEOQck0HDv0sh42HC8MqHY3/Pe1w0rWrhTAXwHTtlHZXMbdv1k74TYZdqJ5nRiMQ
	jr3dbGhbBtQ+HI2RQdwqfKxxQjZeeEXSUJPpI97kC9hPeXXAMTpPdrdC018uX1/RA3hFU
X-Gm-Gg: AZFdTZe8jN2hgaa6YYgv+0Yv4YUL/quM0WDOeK59IaakoNsYvRvlDFTpxGxJyY54zo/
	vc00iZEql86h1KJKGRXWeV3HcjnGuNK6NSpdt5Yy3s3/yYoZrOpVjqtSQZ3LuiAqINz9YE5cYR6
	KRsdXJuwduH8j+5Eu+hLaOGzt0tXPzjijOXbjYwRl4P72QU/SpRCpOVhwsCT4eE3rkRClsLhm4c
	u4FcwJuZQqmOnpYCkIfNhLDqlwkEtcTXpR52ZRm5SCshDqk9fYkMqTWm3XNhPIUyAS8/Frgplhk
	g+KWpfzOOYTywOZdsqnpVauT6AOBC5r9uiYHKdL6I/ff9QASkiPAQyLywJLdmd6GDl8GCLNzoLc
	19UUVPdaUFORal549py2aSpLPVA3MXwi2gK9SUrl3SylCByiwubCNx4tLPmBMsJLTSGqvT8PpjW
	CA5spg
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr1056757eec.22.1795172914349;
        Fri, 20 Nov 2026 03:08:34 -0800 (PST)
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr1056700eec.22.1795172913510;
        Fri, 20 Nov 2026 03:08:33 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm9252594eec.5.2026.11.20.03.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:08:33 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:36:01 +0530
Subject: [PATCH v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-20-cab8ee8be0b3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795172803; l=1058;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jWnycFT0az2p/u5EzI2kuq2uyYSvSmt1HyCePSsKymg=;
 b=thxi+hGWX+1dy5BZtvJRpmYMDr9qfMtvkKDe2syJpJn9Hx1JY85585k9BWL5+9rHULVGt5OVu
 82NLnnek2Z5BqczmG6nsufHpIxgrHR4f3gkqXhQm+/IQ6mf3ViKyScb
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+1BRv0luDJs2
 WVbtnyQKL9YbNK4wWhoaCojcl0bMbmO8GJ/K10F4DuKoIR6yv+0FXAcwfGWWdHlhBe8yosl7hdU
 dSHl0PWrYVtMAyWulrQeg1SnFZ4Je9kOYtG4VsKRrYAYnCVOK5OUews6At/aYoyF+zRBNCSBgr6
 WAhZiCLnArocwNaD4dwtVX6grVOMzDPI/dZjGQ6QjKZgUxk6CSgoMNDqC2WuHp5rG0YEU74AI4Y
 6sx8HiX/ZJLG4P6/mLsQoaSxEoWj1cE2ofG3xWaue3m6ZCzXuhQF/zNMxO16IaM0/DY1HK/MaI5
 z19eduSvle+2SK5DXXhpNB1U0WVKgcVX/eV4RyRXf51rubQQnvViETIFOawjznd7vckx8Pd7rx5
 ZYPJyap9Rqyw8d7VcIqJWawRQZAiWureHGY85C+f9fWzoGL9h53rcjh2dF4ivGbBCnAdyMBUKZP
 fHZh2RZyYXMIECCa/oQ==
X-Proofpoint-GUID: CgPvCNExgFw1J5vbaz2e28xyUUFYgZ1_
X-Proofpoint-ORIG-GUID: CgPvCNExgFw1J5vbaz2e28xyUUFYgZ1_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX6A3ag3Y8rv3J
 dYQ3O1XJclmfbTd3lG4mzordtPJV7KdIPu5pxyWg9AZnmCjh9oBOswhr0m2IFqOiL8baNAE9yQr
 AnCmy0xniXi0xUkOc4ilySFTYI/K0/g=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b002a33 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=BzZyaU2VGnUrTJno3XcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200044

On SAR2130P the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index cc4077005e66..950fb83f26db 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1857,6 +1857,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		usb_1_hsphy: phy@88e3000 {

-- 
2.34.1

