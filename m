Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794497810;
	b=gimizLWA25B1y4onOJPAKvPrtX7EazVtuoUnUWBLBsrmXIW11Pq3CQXzdXUkW4qU/qaT
	 Yljn2CAw1nHybgawFBI1UYXQoavptUYj69Gt4t2HivxjiQcEHZcOB+eLXfLikXm0owxSi
	 9TSRt/0vcaFkXHCPc31wO9zWT8qn/RbI8eSz+eFLEX3TShmR3HwpZrwWPhtZEza8MLQuE
	 a98udivTkvc8o6NsuaYRlCJ/lZBI9s5zSnR5v0tpB81Yv5ceOX8FHInhow3er/qedTI1l
	 W1BIzQ3/Pna2NgDUmssZdCgajblqcflmTqp3ffS/7E8U7GN1NYhaE6SKLoDgsJsT8Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794497810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=;
	b=Tduqn99dORR89T8IWp8yfQ8vsUY9DdvCu4wt/fTWiorg6erC9q+XXMz21d3tL0zYQ3nQ
	 Vwf3WtyWt5iD7AS9kZOu1rePcdMmgauiX94cVAgsPG/CbYaZMV+OsvN4YaYiB7hXweit1
	 3yI6NZXQvFk+ATB0Bcki2ObyZhGKd4akzjT0tJB9jfmh9hzRplK3p21sgrwhPNyxmhieN
	 NLdm4wetr5A/IUfIG541SP2zriY8waS+7o4/POe2hdlEYPMdJKCrELqwHZwuPIwLttYLR
	 JGpZZDNzYNspZXlVCpWeKGeg2LoG+9W7cI9goTPRIDErfvnf8uNYWtsgES8EQgQVAjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bH0ZZBbw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivQLuG8I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAA9606A898
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEAA9606A898
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bH0ZZBbw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivQLuG8I
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZClW2593491
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=; b=bH0ZZBbwFAtooZ6+
	aUvXug+ZyNhrwWkGVectFsOPazk2nJo1XbmVYJP9qkLXebpbyYil/xlmKsWCfZej
	dCLQcXspY13eJ/VR5QkpMNVBXfuPCA5WZq3dPjQ9BE6Cc3r+gSGhGNVTDxEZanxp
	6Wmc9IqIA0XDazAheDnHc7wZFlWwBMgNEmNwOeKc+Jafy7UN19315ZRI2UXzgIxx
	7C7h0BiMqdgOiDX0Nzfe9U71wRwbP+z/fG9r2YaKPa1LMEIeH/e0LU4vxgkTsXp4
	Dju4ZmeiPrznfc8JJzuRre+w3tO7s9IHyVu4KAyAw5D56uO017IQt6HhHiaRHzdK
	0TGUyA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx311kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 15:36:49 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99076c676cbso782022241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794497808; x=1795102608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=;
        b=ivQLuG8I0QFJH0JGM2PdO5B+Xy5Bxm1lXM7ZNkLjPu8Ono7nh5flL1+WagJzfH6ZN9
         1jt2RQqqRVwIfdIiI4nFuxhWGwBkXW+n/NORh64j8a+tpbMQTDEXM0w1RCiWN6oKPfKi
         Xeu59U0293/t5iw1uWj2EvnEelTCkxojjasBC3z5IQM0Z15pxTPGoqK7+JGgVGGZpNWf
         Rw7mtuLeaozF3OW8BGQpyFCgE2sTH/1gRp8NZ0VWkdCFMhBUKM/2dqYTDpX9K3+HBnFw
         nJyHBOqOIwN093d5TrD0WdfJTdW2PRGBhwrehwZqzJjc/+vHOuLRtmPpidZCgtiyixTx
         /qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794497808; x=1795102608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5o0W5j75J312TRJZEeDeuGSiHrZG94Q7/QvaFifJOmk=;
        b=t0y4ld5oMdbY+viuFKoXy1jmeappSFfiPubU5gtBKy14n6p1sdDWCGX4WlC15EJy4C
         hn3KU8RwmrpFhBW1neeME7FQ6q1P0y6IO2ZpwByKnZ5JE70MgxINSuvYsCuGIdLlHV9k
         qIoWTkJjc3bCOiL3Bdfufo3sTTpmcr2u/8Yp4K3j5js0HQ9D7h5xbal1tk3UzBHrST2j
         a8Mxq80j8Y4yWyABW3N9ALSXjR1GjA7o245UCil1Hv96MhMIsL0gxupe8ksGLHgo9SVi
         Aw1MejJrpk00NOgY0QP4wVuf3WLzMooSxqPf0HAWM7TRJ9GvRVU3LoG47gT25PtZ0cPp
         R8hw==
