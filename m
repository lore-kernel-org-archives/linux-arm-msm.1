Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4733E4A13AD
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047038; cv=none; b=bwPx+ToiHrQJeFG2BqYtS1fwBVHl9Na++6CjrDccP5Q0VLJPxylt/i1L9yd18lOHOdWbQ+ISEYJD339H1QJ8XeDggym0E5frk3T8RyK3n79pcqOa8HJ52qBHPe3DKL9W64Oe33Wsrg6lGPeDd1nTsthFmgklmZ69XPE8eV6mGDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047038; c=relaxed/simple;
	bh=Jb86lq2W/qVjcMbz9A4WlBbHi6Z7bIdD1OC/4rQLyOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1UpFkVYgfWzV3A6/oGTaYSyKKIn/5ZkZv4TVdwPWNP2dCqANIj/9j7CTj0IHvuFikJc+S7HTHqWGwtM0lXihIaVbA7b8KVEBltJc5+8eWXoBdSSZMiztsTdDWA11pH4I30BTDCNsraiyRwR5q+T9IRIdpVl/J1UJyL4QJj+u1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZphqWBWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LniaXtTM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZphqWBWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LniaXtTM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7rOI1087181
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJV3R+HjxmPeP1DdDIQAfSy9nCn4FRqlXu72kfIUZXE=; b=ZphqWBWJwyFcIl2U
	E2kBiEN9yJXfV6jt6dFLTEcDyqy3CTA8Q74NkVXMn6aKTxql6+3NgWJ56oO9eCug
	c6StLOwuuF0vzYNlbrdCOJT91jl8zRdd/tVzsAxgD2E119stgViFyaO2rFg3Q813
	FpPZ07tfxvVTRZVjI17C8OpxqZY8rS3Vx1/AjTIJDL5W/iYK4/cPLJstB87CYYG8
	AhUjdbNG2wrUBv9PzzY/qGiuNlSKY5h9TX19j1b0dDB4h/eNPOkp2DoXUW7GivrY
	QugrmvkI5pJBQ/hydK6L/Mi2t121jQmMn3xSuxgW5h/6LFJkzNsnWbgxnHC0Ep28
	BJOBMQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg43gt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:30:34 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4fa572ba2so4904122a34.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047034; x=1789651834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJV3R+HjxmPeP1DdDIQAfSy9nCn4FRqlXu72kfIUZXE=;
        b=LniaXtTMJ+4cxy8Pzogy3eO2VkUtgBor6+/xazLaUHt3ZvUueYkvmijhGDzOR2GIqA
         Bf6NLshmwIhqMFR38c3baDX63dP+wqp/UT12N7Ybi1t84lPtg6tWc2CfL3d4tZOwf9ZQ
         oM21WMfPrk8SmpLV6oGUthrN45Ci9YHl30yfhcECMgap1pyLIf7u2sFwZOEwnkd85f2p
         uXqYCciJ5mfsLydHjWMdqZODsdnVbJwV+nF0QfILQzGMLCyMOeEpV6d3AnQ8akq0zMBi
         8Src6ewQO44vY7gyfIoSDJdS9RfOA7+nomv4Ia1fdZ9kCGS66raK9yAcVCeM5jNqpfI6
         sE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047034; x=1789651834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJV3R+HjxmPeP1DdDIQAfSy9nCn4FRqlXu72kfIUZXE=;
        b=fS1ic11mLBzCthfCRHAzgJB/Op2l8Gt0QKjXOS4jNdgb68ufep6Ii7n4I/u67sc40J
         DFwxXR18VKOr7kJtTNHde6ljdh1kMNzumdJ8j8IeHaDZptI0+sB54M1cFjmvyEkEdlKc
         MkFO3O1cQV+F6JEvYGZSqHfSvys1S9DgjX3aCNS85YviVOWT6ChXRH5BPnL8rIdDEXHn
         x+NDxqdSSLnOgvJ20xR83+L4KPNV75ZELOksWW5kmj7jEDal3LModv2MENu4t89DKP+T
         uL/qDwe/uy4xZmfwVM1lbEgxIdSHHMze0F0l5E6zJE4dJxi8E9oaFc7naVWsgSHHXqcY
         fdfw==
X-Forwarded-Encrypted: i=1; AKwUvBwkxFx4Knod12XhgJkhZaI1iiS6m0yFj5HcCQC4CJX22MfWv0hbniIhdQ3MecYcmp+xY/+ux+f7Vay3+SwQ@vger.kernel.org
X-Gm-Message-State: AFuF++kdRXzkwMXuJh/ZldcQCwF6lTjCJRpvY9N/7tYnhlCp1EVLz3cR
	SHNhWLX+w1zxf3FYFoOYuqSmD+LjANrCyXzP2T1R3jdOho6Tg5E/TIU+BkgGZsRsx5RuIgdYNoG
	tYGdVFkhkKlfbDmgUdeP8tjRvdTDanYJ7s7UaEkqIqfS8mBcQasCymZ7Xhon+I5LTLiDeamvu77
	En
