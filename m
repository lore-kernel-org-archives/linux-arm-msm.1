Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678756;
	b=kMw8aaq/LqNVIWRpYm1Hu9Hhb9ErxDJ5DW61CWJ+2xFzxsEBqA+XblPffb0rPCkGs9SH
	 XaFoWDPzgjnJVa/rO+QMYB4aUp8hiBVtZ7MLGeqeWgcpDnX0Fd77dRhu3Wm50fwPL/P/4
	 4eAVW2ld5k204wViUICHKtQYLvmiL6BrdD+lutzZ3F6e95m+jotAruQJpEnd80Evjy1EF
	 ZPCRtqddVxLveFgSZGviqosGOss0HnBVg9sqr28WirrwD4oPqKu/zSInRD6masJR1aCwc
	 IixdFjhsrjyleFN9M2hNZ7TNg570jRGdfUhaRMeW96+hAgvpmCkIYwKXfoPfOfbIrIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678756;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
	b=mui7yUBi2ajeBue3lxfMZSXjthRdQw6CnBhVQGbR8d6mZSVLZ5lWGO1zkU8C9cXQihzg
	 d9Pd2mK8I4MfwvU2AP1bSzYxYVoE3ZM3JEC84nh0k6KfR9+6Tb5aRqxQ74RI0VnGllWSU
	 2rdUHuRLMjY6vHLNyShfbehKUd/3YATRuCORabZUq18kgiHWKLgQCI70EL0JLqVaJMTdU
	 o55Tg/w8nx7FL0M4wp1/rkYJf1CxuU2252HrZhTWmAqdB5AclBWS9dV4dVNZxfi0FaYc3
	 yDh8o3vcasiiEPtXlQ1/0dZ4sETgU/kwrU+6acTFASwwsoHPuVayyp5fYv7KInAiLng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Be6NBfr9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="NVZCD/mu";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC1606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 14:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21EC1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Be6NBfr9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NVZCD/mu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xlwA2573496
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=; b=Be6NBfr9WxHlkwvF
	6nOUpLIAC3TICYgkTGSPqkQGmc9FrbjdwwbEoeyHY4x0F4/oPnHenlt1Ed9kc2Hu
	jhAiWVqtYm+bO4j5UPJaLOWq8OAL80XWTnv8l0j7n+APsNAuw1Gkh9KD61DwQQN+
	lOQzfqTo3WkpCSZsUjiNGvviNfyK4OYpTTxyAN9bqw4SU3yMczekcce5hfcfyR/3
	+3HeutSj7kN9AKcFVnLGpCtK9O+FkzZxnnw93IbTFBDw6Zpzd4dbv+fdIzqdqsza
	wNQARzANHSc0UN5oOnySx9p1vBNM/MU/XOqmgSq1rDh5xrXo4IsghUysItnogfRS
	szIYNA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aksxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:39:53 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso3477348eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676393; x=1793281193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
        b=NVZCD/muE0lO60jqUZKKgtOyvNnOmvIHPHMpENRJ9MFesMq5HIM4e7aaNAT5m8FlzB
         i8wMySKrS2V1v+n2mOUtgeUXgG3yEMnnUhoFE+FfHwcoNN0z1jEdATXO9a0S3HrRwiSt
         VEbN1A3V6NoSGJnjw6H4XSL8SqEiddkKq04tOdpFtt5jlUu7eneVaGHxabIGUZJhIdXQ
         VGlIJdqcs1xzOyMXRH+T4oeUF4Kwb7OcvrBUCiimnxiSHCrbohwmAfKc9V7b19lB676b
         ThWpPSYgamnOap4DplpqCj5dU4P6USpYroA1Iw6Douqxuc7WR3xRE46EXop7F4YjyjF0
         VQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676393; x=1793281193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iorya9CJVmbbeV06oongNxWV99dGCu9hixBeNSCACWI=;
        b=UN2yvOMsyz/fhDwOsZPEe+FB5ac1yXOFLTCuYdZG7Pyl5pyhsqycBo0Ev8thBq+xL1
         Rw9p9m/nY84CSrDeJPQdC3oyw2VQS0RpdJOg6dcxXHaiA4zpsVCDLnvDdjZHXQBsmaG+
         qgJ727GtvEb8WNPZ2kjv581Aykadn0OdUEA08720dFfjF9YXgBxcTMjF4GxNzd0/RJdh
         cPK9P1xJioxExWQX7PT/W2YztQkK44Ctk8Zu+9YrMbdSZOA6fjgJnogwMxXwko3AV4hN
         D8SQH0ANor6W+B18/WfbThZ0m6GTCvxtRIAo5u0stm6JZT0LZhbabtS+ULw/xXmMRrU+
         m81Q==
X-Forwarded-Encrypted: i=1; AKwUvBy4DzCpIjiem859P2R+kpEwWyEjZcWUR/PS+pq4MvVFFvTtF/Dc98cPggK53Fvrb2/D9lfBX8l20ooG3DK9@vger.kernel.org
X-Gm-Message-State: AFq9FYLX9fC0tI2KKo4xCM+TclvUhcSKnX8O3X4ZKIMdKzWWRHbsAdSG
	Il72weH8wU0f4pykE26JAB+ROs4iV2QFlcL2ZtrTwDZmMn1b6M1sx5uCU7Pu8jxsoNNEeEU2r3q
	bkXrdOy56a1vpxsloo5yUWUay5PW7BSSS9r/coqk05r8mqw3qxkhP6FdMRqcZvLTaAeYb
