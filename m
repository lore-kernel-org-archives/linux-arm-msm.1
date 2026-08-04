Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D2741A4FC
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 06:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825676; cv=none; b=qRFPNEFv44a05RNfi+LcA+Z6UMPhYi5lCILy7Rsp60wgL9ci0dE0tqUVJ6xKzjEl3e+M3gP38oeYdcFAgwK5eBa+kei8cNRJfv1sM23qZy68p1mqgS1x5kcQjC5nSMpyLh7iEKxzAFJrTJo6hm1doFiIDcDuho7ND7Ri85HRvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825676; c=relaxed/simple;
	bh=hQojWnEFSWMtRveovhfcvA+/uowmFsGV+AvKsjUi3ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=dtukvl0J1/E5iZPpyB0x+MyEY7nYr3Hh1ozGrXlKSw0YMtw3alPWGXgNIZ2UG7uKx3P1r7qZxQHhw38I/EnEQoOm6ZtAcwHjPdz4dG4vp7jWV0nWyUKvyzZB0NbV4XqHrGA70Ge8rWQuW07ICYVwUH/TlnXW5XLL5kAPPir2NKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbTnORsC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cc2Y0TBW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbTnORsC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cc2Y0TBW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67417jDO2574498
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 06:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H39lZchhwgB2ZWI/XVAzanrpPj07o0jZUVBWG+r19OE=; b=BbTnORsCORVs0RdE
	qwOBWAuR649hCYk5p3cTncjrKrWIxp+OUO7wqGRrNzfxfhJChk/L6Fg3fmFptKMV
	1MZeseQ4QC0ka0Iyz18cOsjHoXU2wQk0bpY6Gv374g0EtiWtRaD0rgrqvWiYfLpy
	PQw6OKJqhoSaxyc1DuqNe1ueXwKMdXKtXgjG4pQ3VJnYv21JgAhucr6x2MBiS8Yv
	M0z5PlOZAlbspYFVL3Xia3HvcP2kjGYdENepUhDNxWM3QCBYUZjifTbPaGSKg/g+
	irSKFrGgDRnis/7WfmH+r/cFaIPUVksaC+NPioUKlR+gFDbLFnKKqeJX7//HC31b
	NeHUdQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fty3sjwps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 06:41:12 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cec4226c70so78587055ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 23:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785825672; x=1786430472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H39lZchhwgB2ZWI/XVAzanrpPj07o0jZUVBWG+r19OE=;
        b=cc2Y0TBWYIgUgMj6ue0k18If3X8xKdIesRLMkyc6rAydCz89ZAiyNYVYtSGSZnjwu5
         HcXsHGC/0s4ZfJ3CjJjZrgSUOYq95sT7EtHQtqXZU3WYpFxidfBGFZE/lP39YSatyUnf
         KO7uIlW4ofuKHYInKuPL7WLPEwaMAqTqDqFOeqs90IYELHsF2gRTdjr+zEpXQS9FDkW+
         wpz8qNkBRfNj+DeIkG3xvx6fuOGU1j3Mw6Z7WFjRxDOqUENyashXRrxXxY1PK+WaWUfR
         wedon+DRvgPOYkxC0q/fgDKiCEbaHlBy0VbJlTN0+ApNtekasGLJDKa/0qoxpGLD67BL
         KwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785825672; x=1786430472;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H39lZchhwgB2ZWI/XVAzanrpPj07o0jZUVBWG+r19OE=;
        b=J5MDdpzrN5ZLn0O3MH40/KXJnbC4aiO1x1TJkP6Ds8J9IvXnpRDkHPTZrBQqS8UGNF
         V7+P4V4B6iu45KbMubXUO42TGiHA5e56Q6cAtVQ3s8eBV3bVeCk/zLLaA2KUq98XmY6b
         vO9fRC28+KfPccoDEN9bkoVopssOSTsbaRfDkNMOv+JHrMRsJ5HWjWv/DXD3zsv1zk+X
         u4mnfjpvyI2IqkJGLgPni0K5p/hd6EgQIjciGTYJQtom9ra9EMRMl8Da4v8sgDIqzJ80
         xqUtYlanM9BFDIVkE6nkADC7d58FlSC3OW9bIjO+enN5eO6Fpbj1s+EYk+OCf3sSDfoP
         FM8g==
X-Forwarded-Encrypted: i=1; AHgh+Rrl9yz7ydP4qkLM4Wm/u33HZbYQfiZzkhYuaQKPSCPWJi3JOqgVHvEQ6ZoP2xWyanxYd7l+27cAZCQWDlPq@vger.kernel.org
X-Gm-Message-State: AOJu0YwPxCiFYUPd4HbvyYFwq97D1bvc8qIQkDinkAlHYTREDaSN2HMl
	p2mhyzlPWUDbs+tfIowGUflMx5unRj0tcj+mfK3LUQ9MRrJrkCnwl9BxtxaFcAv46s2F/cH1Iya
	RDM8Q69O4ofpCx+6tO8j6LPzkjI5fspQJmSwhyhv0oTaCe+g7H1L75HDnq/zW3Jp3DrvfwcBez8
	CY
