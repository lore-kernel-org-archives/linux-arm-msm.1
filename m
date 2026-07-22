Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07DD44AB91
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784697947; cv=none; b=MgH08O69cyy5+KHzm3VZ3FylfLnUPLGDwOadAqBA7WXDzNxgxL1NSP1n2AqvnsO5DUtHjYBjY0dQWdnLS1fybS+xK4CvOBehZ9tcWMA5aWPN0AG9dvbJ5r9I29VaIn+9pBWfUT8rad+rxJUa3v0FOH9VWcxXzEEdupEiYb94afM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784697947; c=relaxed/simple;
	bh=8dOP4Ol+MxzS1oige15PQWq7tbq55uDt1yN2tKeA//U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0arEpBntPLx498sa5Jv9/OMWC26g7D4PqPXKVK8eAYlP143uDvcwF0ji39HI+d7Zu2gPcIwclGWjC6QoD3/Engxr3GBIB6HgBVEuqsUGLaRUoYkLU0Jjznk7KKSAjgkQSruoBH/rK4X94Xr8ksdvXyq301I9UzcIEENOrN2x0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jxH3XsYg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CTfAA85N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jxH3XsYg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CTfAA85N"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53oZ54169170
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BzQcr8m37xvJeT3LrP/YCQX3yjAJp9QHmunjzNLOzG0=; b=jxH3XsYgYZBR6OGL
	Aam3eo+YOsEK3LRJLmeA20+3+wm5dvBWgojdxh3P9ZH+fjcvR21Zg6KNejgZ9wCI
	2/qc3ZGPtzLvyvm8Is2s6nSsVhf4Q+9dW9pBfg3zXNTQZgQXJtKzinH+tgljfmg5
	49eFKdI5rP2Xsj+4sriKELB0OWFGgbJT/AhTySh2RfhMh3pAEYG+Mo3iO+4W6HHR
	65ShfqA4AOVPNg0nq+NRS/I3qTNyIy0g6D5nMzN3DcOI2qVHTLoEKTIxboK1vjt1
	QyWvSESCyaa8ezfmpGptlDhhSROD2GgKFwao4EXhIxawAc89zcpuhB1yTm3kCSqX
	DsaHfA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6r3mefc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:25:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso221758805ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784697943; x=1785302743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzQcr8m37xvJeT3LrP/YCQX3yjAJp9QHmunjzNLOzG0=;
        b=CTfAA85NKcJLocxL15LYIPjvHq13XGRdsznKdCdFms4uB/qvhX3+I+U9CNz6uVqPBp
         YB4o60sUHAPMb96s11thFsvwk17+4Y28dr+wO7oOFM/w6oltd6aHcNX4DZ1998Gkklio
         T6wOBhIz8T53YQu+PLctkdFmIMizII94jZz6SQrYsjWDonN+W+9JhcnK82KUNaAPPH7V
         mDuIdorEQC7LK01ajFxrB/E/xwTWZ05mR6H3HESLcF+tJOgSKriyDjAuAKYvx/spBsC9
         xRbDpMCUXRcoIwYJXOgq/nSzehkE/erAsQ1hAWIw0nRDOkB5NkK8oqsxWNHTig6SnayV
         H6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784697943; x=1785302743;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzQcr8m37xvJeT3LrP/YCQX3yjAJp9QHmunjzNLOzG0=;
        b=HmAixjqzIyt9L7U4Q1lP8x+DuQaFKN/l+E29cGp3BzZcFkwBg3ZV4mztVr3iF4f3m2
         xy7XmhZyZ6Wss4q5j/z2NJpEsOz5Kf9YY1pj2jwm/VsXQ/lgJbfhNgRtd3t7nJqfbzzp
         vJ7EtLlGBmOq6WUrKkpcg4yQITfdTFmMokwDCDCdQxDO62AX8/KrKM1dAKkfZ9HQ7rlF
         DBdHxqYnWGk410u9NMoM+aXHmms142BbcPPL5xtO+NINptdlu/D/u/49qqDwHqQ0Dm/9
         jgfzyNW5T0iobBZIpVRGOD2EeOoOVXWoxL9gIt/M9+noHs+fUZXVSKW9iXSskJekLET/
         Wgkw==
