Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C544BD347
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646122; cv=none; b=cugDkTYiwnN1r68bUS4YHPA8/q83urEnxJt7uVEogoY6QPxZKp/AS5LRLQX4IsdLmDGA4pfKwgKEGzHpXP/i61aZRBI0IWaxDiJtA0TYFERZt8+sB6oLgwA99dpuWze8qvLW+FlcLlahVFii1AJXcYao0y8LM6dk16a5GwVwzdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646122; c=relaxed/simple;
	bh=GcNG7DWryYR7zq+rPZ4MedCY8PT8P2uvYLsRVBOtgpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kp9RCDX4MBcDzAO9kvGqoMbVMxbiTWlahlan0HiFR4Oy2QeScZOy4yH2dma414x/1nxCF6IbFVZNOSU5Z6U025TIBJ92Z6HVixf0bFGYGfUGLMIiOjnqwqFbz6s8n8JHPavAXJxvHRgYSNhBmkw1Tg0w9XZY08TmGAbx+9kqJ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MalyJOsp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ki+nSY0T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MalyJOsp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ki+nSY0T"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZsM44186761
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=; b=MalyJOsp7MdxcXBr
	grxdvue+TnUvfOuypYsHxRAPVw7YP3LpY7e02m5vSyp1HgJcFb5bwhuVR3xrSUMq
	7QYRtBXX2SO0s7XUnx3hubyyPGK3N8XoE4lWPclC3FShy5FrNXTRyavxkdD9vP2z
	Yffi5cXYiwCZffVlDnzAUVrGpTQodLYJIRhfkSflEIGAgbosCjx5gf3fYBsXHq+B
	r+V3D4LLGlOa5gKm1xbCkOPdD/mvVjpgKsY8wlmYPobPOgn5GonkL3ATJfUYHTG2
	irkeFOYADPWbL8eVHLrC2sr2XfDHRuVs6GfmQzlS9zAB2VHbk2apqW5rlWCJPO97
	haTE4A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uca1qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:55:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4b524ce78so552387a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646100; x=1790250900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=;
        b=Ki+nSY0Tmsir2yH87K3+gCICVUOS8ssN7MYrszzyPM2EJbcTcgF2Qd9OMteaAvyFwK
         5jjglnAllhZY1nitTQLBxnuSKDiKz9eZr2aKyM1aJgRyFz7DFai7MNYQIIAr1v9HEYD7
         h3x4MpYULJTWZflz0UL4DnyNGDoaKq1U3ksA+FmuO28g5jWVVyDBnHtIr9ZulFRb+XWv
         9+gKy2znPuGmBc3mgZSfR+mk3m4EQsg3gvSsnCdN/ziov4IgaKKpEiA5HUiTs8hVHZB1
         KZJEp+DlOQHND42sFJ6czSNhAkjCbux20zorOy9jt3rHVbL2jSVeRYQYDrTDlLo/tBvU
         m4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646100; x=1790250900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xnt/0NbDaGwVlbud7WJZWXSHceVMLMKGtzJpWOacDI=;
        b=uOwBrx1qUFt+JZ9vklH7M2MaFZOvbSvD19n5g3k/xLCG6Mp9TbokYDpIZeWZTBbsrP
         mGt/b9Hq337vtKpu555LnL/rLXnZNnMwdWNQ0KifD/uQ+oQqrpbxJHE6/fNA70epGWpi
         E37iF85FGcq+TestsjbEVBmgkxN06DD5LZ0WwUujPDAgkGZCYFylb1Hp/GTBHydNzVW3
         A0Kh+5iSYCVxb++DHaci4fTAlOOaf9FXsz6hiklVRZHfRzReq+8kgX/vrelMZZiviBaZ
         6Ve/JxWJUxdWsvS3iHrT+Py527ONwIQNVvHus56//V767kWgu0ZSvlN5aB05vg9mW/Wa
         ghNA==
X-Forwarded-Encrypted: i=1; AKwUvBxS7T8Qrt2XFdh2Hz+mOQ3CoEJlPd0lszW7mCwEt4CLsMlXOwjcbMxyMk7kRWfFY+/udC2sGjIoNZOafvLH@vger.kernel.org
X-Gm-Message-State: AFuF++kOHY1xnpybx1hknNOpIIZBdVBfUbRht1ClELSIVv66KhvNO1n6
	MwVHdcxaBSrxQE/FeP5txCy0Fpl1zrzldUMIoFz7uN1MDOzlq/BGiwALjNh9l83r6macXvu1wiO
	9nRy9stMz/ILYD0NxfQv5Gg5R1IgIsVzQJK8y/vufjIkve1EyD97mZQ5rHuYGjYprPg7l
