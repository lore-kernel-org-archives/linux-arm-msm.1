Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77010490C1A
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390211; cv=none; b=GdrsxtSfzA4A+4CLhY434Bb5v6IfCHh9kEN2gO08h/Y9TACzvFRQOjtMOFK6ZRX7KscWlTqAUzTwqiJf4h+VpHyFVulFsPO9McQEwLwWd3qtJapPJMswxiuVhc43J/qIRlmDxbohyhfgrOd7qLPsDHXtNDu7DfuHM6uKzOUlj9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390211; c=relaxed/simple;
	bh=yAGUlki6+T8DTlbLkETXY1t3zk+zRPEGo61GpAO/KKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8CNUNqQHgGcsZWP1kjqpFrAFVrNRs3i4IK27IBDnLpuyLpqOTWrYyni1A/nmtq06iY3BUXV6qv7yBL9s/u7igrjWjaf6G44EZSDEYnUFhJrhHkRBWgXSKEky7Lslv0Kr8JF3zQGMZBLLhJowVXx7Pvmvrg6tjJOmOk+YRKPiDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UThDtpCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vn/z/Vf8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UThDtpCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vn/z/Vf8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmB2l377916
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=; b=UThDtpCPn11DEbHD
	CA3E6xkYVhQVyKk7N2FS14NYkoRUfz+V7HWlx2c5J2+nobIDuJZrWd8+DA0SYOkH
	GhrVgDHpwWBkeyjMmVxTzDPFLGyLWwqEdQtYBltpJ1hVo5gRvgXileVcQdruCZvn
	5A1BtyqR1aoo7JtfCQVAFGmWwaIzIgDI7xy55cygsrZWtv3XD4+FrjEFwWqrHApl
	9OctEYJMumIh48BiZYjj/Wp0j7Q89W7l7Rxl843KenKvhBSQfQX6vDFQg0DSTtpW
	L7/ETj0Lwe8WhSiGNpP+YEpt3H/y4TncTrUVDs9h4xxbsMtPPcntdbWNMAa9FMnS
	A19fXQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8qjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93903622880so850152185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390207; x=1789995007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=;
        b=Vn/z/Vf8Wd4O5VgoH1J2p3iyH5SNG87W2ohhqexzQgukLmsfkOAlOtcuQFA68PCs/c
         aibo+9OU+CjFHcE2TTB9FkTOX4ei7i8BgSoAsApGuVOZP7W33B1G/3wWzUpd2Yv15voL
         rjqMsyO2RqTTN88vmrobA5CmntGejg77lHXDyde0ucyocnm8gsAHuLYS1U6IG0gC/uER
         UZSQstJxC0B/YVQZILJmwFC1VN+AYMgRnX/SDC/v65BytjZuUyfYLiNXOz5XAawQZhZD
         snHQHv8kXwYjNeqzD1zAATXGK97/yKSAsWRAkxJQamcGOqGmJKC99foOSCc1CszXVkFh
         vKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390207; x=1789995007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RYEeesglk2g/L58T/shD/FuhZyUtuD0muWsntbGK1MM=;
        b=Ht7x2fAa4p/mcYIS2oqCPXDCf6VESFFNEG2Q4PXoXTRk+3XkwBf51MHNDtPP6sBjS/
         6xyp3vfX+cZIIKawO3vn9cIhde02GTpbJ7Rlpo3zBNQz7jG5r5oBCNVP2EvKiZlH416c
         0tw6BFQ/21lKdjNE5/WeU6123OiKkOCtTYp6zCH+Qt40O0kaP3NYz/2wI5XMdUknJMcT
         c4POsgKjeSX6NqCkG0PZjxXbpElKbktBqusWjKb02D/+pmPLiVr7d3Il//xCZL1dhKIS
         Q31kiDrM9vQrBtGHjLh4E8Ev1QcN0xxdlXiqAhWNW0+BiPFiL7qxmrtTiiVery/SEeW1
         0duA==
X-Gm-Message-State: AFuF++nGrjVAU1OzFscyGM9jkPg/r7CLOsyv8JmtVyGrYPpzUHimxYxj
	Pe/0qpzRo1YXYBv6IXMtEARXZKRgGh0o/30wJlOCkY51R/oDIhInXU7nzgq9zIGK647QW4DWOzd
	+qtM79PLaJB8uXTiBmcelOxmJxSJXehr49r7Os/U4atwX8MK9k/N+PZt/ecunOBot9xdd
X-Gm-Gg: AYBFou3XRC9goVmfE7qRt/Nk+R8duCKCfhV8jJWpMZ0znNk2PxdZBxXY5uIw4cCurfi
	ni5zdZ6I1wIa5VP1oIyzLegpok5xxHRQ4aY6edrfz7Tj4hoAzD+EQ3deNHMG6msJN+8ENqYBBEj
	byV3OC689XHdEJw1gdnKZYNvfUEAyCdL5DUUYSLy4jHRwoIhGG5YRm+cey5XdF3cjX3LKxdi4/5
	qmOGmGygjw/eFj/MKfwWMMcErQRo28XJXK4qZLS389e572dJ2KcuNDNuJg4PSOgrmVktHkYpZHC
	I1TyMaQqZIcwVSADibrpNzX+7k5E3JiV8PZ2kUVsWmwhDDm6W+6W2YmyJ1gOMReMmPusWJuZ5xY
	X6zA5BYth