X-Forwarded-Encrypted: i=1; AHgh+RoBpc2Icu4wXMPujS0PPUrczAteA5nMv1JJgXcq+CmrXbCnafR68cZYs4X7FPvS9wgUitgWR4IAb4HX9kUc@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7LNtLFljxhrYcBV8hrWHV00T7hWsBfznCl8xqcRkhYC261fxW
	XVQwFd/HaTDf3Hd03xJSvgh3A85EE/zrTzBOQO8zMlIhnY27FtfeXvFakPT0k4vUBk48Q1YtZ29
	qm4EOYGG0G9n1CRq8yZ9dkdbuxJv+6jD17vppS4fxfmyRQBJVEkPxRLEcyJyI1w/TxG/bgRT/m/
	iJ
X-Gm-Gg: AR+sD12aIfzvntK27gqPJd90L/NaE/nZSc1s8HDSNiQ8DWeqaJgZiOpBAwbPMRAKUG9
	qGAAtSeHZKDZRR1pozEjrhVbk8mFX65OfEiQ5atdpJ2q7E/CQ7DTWEYHJow1iUnWPx/Ff/tBWah
	J9AUd7dDntxu1nHuuU039QJAS8uqswM4Cqg0Bxw9j/sbQF/jJvDibK1u11WSqLCst6ytjifKbqr
	LynTf2lekZvyGiMlDDOSqIRo5R0Y2ZCVLe2JGUDNSdcdwvqQo9T4o5R6O5PV/SqgwXDwRwysKQ1
	/FMAAxj/X0TNka4VyUNbeDHKYkW+/AN1y3c7OthF3boqfVtssHT3J0zD86Qy1HbSgvRSp2lacSO
	iatcZQAFSZMtOmSbu731JBVOumDBwHiK/syA=
X-Received: by 2002:a17:902:cecd:b0:2c9:9a19:10c with SMTP id d9443c01a7336-2cf34a4c9d7mr224373285ad.40.1784697943542;
        Tue, 21 Jul 2026 22:25:43 -0700 (PDT)
X-Received: by 2002:a17:902:cecd:b0:2c9:9a19:10c with SMTP id d9443c01a7336-2cf34a4c9d7mr224373065ad.40.1784697942947;
        Tue, 21 Jul 2026 22:25:42 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e621dsm7960505ad.48.2026.07.21.22.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 22:25:42 -0700 (PDT)
Message-ID: <65d7144c-855a-4b3b-93e1-c18c12f199ac@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:55:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
 <20260720-master-v6-1-671261b05c61@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260720-master-v6-1-671261b05c61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0NyBTYWx0ZWRfX7yIGDsjZTu9c
 OsCQqLFt9eUDswsS0rJW4W/oxySeoYKkcj4bqtY1cUOY2hbTy43IsMCXi0JIztSGC1osTLCw7HB
 h7T6e+hND5SDTFh13nVGs0YUHTE1LOWKDS95S9XfaBvSUThmHjA7C/6Xhu3F9lV5khfSDdGQI3K
 Tdir+3AUfTREwdvNZaz+Scfc2cya20cJPt6KEf/AUCwLWDvi9vf/XyapOo1FhIYoDdgMXnv7uui
 Ypo7jXxtZ6sLeMeFvtAjQrpgH2Bkcwdv3jwoRcIaQGU8VqxmTuuSo9qHvXVx398yQoV5V44JLsr
 uJIU0URHWaQ9QfyphgMEjQ43+PEvpK/dMayDu4rtLuimogYs+3Rqbu2c293mLSNklafZXZpOU3E
 R6u6JXzytOGDtDS+QX9ECj04/P456b1+J1qD6Sb6jdGbUV0//JcOPU/9I/A7HZVBHTlpQTHms1H
 ls85wgPcjd9/CKzlVhg==
