Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0D83B8D75
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787733716; cv=none; b=o5HtQSTBSoC/t3huOyYmL+dNa0eU2k9VzJgmO5X1Ri6SlJLJ597RFkEJlKOhsrCMY4NZRkJsH7SYRQnVcQ8y8wkA/z4TYfh+wCrxSoNQ3Cv67sN/5OvrFwiNMQIlyWtv195e882YS8DPQT9v4IToLlkHc6yTHUzQDV/LGfGJ6xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787733716; c=relaxed/simple;
	bh=aekxbZZ+QrjBnhUUlWKUamuvO/zqUue2BpcbARHo47g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=IswcJlxgWEM+npageNCT0jbIcjPuIPVY1zKFQYicAYdZxRZ9cnlHy3DoIhborOZ70oZH0ihRJY2r+cCYr9fwZC+LtoHr/jtQJCmdW7Tc1mbLLsMM097I5rsXeeSkBE+000g2QzPfBhMkqNAtA7RCjb2N5hWW1kZHK4LKcutJ6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS5xN8Cg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XeWS9Pf7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS5xN8Cg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XeWS9Pf7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S7ig4097209
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	toc2DNcq80nDKIdm/5fVrSwC6pi5hJO7nJ40m2OU9a0=; b=TS5xN8Cgz5VazS8I
	UqGUSrJLw4Q4NkwLLPJvu954fBWjkLuh4cxC276u8VfxIjAMK1cvD6fInU5I6UB3
	tH6sxLa8wPdNKtduMwpeoRwRjmFCLng1OeBgtrx18VTkJ8GgDzglJ1/vWiJyJ3t/
	RjtAgJ2iMgbUcTYz7EE4K2td7Wu0ov50AhCcWOsygLW8XHZJ4S2nC2EDLQk+nAN5
	6gzlb376vALkqRX7qEg1+sVyV9xU1y5b8eDhxVWLtQfrhHClCeNvYuOba1B7VsH3
	Vunr7FrHZZc9mUdPlmEdkNlAxyGvOfIEaK9JuAY8t+ageikntEUTmRKlHLjAo8AU
	bxbIqQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceu0dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 08:41:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca8aee88725so754516a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 01:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787733713; x=1788338513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=toc2DNcq80nDKIdm/5fVrSwC6pi5hJO7nJ40m2OU9a0=;
        b=XeWS9Pf7qljPzIsQ5C5mBR4r6XwWvEQJz+IataZtz/fhfCYR9ZJ0Z2N1KzWwN4QIne
         rW1Mnmuwtw6tY46RPr/6svTg996UWWHSVpLVNXNIzNAGISzsC+30mFJC5Ea9oaKZXvdR
         rTp7gEDhTwVTCOV7yEcfrOpQ6ws3YZ0XbR/51nhXfmhSSNXL1jmGrOyp0XyrNnr7rv3o
         esFCyjBLKz2D+OWOLzJEAPNEg+m9VwcQ0Xdgj9Oa/r/RAZWOCwTtpXN6eVRWv7rx0o1L
         sUlsZWXns9krHYQSVVX4Vebg9Lxs//Tr/F2pYT6eyNNpIsKA8ty07yL4BvDP+FF0shbv
         AGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787733713; x=1788338513;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toc2DNcq80nDKIdm/5fVrSwC6pi5hJO7nJ40m2OU9a0=;
        b=Q0Y1JG1LZK0JJTXgAiu/w0uaYDFP130Ixz2WVu7QgL2XF5O0+YMFT/bmKGRWu7hSCt
         SEAtG6srWJVr0PzI/Z9xQh0s+mCpu96g12E9NJ3YAGnLfQui7W80wHsPhemrbATBVkXZ
         S19fo3tZqmBD0mT2z6cyw1cIFXpKalOmqMO/FlaJr7ngKIYyzptZ6bfbCjD9yYiTAJrT
         WGLVMd85SIiKHXRQH7bCNOnp4IYQdRcVPltOJ4k2pQ18+jsPco2RZU4oJQu16lR3HXtE
         DjS75MvNY+D2wxTVOjy3aZXVWFtti0uBQcjYNNvpoIHb/lkoYPRbrHuV+WpSATnCzLLS
         GCgw==
X-Gm-Message-State: AFuF++l033UfLwuGFJ3XEDgVtPMdVTfZQw81UeggHeCYcDRUj3ywLUdA
	tt6F4fBJaZLF3rIDv4PcIXeP4S8q5YJBxP4V+9msgqOhm61GGtvejdsGz+PztjBraerLxcEhIBH
	PLp+3dhpR638Gg5o85TWWJf5JwxLqWt7ayW7lW5SP91oHn9PWLTLJevFdsi4cuohnQOXcCILrWS
	yOwow=
X-Gm-Gg: AR+sD13yOcqbX8p5cEZtBC/ckvKAyI6BXKQbpfJhtRWyxSrk6euNMjpudfxf58ahJrE
	9PhOYyXTlFVTPGSaNptZ8Fe57WKE9DItRsrieGgYljCpxTrFTtrjURhp10ryFJcQxZCntBGVJDX
	vwfu5dTOO6YRKWK2CECKNs3eILk7p7MkhzQGvpRjC9feoKxJu/ry2OfLCH2MuNm1hsGKDlljTsL
	0IKyegaQi0InjYQuwTwNYrU873GC1OJppHI+zeZ7gio6Kk+dAx0qgS0DhpkxOxuXxIFt7E2txVS
	zcDOGu5z0haSNbTeEvReHEvwv+Pc/AgiUk9PFawTjsfcOwle/9D3hk1t/vBfJfhTI6ZkziyVi4E
	legTbbfWSzju9y6u3y7Eu8xHExGXNmtLnwnXHTe8y1dhStBmXPVLd3CA/NehMr59wloI1s2Y=