X-Gm-Gg: AR+sD12dpNiuwsOF5NYYrVeb3Z5o6OEk4JhnqWGsxZZvJQcmK7WjqNtrdq5Bo4X1K/j
	CNxoK060YODu0xZC8S3TVK/ru9SgP81/9szuxgvlWc6s7o5rB0wgtg9nfkAFUDgr0xJICdgV+br
	9M7CZLhWQGwK2tDAy/8veLq0wNdOKbfSNFYfhnBCu3kq6I7lTRWkyONlgton7DOb73KD6XaA5vd
	XSdUUSRLoZbA5Fa7ixAvUjzeM052lVsx/EvPe+Aes00IDJLuKTPHwxRlyG7nLxRI7KLXyO5Dgye
	f1IRi4SJzNx4iZrc39gToOU0lXGFXBIHiJNUaGhfP2ZsJz9wBgWZ/q7tRaJTfh03rsk6YNlri3y
	WmgVJx+lpkRIvHar2DpvL0Oemrccni8kktGF9AP/78qAU3bVdP3oh2m5Rg3arAbsrLmAYAw==
X-Received: by 2002:a17:902:f70c:b0:2cf:dcd4:c646 with SMTP id d9443c01a7336-2d052462f7fmr125110575ad.33.1785825671565;
        Mon, 03 Aug 2026 23:41:11 -0700 (PDT)
X-Received: by 2002:a17:902:f70c:b0:2cf:dcd4:c646 with SMTP id d9443c01a7336-2d052462f7fmr125110275ad.33.1785825671075;
        Mon, 03 Aug 2026 23:41:11 -0700 (PDT)
Received: from [10.249.10.23] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa49325bsm685055ad.40.2026.08.03.23.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 23:41:10 -0700 (PDT)
Message-ID: <68a09a71-9b34-4219-a5aa-eba3467a2ae1@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 14:41:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fastrpc: Reduce log level for DSP info and reserved
 memory messages
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
 <cg526ebtmnboqpw5aabwrtmoc7fhnvc57dmjax5zltcjonnazv@pynuwgpx3bi5>
Content-Language: en-US
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        Greg KH <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
From: Jianping <jianping.li@oss.qualcomm.com>
In-Reply-To: <cg526ebtmnboqpw5aabwrtmoc7fhnvc57dmjax5zltcjonnazv@pynuwgpx3bi5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA1MSBTYWx0ZWRfX4KTCxRpmgveu
 efhJsFU/G/rHtIiULv9ZiJ2YQcnb7ND+rL2fSThR+NKiimPOyApxmEpmLHAsQFUbq5ipMRJu78j
 LK4Tm+rVZ+b0CipcelxHToTc85ikPA4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA1MSBTYWx0ZWRfX6HYxSuWckIp0
 ijB53AyPWfM49lhGyNkUh2SYe7SVNhrMkChjLx4AbEENHnvA6XU4M+XMcbHrGCcGaLMgsotjDYD
 rs6dYv7LKsyK3bA5C4sRLgVaaLtHUwzdrhEnTUwYYdmQbxZElMP8Y20gZRmnclKcThr5+gdcLXM
 ALvrmy77XNGYfUx0LDE1BJDg7mP+YB/ceIG5Xoc5mKbyaflLvtOpCGKAcG9q93ytVeEIIC4PKL9
 LHW5NrX18AAl1IbgvJa2hGXl0g83QODks5TA+6pdtt76eGiRGZxy5RMTtOa1vq60TgjZuseSb5g
 TQOOvETv707VeJiyb5pB13JxOQE27Z6DN0ByV3PE4B4Y8tEyN9R81Sa79KxRF322i75nrK7vRfm
 nWbhmhQKiLyOzSuUv+ox5qq0eFHmAh3BUCIG09UqE7Y/PRjAw80IHPjfSsglVMz5mMK4fqRIw/T
 QNNBcHWzjkmwid5lHeg==
X-Authority-Analysis: v=2.4 cv=Nu3htcdJ c=1 sm=1 tr=0 ts=6a718988 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ek8-BH9n-rQyWAOU1C4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 3tmlUBM_hXwO-SZQ-bftY3tURet7Lnel
X-Proofpoint-GUID: 3tmlUBM_hXwO-SZQ-bftY3tURet7Lnel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_01,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040051



在 2026/5/18 7:08, Dmitry Baryshkov 写道:
> On Thu, May 14, 2026 at 02:28:25PM +0800, Jianping Li wrote:
>> On some platforms (e.g. QCS615 Talos), fastrpc may temporarily fail
>> to retrieve DSP attributes during boot, resulting in repeated
> 
> temporarily? What does it mean? Should there be any sync with the DSP,
> letting the FastRPC driver know when it's safe to retrieve the
> information?
Hi Dmitry,

Thanks for the review.

You are right, "temporarily during boot" is not an accurate description.

After further investigation, the message is not tied specifically to 
boot timing.
I can reproduce it at any time by manually starting adsprpcd on QCS615 
Talos:

     # adsprpcd

which results in repeated:

     Error: dsp information is incorrect err: -1

The failure originates from the DSP capability query path, where the DSP 
side returns an error while handling the request.
This feature is not currently available on Talos adsp.

Therefore my intention is not to hide a boot synchronization problem, 
but to reduce console noise for a condition that appears to be 
platform-specific and non-fatal.

I'll update the commit message to describe the issue more accurately in 
the next version.

Thanks,
Jianping
> 
>> "Error: dsp information is incorrect" messages printed on the
>> console.
>>
>> These messages are observed continuously during boot when metadata
>> flashing is enabled as part of RC releases, causing unnecessary
>> log noise.
>>
>> Similarly, the absence of reserved DMA memory is a valid
>> configuration and does not represent an error condition.
>>
>> Since these scenarios are expected and do not indicate a failure,
>> downgrade the log level from dev_err/dev_info to dev_dbg to avoid
>> flooding the console.
>>
>> No functional change intended.
>>
>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>

