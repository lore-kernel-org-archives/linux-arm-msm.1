Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9204F364EB8
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 18:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788461653; cv=none; b=CYQ7fAI8XNf58qC8PGOg59b8X6JFZ9fx8RJ4U+S21L57ZSdXsbGxuxjIQjkpT/YmXkY+ExpCFJS8f/Wkw0Yoig+QY1Pv5ytipO+UjHb6dVe8ETzQfgMuYHtOuXaxzMu2aFZAdMxYKf1c7txzBcU74yEv88dh5Qe8Pj5jQVYmfIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788461653; c=relaxed/simple;
	bh=eZIUN/lYfehnQlzthxyb/UGydSLzCEUV422r4IFRfA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Do6PHF31l7MPFx+/nTXrNejLv2UCCtOckSKNm3h/N/9Rc1JsexRe1pcaR+a1qJXLaLRu3D+j0AWubC4/eScyO16FS/DOYuFDycsyeW9CmpjXmtSIh2j6TPq2NubHEeDawV5vVUlDOq4Mg0EFJke2qZ+XjAGSdS3ITBLa5uCh2GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WqyiFDsb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IM8krRj2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WqyiFDsb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IM8krRj2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3XoP1430734
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 18:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=; b=WqyiFDsb1eWDZKId
	NODY7STdeeFa9Dzz5GOt/I6NOzR88CxjuimoDCw/cOwtphA7NyMRmQ0d+YoNAHU/
	aoH4rspWjkNmuxUgaXiiTnW+2KxHI519tqNvxIK02z+5dwzVTTcVKr40kT/gzGbY
	2XwCq9QNWHj7VHJaSb7BT2kM1QaDgAaCecy4yUPUWmd1xk49R+tAl8p2kU7o0mEC
	Ug7xOhHWVb2kmknb0mHNYlEC2RlpCRCaRdJgFgjwQLM4Y/OQL6+RigIcStGqyJx7
	V8nSt/NJ9qNkYx3+C2Fkwj41W3epOf6FgC6qZ6j+P27MTA3CTkivsRCRKSiu04eE
	7uCIUg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4kkfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 18:54:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso138420a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788461644; x=1789066444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=;
        b=IM8krRj2ST59du7pn6Qgg7K9wsxwSqjOPEKpkxIoFxa7o6y39Pfl27toQSEfeAXeeB
         UcTeM/sWR68vARKrQZ6fhrAO9zPKVvsxxoB81ETgZ7sVSciLRkdHpEeFKQDjd9rC1p93
         D94EAIJDB6cIJeQu5VKEwRAl+1LYxdpCxpPcR0VpzgmoYihSGsNapUom2dJ+4F58KB7m
         Um5f0hmJ+EKiliOU2q0T9OP7BBYYAzMtvjEKOXCYH3vAgFD7RAAgqDDnSyduvHWjU16r
         OFHj6dwCoOYApO5TFuLqbyEcUMhK8KkonvYZ7V1oV4yIkRrTDKraS1kFYbRQ8LvslAYT
         TTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788461644; x=1789066444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbfjPo2s6iAx/iJD/jmcJcwK+bjVeCVPpo0oSlaiXmo=;
        b=M28NTCjGvTIZdwPGiPJKQRzDfyCUaRilp3UBZqi0tUEZvKZ/U/xbaEb5xCGS5TPH+A
         KTHiN2G7LS+3eXYxXcjP5u/ETASzEFbUAd14nL8Jq1u3BZRc0KtPUbQ0i3kQWTu1wzp+
         pPc/Z8RHQqn5aldR3U2d5eWuYLF0PMjTIeIZpHh0KX50KJaZI90ADSqM5uCfB3I1UjXC
         Ce04mH1H3UENomCSN6VtVzcIMoPGrXMA6DCyQ/brr2AFb9uI/s1WWeP0gFPv+9RTi8fl
         yB0mnE1l4R/qE8FMPxpau2HOTb7pNQd6oc5QmQIANsNMkCgpla42QlRX4FqVoYj9BoP5
         x5Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwGraux64oaBPqKOMGw8q32L68E8GQYnfpGbM0Td5eaijnhWvHTrZtsOPNHsvgtfmF6n15CYbSLd9vpapf7@vger.kernel.org
X-Gm-Message-State: AFuF++lJbpgVzfoErxydDlKuuShfxP7oXWR5xP+oOIK5PQy6PGorBRX9
	Fp9/QX72pY3e0/R+X9ZCv6oR8CavCIbiWOdeDEGe+ZDRbwGqhhApVObntPL8XJfYrtlYIhJir9J
	nDS/aGwuccSQzMYsySi1ym1f0gU/0dH+92RFrk5/OSwirymMemVTrrMojgGdn2ppPCc+v
