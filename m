Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A4D493644
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047025; cv=none; b=CYBEIYW8DGBhMktxVCn4RKaaLGZ8xQ8r7nT4LN0ee84qtIBOGFgcgq+HcR3f8Hxh4Uv5NJ4JY6sqNklLaCc4d1saCt5bsUic+Nt/NQ54TaPyb54/WYCAVr5qf1pXeiuR1okNiWPiPVDfhThnCeV4N621ZHt8bJn1kSKHXtJj4MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047025; c=relaxed/simple;
	bh=92+EwqA/U+DoQXSDLJUSUPw1xZv+ShSp8XLecD6zuv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BgTrg5W6Q/WItDXk8W+Hdkiu6AkoI3OIJP3gWoWOpqn+c7rq7qOh/S1iyqrnRtsmghiMWqaGW0zy13M/q0OJAYxMX9QbafuWASt6HLF2O91STgcgwYT2dSh5SIoCfZ9S046IGodEom+kbbOYfuWkkAdZyEBCAv5USjJw9x+fAvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EmhjQEIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ti8DTWgh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EmhjQEIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ti8DTWgh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7afJ2029176
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=; b=EmhjQEIaiQd3aj5n
	0Wie+Bmxw42oF7H4ZJeXNvyHx1zN994F6cTCMWYXQs8ZF8o1I3LcdRUmBEV+NpEc
	KvkIu2KRDCwZz3v+DpPMXK1X12enpviiT4PSvApzD57D0unGhOKK9ISfiCYNlIle
	UpEFJ0FEqBZ6CriY8nwTWobyzwPIVUIDbE35BxXm0Npgc2hdgi3rHWCk1qgyaoKf
	DCq6E9tYMdVhLgzLJjGXC4qKfzAQAYSCknm22JkkAZwTE3h+mU1CiG9u3UoK+v6f
	5sNukMNIWavgToWWsVnyUwkF1wGHynxdcuK4WsaccYOje4ozeb8HFiCRGS6UHATm
	32DDog==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc06n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:23 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f1da5e5b06so8802223a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047017; x=1789651817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=;
        b=Ti8DTWghd21A6o1jh4RpRP2NxF6D3iWPoqrayHyN/3xkyvXtOhyILNgOLpwOda/pPK
         tdqQr/a7VLaZkuA+X5oiJssNDZsSdoYinaub1gj9Er8BNwafxu3wyagOFoSme9Uw4j0X
         bcu69MdWFPxHYIVvbq+xiww6cyTfArRBFj30zOEwMKYHVLOxyGK6GqBY5KOuZedRiYZI
         4TFl6nvPRwpe5hwYbTEtU8Jglw0s22Sq+LVylles8vlPLFNz0SaqtqOe94ZODkyEvua1
         lFNpu5bXKKUUgEe400NbS+rN9z8jzOfE7Hd7/u3Kjl9sjdnv1rfV8hOVfsxW0ujzBlW9
         tjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047017; x=1789651817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PTuelNOQDOg0Lx+/+7JwWjc6pK3NDtRpCS70MSLolvg=;
        b=cXITPjixkFKkh4hwNMVz4QINu7zQODad2ltAXVf2H1eQQ/4GNSX3oERLI8Irf8Krlh
         uPfc43aIg0r9Yu9DGxzcQqVKuaF/L7jfhUpE2xv/NzbJ+9hCwa3NtV/LUNtgvILkmk0/
         9jpnvD0rAO/m77md/K9Q/qXGoF8x/zyxwdsJZlLgfK5kNJokUqkrQEBehxWf/VL1VrQc
         jpV6SzJV99AIFINHruqpQa6dsGhL1zswhv5HGadxQ7WiBVBfEJhTxAHkVc5c+gUMI081
         cbKkDPbMyn5Dqf3ilwBqoxS97Vut19o6KoXRT9Y8UNM2JgBkwqsqeDcLnltRffMFSDZB
         tMAA==
X-Forwarded-Encrypted: i=1; AKwUvBzG1ApLqodHEoTadzW/t4mfO7PQzjew1y5UUjcDO3fgXUuIWgAjYwKKCOPYRrpFQM2IxfzLw9BR/W9MSNDX@vger.kernel.org
X-Gm-Message-State: AFuF++nUJ2dD1XiS6fXkcGqLJuwf9PazZgOwM9r7rs6iZbzNqAY8GyGf
	CTP7kVlsuVPLP/UhjaWl34XSEUM76KETSLB6cc4Qz0M25TifL3cA8Agq83vkBgj1U+LArNrcCdU
	kx3KkmWaJPQCkJ+zia8CFifXtseXrpB6yK3RsjKZ3kKhibQFf1ydJBGXHLpW3lSboOImp
