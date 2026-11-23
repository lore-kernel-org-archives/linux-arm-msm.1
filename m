Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460749;
	b=uOb+bCWk/03D9Jc9hSB8ZHhx6xrqyn8HVb4J6EsA6QTdwpt11pv/3u+kiMumthhCtPb4
	 VuFBQ3OM0lU4XjZIufnBW+7eirBOvDv5Dww9e4cvA4nDDce/JtuIVB8PEsW3VnUl9+wgw
	 N9LA8mu3Ankd+mUU8xtQSkzbkiD5c+MTXlPYY44pNl14vKO9qDAfOFlkwAaZLHbXiQI6I
	 Vj0kC1bUuTk3BAoL+I+E083+vO4BA86MQWuMu40DY7Tqz9+o7JTtf4j/IHCfA+vnAuDko
	 m+3U1ZVWqIzEQVxU99q+uKvmPGK9uzVWiGR0+p9x5p2wZ3Ahd0dZTyZ2yEj4njj6hYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460749;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=La8YckiNeld4H5l7NAaRli7pn+waejxq1bDCNMoUyYA=;
	b=tnKflcjcC6YaOqVnH6ffi4LjU7Q39vDzya+Uv82jvqsNq0rq4rLWjv/IMomm4+FoREe1
	 mCe9bKbQOr1ur4/DJAjNTt2aNhZ93GHErI/hL3MsSVuLGa2hWgHcxUpqMymW0UFy7dCyt
	 qp6w7cS7RUltzPdVvxvkAoUtg0nWvWJgrB2i6otali6LZGF22k3871Gk+IKrJqHxccEoS
	 5FCegJ1fE7gHwFwbS9o8puboXr+1tdAVMmFsDqCssv+WCJjFI4Hv7dFRq730xtVi2cUzY
	 3AYIJ2SbzBu70w4XqlwuyHGClxcCQpgquvSnIHVCM5nj1I7UM26QV9KHKVdVM31Yl4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcrIknaP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSvA3hqi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152D1606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:05:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 152D1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LcrIknaP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cSvA3hqi
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlWf3025316
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=La8YckiNeld4H5l7NAaRli7pn+waejxq1bD
	CNMoUyYA=; b=LcrIknaPBOegfrGe2gC1kekCmoeN0x4g/taulJGXS83OWtc3QcE
	ueW51DnYOLMJFt33CLUj5+HbAkUaGCxHbXnwsFLZoqtjkniAwswqJ7n6mM6o6uw0
	gkVE+nmTtHI14BJoKO852+w6bUdiXbkCcE1fJsGbproKLzmGUypUM7JHvwazrIIm
	VVeRxH+SDKJ1sjP2ZvpE7rxAGjZKXnQ9Aw4nayjRYnyJQHFZWeS13iGUMj6Pye5Z
	H9Ig08yfDRJ8INNMSNefRGSvlm+GYVmusX9KE5g6msgMF+Q3adCncOAE2bpgIAwX
	kf33Fd3Ns0RJIBQiaQN71+vjKV7aKmetQuA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pb17v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:05:48 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b4bfc0b441so49346017b3.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795460747; x=1796065547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=La8YckiNeld4H5l7NAaRli7pn+waejxq1bDCNMoUyYA=;
        b=cSvA3hqiXmkhe3zwkr81JhFu6+jBPJ5cVtIQeYsTW1GQtN2wm6OwUsYkiDPIMnnR4e
         ML+ckQjpegMWkZ8L8bdb2GhabfxXuXz6b48aiI4ZLQv7PlUuuqthO0yiF8fxwO34Ct4z
         EScc88KA7V7NePEiZR3OJ0YC13zCS/8jU5rps3vpM1/erAdlUWbRSPHvMvXMrgW5h17X
         eiwOlSu8w0qa+5LI1GJd6NtCWiw+CFOQFST6cJ4qVsXaI9EgEZ3kvboTBfd9hBFDqAUu
         WZSdDJrSIESIAgfn7Fpdyh8FeEToLieTfWSISNEbbXs0NbfvEBPhgfrZroQm1hvFWYdj
         2qtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460747; x=1796065547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=La8YckiNeld4H5l7NAaRli7pn+waejxq1bDCNMoUyYA=;
        b=OnweW6ZJgUxGAw5kgReIbQ+h1LRmzSofYPIAAYkgq7YGKvCi48oPQk5lkjutkUgU2Q
         Rp2hWmMUiOeK+KnLrH33kzPTTdD+6Pvb7i+QQx/+fPQWx7ZtHTkPdeWzjmTtYYPhwWDy
         4a6ZGRIXVv6m0HtkXQ7P3XkH0jnArh4y9Qa3XhESRFSR5ZO38heFHr2ZC+JsNXG7U+/p
         9hJWyAFTDb+D6ruOJ/MGLdkEUQ3qQfLA46AqVV4djgKEAkZSVErPH+5kzOteYJPAoflJ
         JDCJgCJZxLBsG03SydZWBtTrc5EImsMbdD3YEofGGtR+34ES8Yk+ErD8xDRu+Z6JK4yZ
         3tPg==
