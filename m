Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736845;
	b=PY+ckmgqQd3xXPusTtBLq8ccwNkjjdrQQAILNUaUjnullQxzixJ4bEtoorIOeC/nMTRs
	 AbDuR/H1Wn1taBgOFuxyYqITFZRKsBYI8svGbrJQZxC3KkjVDjMne/gtOnNvOljh31xW9
	 /1XhxH4f+WTvuwZO+V9ghklWFvd8DJND14bDcaDk/l7lTDmD2ZiQP4e/B861TOpKCgPGy
	 L1augjhFiIvJN2lmOKh6nHY7QDy2JfuVcNmhc5ccwrfBdlAX5/aT0DS0mjLsansa662T3
	 B1NcLnYixN3yPLc9rbFrxCWyzFUquAwumJt/fsg7JPtzWnbVGbnC8eSwhPHWuMOo1WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cx9pCkxTEi+9RmZrKlW2vNSTCfm+MruumfTTeAoZOe0=;
	b=3OgzcMLO+W2ApzRxHmTNI/YhL40/EqNese3ShI4pWgct+rUYIv3x296X93POEqNM/8Ao
	 owJnihBAgt3vFvKlFaAXV7tG+NjqMdKjzNWO2B14f/oxOrJQ90dGg10X9+etWqNly7LlC
	 rpy46P+Af5HnYNpLfuH6B/pRgPkfxSiO7K41tH0ONLSoJFq43HF0WH/VBclc0MsTMSpGs
	 iuePFrKM5aBXJaeHmShbg58HgYzYtFS3QkWUMH4LSjB820+sUD09Ym6hD36hcrPRWtEh+
	 zP6uTadqR84BLeivhaaPCfSAqRLQtC3ULNZf3dhB8TftPkPGQ2pjAzttSybJ1xugGAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3BVvFhq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GjAoYOBc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75832606A31E
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75832606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P3BVvFhq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GjAoYOBc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wwKU1657531
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cx9pCkxTEi+9RmZrKlW2vNSTCfm+MruumfTTeAoZOe0=; b=P3BVvFhqucobJ06o
	Ij2JVoufRZ6Ra1Y+aSoyUCnFZzTR8u8jTAYcMAK23l+KtpYjiIktn7R7WBOS/x+A
	EeBxUxViCUyuYiP3FUr7TLb4AbiJv6jAn8ugZZhWFPGhr78/Q0gtapk7yPQrnwnZ
	vDQgfuf+1dT89qYrYW8j2crR58Ix3X0XRw01dI3sogDX8XE8iiejf4xJ/8W8u0Sf
	0wGCbbaJcRpQrVdW6gLi1Kq9guYLNtbz/Y8P5eR2Bg7BJ36dWWCeWoDr1WvX1gZH
	31xNn6L1njsic74BdJ5SyaQoH+L1Ml9UZmxXTv6B/9m83SPSgwKnkAZdOk8f0ne9
	GSNhmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwan87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:00:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so449026085a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 02:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794736844; x=1795341644; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cx9pCkxTEi+9RmZrKlW2vNSTCfm+MruumfTTeAoZOe0=;
        b=GjAoYOBccrU56snOKF330nAF3cSJGpF+u73lOp7u6JYohv+O+yToAV1nQX/je6b1O2
         1/J+CPwpJgKkA7dMk55XZl6IVQ4kqp8f4etllQi39wK2tFbRG9pDtKcPse6VezIfkQJA
         2O+wx0RCsOmltkrVlObu7mHYwEMBwekAiciRXmIOVtOQTPIVBBPUdeDHNQQ2sTB7qLo6
         yracrJlCiEy9NjfBQxgcXWnCTMXsgdfR2An/8dnWOJ0GJgtxZ9nXNr6qYIQDflBGX+86
         9bLURiWO+eLDtC+xMY0VYDiEQzd6kEqoAv1v9aadV2NhdUUqN0ToVoQOP5KxKmgkZEtM
         jbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736844; x=1795341644;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cx9pCkxTEi+9RmZrKlW2vNSTCfm+MruumfTTeAoZOe0=;
        b=Y85wt+fuAh79a5NhaeQfG2vdhYtxbDaaqHtw2DisWb1i8GOzxULFUX9JlHQWCGq0KU
         Lluaa8eQiHRkcrBohV4F+CSrGCOu8rX4nJZbvY+0S65n7AU24AY/U0zC8mwe0xO7P3s6
         WcX59GDVS3miZkaMbIKThJDGi/4xmtEmX6yGQZWmPczDc7z69PXChTN14gsNd5pmmeSD
         HR45xU29dHw2c1zSBlarFe8vmQXLqzRo/iGxiE8ZY4E15srMtAJIQ+SDpNnY2zvXAf8T
         4WEP3C0joupHwvhjWM+zdRg+NBhrn2WQp9F/S3+qIDcIwhkGVmDa//GECrGoTqX9vc/z
         rwYA==
