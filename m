Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F23357D0F
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 16:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790957727; cv=none; b=noynyql2t8MArp9e7B67aA7DphkR6t8mWx8AC/dFEWoD6DulOfYDehexb/NrTqlPJ+4p09sLjf7Al6i4tkgdKjo+Nj3/ljFfFXvcdFEYERqaxUc6xyYKvkxYNtMvU07b+8GwF0wjIA//Y2dp5+PBZvRfZmsyy558BJGvoFIQhYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790957727; c=relaxed/simple;
	bh=stLCkYxJ6QOmDpgV06/UDcu3jC7cDAcM43Ynr6QCEtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D9t6QdBGV+WEUL62Bkl7eT5yrYd8fNdVwJIr5eY4BoiyFVcD2ldRYQ9BnOkGJ8VBsqmvYSjfBhuPgB6UIhUCRgmF1Y//0K14CQQqtFP0SwzGNJpyyZZX5vs0UZN5gFWGPkIPoW6baGGbtTNr+EEx9ZNCGUkUMMer5+DAQpke/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B865agWi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IMEyvYvD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B865agWi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IMEyvYvD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGmhm1042969
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 16:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4taZxg5NwikgZ8WugpDCZYo+IsY0Yfdh2Zj5teOGtTI=; b=B865agWiG5xspc+w
	WgWYYTqo+iTDyWJshan7tS/0iYYuC8lGR+4kwt/DWsWZKIa795pZF27cbe5MihjV
	HKaFySRImpS6J/rh7LLasYujdDcU8h7L76xmVtGIV+LiEUsfI1vzif/j08NMiGiO
	ckIBOi/xvfPTajGZ9z4IsoXv/RugnUSLiX4rHydwuqwFU3iFLE7+SRQb4d1BYK9/
	gMcyCvakdcmjBUnO0S3tcfq9+xHDde4iH4Xn/R0Id6wfWLUwyBJWeieCyJoxEpSc
	K+VEX7rPjVS2tfVizRj0Qzek4I/lIo4liYJSRTIDAhxPWgAd1j2HLjtRfsodcsWy
	OZAQfg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2dxdgktv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 16:15:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so69570a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 09:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790957724; x=1791562524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4taZxg5NwikgZ8WugpDCZYo+IsY0Yfdh2Zj5teOGtTI=;
        b=IMEyvYvDnWhIiVHrTwxNI2rWPoX30JrPhgVAkAxTj8lNk0T+FhDIMuMKR0FlzhC/LK
         ZiKcTIVqtf5PNCyLSrwmr5izzZpsuw24d9E9tDjxjOziyORkiOvqLqnLJ5okL+2qQRan
         tRLyU7d1rk0unp3pvvDKvrF1ZaR9Z+k3am7ERNRKlledp6tPG+a2A3Q0syGWVDQziO1O
         jsN4v9JzpEfVSugHROYE6YZ3edjXhm/QpMU/0qKN312fWFiN6qOqvaoHo+GSRBLFyM7S
         QFqb+aVln/FTUteFQGIeYxeaO2PPq6zt1W1iGizZ4GZE4/H6e2uk1pCdiP3Wm5/XLfvh
         hJnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790957724; x=1791562524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4taZxg5NwikgZ8WugpDCZYo+IsY0Yfdh2Zj5teOGtTI=;
        b=hUtHoOrdV4w+QLq1AI9ptIJP1mW6ctN2LvAu2zOY38rMvgxYlV+DGPsv20LKaxYzeQ
         rNw4igVBeI9oWeJM0S0n75aeJ6gGFBsCjXCfvHku73o540NqhYeCY2/vCVUq+GXORzfV
         rXRBob8dZKK4OxUijGFIl7MraWakKArHrPDjBcOOkByUdlWtau7x56BcFK1GNAdcIGlv
         OQ2Es0WOAK0t/A9c8VZmqLqo5ImHjDEgJCQgX9lAr6hEaC5zqMbKZljC8QqUQgCOdyp3
         UXGpbTeVop5EYbbntdLa2KkDYWVPnz62TTK+pCPtweVZuO1XK9tXWPWexFgCG7gNAh1K
         4A3g==
X-Forwarded-Encrypted: i=1; AKwUvBz3pVCNZdzg4TxGzjgVaMGdcUgX3j2l2UH+m+x7iCWBRbtXhjAi0NowuIdf51p9ssr6nkwT/Ij4OXj2RiZA@vger.kernel.org
X-Gm-Message-State: AFq9FYLeH0WfoOh4a+LbYKuH9yiNhwl8++kkR45vrjr1Ybhmt1XaGX7P
	nO5xxkblArvNlW7/4T7xWa2+r0RyrwdpY7tC2b6gCCKyWXRZG78tmjfpxit3HEECDkWwtYVyVgN
	/eB8sc5aDY4QH6hmxXxoRSzQvEyFejEqZwWTFw0OO7HetjSE17L2e2xT1MZa1EOpXHxSI
