Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89103F9A15
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423129; cv=none; b=eCZqJJ5EYdlvPg3y0gSni6e+PhlLEIe673A5flmR4OcogbW+GDpzW+jhpCh9wtJ667XXPJLUxJKa6UM3HRV4UqQ8z76hJwN7aiTYxy+CD2TB9SzKrHCJiQ6agTMU+N3BpDzV1tPcTDunJppfRL3nWVOqJq45y/slBBDliUkA63k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423129; c=relaxed/simple;
	bh=LP+faQ2q9FfsPkGPTysKaeADczY8Bs1t2OWTsH1X2fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=modB3wsGLiDLDaesZb2uEigWbi2eJFHKaaBnOQyNotc83OeMwxDBNPqG1Mhxgyg4WIlA2bAHmYZNPSUAY791ixYczHmBqV//zXuhgE6PyzkTlFxjh4Ysyi+xzHbD+sFSCEBghkLgXkfEbE/FoMo35i+PerZSYTOymzkV5IuSnRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NiTy2hYp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=imeAI/m8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NiTy2hYp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="imeAI/m8"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lMkJ324615
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 08:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xTwr/5OtEq/VpaOWQL4jObXZ7wWN4MYqtYLvdmVNJX4=; b=NiTy2hYpa7IuGlYu
	8mZj5GcLAaf9exfWJdVMyg5wT7ljKakRvRQ39170wM32MBQbIM/DeaTAJD0ZWsrV
	xsJBGdtjRQJCHM9iQLIfps0ZONC/qjWBe0cMQpHzZc+8SIFiK3Xlat5J2C84aCWc
	4Q8ZqXbG5gqVWfQbexlVZzpoOvO7N6MQUca15GjaThDZ11YcHkQf5Uyb+Ufpxqzf
	ZVPquDIt2fkLHnV+w7n0DJibOI9pElrFNoTANJwe6+b5uUMhB/2F9ywBx+UKI7S9
	pJ3xoHnHMVo3teVbcY2ExGvvf4MJG15LOR0N9dAQkYFlQCktFMUsQR9ku5yyVAfh
	YI3lhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gerdnb8p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:12:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so850454a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423122; x=1789027922; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xTwr/5OtEq/VpaOWQL4jObXZ7wWN4MYqtYLvdmVNJX4=;
        b=imeAI/m8BeXRW+375JN5j0NnL3st0CYnsLsWwf8OQ5CSBtO9mQdOHKQwDQ2PcleVF2
         WN/tZ7IPG/S3KgfjY6O9VWKZ/hqWJIcG+GmB181vbey4rN2sV1zr1enraBpbKoxuK2DQ
         mDg0OWNAFvLDRMrbUNTV7DrVrJbI7rAcv6pJ15A/OXIVpXGZlwCL8lz8AZ2KgjCZ0BVI
         6RmnD2GuVgMfl4iqopfuSANYQ84RJDHE9OLMLvztH8WQRQ8YVNcyJWIgGWI+aQnv4stc
         j03tIiJX+GeAItm+WnuBkWOCNbn9UBzkUglQAigdZ7vLKj7zq9Xfo3xA3BOUFyf8RWKw
         vPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423122; x=1789027922;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xTwr/5OtEq/VpaOWQL4jObXZ7wWN4MYqtYLvdmVNJX4=;
        b=bbhZr9yinXH+ZR2DxvpVS71Zd1aVI64eeIyGAs68UbJw/pKvsfQmZeCMFesvXd1p6M
         0+ORn1K1Rj0Ncli5DV6Ns74vCYFn/wIUVrGhU/HlbDYQgjMRjbcxEv+L4Obso5zsNlBk
         G3crvACScRJnLNE0jmMv0sYINx3ia2oROXztQVmbEZaJwiSvx+r4sZ7bDZBL1iA4iJFb
         07rTf2D+eatjoYXoYUU54EHrcjL0uadVrMRsWiAVyDnasc0SJREnkFfBZ5k27NN8wKLa
         8M1NGjSrduCW4pup12d8o2LzBZEJO+NggO8V5UTrQYoVXeDOnFW+ii+nNGzVQSrF5Rnm
         FH7w==
X-Forwarded-Encrypted: i=1; AKwUvBy91vX2EWgVPXnLBmmHv76y4ZWxctnWtbsziBji0/DEgUoRUWp1BJTmpxb8I2emRN9bHknVIGt532sU20B4@vger.kernel.org
X-Gm-Message-State: AFuF++m7rbofBq1XkVrby5qCg6Iu9AcMwidSJSt1UkR8ZIgMveBr0Y9K
	zjMrFKKQNt9UhCPXy9stWNbKpbvWA20+MW+095gYTX6oTB1r8x5RmGBeG+WcRdYbipwGR/5sTOz
	P8DIKVD49nOjNMgoQQA8NtEGATqMBGXYkqwXYMp+DQnjtyyd0LEOTuOTGfQB+7jky36d9
X-Gm-Gg: AYBFou39HFbPzq8wZnzJ1bmj6rBNj6PvLmY03jqnJlQbDcIsFIbUWbgIhsal7fHW9pQ
	Yu6y9nO3af4tiKApUCHD65nWo2W36G8jd8meZfFqJYaus0rYWYRN25ipjtYlrU/4Ks2bk8+xvMw
	IbRmDkMlAlpMBqcrx405iJMOHtNB7HNE+g36lsvTJZo6xFpWRKLVJ1Ju5P44TW8Jy92k5v/ikFz
	TBEvodyG//xz+UxzW3CMct063g7D/D+98mUYD+GMgtv2yzB4mmoF/su9HTcS9euIhjMx1HN94Mu
	p8146hPWfGubIddt/eTN6TwFk2tztHkVHScYZDbPthp/JqdizYxfA8KgGxIldEFJ70f5cCNiEsx
	KKZRHHvzO3TfLgJekWqfUGr9u+t7SXlu1mX6T7t2lNY8OYocnICIcz7NuWrdmn3GlAQ==
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1762229a91.15.1788423122208;
        Thu, 03 Sep 2026 01:12:02 -0700 (PDT)