X-Gm-Gg: AYBFou2PrnXhYXcmax3PIhikdd9WKX+2V1Sz1xAlhVP8O2OhKDWuhLruR8qQPKfe43o
	Q2/TvCSIkkRhoGYcqQic8XCPGC4oLdj5PTuXjUt2/mGTn+SrVJAgEZptVPStqyJLGM1U9dhHabM
	/Ewxyiql48jQUJQLucd92UhpOdgg3UZUSW8niPEw65fen2OuZiqILctuh3tNX4cqb37vraFXczW
	wWEfsK9tUfFdqjh4nGlYQOV8KTDJqVzU7Jmgio10y12kIR0TAaCiAAWPGeFRbcd/iBD42lQobqb
	iXaq0D9dC2YujjN4zbjthWAZDxRaVt6SVU+LBJaj21Zkgk1GXJMwFXQiYe3wOxdBGTpt/1exMZm
	YuwB9iW3/YKY5si+lEmxDY/6sa29jvw==
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr682058a91.11.1788461644259;
        Thu, 03 Sep 2026 11:54:04 -0700 (PDT)
X-Received: by 2002:a17:90b:17d2:b0:380:f389:447b with SMTP id 98e67ed59e1d1-39b2613e70emr681984a91.11.1788461643675;
        Thu, 03 Sep 2026 11:54:03 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885ce1csm778829eec.4.2026.09.03.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:54:03 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 00:13:43 +0530
Subject: [PATCH net-next 1/9] dt-bindings: net: ti,dp83867: add supply
 properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-shikra_ethernet-v1-1-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
In-Reply-To: <20260904-shikra_ethernet-v1-0-a50765996035@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788461628; l=1977;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=eZIUN/lYfehnQlzthxyb/UGydSLzCEUV422r4IFRfA0=;
 b=9YV5GbivqWa07EmRXOblUJxRz9P53VISN5Z/yvnsGCNVx+EjFrU1+3n4+/WNFMnmaAwQEwuHW
 8v25iuStJetBoprE3T28uAmO9+1AnmsH0V42lDK1YK09J+0UkP6t/rF
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a99c24d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9lbML-Ic3bjincHAjDUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: soSDUy05LgbkLQzVnRxYjNU3pfHB3Vq7
X-Proofpoint-ORIG-GUID: soSDUy05LgbkLQzVnRxYjNU3pfHB3Vq7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfX7ire1302MIeT
 +v9GBMXtQYbSLBgN6NZuINnOTV5X/Si4IZZB9H12GpOqghcXJXc8AM8Cym7LHiyq3+YWLh7ct7O
 TAS6Q8rj+btE6w3FccP5CR98e45gs8g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NSBTYWx0ZWRfXymxvDWRfwOZH
 fTOURU0XdAUafcN4Zepi4z1AlWKZkneb9J/YOvwp/e8VEU1gu1YoSg4Zul3hNbz0Nxw32Mc+wP4
 4ZwVYB78w9ZtiE8EynCGmZsTIlyXq5noJ80yGmbJeXpVVa03XNjsyL0xMh4WDFH+L41jPnHs/aL
 iLPfPLAx0Y7LlngPZTGP55A384nKx/Y0YJZbBM/pYzd+Z9snv07wS1mGnJT89OCvZZRi0fl65Yx
 UDFiuFtn8dflGFso1MGGCbD3YPJ3sLJXa1SjE30pjleGgp+UNF0j2KyJns3Vcdkjxw9a8Aqk8S6
 AbE2hUTAWNnZkngghx0YRZKAblIYs/LQaiO9t0Lw+MYb7iZKuH+18UoEp7ZhHt2SD8EO4xpbTiv
 o/IivbBO11udilD2ofL2ZXJwdJUPM/G0cIgwHTzk2oMsOcDjkzElmyVWacwENqfg6bOFggFuGeX
 iPm+3ZW0VXXVfmCIbDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030165

The DP83867 PHY has four distinct power supplies:

  VDDA2P5 -- 2.5V analog supply
  VDD1P0  -- 1.0V digital supply
  VDDA1P8 -- 1.8V analog supply
  VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V

The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
configurations - "two-supply" and "three-supply".

  1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
     VDDA1P8 pins are left unconnected.
  2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
     connected.

VDDIO is a separate fourth supply present in both configurations. The
datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.

Some embedded board design expose a GPIO-controlled regulator to control
any one or more of these supplies. Therefore, document all four of the
available supply properties.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 4bc1f98fd9fe51260b767b0a1b8b7eaf974a9af9..e78f08ded3d0d449ab75bf33d814fd49587f8387 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -118,6 +118,20 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+  vdda-2p5-supply:
+    description: 2.5V analog supply (connected to the VDDA2P5 pins).
+
+  vdd-1p0-supply:
+    description: 1.0V digital core supply (connected to the VDD1P0 pins).
+
+  vdda-1p8-supply:
+    description: 1.8V analog supply (connected to the VDDA1P8 pins).
+
+  vddio-supply:
+    description: |
+      I/O supply (connected to the VDDIO pins). The supply can be 1.8V,
+      2.5V or 3.3V.
+
 required:
   - reg
 

-- 
2.34.1

