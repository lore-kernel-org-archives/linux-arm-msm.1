Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDA946DFF5
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104765; cv=none; b=ZkoPpfF1Pw5vVxDSsV92aEwBwfZ986M4L+oRCDHZ0xoo+EWJfFDsxy0cU7isDCNFupissEJu7El8RS7Hu1MZ2gbEiPyj7hYJsM4Agn84Rf+4RrPHIO0dXDlU1T1rr6XShqIDuIQEz6uz322dhEXMG9p5Q02NNcJ3BGpr3IhEbJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104765; c=relaxed/simple;
	bh=Bv/j3+YwE+jC2BUDvg+NvU+66yI03vLpRhssxggIxF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5hLc+Pj0qrZD6xBekFp64DZygbcohyH0nI8FNTbUO4qwznjh8TuD47STqacEEWjcDilfbKxfM1ex1y0bphu2cFcf7e9YKrPPWlGFAia7UhZxHJv70P2/rbd6sMQgqbst7FWJP4ygWN6cMi0fpFakieSJO4Ghrowi/4/3O6P88Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euKP463b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdoS6/Bp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euKP463b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdoS6/Bp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777dIsr3822010
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 12:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7tni/GvmUJfIzIYK7psJJv8Q+0mTwBTdLTiDBhEsV8=; b=euKP463b2v6x2mgs
	wo4S4c9jAkmSalqftRXbR16ykaJxJrGY55EXK7yaYJN4PgRgD61t+hXC2dsZAbP+
	Cv+5Km/KRpBDq4BjWF+w0e9kWqDmZr9WzyRr18bXZ2KAbh3kIUC1gZ3wD5GZTz5q
	rzHsxSyOIHM2Bdw6gigQvV9cqBWUlT+55nCj7JYYDYBkH4DNOxz7T/EFgDHsBxcs
	ev9VwcPAG8okvi0ZkJ5tYLxrFitYzIeDzEAPXIa5mZzztVMHQEAiwWUTHc538H7T
	92cIHbzM7gYGej0rL7wjcdywVPn1fJBY31JyfOoofMIbyCYG1x41Z9/nupnZCqcf
	EwUnsg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6guuqh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 12:12:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so7211741a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 05:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786104742; x=1786709542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7tni/GvmUJfIzIYK7psJJv8Q+0mTwBTdLTiDBhEsV8=;
        b=jdoS6/BpFTbc27/zOY3xoRhis7e/OcYJVpUavq6gUFBP6m5y1FS9ksLqIt77En6kUH
         ckvJu5ULWmN/0MBeDv0pIv95vs4Tm9ja/LdoNNrhGCyUvqIFzmEp0CyG6bQNuMuT2aHa
         O7B0ilMAQHharXzUDB2NSL5jWTKu8p+qTRPEVKKeH6oRTmQKzCghnrl22nXagLGXePw9
         Qn/KTt0qudjtU7Gf/ts/V6nfEQfs1HPh8teIwxFOfqyTnJbWCOYkm2o/1BaBKrilYqX9
         jkE4kcuAFNU52oz25cpkkENGe11OPKSmhuiXNzmaJ4C5+FaSoxTMPX6qgAAvFeumKC7N
         rxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786104742; x=1786709542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y7tni/GvmUJfIzIYK7psJJv8Q+0mTwBTdLTiDBhEsV8=;
        b=YVidOybDDQXTM+UhBTgVvaosrqOkvMQS9bGB1S8PNY6BvA/+V2DqNSkMH/cegnHdp1
         o0FUXr8a3bzMs2WTJc/o5ijrkCQB5TgJU4BD3iucQoyKGQ9iBwiGAy3qcR39ccjyeGmH
         gQq8iXyqh+op+exbofwZdEJ+n6hy/WOxenIEVdHU+J2j4XgB14i/jKoJmY0ishXZBsmV
         dQ60Pj8erVBzd5+KOhfWliWuBNLDxM9hiKHl3+8HkTvOzm/DLLo4LP1NHOvqFRUy6XaZ
         dyi01kzbyfdvbFDFuNKnjY2wBRw/wgcZe/yO67VkJDGFkCIK/jRNWoQLurTt4e9DpKHG
         HpZg==