X-Proofpoint-ORIG-GUID: LKn18ilaTAJCYNjzLp42ujJrx0Lg2lb3
X-Proofpoint-GUID: LKn18ilaTAJCYNjzLp42ujJrx0Lg2lb3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0NyBTYWx0ZWRfX0RobCOGgxdL+
 VmZY1HE/jMvJZlw6mXAEhRjtrsC9shxZkLIILKjEDLjxvB2LGQoZx8zGz2OKP0vIkspZemyx9ZQ
 4NZJ9i9znQDDTY7wctS/MdFpreLweGM=
X-Authority-Analysis: v=2.4 cv=SIRykuvH c=1 sm=1 tr=0 ts=6a605458 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=W_snkT02l9C0IohT3WkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220047



On 7/20/2026 5:11 PM, Aniket Randive wrote:
> The transfer timeout for an I2C controller should reflect the actual
> message length and bus frequency rather than a static 1-second value.
> A static timeout causes unnecessary delays on error paths for short
> messages, and may be insufficient for very long transfers.
> 
in short write as should be relative to the bus speed and data length 
instead of any hard coded values.
> Add i2c_update_timeout() to i2c-core which computes a transfer-specific
> timeout and stores it directly in the standard adap->timeout field.  The
> formula accounts for 9 bits per byte (8 data + 1 ACK) at the configured
> bus frequency.  The caller supplies a safety multiplier and a minimum
> floor so that each driver retains full control over its timing policy
> without those values becoming public API.
> 
> Storing the result in adap->timeout makes it visible to all consumers of
> that field, including the arbitration-loss retry loop in __i2c_transfer().
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/i2c/i2c-core-base.c | 24 ++++++++++++++++++++++++
>   include/linux/i2c.h         |  3 +++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 3ec04787a737..3280652e20d8 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -29,6 +29,7 @@
>   #include <linux/irq.h>
>   #include <linux/jump_label.h>
>   #include <linux/kernel.h>
> +#include <linux/math64.h>
>   #include <linux/module.h>
>   #include <linux/mutex.h>
>   #include <linux/of_device.h>
> @@ -2000,6 +2001,29 @@ void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_de
>   }
>   EXPORT_SYMBOL_GPL(i2c_parse_fw_timings);
>   
can i2c-core-base.c calculate within and store into adap->timeout ? 
Current adap->timeout = HZ can be removed if we add coefficient and 
safety factor default ?

Any other thoughts ?

> +/**
> + * i2c_update_timeout - compute and set a dynamic transfer timeout on an adapter
> + * @adap: the i2c_adapter whose timeout field will be updated
> + * @bus_freq_hz: I2C bus clock frequency in Hz
> + * @len: transfer length in bytes
> + * @safety_coeff: multiplier applied over the theoretical wire time
> + * @min_usec: minimum timeout floor in microseconds
> + *
> + * Computes a transfer-specific timeout from the message length and bus
> + * frequency, applies a safety multiplier and a minimum floor, then stores
> + * the result in adap->timeout (in jiffies).  The caller supplies the policy
> + * constants so they remain internal to the driver.
> + */
> +void i2c_update_timeout(struct i2c_adapter *adap, u32 bus_freq_hz,
> +			size_t len, unsigned int safety_coeff,
> +			unsigned int min_usec)
> +{
> +	u64 bit_usec = mul_u64_u32_div(len * 9, USEC_PER_SEC, bus_freq_hz);
> +
> +	adap->timeout = usecs_to_jiffies(bit_usec * safety_coeff + min_usec);
> +}
> +EXPORT_SYMBOL_GPL(i2c_update_timeout);
why is this exported ? you have alrady added in i2c.h ?
> +
>   /* ------------------------------------------------------------------------- */
>   
>   int i2c_for_each_dev(void *data, int (*fn)(struct device *dev, void *data))
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 14ab4d3055af..b52974eb7e58 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -912,6 +912,9 @@ void i2c_put_adapter(struct i2c_adapter *adap);
>   unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
>   
>   void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_defaults);
> +void i2c_update_timeout(struct i2c_adapter *adap, u32 bus_freq_hz,
> +			size_t len, unsigned int safety_coeff,
> +			unsigned int min_usec);
>   
>   /* Return the functionality mask */
>   static inline u32 i2c_get_functionality(struct i2c_adapter *adap)
> 

