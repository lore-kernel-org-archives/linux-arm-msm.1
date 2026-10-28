Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173873;
	b=iJshzP3ZxJdHVjqryTe7EOVBtckMcKD0cAw+elLCeBULx5AocryHRJq4a75nkRoegn8M
	 ahTVSVajwHxXoNpCe9TsNm3ETn9Am844r3eYngHIVgI0c6frMLEjF6QWIRaul0gX31vPf
	 nZHazQBJAbDxfG2xRlSZb68t1B+WCMNqaKMEAFiAx9vGHokBoJMhuRLOkwqjEAXGOpk+i
	 h9BAFw3nUBJdZKQ9U4DvE2luKR2e5fBHOyuVyrChrAai4iEnZTmRvD/IFhdCUwt97RiTY
	 Oh6F1Jedpauf80H5X0fNFlDvC0kn78zHkWR19sRf3MGta4Qsca4PNSgY0WeAgSHBnYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
	b=yVebx21S2bzhlyYPR7KUH6osPxUuuXa5rptdeobNwuF2tazxQu/ZFfliQwQra2hU0BpC
	 qJzzzCXCp/pu+IzzLAtpWuqf7BoruKjoc+O76ZhhSDLKwCXxI7rf3b/hLQttzIITRjvAd
	 hZoUkCUL5mwk+usLtud8HemQQzwMrFE+R/0FvKrQo3Gxl41tGL9g4CeqY5hFhwTiPK6NE
	 szzaNc7V2/NsSZTEwKAMjUbSGXFzuxp+RrmtZ+G1JJx5LKkRLxY/pxl/F68ojYVfOl5d1
	 x6JorCrsRterxBICXS/YhiApyeDtjkRYMg9u6FoMl52BFzFCtE68FfBJh/ilysGuKqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cX6ynhjc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHdPAH4o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B630606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B630606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cX6ynhjc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RHdPAH4o
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PSdU3748932
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6VnyTbD/yi
	L2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=; b=cX6ynhjcWQLegGYqt2PlZxHrH/4
	33tLiKzsu5NI8l8hWf91JIPbMcZbate71X7kW417JsYBdbA1Dwt3d/n85n0HtBk7
	4DWUQ/SO7NBB9Li2zhALLDnTNWdbWoM4h1ybbaAFyoI+HssDW0CpVFpNFezxlpR5
	2lYyEF9GGAkfgoz49Pv9r6F6dZGwIcdJ5OSmhWJLRnsJXYsAVesh4MpI6I/c7L1Y
	uK7Rp1EXVu6Y3/rG6Wn9s3Gp8/AKE6pPkOpidebH+1huYVwHf3pgQLdf5x/osEv1
	WjYEXP4JBJPqOPzqhKoqaBMwGywFdCtXp/8zrG06V9li4MrJOqwhCejcysQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g32y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:51:12 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so946398eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 00:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793173871; x=1793778671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=RHdPAH4o+u3F2kiNstRsJulip4pqsDC/1bx00kRPSPnj71+n8uBVG9s/QQApn+g2Rw
         Un9odswaPGiRl5+GE4OD1ElZBZMsTAi9TNOy1K4HMbsS/HIGkVTvsZqeiCktKi/4rPVY
         X+b8ZW3iG8cn4EG4pHGTsgz4JHpjQcywkj+E20ntVH0it9x3r25N2GtRNA1Th+AHWR7X
         LGqi6FQXzrW1WNAMzhMYm7nCJnOFJTDNpwCVrAdv6PuQWgvGkRvoQhSJAvVP/pHzeo2x
         6TtEI8ORX7BdLJLWLpXT4Uj7wIR5Ic+nqht9Jauy4h0XXwihB+FsADs13PsEQE+qaTwm
         KAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173871; x=1793778671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6VnyTbD/yiL2DBD+kHRnuIQXNKeJxunFe6GOLec2MU=;
        b=BDvVyMMbVuKGY9UOHszo4eaBOPkweiwdDxunDA4JhjxrMB6bCsm1I8d+1ht7JOozuq
         Fcxnw95gwjG86bK/ZIoSP7vTwbjjT1hF5gBs/oQYi9aUenFctKydF3YIVZBIt6wcMvgA
         Ut7d0MjuMg/Ros7DGOBL0yVTGfge2xXHUoJFLWzB5DCLTCktfQQp1Uh8VE+iKSOXvbmt
         QPNue7tiUYYJzUwXtjBC3jObZ8xS4vilLSMw7VMHzPzMkcHoeNLGIOPUF8pN2jI5SCJt
         yeb4GO93apVzv3Debeu5FezHGaG+TmOTO2orfBB8kYmavCUxoaec7zNY49R8vVp0mTNZ
         aOBg==
