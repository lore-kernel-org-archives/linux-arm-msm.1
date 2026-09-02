Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA37443A86
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344588; cv=none; b=s41SpSG9hPh73AxoqR8Lyp+vbCXd+wDWCf9wDLxa9kcBHqBudW9pZauP+5dqaAM5bUs5RbpVSrVAWBhGHbe8TpWqdQ5T0TE9UjjU08XAxMT7Buf2wQlW/RlQZO+0bed0/xIQTGD5TLswrKgxEPdUMPuJAgfRpOGAzZvCHZcDmas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344588; c=relaxed/simple;
	bh=fS3V3BGXA2tO1x2vx31WL0Npme+1qzuAanXx2mjT4UA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NpFnM4NEQGGzydbyjtqBb2R9jEUk4gfgiSCdgAkzDXm6f0+s0G/Ff8vKLFr+mD8UNXLA3oA89VQo//K3Ih0PnmAIc4sFC253h5Gh4GoItYgysMu8utsALlGj5+xTtf5TE83SNlqr4PVlCetccj6XIIm+iM6mLi2/Z6nj+QUTovk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n13n6WcO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jveUphAA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n13n6WcO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jveUphAA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829MrXA1143009
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:22:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfgP/DBP0RIbDcb5reJJer4RlTs0vVSXQT37ojTBPrE=; b=n13n6WcOrqcMH0pV
	VXZ+c71qzL1ninDs884OrMavwDfVkvGEpPnrQlq24YpjMYEz651qjMyACusd3Yjc
	xBMvYNIOdELza5amszUBCIT3K+R0UxSJEcTp2IWMSIolEnmoQlgYQx4MD+Q4FyBH
	oThs0vNvTl4AaxkoGExylHgpThmmSDVekPUzOApMpWPTbvIRLQSfJsb20+TgKsy0
	H14SnqYJ88VUM1ivy2DDococ7pYP+KRnP3cc/IiwAfIW++Fcv9fQgOCbPRaSdqle
	COZLjnz977C8kShkP/BnTVl7gV1yge+l6sWhEP7ZlZva5WCHNWjTOLfc4mxk3mbG
	qvyBow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge37j3cks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:22:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3968dfff779so1357987a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344573; x=1788949373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfgP/DBP0RIbDcb5reJJer4RlTs0vVSXQT37ojTBPrE=;
        b=jveUphAAIHxuJJP4XWEmmPkfkkxNugDUumB6UeeqLU75oKanwNh9y98Dy0nmoNRV/+
         DBL5kMe/qwWD+hIIkJ4urDSdkVKIDcUpUXT2pKOBvBB5hlU1dmBd9oP4So40XFfmgvzH
         p/v3zsf6snzcmAnQCVzald9v01NBJNkz1GOec3Vt9BQ4mM93jXU9hsMnojsPqcXJLHAs
         /5XK0Oz6rq7OsYZQxWvDFfOO+VOFIlXPPzabb7lQWO3vZkjL0imKzGpYytxD+TRV11jW
         IVHpcp7unP3V2a8LiOhapMwxuwqpL34j2SV5bCyelaysR38kpBvvQztG6hDpiaDW0goO
         jheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344573; x=1788949373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PfgP/DBP0RIbDcb5reJJer4RlTs0vVSXQT37ojTBPrE=;
        b=UGF9QCU52gcqKG1Oayjg+XRFZhc/DJUmjgWcg0e2+cd78+SDhI1usRadFNhyblNo6L
         toCxUq5z1xx04YE4HEZECeFCP30jYgat5FDRh/dbVP4RgWMCjFi6Q+OKQiALooyfjGQc
         vBNNIBCaDpflhTidi0dZuF8HobHwpbB6RJ/8kadWgDMI7BAVF4Pev9eFU4EHMokndr3T
         3UgMHmfi6CdBFlpEc0A9483jqEZNf3rB86Lw+V91egkOjnsMLAIpZ3btN8E+XsUpNGcS
         xQOHoIdJGkFobKC/1H7MLAe81y5peZGw+XWwyEaM79loj+2kNtjMa03D2As6DseumrOi
         AgMw==
X-Gm-Message-State: AFuF++mIxaDS58DK4fYTTSvbZmcPmcOaN7rE1z+npk2n8j6b0HDVtmO6
	UQsxYHqmMCICaQHrFU4JtNiLtuIFq/qD/wGM6gu9dtsOh//x/hT4jbYXkQ9tzIduxurPT+krzer
	g/I+Pci7ygDKzza5qKZVIQYiii8aodyd0jdBAL/TrchBaTGg5xEYC5mbBQt0RwgGACY7J
