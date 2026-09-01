Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467C047887B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256284; cv=none; b=q2Ai7WTvJkXfgjcfDqVWd+NY1WaXb97o2CB0CQBdvruqXmHdYpzm2bdHOEw6VSmGZoOPCIwJn+DMR/sWioTvpXRpDoPAQBWFCwfxMxEdanJzfOih6WfEhaSqUUyhLpamWkWgrAoHs7c0LoXR9itoPu2ihDprSum/vmxaJ6RaiEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256284; c=relaxed/simple;
	bh=rreLXykQ63a6y1IOwDu9sw1t19oiyBF8/4USLE8zOa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFo92jxZyTEYl0LdtdN0vfgn3778git1bP1BL+u32At0AFNCPxTVQXrV8x1EI1csCDs37eI8oUbbxOd5DSGeyUfSH79z1WC5lBo68iJSAkMKUdTpwDvMzPAvUNon9tsnlaeYbfjbKUl5JQ2N7/zTEvFf5J7pGMUs2saDCXvXP6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+drau0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GG1TLN5B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+drau0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GG1TLN5B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179I571335381
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 09:51:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mtqWHtuTVnw
	9seSmxnafqm6ClpcflDXdGN4SeAvMOJs=; b=V+drau0bLqvt0G5kCd0l3IURuGh
	Y6WtBcFldiI+HJCor924vxppPpWslXIqZABzN+lfYiKTcghIpnCF8f1MvLfG2zaR
	b5ycASXx2p0oyvGNrLMFgj5yEdLKcpNP+LZKuknhrEhPZmSwmlAPf5fIVtuo8BXb
	+FIrlVNm/qum/08SovESR9K9wJR+CaVV1V1HRSvLLRAuRRofCif/mPzuZ3sKELp5
	Fs11CFPbcUCWkekhPiNv/3W+Y4MrFnabumMAG0Y/J0AMgaQmCSFCribZ0NoYIvpX
	NH7QUfP1a/PiQUU4Wb+OFZ/0b/wo9IhDrzn40vDTFPebmWq1pYtiFWIcJzA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx2gft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:51:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so9024825ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256282; x=1788861082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtqWHtuTVnw9seSmxnafqm6ClpcflDXdGN4SeAvMOJs=;
        b=GG1TLN5B5KG4N7yL65DuiXpYsRwjs0IEW+tpgK85pqeYAQmBj9FWwSN/ZPaJQf6DBU
         izTN3DmC+6ftNAYzeds0plbjUNZ+RzUw5a6UvWZnXbNvLKz9TV+enubNNNSRoWMxUUWN
         3wyn9IMXv/uQ9ofJmScvE1nKEv3I7i4V+tuBH2FBKTYDyAZ3snAG1JVN5A/6+o42+yNw
         +O2pbMC5Yruu/ZFof1ORWUK5rzpTLoIKljcgz0/1D+5QI1wecgNftQiyhVMqhSaWp5pL
         9swm/03CWs882KgTq/eO0A8dvz1rFxdtdvn3bODerlZRottXaxOwIhU52atFaOe7kx6N
         kxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256282; x=1788861082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mtqWHtuTVnw9seSmxnafqm6ClpcflDXdGN4SeAvMOJs=;
        b=qH4BAJ/SYQ5oE95nNzkVr4ly5ZUt4vviL4OnCAsYqjvTAqXvLFVGTnIPYHArRlMkYn
         2DdpLdvWFlMbUa2EvE6TiJIy+i0d4QfgN1P+x1nN+whXIX9iTvUPKvTfaH/BcOV6RUGd
         HlcJVbzG+DQKkpAHi20IPtTzBkcXy9XXuD3ag4+qP3DX/HjxS8VPwgpLcqTC0BIGUeFC
         XnAo0Fa/oxb/76Z/69E7S90oJNJhYGvkbKVV4i2uRSfkK7icE/v4qyaoD6uNIGEdrupr
         4U1g/Od+3p7qaWhYSA/dEa22pdEEJm7hVK9q0rD/OeCXi0lyHxyyHniXrQVuL7jtU4Ut
         sdVg==
X-Forwarded-Encrypted: i=1; AKwUvByBDDwOkrVr/hABaolUs+d0u85j6SG4lguawMbxiKMvzRKEDVITaetOBA7V83OWUEzjGsQI7ykP3qTyE6Rg@vger.kernel.org
X-Gm-Message-State: AFuF++myLvkGWeNX9welJbc9Tz1VqBZZorTFATu4W3w9OxiJmOdnLmyn
	38n4htE1n1N9AqbbIp0MObvLHkx0nJQsNpKYpLNfM8aYFx1q82UJv2Gawv+XivRiuXVAH2HIY5h
	AHWcvkj2b5aOgyQ3U2EFnuK08P/sF5kKvuXKpBJ7F3naR+wZYn/AGDosQjgWRtRqUBobO
