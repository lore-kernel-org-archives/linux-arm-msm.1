Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FDE3750D6
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340917; cv=none; b=Y5lCPaMAeNgGuQo0dewd/Vl9AsMqKwZpr71YGVBFcz7yy+4poePyljH97gWOqmCWaC89RrtEhgY5hqvxPMie0qliYuriTojnHE3fOQ5A+hWXrsOnTFmTIn/L5x61XbWqb9wHyPIQDBN2rRcW0xCtfTSxYexYBbX8oiHyDzstPI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340917; c=relaxed/simple;
	bh=hzENYz/UqfOSop+isXFbN19wcN2RSXEA/Jd9F6x3uPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSeoePUf16dd+TjB/wN4eZ2BxVKknRMpnCYsmdvGAknNFhpPrABvEIbacpbiLat9/1mKIXxZTpvkc8Ru3VxqEDW41CKgQbd235DxccEQOdp3MDOwe/xXme1tp/8lWvncf2ZEljlUeymGCDMZhUdtdOvxrjWST8yw96wsOcP0Nbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lYbhxFda; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D11LTpXU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lYbhxFda";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D11LTpXU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ya3G208432
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EaqTjsuyaFdV0Hwl06FqGOg3GeCVfMcjUqvq07conHM=; b=lYbhxFdaRzaMuWV3
	89pwf4dVTojsJNLr+OLGSUFhgScSt44/yNhsVK8NI2LaYvdPj/g7DTE+XBw1pnoX
	q0Kzz59JON+czU2yCISEdcn/8RDKJwPmSqokKqx2YaB+iAVPsfSifnOo/AfqiEI1
	YDTbZiRbwuAa5QdsbymzuK7xqgl7225hbcKsKyGOpwOxblDQCpA2if87qSb1OLOf
	YSTN7rIFgB4ve+7wEE9GjDNGWo7CNhoV0NfXlNqx40f7QptQs3KdCgkK9pfekacf
	SFc2yijSJ1O/ItAAa9ZVDgH6V4Or43dncDC8SRuj6lUHESyC9xiZBq/waFKbqa/5
	vOaPJQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898uhj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 12:55:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-77f133855b9so13261137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 05:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340913; x=1790945713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EaqTjsuyaFdV0Hwl06FqGOg3GeCVfMcjUqvq07conHM=;
        b=D11LTpXUw5oKAfA+mPZ9/z1m7eWLjyV9KiqHOI0T08ToQxT5NlMdbFCnwJb4YI7XBJ
         u5MuY5AFkJ57m0oQC/tdJ7IMX7o78/wrNuu4QN097zh3XKmJeXgXOpH1x1TsH04lEaab
         M4goLQ+W2Ix+BIoJscF++x7jwo1aeUYeSRzGOzZAnuYARJyQ09rLHIST/aLGbNUdPQA5
         OdURFgrWfqmVFHdXztOG2PpLyw104T2epVXbPod4aK/SwiTTKo0pyTygoUuqvb/tladT
         zwlj4IVv+l9RE2IK96qn1GlU09a4NnPwFtrwmshY9Fd4R6V0YWLJ/uNFx0WKlAzJ6cks
         3ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340913; x=1790945713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaqTjsuyaFdV0Hwl06FqGOg3GeCVfMcjUqvq07conHM=;
        b=xBe5qY6AR93ypKzjx9DohQvFU3/tDbkKUbHtG7NBoj8t3zkX95NY5k4w9DZwF6Z9g1
         C3GxMN1p5Y4zUUd08Lpdzkbq8oMCwsbwJ1tmwfdMMor9feDTnCkJCMp/B5EqORjg84sI
         pYf6mkix8X2jIeMFokuCNjiGgBnBBXOw4iMh+2k+erssQzH8xzZP4kiYsB57GffF/Ygp
         wtZg/O+F+rE+zMnsT90LwYW3f4ODpsjho9X/gWLIrpqHRL2CtjNyy0yF41YJg40a0+pr
         JeSbjjx9EgMABg+ZNgTUwnqdSWvvW84Trerfk95bajte9bHEuwtN3CB3Sdsr/g51RpEq
         qwRQ==
