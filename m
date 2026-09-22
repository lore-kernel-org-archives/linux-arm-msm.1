Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A06F531600
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071832; cv=none; b=shubW8INYUebzwCcQgn5w/m7pglNtdl8uXXgEF8Z9yNLZDRdeQnSmjjinsd1g9L4LoAoaI5CZt2vYB3u/p/jtgD1JOF3llsNZ4DysNDIUyMr4hLZYSmxLYJhIdlOpnpLeWEo16gt1hal4CaDAI3nymc/WhTURl+/2hrHfNWba4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071832; c=relaxed/simple;
	bh=cp7aLVfqqMmL2LuwJZn+F9gBJmIl/oWao+Xzx9Lsy6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJud1TLyNzEDdCJK9AJnkEt1XDnRfTtJN9SUHBE+jtxAVA0i1aj1zhIp7qNzWI8KTcCA5KICdFTfGVF5JgEiBcM2k1EtsOlLVmErJEdAVq6aWV3RwQPJSR0HriPcZxmOoGRJPmOr9+Oq0KRtyqmhf0P7BkAIwwPknNNEVGGJ+6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hB2KeA+t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANs/1D6k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hB2KeA+t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANs/1D6k"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7Bugm2166354
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:10:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QTGNRnNGOU9Olniee3WOkSX3E9TIdQQscCKIDdT/k0=; b=hB2KeA+tD077GQeP
	9yydTU2bHdO/++SZajAN3/vj0KChQTa88elpk3cMfxk6sU8GFRaDE8oD+/oRxQv8
	04MJ1rxFTRGQd00UQpEtMpY4fmYXY3incC2U8F5p8xiigoivnxSUdB0jRMRwV3lu
	F3vrkwB/vUCQzkA/yZrW5TTrGdYmws9/Sou7evSNb6rnjjsBgJYtQwb981xiWlWT
	q74PmrBOweSuSHosqZTDAB43aUy4qnJacjzUwPApopscg9PEZ9scrGJZkD1wSfFl
	CnzNfYMy3VSN8DnSXGTiw30vsoGCvqTon32P9eiVsg/GoB4++M9XNt4jhY6M99X/
	HZn98g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xeues1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:10:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9106a836457so12835946d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790071823; x=1790676623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QTGNRnNGOU9Olniee3WOkSX3E9TIdQQscCKIDdT/k0=;
        b=ANs/1D6kKOP/exRvlFRkPxqkaMTp6S727JC7HgnPf3L/y9plh9zY+Ne6SgZpGr+Tm4
         9HJozBONC35pGM8Jk997IY1SjWA4m2hUUFFzFnhpqjsP5lHVcRU46QqVy20EAZj2j0xL
         wcGYFWXqKFJoUUUzxlidOcz6SKiz6YqQWr4KUP96QNESijG9GYr8AYdG7n88WcmQv7yk
         tbRRV4sYGju2UziCIi5KclhrACY/97u/J7/mvLawZ8AQ5xekrDXzonaCrJW61AmkFxk9
         s9AnMSN3oOSJK4z9WQD2biKuMOZzkhRQpx3GdZVV/L0cmcqdV/A6WhOMgo2udh51Vxsv
         lBBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071823; x=1790676623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5QTGNRnNGOU9Olniee3WOkSX3E9TIdQQscCKIDdT/k0=;
        b=Qtr74D1ZtSGoTkX2GbEkH3/5lsyN9mtYl8EVojN+1H57fx2ZphzePcIjA+o0nBNKKm
         o2pgQWUny5AbyfdUmsP2ECLQCK94PbrjLDEIZtQjflbJ/In2IfdXpRu/Afe81aHr9B6v
         aNuiyuSthi7FX4mcoz8o9/DIkIiwD1GbidmCFkn5g/AxVlMavJdYLJM9XQWbyJ8+DgfX
         VevFR2eehteBauz6kaa4xZzF1a7mvIF/BEYfREmqHHJOfzy6IQHNQ6c87+cn9A7K8Epz
         aFrfZRYSL3HRuQfwu7qEOXenvbxUNXQkvUtjkU6p32ETJrHqYP3veN4ted5zlrYXKdRg
         erXA==
X-Forwarded-Encrypted: i=1; AKwUvByD7M4yz41oESvv5KwnKpGtJEbjqTURxu9pDFzQJkiLd1X5M+avKUWeC1xd+KEKvTzQPOjMC3guAQP1HmQP@vger.kernel.org
X-Gm-Message-State: AFuF++nZIR9tNvVcZOb8iWDcnTObYkBlVvCxM6SC8OWibSUbUhxPg0VY
	3+LLA/JuITsnaWYGbQUWH1i0JatIlLITAkAriOuaNpo6qNM7RR2LS8h/deipsCAnbScN+tndjkt
	3Ldj4XsxrSdIm32vhHDhLtDP433bXE1QIpfQsWVbdoOdFd3C4icYY/I/luONTEZiw8nBK