X-Gm-Gg: AR+sD11vmE5+rnqbvD8SoIAhqKgMn3+IvEne2q/nhZTlkWhjRs6b4QAdjFY80F52mUl
	e8E6LSryU8tCBGhkoixo8neh+GiY7Cli6VgOJzwHEb5ggQ4h+DknL2tGenNZD5b8hdBWstTultM
	9zEz5cNVX184khsjvFpjJ46iXr4Kzv9IJ8/GFevPJyCqS7S4r+avp408AXtPRmrG+Ichb55YYC7
	eFU87DBvb8McxTpgJD/7HsRngcbfkii0p1ZUb74hO4iY4alaoRz0tPpCLjLOvPGyPbaLQRL4plq
	l2ETyExPwdOBsh/UXiG/Ve10Pl0RIcZJJ0YiqXCvA+qaToA1t6c1RR2Zn0Bslu8yJFgNbSBEnXx
	qhKhlfT8jgehaoEhu5XnQZ67TeIKzHIp1yr9ZoCg5lhHPeWR8pYDmE7MNo8xN
X-Received: by 2002:a17:903:1ac7:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2d95284f383mr41119915ad.19.1788256281593;
        Tue, 01 Sep 2026 02:51:21 -0700 (PDT)
X-Received: by 2002:a17:903:1ac7:b0:2d8:d4d2:d137 with SMTP id d9443c01a7336-2d95284f383mr41119425ad.19.1788256281101;
        Tue, 01 Sep 2026 02:51:21 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286fa37fa5sm40641466eec.29.2026.09.01.02.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:51:20 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-phy: Make resets optional
Date: Tue,  1 Sep 2026 17:50:52 +0800
Message-ID: <20260901095055.42229-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96a01a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=J30188syTye5AiLRMCUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfX0yV5I2kWQfFJ
 DrTxMtZavc55uS0F8bTC4rsxr/A3FPkupSV4qh+cA1HUWd1viroGH7VJQMX3LCMUOuKxQnWhL8d
 PIFgH/zEAhoyg7KMKC5Dxh15C1W8hRM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NyBTYWx0ZWRfXwUj8P/fF+Qrm
 VqAwx0agZRxduwBMp8UvT59NAGbdvycVhdJf+Kxu6vqmSWufp+FmICx9juKRfjWquodoun0uvhG
 wsjUjdvwj6yLsmFJpbP1ilxfHX6uNqfsS+PdBMPk9AwFBPolGnyKhPrWP2XEPMZ7qETLOSOqWSH
 EYNfdiclq9YORQXWrSgZnW/1L7hva7Dto8aNtDp/k7VUf+OtvthnpKBEv7mX1uiv9T4Y6XS+OsX
 P3y3UeJaiuyacdrF9zEcUxoSXmGrZNM4XrU7WIiHdKmcIDTsqF4ZrFzuLYv0Qip5uI8C7FTga49
 HtxcSkNTiNphxOYM4UHwIzxvr4vGRerm4mN0NKdoPabv1SB5U+GkXfFV8nlJP/0tUl9EoRaGkqG
 1AnXb94QwFV66Ikts5Xqh+gILumv9lk2dA3j802pX2GXEe9XfJPGylTv7OqEWUCZknN1sGdXpmc
 7Du22M/N+Cl7f05bh5Q==
X-Proofpoint-GUID: UWslJ-nIdzLvWrV4dcFNF5iW-A2rxHZQ
X-Proofpoint-ORIG-GUID: UWslJ-nIdzLvWrV4dcFNF5iW-A2rxHZQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010087

From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Not every instance of this PHY has a block reset of its own. On Nord
SoC there are three eUSB2 PHYs but only two QUSB2PHY block resets:
the HS-only USB20 tile has no dedicated PHY reset and is instead reset as
a whole through the controller's own USB20_PRIM_BCR. Requiring 'resets'
makes that instance impossible to describe, since the controller and the
PHY cannot both claim the single block reset exclusively.

The driver has always treated the reset as optional - it uses
devm_reset_control_get_optional_exclusive() - and the sibling
samsung,exynos2200-eusb2-phy binding, which is served by the same driver,
does not require it either. Drop it from the required list.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 096f6b546632..2140482c8e3b 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -64,7 +64,6 @@ required:
   - clock-names
   - vdd-supply
   - vdda12-supply
-  - resets
 
 additionalProperties: false
 
-- 
2.43.0

