Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2D3C1D5F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787640484; cv=none; b=bp8QnWWVyvSX7Sjtwb7jo1p76Csjvw2qAuBbDe8BGRbTYsqBHjjcQHOT2peGOfZ6Q6ZKMZ2IYdACMV8Nk+FjkmQjqntRQsRfg+QkjBMusCK/VwMvCU2o8wLej7u9xDvhScXp2WVYR0c8qgptwnotGUXOtRNMxrWcUGVlF9S/K5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787640484; c=relaxed/simple;
	bh=hkb2WHo//3QhjElHnyumgv8qbDsUD5R8ikSsd2W0kbA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTXRGf2SpWmgY6lfp0w0nwlJPSEo8PHpRj9sU2brhoSPW15hkCMqCdOeE1GrGJmBEcpOl3jjgK2IQRBI4bPb35rZEA4ArfO81RiTOEUnCgkVkIeUHZJ7r4+4XIJRuRvK/zyU0zQa4L6u+XLbShZefkUSURjxhh7Gt64RxguZdJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IiSyRJuT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AG1j6jTx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiSyRJuT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AG1j6jTx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2RGHA120828
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gyh9XcgHUZTAH+0naOsJaq5PNQKLw6A9D5m3uUaqHmo=; b=IiSyRJuTk7oCrm/1
	DZn3eKlQs5kB0XQVMPKFMCj16/YQ8lPXAyaop6Xqtdht4kLBo42CBGPjprsZCO3S
	4RuHfvSDDA8sDTNCoqAppM+6zLDbl1JAK93p6hnVw9sdf8pr4pwRFpCbothlsv1T
	gt/WHGDZfjAOLt7ad0rx60bZsCFZAm0xaP/KphAiEGaQL0tU+Cre6Wek/yxmpGSP
	F/9fCLtz75mTsZcT2N1MW/CwTztgpx09Osl4HenZZymCfpoeoBV7u+iCkJwk5umR
	rzK2hLcPZ2kwGYfRu98caA9e+fFcREe9fpsvWDpaN1GFSPoK2xO67M62fXvlS3Or
	kESoXQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3dthkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:48:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d6df0a1e1eso7208725ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 23:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787640480; x=1788245280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gyh9XcgHUZTAH+0naOsJaq5PNQKLw6A9D5m3uUaqHmo=;
        b=AG1j6jTxfuZy1I8BwVTBgHbttuqT5df6wMiWiNUGycfVVNFQS5xvupXXuHCo+dS9TV
         kcCqPJoMS0rsNwhi3Ah7UfwT4ETDFYjLTB7YLq9JaaV72trnCEPGwzSIDpTNE5vipvwX
         RdIlhS80pRUJVZM4gdfTKPbAIXbDMuwDD6SDL0IDlaSI48e6wh3pqJDj6rof9BlkAV+f
         MlwOenryxbGaztOLa2zh8/cwt543gYsY9iNXJrIsM8dUTYZCys4nTIqOuBmLjD3uRgr9
         MYGhrlohcxB36b9Il6nKjxGoAHeNXStXosvZ2m4R5ziDiRWFV67QwX3c+JjVo3j6nTBQ
         vFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787640480; x=1788245280;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gyh9XcgHUZTAH+0naOsJaq5PNQKLw6A9D5m3uUaqHmo=;
        b=PdzhEAcD4mja3+bfVqgxIWmKWZl5v+YJWJRSYBne1aJn7gEVQEsYJaaoWZed6Wpk2p
         kwm8G0RaAEsxA3lDV1zhbs68KKgMUGWy7KeUF2WYnuiopB4ZAJl0mlGtWRcCBiASnL4F
         kEaYKQn1v5ZK3PtAd2tOo3sNbIkzae5kUqTpNtNNu+cGUp4i8h+TsHr5LojfdbTja6Xp
         HBwPct5KzHmvY0M2AQGz8hyPxUUgsiYfokYE54jRdFzCMl0MmcpJoK0+3NoEKHuks0LC
         53wTf+i/uoQfCbYSDs4DdzrFkaZTrrTzP7f311Vjr0n5BHjrWEKJcmIBOdYi1Ma2XNbW
         Zsbw==
X-Gm-Message-State: AFuF++mSVh9+YF5tItJ43t+97I/DMN/JI0MO06m0yeF0hqCc9JRHqt5k
	rW9T+E1MPmlIrQtTswUYlVkYqLqCDIbtKJuQ3P+WvEAQrgg8Q9bcFDd860QtCNIfWnyUUV5k6D7
	WRbcxf2Dv1I1lI7uYwK2WkaSE0zG4rzHwvKs2pbGk89qbZXrutzsoAI/ikQ51WCkfvEhq
