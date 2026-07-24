Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBE92931F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893609; cv=none; b=R5zc5nkmgkqM1qdx3JKBj8T8/RdlaZQMCMFjcHONTdl57OZOUp/x5fD4/6MHjhHi1lQkX/nSGooRGzwPteqhmZ4rZziZpibK4UZJ1jhyaHSVIFaD6GBSWFxG+mx6F742nvnff1cqw4ArdHBDkB8yCjrGpLZaH24HOFlIlLkR/GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893609; c=relaxed/simple;
	bh=8n53eoM2Ce+D1YY4Gy6RGiqQe9rphv7FbaKlkvmUtCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZPG9KFPKKnIhw0/bPzSNeybFSycxoAx9MNFYPoO0Z9dvaM2dwemFbUi15qglYYoPWaIW7HvHJegVzlVvQTinEFeMzUHh2YNJH53kgeY81cOnVXxwFu0fpJWKXfIKX+9ijwqDpAOC24LdN49I/VidB5lSTHLQIlYHD41+mWsUts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjDcms/X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWBrYf5L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjDcms/X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWBrYf5L"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAE6GX2256742
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SF5gXgEdawXvlfPdk58fGjZD60SZQ4PNrCV5dhNWsY=; b=MjDcms/X+ZpI52OI
	16NnNQLq0uHJclC587yRKX+/HSDGfcCu6+m2/5vw6NvD4zkhvxtwoxjDMq2MqwUP
	8zRbvJOaFbhX6Ete19Mgm3rei1yn5vJ/yyuCnNf/KccD6bLzdFGWTogkc9vxBDRO
	/aM89aF6X3R9hGTCTY1xqWGfpjS2eLT0X4VK9GeX/k48K7aqzG0tOoMwVAoBtS8d
	ZC0dbDSNG1z2fesRq7Pup/EYxpAa+31Reo9N3eyTQvu7MszCggsx2fj+dYZbHmZj
	E139o9+TTR4nmK0qhGrhju++fMY+MaFPiA5bXMf717LXIq1GzRZ8Ns+zd0w/LKi7
	nRCqEA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkusrtgpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 11:46:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cacf17c7e0so5143615ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784893603; x=1785498403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3SF5gXgEdawXvlfPdk58fGjZD60SZQ4PNrCV5dhNWsY=;
        b=dWBrYf5L5G4PZkC9tFuL8mAN1hZHdYUJflXsLA2Fz/bgykGlktPfgyjmI8MbLnXCgN
         hmukdP+PtpbzmdrxQmkHtg+QNvPR4lMuZP6UzE9qUijscudd8y3aJrbOI1F4AqYIQke6
         i+woHyJ6w//oPnoa0ZJJsg7iSc9hc0M4GMfJjemqxz7SqglZFYfWSV+beqEPIR1XAZPg
         QYVAT+fjlPu5mV3J7R406cGhnZXGc+uZsJhhVrZzzylkGEoeIDr9NfMZstX8H1jwJ6dA
         /xCYOBSs596GA1jnJhLHhYmo241l0xAeHJTqDELwfpVzoerJltQIyVe6MqXWB/lrJ6wb
         jOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893603; x=1785498403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3SF5gXgEdawXvlfPdk58fGjZD60SZQ4PNrCV5dhNWsY=;
        b=aarY3T3I/oKk+ndvlIyDl6Buh97eNunWoPG67t9ZAtANiCZ1/OwpbSj5xNUjCSsM33
         X2U34Ps6SIG9lFBRLE0gIsba2CQ5K99MZNzFUvuLqy/e4mr8aHuU4wfPUr8NqCC8MSC+
         jEyk12xW1mu3+CLBhFUv5SQRv/JhPSIvYRoEJ0avh4LExbB3XgbRs+smVhHqqNGXGvNh
         F+uH3J8A7XnUO0xnGLr+h8NA5lMgcNgNduGbRbJyTRrOd8rJgZJ3OGw28vvrvruRav8+
         y8dZ85Ah5fgjwgSmKB/SxBJpRy1uUCNwc5eYbcPa+exeym5knlBw/vM+MLAXzlgGLN6Y
         Mj1Q==
X-Forwarded-Encrypted: i=1; AHgh+RozSrUJbLmOt7gHRonZqWdm+xF37x08PHqcaCemyRb9NLh+IPjz/UHfUOpBtu3Jk5h7WwGOzPP9W3a4FAVc@vger.kernel.org
X-Gm-Message-State: AOJu0YxCMhSoWKWW5fOjWmiz99YOwEpykYEkHXlU0Bkp6LZKrWCzog/T
	JbveSw9a2rL3qrHD3mHMwKdWAKWBgGt87GYbAfnzwAjn7+MiafkoWFskBYsUJINy2gUXyEPKPYt
	dGRulZDEFv9LOFM8JjFzPhfcb3NsIL2Y3HksFG3WdOvAuZTsGhp7vwVOrpXHlfljnlz6x
