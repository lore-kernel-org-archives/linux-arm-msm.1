Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431223;
	b=nO4dLYB2ISdfaxSBDE3IE85EyKk77vPzDXlJDH/rYOcjFRNJ/GuXj+bAZ98wA7awFgNM
	 IzCeeJsSxZ+1hFRjiSBI+67UN7JMAVZYCNXkHOo5cI4Kiv5+RDeDBxuMk2kYBg3jRXpiA
	 6H1XoU+Jw0A7IGsykrygR+FdpmfnoRhkcZaWOIBGVc6wNT1+hRbfhXRDi2HwB6K/Ag98O
	 qe7aRusuKN+WLkMV7LFNnW7WRmOCRNwexBgaOP3Edef0loCVqSubNJP0+w/1IBW1wt5qn
	 Qs6QICAy4zPstRbryYcZ80sA7teAxzY/hmaPmFGlM4vVGr47AIJWo/rxLsnZE57mH8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
	b=mvpaAu9wy3m8213z/34/nOCY8nsrTk3LZtXTWoKiW/3Em/8OuYMlHbJ3YrVr/on0sL1r
	 zjrao0U1xHQ7T0ftMxjerYyhMZplIGt6xJw2zC+E/w59wwz0jlNz1eC/TUrms8PO5EawT
	 +YgSdkdIwjpq8QGex62qDezUqz/Z6XYCLPpWEVHPaQZyMoZce3ekf6+lb6wZNzoXyaGA+
	 x05BtSPn+bd7l+WCWDcmwvrGoUok3/0moKrKRREXUeUojLrhcuHh+km0mrKs/tkFIi1kP
	 5uExTZ6hUwGg+pGQjlDSbab7z+qywqhp5KOxr8lrDUq4NCIVgH3a6i9EM9h01fr7vXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLDhGM+G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dhx35+DQ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B944E606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B944E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GLDhGM+G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dhx35+DQ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GDP81900214
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=; b=GLDhGM+Gu8YdqAbv
	F0fXr/OprH0QQJSCflx/jY8SjE7/50uEBfu4VFmw9zY0Cewt5Hbp9eBFkB7eo+3F
	Og9m296OUHR+6NdIirtq0A7+kXhpxO+Wk2b91fw6xswhLDw0Pyt2cwcwY4dpDGD2
	58GwXVz3U63oJYPAaH/OIRJbCO2rSoLdk0YCww1cMpzy9+97jnjiODC99j7CMEdX
	76Pmys9aN8rhJ27vMaL51gaqwGtF5Bfr8siR6gUa77yhpivfEO+Aaou/Fqyt8gbP
	+b00gdOjIjGyh7ba9xN8i/+8/7G9lA/6qYuAuAOVA1/oa4Ln7yCCyBsSuqdNrrPW
	HWSCXw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k125c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:53:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e05d31e54so2158676b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795431221; x=1796036021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=Dhx35+DQ84T/CUoxcxt2wmpc6/hYmG9scTK3XoXR0GG0riyGELZ4mAHqEKoeel/Y4V
         B5PmfTk3YvAIk5mtlROEMOKdwY7Hxz0Q0iNGJxj21bEVkCmbsc6n/g5NxQ7HHdkhkFSU
         aBZMq0f/MnOnrxTiNEIRYSwhuvSL3bZ8soiNoPSjwvKqiIbYt95Wq2qkdxCtSucHCtUl
         O5rUNmTiUY4y5hlgxTxrMXG+gTPJgz+gHsHKfasGsvjKGISpi02y36P+1qHZE71eXuiY
         mk1fC1b3pu4yplE2d9E/MQnCwwzdDtHmvX2qZGST/DbxzY2+FfJFn7+b0yYKAdx1+A/M
         dANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431221; x=1796036021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWWYM5hufS1mOg/9f/oIBWOsERbRGwhQB+M3hkQU4XE=;
        b=b7AJ1V386Cxx+b865Cf5KPSK/M4hJ5TAk1uklF2TBCYmdgPlZGRbofJGyfjvclRN9h
         AxECkV91eUnmEuE6RaQHFLNDg9ekXMhqPQhBgIPOPEHjZuS5+dCRNh9nWcTrWZeALe93
         +fDbeYwIfK9apjnf1JZL5by8t3CRdvyphfl27XR7fbJC0xKhYocbLUcrttOBvatwhYwt
         60Ayea/fgS3eiLIj/nk28FzQ9TN+qzufNhFUjm4Uw6lxmL+PMkXxD8LUZ1snv6WsKuHL
         Vdyl6vrX+sQ8mXWMdl3cHzCp85BZ97kMpXuOsXbri5WDJ9Y1eJZwY/2xk48EPNEPUr2M
         g+Kg==
X-Forwarded-Encrypted: i=1; AL+hErFly1zoZWzLg+FM7qreHtSVKpqM+oMcz251FORBzpxnMFb0NqrGmQB4tlly41AZVFaJkpvaaMqfPaO+tCJi@vger.kernel.org
X-Gm-Message-State: APuU4Z9lIN3T3vWFc8RCM2Vf/TYtobvmGKogUwNioa/1kllT9G2dBnyA
	ZRtu6HBnZyonnZEd4Sq3p4RdN0gc58ikSyJI8O1NGB4abBtMDCZgWYkc/ypOdFUDOkiXfNdpC/6
	T9AK1mIMCNuJcK/EV9VRxhJp4Z5bzBtacU7LTpYZpTdqIXsJmzoh/pRGayRf8lfhCzh1C
