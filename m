Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066DB47F2ED
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778622; cv=none; b=YJac2u1Wzl+JXIDMr9Hyd6JmgcyaJ1ahR63x0B0qADvwRKarOwrIM9RV/UXNCqK0clVxVg7TiTSmrfIKwsjQFGHLJrXY8XbAeVVcv61tS46WKRlauxEaep4jSBMR3KBqT5T+rqCtnZRgCYR7x5BipezXCs9AAFKaySPIgDlMogY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778622; c=relaxed/simple;
	bh=v1gOmgndgVwqDZV5PtIH26ja5YsrzDRqZskTemBCXng=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tbg640OOkSv6/jAbtjUKLMuQEbm51At7i6d2JdO9++Ry35yfTi5fWxjGEzUeh+AMKdg4GMRBqIxHkinN0izUD/I8I1YkjZOe0KmR7z7e4m7osb8Je3jZGFmqRN94cvTqMkmxS8lPXvQb7dpzLBHR6a9uZPcvIHAiondsIFSEoWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMDs+HB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hoMn4IyK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMDs+HB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoMn4IyK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amx65810032
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=; b=SMDs+HB5G3BJ4Haf
	jEPFDlTrUrnXF7BWyrIGYFivDdaud7fvIL7+z8AlFDabEKQyYfBu4fSNhq4yl1nZ
	EIOtEI/8q3+7EZjsLZEF3j2Z03Ahc03OhfzaQ51c1UU3czOPrtrOdnj8ekouxUeC
	jPLaA62Vlyo1Nbg98zcUOiGEKCDXdxY94gfO/FxubMzhIZKCUbNWJRdYe3RmJzzI
	2TTJEgShVm9J5zEjKcCcjtb6jSA7lGelod47u9n9QHQB6mHPHM0x6urthO99O8oy
	YhC4FGmDDfOf7c1BqNP+efAqqqluBIu65b0AeBM+P8Me5n/AiHI0Py2+XWNiFWKp
	SgCE+Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua91yx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:56:58 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so5601007a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778618; x=1789383418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=;
        b=hoMn4IyKPpo+eSABUFLWrwTgFo++A9qsBjJH5kA3+thQUk094CgG1NMqXMCR79MVLp
         rLLexeSf/ZJlzQXUNBgo2yhoNVByfWh/n/MkKHExYIZFWQwfycb07Wz1ctmWhXVDzrxp
         LB0abEYzTDa/By1ETkKoKIYDH4k+RtViJE3eyQkUT+eMQIdNGGDGM0aKbMFe2lGY03ye
         u6E90yIAlJjiKuC5e0lKt1emia3+deWCSA9kNpgtVdXgkAGpRScnrLlpj9ITUREWqV1X
         7WCPGZ149PCzAhv+EjVTkWuYta2lWuzQdfc2gRv3djrafY43jE6RvBC4wYff89cMYnR+
         JPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778618; x=1789383418;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/u2aOnm7jMdJvz7fdHpTftANtj5i2bKRGQOMp2ZeKc=;
        b=d6pkpqjVLlmWf5egcrkpDXvZPZ6JAdkCO42j2BfsNAAIbL4tEC4pGMz0T4KDdNwzXo
         37/UmUNI8wiv+EuBHL/Ur8R7o/w33JLMwF51Ef5QZItx1Qfb6QEoBESmTJ8p1dt63XtV
         DD3EKic6DBrvgb2ReVlUwe4phJkixk/BfTNsP8RLEKqVy8b7q7TCqriib/+CFNdx/5X4
         RXmSXSp1qvYjdXdYTl/2N5Hi4fo/bOUxRbfS+9rbBt0laLQ+9vPi/U1fqCHFv0H3PkO6
         g9OeFRKBnIBnhQBg6+8qUAEnuool1fH8g35qITI9eWoGfn6YWJBDuxgPZn5EJ97KfLZy
         xSAA==
X-Gm-Message-State: AFuF++mZZbrZvVuzYR9Wd1ALZMURsj8N4C6ZJijpZTLLMUKgN4+cPG+T
	KXxNkd6dF6XN30OrGeQeavJqgZB305BrEWoUncM6L02yCkKqWnPRKl5xAko5w3Tpteu0zvKa3bG
	hR5D6rClnPoYDL4l1Ow7TT6dfdop5GU1phXberbLWL1ESgPH79Gg81lT2GhACrgINkmCr
