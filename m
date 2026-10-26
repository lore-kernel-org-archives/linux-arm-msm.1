Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008344;
	b=c0RwJ4FHbgNYM8QEJqHWO4PwiSq5NSBTIvbSWSRFrrw6ztRbWUnDeKpGPRlFt2GFLYum
	 qyS8RSQdi6y2g+JRzOJYPU+ZFTGE362BZUL1XATAjWzF3LgxsxvY5zrCJ9FDIONGDimTB
	 D4cmpjJkIWBdZASRTynzBFTIUInfWZghyy7EWyL4XpgH7TyF1GPyyYURI6/S983K3lLzi
	 XyR5qi7vedW0CZgiLRBp7cvYIxnlu5Kr7w5iWLMy4jEOp8rkqvk9bIbxVVwjtHQSXe3WA
	 MK9asrTj/FQnpp1GoiYQpQ+ngjFQrxvO1iVxo/627c9Ux6GcTceXiQw2IOtlt3ssT/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8r16PTsuyAmiAzOPbSM4Ko6zLElad0hZf/dV0vVWn1g=;
	b=4chB2G6Ux/hnJzyk1a/qaea8kMakQYVGl0SI8dHy2nNuoUAROzD/pkQKQMp+kSRFxqz1
	 F/4FdIXvwOvfxleqqiJYnsP62JQcytJvOa3f94gGBwXVsqSf39JKQ34aJyNPjTw2fYVkw
	 PnGSlm2JDfQhlAeUJbsg4Z7Jgpv5RIgR5on0O1/0zT3G9CNCyHKGOykbqOE9cu8ecqYt+
	 wuSnGGAYllFxosmzSNhewX9+0PQGiFXlw7NE8GAnAjzgdFY+9R9bpB9pb2gwdyZapIxxp
	 QqQ9O7F50+jaLhxjLWesVX4dLGkqqf2I3wXoEBFcMbIndgyHzf1MLLioG38oMmqmknw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UOt3gzwq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+rnB1Mi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25777606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25777606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UOt3gzwq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T+rnB1Mi
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q9aRTW2560523
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:52:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r16PTsuyAmiAzOPbSM4Ko6zLElad0hZf/dV0vVWn1g=; b=UOt3gzwqp5/X1jCI
	Io2LU+WTnhExq2YTUf2cjNzlQFHgtPXtw0/sJHWKWz6RnPrQ0I+xV1yoNqveIqMg
	eqmdoSjdoYV77ppTP0pCOOzNqaRrBhW9eiMjEquyUMO0tZ3mq66gl9lPYAO8mvN8
	XOmrHt9Hnr4Dwm3in1T9WD7G2Ep8yJ+eGBVMYr2Qyy/d5q99uMHywf+LRApJahI2
	W855lwZAxdOFCO+H4g4nhmU6KfKzo472WhR1v6NkYOcu0HERoAcrpAs3fphfXsIG
	CiCxxagEL+r9h4H8f6mSMDxlOE3xXbXjPxgxzAr6aM9IjCAE8KLG9AFHS8D4AOyK
	THpY4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp81xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:52:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53657d237ddso3476261cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008341; x=1793613141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r16PTsuyAmiAzOPbSM4Ko6zLElad0hZf/dV0vVWn1g=;
        b=T+rnB1MioOQWl+T7nmlOci7ECBw8ne1XGD5uohDVbb4vZ98NtsJb2jHcCQeKUMrb3q
         QJpAgYkNy8/tp12x9/Qja3cYBQNM4UEidD6BT0Kji641pzEh7gG/750iv7XtOESfu3o7
         oHQdvkbjF8NzjQq3NhAQsAf6QMwjJXHG/zEAIcHASdVe6B1DPLY8q0tlJJPZPx+CvXRV
         M+L9VTfq8tFK7oyTpDsBz0coO36My0aYP4GHNU3tHJsbLCYLURicisl4GoU0GFuPcGEo
         Bud+1Obb8vSsAexzV7h6SmgGKj4Y6zYZu0Qco9lFACOqQV6Sg5JYa9pWfCS0zfPKGms5
         kM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008341; x=1793613141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r16PTsuyAmiAzOPbSM4Ko6zLElad0hZf/dV0vVWn1g=;
        b=2hCVkZubeo2wARjlAhTZCGpMGZzAQq2vuQe+WVeeVtzLhKLBAD0seHfN12hX+avktt
         bO+ZKTjzAfDa4ksaZZhoBfpZeyqktZGMHCWfzhCFmySPhmwWDeDymELRkLUT9ZM33bOG
         k36reqE8oSeMeiSm0hri+DwgCAIYginA97PeZ1sAmWIs6DwF9deeFWfo28DIHqBLtEZX
         Ke3mvHJdS8j+h3orQIbprZhbR7qMIqPk8XIgqmvieXk40yfKpE01RD9xrTcgA+FgkJqm
         IHJ/j/+z7iZfELRPDA23McIygP3rKpQj0kUQO3m7qc2ceRtfyKdXZityBST/Ry3Yug//
         p8Qw==