X-Forwarded-Encrypted: i=1; AL+hErG5KbyWoADaMGAFyZMBwsOBl11n7skwSCtqXW20LAnMpNrFNBf4lPZdgLXtOT2XIcXkF+ciQSSZUeMkelUg@vger.kernel.org
X-Gm-Message-State: APuU4Z/8XfRonAEmVVlHfmjogCUjJLXJMYZcRDj4wTc6mZST65xGV+9c
	DJpIdDozE2Mx7vxFc6f15NSd4mNgqF3eRy7SQFLCJ/Ezkilagn8DVzbrW1oUmSgXWuWyHT9j0Xr
	IuY32qv0lPe/X+03kuW8hBSIlC3LnrrYp0RfCojEhLyxdy8d9039NWxX4R/MZ4fZJj2FG
X-Gm-Gg: AZFdTZdnbq1vU+FtxdNGwNZO8mrIW4kBSTsIhUmfCCu2s+i0spi1mr03psd4DD1n2Ag
	YMC/G71V4VLFZSeAkbN4saT+OF4a6TkT68xDoMmaW+9gUI0jY3bvXEzSxC7Uri59uDYzB9eD3OB
	SZRCV3R8FgOFYsZk8SGmX9BpulHJq9saHl+IKPIc1WwjFy8fest824D1rergLULoKV+igljAaGi
	w6mDflAyZb+Qx23fKumbPS+rLAudHS4O4ZzN/e1C7SNxYk8I9am3pGn8FD/c/ovYiaLSIUx9i2Z
	VZGIh1gJ+vs7vkkCIqIhwC4C8iKJCaNPWqPEp4hW7AVhBgRg5k8A3AcPQEi0bJF5FmMHkg5LnaU
	NKp0RBI7ghx01NFoFSxszMVFkNQ4ipDix2PekQT81SziXa+kJeKWEo7oANwco+Q==
X-Received: by 2002:a05:690c:450c:b0:8b4:deb1:4b19 with SMTP id 00721157ae682-8b52031c2famr54214557b3.7.1795460747197;
        Mon, 23 Nov 2026 11:05:47 -0800 (PST)
X-Received: by 2002:a05:690c:450c:b0:8b4:deb1:4b19 with SMTP id 00721157ae682-8b52031c2famr54214367b3.7.1795460746787;
        Mon, 23 Nov 2026 11:05:46 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm24345658f8f.48.2026.11.23.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:05:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] phy: qualcomm: Allow compile testing a few SATA and UNIPHY 28LP drivers