X-Gm-Gg: AR+sD10aDrIfJINiakn6k+HHd4yQpXuVpZ5W5hUpb5Fel+DcomsXEi/LYRi78Nsjj1Z
	HRH3xWRMmYl7SoC++EkTaThHLAcsnndAZX80x1zVInIJL1k5YNHUEh87N1EOfT7UHguw8V0POOv
	t4FaPbX2Eylq23uajEqpvEB5Uosy8NNbtl7Aymaz19prj0a0cP0y7fGUt1O1a76AwqZ6vVEJcY/
	4xUWr3W1dO6lGq4oDTGb7OBQZmqi81GcSj3sHrsgesWVUTomaxogBT11Hec5YqpEtvo+GFrCcfa
	LD3PaUJNuslEtWRpH3fKHke0d8PwbxZbsx5vh9sopEShiCp87/nsuwnecaIUjwyMk8iyfV3scnS
	VZAlD6pFHYH3AEhcvUeXt6FS/IW5iZlXW
X-Received: by 2002:a17:903:1246:b0:2ca:4cfd:a6df with SMTP id d9443c01a7336-2cfa6f821aamr82763785ad.43.1784893602484;
        Fri, 24 Jul 2026 04:46:42 -0700 (PDT)
X-Received: by 2002:a17:903:1246:b0:2ca:4cfd:a6df with SMTP id d9443c01a7336-2cfa6f821aamr82763465ad.43.1784893601895;
        Fri, 24 Jul 2026 04:46:41 -0700 (PDT)
Received: from [10.217.218.21] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd828asm50332545ad.19.2026.07.24.04.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 04:46:41 -0700 (PDT)
Message-ID: <603b01b5-382c-4da9-93e0-9571721806ae@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:16:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] i2c: core: Add i2c_update_timeout() helper for
 dynamic transfer timeouts
To: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
 <20260720-master-v6-1-671261b05c61@oss.qualcomm.com>
 <65d7144c-855a-4b3b-93e1-c18c12f199ac@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <65d7144c-855a-4b3b-93e1-c18c12f199ac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEwNyBTYWx0ZWRfXwhylzAfI5ZZY
 NIUGVaAjldeijJ3RqeXEBHWah6paC99i6VClKcdZd01yaIJXEjQ7gq/Cbhrw/OWYBSF9l0k6Vz3
 iyGWtCr2D6EyEXNCQpuKLo7wywRnrCs=
X-Proofpoint-ORIG-GUID: yxpP-A8znDLzF-5MXWe29Wf9ClXy7VGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEwNyBTYWx0ZWRfX6kb5YN5zstAY
 Ue+FVl+ubpCW4PuI+0BHdBi9TnKW/lMXhtwk77Id4VNSfh9ktx01luA44EscLE5I1akefpoQX4u
 a0fvdIUhwsNCvmvc5FdfY7462y0HgF5USIsfeqghokAZgCwjr8ku/67x3zxgj63rvx1nJIVlzYT
 VbxZnYE4P8+zsV+Ngagc90355gx1T8qLgZT07udImktMVQuxpdNL6pjbqpl9ze3bJYeWC2xq6Nh
 CsGP3NfuQ/IgtYoK5dlDKIG6rxx6GLhOv9908DwArLHTBBF5F/zV/4O1b0EpdM7kFKgNBgg+mRG
 8lIKPPdt8C1ig48Z/Ls1exFfHkNa6J1dgtCiZQbZ2jxX/HuXe8fEzyue3XxGvFQ5ZsvvhrMiHea
 UUwdewc9+wc6Pqc1ePZyY1X3hoUt362lBzu/TzVkkLmwVgRyjAVZ9eDS7Wv/N74LWx45oNNDV+7
 YDqiSTlbm35Fp5h7dew==
X-Authority-Analysis: v=2.4 cv=PtejqQM3 c=1 sm=1 tr=0 ts=6a6350a3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=0liSH36yjE6c7cn47D0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: yxpP-A8znDLzF-5MXWe29Wf9ClXy7VGy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240107



On 7/22/2026 10:55 AM, Mukesh Savaliya wrote:
> 
> 
> On 7/20/2026 5:11 PM, Aniket Randive wrote:
>> The transfer timeout for an I2C controller should reflect the actual
>> message length and bus frequency rather than a static 1-second value.
>> A static timeout causes unnecessary delays on error paths for short
>> messages, and may be insufficient for very long transfers.
>>
> in short write as should be relative to the bus speed and data length 
> instead of any hard coded values.

OK. will update the commit message.
Thanks,
Aniket