X-Gm-Gg: AYBFou20XHiutN8Cct0UjAsriyfQpsKWCi/zlR6nSsNswa8bsdg6TzJq7TWMjMeubj2
	T4LDHlM9qVN/kl8UZEZNIzEHgHhb9/LuKbuvP36vYX/4j69yH5XH+d0C7pG+mWpUkhkPAMGuFin
	sqUoJJZaKUW/ANLzNqD7tlvOf7nw9kNcDpT8hkqnZl6f8H+JU60MGRSfZKZ3a+1u7ssY3cNZnmY
	YobiJzmJXk72DPU/DN6SbJalNuqpQoHhiTKF7Th4Bjp7kCUjiPbYRC+L/31Qn1O76kPQaXe3P8a
	7dJWmsc6Bf374J0ZFoGea+qXbG+PEvUP2doLpTDgxZqNHl+Kt3LfBWGhC5aSFBoXmK+Bs0g9uW6
	FsV2+sRVrQtWQ4bqZBmSoShXb+oO/WCMY+BRrakd+2os2bHd1uQ==
X-Received: by 2002:a17:90b:2804:b0:3a0:50bf:d497 with SMTP id 98e67ed59e1d1-3a6ce5fa39dmr2940505a91.3.1790957724393;
        Fri, 02 Oct 2026 09:15:24 -0700 (PDT)
X-Received: by 2002:a17:90b:2804:b0:3a0:50bf:d497 with SMTP id 98e67ed59e1d1-3a6ce5fa39dmr2940474a91.3.1790957723876;
        Fri, 02 Oct 2026 09:15:23 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f7384ca1sm1221797a12.21.2026.10.02.09.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 09:15:23 -0700 (PDT)
Message-ID: <439f1169-5fbf-4d68-97e3-c37f31b2116b@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 10:15:21 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Cancel Sahara read data work on removal
To: Myeonghun Pak <mhun512@gmail.com>, Oded Gabbay <ogabbay@kernel.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
References: <20260917192512.56205-1-mhun512@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260917192512.56205-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfXxmd3xsMJEqO/
 Be+avEYTGeX5owkFJRspBSnfRlPhzYHlm+GW0jkXyIuqghkTgZ6kLZylgUE9Dgk6HK/xhdVllED
 Ky8fe63NeUn60zejvGq1wFeAlxxEmJc=
X-Authority-Analysis: v=2.4 cv=Ko/YSmWN c=1 sm=1 tr=0 ts=6abfd89d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=oeivAFFXM94eOaBaf2QA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 9sHG1NHwfi2tKtmFKbyrwItPX6rW9cwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2NCBTYWx0ZWRfX7fQaIz3O856k
 QYAVYbK0DSFmGIdSu+k7KTzcZr+yM3mXuD2molzRudV2sBGmf3rwad6AYbcSFKhdRi5SmGIh5tj
 5SO6fdjWUyO1b1FNn5syhpP8LKqRpLe1f12mbh0sUHUwPybF3Usj45mRpzCewfmFxyoEdXph6t7
 TRQuVTEuJroL/H39R+aAnqVZQ1qL+XVFr6Qk5kI7Zu1Kb6jNNmJEyI2H53Nd2DAQQ3UoGIj/bBl
 /oJwWzzLAbTVOtE7WJ408RwraKknbfJJuXDAY3MRxhireym0txUnpI/MZxJISwiY3vdgNEHf6CL
 HALWHB5gqhm6rdvpyTBzmmkIbvGnbR1WW2wyr5q7sKJ6GgL8Cg97vRbEmHqHYWticE+mz66wSsC
 hSgrfiZGwfs7EgYY1FUI/MtFyLsWHF8Iwt8kdCFSihyH4ocZ2sIIEeJJTWQBiAwDvjRTs37HwPD
 m/0MM0qTIo6Nam+bQ5g==
X-Proofpoint-GUID: 9sHG1NHwfi2tKtmFKbyrwItPX6rW9cwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020064

On 9/17/2026 1:25 PM, Myeonghun Pak wrote:
> Sahara removal cancels fw_work and dump_work, but leaves read_data_work
> pending or running. The latter accesses the firmware and the device-managed
> context and transfer buffer, which are released during removal.
> 
> Cancel read_data_work after fw_work, which can schedule it, and before
> releasing the firmware. The MHI core suspends and resets the channels
> before invoking the driver's remove callback.
> 
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code. The same omission was also reported by the
> Sashiko bot while reviewing the Sahara relocation series.
> 
> Fixes: 7fb19ea1ec6a ("accel/qaic: Support the new READ_DATA implementation")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/all/20260701105055.8D4371F00A3A@smtp.kernel.org/
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Validated with static source review, apply checks and strict checkpatch.
> No build or runtime testing was performed.
> 
>   drivers/accel/qaic/sahara.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index c7c0b3eb4b65fb7776a6c724cb3105046cf6f7eb..6487961bbf14a1c284caf91f500968b90a064ef4 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -879,6 +879,7 @@ static void sahara_mhi_remove(struct mhi_device *mhi_dev)
>   	struct sahara_context *context = dev_get_drvdata(&mhi_dev->dev);
>   
>   	cancel_work_sync(&context->fw_work);
> +	cancel_work_sync(&context->read_data_work);

The typical convention is that ordering of operations in remove() is 
related to the order of operations in probe().  Adding this line here is 
arbitrary where it would fit the convention better if moved one line down.

I'll fix that up when applying this.

>   	cancel_work_sync(&context->dump_work);
>   	vfree(context->mem_dump);
>   	sahara_release_image(context);

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
