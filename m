Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795172492;
	b=44IoxWJsp0B2FBQDkX7w1rj9BveK1GdiKyU3M3omBBFL78/9dEsoYvzLr7X8Eo1xp4iy
	 KhTNCE8ghBDxeUbQLOHz/d6a6PYiLiZ3VrsmctoiKaectZWdAaIxL7rMAkdXAcKCHiJV3
	 TBFOWs+0Tk0kd2gwu3zTgJVcq8PJlh/78OwBqI1372S051a+ZKVqPganT/5HYIDcxZ/D7
	 YQBVg3LGLY+IwRD+CC2j/7HhHAsdHMy2kev0+ghL6yB/oOs583MWos7csw0GUnULPhvFi
	 ZNvWzsSBFMpH3RvUGNRN978YeiH8xBz0WEyGTytCqER/wRaH8T07Tki8v/9wsgC4HWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172492;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tfEwMMFJ6+T2olV/zbMMG3qY/sm4oMfIGWok9FctD4g=;
	b=utFMCzwXwfT/hXz4digNxBXi1IzjWnevYqjZoz+kVGFTJeZC/lbWFka5Y2zqy/6k6fcE
	 H4uZEaLKXNjoUiQxVbE2vRHZPsbpDsCT7kzqPoudQchIdTyzAOJMwdKxX66EvR01+qFbq
	 LN6n0wJa796XJfDECh4x23shuOKrZ9DymsCAFedyVIfTyGuzw8asRhrM5N+ZY+yyLzF/j
	 HtAo9HshQeGKlGhIMdkl/JxIKQOnQJ0sapOnu5lDqYJzIRB6xKDuQlBrL5joD6rC3SKMZ
	 RJoM2DzVXCu5vAv7dxaxbx0bvSBJqA2EjJdlct4ZFmoKmGcT9j05EXXMS5HAFRN2Pug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6d1XxOD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E3Q04fNW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2009D606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:01:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2009D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d6d1XxOD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E3Q04fNW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwAU1168946
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfEwMMFJ6+T2olV/zbMMG3qY/sm4oMfIGWok9FctD4g=; b=d6d1XxODjBBdAlSG
	WHy6RqWLX/FSfUv6GgZPLpM6dWshQbOT4/HqK7u0OFiydm38Wq3WMRhOtsiMt/tp
	NEXwy05NiNEeaDq9YC89DAPUd0A6C+m14zozf+V/6+jIxBiSv0pDdEcDDiEWHSjO
	RuIlCKCaxUFjkgKqa3hcWHF0+iuF4UBODTH1VogeUHv26q3rYEfwEd3KC1EkKCux
	dnRdwSMfnKitSTrLfdER3Twf9jyOkukCukA+QJPDoUMUNgm/kIq2SUbEv4ZXJ1iD
	zxTYFGo7OSw2rGomzr1XaZuYO67PigzXLkrCR/ZI9e9O7cUyXTtw2WtPr5t3vJQ9
	I1BvEg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uc78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:01:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd97f89731so522416a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 03:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795172490; x=1795777290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfEwMMFJ6+T2olV/zbMMG3qY/sm4oMfIGWok9FctD4g=;
        b=E3Q04fNWXPHZ79Yd3VU1kcNv+BMqGdSjY+DAWJmhQFexRFgsxbwoSa3neybvGEbwsk
         58FDAA8Qc45oKi/bEUAGKucBywBMV3o4nSMRAxUG5SzxrYqnVoqo56zMHVgmoGRa7ObP
         pXSDBRRVZbpocF8v0bkjRiLMZ5Ia4Pjgsw1CfmhPeG+2TvXDDpp/OL4tqkQwjm3dSeNz
         uX5J67fTfw+LWypdOdEjAqLoihEUQl4qDi+5yFxBlush/X/db7jGynxc1U3EH0Il7Njm
         T1ozCNvoWGDIdlnAiZHqZCb4UrFaafdzLcnixGlwK/DZUJVvTaXrr7pDMm97FpBEbsZJ
         F2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172490; x=1795777290;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfEwMMFJ6+T2olV/zbMMG3qY/sm4oMfIGWok9FctD4g=;
        b=z5cI/xoBT5kZdpzjVviJU5BsvmNeXnIgHH1CQcDyZlAoY1NpQBzMW0HyGoh9yi3Hl2
         CZ+m6dzA52jVZttj9toE6hqG1kHReMh3O10lwyk7yb8FwmS79bLB1CJgtnzhKyEuev4u
         f4Waq1RUhb5dEN24T0tSok17g9aVOw4ZrnI0k3Ek4GKDsaWm4xJ9tXfwWicjKixDh/Vk
         Q6vSUESsDILczD1AIb4k+ipD9gdImZj/dlPVnAeHFWptvgIsNf+a3SQExBkbk9gyzlSb
         Waa97xC5ECu5eEGpJ4gcXJ2XBiakP3GthiqVSIAe4Vx361x2wcxqZeqmCYDjKNxRQBXA
         K/vQ==
X-Gm-Message-State: APuU4Z9JpYOogrDWFcbqFPzs4X2sTH6g3dnAIZFmKgccDXRbqbXstCiN
	EYFlt4Vatl0RCm+CXbibnz4Ew1hP92hKAQWxn6i8FHpm2rQm7Yl7/y51mCZ8X5EqXulqegrqHq0
	C7tygolMujCURMbz5f/gXMWayhujkUuYVlTHsfGLSJBctnZ5+StwCT0OOFLH1OuyH3Zs=