X-Gm-Gg: AYBFou0GkrbhKRsG0kj4/WJzrQ4wWMaQDPbwn5tfC4eXpt5XU8n/m+lUACqprnr+irl
	muxfBGpW4DmFb9wIoOXLkjYptBRccubUXfn4I5HDeOJOXDyFO3BbPrM8s2stRU0occzC/hc1aio
	ok8bqF7HHjidwH6m2uJKz42hKkvT+tkEzIkZKS4QDxhkD45SRoRB/eOL9vn51Y+oW0N0McTJlMW
	zeXA8zPaBWyGfCOGOnnfRpu5MTIiiPr1wh6uW5zcwWJTivpR3MxL/L303YPFED+EVNp5Sc3r8hA
	TCN8yWCe2MKV65eNg4db3sgx62kdeasOoDLBTiVoR13gnHwXUx2npv3CQAnWGagC9OQoJl01ZAi
	aGv0wPlY+8LaXD1OlB0qiAA==
X-Received: by 2002:a05:6214:c25:b0:908:2053:b57b with SMTP id 6a1803df08f44-913fc9aae15mr47552466d6.5.1790071822896;
        Tue, 22 Sep 2026 03:10:22 -0700 (PDT)
X-Received: by 2002:a05:6214:c25:b0:908:2053:b57b with SMTP id 6a1803df08f44-913fc9aae15mr47552076d6.5.1790071822402;
        Tue, 22 Sep 2026 03:10:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c54f163sm61730966b.11.2026.09.22.03.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:10:21 -0700 (PDT)
Message-ID: <a3eaf9e3-5c18-42ba-a645-2efdfe161fd5@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 12:10:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-2-mukesh.savaliya@oss.qualcomm.com>
 <ce888443-c86e-4353-a4e1-64f2cc62604a@oss.qualcomm.com>
 <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c9c9c069-d8e8-4921-8007-6c6386c8da7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 3oreQL3tuVKaYwT6L_XbCHDMpvyKOWeE
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab2540f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qXHdgDUTi1Lqi5hRQc8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 3oreQL3tuVKaYwT6L_XbCHDMpvyKOWeE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfX1M2qAFP/puhb
 QpIzkQhF86VAvMUG/epKzM01TEaAoxgBQTqGFQZogbdd6K0t1ScrQ3BewfJyOpl9sdDY/QSt9Gr
 6YqxNrV6EsJVztRLRxhVje15Tt56+80XL1xyPfcW/2M57/k2B3TGBRIB4q4HMCZd5w3jHo89Qi9
 JBKQN7+0UKrLY3Yvj0FgvY0u+dF4RJN+oUBxPxMO093QRiDGJIn8F53XQcl2ntpc4ihISKhBVCQ
 RuEA2XyPUW4krxPjEUv32AalkCneVgewHLB2HIr7T+aHu1mt5cDS39Dtzeo3MrcGoHHxpjrA1Dr
 /JVKb4iZT94NgnOibkCiOsBXtRm99/9T8ABi1bY+gtyC+b81zS2k2V/XlARWwnnxsQiOjrc2LgV
 eh2K9QoUVF4wuO75NuFItaCM+Xea+vQPBJx8E9EJZwe+byDb74wmomUgHQLRGmbeIux1U4N9bZC
 9mFqrbVv4sJ6I138lYg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE0NiBTYWx0ZWRfXyX7UuOzEA+6E
 qyJWJ0ip8QfKzbpyBc3TAzLccHx8WvO4t+KeBQ0yeFtH6I/EMZVyyfQ5QztRkTqGlRDLfNa8qyV
 x8Sggs8h5zsQTFk/e42Jf+iGVkG2k68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220146

On 9/21/26 10:28 PM, Mukesh Savaliya wrote:
> Hi Konrad, Apologies for the delayed response. I was waiting to verify the changes and ensure all the suggested updates were properly incorporated. The effort was further delayed due to some slave-side setup issues.
> 
> I have now addressed and validated all the suggested changes except one, which I have responded to separately below.
> 
> On 7/18/2025 2:21 AM, Konrad Dybcio wrote:
>> On 7/1/25 9:18 AM, Mukesh Kumar Savaliya wrote:
>>> Add device tree bindings for the Qualcomm I3C controller. This includes
>>> the necessary documentation and properties required to describe the
>>> hardware in the device tree.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>
>> [...]
>>
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,geni-i3c
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>
>> In another patchset, you expanded 'reg', can you coalesce that change
>> into here, so that we don't have to worry about backwards compat?
>>
> Do you mean as below ?
> reg:
>   minItems: 1
>   maxItems: 2

No, I meant that since you know in advance you'll need the bindings
to be altered, simply squash the two bindings patches together and
submit as one

Konrad

> 
> I did it earlier to add support of IBI feature, but i plan to do it later. Right now, i only want to add plain i3c controller support without IBI hence.
> 
> I shall add expanded reg while adding i3c support. For now, its not required. Please let me know if this is fine for now.
> 
>> Konrad
> 
