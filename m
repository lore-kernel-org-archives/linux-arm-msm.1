Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182256;
	b=ASGwbgQy2sYXxQat5o1SrbpCNZa5LBxNroNJDW0A9r9EtXrSweF7jlHowucuwy99seVK
	 DwJ5eVlmqqV8Up9LlEeDP/gVCaaWymouEM2aw5jof68jWY6tSMEujbegCSmZLvUWPAdzK
	 1IumKXq0dHYXc3jUeG6dkdtTAOu1t+f3k4cTh3XsUhn2zjIWYvhChbcUz0GCnte5O3T7c
	 UvAC+qjcq88ws6qcLoBbfQvWzPNBTeS/nAgWZWpvgje3mPkeJGioOx/csA0m7EBUrBK/A
	 27AP/PXPmqnKSaU6xAqvd++1QtKsnA2c48ViTcuOCbfEcr2Ok+daG4Pa+aRF/LV3y2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
	b=0c4LQB9K5gMVkf5pMuWhgSwgqukopdWlzXRE/JVA+yCDhk9qqedl3DHJQNcpwM9N1SkO
	 oc4f1XEBUaPy96gd+Kq1Naaq8u4ObErqI/zQHNa5APj3YJ3EgGySidVOJHlK2IAf82VWY
	 GcY8ETam5sKAPNez/Vv+J3pbi7aNQR9hBLSESLnNfGs02w7QmE16po5yyYZTLDhsE7G4p
	 4ln1RQ7m4Hk+FvKLzvn92jOPYXwOYbFPxy14iDoWjw1LMCuOfoDAB5IhBM7sOW67dxLzv
	 J/g0l4MJMxcW1T4y8EMo+wtMpxtN0NMjPPWOO8ZkJfDGdf9XgNh+Gbwc3ktD3gLP08Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="I///JBMg";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VmJCDz9Z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7946160A260B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7946160A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I///JBMg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VmJCDz9Z
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtAq1681957
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=; b=I///JBMg66s+Ajzu
	47ybV+1oKz2uCczswJ2PLec6ejaV8ECbm7IfuYzpICw11jUAWMVRIzg+OsYe4ap/
	+Mtw8Rbx9r4eUs+2WCUN0vwcJj7F3LE/ywIgGOqi5wSvPw/szZMa6E1/Kb9TZ0vX
	5j1hh+1g/A89ebO+E4ZIMxEJgQoJmT2r3dh0TI1MaeubSi5v8KrieU/DNnyrKsR9
	wU6r/VIKXVMxw4H1Wq3hrw+DP4hTux8BPHdAE86pgVQ4DGEo7lLAhSsibmhhAJ6H
	olphCQt6frVIoaQZ+zG31UD0VzOYKY2Oh2RdOWvOGZzr8nZwJn6PiNtmLHgbOJ8Z
	M1vJpQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2cd1tqf4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:44:13 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3425098ae4bso2089033eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182253; x=1795787053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=VmJCDz9ZVC8JJ5XCdUIeTi+LE/1c+suU/i9eAjIpdHj/OPVAiVlQ2/Be7T7iKVWqZi
         /HvhtRrrw5YVo5s6SvcNtzcda6+WPuLr6ZLuKgDbFUFVbsCQ9gefYtW/zhgKbrc32QN/
         Mju5hqWn0co/awsWgwHQn3mr0Gad+IJRL8cCJwAE1cWTVusskbMYJZrdh/6Iwb/5L22w
         obDVb3jftHH7clnXboeHEUIgGdttk5YmcIz/xXD/Yttd1AooIRzfMgZmKy2+My77uIfv
         EoWFX8SE3Z/SA7p9Bk5ieWwQVxGIn6b8Pdmb6cr/kddUPobYKD2g6OCcMBUiGKfvOv+L
         3jCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182253; x=1795787053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/W1FyUMmKaB6WaeuXYdnagaj02F5bspI2VHNpVO5YfQ=;
        b=MfNwHpruGBCFIw1XdiQfstZq3zcuoztBvbytO2My7Eq84F8Hgh6gSt6ZSJdSZnyq2u
         2r4PTr5NHRPrFlFtYKUDakeR5theweHnEiJ0LSiogXqqDEwB+EpUW5D4XqHmW37V5A18
         D5vXjo6m9yYN1IDVYmIUb07196QL6td5HsV8qBMb0h/Xv4Po2HgutTYam6Vp/1Y5eclQ
         xDbjizVH7WZB8uovW9idhJhtUbJGRvv/yza6a/aoRSzAhM9OzKVlCeD7aipKejDzlnYH
         /Qa0w0ePsEe0ixvdw0/OEVSCF0e4sOwiJ/ktACVef2a7+WIzWx0r4++EJWUZBMB0nxKN
         HGHQ==
