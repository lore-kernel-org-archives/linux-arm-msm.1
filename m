Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB136F8F2
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144035; cv=none; b=gAjDv4CajKy7S+/tm+xJjb00fUgGnh97AoDHoJYh37ME1b6mg7yn8bFsXWKZF3LDdpSwSvQqKyH3T3VKgMYOqvL1buKFEfLFXZxaS1Pq7JCIbyW1GTgpQZ314eEqp/gvQ/E+W7HOWy9GtxaeP7pJIel0eW6LdfUrvkYFwBIoTkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144035; c=relaxed/simple;
	bh=wlc0vo8Hdh9jcDJqUc6YvRCT4ni3Jekq3t18gDFW0YQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ss+6j+m9udBVXbJ9YxDbmJLhyUkdTBviieNnXHcu/GEGPcUnursT7CtCOliq0/CAwvxiKPiFKLtCcFyEy4FvUGexdumzHbhnD6megvwWYTNnWT37m5qgj3vK1fU2taj1Zz25WcK+ODMCZQUzGHUGoNelLkLFdWOEIeRpCABC6VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eKqnF2tV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BHKgjfW7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eKqnF2tV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BHKgjfW7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JClD141374026
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HebUySxFjdW2NBVlZA79PsMtSdnbSUxeMjPShC4sBNo=; b=eKqnF2tVlKNlE0EL
	eXDfoUFkGALBB9Rn4GDpv6bw2f/qH4ABFPtuO7S8HgLWCLRRfUGLPen9h2QGsPhK
	qVw2eYu8ftHlnx9N6vrNWUnSVMlcHg534mgftXaxp2w4Nej+yDU4NFWiDixCWC7i
	ZdLDJCjePzc9eOfzs7lktjLUplBYOR0RWHv1WqhC7Fur8Bg843TbpnOQoq3AyUgm
	J76oQKqCnfg6M44tJs1vTjyqKponpe6q0WeUvzT1AZ3EBX4grz5ozp0+mQvA2gEy
	rOwJhQ557L6MGxcnzK+l9w9ojOiwvyVZjC+bnWcx2F37Rd4GAqRIrGThHhVnwaRc
	JY7qMw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm38m0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 12:53:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e62e3459fso116048485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787144032; x=1787748832; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HebUySxFjdW2NBVlZA79PsMtSdnbSUxeMjPShC4sBNo=;
        b=BHKgjfW7PCzuOXAgYzdWmTf9KPv0fa47eE3It+/BXEulrVqIDwnIw8lWzf/wqgc4Za
         N9DPfgbWc76b+zIeqeUG2rXzjREnw56LtvZqWgwjIMWdT1+nAi71YyUBJG8gn1EMXHq+
         18PvTUgV8vAhH4+zlByxNOtoxc8a7h5WSHw3WsepdfJsy8Ih5TQ0dQWosMwPq6pW9IYS
         AGITyYlBf7JSZ0MLmyVNg9ieIEc9pcE1q3FiMNxy72+pEF4w1xCtpnwrv+zK0QmBSbxR
         H5DQLgdi37Wc5KsVz9bR/PcG8U9I6aYVXO0XernXpW4tbZRaFj6iT38+x0MH0AHBKJ3U
         VMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787144032; x=1787748832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HebUySxFjdW2NBVlZA79PsMtSdnbSUxeMjPShC4sBNo=;
        b=DB63rvOVkYEn2Q1BPSiCSXt2rSXxecpL3WohMZw1npiXojopm7QLPCaiCi0uBOD13u
         u7pqNUYr79hvb7OharE2OPW0wK9jWfdIdANF4oBZmOjnMe+K686bdwqBm84rXUoGD1eD
         idoI/oYw/7W5kNC6NigkCZq4vHdAFVALmHct+aSGF+CkzUshjAUNQ3Z/TauDR4fs708T
         hCLyz3ROuXkr2sOdFe7xcNuvJ7dbiuU4l0bnyZHpaNn2/qauWYuHPPTOCE9dX1X4GWo1
         jdswb4qfMEW//+Op/yS5A93GI9gQ4akUGs/Zh77Eon+SeWfeE9EMQ+TaSlBUpWs4N+fO
         AF4g==
X-Gm-Message-State: AOJu0Yz1K5ILVy13n5DAOKMqL5JDLzht5PtmX+RGBbmYgVvQeKnoj+JG
	t/R0UZyyntaJoFlqbAjs4pGwI2Rj13Bnx9w8RbdUTCF+sWu4L2rcNkxBGhko7oxcNIOGDxDIH7L
	iWDVPNMQoNILvNyiznYpMiSUhTlmDRBIScUFcvSJvt6PUkDfS+FRlHgQ8wXZ37UJP4Uw+
