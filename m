Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E733DAAC4
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 04:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521419; cv=none; b=RFBoHmilm9npj7W7u6Yf8u/5X23R7YhAu6EJvCq2ptKv5kLmcc0BidjXpoCudF8TGnojyOmhDH7yqFow3xjwdI9DT79TrzwJL4SeDdhlPzouW+Dw49LRCfzxVrwzOMDRzd78M+pYJ5yWNCFQjMKml/oT8MO7y+pzOkId2JbyZv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521419; c=relaxed/simple;
	bh=r93Jb+RRci5KjslpMwSwutEV/c/USqhXg7qpdeh+1sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NbdFE4g7nWa6ZVfYC6cc+HvP+2zBCGkxab3AF0oNAX7qZclmzdPXDNFZP2anVJerR4yKCO6yih9q/sRck0SZ2NWX6qKlKVjc462Rbe06jTPofiMByQQWhalX4CVCZPOkKu5b7H6cvEMx8l1+mwyESGVQ1qzzN7acYmQNp7gGtfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H8b5JH3k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aa0yaW2L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H8b5JH3k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aa0yaW2L"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993H8Be1597937
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 04:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=; b=H8b5JH3kdUFu3rX3
	J1/WlCwX3W7DcbIX7TRwNpgbs61zSdd+Ee6/pxzXeJ/BJt26+rYQy17RzETjGJOi
	adp258z45EwZ/Fe4vTZ8Ve6jTKAGvZ62a4LGgurdeqP61kGchELtZ40GoNAnx77P
	XFiAk5yekJlOCyIdxQVFYdPo/JFrjAStkpVRcIH6qxMqw/i4F7LlnojPkgpo5Mo1
	EriKd2AFdmb/WaCvl7XPTJAXAFcGDe4xMU1Z1fDcz7bZ4MiV8fO+UcjnzXCChe+Y
	aXVee2jt7OXQtvmvmZtx0whMw75jK8gPZo25h3agEWZiUYBTbGE8Kvet33veqgnZ
	JkxzaQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6nufrqpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:50:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35158d674e1so2740675eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521417; x=1792126217; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=Aa0yaW2La18UR2/r+X0a0JOrdJScbmIX8/7D9Wpgqj8peouv4xv+SsYxxyMY3+CgWd
         U5wDvW2pMg9f1TT8W+BOJih1lOirc0CfCoa9YUnLbEM73rdkPaSsI8WsGgrAPrnZbu33
         EJ8oqeUhsSljYcADUC3+87PyFOh99rUR9rXh0kLTrg/P6KS+o6BNCtLwLsUirac77xMf
         AFPJhqjfdZvERrUAZ9PdJZOiguALffHjkMj6mEPETSX9oTorZ8VlOcoO6Q8cHC5jWPI3
         GE07lNjKz0Z0iZxjMDz3M5SGcC4xqGC0wZaglFufTyNDC4IdLMYwoxupY2I3vOjqSUig
         bAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521417; x=1792126217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrWr4WEEoDxY2QpPfvYR+d27cAyfCi80wCzqnJN1qlI=;
        b=Jts0zqWJrpyLlRQ515BsbNbLpgnpQ3F7bpK6/0HL+akx+TMSjXbKw2SQLYxHjBUpM8
         4vhQdWBAnmSaRNYgqM3INvlRbTH+dWryzmDAtX7EUkuHBsZba30rpaVt3/6VrTyhjoa8
         BGfrkyDrU3rwlp7ySs/5LJiKHj7UkgaSWEq049sxPdZlX86vEZMb8PdVmIstdLNDq4UR
         TfyZu/pWpYISpjwekZ6J8QK/+4UiqwxakVj86fyVqlYF07muA9W4UitXlYS9TieN+lLz
         io0FEMgAtl0ad6BeyHrbTeS4uAw76C7gSNKp0la7sIP/rVDb7ZCea6AFJEVD48T4jMwF
         oBeA==
X-Gm-Message-State: AFuF++mrRBYagM/Mve2qWc68TOk6CX91P9PK/J+GguRxaR8Yhp6jc1Je
	BXINhoZCmU837Pac1S4tm8szO+buB0d/LJHayDPu+L9eQoOCzkwrcvCa1iA+YNrX0Nx2JBzK3pe
	dcePNEzSByChfsoaFlY7chrx1Z6r+h1ZrJH83c2wspm0Y3ORg+Ija9gxeu+Tj837cLmQj