X-Forwarded-Encrypted: i=1; AHgh+Rr0fx71kd5BhnVVV9FX/LyqqMEo/xigidLeDWa7SnF6K2KKULRb8Ec/uMus4+Fi+mgW/EySMs9gFVRFe8Yq@vger.kernel.org
X-Gm-Message-State: AOJu0YwVrhf7+40QFt/oMN26e/ZRqK834eUyROXfTb/VWZArX46DG8YH
	0+mO0pWLedkm/cb3J0HP97LXTXQ9vKGuBL7DtzaSWhVdxZBc2ccF0gZQmONH/Ptkh4sNfZd80wU
	VBed9gbOFYiRMwNA9WkJNaFE1WcVCdL9SWxegnyxxyRtyIn/gOSQrokeiPXeIFpux0pjQ
X-Gm-Gg: AR+sD13mTl5Tr1Hpexa+TjKlIIlC36IfXbZcUk+hNGlPCnCMWXwq098HaT3CJRQxTOc
	QFYfSZkzaCRbd2gASWNlWgDZAuEsYJXTGaJDBnD26pjZBp7y9jMPxhWi9kUAoR4sxGdpMPvM/1g
	Br2a8DGvTpRcoo1z0nTR4wvi9RW/E3JPRJOciimug4r41CQgW0h2jVBfxfR+7iCNpechDzVFXNR
	zMYruBg9AO7EhfL7UwVKILSFr3ywuO5jZQ7DX6JQkkX+1h+S1+L0m3SUnChph2Z+a2fNlueTX2n
	GTkDQR1iOPA9AdcQvkLxy8h2W6BVSXfLeAMBCkkm+QYstS/8FWmOKKyahubNrWMvOZXpQdT3U/i
	/reHwmImZg+TeAVmnpvTVvt9jko/gYnmaXxStgT5TYIZSh5ynOv7NYZ1x5WgEQ6q9WQ6qT1y6Hn
	WhGs9Ewlw6o+Rghn3kSA==
X-Received: by 2002:a17:90b:134f:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-39261f729d5mr3901652a91.2.1786104742405;
        Fri, 07 Aug 2026 05:12:22 -0700 (PDT)
X-Received: by 2002:a17:90b:134f:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-39261f729d5mr3901577a91.2.1786104741939;
        Fri, 07 Aug 2026 05:12:21 -0700 (PDT)
Received: from [10.190.200.255] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fc6c13asm2440884a91.2.2026.08.07.05.12.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 05:12:21 -0700 (PDT)
Message-ID: <6d19e1e2-d1b3-4f33-8c18-4340edd6c567@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 17:42:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] cpufreq: allow cpuinfo max to decrease when boost is
 disabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: rafael@kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
        peterz@infradead.org, linux-arm-msm@vger.kernel.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, linux-kernel@vger.kernel.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, kprateek.nayak@amd.com, linux-pm@vger.kernel.org
References: <20260806044230.909961-1-sibi.sankar@oss.qualcomm.com>
 <20260806044230.909961-2-sibi.sankar@oss.qualcomm.com>
 <35it74zycctxhpnbsuvp6a6aazrjavarhq43fqgruafjv7xkt2@recuceutrqrn>
 <42d9370b-aa10-4382-b6a2-bc441fd2335a@oss.qualcomm.com>
 <zg7bzwbv2svt7llwooeyhojqyjkmqjvjvxd37hjgeggnii4oa4@jaai4hnlpmlc>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <zg7bzwbv2svt7llwooeyhojqyjkmqjvjvxd37hjgeggnii4oa4@jaai4hnlpmlc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a75cba7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Bw_Xy2VeKd7xRC0kUEoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: wRoTIhRV2PuQX_rO5OPqaJ7oFQZNYS-M
