Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAD8443AB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621714; cv=none; b=CjhM0c7RKKSbjKgQuW0ifwOH/wzeyMTlYi5bzVq5qtTO/LQKXj3MZwQuNs7Wfk/s6/AL6X0lobQuk3VTjGykMu7e4xBrDDucAXLq3yYL0fX/ppuUB6OadKfB6+1s1bjsffJd7vOdT2azKLfzM1orYsppt46e31e4puejGHfFIh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621714; c=relaxed/simple;
	bh=Kli47aDfn8sTFT6QxBaC3v33Fczl2UHvcXCdDWn0zlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oiizdlfvaa2Ue1Yi85Ip/DCqdWCzqY6rX+tDjH86WH1mjpqxz2vkoknxMQzSHtJPc6zywzAUg2+GXLIvxOtvar4AZ7/TZL59LoGBNXSjt+Oxh1y0S2+RPG1mC3PqqZXhngEJqXsLxFvuhhxiq3NhkRsxWw/DF53YDLcpZeKZJpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LtoaQrgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RV72f/Xc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LtoaQrgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RV72f/Xc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6FIHx4107224
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BHqWPTGkcUObPXH+9mFnZ5IGzYXysMrpMFOOmXxYMmM=; b=LtoaQrgChVPO3SON
	nH3yhfABGz6hEUEp5WAyMWPbH5+NX1c5lNiWAeDZ3I5NR2w69jVXqHlB7PVNZ8CB
	pp8PQMa2j3Gr2W7WrHbwMde9fVCggRJEsbItfl0YakdrswYlnWJYoTwNQ6IHwV1x
	hOI0YFpGTOXjh5E8wMGOM+7tJbwPsxoQY1+6CyVpo3JngLXWw6P/+rJ10lAHk1cT
	ID8nyDKZ+esk6FkZ6Uzntrs9fW0fEeABFd/wtBQgiFq5z78oWMwhzTEGV16KTK7w
	LFc7zrusrMHvNZlogORq9Ow3l2Q154Tre+EbkXbp1R8n3LP/YccZbmrG6RAQj8mw
	dJtitw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9wyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:14:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848474825ffso5765282b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784621687; x=1785226487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BHqWPTGkcUObPXH+9mFnZ5IGzYXysMrpMFOOmXxYMmM=;
        b=RV72f/XcMUZJ/qZFL7ToqxmFgsuDLc4JoXjGZugpuUvoZSKBIJ+qcpuJZ2dtaUmPZb
         MlaPwNms0SdyG5V3VGqOrfWxNB0vlInmRatwSEd9FITS2r25JEOKoiAH6ZkArmBggm4G
         +YdAteyf8UqMG27Fz3zpN5zaOIl+3Y+i3KWfvozRXZBCw47uW7k/5YleA4TECwh09uVY
         D1Jv7/uLHBGUShr6/l1UJIAjBqVal0UKQTcRvgAjtjY/6RtcHi2X6F79MUPisL5Ny7Mu
         kxIwdvU5aPLn0DXXGNFJ7vJkv+IR99vXLEYFpUvAc3cHM8PhFTC18cWWkEuZ3m/fefE0
         By9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621687; x=1785226487;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHqWPTGkcUObPXH+9mFnZ5IGzYXysMrpMFOOmXxYMmM=;
        b=BqapB1MzI1rtHYWTgm9qe/UeKTLA78sPGZN4FnGhLT9LNq5k5vdBOWpjmuempFHGOF
         7FL8mZQWy1p3wSVTIhcyX/X+4yquPDJNITWynifxEZ8Ce48iaC0tuejPq3jYmEN9Em8q
         81ELZX8rvLD7IO0PB2c6H/Ud4dLJapdQfb+ZqNfydI3+8vNUELPZIAxtxF21pqK1Kj/a
         DZTAJj2d3/yXu3+wGDb+DDHNO8Q713yawERGq+F/zdlCtP9YnW+EgiKlwUIqt466nnm7
         ks+HDLLfoGYcvEvGt1nYkU68kvE30cxnaqbrQfEA+fkOYGFBO72GSsRPBbIDqqcvCMpZ
         rYqg==
X-Forwarded-Encrypted: i=1; AHgh+RpYH7sIdem6ZNre3wg3I1sLnS68ropyZBMMfG9S8B4FvJgCGkkqWxj0JUYST2LDv6/u/aJukinI+CfleM0H@vger.kernel.org
X-Gm-Message-State: AOJu0YweK9vNLG3CNx8Z68Tkf4AyomoHT9aWXOsx50s1Z+FrsPBfgSky
	zTuxVfaa+dV0uF9aZklJYa/bQWdn13smbna4UtMHnG+PTyPTTBpQ8cbyVVlRqCA1OWipC04HeFa
	UJnEL+HEJ8a8qqOlrLGieuNoP1rgVbVPC+SD56gERSYUuLSxJqfkAk3ePkudMIhqPAMBU
