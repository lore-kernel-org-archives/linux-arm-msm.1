Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818454C10D9
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737842; cv=none; b=OmQue612nq8ipAcdQpB1LvgjTaXHH8VBZ8EDD1LL8lq2bdAzHRykGVOAUQmohoLK2xQfrk2U3avcaDBm8Po0jH4n0lPoBfbRU3aiL9gxUFfBT5gQRZNYlO87LzWbZ0gle3tkwN8hx6rkyewtW8MvFDDs5zcDezr1DYDFIcrwUsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737842; c=relaxed/simple;
	bh=Yc7wqbvlmYIYSmY8DLM/Fc/IZHx3O+w9ugmnjA+pCAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJxM3jlTbblW42+u+nM5TOv558D6T21obdnlDIeil4gprb+Z4XYgdftIzRiYh9V5qUgKY1zezS+cf1yR7E3xT8I33RQewSKcHVIJJLTI8jMVgabKFF/2vXkXA+SOOGiRPJOBiZwrZyIwn0Vb2S4/+FUfTeEQntYfCoMGaZ7nr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hf/BNKxC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HNo3hFAP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hf/BNKxC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HNo3hFAP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICtsLM3584080
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=; b=hf/BNKxCTppZPbn6
	Xo+8ydQNhF/FEBjcg4U4vNdLZTC4jDnxv2z8zvF02U485r9hNPPBijP75Wx/2JgK
	64X1sLLRRsNoSux8BdzkrCATqOUPhpTGVLYgpZw7k1qMt6dY/mfqknYpIkdBIRIF
	8r4wTWA2zwj30NWuuQd/8kFmv9wVs56Ro3Ysp0mLZWYx2cjYehPvDdbeHl7by9GV
	T/voniU4jYQrIeOW2LySKAEyxqJP0OreTpGgN8XM8hfsdztDPiJg1oSR2BFKO7jy
	0b30NJsbh3g/4M6slkJ8SVD8+T7H4TSbXtgIH6Fkt7P8Cy3uMMHGyi4Ic04AaSMW
	dtPCBw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dgqaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 13:23:59 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97b57ef2bso25151e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 06:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789737839; x=1790342639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=HNo3hFAPdhJnm+BC74IvseHMgQ2m3e93jOwHyr0BUPd/fVf4xJwzKqH/mrhnrndg5a
         lFz1urMCi+2Wsyz5vS2Au+PxZ9Tc8/Q/kluYgZfJ7gABfrlyF5Hr341TCu4vE7Z/ZVA4
         mBDSFpisfBoUDfDntAlwMSFzyl2L+wqcBOadIE2w6F6EY6EcBhYNNlAPpgjTRi/7Rvza
         NLeO4gwACDdOxWwhl02bEmrDzjTogM7t9zv+FSUMOj8lpVhAuoNglkKNGMVanxsYP4PI
         HYdLt7+hb38pCpd2rNlk77KiWPA/Y2LKWEn6aXo7dYXJZrgnW/72qEzfCC5y86SGQB5i
         ljUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737839; x=1790342639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fy6190x1sYwn8rEIWDVlCsQILwc5wbf05atZKqyy8Kk=;
        b=2JpPuWLNeaaBSUzXnmT8CJQU36f4Kp2d8kxT0dNf4+UYBW7Lrwjkd/qZ3zUUZiKAcS
         LRUnnHhbVsYovXmeN3I80ssYdMBQwWWIIgRX2PDrgp1ET6JhOEvlOtw4DK9KCkLUpd7K
         AjHvpuUvGcvSuVv+OsupYhj3XyROHgDrqchZspskPm7frycDocI35losxfS4vLZmm3mO
         89HXXGzNvjGXyCacPYXHengINw62roDWRph+2tRh0mVayXN071aIzNBOkIxs00G7hTLS
         iSzRa++Vwoke0xi7cNle0UW4UgxCf2og9ZDh28l75OXRsBsos5rpmRfYXb12lqMbXi+W
         l5rA==
X-Forwarded-Encrypted: i=1; AKwUvBzgbW80mL/g11Q32IOJUJ56kUNiHDOAadzakPgCnppcapkwbbHwKIwnHsoovyckHTjwFGdi0nGHa2KoImLt@vger.kernel.org
X-Gm-Message-State: AFuF++kLWXWekvbSFLb7xyu7gcYT2qZG28Q+39XrYE4QeCMYvqcLM1OP
	3kDBb0RAznAZNRJsvgvXDtrnY8SSZ6AegxUfiFbP9ZL2228/YN+Wlm8nKBZSlZT7LZbR7pxhQC/
	/86QYW4MiEn7b8ob30NY941Hc5YPKOQ+20MkHrw/dWRlnHYhnCRBikB1j2RlkG1Ilfx6q
