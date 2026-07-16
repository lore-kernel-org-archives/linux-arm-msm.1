Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCB0330652
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 18:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226836; cv=none; b=Y+bHcexgs6uIsKYH4g7RJmsg99fURWE70/mnFmTltQHDBrj0sz8cHDvxDPol7tu+fLgsCI7RP6o4kF4Ac5FZWg4BxfiCYeWwfWE0eXic1M9Smn6NOWwvTR0q5dleiw3AicK88Ie8kDB+HtD1hVLgzPFTNoUiS0015GEswIhe7Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226836; c=relaxed/simple;
	bh=dj60ZZJxV3iY3P5TWn+xSeE+wPY4h+ZYSZ2q9TaXG0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSRnKoNg7FcccoDTRxkkOQE6iZuZH3+LDdO/BiKUj3+2FZ6k6ecnj0zu5VkyvOW6R0c+pOUDZ09RsT21EdwEBiu3MsZSZVRg6NpGPkU2hwFge53PhdS064aIc3jv2hCbDuf2jXZKnSNZ4Uf2pb9qeGhjPxwizEYq60hUEuwdYvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XPlu6I4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i1HxJGFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XPlu6I4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i1HxJGFc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GGSlBG3171771
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 18:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zU8L98CG4jOXv8caWEcZP/r5gL/dFX0R4r+uH5SPbGM=; b=XPlu6I4UH921Q9Fp
	qpnXiVUOueZAvHLPBQmfTk6h6H36ZxE+5bYRjUIgz1oIRD57kL0EnhjPAz1Im8E5
	8H4+MK3DYX5JtnDFQzTTF5Kr0wLMXozi/YOmvvj17C3D8eYM+eaCnFUJuixtT6UM
	ZcwW4cgRFDunhbNrroLvGWlUPGsT3iaY/+VdaRhufJzQjpdLAVy9vBLr/bDXe7AV
	jG5rSeIw6SWW00J2RAnLm7Fc57AgqdXgkyNaZfM7SsvWXFUFSbv0q9uKh7Fa8db+
	8vhbOLLhEIpvQH7TZrbCE27P5W7vPcPHrREQneLeNC7FKDSpoA6rMEdBF0MKqJG3
	svlQXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv2eu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 18:33:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c07313be5so13060561cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 11:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784226830; x=1784831630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zU8L98CG4jOXv8caWEcZP/r5gL/dFX0R4r+uH5SPbGM=;
        b=i1HxJGFc/bR+7aUu1aG9+kVewPYngQBUTFyqju86+/IE7FJuS8jhjPwH79L0Eid+rz
         6NjpQvorlfcQhLe0o/dMBx9F3d88Y/uYR1bu7REtapwEwpADDfYaESPwoIm2AXg7t/Te
         vPZQkqhCrAApyVcyUgXWj7zTsi4lgZxtbcGMFJJKrSUFM9sEzKD2n8M8PIhn8r7VXW3D
         K+JgsTd/AmJleo1w5C2C1Z4dDizopU5Z/HskpTkh5/Oq7BC5OCsYHVElRC7P2u2/uFLr
         6sOvxT79Rp+CSoDZ0DnivKJpLUoST0I0GhbsTyXQjyOPNoLoQPk60thwBazv4bEGH4fM
         KSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226830; x=1784831630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zU8L98CG4jOXv8caWEcZP/r5gL/dFX0R4r+uH5SPbGM=;
        b=gjKWZEemKxPKZ4hhXaKdozSD9v7AKO18NohrBruYKNH8U2BtwODGqi8pbTPdcJSpPL
         DBgCcDs/6zvL9N2WlRl7YIm49y/8y6Lvsa+YSHFzPqjHCqmMYbX6qvhAa3PIK155R4fi
         QVShA2vXX8nkxfm6yUOOfXF4W4yZ8Dt5QxHuuom2vj3O6H9OxBeR5CWBnwQybt7lorv+
         TocGQF5DEL7OOcyV3tQU6fJJFeFxi4XYPyfHfwuCuP7GjRyHGd/dbT5mJy/SgfhrJszb
         w8tfGB98ysliwlEkatT5gNb0kvMXml9NPi8/twkBB+VTiFo/9hJiI+Gjyt8aj6XSz3tY
         4dyg==
X-Gm-Message-State: AOJu0Yyif8BowoQXtUWJaD6LYEwJEUW+JhDjibqEHBhksPbH48wyasd4
	C5ymFwcEM+6WSfQslJDOGX/CMewwCAqBay3XCVpkDhm12wIteanhw0luUOaydj4k48O2ZOtifLV
	TuxHGpFFU5V1ehzKAuKKoPa8EB8FXkAT22NphhcXoV2TcE0u/EWPij5QeyWoqN6P9X2Hx