X-Gm-Message-State: APuU4Z/XZr82lpaCHqZT1xi73mY1EGjCrmRkHY+DxJIJQ/axqaT8oz6W
	P/gRv6sWKgmr+o6R/94D51KnetVOn/ZnJ0oRQzwx4bKTJavxL6klTqzlKr979m73OdRtLHIhtCZ
	qlzkv8CibKcgumSzAtZuv6WlilRB5KiMBxy6nNYyJ6gHJ+UedQ/0KL6FAXeKJnX2c/mBl
X-Gm-Gg: AYBFou1TVBWhmTx20QiEbZKPzn2J7KMlJgz2A7KoSkBjFWXW113kQ4r31VxD25lgFVQ
	tT8PXntUBSZLKmnkjoCPbsTw9L8WGR8RpaP1cns0suQrQqnpvCWhnRhI7xumluSALJb+FL3Xu3N
	ppZUe9Q4wgH+LULB4R52lIO+ygYQxbUK99GpuxyI9od60c6s/rrHwz9PMHnBwYba3yPN8k7Duf8
	cuK1EgGN5k3hzNeg5WGMqAZoAzz44VwesHMfG3DLTd0xJopq+G/kxkU/sfDen7/emrxPNTQx46f
	aErN7guW/VsMXYj0/zXkrn4BT9zd2rdF0sHkxJBYH5SIRdXBIuYkeQgcY+68jmSUVrQeH/I3vWC
	IPBw3oUZpTQMvFX9QG/tnu0QTb1GmkMDk2UURypHrIXV2VDZ8ngOrWhM2ixnLmam52mscGG/gaD
	5WPw==
X-Received: by 2002:a05:6102:418c:b0:7d2:7f93:7708 with SMTP id ada2fe7eead31-7d4fb2c2e29mr2099513137.8.1794497808155;
        Thu, 12 Nov 2026 07:36:48 -0800 (PST)
X-Received: by 2002:a05:6102:418c:b0:7d2:7f93:7708 with SMTP id ada2fe7eead31-7d4fb2c2e29mr2099502137.8.1794497807693;
        Thu, 12 Nov 2026 07:36:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba09536ebfsm138353235e9.5.2026.11.12.07.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:36:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 16:36:39 +0100