X-Gm-Gg: AYBFou3E/IWpu1GsKMkMUF7RKorN0Npy3yQmywhRlXI1PM24CWnwx1abUvSlWGBeOVX
	hK9sbxh/JhrTpyOKrO1qxLXfH+9jaju0uxwZ4CHoLV8CI2j5wC5f9FgCnJ/m0uRVadbpQ22yj3e
	WeLMo734NB2sFeQ5S94QlHBj/OfO3lL/obeLBZEdo/ZzpTmCvwDO5sUcf5/399Nno5Y49JLd56Z
	LjPbvRnNFKswPXZgBRJcQK8FY/Tvil2I3AioCNqugAWndvtOol2LglPwAEhME8CYkVue/KQHBbd
	Ti9N+cHR7YRoszhf8qASP3fxkQX1dn1Qi1BNm3T5+0af9KQw1ITRE0rQ/4eyyp+Iu/9TtZ0rLCA
	nS6sPO1+R3sY6XjqabxL+Qg==
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929300e0c.1.1789737838655;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
X-Received: by 2002:a05:6122:1b8e:b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9b588e086mr929254e0c.1.1789737838198;
        Fri, 18 Sep 2026 06:23:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3237bsm856663a12.8.2026.09.18.06.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:23:57 -0700 (PDT)
Message-ID: <9709e146-0f9a-42a5-bfcf-2e5f8b49df2e@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:23:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
 <20260918-objective-okapi-from-neptune-cbcabd@quoll>
 <92b7a87a-c086-48d1-8487-883dda7c4d70@oss.qualcomm.com>
 <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX7JJhDWjRzeQ1
 SapNczvLT5RGckfpe7iOWisx5cXQnQGqjVtbXv2fVMQpAAtYBqeQRf4XRVYS54IVXg9UFernLY3
 SItP0PaYzGnx/8jLyqVtlTTk6B8MzJc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4OSBTYWx0ZWRfX6+Z567aTtdji
 Xsn/kgd/QnWTRDjb0/QSufZWIKW+kCDF7Df+3sixP/ilCcvVNx1vflKCA+KHIi7gexcnXSkynWN
 0ZLjVp3T8FVQTYcsMLk1v8PA9gvqo9qkffeqTBBFDRQE40ToyvmH4iRSMeX93DSt/gTAywb4cg3
 kMZQ4IdqgJnQFFpBeMiWjs+nt99UoC00LT69TNwehtRAdkFGqIRXAoNx4Y0eahaPqYhGfw2HaMQ
 EchJO10/bq+yhnr502xXSKA0GOiFKl+d2pjkyHcvzx8PfTEZgY9LybiuegzyzNc4GCD5pObh59n
 xtcMxrRTIjJQMVvGlxNd3mF+IY5bTSUHEVL0b5rO8jVUhW2eAR0e8nIWjoH/+/hge+ng6xzbDEy
 NUg0/JewXU8/njjse6sVO/aGnCTR7PTgu7YN7zFO949Nq8Upq2LeCSljZ+pVOHLu1P19cuzafms
 DZ1dVSClt9SApXOLeZg==
X-Proofpoint-GUID: d_MYlWcsXjt1ogAituuYP3CspHFrotmg
X-Proofpoint-ORIG-GUID: d_MYlWcsXjt1ogAituuYP3CspHFrotmg
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad3b6f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=PwanzjBgMYuxxlb2B-IA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180189

On 9/18/26 3:21 PM, Krzysztof Kozlowski wrote:
> On 18/09/2026 14:29, Konrad Dybcio wrote:
>> On 9/18/26 1:34 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Sep 17, 2026 at 12:54:56PM +0200, Konrad Dybcio wrote:
>>>> +description:
>>>> +  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
>>>> +  machines) come with a custom EC firmware, loosely based on the
>>>> +  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
>>>> +  customization.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - asus,zenbook-a14-ux3407na-ec
>>>> +      - asus,zenbook-a16-ux3607oa-ec
>>>> +
>>>> +  reg:
>>>> +    const: 0x76
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  "#thermal-sensor-cells":
>>>> +    const: 1
>>>> +
>>>> +  wakeup-source: true
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - '#thermal-sensor-cells'
>>>> +  - wakeup-source
>>>
>>> Wakeup source should not be required. If it is, then it is completely
>>> implied by compatible and there is no need for DT property, right?
>>
>> I suppose it's not *required* but it's highly desirable.. should I
>> just drop it from the required list?
> 
> Then why isn't the device driver setting wakeup unconditionally?

The i2c core checks for wakeup-source - I can remove the property
and call the equivalent functions from the driver if you prefer,
but that feels a little "rough"

Konrad
