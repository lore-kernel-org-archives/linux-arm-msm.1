Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7709402B93
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784894175; cv=none; b=N9xdiz3tkpS2q7K4Z0uRPcTJUGHL3aOxzcPiE43s85ocT9PQubbE/vucWGTQtzaISuJ56s7MIoLlhiNfI+J/TBtd7eSwojXNN4tLlEHKjliCzflKDrDp6BCmZCzZ16nogUy9p2XzaTZq9eFGPqkUseeYMBDRjhQsacO6t4riIj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784894175; c=relaxed/simple;
	bh=z9lFTn32Qc43wkSOIQTlmrTywIBYvKWuzcjZ7S38Z98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H0bO1OvGjijvydE1IEz/JJ2ZFFC/QQx4Qkk+KWQM+TfTtdnn+I/+Z5zsHsRaloGqdQe7OjJ44zI+PPRhGmF1DAsz+5YySOuzW/Ux7Ik4RR809UptoU6kWLMiMp6Q2akGMtj3YgI8fpTkN2WCDOb8Z+uku4DK0/3lOOdGSjupA0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIysdfK3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HU/dxerR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XIysdfK3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HU/dxerR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADX4j2478968
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FZCLWX2ZlTuYRJjs7RINJ3Ro3/TskrzAG3MYdafhbU=; b=XIysdfK3kruzDMiB
	KljiOD6Lv5g2bJWfdDjv7P7wq2pRQFu8NgvpZNiDbeQlEjAkb8++Tw0BH0h9SziF
	YH6fmRRJZ41ZaWqrP6mZOEM2hb0J+EJ6VEnLZ8EXLo6kWRdgPIBFZ61jgXfpNLuX
	HQxjtv5QMiyeSGMj1td7TuAQGLRa0MWOqVVJdRX3/FANPvjJXeMp3rjku+G4cfkM
	fHf97TWcTl98XTw7srmLh2fdDF+A4hzQ444D5lhVM/GblZnpUMxoglcrRtbEak7G
	BLeOQQr2tvH+7aDe0fdFWDcYrXLD8lhs5XUrOx+JSYZ1g+KmanJcoI8wK4QgZI3l
	C/ORZw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm2cx9ar7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:56:11 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce14a21faso5404755ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784894171; x=1785498971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4FZCLWX2ZlTuYRJjs7RINJ3Ro3/TskrzAG3MYdafhbU=;
        b=HU/dxerRVx440Tp7FGYDY2i+vmkr85ZVK8WbZtsDclb1VoJGd/l7JhkYkLxOcl+Non
         jyAAJNUlRyVuNFwAkpHwHKfyoNx/iFMS4nAWGkEfg+pnNWRYXQzhbq34CNS75sqPmj0P
         o1qD422dQ8KvM9y/k8TRRD89MO7v8de48Z1LQcTBkkJWSK0Nya8G1eQy5JJFDe9Iy/Wb
         /jYPZTXU9estAO2Sf8cdEGFHsBSI7zfDB40nysKoz/ap0gmCWu4priwP6qtUcB/gMl3p
         9qlPMkTplUY6vcOAoEJywkbKKiwyOG6Nc6o3GeqbknGzz8xnDqN31wSoVq+NVBTyDBXy
         V/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784894171; x=1785498971;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4FZCLWX2ZlTuYRJjs7RINJ3Ro3/TskrzAG3MYdafhbU=;
        b=JP/2QLi2WJDk9QJVbRldGOgGXXfNENMFwBV0XQt5Kp7/UvtEcPRuwyE73MbQqT7b/L
         +ullIizttgY2BfhlGNiPM2j40nO+GyJj34WGkHdnxEKRlNvF6kB0nYq0keFwMos9MhSV
         lOwqb6AzB+vzR6BdV9LRk4AllDC2hj/g8HV7R/8sLBs77sFR/Os7MCZQou7b5GWPMl07
         JMx3zoQhxzH8NfgvwyVwUnkixaUa+uDyB2rmWC/gq6qtBGvqIuWrUlPsAnFMSxM/uJQj
         UKysy6a6o+khqFAeBVNIoPwzHS4oikr97JyCF53Vd7pkM5JzwPyHW7WK2xWC5sme8HDg
         2E0A==
X-Forwarded-Encrypted: i=1; AHgh+RpcEQIMdvXUu2uGsqwgysCT4Bt/YuKtx9WHAuU2naf1ca8HJ7wugYW2XOES63HPl93mt0zwym0eLdV2neDa@vger.kernel.org
X-Gm-Message-State: AOJu0YxcxDB05H0005PrwZAERAY5eIIPqIqiAVgRESLl3+itu56Ta5ZC
	ejoWWEaqmN5pdzD56VZxmYX8w0n3hcM0OpDUuC1x6B2wfPojfJx8ut3UFlD38Y5t8nze/GtM3v9
	al+ko5KhJwfRuf+iLBDmTeGXNjlKmPy6ZMY9BovtWZ5G/xqsVA8/mJWYT8ZYmpbbkaBPV
X-Gm-Gg: AR+sD12NtNRLL9HdxVKk+AnLihpLCyZyyxyGSrcHansBDVxA9l/V9Evj7wjgP6GYYHN
	lpdSNhlD68jLfcly9mggbaABg6f+xj4ZJMtTGdTtyXNS8dz20NjnDj1/D14i7faUe01U4Lsc5gv
	qTre5j7BLMutesEnbZ67mlvDF7Fqjf/tly99hP++pjAaW9Aus0z9BxOpZUmZwzlQaGoNB/ms4GM
	Z8I1g35k7AaFFFXpu+kUGq4HRmKArtNYSGu5hHgDdLFTjOWYgOyt+5BquDBiELjyYA1AK/E1+9x
	S5fT1+nw9uZpBvPHSZYtwWPXs670XPF/44pvteaOHAIts6Yn1vSqgl8ynqPjDqNXgs8dvoXVUVY
	sZ7wEIkCvIo8JFq61iF87ePuQ9xfDwJwG