X-Gm-Gg: AfdE7cnjizS1DnvtQ870Hryis1Fn7rua6OsVruiDwvXNcrwVNXLwF4MIhY3suMDHJqp
	tEl/E0TT+jB4kQDJycPMTt0N8jauMfyFKzUY9AwwqmDaYdNfLRnhm9vDfhPKTFnxQTPv3jlHKeP
	st53mLEKoFpbrp5FzYh8OMFjVqzRWYA3Wr4WOU2H6p9C20XRLmUl7Js3aqu6BruRUamUop8nzlh
	7x/NtqfC4slZJpC/de801gkM6GlzKLZfLo/9wKN98Fbjh0T43xPL1FKXInE6uTl0cRacMrMJxM9
	VwBXNFmiDdwuM/60S50WPgs+k76wDCSnR4DNGe283JMBxXcMQpFVSfbu2W51Aa0IFPe2bQdBY8h
	D1muNtaFYASOZ8GXPdPuIp8vC
X-Received: by 2002:a05:622a:43:b0:51c:f3e:781e with SMTP id d75a77b69052e-51cbf2159eamr208524351cf.6.1784226829950;
        Thu, 16 Jul 2026 11:33:49 -0700 (PDT)
X-Received: by 2002:a05:622a:43:b0:51c:f3e:781e with SMTP id d75a77b69052e-51cbf2159eamr208523871cf.6.1784226829396;
        Thu, 16 Jul 2026 11:33:49 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16874a2453sm255164466b.56.2026.07.16.11.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 11:33:48 -0700 (PDT)
Message-ID: <1153ebbd-659f-4ba9-9317-66ece33423e9@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 20:33:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
 <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
 <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
 <986da1da-db2e-4d4a-b9d0-70482adaf4bd@oss.qualcomm.com>
 <4f641f13-a278-4465-8033-670c7279a7e3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <4f641f13-a278-4465-8033-670c7279a7e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE5MCBTYWx0ZWRfX0ZavFYPnouKA
 yGRRensqBm7iXuCKJPlIsRWJ2ISYtzLQVDxj4AqCoOMRmgEbJOfOWQigl9Apun3nhRIlb3xZnUk
 eaW4oFE6y8KsmPSRthqEOh+EyGc8hM6hC+2X5uSPCJeJ9kjwSLlR99R2imwrmpSpvWTL/avoV04
 MPYtPc98ibWz/o44PnbSnQRHmBncbhFYh4lSXrGuGfVjiEYp+CELJRR2WduY4B7jY34nUlB74LM
 a+WoRZUwxnVmiXxtt1bXVNcchpfu1c6UTcVookMNjOHRdxKSfifPz1dHSW1ASuSBNHOWiwk0b5g
 Clm1fw5jFmlKMv20ZSOh+JMKBlWe0zj3xBcoxAh5b0VXO2/q6/574QFvhrWVTTQYatHoUU+TVzx
 MOkq3UhM2SZvTEfQxO6PAKCtJ2RPVJS++0ZGoTdIHDBjd8ghLVLYzN7imwZMBpK985mNt9KUY69
 XEGQyp1V2EV4ff9SInQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a59240e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=E75d-Z-T5IGyIi2ltCUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 1snf7g00e5OOFwGTky_4tufW7fU9YVgW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE5MCBTYWx0ZWRfXyhVrj6vRTHXj
 Pevi2AtP5bH90C0SZ0T6Bh2dJZnK+QymBPGSLU9IjcF0nGxdUSQEFvQv5T/vZm/q7x6jOtDKmUM
 qabSJ8fooPktT6D9yAF0Ruz2O+D+Dpw=
X-Proofpoint-ORIG-GUID: 1snf7g00e5OOFwGTky_4tufW7fU9YVgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160190

On 7/15/26 3:41 PM, Komal Bajaj wrote:
> 
> 
> 
> On 7/15/2026 3:57 PM, Konrad Dybcio wrote:
>> On 7/7/26 6:36 PM, Komal Bajaj wrote:
>>> On 7/2/2026 4:25 PM, Konrad Dybcio wrote:
>>>> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>>>>> Add gpio-reserved-ranges property to the tlmm node for all three
>>>>> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
>>>>> SoC internally and not available for general use.
>>>> These are generally added to prevent non-secure access upon TLMM
>>>> probe, i.e. the board won't boot if some of them are not protected.
>>>>
>>>> I assume the proposed set contains both ones that are _absolutely
>>>> forbidden_ for Linux to touch, but also ones that are dedicated to
>>>> some specific purpose that Linux _shouldn't_ touch.
>>> Yes, some GPIOs are reserved for secure-world use and are therefore not accessible from the non-secure world.
>>> I will update the commit message accordingly.
>> I'm not sure how to read your response. In other words - is this
>> patch boot-critical?
> 
> Yes, with Access Policy enabled, it becomes boot-critical.

Well then, I'm no less than surprised since we have DTs for 3 boards
in -next right now that I'm learning can't possibly boot..

I understand you might have disabled that at some point during the
development, but it's clearly not the configuration that's supported
by any means. Please make sure to take that into account next time.

For this issue, since the pins seem common, perhaps moving them to
the SoM DTSI makes more sense. And this most definitely needs 'fixes'
tags.

Konrad