X-Gm-Gg: AYBFou2o/n3UbdKCZobhZUn/BRgC3bWWSJjDk5hiqWVuq013Thvs26Di7oQHaMAJ+4s
	E94cgk3+XnLxaH6Dl4kAmfWfI/RIgJpjHk4tQp4VSg5qlSX2DnsHD5Tiru3HriBpMFFK0fN4jqP
	uy+FgWm6j//hms+sotEQfMJ0VACmIioN6B3rSKz1EjR6iogpPWOMI5mG0eSHA0rM+YPOL0sXcjp
	T23Xr3V+blh7NHwL+ppKMCU8g3mfmrViYGykQj1MivsNFAUuIZ6Wr1aXpOR4Pjn2mK2SnHk3G//
	RRQAOrIVTJDSPUPqZrYfcrbs6OfIfiJ2Mg53cCNQUr/sC2S211MZoooJ6L+dBkH3Efr7NDMIM0Z
	i3znFcF8i5kn+zUHaW3tv8qJ09Ciy7mFhMPSWcUJ52HEtw0QZgZnCSbogV49sZn+/M/YK9duP2h
	Nw04WlaVNZEP5cS/rg/PIvAXA3zT89xg==
X-Received: by 2002:a05:701b:4314:b0:166:862b:9bcc with SMTP id a92af1059eb24-16a5f01dfb5mr1176290c88.18.1791521417280;
        Thu, 08 Oct 2026 21:50:17 -0700 (PDT)
X-Received: by 2002:a05:701b:4314:b0:166:862b:9bcc with SMTP id a92af1059eb24-16a5f01dfb5mr1176261c88.18.1791521416787;
        Thu, 08 Oct 2026 21:50:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:16 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:56 +0530
Subject: [PATCH v6 2/6] dt-bindings: phy: qcom,usb-snps-femto-v2: Add
 IPQ9650 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-2-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=afn0Dhot c=1 sm=1 tr=0 ts=6ac87289 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JwZr8aepJa0OdLIFGX0A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX8TxOZNtd8hyt
 HBhtWok+etMdSFDntBUtixsfSevDPfqGiHwAcBETHhQjGNlIdYBf5cmJH4Ma2Xc5F3gfTCC5Fo2
 3aDvhI3lXGohYBRwzqLd9rASWLnk3SU=
X-Proofpoint-GUID: ziHGzroCoTbXq4yK0za3iUqDBzIlUbq6
X-Proofpoint-ORIG-GUID: ziHGzroCoTbXq4yK0za3iUqDBzIlUbq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfXzWmaZ3in939C
 aydhKufcXB1gD15z97+g9rK6IWVM3p74dJ22Y3isubVqQ/t5wLeMhECks6rVmWVmt9GG+P3/JHo
 OIjPNSOxajebGTS1RAXr1FX9NM0OJqgJjJB63+CNqjbV78PpsUao1FosTs/9TbQc+XqgKMKBc/g
 tJSn5D0lx0IvMuoJPK9TvHv6JbCg+eGzkGvhXiBjEJ3TpHDoYEqUpnP2KchLFTQ3zxFiHFQ14oq
 UzsBR/vNkWyYNxIbARVaRr10E+xlXVpBWG9oH+oAHTAhbjO6VIfxUTIF36XLQLdjnRuQdqsyOCd
 WM5KddzhB1Oy07Xta++VQ+ZG0wImxQWNR15+9xKf3c2fDIMz+o7WPokRPZyn6LxkUQ+C1WM7Oxa
 X4cRuA6OdnzRdj5k62HmG5cdwd4zEvLCwWY6XqsLG8wXxsguA5oBG6iAK9EXCiivjEJxBY5ssHH
 N+mBtpRrZ5NFO9XbFPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090019

Add qcom,ipq9650-usb-hs-phy to the list of supported compatibles.
Unlike the existing SoCs, IPQ9650 does not share a generic
"qcom,usb-snps-hs-*nm-phy" fallback, since it requires its own
tuning/override sequence, so list it as a standalone entry.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 661759b25064..db00f5a99d80 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -15,6 +15,8 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - qcom,ipq9650-usb-hs-phy
       - items:
           - enum:
               - qcom,sa8775p-usb-hs-phy

-- 
2.34.1

