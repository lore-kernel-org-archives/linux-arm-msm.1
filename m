Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DAE3BFAEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785125741; cv=none; b=X44UrY5s44VUcQUkpBjXcyhQCcBOVmbBcp1AWpO0fE+ayKgewfReaWg40GOa4dlIYWXB5claLeWBBeL0JswC/aDptotnGfGvDMw04cw6UdDqdbFS/slio8YPJy712l3/o+NUGVs0nIakVcIL0kDw293ZaFBBf9QSkAxat9BJPDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785125741; c=relaxed/simple;
	bh=U6Wx9QipFY9H9A2Yw1gKtvF3eIR1YhejlC9Fdfi8cGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cAOk2X3wPbnZ28meMv81X1h4Dg5+kV3+yB4Wy6JgxHz5+hdB2zu8/2eZNnM7zLSbh/Z6J0s33SdA8HdW5mcvGSdh4R8DmbDwRI6bE+f3pIRVBWvgyHFQp2zJ12RVU6ktYtXYvKHlzIyXCJEu8ANT8qWZGHmRSZig8TqZilNGvzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbWExf0Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MF3TxcjC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbWExf0Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MF3TxcjC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1g3ui2381864
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9WKErFP0qf/LcsPIqk5yJozgOYFoksx+I0vVulAI/c=; b=fbWExf0Qp/YB1zjz
	xJUGxLpc6hEJBpSNvbmZ8D/mSkfNueT9YjU5WqTHUhYtT5LdnlED4TFb96ZzBaCT
	h9B916sccvlzE63Do/pgiasOe+GPVVR6l68rgWlEVLZcboUq4ZZfjKIk85+3DIU6
	rpBp0G/IgE1EdyBVK5w6ndsSIcI8Hyp94Tg01SMRYMZkpsbg2PEg5lJRabFuoRfW
	abGmEpgs1LCzpfzoG59GI4ydzFzq341xRrZCCzXIroy/6hoIhO+rmzJJWFv8Wfvf
	aUiKlLy3xSeXuC8PyXQs8mZ6CT8InemElz+Wl/eU8XO2JTXSnp4wpejtoefxojuS
	nFjklA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmn7vcd4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 04:15:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso210180a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 21:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785125728; x=1785730528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9WKErFP0qf/LcsPIqk5yJozgOYFoksx+I0vVulAI/c=;
        b=MF3TxcjCmmXWz+5F2P/FG2Xzb7vVKdDBIrh0jKDW8JFkUubacYrhfDU8f56AVN565K
         iXC9pqVG0KY6WPRsct0e26Xmhasvgj/xr5xrYI/JltKxg8mKt9DevbS+nIktVCszbv/l
         TVD+otqY3SGRjucvAxkBM2SPsfwicfUHpGg4/dyHZuAHyOoiBtxaQmKp5Rshi+LZmDi6
         Me+Zp8dSDZ4Ry2m5GbQgmaRL2qnH2KZxK+VxfZ8Sb0njw1+WZhrBmBqgskHBdiiFxCgm
         sDS78+roxaVH9+lfC4sBXv9rdNCjXhbTwYjcmD1M3y4amwM9oCHkvKDe2KHHIX4MDDDp
         xLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785125728; x=1785730528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9WKErFP0qf/LcsPIqk5yJozgOYFoksx+I0vVulAI/c=;
        b=owN8Ec1pwYZQiop3otiFkGtQcqZVnervQGr4BIOgi0cykVbyBz6phptzAaHlhS8Alk
         1LFL5tdfDeYMmRxrYnR33PAwBbMYEZPFRXieF/UJrVx/PC+2A/S9LCw5C0akyYuGYCfW
         m8p8bX0Zu/9/5KV01WgdW4fHgemNn6eyslQb63sZiA1Qn/gFLgKJCrBgDhQDG5PQ+Gbi
         4VwafJV34yo6UsVF4ltvQ6xvFBvagdHWAeelcSlje6qIvuDSAq5ZDdZRrh0Q6Qq5G0Ky
         2EyPiwHX69MGBNHcZ7tl/BiFSj6jHN1IN1q5h6BLSZkiD5VPUttWdvtUWAo2jGJN0REf
         /xzg==
X-Forwarded-Encrypted: i=1; AHgh+Rpcc7Yt527IogFsjsMY5khQFwWbt1fv740SsBjTRYv3yFOyCnN1CP42DLcBKiJ/ulOdkYrg0C2lFVIMwBbe@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+Jdj5uJPaksz9HADrHRYResUfPu16zJccaN+uWeZ3Cp8JQ+Q
	I9374IaWx8fdnmXgf8/A16jRRCrKug7f6A78CRTefO1Rx6aMEDCeAydBtTvTJWJCE9FJnfcqsc9
	2FIXsZyyXu2FepEGstkdzUbocptcH5BMI2qUm8pBOkYOiGcVg6UKT5YRTKonLgrZ/nMx/1VbfZZ
	X2
X-Gm-Gg: AR+sD12uUq9hkIozdW3yTHN2E2pM6c6TgFhsyEcFU3oMG6t7tiwyYEhSG3SBbXJM0T7
	bZjnUkQYjy+wkmWrf8X+eFwMGxv6tUoMW1GoVfpmQCX1Ejyd+d1wAzjW6zM8NnTR1ACoJWLwd/Z
	OFttqifXE7gAkPGixIo34/7DsRV+X25p92aPoOdqqcBIzcudOTGWYIpkLlqc267+k2p7ctDj1GT
	dYnYc8u3+XOFbTA711J4VOaZyzH+pz3OjVtbXPWXFUyZoHVOaOBNG6ILYP//klUObGrc0wNvLj9
	LMTI9j63koTVMQz5BLwtl9wHGFyu/TWGlUU3MlmuifRuI+PGb6mGwtVX/3DWMLOEmMskWRmUNJ3
	Q/7vciqIJcwpwGapemy/v5E4cEKH28RMazg==