X-Gm-Gg: AYBFou2SO51pwZsRLXz2UpsB3a8k37Go+ucu7Iw28f2JL5Cf4FrsiauLZsmsneTSnZ4
	/FhPpjtHq9YdqGgk/dcuz/7G9jUarAAMRjDHHg1MX+inmjSafJguVW1cCbPdSqSEA/x3YRKHCi2
	ls9uVUi45+PDR2twLJD5IwcmXtCx/DBBThXVS4IfdXTXpnu5abp0L4ropJKdz9I+zh4bROySWF9
	9lr8XTmxUDbH/8aUaCUxGaerTpW/J2jSMWCzN0IqniOtkWOETScl96Avo2pu1r1TM7td9OjEPTy
	HVKqyx+f1kEUxiUDa4yabKFBDlPgdpZBCNLJoWwRDTSt1Zwz0V3bViD7n1BLMVrXzSMh0frwF5j
	DyKoc9V1gzjJ/JZd3gRBt5va5N43ncTJWzDY04Ny3vsulrrmeG3FF+YIuzvcY5tB3nJWCZJqrMA
	bzYjrbB5IQSrSUTdMuDQ==
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6977281a91.16.1788778617627;
        Mon, 07 Sep 2026 03:56:57 -0700 (PDT)
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6977214a91.16.1788778617136;
        Mon, 07 Sep 2026 03:56:57 -0700 (PDT)
Received: from [10.79.116.160] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm30014762eec.2.2026.09.07.03.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:56:56 -0700 (PDT)
Message-ID: <97360c1c-f573-48c5-9917-4bbc34ad394d@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 16:26:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Glymur compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>, Lee Jones <lee@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com>
 <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss-v2-1-75f7982dc983@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: acCNT_bbCTIJ3tUzCYsgBoHn5oIbVGaJ
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e987a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FCQm1kSmxEXMnWVgeMgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: acCNT_bbCTIJ3tUzCYsgBoHn5oIbVGaJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfXzho+0W/UKjF8
 x4G3VMGa6Am80bkjjhzHkn9gAUXvwy45NKti4ZL655qZhw+aLS35o/C6LXAzDBMVzCVmYJwp/S6
 FLPBbT5Uxgj+lJWPp86XLkVZQvERmgA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfX6fkohZuK93PR
 AGcQVSlfRbP3MviPmPUATJkifEHV6YIghYJ8T29CUGRQtHo6wKq52N6Xo59InNTeugYpAGlTSqr
 6UtJU5yu++1m0W3ey0L6pZU6CjJkrOFL2SnCE6KHk+zB79uMY+4MEILV3hHU7uJ57Ul/d88EGJ+
 9mCDbErkPxXXIgjlJsMn0/0zZMDNO1j/OBSTfm0tkS3c11lXajFLeW8VkB2kPKoMdpMkzbDD4g7
 QeH5sRZi1S9Zh59nNk2i/C8XPvChsjXJ7d8Iqgdcq7zrVf45m69kuya5qxOZwdgBRgh6XvE+sma
 fjdXC2M+VDLc7ddvscaq4FrdaPvaML8U4EphztaQC//cR/otHU9Ude4vE8k0FuFsShvnpk148RA
 gjilcmlRFvIFYYyCpOQj2IRIF1d2V3cOln9oTYcy0AsL2gTQd8CsBuc75NYbt9yjCHRWc0GDC5R
 0w8p+nI6ZhKViDpCcmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070120

On 9/7/2026 1:43 PM, Nihal Kumar Gupta wrote:
> Glymur integrates the same CSI2 PHY IP as X1E80100. Add
> qcom,glymur-csi2-phy falling back to qcom,x1e80100-csi2-phy.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> index 993271c42fa063a82cb0f6edd41e87b30bc8e109..7ac944974849b99abd982b1544ef39fc32e1f21b 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml

There is no such file as qcom,x1e80100-csi2-phy.yaml,
Same was pointed out earlier on another patch,
https://lore.kernel.org/all/20260722-literate-nondescript-seagull-cbdfaa@quoll/

> @@ -16,7 +16,11 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,x1e80100-csi2-phy
> +    oneOf:
> +      - const: qcom,x1e80100-csi2-phy
> +      - items:
> +          - const: qcom,glymur-csi2-phy
> +          - const: qcom,x1e80100-csi2-phy
>  
>    reg:
>      maxItems: 1
> 