X-Received: by 2002:a05:6a00:178c:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-85371cb5696mr8913339b3a.1.1787733712892;
        Wed, 26 Aug 2026 01:41:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:178c:b0:848:6c9c:4074 with SMTP id d2e1a72fcca58-85371cb5696mr8913268b3a.1.1787733712430;
        Wed, 26 Aug 2026 01:41:52 -0700 (PDT)
Received: from [10.249.29.124] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535afb2caesm642714b3a.26.2026.08.26.01.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 01:41:52 -0700 (PDT)
Message-ID: <f78bf297-e676-48f9-b2e8-565a8758ac6e@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 16:41:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fastrpc: Reduce log level for DSP info and reserved
 memory messages
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, amahesh@qti.qualcomm.com,
        arnd@arndb.de, Greg KH <gregkh@linuxfoundation.org>
References: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
 <dcf8d925-cf9e-47d8-ad79-0b5e641529ee@oss.qualcomm.com>
Content-Language: en-US
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
From: Jianping Li <jianping.li@oss.qualcomm.com>
In-Reply-To: <dcf8d925-cf9e-47d8-ad79-0b5e641529ee@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ea6d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=4MCOB7C_Cw_4N5Uyge0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA3MSBTYWx0ZWRfX5mC5UoHtHZvf
 Gj84lqTEdG4g4UVeO6Bl2zkgNQY7HV+sWpDgGmcARUfej8xChXSMAfesqCz7ObkxqOOPZoOuNDi
 nNOrepo0qPVmxyY3f8o/z1bmDMcmr6w=
X-Proofpoint-ORIG-GUID: 2PWXaWbyQgtllvAgBU_SkFjC7z4s4tpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA3MSBTYWx0ZWRfXzjuxxdnqA2BE
 m65vD+saU0s+IDx7/9GdU5UfBDaUpHG7tWqI0tqgAC++ggTtbi1DgzYvWoSPHwDBbUqdiqET7T2
 p+HCO/HqvFJu55qqd/rMa0uKJgfJcV+7fsakZ0sEs0bT3UjVugDM7psjAQl0LHGXxkNDyUcGBF9
 Aw4p8CUD0x94yq18NE4aBXBnZFzmkh+OLIhVTgBTGSC1LCzoizQL/lYnPnD43M0mJiDVDAR54hT
 JcMTz4fRE+iBvHDM4ZBjIdptOl6ddAM79+Fnb2uFS/pqHHWmC46J8QRxG4FMAEVTJj8faNpVPB1
 RAeA32FpYY2VugkRiK6EYSzkMuiYZaPbaRNJhj0KIo277Z5cSQz35/I+4rTRMWQvHxa3dFecXBl
 mHoXF9svmXHwzPWPX70Y5hwO2QoxVT+9fhzM3YQpJgA5eTlXB0P1MhNvsprxpLX0Jvbmjscd15t
 PmeZhFbb1YDIduhNVRw==
X-Proofpoint-GUID: 2PWXaWbyQgtllvAgBU_SkFjC7z4s4tpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260071


On 8/25/2026 2:47 PM, Ekansh Gupta wrote:
> On 14-05-2026 11:58, Jianping Li wrote:
>> On some platforms (e.g. QCS615 Talos), fastrpc may temporarily fail
>> to retrieve DSP attributes during boot, resulting in repeated
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
> misc: fastrpc: >

ACK.

>> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
>> ---
>>   drivers/misc/fastrpc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
>> index 1080f9acf70a..05ec14c07fd0 100644
>> --- a/drivers/misc/fastrpc.c
>> +++ b/drivers/misc/fastrpc.c
>> @@ -1802,7 +1802,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>>   		kfree(dsp_attributes);
>>   		return -EOPNOTSUPP;
>>   	} else if (err) {
>> -		dev_err(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
>> +		dev_dbg(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
>>   		kfree(dsp_attributes);
>>   		return err;
>>   	}
>> @@ -2361,7 +2361,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>>   	}
>>   
>>   	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
>> -		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>> +		dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
>>   
>>   	vmcount = of_property_read_variable_u32_array(rdev->of_node,
>>   				"qcom,vmids", &vmids[0], 0, FASTRPC_MAX_VMIDS);
> Can you also move this log[1] to debug level/rate-limit? This can cause
> dmesg flooding in case all the session are already getting used by
> processes. Some discussion around the same happened here[2].
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1786
> [2] https://github.com/qualcomm/fastrpc/issues/383

Thanks for the pointer.

Agreed, that log can flood dmesg when the session pool is exhausted.
However, unlike the two messages in this patch, "No session available"
reflects a real failure — fastrpc_device_open() returns -EBUSY to
userspace on that path. Lowering it all the way to dev_dbg would hide a
genuine session-exhaustion condition from the default log, making such
issues harder to diagnose in the field.

So I'd prefer dev_err_ratelimited() here: it caps the flooding while
still surfacing the error. I'll fold this into the same series in v2.

Thanks,
Jianping

>