X-Gm-Gg: AYBFou2qQ9n2iLr8Dvj+pjinnn068QlI85DrTgZbsfy0GXQDjh4GU1rmhSCcH+ZL3+z
	FVZHV30hdjA22l7GNgxl3R7qujTTK40URUE/QqkKO++MOY1reD2+E7Ze1UQgn5iRM0WCWwWob5b
	g3LPNbPjFA/sCEKfFEgcKywAWWLtHWPxIP2gFfd7i5pzMKFjuv738flCF0CNt0gCqt0kuHaOAza
	TF8w7VUrmoAwdLPEx0k06PS1hyW9pIK6a3oB1llSzmFvPdlZMZT2/QLiUOL+KnHkuJiYDcZPChm
	bHOFxNPi/dNvfZdwu5zpx8kclcLD0it+JrPgEXnG9O2mQRGRXmlvAbE0vtOvICdfNFerkttQwdC
	HSi1u3OUQivoD6FRUh8O6TIbpY4rOtg==
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr2325107eec.14.1792676392855;
        Thu, 22 Oct 2026 06:39:52 -0700 (PDT)
X-Received: by 2002:a05:693c:87d3:20b0:369:7c:bfce with SMTP id 5a478bee46e88-369008c220fmr2325059eec.14.1792676392215;
        Thu, 22 Oct 2026 06:39:52 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.235.141])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367416a1fb9sm14556522eec.20.2026.10.22.06.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:39:50 -0700 (PDT)
Message-ID: <f83c366e-e3fe-4921-8407-ffa90b7f933f@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 19:09:42 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: kodiak: use thermal hw-bin trips
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-5-5a29be7e8ec5@oss.qualcomm.com>
 <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <9800eb77-0188-4b16-a672-adb7ee1a603c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kvRGVV5DfBsUWlBrQkdQobXaIytc-vua
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX0VPG2ggt9iBD
 HAqZBaLFafMRxk717djGmht84Ea7z2EtMK9b8USWirfXctRDMBAWlhr4iMkxXuXbiAFLKbenbYD
 5SVTeMGNZ1SA1qhq9nKfKv5d06Bsg1w=
X-Proofpoint-ORIG-GUID: kvRGVV5DfBsUWlBrQkdQobXaIytc-vua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX9+jEAJb0N5A+
 kwKd5yVdO7VhODf9x6MP4wDkPb6n2T9uqBdWRtikeOlNJX8TnUiVhZlH9GNZqbSC1iN2LnNohxe
 ID6ma4NeRoEgYKFtvfVHKM8HJKQ3kqWcr2Ou1wVeYsOZHHCyTz2gBVFKbu6B/NZiAllxZsbhW8t
 gFkOPd2Maftyv8DB0ExFosS9JezpTiBIx+NQdh6gHVf51qlXiX/dMQfjh31kdwh8rMahy5bL95g
 7KB/+i34A6WIEVSW1xwmIV6LPiaC0bMhGyr3bJ76I3zlxIUhjiUG6fCrbEfNLavZgSa1isQnPqC
 nbppe7/naz79X3ESIS6dPv4M3zapqChO10KZ9raPTm+WH1Brq0gLd/hoOq2eyDomXwF2wt/yBXm
 axhxIW5c4Wpl82892gnh8bBjIusBAojGhYI3x4xFPk4l+/fUvLg97xZdav71iRQm5dOKtDzn60W
 AC6xQjgMZxrMj4HKoRw==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ada1229 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=8wa5AUNoahJ04lRaSfAPWg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=2wNLjvyEnIyB1ESV7yEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220054



On 10/22/2026 2:39 PM, Konrad Dybcio wrote:
> On 10/2/26 12:47 PM, Gaurav Kohli wrote:
>> From: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>>
>> kodiak-based SoCs are binned at manufacturing time, with the bin
>> computed from the jtag-id and feat-id qfprom fuses.  The tsens driver
>> now reads these and feeds the resulting bin to the thermal core, which
>> selects per-bin trip temperatures.
>>
>> Add the jtag-id and feat-id nvmem cells to the tsens nodes and convert
>> the passive mitigation trip points from a fixed 95C to per-bin values
>> (95C for bin 0x1, 105C for bin 0x2) using the new
>> temperature-bin/thermal-hw-bin properties.
>>
>> Signed-off-by: Amit Kucheria <amit.kucheria@oss.qualcomm.com>
>> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/kodiak.dtsi | 56 +++++++++++++++++++++++++++---------
>>   1 file changed, 42 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index 347815e5983e..f3bb9cd8f393 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -1019,6 +1019,16 @@ gpu_speed_bin: gpu-speed-bin@1e9 {
>>   				reg = <0x1e9 0x2>;
>>   				bits = <5 8>;
>>   			};
>> +			jtag_id: jtag-id@180 {
>> +				reg = <0x180 0x4>;
>> +				/* bits = <offset width>: 20 bits at offset 0 */
>> +				bits = <0 20>;
>> +			};
>> +			feat_id: feat-id@180 {
>> +				reg = <0x180 0x4>;
>> +				/* bits = <offset width>: 8 bits at offset 20 */
>> +				bits = <20 8>;
>> +			};
> 
> Couple nits: please keep a \n between each subnode

thanks for review, will fix this in v2.

> 
> 
> [...]
> 
>>   				cpu0_alert1: trip-point1 {
>> -					temperature = <95000>;
>> +					temperature-bin = <95000 105000>;
> 
> Please do <foo>, <bar> instead of <foo bar>

Sure, will update.

> 
> Konrad