X-Gm-Gg: AR+sD10XqeaTcMvWuefQemBCkOCq9kW8s4V0TjFCo1Z81cbMJ1D3DzCZyX3xdFcW4Kg
	QObqlpiKPhHZs2Fjo5I39regnygZWCUyVZPUW68DOC4+q8iIobPRlqaFw4zOdd5If9fld2ypgvL
	ao8GO8Bppy3V/xdQqdC2TRr/FeElV7UZEJTjcvRNgdPqcebcIRFe+RN1nYs8Nc6EMYIukMA+Apa
	cKGCQjz8epU91NdQx9R3rlW8hOdAdTP1OPq9HODDpGOsF70v0CGnPYuKsgiMHS+IhhdcH1aMTSb
	BWLGqENWXjX/WbCplEQ3rmhMZhi+GDI19RI2aPaBTVTIJHofUdM6zCOcqWbUtoehxVPxoTYEK21
	QeFwNdR3nxm8Adj40gNeQ1CF5nRLBPXGzFC0iSEY=
X-Received: by 2002:a05:6a00:3a0b:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-84beb057d97mr21988291b3a.8.1784621687328;
        Tue, 21 Jul 2026 01:14:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a0b:b0:84a:2b96:5986 with SMTP id d2e1a72fcca58-84beb057d97mr21988253b3a.8.1784621686894;
        Tue, 21 Jul 2026 01:14:46 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm7005847b3a.23.2026.07.21.01.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:14:46 -0700 (PDT)
Message-ID: <67179d90-6201-462c-9004-9b4cfd114250@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:44:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260720160226.1026440-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260720160226.1026440-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260721-fiery-sheep-of-piety-4fd04b@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260721-fiery-sheep-of-piety-4fd04b@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NSBTYWx0ZWRfXweOzAazL5a5b
 iyIw0/yIWR+zkgaCiRd5F84h2nnU7H468eHnCu/oskehYaHggZHc7QjgB7aR0aMuw/LdW+O3+el
 cTDWepx4/gytk0TeNsJ0qXGcuh8IO4e/fCVRHkN7dJ/LFz0biKZ36vfneSEbs4QEfEGXVRmPdw3
 we1ts/nzakRFtih1u1EYw+2feg5wFkjmv8ZtSaiQt/JGosEVLbW1zDma0ab3HG4APH+xkhovM6i
 mG3sFEZwLCviuESqk+F2bRgpVGtNf9PL6PQ6bzVSRmQT7bM8L38M42xdTek4hVo+LL4gv9IgNuF
 FDScHxP3dLryqJnlvHUseayFLREtVOhZPzswH9lyKUJ2zURCYBlAP+RfdtljYzcIGCGR06tXGsK
 j4bxJ3E2OJAWzYCCFGm5P5lNmq3knfeyHltAlrJ2ze+1Tipc5ejdgFT5MslbNRGZg+ML6u8bnBG
 P/oYm38dcDQLQJ1qFmQ==
X-Proofpoint-ORIG-GUID: gZ-rUH-mtQP3Gjjm_E9WYIyAybxetHe2
X-Proofpoint-GUID: gZ-rUH-mtQP3Gjjm_E9WYIyAybxetHe2
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f2a78 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pWr4hPsiy6qYYviyjrMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NSBTYWx0ZWRfX1p3anl6hKtlU
 EcFWbI6AOzRacygYQOl0oT/YG6Z/HR25FFir2NwTzBmk9V5sALR5oBo6QKvi3hymatnO5Jp8p8m
 +Dd11h8rg3U80O1uyKsRkUYmTz2ZEVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210085



On 7/21/2026 12:18 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 09:32:24PM +0530, Mohammad Rafi Shaik wrote:
>> +# Digital Audio Interfaces
>> +patternProperties:
>> +  '^dai@[0-9a-f]+$':
>> +    type: object
>> +    description:
>> +      Q6DSP Digital Audio Interfaces.
>> +
>> +    properties:
>> +      reg:
>> +        maxItems: 1
>> +        description:
>> +          Digital Audio Interface ID
>> +
>> +      clocks:
>> +        minItems: 1
>> +        items:
>> +          - description: MI2S bit clock
>> +          - description: MI2S external bit clock
>> +          - description: MI2S master clock
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        items:
>> +          - enum: [bclk, eclk, mclk]
>> +          - const: mclk
> 
> This does not match your clocks.
> 

will fix this.

clocks descriptions are misleading because they imply an
ordered bclk + eclk configuration. I'll drop those descriptions.

will keep only

clocks:
    minItems: 1
    maxItems: 2

> I gave you exact syntax to use, then in previous version you used
> something else. So I reminded. Again you used something else.
> 
> If you decide not to use it, sure, your right but YOU CANNOT come with
> clearly invalid code as a substitute.
> 
> NAK

Suggested change: 
https://lore.kernel.org/all/2b4448d0-81f8-410f-b849-0d957a2d2a17@kernel.org/#t
minItems: 1
items:
  - enum: [ bclk, eclk ]
  - const: eclk
  - const: mclk

I tested the suggested schema, but it results in DT binding check failures.

DT binding check errors with the suggested change
1. Only mclk enabled
bedais: dai@10:clock-names:0: 'mclk' is not one of ['bclk', 'eclk']

2. bclk and mclk enabled
bedais:dai@10:clock-names:1: 'eclk' was expected


With the current version of this patch, I do not see any DT binding 
check issues. I tested all supported clock combinations, and 
dt_binding_check passes successfully in each case.

Thanks & Regards,
Rafi.

> 
> Best regards,
> Krzysztof
> 

