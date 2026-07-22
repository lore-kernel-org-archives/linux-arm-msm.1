Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E27352026
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713276; cv=none; b=nIZXk2iEBQk6zO9Nha31Gb4PZj7M1KYTk1aY+56gUgO5kXbuN58oiQckA68PmGP6LO3R0QRBqrgOJYSfd/zPBxCMwckkWQ+xB5SIatlLaek09FlW5zvhDwphvhscJjDisakm+EY3YDL3ExHcaEaC0x7Kd/9rtwCiPu8rjR7ITtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713276; c=relaxed/simple;
	bh=VlcclP5nYxGv1cjwCZW7AaF/SOlzYR38DZXmK7EqoOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEdqyrvhld+kK32FYpLyrVeTRhcRccEnbXWFwSB54+77TA2+yIf/0UkwsBd8pChIrA9PeFVBMOGpF7v886SRxR1JT3PGwZEZF0gI+unp2QvfFVmhvovawuDSDwPv5iASLVMBDZLMdynoCYbKezpqQIdBVnkJFxNhwgSd/bA1ZCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1POdT5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=foQ0lN/Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1POdT5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="foQ0lN/Q"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8xK1e237569
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8ZUMZXKWXDvmPVytUGRNQZnp19N5kQlPOcsIMgZaLA=; b=i1POdT5cFI2LWKdi
	Tb0Pck+mh2PIfLKPP48z87gz6kvuvwlY9TSFVtpt4IB4zv1TJLYs+uL2nOiGKAq3
	ZuDZJNG7VkHLKpiZH6V91Ak/ShBd8xwAWcczZfJkHfVsXy+aGQ711aXebpMntSGI
	oXkTxbH8xh5Po9a7d5TQjRbsMbMqV1nX45MyAsn1sgmmM4hn/gbIioQkYwHe0BNd
	6jX99dWbyDCQASPNFJPl1GobFJBGdPegu7UBRlBER2Lx21vGSvvGkDYUB19iTAvn
	6Xa5F3r7hsBjovJjQ80djQmaOuv4duGHfki8uviLBXz/+ckoO/peG2mTtYCTB69s
	au8STw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn1f6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:41:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9489f62bfso269992196d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784713271; x=1785318071; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8ZUMZXKWXDvmPVytUGRNQZnp19N5kQlPOcsIMgZaLA=;
        b=foQ0lN/QCkI1xjtHb5cJEavxNN8YNMC2e+Se840q3fG0k6aQd+B7r2tUJeZ8tPDeTd
         nhI3A2zOy6wzHCDAeqDGN90LkFy7n4SStDTOEagQwTy2MMLLl81YRJHTVvmE79rEDIeV
         rZrAz18uwmp1xB1ubBBx6jyBo9LasUGlbCRq8lAKT2iTKQnEJ1O95X/Vpf/SNT7WzzAC
         pai2BcM0qzA6woH8EsWlccpC1QMMD871jOtLtANbejeLKCMjUnvvHmu953ztqjNNSsu+
         gR81DYbPToch+BQLiGY6c5z7drqBxq3Aksl8hkvCc/ZQAYrHY0RtBW9tFJmScwdRNjYl
         cmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713271; x=1785318071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8ZUMZXKWXDvmPVytUGRNQZnp19N5kQlPOcsIMgZaLA=;
        b=tSU3MA1l27mO9gBXNw0+j8YqtYTTpDL/pPBSFmBqY9k4x29UfKjgGcK1METwfusP52
         lTLCAdVeEkjfaNvE2JWY26srcebDE7mYVji0qRBoED915TF3YFEW4SgBDWW1VeIpbACi
         wf541TBXXFl0paTpApqiKlrhaTCk3DY1/JMYPUXnfJltP7VnufO8kcP+3vqJTzaSdIrc
         /KWddESeAeuHSraNnGeBlaHpxWx9ggZegdlc7prt2LXSpjzLAQQHWpS0tE6HHka2tcT0
         KeV+tQe6Imtn0WuPcRqr0D4mJ4i6E4K4sz43tWIWpwv4FN+Cxy7+lZiNOa3IodxLqO8S
         ZV3w==
X-Gm-Message-State: AOJu0YyA5RqadGsVAumsNfenbEwiZv1tHxlDBxlyqPfrY/KDkGoUQibh
	lcMbFk2KeumU+NLlJ8r4gJZFfm5gnb9DK9tJ+E4KdUCMrpEHHaEz7So0Mmx67te/CNubxyvOxqI
	xIgznEns9LMXgQ2McyL0V/xgTSAbaH2hGOUSO3dlB4LUs7Rc36pulDtXxJnjmZSONEyrv
X-Gm-Gg: AR+sD12092jjgpGtb6Jyhc+MMR8d2pIGuR+O4KjeD5PdMyXMKja5+7lPAQ6t3pZLShp
	jF8ZR9MytH2pnZ51rwkIhyp+h822MJ4ETaw5fw5Z4UjGJN1HJ2PAfBukqHgUUC49H80vEFatQE7
	3kM8ec1cDBxUtnzeDtoR7uX5BtUNvDrY8v+aqKxeimC6mnnWQXqxV6th8vXhm32dFZy0/wXCW+9
	vgl1eNsPB6VrIbQzyPtjm2X5HExLvRDd8zq7E+wo/ouzUtpZ9tfXne3F5qYlkoykSNHRa1U+9kQ
	ObLGGhaDxcwAhDlt3auwa8nSr/XBzDtKm0PDMpGXZwePAjWjzV300ukyqnok1kngSMc2dVWUzSc
	nMhfqrnov
