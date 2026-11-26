Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704809;
	b=Uc0wf/QUuqZnqM5wv5rLwfZTO3IKhnn+Bq7ZMM6DbVVTjKel2UEZ4pY1hoR3XVoy9ZhP
	 f3j/LaZF1aexkl7e6aCoSXruhY/QF80KfFFhL81mIGj/xRINOzzCwnfaedd7QKupVFMr7
	 NjScFzx9PWeY7hK9srlEaSnxlKbH4Jm5XYjn++0VWgkIhMoRW1k76dgjwdGw53xuKM25P
	 MseBCRIcI0MNBhZVV83f+WfmXFa1n4Ku1QX71ZbjCgxydJ0hPUdzNfTZn9JBFK0MdOnOg
	 bG/mzqCJND0sEeb30AdvGMP7G9+zCfQhnskHhwXcvc4ndTdzQT3+WmTSEjeASVwOuxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=;
	b=dnqdeM/W2LVAt00s3CbN2gqA+S+OHIF6isORSxTA3OZHtB+6ZsZvYCEOfD2HQkpec8fc
	 iSuQEH/nslX08gj8mdJB3KXDDVM6b6aKIp36qQvyFAS8A8IKLFUHrFlBUNwXJL3IN+Tco
	 j8smHB11kgc6CmJoZgynCy6YQVmutEoZ2PyoNaRTa3/NNdu5rHJ107dJRiHs2lyVbNoPb
	 hq8YkUsTSytlJfyVkXtx7H5a1614bmQ+PaMQLB9JBaGjYsm4ZXLd0luJTuBx1cY7mWKgn
	 waPAEn3cpsaKtmjQ9nPYw+sK2upZXF3gAa+V/4kGGnWQsPqiv/H3YxwsrlEAjnRC8tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eur+LAM4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Adqj5ofJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC650606A693
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC650606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eur+LAM4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Adqj5ofJ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEUx0M3563228
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:53:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=; b=eur+LAM4pFbOfhIo
	2uB6AtdRkfgb4csfaXkpGOzp1a1TwKFNiM39Swed5FkWWMFuonAI4JqPsHNhALHo
	wWiOWniIQnfsCzkKggHON/1+EEl5ZX/55r/uE8BnosJhV9e8ZNsY2sxGGwMrk3O9
	aWBnM0Iu28wXw/mHvi8d/on3ezXuOpVXLwY4W5bhXQYhjAgt8peG48y3RO3BEv+r
	h21oEV6PXs9YFK21TR1sm2rp/s4LHVaNLJYTN7jMOvpoOdg8wPO1zQN6Gh2zasMY
	8ppY8rWEchIoDbvZ2hfbRKRtNXYGSWZnaJzxtlf3w4v3I4BIJGGK43QjjKIUe9JY
	ES6nFg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sbke7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:53:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so9675912eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704807; x=1796309607; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=;
        b=Adqj5ofJ3pYVkJYRH3fVXXiB1VYmwIYxcozwCGw48Yew08Xz8N2KaWNqO407I3f/pb
         0mLoFQkVrv6z/V2bS5/1HKLerhSnW6Zu7bx/rkoE1pf2NQDWsr8x1znvUSEcnvquVyPa
         8q+IikalaKa1R8Pb2vURCOpXs+pIMCEawQCIDuUuK/konpFwwuqhr89PSzL6qgVSI2h5
         W5OzAUfpZWy2EF7WEXmcCpZmdjLtRnie1AnDpYAgE3wP5G+Qm2OYU866wah9UwXWReZC
         r6g/VAK8Mvk8O6QkCS4NGg9JdNnG615wSl2BMGBzPlFtcJftkyBTDP9Eg2VEU2cxsX8w
         +Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704807; x=1796309607;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XQNAN6Vy4siPlthRoQH9jet8l2I4+/EnJVydI4yjk1s=;
        b=WLD71G0GW7k7DQ912j/q3PUrMJkmEF2YttlBpHDRc3VicufrddmJ2OBJm1BOzqhwZ3
         DfMcP2AlBOtY1Fb7ZWJaab1rqyBhWDM5zhhiCRTziIYf7UWTg4VhC/LPXCD/l1yD22i+
         FlpmyYovLmpM57GiKm8l/Fc/VGwrRZiAKbkQk7pNCrnV+dX1yis5M4zi4N6CHMBRh+W/
         T5VgVau2xZYrBKey+X5qmNke9OM2O4ievJFyFywdd3kqLyJrRUwsGuf+zXlfE/X6xC5Y
         8eKi7reQ5kWz0TG58O0lYghmd5o+OnNM34TYJ1lLiedHfgnMZHf6r/2Xb4sZvNAC5MJR
         w53A==