X-Gm-Gg: AR+sD11bOk0oEbprsvx6Xl3fsG93sTJQh36dvZBF03jgcH/QMqIsYsrU3h2gzNhZVHh
	qVjsHc4wCaDbW3rrouT378sVY2swRcIoMs/y7T39KP/SkvddrIcfwDfAbtJKqe6FqzD7Stf7AAp
	maajLPthZ/z9PDuCyw7LvMcNiA/FK6Mu2B/r7Gi9I/DjJE2/vrzoyMLLrQSgXATs2MCPd8+1AF4
	Et/DHCbKWvxcw7q36qNuJjjUJ9elklVdjriK8e4B27bz7dFypedyNXBURS5Z/1vgIR3QEBVNGD8
	jySwMg3oE3eoQR1ggUErnztMM12H1iVcg2MvMr1NEvLccerXkqKx8Cb+WARjWpcO3HVirTZFizQ
	U/7dkASDf
X-Received: by 2002:a05:620a:25d1:b0:930:e48f:47c1 with SMTP id af79cd13be357-9371e3193a9mr400818485a.35.1787144032394;
        Wed, 19 Aug 2026 05:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:25d1:b0:930:e48f:47c1 with SMTP id af79cd13be357-9371e3193a9mr400815185a.35.1787144031869;
        Wed, 19 Aug 2026 05:53:51 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm77954795e9.11.2026.08.19.05.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 05:53:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 15:52:01 +0300
Subject: [PATCH 16/16] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-qcom-tie-cx-to-gcc-v1-16-840034124e73@oss.qualcomm.com>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=936;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wlc0vo8Hdh9jcDJqUc6YvRCT4ni3Jekq3t18gDFW0YQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqhaczjZ7tB6eB3mGinIjaqsUSEJoIc7yWd8yeO
 fw1Nk8YcdqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoWnMwAKCRAbX0TJAJUV
 VlUZD/sFXM543f81B/rcNBowHoJSInkay/wV5MJK5cxw+TExb9zPU4WuRg52v1jjMmoMDIBDKyg
 rB0w31N1BlDsoPVLwlYXnC/BciPgR39DmGxwqGnpsW+3EBytTVv4oV0gXYPmuH9X9103WsfktPC
 MLH8ufhIn+qVRYDIVsFJOazWTHwczolCnNeqzJncZ5TDftauHggWe9EbZYNGC4vfnZ7yuD6IF90
 GPtVn9SFGE3BZq7dbaQ7bXTxhjlNwVfHMOukmpcGdT5oDzBDGF9gbVUhasPbOkgvIBiyjqCEnix
 LoxJ/YA+SUIiVjc/VWFUrWucBAg0uNtjZZmIOkdxC5J1enAdv76TFU+XZOimnf/i2yuIV3+4j9w
 KEmJ730nUexOHkR9jWlwfRVr4/XvOoCNOPKNFQem1y3qAyizJS8o1YqrP2piquaR7YSRhkYAgfm
 ch7XUqJChvKuyC4n7PjTH9B6xtgVW05T83+ZfaLcAlxkarjffMShWw7y7y9V/ohI/0ZNvBd7CTZ
 3J/HaqVWvYvRZP9ZWXK/JXSxi/XThugZmSURFUp1kMn3liBe0Uez2zIJFGgmToP8u8Qak5XIsYe
 f4EIaEX4zO/4ClfXphBdKBcYo0ovUnokbxURu7zHMx+5bIH/fmMRIv5d4EI6gHCkqL0WjD9BhkR
 YZ9+ck2tGlPikBQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX5DW23DxByH50
 UkqzaHNSthTowA/UzZvSMhMbOzt+7j64+w8CNpyW6aJ0pw+JtYdmW/ESALQ8ZVY2UGE08gKqnOH
 jfJ17hkhT/zT3afNQDHMr8rGnWZO1ik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEwMCBTYWx0ZWRfX/qmG7guAV0xv
 m0nAtU2fRHz8CZsVddUl3BD1X6148QL0464v41VDlbNir+jVr3gcJz90sp4XubtMmXc1hs3hmRM
 jhaf5cuv+oc0RNYUCfodFPsV/N1SXDsgrx2HxMyfsNEnTONfiXthkW4tyME6vbxts+3eV7tR6F7
 hHSWUbGnLjliSH1I3s64eT4tuUiTipK1Do6Eu8HGfKv1bbJyW9BWsItr8vHXtKBS8n73/UB/Sf6
 CNXaOJavNNWuRUMM1SU9n1Je5i+6i8hDH5wgSZYHJeNpkaR4EuzOqrKAQOKzPn7GMe400Z8crzF
 STJv2UQMx8a8ZLjEfSnQ/+pt+tRJTIVKlnTdiwxKGW5jEsq6pul2vtZ8TZXIAb62v/Sh3F2ZLp/
 ZqnI1+DcFv52CmdIGtm9BOKx1xDqVruZt8RIY5LtX1Svft6AUQ8GtKvQUyVIo4vCAlEu2RyaMeH
 AEGcL08a8Z1iC6ha4Xw==
X-Proofpoint-ORIG-GUID: CCc61NBRxB02QzuJdgNdHo-3EibftRVf
X-Authority-Analysis: v=2.4 cv=bN0m5v+Z c=1 sm=1 tr=0 ts=6a85a761 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CCc61NBRxB02QzuJdgNdHo-3EibftRVf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190100

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..06ca54acf565 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -706,6 +706,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