X-Received: by 2002:a05:622a:1456:b0:51f:798:cf16 with SMTP id d75a77b69052e-5213e17e44bmr198558491cf.61.1784713271435;
        Wed, 22 Jul 2026 02:41:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:51f:798:cf16 with SMTP id d75a77b69052e-5213e17e44bmr198558201cf.61.1784713270794;
        Wed, 22 Jul 2026 02:41:10 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm4816398f8f.25.2026.07.22.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:41:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 12:40:53 +0300
Subject: [PATCH v2 2/2] arm64: dts: qcom: eliza: Add fallback compatible
 for ADSP remoteproc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-2-e1e98ae15533@oss.qualcomm.com>
References: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
In-Reply-To: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1115;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VlcclP5nYxGv1cjwCZW7AaF/SOlzYR38DZXmK7EqoOo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYJAvYVUVZmaEDLwfc5+NGstob69pFvKJuUZ+f
 7jVKIAEvP+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCQLwAKCRAbX0TJAJUV
 VnNDEAC3A3yXzfTT5TH9zoZzvcea0J0ltTngJoD9rhCQ+fJndu1t11LmSxZNqWTZCWRY+Ar/egB
 26f9NP45xIWXHAKdhPtKPJEMWuz6a2y5Ro5VXbn5lW8Io8NTHt9JSic6/Mnn1EdrcHhqyfHmVIO
 jQaKFMaQgskzr9MayOhBZZQyanbBtJwbPcAs/TMwD24l/MuA2J5/HLWMEPCG+aXvFRZrGqHPCoa
 fTv+XEiSIVQzTC2QSua7PMektiaDcm/nhakyS6g/YPTJuJnWG2UJhwYoUbQnG1Sg9U3IRv/+ggY
 hTLjGX/LkL6es0yyvNyyCEL2XH04DXyL9CGCBCo1RJMuiZkeTf8A/rIgcfmYB+GFNzCAkmR4uGI
 tkZVULyTFqrRWi38H0u/XuaqfMGIFghT7QQ+10WSF0tE5JGcSdumvjPFuIDbRmElKlGdwBnCXTx
 WTUjtcknFzcW3NFQ26lLjW8wb2xDpEzdyDXE3G94UZvGp+kYKuwRkjNd1BHsEeEpqgk5IscKz6J
 jxWruhkjSofjSWmKxuoVhH50oZnRnxtYNMN2a4qkPoNah3a0zuPdlTtBR58YxtU3fhZWP1Mnm1U
 uYyDuNgC4JWSIbsTw4Xu2l7EtU4c43DvudQXqzU68kahToqjIVimK0KVjzfXG3L9DQEUoBeT/3G
 o64iXRSfSwjclqA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a609038 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0y1tdHGNZ1wmcLNsCGQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: c3efkKtAfKB-NJpc6vrvkxl6T_WQsCPW
X-Proofpoint-ORIG-GUID: c3efkKtAfKB-NJpc6vrvkxl6T_WQsCPW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfX5xD/9Lc4T/4T
 h4pmxMOPCiOYNES2dkLSHznJQOncMx3Ogz+MOW3l/9b1a+t6d3O44mT2wxPNljoyZW7RBG1jlxl
 9MuOOyw7k6UjJq1/j9GjBhv2i7iySr0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfXzrlV4lItKG8U
 Jt31s3MHxDPldjmqgVijzWxdbjdHADxyOajf8E9thcggVgt9KImVzimNQ87wUGyW4rgpLQS5BZV
 dRWMWgruQFl6K9ELaXNfnAtTnu4pW6kVMq0CIZbO8bKivzamfE+RL65Igmr4xJLVjJqOaVm4/Km
 GWSgg4pehvwuwsycoEidnIkYPaxfdkJWUD1i9kUgnJT9OCb/qzvS/A4ixdEBtBufTdRmh14YyZH
 wYwXKX75ndc0k1GWFg92z43LisUxYMUF7ovI2yD62chxjUZKAQGlx3aur++9hZafP3K+dUoh+1y
 CWGX2TzLQ78RUhOrTYE0mpM7eBRkzU4g3MefsSiLr+JpbZ32qg4Er1aL7sLdja2eRLZWPqfU1qV
 QU9DvMAzRDIpT7dmZzevTPsC4kUIsKayYbQraQuV1Vle/hgnKPRe6/u1NeZkQ0bUkJ2ZW0IZPVg
 HOuv7NZFbF/4Bfeip7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220090

The ADSP found on Eliza SoC is actually fully compatible with the ones
from SM8750 class. So add the SM8550 compatible as fallback, just like
the rest from the SM8750 class SoCs.

Fixes: 88ddafb01ec0 ("arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 357e8066c176..5712c094cbb3 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1967,7 +1967,7 @@ tcsr: clock-controller@1fbf000 {
 		};
 
 		remoteproc_adsp: remoteproc@3000000 {
-			compatible = "qcom,eliza-adsp-pas";
+			compatible = "qcom,eliza-adsp-pas", "qcom,sm8550-adsp-pas";
 			reg = <0x0 0x03000000 0x0 0x10000>;
 
 			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,

-- 
2.54.0