X-Gm-Gg: AZFdTZcvIYG4E8PxghxwwiuXFUpT3OjTx4WN9SKKARW+eeN0JFDz+RaOiKmeSbN4t1t
	U410W9dJbV0QahvTqoRfKfTDl7elTlgLecQ+KaWckEhBKKfxchG5OeNMgJgAqRlDXdJ5erm2FPa
	+diQlstEAE+CQ1I3lWHvE24wZ6ayHQ+n52xl4meO/1lanOdM0xvg6vMHDqAJP/DX7+0OXOea4Pv
	9B2dWbOUzTiN7TJOJI9Eq1nHN3eBay9ZVFVbtnQPf84cMqWw9vFZ57QTZOwZ34lHefrq+BlbrO+
	cPbpGs4lAB49TP+tDbrpYYVTu7CkdExgc4kMSar8qProYFkXg7UrFzEDImZX/UgEo3wS7gYdMtQ
	NMkVMMAoOtCVL0OCH1YKyAy5KpF0YCzfNhzU94fLLaCHHNGGAJcwQK8VspBvG+APU82jX8VhAlQ
	M+YIjq/fDOL3o=
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr9325321b3a.1.1795431220686;
        Mon, 23 Nov 2026 02:53:40 -0800 (PST)
X-Received: by 2002:a05:6a00:2c94:b0:8a9:b07c:7715 with SMTP id d2e1a72fcca58-8c8792a497dmr9325301b3a.1.1795431220221;
        Mon, 23 Nov 2026 02:53:40 -0800 (PST)
Received: from hu-gthawre-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e456a7sm5330863b3a.29.2026.11.23.02.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:53:39 -0800 (PST)
From: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:23:10 +0530
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: Add LeMans Draco EVK board
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
Message-Id: <20261123-lemans-draco-final-changes-bringup-v4-1-dbfc15cd0883@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
In-Reply-To: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795431208; l=1219;
 i=gopikishan.thawre@oss.qualcomm.com; s=20261019; h=from:subject:message-id;
 bh=J11m6SiF1xvvFn7gQOySTxQ2FArKpUmIzJhDjDucqOA=;
 b=v/JQPrZtMh9CPiRHeJ/1lQdAnsmbifrQ9YeQZwNf+toWfXHTY4kwDntqTOT1G6r7bgPxk7NcD
 d3fPqeQU97PBujMJEWvc36ZJ9U0LivjEAd6xOda/g4UFOD/p9YM+yeW
X-Developer-Key: i=gopikishan.thawre@oss.qualcomm.com; a=ed25519;
 pk=l7diN2ZWn/39T24vZixhPPrGDEUF6RKc19MsWZubM6s=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX7HooxR0Ngym1
 uilqMAab+LxjjJKloKApOkpGr2YZzJLxsukwIMnWsy+kVj93Iml1ZlzfO31OmoYFN/l3C7hKOSD
 SKVj8HKiFURN9ygAwpyRif4uETzF4ds=
X-Proofpoint-GUID: rRkFMexvkIWt3Nh6gEUFUqczzBydgSCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MyBTYWx0ZWRfX7LfyNT+4C28k
 rjR3MAqtiAhfLLQ35ajeebBvcvUZNQenRSA3JTfQto79iOxkNSWP6Wtp2H2T1krhVImpnvih6UF
 ihFOwyH21hWGR14IBUiV1ZUiHqO9W+b7yBdBrj4sQU4RzJU9bUeWm7MPRCLmnwK7WElf8eOBRE4
 bdYZi6J609z5gg8D8FU0dHS7agBk2uMx5F4fw02RRz+IpLUGJTeVQggpD1DOTrU2rDjCprlt+Pl
 fIwI/XnLm0CCzCHhw8xBD3QfgqOER/4aiYeORFuv/VhI5v829URPYwjMdvrUfWbTqJx+wRQrrTr
 5P/EOnAX0dgNe94Gm5WJ3VBT2S7Ipsc5acvDNbuHsNkeYTKuweeJ7FZlalH4JK5M8Zh0h3y4La2
 SpDPTtL5PIUSuuKiD0wDA+EudqFLrgJMKiPg67fG7jOM0Y9C77WmtK5Ebkle1C3v6oas+aWlcxQ
 TvN4aa1pd4S0AbD8Z5g==
X-Proofpoint-ORIG-GUID: rRkFMexvkIWt3Nh6gEUFUqczzBydgSCu
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b041b35 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jgbjWhLY81TnJwHp3GQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230043

Add compatible strings for the LeMans Draco EVK, an evaluation board
based on the SA8775P/QCS9100 SoC family.

The platform uses a two-board design: the LeMans Draco SoM carrying
the SA8775P/QCS9100 SoC and core connectivity, paired with the Draco
carrier board providing application-specific peripherals.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7ffa4f69987f..3d63e797cf60 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -545,6 +545,13 @@ properties:
           - const: qcom,qcs9100
           - const: qcom,sa8775p
 
+      - items:
+          - enum:
+              - qcom,lemans-draco-evk
+          - const: qcom,lemans-draco-som
+          - const: qcom,qcs9100
+          - const: qcom,sa8775p
+
       - description: Qualcomm AR2 Gen1 platform
         items:
           - enum:

-- 
2.43.0