X-Gm-Gg: AYBFou1S3K4gaBNFMmMRJFkpAPx5tPHKfLJHTeDDIyfDo6jccIdGjr8NVAeeaEv1gPb
	uvP15QIvxCjbN39G3634rj5ovLcZMDj0laKFNVRQCMePsNk/CN4TwIsS6ChAPcxUaZmr9WYEBk8
	3BMxtcC09FaMbspIw8AXDeTgkOMHke3bsrhro5KGm2EkCFa0PXM5QrlRvRVwYHYUO6pPafEG/X+
	16qSAwRGCQ0seQPO6RUEhQmyVtzZf8K1OKzrmBMn/naWa64ZD+8gppMopIcKF0wciFVrfXLBF27
	vvUMR4shOwp7MRUiQB5Op+e/kT7ifTEWi5igRIrNG7Fxcos2FLW/BAlJrxRqRqKZR0TZTJsRoDB
	lu3thhU0CkB4pYwdV0unJVG0P5Z46JxnCt/X1EtVk+I0=
X-Received: by 2002:a17:90b:5890:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39af64db294mr2354069a91.24.1788344573019;
        Wed, 02 Sep 2026 03:22:53 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39af64db294mr2354033a91.24.1788344572568;
        Wed, 02 Sep 2026 03:22:52 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079c0530sm5054861eec.3.2026.09.02.03.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:22:51 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 03:22:50 -0700
Subject: [PATCH v3 3/3] arm64: dts: qcom: ipq5018: Enable mdio1 and add
 QCA8081 PHY on rdp432-c2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-qcom_ipq5018_mdio_pinctrl-v3-3-629c7bb05c44@oss.qualcomm.com>
References: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
In-Reply-To: <20260902-qcom_ipq5018_mdio_pinctrl-v3-0-629c7bb05c44@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788344568; l=924;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=fS3V3BGXA2tO1x2vx31WL0Npme+1qzuAanXx2mjT4UA=;
 b=lqcytDa/xshZdY5AJhA3IsC+fTgNZqHOQ04ub1LaNUVvfciNS93VZcBcG7/7LXvw6cQ68mof+
 z257LmwnatwArkyzYBZAo4q77uHj3NuMSvz9SGFJY0Lhk9isEp3WF0g
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: OOxD5_UU9Hp1uA1LG7HFpgCpWr3N8DCT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfXyrFdraCPcHxf
 zQwcvjmzLaI/hcVN77YfB0L3TD4TF71+FlOz7KGM33MMY7zVWrAg/XA8UyU9vwHCarSBEJl4Php
 q9P03KRg1wK2EZEKk8LyHNkx5RIqshE=
X-Proofpoint-ORIG-GUID: OOxD5_UU9Hp1uA1LG7HFpgCpWr3N8DCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MSBTYWx0ZWRfXycQZRnuov9SR
 DsvM0FsJY+uIfR2cHRrr5rxILaqq6k/8mkMp4tbWwh+uVnSSTr1UKtD+QgAM2mO8EOvpNAsJom0
 uYo2P9pWtB/RChUC5GUpgvgv1cOgfOTs6e+4a1+2hZdN3sl9W9Gy5dhvby48Ffz4jemTjuYgyAG
 79aPA+qu7hx8ZNq1z8V8nJZlz4wBIz/b5M7d6PUWueP4vd4vbYDTJYvuzdAC2x9D+3Lz3ZC4b0D
 FLJOWZ7ot240WVka+zc8IJsnRTniOk+Llfd2OfpfUnrAM3Trs5Oghoa2I+15NHctQXFeYsJYZ5x
 GUl1IqeoImuXm7gonPnhKtQtC7FsysPWF4x5gIymwIuEcdUGjND7bGHBG22ZlSS2oDO1BvyUAIL
 9TpNcpbd18OezLplXLiKkRfvNJmJHeNLBelWpgBF63r512UentVO4rtjNLnNc+WSuhmh+13u9oJ
 Lu/17NmxxOZN2PqrABw==
X-Authority-Analysis: v=2.4 cv=PKg/P/qC c=1 sm=1 tr=0 ts=6a97f8fd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mKqJttMW3klxcx8NO6gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020091

The RDP432-c2 board uses an external QCA8081 PHY on mdio1 for one
of its Ethernet connections, but mdio1 is left disabled at the
board level. Enable mdio1 with a 6.25MHz MDIO clock and describe
the QCA8081 PHY at address 0x1c.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index 33eef92b19b1..34d4a0886356 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -30,6 +30,16 @@ &blsp1_uart1 {
 	status = "okay";
 };
 
+&mdio1 {
+	clock-frequency = <6250000>;
+
+	status = "okay";
+
+	ethernet-phy@1c {
+		reg = <0x1c>;
+	};
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";

-- 
2.43.0