X-Received: by 2002:a17:90b:3c8b:b0:38e:895f:25fc with SMTP id 98e67ed59e1d1-38f2978dce2mr6627157a91.38.1785125728459;
        Sun, 26 Jul 2026 21:15:28 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8b:b0:38e:895f:25fc with SMTP id 98e67ed59e1d1-38f2978dce2mr6627130a91.38.1785125727982;
        Sun, 26 Jul 2026 21:15:27 -0700 (PDT)
Received: from [10.217.219.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm26882474eec.16.2026.07.26.21.15.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 21:15:27 -0700 (PDT)
Message-ID: <0c0d1406-949b-49ee-b203-3833b9f8433b@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 09:45:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Andi Shyti <andi.shyti@kernel.org>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
 <20260720-master-v6-1-671261b05c61@oss.qualcomm.com>
 <amZkf3lu7gjWhw04@zenone.zhora.eu>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <amZkf3lu7gjWhw04@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6a66db61 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jwhPVk8ja1VZsm133o0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 9cvVSNArZiCTfbhsL53mDlcrHvLPObu0
X-Proofpoint-ORIG-GUID: 9cvVSNArZiCTfbhsL53mDlcrHvLPObu0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAzOCBTYWx0ZWRfX0DDOFX0XK5j8
 voSFh2cHynZlhpYiQR6p4O06Rzua3ug5Fm6GcKZ3SWvpNnDVuqsofg7SnQ+1DUVFOsDnEWgaSyx
 qQ78PcsF95qiZQVVtyTsB0CH8w7kr0A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAzOCBTYWx0ZWRfXxzxzmyqK7rO3
 xOPNeLVLYcW+KJ2SlOn5z/ws75b6e8C0eFMduxsXBDsdu7qNOmhfmWA7M4l81L7Kyq5vwS2Im//
 2N4chrNYqNZVmJATc4EjeDhRSdPnh/8JLkxGXVNF7fnD0Fhc8CJO7a6TsnVPE+3+1OFdSVXP/CU
 42yNqVVF7ZS570eWaBRY1rGi0brhdpJtvNKOUAwJuhoMRrlL7q5fboVTURVkyUsU1dkjew1d6v4
 YgbhsSTaqFT/PxDyiPoG+oSM24otk2TzudCJ3X+n4w87nJNer4VgEZsqi7ua4f4QMPfyOI/TyUN
 h/ocUwmGYO+Widn7mCQJoboaerWjOdroW7A0SvayCfham0ulvUy65zt+fjBgYOB8S+bPp4viKNl
 iwVQ9NOlOzFjymDr/RhO0LJouuIGBycwbAMPgo7vmg5DasshYLWM2YdPZAznyMt58udSoqptp9l
 hJc78gH9GFhNR82vTAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270038

Hi Andi,

On 7/27/2026 1:41 AM, Andi Shyti wrote:
> Hi Aniket,
> 
> On Mon, Jul 20, 2026 at 05:11:19PM +0530, Aniket Randive wrote:
>> The transfer timeout for an I2C controller should reflect the actual
>> message length and bus frequency rather than a static 1-second value.
>> A static timeout causes unnecessary delays on error paths for short
>> messages, and may be insufficient for very long transfers.
>>
>> Add i2c_update_timeout() to i2c-core which computes a transfer-specific
>> timeout and stores it directly in the standard adap->timeout field.  The
>> formula accounts for 9 bits per byte (8 data + 1 ACK) at the configured
>> bus frequency.  The caller supplies a safety multiplier and a minimum
>> floor so that each driver retains full control over its timing policy
>> without those values becoming public API.
>>
>> Storing the result in adap->timeout makes it visible to all consumers of
>> that field, including the arbitration-loss retry loop in __i2c_transfer().
> 
> this patch does not take into account a timeout set by userspace
> through the I2C_TIMEOUT ioctl. That value would be silently
> overwritten by the driver.
> 

Can we make timeout handling a kernel responsibility and avoid placing 
this burden on userspace ? Every userspace client already accesses the 
bus through the adapter/core layer, so the kernel has full visibility 
into factors such as bus frequency, transfer size, and controller 
characteristics to compute a sensible default timeout.

Also, if both a userspace provided timeout and a kernel-calculated 
timeout are specified, which one should win? Having two independent 
timeout mechanisms could easily lead to ambiguity and inconsistent behavior.

>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> 
> ...
> 
>> +/**

[...]

>> +}
>> +EXPORT_SYMBOL_GPL(i2c_update_timeout);
> 
> I'm wondering whether changing the adapter timeout from the I2C
> core is the right approach.
> 
> Perhaps i2c_update_timeout() could return the calculated value
> instead, but then  do not see much value in exposing such a small
> calculation through the I2C core.
> 
> I know you were advised to move this into the core, but it does
> not seem particularly useful there and, as it stands, it looks
> somewhat controversial.
> 
> Unless there is another good reason for keeping it in the core,
> I would drop this helper and keep the calculation in the driver.
> 

There may not always be a userspace application available to configure 
the timeout.

My suggestion was that the I²C core could derive the timeout based on 
the bus frequency, transfer length, and a reasonable safety margin. This 
would provide a generic solution that works across all clients without 
requiring userspace involvement.

To account for variations in system load, we could optionally expose a 
DT property for an offset or scaling coefficient to tune the computed 
timeout. Even with such tuning, I believe this approach would be 
significantly better than the current fixed 1-second (HZ) timeout.

> Thanks,
> Andi
> 
>> +