Date: Mon, 23 Nov 2026 20:05:42 +0100
Message-ID: <20261123190541.262138-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1379; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BYfMrOXsD2Uyrht2e9gBvUV4lJ6sv2/BcyeGFDSbzDY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBI6FrCBYAoWmdO8yysgN76glC20RW3+e+bmt4
 uaON8dyINOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawSOhQAKCRDBN2bmhouD
 16Y3D/9IseGqpYsG05UpwiPN/hDJ6Ej9SDJj9dZR7+XltaPWoaM62EPZdi8O3cz32prk/wLIMGE
 N65Xidrqo6an8pzUoLOsuGYLyew4D9bmoBBDOfZNaoTMRMX7u6cyrqSf0wgOS0mvMK80iIn+5F9
 szHY/dntLDjAVh8LOHBhI4x+2fZ1z6VklRc7nK3JyYd/zQXWqu2v6hma2mHWc/SbO+0Ufe/5SYR
 /ccwDj9S3Dnk5xAiOyROCsIMRXc84NyofW+T/OOx7xAOeGZhhZChJPO4eZOYw8V21s+iQfl6f2j
 bbZrUC/9g0uTC//LhRoOKtW9LmjKd9kQ0d7w0DSNpenFyNkS1WbQ/RF2gbC6yeSVdazbvQB23mR
 vgx9XdzNVPnr4gWYI9pCt1fR9n1BdwoRxxwZGtqY13x7fmgNU4zzYZpCgk6ljDVeIhHi/f7vWjF
 cIKg9wyKUG+OQRpAtE7inc+NKHTV/I+OKQ2HdPCpqG9u+0E3p4leqdGKCPLMsim21EyGcN9WHz7
 VkvekdBgOeWyzbB3sift7dWy6RSp2IX3TvGAcdmlviyhZAOyz2jFyun80jP9PckV3iXGjQl0YuD
 M++Lq9QAkl6IYDE/BBBdFXwTM00L4qn5iZr2x0gphdSlI4LGFUrXTMWNxoooYKgTv8iiiIrL7H2 lD2LcUzhv61vbIw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wZVyQotP_kbbS3lLQCVNrrZZQyssIOpz
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b048e8c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OLCHClxKf6i9BzEG9Y0A:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX8wGOhRp/dWyb
 p2aAbuSmx79NzIfT8KSTOzAI8Ns/3G9p/IbkNAXPKpGl6ZilqAM0o+opriRYUvBkBjw4a/7SBc+
 Rpuf7wwjihnJCbQrV5Meg8VsLoEiaJk=
X-Proofpoint-ORIG-GUID: wZVyQotP_kbbS3lLQCVNrrZZQyssIOpz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3NiBTYWx0ZWRfX+jA1zNE61zpj
 HkoV0+7BPgkLF7MsOQIZx8VRGTkLGg86C4nZzBfiKiv5gvIw14bU2R41iJkm2Dv/anv80zPwSdn
 pFpz3LUD6HlVnHyFe7SL2ObaM2+yygKTAO0wDrWnlUz2AcD1XP3GpZyMLhnTWZxO6DJMSSuNwAP
 ZBfHgkLP4J8coKpFS8OE81+o81xtEolt2Dxc03OD0TD/bcJG10VKObX1lY8fJI0jDM49/cWpPFq
 E2+9ydUQlmrGM+jnMbMOQGy8MiB33iFBFyavpML6HxGE27xZqSuThEoop6ss4pLPyglLh8z/Cc1
 xuRPTecS+/xt0akVgW9YGwaU+Q6fgxPby7GXn3F/cInadyoq8CFRCeXVNnx83e2Z4SimfwTRMMj
 J3KaV3E7HFMWlOLS3lD8GSdwdwqvh0EkGunZccsIxh1FiOCZDUdowRWoNu3NoXs56qMuPAkH2mh
 CfAQ6NyUFzK9bxQj3Ww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230076

There is nothing architecture specific relevant to building of
PHY_QCOM_APQ8064_SATA, PHY_QCOM_IPQ806X_SATA and
PHY_QCOM_UNIPHY_PCIE_28LP, so allow compile testing for increased build
coverage.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 2486720b9ffc..7885e98c904e 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -13,7 +13,7 @@ config PHY_ATH79_USB
 
 config PHY_QCOM_APQ8064_SATA
 	tristate "Qualcomm APQ8064 SATA SerDes/PHY driver"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on OF
 	select GENERIC_PHY
@@ -52,7 +52,7 @@ config PHY_QCOM_IPQ4019_USB
 
 config PHY_QCOM_IPQ806X_SATA
 	tristate "Qualcomm IPQ806x SATA SerDes/PHY driver"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAS_IOMEM
 	depends on OF
 	select GENERIC_PHY
@@ -175,7 +175,7 @@ config PHY_QCOM_M31_USB
 
 config PHY_QCOM_UNIPHY_PCIE_28LP
 	bool "PCIE UNIPHY 28LP PHY driver"
-	depends on ARCH_QCOM
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on COMMON_CLK
 	depends on HAS_IOMEM
 	depends on OF
-- 
2.53.0

