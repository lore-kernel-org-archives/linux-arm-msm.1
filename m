Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563AC3B0594
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787551177; cv=none; b=d2Y8oFoANhotvLJDrS5koANz6Xmv8K7Jja1H32dpBrNvxcLjA9CKZoL2GSNt5Uxboh8dT8UcNixpAj0W3U7VnVnxiI9datG/6tjAv1qR3kF1PnpG82+jkDLDBKViIsL0hmQrcbkx6JETmb7w/NUYuWz9jp06uNW+/0OAUIeVjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787551177; c=relaxed/simple;
	bh=+qyQLvj4gN7luySg4ETkE23qZJgGuStSN2Wek5Dw/ao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eox+u8GaEJ95b2gefdvu8n/V9VYGsRL1wvw5QzW2Gq104yQSxps1Sf1HX1qjSKwfiga4KvnTqelvO0Y+gee5RDIemI+CqtiQrkrgE0imSipoe9x6zUNL3XpFNmRAKIYj6nZlIV6ublnX93t7/YJhnxtpN7R/46OjVMnJQCOSILU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CO3JtPZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OMyxKXxB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CO3JtPZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OMyxKXxB"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9tm1937618
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zsj1FB3xuyBHeshQBDJjRvj44RjokWbqPIgy5SQ3Klc=; b=CO3JtPZZy9XfmjTA
	thRI+FrIgJ8Ftw0xeyVgmoNWTumaDjL5PShpC2w2Cffe6TG4CYlB5APsi8ZdX8dr
	e+5gp2p6LXpTPM49mO1gef5eVeE4nOPSSF/+f7WZdMYOGGXIjfTAwaGRZTHztI5m
	hEWQ7lcHxwSrvWBYvxdgP/PVaFUj5CtwfF3xx8PQc2AkNsJbUT6UZvwa0kpaGByZ
	HdNRfRD73w9Jhlb1gnwX8tBM3x3iX6UXoTSWmMKizU1/SJx1u3TQAajYxPk4YXjU
	elK20m/s9+87cxaJg4US0R1bcgtwVmzyIrGRP6JOsCqBCXFm1Are7vTVErnkf4S3
	EJHCqw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qwjp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:59:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so7737465a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 22:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787551174; x=1788155974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zsj1FB3xuyBHeshQBDJjRvj44RjokWbqPIgy5SQ3Klc=;
        b=OMyxKXxBzSqoK63uPiVXnz5QpfY2MvMDUOTJyolVxTZeywcrU34D01ow+Yit5x+2Ll
         b4eluydtN5z6flDxL1DZaFSjiIvM7s2gR8QFhk0RFpiARzvgDsdjaOrLP4fOUNC3OTd1
         2eRjin9sEfYQeHuuZ5NzJ6dClvR1UpvXwLuh9WGOw7ysrSSb3rJ8nxudfCsGtIWh+6Wt
         GDEQHTVGaZNVRjf8C82CxV13AXWn4Oi/891LNXcgDEm6iUepnU/T3/IDp5J03eFI/i7r
         /5rSE+hWp5wAKjfLj3iydT9Z3fn6mCwRDML0++L6AuCQvxyCs5A1UZQAVB5Hf3WEXVSO
         0/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787551174; x=1788155974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zsj1FB3xuyBHeshQBDJjRvj44RjokWbqPIgy5SQ3Klc=;
        b=W+b07xc585Xm5C+n60vkIcCJAhi9bcm+CFVwhFamLhyTG1L3D+4LayDBy6wNzmoJXA
         2We9oQNwVlaIcQDIhCwfwZTIp/xUcXf0tZbIQJQH4vMeaCElHhRUx0Que2uCljrrutTq
         hX9K9bXKbiAomgF+3D9aqXZqb3euvrKZOXEC+jCDc+Sa+zMjGUSvto/Z+zOqC0Xa5CUu
         sM/sCET1JHl1yEX5Ua99q5oK4WAOCJSQieDpcHt2VhyrXITN76lXCaVWkIfPyK4KrN+V
         5wvCXF8vono6m0fE6bxSn4LFSXrwUegCy2kms8CVV0p+cjyw2gfdafFfAwm6N1vzjDDo
         D2xg==
X-Forwarded-Encrypted: i=1; AHgh+RpTs3o1C1LEANrev7i5EQgrytg8+8siRRbVdsVzPBQa/anF76M8SQ5lEONiaR0/2B5gy3deXs2Q0Ii/2bQF@vger.kernel.org
X-Gm-Message-State: AFuF++kOZVxkF/L/3Al/aD+dBijvaAISXPir1v+0hUKMtdJg4Jt6qznR
	zuJknxSIEcq7YKMuvguQgVzEtr5jDVQjeULq+vtmmIkFdKCF2MlQnn2uKEwYLSjliCeEb9D0dOt
	nmqNIhDZN/jWgCDG8/z8Ts0w1TscXpqO4fHSttCQl/t4hjv6tz5zXpUwwEXZzcUYVXAt9
X-Gm-Gg: AR+sD10GRfyLOp2OViqMWUdZM2J/h0sK0r912rC5iRVlCtWmr5o44ncUBEzuYcGAxI5
	s0Lg1xah2lyLil1EEff+UgrMInWLs6TaE+r/JmGE6rX30efssCR5muBi+vE6dCcNT/lPE6NvrOa
	CBfpa3+izF44DxOGTUVqAn8itjg+f6+p+MptmKB2NBo7ybZJZrTDgN1qdm6FQcZr4ZZkcGLcie4
	ZysXGz2nm6GcjwWW0f9LK34sKMJWd2+fw0j9cpxRUm76UQ95aruVh+Ney3FlVzQHKoWPOLzmXiB
	SZi5/M9/nmrrbZyCqXbPqxe1wOUAbMLXDU11RQRZZDyOPKhWdMBVgSEd8sWbGGCjgSOIp4Cdxzu
	7BCaByusRRQlS8eJBDZz4QZw/077I