X-Gm-Gg: AYBFou0G3gz+MIuJ1VxHojsutOJh3ZYaHbylPEYshm3cJloUyikuflAjoGS2BB15rqc
	+jKnNRsH4gMhS6bg6WpWMmrvU7CZJ4msFoNzpiL5nLCijj9zCXZFMEwgq9KZbNhSbujPJtvLFIh
	4D96eYoM5BOwWbhmpAo2eAhgOvChaoTDsaORTObE6cTDoei6naTCXepH6ba4+rovMg6VnW1dh3O
	o06oP1Uzl5Z3VoGew5KbhN1LAf23p9fBg7n2l+1aUYY5X6nsYBdO1RdPF6qMpXI9Kkj1XqBxQKj
	pNGO55Yxzx5oprmqdHbSNOQY0BNEbMai3oZKXdTL3lVK58N6su2TSJpBeJQLRvLjE3gWrPAfvix
	lXr69O72Z+dEsb3zIWJgjGS6zLXn+wvQs/g==
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr17059260637.20.1789646100444;
        Thu, 17 Sep 2026 04:55:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b10:b0:3da:3bdb:b22a with SMTP id adf61e73a8af0-3dd5f71a912mr17059196637.20.1789646100056;
        Thu, 17 Sep 2026 04:55:00 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:59 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:14 +0530
Subject: [PATCH v2 06/18] arm64: dts: qcom: sm8250: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-6-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=1575;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=GcNG7DWryYR7zq+rPZ4MedCY8PT8P2uvYLsRVBOtgpM=;
 b=11DS4IOjWa8jhpPWdtMSmszFH4mGINtRdhU9fB0SurLsuHa0b5Y6n1SVEHio/ccmEjtjEtlmi
 YcKn4IB2LLTCYTfualAqPy9RrMMjGp8JNOebJ81/cH7xONc74unwb30
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfXzQ7s6h4Z4DmD
 G/nKHmi4eLUg6kXGIVRf79K0Y8rxNpoBlWMWE3sF0HbWtVADNRmwErdHjbKo15Xp6+ORQpQVLOv
 wd3NRDeGiPLqpEfvXHABYUcsS0H1N4Sz1WTsV/tx/Ct0lCALAtugBSsTeSUby2uwQEqw7mhLF4V
 QVaL0B9ll58bS1Ai/ytiVOZTGnrruG081HyC9deIYuM8VkH5Y3J7w1VlLpRLLwsKdEMZq5Dp9kH
 XsdjBvokrSI+NU9of/5rU/77wJKGuWKXX3j6xqFQ12h/qldPaDXJiLyOnqUTn1c7J+LNQ0z8J2i
 Lf/FslrCbP9fPBWX7hBlzM5FbiqCD/DjG0bo3K63v4o1lpFJQk9x5OlGDz3n5aoXwRQp1Pg+KMk
 NHgD4AWt2TH5rkk0JmayHzGjW4ZMeBZaHw0bg5fKCedsyGoXKAEWRg2VK1VMJyL36usUhHoKg/F
 G7e10erlfNUuP04o0eQ==
X-Proofpoint-GUID: MJLu-ZTwC82Nglw-kw4E1UoDICtXh5jw
X-Proofpoint-ORIG-GUID: MJLu-ZTwC82Nglw-kw4E1UoDICtXh5jw
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabd515 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX6Bjldhg1XiXB
 GRdzzspmMYw6h1/YUbUL6fsG5hU6WlSheVemUrLZM7slpXZcdzYcZZDA2qU33qoVh5OqIqOqI7d
 b6MPkRBeLCjIk5XSuj6hgcGB/V7xuQI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 90f8b091634e..e0c357222bc7 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -2211,7 +2211,7 @@ pcie0: pcie@1c00000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 79 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie0_default_state>;
@@ -2338,7 +2338,7 @@ pcie1: pcie@1c08000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 84 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie1_default_state>;
@@ -2465,7 +2465,7 @@ pcie2: pcie@1c10000 {
 			phy-names = "pciephy";
 
 			perst-gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
-			wake-gpios = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+			wake-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
 
 			pinctrl-names = "default";
 			pinctrl-0 = <&pcie2_default_state>;

-- 
2.34.1

