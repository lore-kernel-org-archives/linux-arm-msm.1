Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9285942A164
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787241427; cv=none; b=jAupJ7wqKVMbMVSIrDGFI8zjD9N21f7OxpvWpl+EM25JfUGESzPDHMmay3IHRceJj2uVReHQvyJWmjVp4j0lDxAKMAFG3KA2SDXO7Lw+caHGsiHA2/jgUkotuLs9quBHRvsVoSZAiLIv6GuDtEwrtfZt+uewkuUh4rugVwttZY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787241427; c=relaxed/simple;
	bh=7T1SNsXABIr/TslXRUK91zgK6ZZ+Ty3K/mALZ/ehqLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfHhHqJBLVvSXc9gOhd7YMrTA2QQxbpwkhtOMvWTfWP1GOcJym1iMMZjICpBejEkTdvlYWwy7AteZEIA3Tw5cn8z3xrYAjB8M4TKGZ/0gU2aMiM2QucHnmSUDYPzPsylBRrKBiPz/10KsCAnfwZpcT6KifY0eo0fJmFuu+L+VU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihL5n1wC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HjBbdisS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihL5n1wC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HjBbdisS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7g4d3234825
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 15:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JCz+dM7qKYk2PsVuuQxpoJUCi0kAaSw2IR3+A2ZzRD0=; b=ihL5n1wCZv+1KsgD
	6lbJsRIaqaNuiggeHfNCY9TfBCTiGbm5wrUu9AoLmxHp8bXt+vn5cbWyJzDk4Q6b
	yQwsdqpRCW2hTi/rDvLZw5dxUCj6+Z8Mc6nJj8SArtIVmHWicZabpZCLeJ6HQe/6
	R1XqK3MVZ30BhPH0Ty47fSh5KrVY2QQtzbs0EV+nTN+wDiDER4L9JGa1VReMTxU7
	kDpLpj5jCdHyelft/LH4st8KK3Fybxhnw9ahzVyv9qIULdd/ygoHotb+Kbt4CJCd
	9v3TUK97WTw1rvrETTk36Ox5WivsJFMGgXz7BNfk9Fy83stlW0aMsu9LuYDbhZgg
	OqzxQQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv9rxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 15:57:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51e9d892f0dso2329981cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 08:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787241424; x=1787846224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JCz+dM7qKYk2PsVuuQxpoJUCi0kAaSw2IR3+A2ZzRD0=;
        b=HjBbdisSClcR9ebCcux0XTAkDXtKyzRz7DCJPj5kEpB0cQUc9ouzj9R2VSoRS6inVx
         5qp49/TNDoMMmqwoy5sw9L1fJfzaePHo7KonMJXwnKfDqs35pHxuoQNh45jQ94cno9A6
         g6bMC1/4QLRQ81MYD8RYhnjWHBGBqhfYz5glsHNUdCMZ46SGV32E4A6X9ah+D344Qq64
         DPfMPJyAEKFl40gYhgu4wQNg7+whVJWz4EJTFmTiQcV6uvTXn1gwREEmyrfqRstW+kHl
         fIJ19bVzKlJkHMnECjmj1yiKGpIcJu/RHnsVbm9qjSZVn3XwG3eCoTqWH5bIGIIEepOl
         jjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787241424; x=1787846224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JCz+dM7qKYk2PsVuuQxpoJUCi0kAaSw2IR3+A2ZzRD0=;
        b=El5wiVVpRu+p/B90zrTkRmXITG3TuRWaSTC216SPWSnh3XLMXIud17hcEZAiOT9/eh
         kRmZR4cfDGRi9fz3aby+KUlEe4UMUAkJamhowXNv/Zbd3QRtkYQ0H0mo8YFNZuAEBpuN
         Z1Jqa9aOIWRJ5vF4G3ZfPn5ttBko194nchrmJ5y/vI5jCjvBLXHD0S1IuWl9kF+wnzV8
         uUwCRPZuiFyUhT1UYZ+9tOoiNTJbPiIT5JzTx0rp8H+lzh7rfcSH8bk5EXu4lgpYuvAC
         Cqeis4k+XqO3624wr7JyFEeCxkXQMroGt1xg4MJ2tMd0m45c6ICWUvSfYbfdm9If+A3Z
         tlFA==
X-Gm-Message-State: AOJu0Yz3s3fgmh5NfrizwLQwJA69VGEU2N90XTSkatYVZTAsd4m+0hNP
	FF2cqpeAW4LdDuq6xdOPd/JfFzzXFJ4JRdrfcN+jZmpOp9ImCzdqTwa3w902v4x6zSHaTNRbbQ2
	xpKIsuZBjBTrKBfny7bvTV1XvMZUzDo5eMwxjJiIk1XQKWPu2DpnsMioKrOxaBHqY5LvZ
