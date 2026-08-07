Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96726472557
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102876; cv=none; b=Me0v3OtvMUiHiJurztIicY7ESrWGGrFhAZ5iftZCeHE36Ho8WmxBIJyPnfLreZdNi3dfIGjVRq6qz+Dy0dufXk2YpKX+4rhn7lBzUM0UpbB0G8LjWWqccj6To9owP8QD3D0jFxiuDpNGQwtnv7MqfFiKh7W+2TWyBdi13PWlnKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102876; c=relaxed/simple;
	bh=8bhM35trSjwyI7y2oOmhHz/pfllNgGqcFi0+UFQMAo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCKYHUAPuzK9F4/lLbiGtlHcS0oUGiWQjPc386R63sFkgez3keHqLVbZykTYK/1Y7mDBPpkEUUvSIEofw149VTi7OVKfK465w4xWyE+3nbddBpdp9bM6kBpr6stk/HiZv3lvYaiOrfXhR916SwyU8Jfa5KfMPtgZ7tuGwqPqhnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/00tM+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RflHTrpZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/00tM+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RflHTrpZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777S3Yr3822029
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 11:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+SG0Jgv2EUKUBJkzppL8BN75gHan5rEkLCYQkb251Y=; b=E/00tM+0mYwdrnBn
	6Ee2E4uQDZMg5fPCHStpCPXgQ27lqK807BMWCO4tzp3xPYr8Z1UqUlrZEOgfBwTd
	alVDizgvOpilfkXqmGvRm+r2LZwOH8QSHg1p/OciL5ZMILpaC5BaJAbfCcXxV+/s
	BK/3kd+6yLqqzfji6WNdfz0+wG7JKO4CeklBQBotQyjf7tere9q2o6TKpxfZf6Fy
	CZepJakaJiTSthYyAkA3DeCus3vAVM80hIlQ5Z9SE/YGWRJNA5WoQS3WiWZNBr3x
	NZrv3bAco5bhRuB0WitYD+Jcx9xwsyxW/1FK2/AGtjULPylWQlwA/tT/zxrCX7xM
	p8N+IQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gurf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 11:41:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38827cee19eso4156613a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 04:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786102864; x=1786707664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+SG0Jgv2EUKUBJkzppL8BN75gHan5rEkLCYQkb251Y=;
        b=RflHTrpZ10/rg7s3xcHX44SXCT6roU1qnl6ZdV/RzkwOVLhBt2ARc2gAbQPEN2JzvV
         WFKKzbgkAIsSWHANH7B28Cit0gCSmjCXyNZVTJVsHt9IZl8Ans2uy5v7RCLRCwGo0ryi
         mVbtHSu6m5QfcsnynFb1yHdVbAA/0NDtBBJVagfa+ZCldg5S6bXKb7rdnQdaAfPURXFj
         JB/edf+szmvAMis7+cTMmyVh/kw3de5tSPbX5lBixHqOn2neHRFKNJM4QNvSKDjf3s2F
         uauyZulM/me7/7m1we8JSaNJnU3jWnvWBCP8k4Fh10WRzaQ8ZpdvffB9/pj+b9eFKZgz
         I+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102864; x=1786707664;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+SG0Jgv2EUKUBJkzppL8BN75gHan5rEkLCYQkb251Y=;
        b=H9+qKYd0T+I1UWJAwAUYtOoJpWKlqXee2PV7hKNc+pzqms7cZyJ4zJUptY9bGs9IeU
         OeLxA5Xir1ZYggVeYPGRZf/esHrxpGAY7Hvj0LjbN0PxKl+6D/fiIhPGuGeEpoOUxDwG
         KYr7BEXfJWFgwNX0SuVMANb2v66axfr+9+dXt9KmVjWjL6JRABSGksUIyzOMMHmw0HGt
         6ADBxQcSDboP0PHmPOZWyQ8w8BLAVkdSftWizzFnHq1MvzRwpwVh4GJMAHqQIDmARxGJ
         JUyOgoNokTFeMinteQllWOgD7MFv6gx7ygS+D2G91smlg5+SMRg9agfDr3TaTS3rrwQ4
         jqPA==
X-Forwarded-Encrypted: i=1; AHgh+RrdmbSvurTAWvfCdnc3Ob164BwMYJM8JclYxKU5QkcnT1YzO798E6vOwrAXCJx28G/dxrKK2A+waUROc5pB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpr0gF+INqsdhr7H4HG/GgTu+4DIkJjeh1UPj8xZnkyKAFOsZM
	Sdl/RlIFo/fI7I72q9y1Vl2cWL2F3sI47aFsjWJQ8uV/TSLbodrjNvK2LzDj+LCV0OCquXMsmWC
	IaqhH/TJ5EO/iavNC1oYvbKucTZAN9CKvNl8HNMzRZgkU1KgQFEmsq/yemXV+D/NSgXeVVZdKR9
	GA
