Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792582924;
	b=NY5Gl/buADmUVhphV/2ah5pAxnBr7Scw3Jrp99ZX0UgFVvmn6UxMgQjCN/efK++O1Y4t
	 r0r+lVTfgU8Q1HkK8qd8yrglLmWzjGIz00GH8zWYFmjd+u+ToFBIq0SA2oEMWLBmjxsla
	 uI/PV3AJU540fMFLacqxmVTPti+GO59STDHu8YNA476lkVocHfvtd0kOSoEf9qC4LbmMH
	 2lT1ziqsyKAa0Wr/m9qQ/fzthlzmYJQ5FR34DLZzU9/c01h1Uky1g0wcfiq0owqtnWNo4
	 7nAKH3Xd6m3+WIBcUl9SkZVi7y9BcqQ8iNR0L4hJUtkdvNjC2qks37FPtpwFXj+Gzog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792582924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=;
	b=1RmSERdSv6nTN+LibO5qAD8I3Aiklm22Tgx/doWaxzU6lnQ6Dqm5MSic50aHozJ/4kkk
	 d4sA4dAASeUMfh8qtXgZ6kdadb5iidOTvkuQsjwE+CjX1ieldVy7xTPxRiX+JnKgRr/CC
	 NDht20EwoEc3uujslYSWoRDsevcXxBlB4jLGUkprdVQf5TrBBhVy2pkb4kRvdEgXznN4a
	 zDIxmSqF3Nnx4K41PCyt21AOSc98gPmFU13MEhy9niuBcXYfdWeGVrD/OjXoL0+QF2RR0
	 xbjYdHF3JSwde7CkNyB3upsExXwZg85ViNgicyfyHxPqb4afComsyIdo9Xu0zy8SWaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=joPVtpmc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECP0PHPc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B924606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B924606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=joPVtpmc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECP0PHPc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg2rT489911
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=; b=joPVtpmcy6TSTeqI
	10ffHdh59BK/YbVVENvKPlpJnItmiJTO2fyZYv2k9oRSlyT/MBiVBtdHPSndH1AG
	eOqsjayQiY9hB6GNCrj4nGSaH79wmUmcLBBmPH0MOPmY9SmDmkbjolupkoBwMWib
	LG7oDXNYqdIV4XjMXNkHV5ZXHkYNghYGoXVGw56ss+iz2uCOZhTQGI3TBUG6tf9V
	+pIWORd8+mqE1QqkWC4lGKPQxTMMP6YP60Xp/pwQ98RrJqTji74sBnWkBpqgfJ5n
	u+OpHYfFe8BtEv/M/81M8HTk6izGHeqya3dbivIyrKSUI/PM1PCzoxMJVIT9A/x1
	4b0vnA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2t7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:42:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso19843685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792582921; x=1793187721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=;
        b=ECP0PHPc844KKyVjZ56bHksR+R7DT47g9F6SDsnJhEJxZIfT+Qay7YUD1dKk+TkFP5
         VdXGvBg5fLeB1M9JT5t40QW5wH9rU6f80nY9KjY9CA+ZH+kJkAifAQQoz4tDI1Hz53jq
         s39mh9VQlNJpI8XUiL522Ud8+ArJf7m+KcwAOf/ikjjGy7R+DBZoPgJG8t0AQGfLApHU
         pVVctNo0PVfMsDxnGazU9rTXhVX0CEqs6V0x1MTXUYXQ1T0xjjYYvRnXtlNGYUeQfl68
         2E2DRRYCN2D57Uv8SY0qazr6eHat46M1x/z2QTG20Sk4y6K6g+2+StAXPTiu823dBMGU
         ztcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792582921; x=1793187721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ddK13S2JmMcp7BfhndnLggsBRmLhYNqqcmyD07Cny4A=;
        b=ts4r1/2eZh0lKb604Ol0GhVVvtqHlUfiB1UAktL0alfmpBj7KpYVJaf2Q9Kl0wEESP
         XGgwaV6h8QALkILxfyJsk01+Ku2iLfPLPMC90r6vLdYWRqdFjgiGyD8S4zhbeZw3m78O
         IDvNb9wLuyX5Lwu4/cIDhVKlw6W/ZkNdFiqdBHB/XV5VvpZzAhpUPqgUUgwnyyR7ay8b
         k7XrQl5Oewi05rk/UBNeRSvxp9nFBUSiB/SC84ZhA93JG5zq2/mhl/S/bFaHM5nAa7Zt
         kbQKEC43S9O2q6V3S+JwUM2h8KTZ2imZdAA1cPJvd3u4ItybeBYnjZEzsQxVKh7QHKZi
         o5Kw==
X-Forwarded-Encrypted: i=1; AKwUvBznGWmblx4dKbE6cHHBgNkkNObb5f3BvvGAjWeIYai7UjRBfbglrJZlYO2fGfuYfrh62i+sSojO84y3ia3M@vger.kernel.org
X-Gm-Message-State: AFq9FYIFpUofBF6OjkuCY1vPAdL1IydfiNUEDHPwV/GoM27E6iRgqK1S
	2A1gNsAkXCR9bImUH9hvTmRgPOl++4LXr8Z8wNcBPVmMki2Lloj9mtkMF7XsLDHCK6Vw6Z9dhdy
	RXaao46iKBLdribUpIWtnyR3iGwkYEeohmBDCMNLt/N25a5tq303w4zQJzJ7EaaHxIwuX