X-Gm-Gg: AYBFou3PWOvrRxs4wKp33vyJA0RqG3cWKT6IR1rbZU16BgK1f1OjGNUx+Ba73CCIZ/Q
	Ux4IiA4KBdcuZjRLR3ed4BfJ990yRlXyUCYYriYAgKRFWxKp7cMyxGFLH/NoL/8asZ/7RJyFNSy
	v3q7KCLcyS5F/IVwk1mBy9PzSF6QR28pj0xMo2fEPsuknBOqkQXBfNTox4tqBM6CBqaKGmMiQie
	LDEzWdfop72T37SjMMGdskeRi0WdN0H7o9WPUaPeknTOphI6QY6kIvO7t5fIESiALSlmhdzq2O6
	LEcIPey4MsRsQVjKYGqlQxbbnPpPPRWTPM8N93B+z4hd2lsUzdnf+1P9OUh9G/sux0claNRmzCg
	wgXKdSSLfDBpPnv9S8zVKsr5mQZ6btl0eX2g=
X-Received: by 2002:a05:6820:168f:b0:6b6:71f7:ecac with SMTP id 006d021491bc7-6b6fe0b857fmr24916936eaf.32.1789047017279;
        Thu, 10 Sep 2026 06:30:17 -0700 (PDT)
X-Received: by 2002:a05:6820:168f:b0:6b6:71f7:ecac with SMTP id 006d021491bc7-6b6fe0b857fmr24916898eaf.32.1789047016859;
        Thu, 10 Sep 2026 06:30:16 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:16 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:05 +0530
Subject: [PATCH 16/34] arm64: dts: qcom: lemans: Fix PCIe wake GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-16-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=2052;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=92+EwqA/U+DoQXSDLJUSUPw1xZv+ShSp8XLecD6zuv0=;
 b=rquWEd5bKu5+Edtehj0m2ryi9gV8ypkPYuuLojnoS3XfFxl5fYvaYuSrtlBMgiua3FOZWIHgl
 4bq46BbnVRTCQFd5p73iU2Z7OOxcTXb1e7oJQ7/HcjLonyUSZiBlVsi
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX6nRHYkKdFb9U
 FjImqxvyFkiukvvEBKE90iiyfEteZfY/f/X82LhiRuxoMsx7ozW99pKq/RUGvQclLOjRW2/4iKB
 PGOURvi94VaG6NtpKb0EHs5W9o0e9gSGGqmIK6W3VFOweWmcauSS+wGvM1GalmWmqzpJJlaDNIU
 GdJ3m3mzkw3layr7r2YN42LIfTEqFVN4FDsWbwomkquK26G/8IFfNMNIuuSHjHJW19hc6kGWu4T
 RKhHCgNJZ2LMszlBTAAbgRyLSt/m17BgoevZX9qV9BDA6LvmuzMvwryTJW+HlaWXFmnAGPIzjBO
 V5nsHj2SaYTMSTGp65vhFA5AhN8Z98Dpk4/SeVQkLOV7fty/EE7b+O9cjQ3+In4S7L27CxYJhI2
 TMX7a/zYxm6vZA+cIJhFt+CeV39kMhpeL3dRMI9OIU40AX7T/5+tdRB96cNJTLGEPD2+yRT46hW
 eTyKAOOIuCI+Gr1k0fg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfX3/MUJJvMNyJp
 BNonzLKf9KKheFeE3/rOqXNIpzHeyen93GTyg0aYMoMN6BvfC1UhdAI4HPm1YP2u8O9wS8vx/ta
 JnGFhRjW5Gg/qoOP+8zJONlNvlIt8iQ=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2b0ef cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: hpbsr71Qo22L5v2WNKL7JRpDyijvSkG7
X-Proofpoint-GUID: hpbsr71Qo22L5v2WNKL7JRpDyijvSkG7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100161

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++--
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..194e114a12a0 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -840,7 +840,7 @@ &mdss0_dp1_phy {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -857,7 +857,7 @@ &pcie0_phy {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..3ecf3d464dd7 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -962,7 +962,7 @@ wake-pins {
 
 &pcie0 {
 	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
@@ -972,7 +972,7 @@ &pcie0 {
 
 &pcie1 {
 	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;

-- 
2.34.1

