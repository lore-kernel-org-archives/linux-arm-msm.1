Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCFF4D7D47
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645312; cv=none; b=tug3GVecCquFmKaS8JGMhDGnyDZ5p4j9IPZvNUMk+bZ4C2hnOBwwwbAFgDBTtuxF3xVTltfKBnqxhkI8UBIXfwNSZMK9zntIkzC2f403khPgDXx/PQULuXufY2xOJfhOIUF8l1QnAMi/54N1JESogiZJnWKi8w2HMCjHmUTCuP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645312; c=relaxed/simple;
	bh=v2MHTBzON2DK0lgcpN2sk1eAnI/V6LUGFqU1FW4ihmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3Se4Wa/X2sOosZPCwNciwpiES6Mh9WQCKyd9jJ6v6R8eBLlvk9vPS0qpn3HncSAeOmysJ9UGS4GiV3flHyZDoqyfUXeB9jOsSqJhqb+qlQIwIv10aMOLEYaGULx23zabG3uTLIqZhYeCZoISwNvsPzMVF3m8qNmE4yTgVGOOIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBFjUsvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyeYz7i/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBFjUsvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IyeYz7i/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZlqE1520233
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Bs8osBMXoukK4PFadPl9cbl6mgtCbhoAHX5DtiwJoY=; b=mBFjUsvi/If+6VvW
	pzTTQiMkWV95L3uEH0j++5bGI0ay/3pnzF2QZoN/PV2yIiITPSlGWb8gwtg6Zovg
	QAKkOFlKl3jx8UgcFrGXoLAxsVJHiKlXpb7KXW0nAiK7UM6hNJJ+G3k/1glgv19O
	35vJxdETkQrgyLkrZ9RT3HDCCGt1XnjNAYo5aShWH7C95ByciB3nhm2aO8epfd+e
	2mJgjSrF0yeGTiNRCHMU2BFWfWL5yEsD+mlkIyepGpgoj79e+/RSm3LXtv6m5n7h
	M052MuuLGN66mnc1fSGV7NukyoCJAOPUn/EQ6SfcbJ9pEsWhhbDAvt2Jva9H7yT8
	rSiuKg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hc25w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:41:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d63bad3d09so12511145ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789645308; x=1790250108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Bs8osBMXoukK4PFadPl9cbl6mgtCbhoAHX5DtiwJoY=;
        b=IyeYz7i/KIIHYPLa1S0haaOdFaxZls0HBjlYoOp8r/vTC7H0v624iH+PajIw6m/hT6
         udbBhK9QTZmhi3Tr9NLNS/ysGl9nJHWhE1+MsM2uLw+hN6g6ZxFHBpuP9PM4yFnJy+8X
         V81+ms2YXBodcL/I7RQsV3+nlDQYZSS6TIfX2vsZZJjy8Mp0aPFMYDr4ourhssDZFXk4
         jz45IRLZnoLFveJvb53HHiUelpMdFZbGFefkYQ7dBNxYJU9YWGvuVxtbNRuuM9vlnq6T
         87mvVNXEuJTdKGE4fELTLDmvCnSC8K5Sg0ds4c5jFiSP9CB9qnz3qCZHDOClU0YIrV+S
         EamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789645308; x=1790250108;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Bs8osBMXoukK4PFadPl9cbl6mgtCbhoAHX5DtiwJoY=;
        b=hoovqOZ3oniOTAObshDaT+UqfYDZSnXx4W31AwKgbSlp9wmUfuEZpslDcfwGo2gB20
         KerjbtD6NWbikX7QIKDoh2cfhTYYTnJyIs3CuiG+rwSxTyY0UDAXbyV3QJoFXxqAaHbk
         8kNBerQafQqlTkNv1vU0TBftFJT7nzILByZhj3ugYTJQo3ZAylNINT4xp/baCHmObYCK
         eRdyH9KZRAeIC1o5OAvydPLuVSVRKAHgVOya/3ydKLoOZsVr8vdQd7XnZjXiEL3qSw2v
         E372G3MH4rMohhuXdqhL6FnYOrqDVDQyvTB6KRif8aOxzrV6W4b7s7pskKfzUr1VYYmW
         Ogqg==
X-Forwarded-Encrypted: i=1; AKwUvBy5F216YuSYtTL7TKIj1Me03Unfw6FxJrgJ1jBKpVmyau+dyP5Jcgzad3j/Lr1esiUDm95dULLM6xmDImHO@vger.kernel.org
X-Gm-Message-State: AFuF++nPh3DWtxrAjGOGXji3Rt6Xs7itCOig1f7I7dN1acZUAfI2EiFl
	oKvfVFVl/8B1P6Fe+l0GaBwDD4+0o0atdKYAHxWeyaF2TViKHUYG8tvReu628xTHM5x0obHz+eT
	gSEFyMQdDqN3Lvq3JUq9kMXoO0VGS9IyCGDHLRMFOb0udnm3X0lSiprxVARat9R3C6uzW