X-Gm-Gg: AR+sD13ay76pCeQS5bRx/Sshh+gkyPEYlUCAwDbSwv8kanDPlfwQBmDPKuxGsYrYjJV
	nd+Chbuf8kiLM2TA64y23prLjarR/6k3r3ijXEBsUHi7jtlDETW1riUgx4DHOqXM+kNpC2QyF5F
	MFrGu06wyrG8rgJMro2IJuTNnONscM+3IAivwJf2ByVR3Q6jMgOFjl87q3TLvsJq9eFinGnTjt1
	2LcbwlxYTjgIa4xCAnUCEYQL8Uu+eVtbcrIbqCGY3pQ6YgYOUxJ35Rpy687Qnt4jvpjtN4IBxQJ
	LNSsomnJiI2hggCRZhedap2R72SCNT31vsIC3Ikaa9gq0wYkQi7JuMlacH1iwLyaYL1hfvV/BKn
	25gkwup9rO/0qkwB0b6G22JaC
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr92703871cf.2.1787241423804;
        Thu, 20 Aug 2026 08:57:03 -0700 (PDT)
X-Received: by 2002:a05:622a:588:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52dd5771811mr92702361cf.2.1787241422053;
        Thu, 20 Aug 2026 08:57:02 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2458b09448sm95493766b.17.2026.08.20.08.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 08:57:01 -0700 (PDT)
Message-ID: <7ae2860b-aa9e-49f6-9856-e7e56290e8f6@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 17:56:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: Add Motorola One
To: Adam Skladowski <a39.skl@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260820-next-patches-v2-0-7130d68183d9@gmail.com>
 <20260820-next-patches-v2-3-7130d68183d9@gmail.com>
 <e16a7122-18c3-4bc5-80c5-1cda458fa2c6@oss.qualcomm.com>
 <4dc461a9-68f8-407d-b458-695ac263ca37@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4dc461a9-68f8-407d-b458-695ac263ca37@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a8723d0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=DZjxxVxIHy9KTFeGu2oA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEyMCBTYWx0ZWRfX6h40Djd+pQUJ
 PQcxmQAyFcykWQ+3lAxppqRdf63a0bUbQEpqZ7ig2eLq9t5tZPcgSaNxfyvSr0blv1zZ24Qw23v
 yePaq9T90vVS0rGwv54ul6RWp/fLI3+o2BU2zLkKK3/uI3priXAeopgIPBE07DHngF/AAyjKNND
 Y08i5RT5Bnd96CscADWY/VehqRHFRUnXuXvb+EFp7qPeeFOboJiwgKuheqIkPoOh675zbLbZMm+
 H/jPV498nIqcQLtWGPzI6uuJX8FKdC+k/D9bHCDl+MHhdCwydKllwa5NQNDD0j/WKIU1sF/DDgg
 7gxWj01+qPp86xTmQpdYPEjml4Fp/LA6ShALOMmptA43MxdXzJaaauc8ZbhtfJ/Ywsfc2VTgshD
 k1YzCNQ5WtB478/uUuJ6DWWqbYouV2Z64SO5DSq2uAnaAw8dxUOBTgDLMLrm3AMWDOeoVuK02Lo
 4xWUWxGlLQaTP21B8SQ==
X-Proofpoint-GUID: wT6hqMAd9l0_RfptQ0_-QJ4fsqf4_xbU
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEyMCBTYWx0ZWRfX8dRyH6NV6Ayu
 hxjnnGuqjShX7Kc5WFM9SEnj/Q8iU9ytotITybadhhDdA2UE6afyRyaP8JP/tWmrjbgNppEUzsT
 nmkTOsM+gF8u9U5cPHVAntbu/d7d/cg=
X-Proofpoint-ORIG-GUID: wT6hqMAd9l0_RfptQ0_-QJ4fsqf4_xbU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200120

On 8/20/26 5:24 PM, Adam Skladowski wrote:
> 
> On 8/20/26 12:17, Konrad Dybcio wrote:
>> On 8/20/26 11:42 AM, Adam Skladowski wrote:
>>> Add a devicetree for the Motorola One smartphone, which is based
>>> on the Jacala/MSM8953 SoC.

[...]

>>> +			source-pdos = <PDO_FIXED(5000, 500,
>>> +						 PDO_FIXED_DUAL_ROLE |
>>> +						 PDO_FIXED_DATA_SWAP |
>>> +						 PDO_FIXED_USB_COMM)>;
>>> +			sink-pdos = <PDO_FIXED(5000, 3000,
>>> +					       PDO_FIXED_DUAL_ROLE |
>>> +					       PDO_FIXED_DATA_SWAP |
>>> +					       PDO_FIXED_USB_COMM)>;
>>> +			op-sink-microwatt = <2000000>;
>> This is inconsistent with the sink-PDOs you defined (5 V 3 A vs 2 W)
>>
>> Konrad
> To be honest i don't get what's this about.
> Based on docs it says its minimal W value taken by port
> and based on PMI8950 Charger it should be about 100mA@5V
> while SMB1351 can also take as low as 70mA@5V
> I could see it being higher when port is used to power SBC or something.

Ah sorry, I didn't read the docs and just guessed what this property
did.. 

Konrad