X-Received: by 2002:a17:90b:4b8c:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-395c35eb2c7mr41084485a91.7.1787551174086;
        Sun, 23 Aug 2026 22:59:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4b8c:b0:38e:bbf1:de34 with SMTP id 98e67ed59e1d1-395c35eb2c7mr41084328a91.7.1787551173105;
        Sun, 23 Aug 2026 22:59:33 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b46518sm9003488a91.17.2026.08.23.22.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 22:59:32 -0700 (PDT)
Message-ID: <076c7c52-d96b-4493-b723-98953c10b92b@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:29:28 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qualcomm: qmp-combo: update DP PHY PLL programming
 on Glymur
To: Jason Pettit <jason.pettit@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260721-glymur-phy-conf-v1-1-7c8909552c5e@oss.qualcomm.com>
 <20260822142508.25473-1-jason.pettit@oss.qualcomm.com>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <20260822142508.25473-1-jason.pettit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1MSBTYWx0ZWRfX+vrbajV/CFyU
 Lo9DfB1eeMi5NE6sj6XDDlJWkykjvLb/pFxyyRG9RKj8UfVw9EnNXrso4mSapbJ4bOLLM+Lp5YR
 NeMjGJ116In+4yzf+MYd36Iw1BoY+xtA5fzKvwIz2bIoBgZMd61JWrMXh0ly18+neG30G8BMqyy
 gxlYq1ZFZ9/DCtn31/mU63rJtYOdcCPdyt4Hu6/0XOnFXxT1DWcM5cH86J43JL/FinSCeFlskSY
 hISVIkrHruCalc13vhOPgSa+QTLQqZomaFG66zDLBUFjZoHktDetq91jD8FKE9oSfQCRASrwjY0
 buXAWPSirZ0z4CVdC5td58ZM9KW3CEMg0Atga5qsq7I3DpmtEJgGZbZ7mrNeTN2V6vKD12OtLf0
 9LanvPtSYfG4sMFegHqSmvBZj50v6iAVbMW070y17Gahxr6ol7kZx0G70AV3v9TqbbnbKrVa/mx
 rsBWfwi2caw6oIpiQMA==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bddc7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=RPR65wM-umSgSowWlNQA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: TjpZVVS8K_yKjwnQhJX3-lEyKnR8-TPk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1MSBTYWx0ZWRfX6rcHNPWEFEaC
 cbz8yUUfzE83Bl7efCcRudn3ryHxWIfnXhMh31KzVDhyOvuuOChaSjhC5nPlSJscpS+A8RXTkSS
 X3vtDhjb9puelKJ8P+j9BJkbXHorZVk=
X-Proofpoint-GUID: TjpZVVS8K_yKjwnQhJX3-lEyKnR8-TPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240051


On 8/22/2026 7:55 PM, Jason Pettit wrote:
> On Tue, Jul 21, 2026 at 10:48:33AM +0530, Nabige Aala wrote:
>> +#include "phy-qcom-qmp-dp-qserdes-com-v8.h"
> That filename does not match the one accepted upstream. In Linus' tree the
> header is
>
>    drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
>
> The "dp" and "qserdes" components are transposed. As written the build stops
> at the include.
>
>    drivers/phy/qualcomm/phy-qcom-qmp-combo.c:56:10: fatal error:
>      phy-qcom-qmp-dp-qserdes-com-v8.h: No such file or directory
>
> Dropping the line instead is not a fix, because the patch uses two symbols the
> header supplies.
>
>    phy-qcom-qmp-combo.c:321: error: 'DP_QSERDES_V8_COM_C_READY_STATUS' undeclared
>    phy-qcom-qmp-combo.c:322: error: 'DP_QSERDES_V8_COM_CMN_STATUS' undeclared
>
> Both are defined in phy-qcom-qmp-qserdes-dp-com-v8.h, which has been present in
> mainline since v7.0-rc1. Correcting the spelling is the only change needed. With
> that one edit the patch builds cleanly for me on next-20260821.

Ack, Thanks for pointing out, I will add the 
"phy-qcom-qmp-qserdes-dp-com-v8" header in the next revision.

This will fix the above error.

> One other thing for the respin. The patch no longer applies with a plain git am
> on current linux-next. The include block gained a line in
>
>    eca0e717aab1 ("phy: qualcomm: qmp-combo: Add support for Hawi SoC")
>
> so the context of the first hunk no longer matches. git am -3 applies it.
>
> One process note. The subject line reads [PATCH], but the changelog in this
> message reads "Changes in v2". The revision is therefore invisible to b4, to
> patchwork, and to anyone following the thread. When you split this into the
> smaller commits Dmitry asked for, please post the result as
>
>    [PATCH v3 0/3]
>
> rather than starting the numbering again from [PATCH]. That keeps the lineage
> traceable from v1 through the split series.

Ack, Sure I will post the next revision as [PATCH v3 0/3]

Thanks,

Nabige Aala

>
> I am carrying this patch as a prerequisite for HP EliteBook X G2q board support,
> so I am happy to test a v2 on Glymur hardware.
>
> Thanks,
> Jason