Subject: [PATCH v2 2/3] dt-bindings: phy: qcom,snps-eusb2-phy: Add Nord bus
 clock
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
Message-Id: <20261112-qcom-nord-ahb2phy-clk-v2-2-30ad3d947217@oss.qualcomm.com>
References: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
In-Reply-To: <20261112-qcom-nord-ahb2phy-clk-v2-0-30ad3d947217@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2593;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P2V+JNK6+l1UtqbbRQrYDDi6Drwba1YCgJEpyneVFMg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9d0I6t40xtjdl+V+j7iVm5y8G3QJhQgQiKuyb
 hBTtNqP0DqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXdCAAKCRAFnS7L/zaE
 w4ZmD/wMCXWaCFC9VAweSsB8FI/e0bIqdjmRpNlodYp/YPRkCeGqFuia7xy37qYNm+u73hfriRE
 hNTahZzVjpooPaJfPy974giG3artxayNeKbY0k1JrmbriqL0NkFG8MCMvYo5GKJ7yRrttD5B59R
 AfG1P3JOWA7kasQiexiDIfzhvyc4XImEOQ6d3JS51iJegHtLC1PjCACWx4OVyL6Yjrdc7prUNcG
 5gmpq40zypC+yxSNgoCTg9PPacuEw9libt6weqeB5KlY6ad6wFN6TsuXVjXvmAB1W/triFS1PrW
 07XzzSdMLshPntyqBNDAcirhmf7unN+2QCqfeaxXaqYntqi8HAfXUt9LcriLGyYYNwgScsssO4g
 jdwLUsFyBvLyJ+rOrqfiwbcb1hLxK2B86nSv8bY3gPp+NxVJndqsSCI4wqIisHr/FkkLdhN7Sh2
 0aiTHq3llXqjQaQYOvNDrmZOzB74f0B0Lkfd0/WoTAN2hGNfLnuP6mJDZITi6QrRSJzDm3D1sZL
 qi9IvhrLogEfPEAeXk4iRmzwTvXeZEkDz1qTqptcJacHDl9Nvxd9aTsz9jRmZk0QhZrg+WFogvW
 I80EX9CT452JASeY4eatTRCzNRghDk7c87XgX2/3f9bEiCj3T9QzMf2f6ZBs7m9iu8KssYWeQx2
 G5YAexuE/58Dsmg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af5dd11 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=tP9VjBngxETQ9kDmeHQA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX9Nr8Sm5Gwq24
 CjtIrth3mNf3zWwOtk3KUnOW67h1XARDwDMEti4BYZGIhlxCgxyMy1G7C4tzlLhQ20T/LBt8WI+
 Gkh+oTw2T6AbokIdiSfdv7chN3p+VSQO8B7gmDA57sN4A62iLH5r4JAfUPfwMtXAsvlYDxCykey
 NxWbRSAxlTUhBg0fZ3jTPckAeCOLHhjuUfb5L0vrcpftfyeBtX0sOTX2DW1EKDhAMAcHXWWzFN5
 7QS8NTnd42mMFbZDJKf0KyAoiFTzhSW9fixfctWuKrdQn9xjIsXcWHqC3jRlP9fmTSaztD9pLNM
 JCDs4hx9NFyb3I0eyYttNS67EfE34oj5o9OM/x5iP5VF82RUq4hNKt+7B0bTX3aKnq7XA2xwkAs
 qafzRocDfI1Fr2BXhy4aKUHzxdHHYOTHlhvDpMU6zFQWi77SuBzan20+dvpC8eTZBajHvRlervU
 x75sbYq0mci7M1Y6xAQ==
X-Proofpoint-ORIG-GUID: TPFRdn-De0I2Des5BG5kgtqFz5QBQkqp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2MiBTYWx0ZWRfX6Z69NGb1XQe2
 G4yIzsL4rVn/HccPyjGew39QGSJXHEsqazBgqUEQCY86Zh7gPCD5323sL/6xP+NVyQceWZYhhNo
 cuEQTKC8TBWOox4aWLBvOufUryQKbz4=
X-Proofpoint-GUID: TPFRdn-De0I2Des5BG5kgtqFz5QBQkqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120062

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

On Nord, the eUSB2 PHY registers are reached through the AHB2PHY_0
bridge, which is gated by NE_GCC_AHB2PHY_CLK. Allow an optional
second "bus" clock for the AHB2PHY bridge, require it for
qcom,nord-snps-eusb2-phy, and keep other compatibles at the single
"ref" clock. Since the Nord PHY needs the second bus clock, it's not
really compatible with sm8550 so drop the fall-back. This is fine as no
DT source uses it yet.

Fixes: 4d1f3875f328 ("dt-bindings: phy: qcom,snps-eusb2-phy: Document the Nord eUSB2 PHY")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
[Bartosz: don't use the "qcom,sm8550-snps-eusb2-phy" fallback]
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,snps-eusb2-phy.yaml          | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 931cd0e7d297e..fbea2129939f9 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,13 +19,13 @@ properties:
           - enum:
               - qcom,eliza-snps-eusb2-phy
               - qcom,milos-snps-eusb2-phy
-              - qcom,nord-snps-eusb2-phy
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
       - const: qcom,sm8550-snps-eusb2-phy
+      - const: qcom,nord-snps-eusb2-phy
 
   reg:
     maxItems: 1
@@ -34,12 +34,16 @@ properties:
     const: 0
 
   clocks:
+    minItems: 1
     items:
       - description: ref
+      - description: AHB2PHY bridge clock for register access
 
   clock-names:
+    minItems: 1
     items:
       - const: ref
+      - const: bus
 
   resets:
     maxItems: 1
@@ -77,6 +81,24 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,nord-snps-eusb2-phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:

-- 
2.47.3