X-Gm-Gg: AYBFou1fXAX8WuxrC+DJVVp/ZuUvR4S8NP/wMMk5cPob8kIvcWjSw4DMxw1LQ6ZOIe2
	TehWLI4BeZlHZG5tfHsw+BagwUuyc/tTWoHeAY1xJIClWX11p4oW+b+aJMdz7lxDw2TZhLWVHpR
	Gu4UqOFYIj4OErOUhHfSz5PLpz9KftLO62/VbMqeUAlJCDW/AIh3QBm0ces/pFGZr8KZQjTlUQt
	H2xkErCj8ZZOdpSgnE/YiY5lgwz8XpS+lpuTHiGVxamRy+MDMNH2g1XCpADTT5D9a6EOn8e2GYy
	FjlIkw023TcsAwVi62zQvKXqu13sdUeg7Fv0CPAEzdX9Pa6uVBP62WOWNfhvyvUidps8qkPM1sd
	tmxqqxYRQcE8aPl/vYtMTGW1TZTtbqxq/mMM=
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr16200136637.28.1789645307724;
        Thu, 17 Sep 2026 04:41:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:918e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3dd5f7b25d9mr16200066637.28.1789645307271;
        Thu, 17 Sep 2026 04:41:47 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.137.165])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm16363362eec.16.2026.09.17.04.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:41:46 -0700 (PDT)
Message-ID: <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:11:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
 <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX4s/iabioUa/v
 FSjIhPb4IptQa4Ojy5UvvJYrlPrhJ8CsV1izUYaXgRYsD9/HoPDthCL5SbD1d3a2OVk/DT/wHgN
 5ys+W8SVo0Fok7FMWWBCREPQmCOdQ6NtXo2wV2Uc0hNHZsYKRuvR4g0zY5XPpzE18qYBFdjD7XV
 WHueJy9TR8UBLm4jBZ92/yUDYeooHBiBhbU+FIItJltDQ2tiM3NptrnrWszzTvGeeX5ZHkVuCqS
 EOktD+GIbEP2MnpxQ0tNm7uG1MQaPxNVb7a3kd4efBEk+TmRpBrMYqtqx1pST1ESamHW2yqZ6XM
 FQMH5Jncyy15efHj6I6InDLJNn5JfJ4/7KVTJvYQfQhUOZ9BQP8IPNT+dbHEQ+Q6R07tdeSagKz
 jf6X+hG7xo9EFzsrykETM1s1PNt9Mebi+IqieEBZoT2Qrw27GGLWlXxeMVw47q+YVVfETDF0Ao5
 JjYXbzcxgWTSM7nIEkQ==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aabd1fc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=/MhRiX8TZM4BB34AAREmLw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=uP37DjD_T1UKT6mrzMwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: jg_WOTzKi6F7secKUL4O3M9jgtXrd44r
X-Proofpoint-ORIG-GUID: jg_WOTzKi6F7secKUL4O3M9jgtXrd44r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MiBTYWx0ZWRfX59bkdzOsymlj
 7yZEr64hRfjtzpRokHIKd7HsJICR1xsVlct2jNMwl0HTK07+eFXsDb3SXtlyEjC88oQ7WtzQgpz
 cqIlMxufUVeBi1CgKOw+JOrc+9jNJ0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170162

Hi Sumit,

On 9/14/2026 11:44 AM, Sumit Garg wrote:
> Hey Konrad,
> 
> On Fri, Sep 11, 2026 at 7:54 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 9/11/26 2:38 PM, Sumit Garg wrote:
>>> From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
>>>
>>> qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
>>> with OP-TEE the TEE owns secure memory protection. Use
>>> qcom_pas_get_backend() to issue the SCM call only for the SCM backend.
>>>
>>> Assisted-by: Copilot:claude-opus-4.8
>>> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
>>> Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +     /*
>>> +      * qcom_scm_mem_protect_video_var() only applies to the SCM backend;
>>> +      * other backends (e.g. OP-TEE) own secure memory protection and do
>>> +      * not service this call.
>>
>> Can you not just stub it out in TF-A then?
>>
> 
> Please don't, we don't want to support these random SCM calls ABI per
> subsystem with the open boot stack. All the config in this case for
> video is handled by OP-TEE itself.

Could you please help me understand the demerit in stubbing it out and 
let that be a dummy ABI in OPTEE world ? that way client driver can 
remain agnostic of the calls being routed to OPTEE or QTEE

> 
> Instead we want to mostly support any subsystem specific TZ use-cases
> as proper client drivers for the TEE subsystem.
> 
> -Sumit

Regards,
Vikash