>> Add i2c_update_timeout() to i2c-core which computes a transfer-specific
>> timeout and stores it directly in the standard adap->timeout field.  The
>> formula accounts for 9 bits per byte (8 data + 1 ACK) at the configured
>> bus frequency.  The caller supplies a safety multiplier and a minimum
>> floor so that each driver retains full control over its timing policy
>> without those values becoming public API.
>>
>> Storing the result in adap->timeout makes it visible to all consumers of
>> that field, including the arbitration-loss retry loop in 
>> __i2c_transfer().
>>
>> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
>> ---
>>   drivers/i2c/i2c-core-base.c | 24 ++++++++++++++++++++++++
>>   include/linux/i2c.h         |  3 +++
>>   2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index 3ec04787a737..3280652e20d8 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/irq.h>
>>   #include <linux/jump_label.h>
>>   #include <linux/kernel.h>
>> +#include <linux/math64.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/of_device.h>
>> @@ -2000,6 +2001,29 @@ void i2c_parse_fw_timings(struct device *dev, 
>> struct i2c_timings *t, bool use_de
>>   }
>>   EXPORT_SYMBOL_GPL(i2c_parse_fw_timings);
> can i2c-core-base.c calculate within and store into adap->timeout ? 
> Current adap->timeout = HZ can be removed if we add coefficient and 
> safety factor default ?
> 
> Any other thoughts ?
> 

I think keeping the timeout calculation in the core layer is reasonable, 
but the core may not have enough information to derive a universally 
correct timeout value. Different controllers and platforms can operate 
at different bus frequencies and may require different timeout margins 
depending on hardware characteristics, clocking, latency. Because of 
this, a single default coefficient or safety factor in the core could be 
too aggressive for some platforms and unnecessarily large for others.

My preference would be for the core to perform the timeout calculation 
while allowing bus drivers to provide the required parameters (e.g. 
floor timeout and safety coefficient). This keeps the calculation 
centralized while still giving individual controllers the flexibility to 
tune the timeout based on their hardware requirements.
Using a fixed default coefficient/safety factor in the core and removing 
the existing adap->timeout = HZ fallback may risk regressions on 
platforms that require a larger timeout margin.

Thanks,
Aniket

>> +/**
>> + * i2c_update_timeout - compute and set a dynamic transfer timeout on 
>> an adapter
>> + * @adap: the i2c_adapter whose timeout field will be updated
>> + * @bus_freq_hz: I2C bus clock frequency in Hz
>> + * @len: transfer length in bytes
>> + * @safety_coeff: multiplier applied over the theoretical wire time
>> + * @min_usec: minimum timeout floor in microseconds
>> + *
>> + * Computes a transfer-specific timeout from the message length and bus
>> + * frequency, applies a safety multiplier and a minimum floor, then 
>> stores
>> + * the result in adap->timeout (in jiffies).  The caller supplies the 
>> policy
>> + * constants so they remain internal to the driver.
>> + */
>> +void i2c_update_timeout(struct i2c_adapter *adap, u32 bus_freq_hz,
>> +            size_t len, unsigned int safety_coeff,
>> +            unsigned int min_usec)
>> +{
>> +    u64 bit_usec = mul_u64_u32_div(len * 9, USEC_PER_SEC, bus_freq_hz);
>> +
>> +    adap->timeout = usecs_to_jiffies(bit_usec * safety_coeff + 
>> min_usec);
>> +}
>> +EXPORT_SYMBOL_GPL(i2c_update_timeout);
> why is this exported ? you have alrady added in i2c.h ?

Adding in i2c.h file only provides the prototype required for 
compilation. Since the implementation present in i2c-core-base.c and is 
called from i2c Geni driver, the symbol must also be exported when the 
core and driver are built as separate modules. Otherwise modpost reports 
an undefined symbol for i2c_update_timeout(). Therefore the header 
declaration and EXPORT_SYMBOL_GPL() serve different purposes and both 
are required.

Thanks,
Aniket

>> +
>>   /* 
>> ------------------------------------------------------------------------- */
>>   int i2c_for_each_dev(void *data, int (*fn)(struct device *dev, void 
>> *data))
>> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
>> index 14ab4d3055af..b52974eb7e58 100644
>> --- a/include/linux/i2c.h
>> +++ b/include/linux/i2c.h
>> @@ -912,6 +912,9 @@ void i2c_put_adapter(struct i2c_adapter *adap);
>>   unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
>>   void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, 
>> bool use_defaults);
>> +void i2c_update_timeout(struct i2c_adapter *adap, u32 bus_freq_hz,
>> +            size_t len, unsigned int safety_coeff,
>> +            unsigned int min_usec);
>>   /* Return the functionality mask */
>>   static inline u32 i2c_get_functionality(struct i2c_adapter *adap)
>>
> 

