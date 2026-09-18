Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F8930D3F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720451; cv=none; b=IjQO+4KXqtuFEeMETdude9euEo/lK+ZnfeoiAMIJlyiut/p3Msaf2E+bX3Ae5d1LsiYoAEg0qH7YWTYwTFaMyL/4rb27xL4C0IFL+3cfhYqEFI2eFSKrudX39+htQpJFM4yQeegUp+HJKzQTSQ/xvRstN66Y9gzZviH8z4ytgOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720451; c=relaxed/simple;
	bh=U+uVeVwtuqrEC88epArnigjAnccPpNEJvTj4tDvUd2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0/iTdO6EeDakecZAuBeSFeGgVpFSxijlqHFdbi33JoBm16eG0fQgwcz4ONAsDMYRHHRcerZkvVfKPZYFk/AarjeXE5vlAM6mWdhGRt3ekQdJRIymIWoOJFtJ0ooQCbFxPLvNGJWeVEt36YAmDmv2UuBZFjyBdUpeohjwIx4++M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYcONB/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmfF9aCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYcONB/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmfF9aCN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xsLZ3423132
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0fajLe4Ju0Bfr8d+6KdLUJ3QgZNw3aDSUB0Drj0TcQ=; b=kYcONB/PCeNg1NjY
	ffDulEnShJ4xuw6R91mO8HESILEirHP7+I2iibbPWuKOg5LcoNRskjeLe3DwzYKB
	Bt3dLjoblZ9XyVVoWydnSi1m1blVBTrXzki22+utkRbr/nc+AVUmgRtpFYPyD7pJ
	IBwlf4yaubkV6rrsKCTaGFyT+eBwujEGmLjNEZ20tU+vAyuPgYgr6xPCVXts9eyr
	cAuS3zvUtDf6QVHHx1WXmAO6T+ItzLqWKWtoPPds+s1oiycXazKdgMgmTgZpZMpV
	Taqydg1twj16a+HfcOP4uioB2enTrU644DL6H4n+72OOtywjXH8IKn1N8Os8Vzki
	hHL5NQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdt7bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:34:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939fc317691so16350685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 01:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789720448; x=1790325248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0fajLe4Ju0Bfr8d+6KdLUJ3QgZNw3aDSUB0Drj0TcQ=;
        b=bmfF9aCNmagQBti6FKAB2qNmLJiRTUU+b4XKaWiAkCYnu5QzFgQ+Q3/0uckKsskA2O
         azEzLQDLPV36rRyq4JwklS7XuheyNob4cvb17KGdFmgq8WtaypBhVW7jfFljZ6NR1sAM
         pjECbZwJ2PlI7MysVjzBFVwjV/0OdJkDd6IHqg+N3OQMbJcArLT3m7eKgbqyE1Sx4+OI
         9qdaGW+uhpF/wj9xhZ0/ieumqWvwktsgyMZZsbriZE263hjg7QgLoJlambmY941bzeFn
         Sgx5hScON8ankpDrsyLCrMVPcT7ujFY6TvQ26n4sFMwt6EXvbjR6WvftlTnm2NyILOJP
         F2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720448; x=1790325248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0fajLe4Ju0Bfr8d+6KdLUJ3QgZNw3aDSUB0Drj0TcQ=;
        b=XDK1s2rPVqeYT8ZNiqcQNSdkU6HyyHBmO1zR5yQosQIU5uZK7JnAf+vUA7M/Iz19dS
         SmWtoVJvr8mebLuGb2fCZyNSCfWtYoaT6XzxnCUe6mPMd/3ITOrZmMBLjrSey02bFjAS
         cBg1Jtkw25DOseGIDZbtNtmia/c82tiG0KWWs8MkfVrAgIbdErLlfpCzIxq8pBJvo856
         gkiEwxNOG1TjOJ2g86vpNzxALn0tD58vKmR93VJYiJvFAJ6zp5VcfabdklQWc57GEFZh
         eDqT51zVeDN2x4neHBZ0fq2UtxsDdDU75a2Bblcu8XzM5tZOUIpbSNIfk7+rU2yL96WN
         g58Q==
X-Gm-Message-State: AFuF++lSP4v18ZDPMLE4yUYaKOiXTYo2Ox5X1FDb0yZOoRktAuugwEWm
	uz9W3wgtlo7NnnZrz7MSugkTedOoS5fROHuLCFnWLKeg7PYQ9z5NJ7LLnAkrFREK4P+v8xhL7RF
	l9EYxTDSB70gGfwSREYYpxmLfatCPsBAN8PDoVaH6vFRVE2PBOlQfTz03UY8jFegHsp58