X-Gm-Gg: AR+sD10g49If5yuik0/akmaFZQb6wnADNLd6gGotD2LlcI2bDV7SF0FHA3YjssC28k4
	VmORCZjt8jqsLGtrBaPO8n3DfEgzDBLMBowcIlxBGcWGLGvGnTdCow1kkoOVXnFEHB3us4eqPzd
	9nzavKceTG37w0MvNbCBtH8Q6Aq20L4aqY03x5pivJnUJcn2xqhts2CY4LZPIiNdjz6YtQWS4oX
	mLh72tUQw1D/75TZEeO5Qdlz8VnB/ItRxJ/8b6DMJXNnFsuP0mchP+dANDy2rcf05xxk5SF3ZZ4
	nQeNpm3UQlkvI/MOdKU1hn17jvLigcyi1BaCDTsSePTGMun9fEUEoByQ1eDMaHD++xPmnd8/7Ja
	UabDZJzqprciqcj0tWSAUl2081TGikZo=
X-Received: by 2002:a17:90b:4f91:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3903ba0745emr19461509a91.0.1786102863791;
        Fri, 07 Aug 2026 04:41:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4f91:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3903ba0745emr19461456a91.0.1786102863340;
        Fri, 07 Aug 2026 04:41:03 -0700 (PDT)
Received: from [10.218.9.97] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085c393d5sm4737908a91.0.2026.08.07.04.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 04:41:02 -0700 (PDT)
Message-ID: <b4e092f8-a991-4028-ad24-983dacba7daf@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 17:10:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dmaengine: qcom: gpi: Fix channel cleanup in unwind
 path
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
        Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
        Miaoqian Lin <linmq006@gmail.com>, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260803120316.2703956-1-aniket.randive@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260803120316.2703956-1-aniket.randive@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a75c450 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kkqF2vAvHruJUMYZjVUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: FqoTGBCL4fhoPZwRpwKqrGLWA8fr-Dvd
X-Proofpoint-GUID: FqoTGBCL4fhoPZwRpwKqrGLWA8fr-Dvd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA5MCBTYWx0ZWRfX2sJ7MloBmHv5
 Dg+ZHz/FP0u+ZULhscFuRqRYJC83YOoEp31zjB9j8f4NllPFH2HaqcIxxGEarumOcg37aaNhvj1
 eQtHSRzZqqbH7KsPCx3reU6Cm+WZYZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA5MCBTYWx0ZWRfX0J5eLDnbr26m
 j7ThI9zeA2wel5W8viXv/WSMNQ5vNOLv+a/hxK23KBHZHZ7nQsQzD4NsXLRkXutX7N0jwvM3vL1
 j3KjUSp/Ql1P5z/R0oKOowyVYuSWXyUTDxzwC3GvxejHQCfuO8jC6uE+Tw/8GPEf8QccaCxXSqK
 tHXxqvSw+8/8NCjsrtAkV74Ra0p2INi18tFJinjMoq7RnW8+2otbUpUXZe7RZKy7yJUK66wOlDw
 lADHolLsA6Y5P9SnQL3KRgJA1KDT1qzKLNPDPuNrrG3odZV7EbMXEMwY0J3iJb8QrD2PV2ZrTA7
 aANauOps8YVuSjcdRJfigLp6nEjkE7tUMOqlYUlBidnLxeyQXWQrsPkBwAG8heXsefedmB3ac77
 UKL4L7yxNEYkcA7FVVhmdlf2nxAufi4EC/38s7lmmSmPrI6P8EO0TKEmQdCU3jWsAQfOyrXf/HB
 0LuWuZxNyOyaxCHF12w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070090



On 8/3/2026 5:33 PM, Aniket Randive wrote:
> Fix three issues in the gpi_ch_init() error path.
> 
start here mentioning  the three problems first in generic way.
> Use the indexed channel in the error_start_chan and
> error_alloc_chan unwind loops instead of the original gchan
> pointer. Otherwise, each iteration operates on the same channel,
> leaving sibling channels unreset and undeallocated on failure.

meaning, channel cleanup not happened ? make it simpler anyway.
> 
> Clear pm_state after freeing the event ring in the error path.
> gpi_alloc_ev_chan() sets pm_state to ACTIVE_STATE, but the error
> path frees ev_ring without restoring pm_state. As a result,
> gpi_free_chan_resources() may attempt to deallocate an already
> freed event ring and issue a redundant EV_CMD_DEALLOC.
> 
Looking at your change, it looks we are cleaning up gpii iterating over 
each channel along with setting proper state.  Code seems simpler than 
the commit log, so request you to simplify.

> Also free ch_ring in gpi_alloc_chan_resources() if gpi_ch_init()
> fails. The ring is allocated before calling gpi_ch_init(), so a
> failure leaves it leaked without this free.
> 
> Fix all three issues by unwinding the correct channels, restoring
> pm_state to DISABLE_STATE after freeing the event ring, and freeing
> ch_ring on gpi_ch_init() failure.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/dma/qcom/gpi.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c

[...]