X-Received: by 2002:a17:902:e810:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2cfd70df94amr2289335ad.7.1784894170664;
        Fri, 24 Jul 2026 04:56:10 -0700 (PDT)
X-Received: by 2002:a17:902:e810:b0:2c0:d94f:50c7 with SMTP id d9443c01a7336-2cfd70df94amr2289115ad.7.1784894170214;
        Fri, 24 Jul 2026 04:56:10 -0700 (PDT)
Received: from [10.217.218.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efa38c1sm51344745ad.8.2026.07.24.04.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:56:09 -0700 (PDT)
Message-ID: <23edc4b0-c5cc-4c54-91ed-a7bea945e680@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:26:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] i2c: Add dynamic transfer timeout based on message
 length and frequency
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
 <e1e38c71-5f79-406e-821c-ce37904102ba@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <e1e38c71-5f79-406e-821c-ce37904102ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: lSufQUjVI3GR78q0Dv7RRFRVtJcFFGCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfXzXog8WZ2zc38
 wz1hUWYHvArBpGoWDXAzUSpn10PHr9IBfO0rhb14s7WibeUkIbhjfowwpDc1LmxyE3xD4gnlEdt
 4aWfvURq9oxxYwHdT7m6pug7E1xazpWwoNqyscg0bPai1BmnIX0l7QSay0nhh3aM1nynrwEtwWw
 SFunrx2RoOlaQoLwFUX0uk7nuIRGsbLskc30x5/zUtVmkK0It7PH+QJcXEUQmyoFZ8X9QAs7uy9
 nwQim/0NiZFNngkJJiD1urWmpFPJ1snMrBuGa1fzkBsNvqiP/qx/CJ/IjJKThSE19n8bswoNZ1g
 Q6RuM+21mJLP64KkJtEDkT/w4v4zuC9eGlhKsi3uekZHcYrkFSux+EkjvjJSEebIuqkxj5tEe4i
 aaUQGbbJTlDfcvb/43bKFSx6XoOhysPj0RCHxPkCBCd1pb76y1Dx/xKGQgrrrinP4LzbYLX1Yng
 VxevlrSz1vg5i0PtxLQ==
X-Authority-Analysis: v=2.4 cv=X51i7mTe c=1 sm=1 tr=0 ts=6a6352db cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y4WXMNEb7aBAyCZDk4MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: lSufQUjVI3GR78q0Dv7RRFRVtJcFFGCb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwOCBTYWx0ZWRfX/TQWzHUFRjeL
 NrAtJu/ADJFccwnt7n/1+Ajt0SX0WgnNP/vLlPwHXSI8bO4vFSYUWBi9iv5bwPrTQlYnMXPG6BT
 fZmRjTWhuP+cjzqSiDJYlwu+FktKhUA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240108



On 7/22/2026 10:55 AM, Mukesh Savaliya wrote:
> 
> 
> On 7/20/2026 5:11 PM, Aniket Randive wrote:
>> The I2C core and most controller drivers use a static 1-second timeout
>> for all transfers regardless of message length or bus frequency.  This
>> causes unnecessarily long delays on error paths for short transfers, and
>> may be tight for very long transfers at low bus frequencies.
>>
> OR can be more than 1 sec for big transfer at low frequency. Hence 
> better to make it generic saying depends on data length and frequency 
> which you have mentioned. So limit it that.
>> This series introduces a generic helper in i2c-core that computes a
> generic helper function

I will update the comment.

Thanks,
Aniket

>> transfer-specific timeout and stores it in the standard adap->timeout
>> field, making the dynamic value visible to the core retry loop in
>> __i2c_transfer() as well as to the driver's own wait sites.
>>
>> The helper accepts a safety coefficient and a minimum floor as parameters
> what's the policy to accept ? i think should explain here.
> read from dtsi or hard coded ?

Agreed.
The policy is still being discussed (hard-coded vs driver-supplied vs DT 
based values). Once we converge on an approach with the other reviewers 
and maintainers, I'll update the commit message to reflect the final 
decision and rationale.

Thanks,
Aniket

>> so each driver retains control over its own timing policy without those
>> values becoming public API.
>>
>> The second patch converts the Qualcomm GENI I2C controller to use this
>> helper.  The 10x safety margin over the theoretical wire time and the
>> 300ms minimum floor (to budget for clock stretching) remain private to
>> the qcom-geni driver.
> geni i2c driver

I will update the comment.

Thanks,
Aniket

>>
>> Changes in v6:
>> - Split into two patches: core helper + driver consumer
>> - Moved timeout calculation to i2c-core as i2c_update_timeout(), which
>>    writes directly into adap->timeout so all consumers of that field
>>    (including the __i2c_transfer() retry loop) benefit automatically
> please Add suggested-by: dmitry guzman < >
> Also add reviewer into to/cc list specifically.

I will add the tag in next patch.

Thanks,
Aniket

>> - Driver supplies safety coefficient and minimum floor as parameters,
>>    keeping I2C_TIMEOUT_SAFETY_COEFFICIENT and I2C_TIMEOUT_MIN_USEC
>>    internal to i2c-qcom-geni.c
>> - Compute timeout once per batch in geni_i2c_xfer() using max message
>>    length, all internal wait sites read adap->timeout directly
>>
>> Link: https://lore.kernel.org/r/20260715101805.3615166-1- 
>> aniket.randive@oss.qualcomm.com
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
> 
> [...]
>>
> 