X-Received: by 2002:a17:90b:2c87:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b133026e6mr1762152a91.15.1788423120264;
        Thu, 03 Sep 2026 01:12:00 -0700 (PDT)
Received: from [10.92.216.81] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875e5e9sm4332855a91.14.2026.09.03.01.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:11:59 -0700 (PDT)
Message-ID: <80f21ab6-3d4e-445a-b156-7326b0e92998@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 13:41:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Fix glymur binding
 for non-MP controllers
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260828081542.52796-1-krishna.kurapati@oss.qualcomm.com>
 <20260831-messy-ebony-warthog-cfd727@quoll>
 <ce5bf06b-8284-4355-94bb-416a8e34bd5b@oss.qualcomm.com>
 <cc52ff33-3da4-492e-80cd-ba2b1711bfed@kernel.org>
 <6af2e860-ba7a-4f86-a0e7-872a312b47e4@oss.qualcomm.com>
 <3574212b-1a4b-486a-97df-1d6ae7895097@kernel.org>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <3574212b-1a4b-486a-97df-1d6ae7895097@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcmNIQRf c=1 sm=1 tr=0 ts=6a992bd6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=hQxA1nNTofH2dBn-U5oA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfX64M1FEIMEwx7
 KAoIwgovvg4dlbnRKVaI9z4uSD6bmBM/U4PuFmCFf7sZYYjkeFQL6QinaREOqefENUILA0qeM3V
 tOKjIfdPDGtFNqTCzr4IvwDeecMw4i8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MiBTYWx0ZWRfXx0GWojzpEGf4
 1zIv9DLOx0W/pa7rniMn9iLUNJ8l74XK8/N5QPgvew6H9A1Sle5k8eig/s66imk8TI+7iViKz9d
 wxt4rQOl9jsvJmiB18N1dHJ01poISFqRwjJBrMmMR4b2IElBivm1lHjIyqbf4DRWmKsxD5x0M1c
 Io2dUFVk+bdZyShlDOZ1S6qASMx5z7OYIuXjuGDSwLUZpK7cfyrfDFWzOPdHQntJJiRG8OWhE3p
 OPtcPsS0QIBX/CmnaLJIutJptj46vz3CJF1W96a1Pjg/XTh3WwDP5KdICU+TheLUiTkqwMX86Gf
 Sg+I07zUkkmuA+2wuVBdGyvgyNArQ7J4et04MDcq5mJFdofwvBSdI8cIHT2G6CtiT/xoCjwZdxu
 4ztQmU3PA315bpLauT4ubB7bJo+WnXnvTc7nf7HdxJlcJes2aQv4gRMCCl5+CdgUG3glF9gGB72
 CG0TcOR8UztdN8Cf5RQ==
X-Proofpoint-GUID: NyooWBOnxbV0m8W-DT2xCUY3tk1ntLn-
X-Proofpoint-ORIG-GUID: NyooWBOnxbV0m8W-DT2xCUY3tk1ntLn-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030072



On 9/3/2026 12:11 PM, Krzysztof Kozlowski wrote:
> On 02/09/2026 16:10, Konrad Dybcio wrote:
>> On 8/31/26 2:29 PM, Krzysztof Kozlowski wrote:
>>> On 31/08/2026 11:03, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 8/31/2026 2:07 PM, Krzysztof Kozlowski wrote:
>>>>> On Fri, Aug 28, 2026 at 01:45:42PM +0530, Krishna Kurapati wrote:
>>>>>> Currently for Glymur non-multiport USB controllers, number of interrupts
>>>>>> are limited to a maximum of "5". Either hs_phy_irq or ss_phy_irq are to be
>>>>>> present.
>>
>> [...]
>>
>>>>>>                  - qcom,eliza-dwc3
>>>>>> +              - qcom,glymur-dwc3
>>>>>>                  - qcom,ipq4019-dwc3
>>>>>>                  - qcom,ipq8064-dwc3
>>>>>>                  - qcom,kaanapali-dwc3
>>>>>
>>>>> This changes the ABI without an explanation.
>>>>>
>>>> As per the harware specification, the controllers do have both
>>>> hs_phy_irq and ss_phy_irq. Hence wanted the binding to capture that
>>>> info. Will update the commit message accordingly.
>>>>
>>>
>>> So the change in 99df63d20dabda8d7ae01bcca7cdb1e92110a555 was
>>> incomplete? Lack of context here is not helping.
>>>
>>> If they have these IRQs but it does not matter, then it is not a good
>>> reason to change ABI and you should just add the clock as optional to
>>> the end. Was this binding already released? I think yes.
>>
>> IIUC the intent of the patch is to allow specifying the currently
>> missing hs_phy_irq on non-multiport controllers (i.e. usb3_[012]).
>> Bundling the DT change would have made that easier.
> 
> This does not answer my concerns. So repeating: patch is changing ABI
> without an explanation. This means contributor needs to provide
> explanation for the ABI change in terms of actual impact.
> 
 From a functional standpoint, there would be no effect. I was trying to 
make the bindings reflect that the hardware has hs_phy_irq.

Regards,
Krishna,