X-Received: by 2002:a05:620a:6017:b0:93a:2eb:36e2 with SMTP id af79cd13be357-93a18771eacmr657281685a.35.1789390207433;
        Mon, 14 Sep 2026 05:50:07 -0700 (PDT)
X-Received: by 2002:a05:620a:6017:b0:93a:2eb:36e2 with SMTP id af79cd13be357-93a18771eacmr657276385a.35.1789390206863;
        Mon, 14 Sep 2026 05:50:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:46 +0300
Subject: [PATCH v4 47/52] arm64: dts: qcom: sm8350: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-47-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yAGUlki6+T8DTlbLkETXY1t3zk+zRPEGo61GpAO/KKM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z54Sqok4JzjaNvDnlN4cbUgr5ZThrbmwOmT
 qCPZPNTRHKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs+QAKCRAbX0TJAJUV
 VpF5EACAzrnZ/QONcpJy6uuYSFpcAiOscLPoo9tKHH9m1Had8EISOl66hB9QbcKT9tHCO1+PsYg
 aAta7U7rILWqGU15xzAlUQ4AwwBBaYV9UktidAl7V1DPmfPAVpmqLYif1OCaBsDV4/KAxwEPpki
 tFPVP6yav92qy0uCkbkxjPJW+b6bFPMVhZ0wNgZK8JrvrWPZkhGeKsrodFymZYKvA6gPEzG9Wo7
 FFRmnKAiwLrt8ejiWTliw5hpG/Yj51DGv4T4qsKZI2umkcLvwa+zam7pTSfE/yQjQiNxjnRMYxH
 rhVc6E8r/5ZblnTgAnAKn3ThQdrl7peHRX8OdbolehvBhukRosOHYdUFARMmWYE5lEFwOgJR0xw
 IwxiAqxLCqTNKu85i19tPUDSrDFznZVIp+XEFpXmdFevXQJSLolwewhP3hsvEPcwFN+ZOgNsBnV
 yGJ/kv0vX/FAT2TKSSnFLtSKQfX/wmj4NHwbsd1EE8yYxqfwrZMMhSKEOrkE3mOXratXs7k6s4r
 CNxnRRPxPMmhOG4gKG+WDU4wtDT6risf2KNsuFDZNRlA4K0PqqTAnWvdPWjnif9I8b8dC7JXfSk
 SrneAK0w4j/2K0R1Ds47rKpP/iWxphzXexlUdk+nTjPwTOsJnNvAh1U3KlWaHKc7FSCLSZ0DdVZ
 UdiqVklmJKhwrYg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX/sRLwuiMnK5h
 wJ7uwf1555+6NKxZVQPGpSAKAQHQ5zjnieJ+5H4e1zTJuqVvPnWYM6tjiW5o9T23ftFDcDi8dmi
 fMfrjrSiKC3EzPAa2RGKMwjj4GL1A/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX+uhfBgC88Bjj
 d32BGR23GXNvL9f3ioxlr9AUPlpQauK1ZA0aaG3i8lvardhHwAjNfgxG+VmsDZmFE9Th+1ULBAE
 /bP7KGGOUIVU8SXykLA3bfXbtIzAB0Hffpe0oORPlgBHm5aPBsZgnWjaIRMeWwflkmtAXYLWicZ
 DMvcSCu99BmFKvgcRiCtJzXVniXaDxO+FcAlL1csDFTkXiCZKAGR7+EsvXtJJoK9NLguwK6Q1na
 VRAB1y36JOu0QzF59ehxPNvJk3ISTDgnOiaFgkpqqMWoOhXTY55Dtg+FRthPfb7DXM128QWCUFV
 /oxokjMAIVBSKeF+t/WQY6d9ynA0v/wrdwY1S2QX2xgW8ZOpMjmMx2TQQ4yMoB4epaa3/ue6+eN
 0AGV0QYAIV63Wq4F5gSf25duTcGr6AdLFTPKdVP0Ht6MDlxLMjMuShpmt8aAdiH+EwN030DviQt
 DQy+pQm2KKQYPs88+ag==
X-Proofpoint-GUID: mwwVpOWgM9JsCHmOK5-iyZQDYU2mbSTl
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7ed80 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=S9gNOWPKAuR5AUhlrlYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: mwwVpOWgM9JsCHmOK5-iyZQDYU2mbSTl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on SM8350 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 100faea925a3..2a7c6621ece2 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -698,6 +698,7 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <0>;
+			power-domains = <&rpmhpd RPMHPD_CX>;
 		};
 
 		ipcc: mailbox@408000 {

-- 
2.54.0