X-Gm-Gg: AYBFou13KzW7XIFWn3jI5w3GQIAcKlzDn/t0WETyRjUQBZsVMIQPDBwEOSBiGps1eaY
	UpSsvIxHz2RkN/5rwHJDB0JNipBf+koeeTL7mSGXXulrfPETd6IpMHHPcuAJlha5vL5LpDzSvV9
	SKTA0laMP8S79khPkbFHOPLB/twvI7Z7YanRNlj0FbtVMZV9SgYXbzxAXPjLpZ9AefVcM05Oz7j
	LLDodAu2ehOQQgj94j5x8rKmkyDS5UttlWwur7Lw2nJA4yD7uGhLGKfPVlCaQRMiCbnzJzBB0+m
	7n8em4v+SbUtPhC/05076UbjfRHlcdcVhwiRsVKz5ik+A8W03B7oQMAHwI0DSZL2qEQE9TxHDT2
	nhyO/6exWirdX/wFxGIsMAg==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr474752085a.6.1792582921395;
        Wed, 21 Oct 2026 04:42:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr474745685a.6.1792582920907;
        Wed, 21 Oct 2026 04:42:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678e5b763sm69095666b.2.2026.10.21.04.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 04:41:59 -0700 (PDT)
Message-ID: <1fa61e39-1ef4-42b0-aa9e-ca7dab94c336@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:41:57 +0200
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
Subject: Re: [PATCH] clk: qcom: smd-rpm: Skip proxy votes on clocks for
 QCM2290
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>, Georgi Djakov <djakov@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-clk-smd-rpm-skip-proxy-v1-1-1cb5694a99d9@oss.qualcomm.com>
 <dab99b27-ebc2-477e-b56a-26250aceee23@oss.qualcomm.com>
 <ad4aff4f-2d66-425a-a358-6cefaaa1319e@oss.qualcomm.com>
 <bbf2e7e8-42cf-4146-a2ec-b5182a161109@oss.qualcomm.com>
 <b0a01589-a3ed-4c4c-8222-64131b0e6db1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b0a01589-a3ed-4c4c-8222-64131b0e6db1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8a50a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=i7A_KPRCft12q0410FAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: oNSOG32e0ieviKDmDWWzYeWcTGF8tXoO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfXxQIX0jA8lMpU
 Ua+OQqnQkeXsRYMgh8XPg+IW7mKs3SNOAlTV+83WRFrJDzXZ9kZSJ3fzAhfBBUUrL5kA4k+9MEs
 2SdTVwMCNp62HMY//QAsKaXzBbJf+0WjQAXdUeHs/9C9egC4uZ8aNP+XJZsWvLSOUyi/Zkdf5vM
 Rs2gWwfM/Rw46ZtKzvvqy3maOre9Nls8vikJ+X/U9VkDpRMcKnAL5cmOebm0ibSnITTtrMmLhde
 tI0Uz+GysqrW9nOJxbV+zLijDFlyjJLumxOoAV6Gy5FMnnUK3c5hipaeo3BtZEHmkvD5d4LQJ+y
 grvZitsEuqTX5KAH/3mX2X/gcOCeMHA6wAZNhPIEYITMluhLTA4XC2KHK61qC0Q55Ng2LMJXuEH
 /AkJd8//uWXM8Wa2OAZzzqxbLLRchthnXotBidycYp28v9w1vG1e4hd/f5bUA2k3z7Fr3ZDUfyI
 xkT7L7YS37cANzFlSQg==
X-Proofpoint-GUID: oNSOG32e0ieviKDmDWWzYeWcTGF8tXoO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NiBTYWx0ZWRfX2038+FscVzYD
 8MGMNAWATJKMVamEVb62uR1prtvWbSt2ubnkPJqH+belwh1E6AKkFQfj6oupjmFjzruzUknyty9
 3gZHdbFt/PyKdaE25JCRYzMncNPCk30=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210046

On 9/24/26 11:32 AM, Imran Shaik wrote:
> 
> 
> On 21-09-2026 02:23 pm, Konrad Dybcio wrote:
>> On 9/16/26 1:05 PM, Imran Shaik wrote:
>>>
>>>
>>> On 11-09-2026 02:36 pm, Konrad Dybcio wrote:
>>>> On 9/10/26 3:44 PM, Imran Shaik wrote:
>>>>> clk_smd_rpm_handoff() votes both active and sleep RPM resource states for
>>>>> every clock, keeping them non-zero until a consumer takes over. If there
>>>>> is no consumer, those clocks will remain active in the idle scenario as
>>>>> well, and the sleep vote is never cleared, blocking XO shutdown.
>>>>>
>>>>> Introduce the skip_clks_handoff flag to handle this on QCM2290 clocks,
>>>>> keeping other targets unaffected.
>>>>>
>>>>> Fixes: 00f64b58874e ("clk: qcom: Add support for SMD-RPM Clocks")
>>>>> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> Are you booting with clk_ignore_unused?
>>>>
>>>
>>> No Konrad, clk_ignore_unused is not present.
>>>
>>> Irrespective of clk_ignore_unused, the proxy votes are placed to RPM
>>> during handoff. If no consumer takes over, those votes remain active,
>>> keeping the resource ON in idle and preventing XO shutdown.
>>
>> I re-read this and yeah you're right
>>
>> Is the handoff functionality necessary at all for non-icc clocks?
> 
> Actually, if any consumers surviving on these proxy votes on other
> targets as of today, removing the handoff logic could impact boot-up as
> well. Hence, introduced the skip_clk_handoff flag to maintain backward
> compatibility on other targets.

So is that a "no"?

Konrad