X-Forwarded-Encrypted: i=1; AL+hErHLRCWxSM/ZqgYgg79O7GghuKDqv2ekiwWoHv16HdQbV5O/TxZSmoRxliDVKLph0eDPvcW+jaBu1hIGj5ne@vger.kernel.org
X-Gm-Message-State: APuU4Z/1Ubv0ScuEGrCxN/7GxDgYS2+f4N6Wn5wLi3/q5ima3/GGIlb8
	VIusCMrHIfokk1awQ+EX7Y0m3HoDJXyJdYx72Taxx5/ByHYFTKJiwMLP6KeA53+h1b+jhtUn5CW
	xwKhcQGCpsaUTUTATzjFZt0/6Jc5NAAI/ya/ysyHrErjMqDmd5o5u2Zxmg34nwDcte6EAe3F8jN
	tB
X-Gm-Gg: AZFdTZd3HDGL8Ujtix8yPQa3pkinNi2UcQU/NBSMwkb3bYKGrVnQuV3+phO+Y7kJ1PB
	v3H9G/dlkzpsiKG0UW3D7m7+JhWMQsWrzd/5F9CZhFS2Lk2m/Ks76vIoAWTYbSw99Q0BCrNLu2f
	wuDes9WPCX8msyWV0VynJ4eL7iKf0PhRjzqUkf5EodyhWph6ic58T/Tm0Pbm8mDzlUK0g1rhGjf
	sjY/AZnpGkZSrhVi6XiUmytlTfRQjJUrFZaU/OoEkp3N1FhoW6XrUbD8CRYQ0YAtMj9rtScuDnZ
	CvvCPOH1LH4Voe6A/7kZEi4TlXHURN0ShV92V2O+XualOc4B/4dS8qdcKHN/BarXNeNWJlZbIfG
	Ka5zNFe8Rv2xrQNMWJhroIB97e41WXa0cVdVAh8g6QHnWV2mcgs3uUsH2ce1g4BopRRL+A/dlzZ
	7WZiQ=
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4222095eec.7.1795182253075;
        Fri, 20 Nov 2026 05:44:13 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr4222061eec.7.1795182252290;
        Fri, 20 Nov 2026 05:44:12 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:44:12 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:51 +0530
Subject: [PATCH RESEND v4 20/20] arm64: dts: qcom: sar2130p: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-20-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1058;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=jWnycFT0az2p/u5EzI2kuq2uyYSvSmt1HyCePSsKymg=;
 b=ZflA6r7UtGdDB/8yQ07sE7yzSHaKi/dsLit6bYC44nb5Pebakn6aH+wZQKxLjgIoCtcFXVcpe
 bgFuB6VkQYvAFuouqHVo9+JC5mPuCRTT9JJdyxC+SQjThL3oBPuBpig
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Dt/Da2/+ c=1 sm=1 tr=0 ts=6b004ead cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=BzZyaU2VGnUrTJno3XcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: PYDwN16RVxIPEHArABGlTwsfZD_HpMEs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXyXgRD6ikxg7t
 ySudLDsYN9IiID3nhbreDCqBCE5kfPck8WSG2+b+n60ix4SPo+slW44E2I8kPMH43zh0WRxJwPi
 IFRHb+KVbumBtzJSl5aZGnZqbXw5ezdB/ZIyWZ/KTHwJflj5zsUMcS6aXrfeMtJinqfZXydcnZh
 GfpbQvvEaFb2GAWeyWolaXpo3twpyqDKRqxtxZuwOcRhHUoXxNXvPmN26UwBc8FsuVgbw7uhPr1
 ig4uMW8nCiYJZ7J9rzge4mDvN9nEr19ICOId+M97ewGhOc5Ole82fFs1101E2dPKNHvUwNp5hQw
 iRUb6Xo1HYJYqrdZ1JX1kBLHo6ZOV6oaRJamYuUMrcGtrrGZMg6274np2FPV15zsSAbOA99e48S
 6HKzc7PUlumwQuS5ROIhSi86pt4GdYOFvfMeI6OXTKgeq5tX+9xkI0UlY6QfG8Xy0OX1/EGyBaE
 B9ygaL9GlpMz4UtnGYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX0+We+6wkXabr
 k67M8fhT6+U4JW+hFV2JETgsPZK7P5lbu2PTHOnhss6/WJFqOHB9HET8oy4kLrljOLeS8qyfTz7
 V6h2Ydf9sdapl3mGQ3HBJAWZuqjYHUc=
X-Proofpoint-ORIG-GUID: PYDwN16RVxIPEHArABGlTwsfZD_HpMEs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

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