X-Proofpoint-GUID: wRoTIhRV2PuQX_rO5OPqaJ7oFQZNYS-M
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5NSBTYWx0ZWRfXyqBPRpJoEI/1
 1TQXr2SZ0d7RJ7jbUS/7TWAdXnXNAgsK1WhyQeAhi15caONFq4Ica4Pos7nxRu1RbAatB2iwfV3
 6/xW6lUxKg1/ryzi944ySLouer0UKdE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5NSBTYWx0ZWRfX6mRl2WlrYc/y
 5t0ZAwYiIWJznLn5GTR/ZrPa+gF0xS9DkTgF2wt3YuHWtPqPCPTV75RyRM5DXr/BI2nOYsv1xVx
 rcReQcAMrDBVj2WtUFfrJ8GTtktPmhPDGueTprNABhye9lcuh07BUoPe8zF4GQrHwYzLbyoFAoJ
 6JJiKHmXIywekyIVtLarkxdgA5Xyc7rZMkJRXuSIOSlEOcbwKKmWoheLgvCDYVNLtyRBxM3WCuu
 Dn+5wOuUL5hO/Azk6GaTH2uN4QOIedicOkmkoNilzKmgAnQb0vg6Y3kLWpJAjqcViP4Cze+19Zs
 lSfJnlEqYKfChKW1GXjOefygGLxmlY3CxPOMKDaW2/Fp3JLvvh2qlIq+QSxiXHnv9hZFiVB9Y37
 0Z0ox7JHo92cngDPuAbIZhdesHO20nqnFmxk9xFLLNNv4e5RPWT/rUs5UTg11pLCVmN8DbE2xpB
 L3WPGMdL2M4GRuwWWZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070095


On 8/6/2026 5:42 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 06, 2026 at 03:41:45PM +0530, Sibi Sankar wrote:
>> On 8/6/2026 2:58 PM, Dmitry Baryshkov wrote:
>>> On Thu, Aug 06, 2026 at 10:12:29AM +0530, Sibi Sankar wrote:
>>>> From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
>>>>
>>>> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly
>>>> if max boost is known") guarded cpuinfo max updates to only allow
>>>> increases, preserving values set directly by drivers above the freq
>>>> table maximum. This prevents cpuinfo max from decreasing on boost
>>>> disable, leaving policy max pinned at the boost ceiling.
>>> Why is this bad?
>> Copy pasting logs shared from the cover letter:
>>
>> # cd /sys/devices/system/cpu/cpufreq/
>> # ls
>> boost  policy0  policy12  policy6
>> # cat boost
>> 0
>> # cat policy6/scaling_max_freq
>> 4454400
>> # echo 1 > boost
>> # cat policy6/scaling_max_freq
>> 4723200
>> # echo 0 > boost
>> # cat policy6/scaling_max_freq
>> 4723200
> How is this different from the maximum frequency being unavailable, for
> example, because of the thermal pressure?

It's certainly different because the maximum frequency is available in this
case. Consider the following scenario where we use the performance
governor with boost disabled -> enabled -> disabled. The governor would
be voting for the max possible frequency, which is the boost frequency even
when boost is explicitly disabled.

# cat boost
0

# cat policy6/scaling_max_freq
4454400

# echo performance > policy6/scaling_governor
# cat policy6/stats/time_in_state
...
4454400 377
4588800 0
4723200 0

# cat policy6/stats/time_in_state
...
4454400 480
4588800 0
4723200 0

# echo 1 > boost
#
#
# cat policy6/stats/time_in_state
...
4454400 951
4588800 0
4723200 200

# echo 0 > boost

# cat policy6/stats/time_in_state
...
4454400 951
4588800 0
4723200 1048

# cat policy6/stats/time_in_state
...
4454400 951
4588800 0
4723200 1115

Shouldn't this behavior be fixed? The boost flag and per-policy boost flag
have no meaning otherwise.

-Sibi

>
>> Currently disabling boost after enabling it is a NOP,
>> scaling_max freq in this case would be pinned to turbo.
>> It will be reachable through various govenors. Also policy
>> specific boost flag is meaningless unless we have means to
>> reduce the scaling_max_freq.
>>
>>>> Remove the guard so cpuinfo max is always derived from the frequency
>>>> table scan. Drivers that correctly flag boost entries are unaffected
>>>> since the scan already excludes them when boost is off.
>>>>
>>>> Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known")
>>>> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
>>>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
>>>> ---
>>>>    drivers/cpufreq/freq_table.c | 7 +------
>>>>    1 file changed, 1 insertion(+), 6 deletions(-)
>>>>