X-Gm-Message-State: AFuF++nigR0TotefAkNF3nDAKe7njfzvhM/NHZFvZZeuc1x26L91VlOm
	GTIhylWGvfqhUgiyIxwKdug4/hEB9YheB+OHaddpn+7BNrwFmSAoD9vAKyDgvjonJAGGE9qMDTv
	l/W/koo4WObqnD0JIeyxzr0OqzwP6z4jnpDQBk6q55a3uomE35coP8SF5j2EXjsTEe59g
X-Gm-Gg: AYBFou2SH5uhS83Co7ToC4qIEuTA2T68u2TraAaEEUCPV9Z3wnfnX5tcqXdBiRRCMz7
	Dj7u+rLEfecaEFO6drpjmSsSYuJ+sfsXlXyp7sfB+MiLPB0uKFKd2J/MXfZUmYWt0WHT/b3Ldkv
	MsbkL+sbaoZu6spEk+1giZSlloRctYP2r8A5Vdtvwwzm5ZvEWVdqO+760OjQsHARWUtwLh/1MiT
	FLFGLqpd9YzJKnnxeX1Ck41vWrQ8eXt8AVKtyD7UJlLROqqFiPZmh/uILuwuxrdMMgm19HPv58V
	XKkw0NUDZ25XfuHqMC2qXT3YZbeCOmV8EUKfbVliUyMX7z/zTJ4McX7lonjQAvefWvZUPXsofJo
	rED5eGk3UZP4ta5r7M9fCEA==
X-Received: by 2002:a05:6102:5cca:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7b07268e85emr792781137.0.1790340913029;
        Fri, 25 Sep 2026 05:55:13 -0700 (PDT)
X-Received: by 2002:a05:6102:5cca:b0:79b:6220:1c6b with SMTP id ada2fe7eead31-7b07268e85emr792774137.0.1790340912582;
        Fri, 25 Sep 2026 05:55:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7800418sm111442166b.51.2026.09.25.05.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:55:11 -0700 (PDT)
Message-ID: <6b0ef83d-395f-4761-8c2c-67851a8fcc4b@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:55:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: nord: Add the USB controller
 nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-1-ba2b39f1a843@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-1-ba2b39f1a843@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX2lZ3Qqmm7hVl
 kkyzgdZS9NBABEnxx4c3HT02a1CJVVUXLpnBnvzj/vZOKCqdix4vP48AW+7CvnqrCw1Ufo0nnnF
 NOTm9T1fCfk3qVRjUZHgz3++VfjLQOSsjHa4KWYGVi5EGfeBDaTphzoKxru1mJ3e2vYVdrJUhmt
 uI24TCNSrlKFSWmPOT2vqe92hJBNA0Wroyrh+RzdwxXXJ6Cutn6cBFnaaZC9u5RCdQLz9O+5K+n
 ycrE5TReekZme0ptNdimXEahYonu9aJlkYbTEf4IZj0IE62ec91NUpj5t4yJFBqFTolyPICJ2bs
 jbNzCXM7flHknhMz/xd+bJVdZ7f3vURea20KB/92CUJkZVyXhVWp0atnoOqyRvMy8EeQZYJZsCi
 w06EKlStffHfgseHnfNxChUQE2qstfDXrOVUX30WIYgK3FA7LxMrcAMBSb8K7KFAIroiE1bZ5Jy
 Tb3dXJqVgMCiIwF0brQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX+soN5NrME0sD
 32pW1dJPU9XXyuml38rJI7bK+ZW//ofvAQgLcjHGhdU9ah0/CWA6csUJsbLMwt3tok/kYBhDTyo
 jFgcyLMDIoNkiob4pycptYR+StTzmyM=
X-Proofpoint-GUID: KN8SciobaoYnTZW42YYxtAvBQkNpAeVu
X-Proofpoint-ORIG-GUID: KN8SciobaoYnTZW42YYxtAvBQkNpAeVu
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab66f32 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tsQs-Y88EExeHG6vkYsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250051

On 9/22/26 5:01 PM, Bartosz Golaszewski wrote:
> Add the base nodes for the three DWC3 USB controllers. These carry only
> the SoC-invariant properties and are disabled by default. The extension
> for the embedded Nord variant and relevant board files will add the
> platform resources and enable them.
> 
> USB_2 has no SuperSpeed PHY and no 'ss_phy_irq' on this SoC, so it is
> capped to high-speed and told to use UTMI as its pipe clock.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