X-Gm-Gg: AYBFou1qHUbdVIZsAcjTLK9uCqUujX98k3SHF4qogq5RLqBWYhuH9q/zk4wRkylgIXv
	6EbvCoLjXRD/9nY09d4qjr1DQ3cZybL7WvPOgm2sLGyLde4uirU5HqlYGHm+mUMGNDI7gePBnAB
	VaSvT8hm0m0WSgbXwO47C8flrhBcv4q5J67SrTr5ONGYDTVmXQP2NOY+OXyZm2lQ2N1/01PgC1o
	2NXgyIL6CyEuDjgNWtPflzNvtSQEhGiDIPR93CIo3/csmEoZlvmU5m7tbqy9wh8znBEFQC12Hks
	AmnZlEqjk9UUNU7GYmbhOrcAPpUrjb5k9V71kTFPqp2dbXx32kHZEdO/hkL+PXVzEp5WalAhMLf
	ol8PNOvAJhQTADLfctVYu3w==
X-Received: by 2002:a05:620a:6c0d:b0:939:d6cd:56e1 with SMTP id af79cd13be357-93bdc482445mr294199485a.0.1789720448043;
        Fri, 18 Sep 2026 01:34:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:939:d6cd:56e1 with SMTP id af79cd13be357-93bdc482445mr294195285a.0.1789720447437;
        Fri, 18 Sep 2026 01:34:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59605618sm514383a12.11.2026.09.18.01.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:34:06 -0700 (PDT)
Message-ID: <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:34:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
 <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
 <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDExNyBTYWx0ZWRfX5BJjg+yGeLe9
 gWBfncjnnZf4nrkQ0YGQw4cw8A++Doz8mYo4yLjy8mElBMPG2IO3x/Ih+B2E0asx8qQX5TGul7t
 g/Ga4O9TO1V8uvboYRFmR2WP85jfWwh9R/VSncRleTvBC6GWZ2v2tj3ZZ79IGe6s+JSNU8r+RKV
 cvWsJHmA+7cu3FbpatT7zMBVOB3mP0dUx7228U4COSgMP6GTthEMqc82lJDCnVWMjtXXVQERqwc
 7TMT8nZA4QKZyMp6Wqq03F7mTFBeM4adCgeagmGBCcJpeE+Mk4IPkKue3gZXnZYeawLnyPubJ3r
 ncL09QFEDrSypODmK5raX9JV143M7FNenUiF5rnKRJrWNmbZ7qt4COjKBxXs2HjUr5qObeSwst7
 sWZ+27kU5E9ADM+AA+z2CJ/ykruOmABeZiGzE4qUXHdFBHu+kP39mAsWkGpnqRAd960UrKY10DP
 1n+pUJ3y0PVD5p+f8Yw==
X-Proofpoint-ORIG-GUID: v04MGtgkFkjEZqUDDibCkWWsQs0LGOTC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDExNyBTYWx0ZWRfX1CR/ORDWBh/b
 76aKLBzfskuiJehrbgINpxJJKNJ9sUaW9vTps5yVOOLNU1WGnvLD6CmrQviMTmPS1L/wEp9GMb9
 0rg5wQgfdpCcoK8XiXvWsLnn1czcGjo=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aacf781 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=STkuWaXuNg38iv387h0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: v04MGtgkFkjEZqUDDibCkWWsQs0LGOTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180117

On 9/15/26 6:09 AM, Navya Malempati wrote:
> 
> 
> On 9/8/2026 3:33 PM, Pankaj Patil wrote:
>> On 9/8/2026 1:43 PM, Navya Malempati wrote:
>>> Add SMEM items for four NSP subsystems stats which are present in Nord
>>> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
>>> id. Add new entries for NSP1/2/3.
>>
>> For other targets as well is the same applicable? NSP and CDSP are interchangeable?
>>
> From the stats point of view, they are the same, we used the name NSP in downstream, it looks like Nord SoC remoteproc is using the name CDSP [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260904081619.593602-2-shengchao.guo@oss.qualcomm.com/
> 
>>>
>>> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
>>> ---
>>>   drivers/soc/qcom/qcom_stats.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
>>> index 06923408bfce..91f2d1293124 100644
>>> --- a/drivers/soc/qcom/qcom_stats.c
>>> +++ b/drivers/soc/qcom/qcom_stats.c
>>> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>>>       { "modem", 605, 1 },
>>>       { "wpss", 605, 13 },
>>>       { "adsp", 606, 2 },
>>> -    { "cdsp", 607, 5 },
>>> +    { "cdsp_nsp", 607, 5 },
>>>       { "cdsp1", 607, 12 },
>>
>> Is cdsp1 not the same as nsp1?
> 
> No, cdsp1 is not the same as nsp1.

It would make sense to explain the difference here!

Konrad