X-Forwarded-Encrypted: i=1; AL+hErEiBlud7xEcy/pJLOLDCeZGAh9FnavlC1McTw7My5HGOjtNRs7x75TCkVZfraJYYYD4ig1uKfoKwkXaz36N@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q1zF/1eIiuSFrFlldMFoWzmalAEqNGuNW2wfXxTDsbkrxm1tr
	SSZdxlsmJdrvGIhRmpozbtqR7J4L5u1cUGH324XyeHmE4O7MgVp4Y7dpzLPZwNHpyTo2SEnTrPu
	HLpViNRU9pRsyl+fW8TXc4VIQLMGv/YvneYsnFsL+e1ah6M8eTyJ2cRW1EsME/fjMbwQA
X-Gm-Gg: AYBFou2C/wBje2xX71ixL65vIA/kVeFq5EJRNfKRXT7oJaKofSYzBCqcJXyCz4xfxWC
	EYrfA3SxmAI74JDlKC3JRevWPKxz1Oz+pR/EBOd652cb6ciLGrA7WR3Ythpo//h7NRrNmWfn+fH
	np9F+OSnN1S1KD1o3Ey5RwBCeDrJUai2EUFLrIsFB4S3Gsct4OZ9dhlhxqNg/9VhQFh9xxGlTiA
	klKlWLGxnIlaNrY1vVTiC1au18Q5G36qKJsujlEZQC9iwKPc3Q5yNdzTuvIGFcA2SBVHSIF1sNw
	46Kz0kNm1zlSdTzJM7BOyu8yAKNZFCVcyK8p6PEkW+Z+/bICtkuv/pZaK9VGrNwn01MAU4Nj5b0
	5Xn7gul5tyeyT97H5DNE/OwXTxE1HW+BUN7eHaTAEMzzdET0D23X7bVAyVR9iDtt2i6IAWg6NHf
	bO/AmWLCHk0YYKhMhUNQ==
X-Received: by 2002:a05:620a:4399:b0:949:7759:7faa with SMTP id af79cd13be357-9497759914dmr99787585a.60.1794736843532;
        Sun, 15 Nov 2026 02:00:43 -0800 (PST)
X-Received: by 2002:a05:620a:4399:b0:949:7759:7faa with SMTP id af79cd13be357-9497759914dmr99782385a.60.1794736843069;
        Sun, 15 Nov 2026 02:00:43 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c5095b5b078sm292229666b.56.2026.11.15.02.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:00:42 -0800 (PST)
Message-ID: <bfd794ab-7c62-4627-9c96-44a8a3bf5d3e@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:00:40 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: qcom: apr: Publish GPR callback before client
 probe
