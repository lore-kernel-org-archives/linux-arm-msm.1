Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9F323817E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241860; cv=none; b=qvK9HPEgji3lZHNdy7ydpC6jKB3Lb+6KL7QlKmCSslMmdHyLvy+GZcLClbg8Rx2rahrXepr1c8N/0q+f3pP3uEwN6uvRXhqqTHRoPYZKAdZQgs/BB0PMUILzbMNoVwG5VxsbFhhA+GsAoDyoc3pLfjf6etAWpKimmJWxwYJsarY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241860; c=relaxed/simple;
	bh=IFMpim1/GOtL/ZDM0eWxSQ+WF7g/Ufj/Iy6HnaPwGFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwkhDg8SGWPoU+4aEh9s+uVFkRN2nDen9l5ZCjFtZo80mSnZ8NVgpa5D6IWyCEt7S/wPOmZpZba5SLbl9LBAstwb1t1SLHMAFdRBvnyz5qroDRgCM04OBrQkhIiytKbQcoKBe8PoCJqa/aXUgNZxPKVgXStfq5nhVcxSe7XoXvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FxXg8Owb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LrV6kiTX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FxXg8Owb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LrV6kiTX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHsAg2606190
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wXlmgbHkmTG8L2FUkgnsdu+TPqHPW/vt3lUtBvYll1U=; b=FxXg8OwbnZhsPBig
	cTh0qNzz9HYP5189u3frH7m561oEgpTxKOAbOvIVZPT/fbyCU5AhkDLfMJsB45M+
	ZFYDpSvkeXiFvs80ap0+szJKS4RG3ctEVep6AJjNbALHEx3KnGwTuT52oVfVHkHD
	geLKJQH090U6fkaTy5RgviXQUoifSyM5NfJBOqEULxEjsppMtR/kmMDQLzgPfkK/
	6q7EnbypEYF8pgULeDBqTByhGfo95GjQvkPbc4cY56kyFDn5jXY4BoKtjGDx7/NL
	bShlzIldWTeBIls6uTNE9R9p8qS2YwC2LWZ/CZtjC556+ifgSuW9x+j3p94Aai9Q
	kKplog==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19hybg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:30:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfe48ca1efso39746945ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785241857; x=1785846657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wXlmgbHkmTG8L2FUkgnsdu+TPqHPW/vt3lUtBvYll1U=;
        b=LrV6kiTXBteavZL9RYY5D6RnXgFuKUx0tGKXkMQD82BBqJho5omxD9R42Djqx8eTC3
         0XBMhMGEYaULgMq3aOD8vfe/VPIzONzXnPQ7ZOzM9/Zrg30X8m5X2afuYUnxXnh52M1o
         RispYKX8nIr1dguXm+78eu+u27icWVbCe148ZNeF2HLeQgDi9MuwGt9yTiZ7/2UA7mXn
         uDwKwawB4pxq3rOXw/wlEVr91MMEVmN+iKf9m8QPLZ3/iNCkDAT3oWjlqOtGPCeAgWN8
         I7MkiKCifqTt0XFvNXyytpooCIJy4extOHgAwjX3nBP/LogckcJj/DGde6nCTjM/0IqZ
         X2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241857; x=1785846657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wXlmgbHkmTG8L2FUkgnsdu+TPqHPW/vt3lUtBvYll1U=;
        b=Vsl3haPvLda4TJPuqAhLaBU6IFMhFJwsFWv/B+w2PZ77q+9OaK7wMVDRdbnpH5KvMk
         DxmqmJDxRDZARW2lKoNN/+V1bVcfbzRNT9lettQxjufGf9H3Lf7v8aCFn+lNyKoQ2LbX
         xM7LOcqXP8ufXstGD8J+La4VfpFKWhqFr1koRZ6ODNRJ5P2e/oM8H9rmDFX3wm5MqnMi
         V0su7DqBczRY/lSLCCQJFVtrHcqMPFUiCnHUfGK3iFePPaPM97L3sXCdg64FUbVL6NSA
         4SPEkB8NAfk1ZMDP4OpkjHWnbIHZxwoO+8DFTeolKX7jdnk9joPyhQTY48DGAG5Bz/AP
         as1g==
X-Forwarded-Encrypted: i=1; AHgh+Rry98PLmOOypGmpAWovCWDxBzqgbWSsrSAosBSwajaf/Ud4DT4EA6KTS+eivQ3NLNlgTc2NwkldKzxEAezs@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmUJt8g8H3RJ5ypGE3QCsaxPAZuoTEqN9dxR/xT5oqgrnbf38
	rjgKJGeuozzXt+mDzrmvT5wo8tuiILgisgU3HH3CylR9WOKIvPNV+G9AaAPFFWAqq38Gz5zcj3X
	DdoNAcQfU+ePDW6jVmDgu/SWN54rHPM02ze+SgF9Ort1yLdiy2OTYqFv5G/Rmk1E+UjYn