X-Forwarded-Encrypted: i=1; AKwUvBz5LPVOvBFbkP71JsBccVQcvpVfFXpLd2MXvzNIHqu1Mhset+gceRQm913q/0aLs5MT5B5iv+9TcxFRHsjP@vger.kernel.org
X-Gm-Message-State: AFq9FYLArgNxRZeQrh3wth+VqpPhHxJEB2wnBitohsKQ0/SqPeWKDa9D
	dsZWf2qWkBjRVFd4pphA3UJqlYCSWfcfBghBhWeadyqEVe9qgmLWy+D8ZeRJcfGJZ9WCRTyXh+l
	+XUeoEq9a5odl0drhtmDuF/pJ/YgA58zfTFsiVOBGFq7u4QZptpjH1wAZQOOKyu2kt+8a
X-Gm-Gg: AYBFou0dLw3+eC2A6De/ZpweCusUoh3du/kevOu9omMmKi3ryytG0npcQjob81gH7UN
	FxmTB+ZuPyj7m7RLt26MUXadJSbwUcgagblRsDpTV+RSISj6pNlUl5TfFSyom+7pOfeNkPD3ODe
	FE8luN9nkx+Caq3hNJdRwhW2/tRkRpvpLCAKop3sAN0S4Faw7DRfobCc1z0BTY5ZB0n1nvgJZSQ
	osp4PLUIq9PLwnciO5QHhVTGiJx+VXLpHz9A2VT7gKhq6nPiPFQoEIn/aBmopy+svTUUbOqUbK5
	kg2LylOMYJHowvK08xO4jbLGz4afjjnsxEOtJiggWZfX7VCpGjdVwFJPser4DRP+Kzf1mvA73fO
	LlO2QM5bmQwm/Nx4yN+z7K9nxMNtYDT3oiXDpxVIBgt9zATG+5We175vaQ9hAwWkA6S6QHxGi1k
	hrZzy0zADAB2Mwsqr5uJp4NMRmntFOlxLi
X-Received: by 2002:a05:693c:808e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-36a20054610mr2695942eec.14.1793173871107;
        Wed, 28 Oct 2026 00:51:11 -0700 (PDT)
X-Received: by 2002:a05:693c:808e:b0:36a:1434:c691 with SMTP id 5a478bee46e88-36a20054610mr2695900eec.14.1793173870461;
        Wed, 28 Oct 2026 00:51:10 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c814917sm3430261c88.5.2026.10.28.00.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:51:10 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Date: Wed, 28 Oct 2026 15:49:33 +0800
Message-ID: <20261028075044.431228-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
References: <20261028075044.431228-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfX6tacy/1/eDDG
 w+q1GfUeUC6cDmvfdmn65Kv6cZN0lH31dDcF1ZaNidAbU5KIVp+/DYZYxRZuo95xgp/IhvJjwC5
 DKO6uXuV2/VSYosg3Dcddu9jwDoyt1Az9MvKMxOaVZIl7r1/LLetPMLWOXC7kSdw/suv6ug8Xsk
 Tm0R9MqT8GUrusf4sSojF9SY/mOh3BxnxS3nreaq/XRW8Mh9qwzcE6Wme43tVjnlfr7XjMEyiof
 bWQIxevuqGHThkP49bY16FANp68g6LC0bszxAEeaXEby9Ba6iyItmKNcx0CSRtQADPRCquoC95N
 gWf/cui0z3Ec1MizAWCL1QJAAF71i+7EU3bJPHf/0Zl3UqHKbjHZFUCdhhz1TvV2Ov6n8lJtGT2
 X5GyaN3ox8GqoEjWAFzLLrfM18Cl4w4pQvsSGOHriKHG8paYPcA+ZCupDugYB+qCJ57VbNOCbN8
 /nbIAHw4iJP6z34Jnbg==
X-Proofpoint-GUID: 3M1NStQiE2CB8GZrbuQuq_v8aQj6AAGg
X-Proofpoint-ORIG-GUID: 3M1NStQiE2CB8GZrbuQuq_v8aQj6AAGg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMSBTYWx0ZWRfX8O6yfN8GHGqM
 SldvO+ZlMpSESJH38OI+qThwDA4xAiV3Tt2Bhh8wflfWhEXVfEyZsFjFBfGxKQuCz2NRuXYu0x4
 nJiD/fFkkPBQaeWOONWJw7Mf7lVLcNQ=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1a970 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Pbp3yVwj6iIoPtAh08QA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280031

From: Jie Gan <jie.gan@oss.qualcomm.com>

The CTCU device for nord shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for nord to utilize the compatible of the
SA8775p.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 335a8e1a5a9e..1d5bf79f4984 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -31,6 +31,7 @@ properties:
           - enum:
               - qcom,glymur-ctcu
               - qcom,kaanapali-ctcu
+              - qcom,nord-ctcu
               - qcom,qcs8300-ctcu
               - qcom,shikra-ctcu
               - qcom,sm8750-ctcu
-- 
2.43.0