To: Mohit Sharma <mohit.sharma@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022144130.2443667-1-mohit.sharma@oss.qualcomm.com>
 <20261022144130.2443667-3-mohit.sharma@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022144130.2443667-3-mohit.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX1SsTNoMPQsXG
 XxvzomEvvA95bE+90jnZTWELR0vu6CY9tugXUJcU4OI0Ug5GUiVo602Ngr/0VA13DkoboTQ7edg
 ywHcsgDFemZOVRqmAQOXX1huE5TZevizdMv1MYcZYqGmJgtfaEqHifG53bT8xbhsrNssUEnXucU
 AduKBLAyZAk9Q/r5TjJdFXOhgnqoaL8lYpsgowRuKZf1JjrKf8vdlhQqoTzoFE0eO1lHtLiCGY4
 APblUEor/ryeuNd9T7P6R0ZR59oUwliI30U3wn1Ye5PTCCUVGJWqzr1HnkaK3I6aNoz5AYUzivZ
 mH40g0VExMiI3yIB7RB2yAusDD3oV0KKFdwCSwJbxUfWewXCRDbK+wGUJfWyOANdMaaBMky26LA
 R7MhCpyN5jlvmUGzcFtBmzTWTgbxv/cTcCLCiQwBjgFLS2XJItB1a9acw9xrBqjoOlNQhH7Qrqw
 uBotOakYQBZvwGLzI0g==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6af982cc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yE1VRrYSBdsmvBnWJTkA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: d33PX3AGQOZG8rtCKYBgPBnTMjYo-w3s
X-Proofpoint-ORIG-GUID: d33PX3AGQOZG8rtCKYBgPBnTMjYo-w3s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX62GlbHR5RjO+
 IvLOWrxzfIQ6ARJx80hV7m7k1tRyzJry9yt1OjzG+8w0mi0+ey/q4JkND5W68Etl0AL6StZP1sG
 xZPPdf4bV79hRAZv2rxQfKlztD3GCWk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150039

On 10/22/26 3:41 PM, Mohit Sharma wrote:
> A GPR service driver can issue synchronous commands from its probe path,
> or populate child devices which issue commands before the parent probe
> returns. The APR/GPR bus currently installs the GPR service callback only
> after the service driver's probe has completed.
> 
> If a response arrives while the client probe is still running, GPR finds
> the destination service but cannot dispatch the response because the
> service callback is NULL. The client waiting for the response eventually
> times out.
> 
> This was observed intermittently on Qualcomm Lemans and Monaco platforms
> when q6apm child probing sent an APM shared-memory map command before the
> parent probe returned. The failure has the following signature:
> 
>   qcom-apm ... CMD timeout for [100100c] opcode
>   q6apm-dai ... Audio Start: Buffer Allocation failed rc = -110
>   snd-sc8280xp ... ASoC: can't create pcm MultiMedia1 Playback :-110
> 
> Install the GPR callback before invoking the client probe so responses to
> probe-time commands can be dispatched. Clear the callback again if probe
> fails, and preserve the existing callback ordering for APR clients.
> 
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> Signed-off-by: Mohit Sharma <mohit.sharma@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/apr.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index ea7f83916d8d..829e5c8fdf98 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -365,13 +365,24 @@ static int apr_device_probe(struct device *dev)
>  {
>  	struct apr_device *adev = to_apr_device(dev);
>  	struct apr_driver *adrv = to_apr_driver(dev->driver);
> +	struct packet_router *apr = dev_get_drvdata(dev->parent);
>  	int ret;
>  
> +	if (apr->type == PR_TYPE_GPR)
> +		adev->svc.callback = adrv->gpr_callback;
Why do we need this check?
> +
>  	ret = adrv->probe(adev);
> -	if (!ret)
> +	if (ret) {
> +		if (apr->type == PR_TYPE_GPR)
> +			adev->svc.callback = NULL;
same
> +
> +		return ret;
> +	}
> +
> +	if (apr->type != PR_TYPE_GPR)
>  		adev->svc.callback = adrv->gpr_callback;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static void apr_device_remove(struct device *dev)