X-Gm-Gg: AR+sD106/iN9Qm9iHdS9/z6T3xBFCJFspaFP3zDUCJqGKciOdZRCkzg1kehmHV1AayV
	fpGzAwh1sOYu6EbUcxnfYOAMqvRQNdRQYmbpdg08qaJvr4us92iMoex1Xy3q1T7/qtbKv8hL4j7
	Bz+orhMD6z96wkGjEu58WmqW9irpdzjm+ed2zRMoR59+1nKlTcZcZIq5efKql1/xE7xvubpA19v
	PUQ43ogfX/p7ZfWlFvRbixBAWHQX+n+FjDDYmBdtYpGw52akrKBPUaPh+ESGuOBm0a7odqKlVTr
	ydmcpeoWhxjqYKOxWEK8Swik9iQaQtKKrOaQZGyBZB5Ys9+wpdyuhWcZqr4TK9JJAdoCQxPyU+J
	Po8KTzhg/uzZGc1eGALDBxtiJdotQfspQ
X-Received: by 2002:a17:903:41c2:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2d015cd593bmr25108045ad.15.1785241857212;
        Tue, 28 Jul 2026 05:30:57 -0700 (PDT)
X-Received: by 2002:a17:903:41c2:b0:2cc:9473:97c8 with SMTP id d9443c01a7336-2d015cd593bmr25107355ad.15.1785241856688;
        Tue, 28 Jul 2026 05:30:56 -0700 (PDT)
Received: from [10.217.217.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7f4b01sm51849615ad.71.2026.07.28.05.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:30:56 -0700 (PDT)
Message-ID: <70af67cd-1467-4770-8a87-584920b128c4@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 18:00:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/4] dt-bindings: mmc: sdhci-msm: Document the Glymur
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
 <20260722142342.990384-3-mchunara@oss.qualcomm.com>
 <20260723195417.GA2688724-robh@kernel.org>
 <c99f89c1-fcae-41df-8426-9bdb3e8e9b5e@oss.qualcomm.com>
 <e58778e3-86ae-483b-b52d-d3a0b0d5c59c@kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <e58778e3-86ae-483b-b52d-d3a0b0d5c59c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a68a102 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=6dYgsILb6vMNMVK7bHUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDExMCBTYWx0ZWRfXw+QBdO2N0I87
 2VlFXopa0CvsEZg4xz0PM/QYt03xDoWnW/eRLVy9Zf2oj96fPsl8PY2YM0TTlQ0t14Juwh2XQvN
 p5RONNCzXgw6P3fehVnGntVO6T6C4LSCeBRu++XoDLT3uRQtYuDp44yVI+9+CmwZq0mmgzQT6hj
 uyXvo04cOJ9MwQ4NwqbKq++cpehYd6CdgqdrOvjRxAktp0VO617OE2b06AsPF8ilJIvtbEYMMZ1
 RNFOHKAPCXnOwTEU0ErH2EuCYB5NaD7BGEvNeH8EYmArJ+RqP1OYD+B01zhGLxGyv/MfHNfsdnx
 b0rDyyZfsgdifT1/hL09ZKX0QHa3Pj0zOd0Y/jO8UH/syJwVaAI5y34533p4GvvP9ptRHEc54m7
 mfzJemeTgDRmIQBBdcRM6sn/BNpzfXx4ikpxiAtANFcKsx1/99GogZiC3iAaV2BUrf+mjGlndmJ
 8A5C2C8CUvNHML8CN9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDExMCBTYWx0ZWRfX3FeayPO6xg0Q
 z+0KhiUGnjxDyAil5bM3sfZ+bQ9P1+8WdfpGczxd0SNH1ew6gDXUls9XVnwT4AilRp6UiQHNoto
 RBULZqiH3McmrfNR+IVbB6pEZ4VmbY8=
X-Proofpoint-GUID: E4xucavnNZzUbgwXAQy-krQT7bNDafUt
X-Proofpoint-ORIG-GUID: E4xucavnNZzUbgwXAQy-krQT7bNDafUt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280110



On 7/28/2026 5:50 PM, Krzysztof Kozlowski wrote:
> On 28/07/2026 14:02, Monish Chunara wrote:
>>
>>
>> On 7/24/2026 1:24 AM, Rob Herring wrote:
>>> On Wed, Jul 22, 2026 at 07:53:40PM +0530, Monish Chunara wrote:
>>>> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>>
>>>> Document the SDHCI controller on Qualcomm Glymur SoC, fully compatible
>>>> with existing MSM SDHCI v5.
>>>>
>>>> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
>>>
>>> Missing krzk's ack.
>>>
>>> Rob
>>
>> I wasn't sure whether to carry over the Acked-by tag since the commit 
>> message changed, so I left it out and queried on the previous series.
>>
>> I'll make sure to retain it appropriately in future patches.
> 
> And where is it explained? Please quote me the cover letter explaining this.
> 
> You did not read neither kernel docs nor internal guideline.
> 
> And please explain me the logic behind your thinking - you received
> comment from the reviewer and tag, you implemented the comment of
> reviewer and this means that reviewer did not ack it?
> 
> How does this logic exactly work?
> 
> Best regards,
> Krzysztof

This was still under discussion on v3 and hence avoided to allow
further review scope.

Should have been part of cover letter. I'll post a v5 with A-By
propagated, in that case.

Regards,
Monish