X-Gm-Gg: AYBFou32mhj7ELfk/pRviIr1SjjF2ol6tPN1rJTpOflIjtz5+4jznL1PwyfEdNFXTni
	LjV0tVYGZZLk47CbKEGyiczwk7kSLrGAyH3tLHrdn0p9y6iZXvaFBaQoR6GmhonjbPfBY2SJFYv
	HhY4smWGVbTbW3y4P+hP3h1fLZTivi3XEt1hQAIt/ZdvcIj/e225rR7hpzaLqbTeEsG72CuWbo0
	8UZ9NH5vJ8MF8euSXkuriDU87WdZL/nUnK6PZ4Ibz+QVCtkm+YVPL+g+Tn86wV8y0avJWcakvGM
	zBGdTs1WPKTjAmkSMKQ9DiJT5eOTjIIqxn8nyDi4/WgBvXyCA0h8s2q6jL6IqQvygZ5LgC/mOEk
	gGSw4OEPYYV3CFK9Mo3TPWGevLvv2M3YIJaEvq4eOBWE5YYZsFbDsbBHW2hyZ+EEpChYVFOGuXo
	hxtVt5btc=
X-Received: by 2002:a05:6a21:a4a:b0:3fa:c74c:756c with SMTP id adf61e73a8af0-4014e45e611mr1897993637.35.1795172489776;
        Fri, 20 Nov 2026 03:01:29 -0800 (PST)
X-Received: by 2002:a05:6a21:a4a:b0:3fa:c74c:756c with SMTP id adf61e73a8af0-4014e45e611mr1897969637.35.1795172489261;
        Fri, 20 Nov 2026 03:01:29 -0800 (PST)
Received: from [10.218.26.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873f16b41sm1336893b3a.56.2026.11.20.03.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 03:01:28 -0800 (PST)
Message-ID: <9130f308-e264-4ada-87cc-95553c5e9e0f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:31:25 +0530
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
Subject: Re: [PATCH v4] devfreq: qcom: bwmon: Reduce zone1 threshold count to
 3
To: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119114426.4050161-1-pushpendra.singh@oss.qualcomm.com>
 <cf2091e5-44a3-473a-a5e4-d9044b053b45@kernel.org>
Content-Language: en-US
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
In-Reply-To: <cf2091e5-44a3-473a-a5e4-d9044b053b45@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfXwdIc9oZ7nrrL
 Un8cHWRd9lbu5PXkDvPXdVJMTYZBDgd9M5MfUC6C7FQh6VahMOxy1URur1P5E6QoLxwozTBvqiE
 rbmeskF+WitcNELZiXn1SD+A7p5/YTc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MyBTYWx0ZWRfX0Y09SEUqef2j
 qfFBvg5TgQzMBhbBCHwdGEYRehUMkll/mWL7w8IExibpaOwz+KsoH7gcoSiQ2CCnI0zDCkapauG
 bqMg9kL3rGe78pNxvoXuyAiEV+BSIpsHqQQMnB7DjNsnnhr9/AI3g9z9PA/Vt0hu1pHZ7uMQJ/w
 OsnTtZMNjuqsDu5mzkjccFIK3ycG2Gp5306RwEw7+x6tApborbYJfVs4nvF/Ji7OfrGLI+sELlE
 0LS65s2sLf/aIta3O+HpQCADXDYJB2eCFNoQhYNqAWxmxEdalOp+Y6sL50bRR4uf2Ta9bTs/69k
 HmwGsOLyHCBpYAf6YIxqrBhDlHSgIHr3CDXsE1EJ87PyvyPF7fnmjc+Ra2XqVcnZC3O2dD5TCcF
 U5X5VJXipFkM0r+IjQSSo51BUHxMsOWgXyw7DAMj1uKFJsTXfhZIEHLgflCzpMSk2dl9doGAElo
 jteNEvDTh6b8KRdn3EA==
X-Proofpoint-GUID: bP8HWy4Y5euMnSbOuQeSock53smtP1ma
X-Proofpoint-ORIG-GUID: bP8HWy4Y5euMnSbOuQeSock53smtP1ma
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b00288a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mi1jIm9wWjqR4qfdRYIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200043



On 11/19/2026 5:37 PM, Krzysztof Kozlowski wrote:
> On 19/11/2026 12:44, Pushpendra Singh wrote:
>> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
>> vote after 3 sample windows instead of waiting for 16. The previous
>> 16‑window delay (~64 ms) is too long at higher FPS workloads,
>> causing delayed decision making and measurable power regression.
>>
>> Power and performance measurements were collected for
>> zone1_thres_count = 3 and 16, with the following results:
>>
>> Usecase                         zone1_cnt=16	zone1_cnt=3       Delta
>> YouTube streaming (power)	4126.49 mW	3991.30 mW      -3.28%
>> Google Meet audio (power)	3058.79 mW	2929.73 mW      -4.22%
>> Speedometer 3.1(perf)		25.8		26.5            +2.7%
>> Geekbench 6.5 ST(perf)		3907		3905            -0.1%
>> Geekbench 6.5 MT(perf)		18636		18680           +0.2%
>>
>> The reduced threshold therefore allows BWMON to react sooner to falling
>> bandwidth demand, providing measurable power savings in the tested
>> workloads without a meaningful performance regression.
> 
> I do not see how you resolved my comment, so same comment.

Thanks for the feedback. I had addressed the previous comment by rerunning the power and performance measurements on the latest kernel (v7.3.rc5) and shared the updated results in my previous reply[1]. I have also included these results in the commit message in this respin.

Could you please clarify if there is any additional concern that I may have missed? I’ll be happy to address it.

[1]
https://lore.kernel.org/lkml/34ada002-5271-4f05-8b6b-ee4294f2ebee@oss.qualcomm.com/

Thanks,
Pushpendra Singh

> 
> Best regards,
> Krzysztof