X-Gm-Gg: AYBFou2DytcJRDHdZTbtBwMy7fr3vxnk3VlCAqyRH3Bufwki8Ss/6UM227krmQ8gwFF
	2ncjfuUEKFoKuHV1LHGHJAPLZpKTv97Y9Edz0MMHaAInWgcMOBVBFxAz71IcCq7tlHNZH9sqYjK
	OWe4F0NsjkmwF3TjZva1CdZ9XIAyFEuhinHyMJOCszhMmNN/u1XMElvWuu7hII0G8S/KQ1Zap7/
	ZZYoZQMpjqZpy1IElFXqT8IrLrg8SCbldPXGG4iONbKJhHKx6yGNTl91YEw7fckCLyjde4CLEqU
	1W4XtZYIfkUp+4EdVnQaNBgJVYHKcNoa0nN9huW9zzHSXwiT1ET4ICTSVHX1J2/WI8N6u0fAdVb
	OEb75OH7W0MlkKNPbhaah02CKZsEbMo1PimE=
X-Received: by 2002:a05:6820:2916:b0:6b7:46e9:970c with SMTP id 006d021491bc7-6b746e9a2f0mr19748235eaf.60.1789047034242;
        Thu, 10 Sep 2026 06:30:34 -0700 (PDT)
X-Received: by 2002:a05:6820:2916:b0:6b7:46e9:970c with SMTP id 006d021491bc7-6b746e9a2f0mr19748207eaf.60.1789047033852;
        Thu, 10 Sep 2026 06:30:33 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:30:33 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:09 +0530
Subject: [PATCH 20/34] arm64: dts: qcom: qcs6490-vicharak-axon-mini: Move
 PCIe phy and GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-20-90a252ddbbfa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=1823;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=Jb86lq2W/qVjcMbz9A4WlBbHi6Z7bIdD1OC/4rQLyOE=;
 b=ilhcRFeQHiTl2P/3hDAHsWGvrpOnTqKP5TU6HgrB5K/gvAayrkowPkVhX05vH1KUsM9veabix
 E91HW/AUYreB1EAUleTWrOVb4NpoxoJoMIW/d46buEYcgXfMoN8+BiJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=Vu62kO2n c=1 sm=1 tr=0 ts=6aa2b0fa cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_k9ig2nQFDp-gxZIyLcA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: Y4Jb00WWmYdXabO5OHaUFeZZbegxnwyN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfX8BOmYQX+SdY1
 /O9UJvR5g1Dda6FKyVxhWjLba5Buyybih0hqofkFFzOCEzsbej1LGhfc41xX5OtaEE2YU4K1pLr
 znUZBvlkA4iLQi4er4F+EXGSGtG9jezb/60up8bFxzXYhprw0O7mZetifzMynf3vu7VY1Cu6cto
 KNm0L1/smGO7S9Y2H1UVhJ/FUEZduTa+4ZMcTPdGBFSbZsaKJBh0fa/p2QE/mL7kosN6UH7OG3b
 Vd7diz/68n+H1n1+smWjMeDL/42WGHr+dirWrDwau3fTgFbsoEVI0yVqh41ZU2JdEzR6jWeRmYU
 B/HtU3GflwLq+JAdxoeXqM6f57QUJqayCs0FS1la0uyhjJESqKIoR5j/53cwY/NLWeq7UpuVZxT
 IDAxDKL8MM+lSEJdZifra3Vk5uUsdxiyKwjQ9lzM77msf2ZLO3qFFpXECvCpNTpxuF22VW0nLu6
 8WByDMErI4P9TC/FY7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MCBTYWx0ZWRfX/KpOq1d/A+uG
 e3D90qXyxKDkAoYePjruNXYhIUCYy0ZPFuR962759u1FMSqcNgv4R61XAd0/x51Q5ZgqUttaD9Q
 1gqCZRvSiZzlptFY28lMfa0Uv1wFLp4=
X-Proofpoint-ORIG-GUID: Y4Jb00WWmYdXabO5OHaUFeZZbegxnwyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100160

The perst/wake GPIO properties are per root port and belong in the
root port node, not in the RC controller node. Move perst-gpios/
wake-gpios from the &pcie0/&pcie1 controller overrides to the
respective &pcie0_port/&pcie1_port0 nodes, renaming perst-gpios to
reset-gpios to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
index 141d263e6566..89fb685c53cc 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-vicharak-axon-mini.dts
@@ -652,15 +652,17 @@ &ice {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_clkreq_n>, <&pcie0_reset_n>, <&pcie0_wake_n>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie0_port {
+	reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l10c_0p88>;
 	vdda-pll-supply = <&vreg_l6b_1p2>;
@@ -669,9 +671,6 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_reset_n>, <&pcie1_wake_n>, <&pcie1_clkreq_n>;
 	pinctrl-names = "default";
 
@@ -685,6 +684,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+};
+
 &pm7250b_adc {
 	channel@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;

-- 
2.34.1