X-Gm-Message-State: APuU4Z95cPquX3I1qQX5VlbJkYK/dJ3wyrfPhIFF6J6fLgw/A3M37Cda
	YsArafNDHLNiQhWmijJiu8z/6EVwu9vTk/v4baTsNTxkRA+rSlvKqATR6+Nvtc4EXOeQREAL2BM
	hCgU+VovHuLcNpUMEuLjp36W1ryQLZyvDWieRYHT14iHIzv6ri6aa7Xr8skwQN1kmphmT
X-Gm-Gg: AZFdTZdRZgoEmcajiIwdu+KOGvNNCoYqOa+fHm85YVOzH/VSSYka4+ROV9n9Q4IkYbx
	S6GAZWmkYn+nGDkaKfn47N5Y6Xa9feJke8lzqpqWCjqzsz1vZyI63BeGlrbbcT8dmpg5PF66sEL
	IDbMfIk3+iStCApgDT9iPO7PHxslDqESrBoMUJeos8dKPJysef0806vQYBsg7mbBPgi4Kc5vgUI
	DBbqG4SfkH2DX0feLW+c1/FG7KW1/7wqe4AFV1HrPsyltBHs4OaBcg5AZBPbxJL053CNJcJzk+z
	r6SpHR0ths9tuRHofaTPMq/KsPKSg0kRqLayiQNFtqZ2yVEKzYC8E32MLA/qjmDxfb+t5LVWAjA
	FqZz1ExQWV89fj546eCL74Z527YYXms6SQ4Wy3AiAynehqQRBhjGi5UoDa1qPWKi+LZVXKVrK8A
	==
X-Received: by 2002:a05:7022:906:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b556904c50mr27737686c88.29.1795704807287;
        Thu, 26 Nov 2026 06:53:27 -0800 (PST)
X-Received: by 2002:a05:7022:906:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b556904c50mr27737651c88.29.1795704806659;
        Thu, 26 Nov 2026 06:53:26 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm82132907c88.9.2026.11.26.06.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:53:26 -0800 (PST)
Message-ID: <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 20:23:18 +0530
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
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
 <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b0847e8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GMqeiC-AThkal4myrkQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 8K63r10zAbuW6McQcTvIp31JbncG0fP8
X-Proofpoint-ORIG-GUID: 8K63r10zAbuW6McQcTvIp31JbncG0fP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX61CE7KJMrPjf
 kVIhobgyOMIuXTCjHlIAlA+JeYlA84rj6QhE+Lv+iVPEqaADioiSDdkkVJ+sHMP55FH5UdliUu7
 mwbY4EUBIS+10Y9k2aa/2Eou5ygVO2JpWUTPm2o7pB5uBybrEoao2nV1opuW5pyfCrkM9QQRE4k
 xd6PQdZ+IuwKzpB0E2306rtV0/0jZ+xxSYSGTSyuonIDo82m05XepCthTHeVXUvgc7YUR7+dplK
 jE4tjCcD7jodkVo23mU54n0QKycehK8RkSjVvByARf0IUsm1yMsqezhrkUnhRtRSCpeWR6xBnxH
 KfbxcPM1lIM6yd4ob2vhk1/do22jopFZ34jpAK/MaAiKuGxlX3cTLvRzZPNkGvF87xl3WKtgVxX
 2qok9XukyrLUFfWOF/mwVwhayviy2gbfhKPf04N+Gvj/Y9323nXF39vwdmviHC9ro9go5U8EXp1
 LnJjr3mhKxy91ccDNQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OCBTYWx0ZWRfX39K2QLfm3W9+
 4HUEEIT59R/6ZqVY0j2lHCY+BAQdNR/2HpQgadFhv2DqdIpUemHdGcAoPH8c7Ko1FvbmhAwK8om
 a79p5UGa30oudW8yRR+d6H1fbtICFPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260058



On 11/26/2026 8:17 PM, Konrad Dybcio wrote:
> On 11/18/26 12:00 AM, Akhil P Oommen wrote:
>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>
>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>> the A7xx Gen3 family. It is derived from A750 and shares the same
>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>> record size. The differences visible to the KMD are the chip id
>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>> firmware.
> 
> [...]
> 
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>  		return;
>>  
>> +	if (adreno_is_a753(adreno_gpu))
>> +		state = false;
> 
> Is that intended?

yes. It is mentioned in the commit text.

-Akhil.

> 
> Konrad