X-Gm-Message-State: AFq9FYLLZTbBwPzbmo4VM2L4NeXFVp+X+ISB5gNoZXksP1o4C2HYRoZ9
	ScJWSEegRohmArQ08eg76L+uqgljcy7GRjrFMKcVkz1JKL8DmRZp9mZGypXsgnDx7Ygp2nDUb2v
	8G8n13VEno989okRlOx7aWnPSQRGyHUY6zKDZWifAlNYPAjiwF97PEY1RiQJR+wPAuuve
X-Gm-Gg: AYBFou1/PZAkRTpjD1vDw8xJKY6xT2vrhMgGZ3jQzLCGvkzZ7aGe21gscRUDkDKTILq
	eH1wvF52zaUOaOBOG8n0oFn78eZlNJMXVQvHJG088263IWjKfXCh8MbUi3EZ9oniIzK947cCtUj
	nOucd3xCcCpcFCwjelM0grSLNskgxE7R8x1TO2dMlx/DAcOlZB8qiJgZ45IXblPXIXUaUWR5DNz
	9P/0ZWs4Q3gYaj3/7dJPVRTivrr/ljp3UYQXord0zMD/IX/1Axy7zMkSnjgARP0h1ZcqUYq/OEk
	ivzKFjIykdCyECtYClNclB1jUWjIGKRkaw55/icXAFbN3yhb88AiI5Znbcwr0WOHsn7bvYG/frC
	bTaehvHAS02NVqYiCsaRW5g==
X-Received: by 2002:a05:622a:6804:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-5383b504b5cmr93393401cf.3.1793008341237;
        Mon, 26 Oct 2026 02:52:21 -0700 (PDT)
X-Received: by 2002:a05:622a:6804:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-5383b504b5cmr93393211cf.3.1793008340839;
        Mon, 26 Oct 2026 02:52:20 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7984e9sm296717366b.74.2026.10.26.02.52.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:52:20 -0700 (PDT)
Message-ID: <5d732b4e-4558-41d3-8c89-a2218c93d108@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:52:16 +0100
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
Subject: Re: [PATCH 3/8] drm/msm/a6xx: Fix stale boot up BW vote
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <ltuikov89@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>, stable@vger.kernel.org
References: <20261024-assorted-fixes-oct-v1-0-2977f974ddb7@oss.qualcomm.com>
 <20261024-assorted-fixes-oct-v1-3-2977f974ddb7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-assorted-fixes-oct-v1-3-2977f974ddb7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX0L8m1/BOTLp7
 atHSAz1WA7wkI/fP44DCHa7eLmIAxZY68SgPQrTTjeTt1cdUl009Qmdrpu82Z3Wqig3lpj1J1cE
 86tOQbysB2z7kN+q5ku8QDwv0jxDORnXHuosY7FRFSUenkaaZEyxCktU3syJzcYyVeptCTDssgM
 9oaKp61WGwGAQG5WYYcFIup/CuNHxwaGPJ64MAEouzMYGQEl3mCI/YMpgJGAmCYPJW7PNuiBpA7
 O8V9POce//u78ObFr7A60jLeseVVy35TTH5+2iKhTK+f57Bl2mVmxkgpV37NLaHsgMYVNWmjk2Z
 Yq+cnz6gO8BVhrEA6/8dNwQnNW4WV7YjBTObuRtQ/VQlAbQ5dGHcUHZe6po+b+e9jOudQfCm0OB
 4ciyW8Tiql3cIV5LDBsg+UKHv8VfX2DXX5orraBhUpnSyHVugDFtXFJvqx0y3cYmgIoi+NT6Fa1
 rDQJtZJqEV3gxn8mwNw==
X-Proofpoint-GUID: whtRcruEvQ19quVm3XQZl5F0MS9p4vg7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX/LXXFPXW81Ac
 k/G16sXYAEoIlhCkXdhMaZndqzQqCjc1kTUFrBwCNuiCgau18b/dOg6zwLQ5B67TLI999yMbf7t
 5V7iT0M92t4+OCUWc797IgHUrwpSZxY=
X-Proofpoint-ORIG-GUID: whtRcruEvQ19quVm3XQZl5F0MS9p4vg7
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf22d6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1Jnm8Am4PKJ2EhgLYOkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

On 10/24/26 12:30 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> An initial bus bandwidth is voted during boot to bring up the GMU. In GPUs
> where the GMU drives bandwidth scaling, this boot-time BW vote is
> redundant and can be removed.
> 
> Fixes: 7047e655a567 ("drm/msm: adreno: find bandwidth index of OPP and set it along freq index")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