X-Gm-Gg: AR+sD13KjgD6uRS4Yg7aIQSQvzKVGWswCvzTtbmddCO8dAWCA/QAdmoMD41hadGrbtV
	nnj0u8PoAn6HnvoQxbrTAOjSPXwTmOQ3h+1cT3oCxUKEVrWIqOorO3V0/pUm5i+v5w4vDNZ06a3
	ofEzEUpFit9x1uqjmzK7qO8d5LNxnlOfpRtz/KUfxl6YhCh6XJzzAeKSVyZ+O2UOpelKz/f8lu2
	ilKEuDty9JZwfWqfkI2QhM185xnPPc15vCn6nV3eYojJFzGxag+VxCF82M2LQcg+a07BRr/A0CV
	8xoasEc+QOa9FM5U9AHr6UFKGu4fqhExQ4QJ85DmaJZ4qJsXvrbE6N2cucMlgCBsEI/R8tn1zoI
	tLaQyCSmwilkwDWgsiywm6uLyLnytQQ==
X-Received: by 2002:a17:903:3904:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d670d299bdmr452010215ad.14.1787640480369;
        Mon, 24 Aug 2026 23:48:00 -0700 (PDT)
X-Received: by 2002:a17:903:3904:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2d670d299bdmr452009385ad.14.1787640479831;
        Mon, 24 Aug 2026 23:47:59 -0700 (PDT)
Received: from [10.219.56.151] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d676761bdesm25061285ad.1.2026.08.24.23.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 23:47:59 -0700 (PDT)
Message-ID: <dcf8d925-cf9e-47d8-ad79-0b5e641529ee@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:17:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fastrpc: Reduce log level for DSP info and reserved
 memory messages
To: Jianping Li <jianping.li@oss.qualcomm.com>, srini@kernel.org,
        amahesh@qti.qualcomm.com, arnd@arndb.de, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260514062825.50172-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: f7wFWomOQup_2abuRE2vESe0B2aNCCHN
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d3aa1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=7I6ySQAFBpFkhykqCKYA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: f7wFWomOQup_2abuRE2vESe0B2aNCCHN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1NiBTYWx0ZWRfXzAXixXi9ThTB
 /molxuG75Ay0/yLh0exnmDnIPi98WYONvSLjzmWl7p8hJJiY2oTBWT3KZvRmoqzzbugTC1sdzFk
 MQgkZsW763lz0oDiyLX4Q8Gfe+vAoMI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1NiBTYWx0ZWRfX+hm4vAEHFLKj
 kou0xeT8sFtuGi+OwkR/g3QZE1cHEwYOr6+8m1mF/0xaHx9/huAdw/7CPMUuNvtd9LFnMA/l+oP
 t1kbaihYUbB1885BhSvlpBI7BaGCXmD5dt4bFaLYm3Fy7Hxvf9sbOx+P+8FRUc/gurITFDR+sYq
 BoIjhi0gd60RpFTiKcoe+Du5/Imfp0jfCHsg3Rh31XHnvsITpFTafwrNwopR343skYHPPTjxsxT
 wkgWgtmBinP12jMBv3xMdNsyHuNag3gPzjgffKRkDDbi6D4dBQftqVhtpxwRUGTSJDkP7FuNbe4
 A1f+AgKiVozPvOPdaI0Terdl/n8WC0Y0/uvoLBbSHDwu5SYmwQDydPIdpHz7h3Pb21R+xQQc7Uy
 WJtUDMMxmLIiY4ojmj5a5R1ZJhxhNzW7O9SUAJUO6I+rD1wIlTvHsTtasRMqLgKLxb+yvHPQnjn
 2ygDnBxnJuzsCW/5GNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250056

On 14-05-2026 11:58, Jianping Li wrote:
> On some platforms (e.g. QCS615 Talos), fastrpc may temporarily fail
> to retrieve DSP attributes during boot, resulting in repeated
> "Error: dsp information is incorrect" messages printed on the
> console.
> 
> These messages are observed continuously during boot when metadata
> flashing is enabled as part of RC releases, causing unnecessary
> log noise.
> 
> Similarly, the absence of reserved DMA memory is a valid
> configuration and does not represent an error condition.
> 
> Since these scenarios are expected and do not indicate a failure,
> downgrade the log level from dev_err/dev_info to dev_dbg to avoid
> flooding the console.
> 
> No functional change intended.
misc: fastrpc: >
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1080f9acf70a..05ec14c07fd0 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1802,7 +1802,7 @@ static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
>  		kfree(dsp_attributes);
>  		return -EOPNOTSUPP;
>  	} else if (err) {
> -		dev_err(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
> +		dev_dbg(&cctx->rpdev->dev, "Error: dsp information is incorrect err: %d\n", err);
>  		kfree(dsp_attributes);
>  		return err;
>  	}
> @@ -2361,7 +2361,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	}
>  
>  	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> -		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
> +		dev_dbg(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,
>  				"qcom,vmids", &vmids[0], 0, FASTRPC_MAX_VMIDS);
Can you also move this log[1] to debug level/rate-limit? This can cause
dmesg flooding in case all the session are already getting used by
processes. Some discussion around the same happened here[2].

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1786
[2] https://github.com/qualcomm/fastrpc/issues/383

