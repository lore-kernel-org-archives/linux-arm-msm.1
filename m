Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450100;
	b=3cmCviTxFDH5x4PhleiKwwOLAjl8SZdewJ3Pr4F7Qw6CNxQYsU6nkssbg+onC1jfOUDK
	 0sJhazAmwxN1CMpXAiBaLndBQrDSFRcF55xtJSijlbMc+1U3YEaTTNjaBdjcdNvy8wHvQ
	 yzcScrby8d3BvFLaKZ5pzyzxqAWAAzgiF8nyWeW1jkc9BsiNdtynZYfDyEtA/S103HkTk
	 nRxzZFEXjQORsAw6IBECvWCu5UXKfvwOzjurdNdwHDxQxlplpFTEzK/S/rKbj7ZoIbTY+
	 83PjjCkhciiZ4iVrXHDeh3r94mpJtaQsJLzfsRWDVT8GqLo9GYH44AYLKkASOW/IYdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450100;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rq7GooCIZ7G/d81xEEdoUjPL+7aCqzIfy3ZyVlLQm9c=;
	b=XqhibpTtkKR75AtvlGbFsbLeForv29OrNjO87q/lMX5d/fydl+WizdKS7eoFMKnYqqAM
	 4L2P3proGhZ6xVfFW6nRAZUJS51QEn5aRqOkeQnQkUzrRRFKrdkcHT9q8sFJKegn5oReu
	 bg5niH4k8UdCTdVJ4a2U3s/Z/HEnkedbncmB1haa4Lq0FISy3978CNwA5RLBYEO4ALvsA
	 5Njdjj9jDNnJgWYeDMiuJI4IJohBBB0LkD3Ou3wHMkQ+Moeo8gMOR/FiIhlc6keonEc4r
	 kThFEbDteU3olyvCWmbgEgi857oL6uu8SNKonsdM7OfmIPfNywCntx5CrE78ekwRJcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYlPo9Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMWtHGOC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5AD606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5AD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlYlPo9Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BMWtHGOC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMaM6H2556673
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rq7GooCIZ7G/d81xEEdoUjPL+7aCqzIfy3ZyVlLQm9c=; b=nlYlPo9YvJkpg/IW
	fz55gQzv0lahwyRwsOUoXxUnlDf7T9g2B+AQBD8thk83ZytRXSZXEyPL4y1mARGN
	Ajm6Q3/2BJB1gQBUbX1GNf619a2K3RoKce1heUyBG+EWsrSxdEZLWT99WZ+VDgWW
	uy6H5km6m3hYDs5Xj88gbkzodviQ0y07Sy922WT0Gg07yYq3p/giNyncoqC6NmGs
	tKVhTmBNQ2BQA5RQysGrwHQ49KrqEI8t8iSqfQSH9Z273CquwuJqfpEvV+K6OciK
	Llede7IsBngZy/unLu5RhXWQ/FMHg2pSLbreb00NOfQLIHPhZoH6bhKw7GHJ9qY3
	XjjsCA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m2upa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 02:21:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so2284371a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794450098; x=1795054898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rq7GooCIZ7G/d81xEEdoUjPL+7aCqzIfy3ZyVlLQm9c=;
        b=BMWtHGOCvxUWPWhPrjE2Com6EMfLRj6npCxBupiXycUB1CDyi4ilu3qpSbDLmOe/B5
         0iI7Sl07IOJQolfoQRFLlL1HSZ2fw7HEyib6V0SkGnMoXTXUmlKgOPDH7snGivqiqLmg
         //4KhOKWnXE0X3Krp5KxSOwJNzrdqvUfLHnUGZufwfX9ZV1ypgaPAg0t8Fo6ufMleWB9
         6fP0dVlaRpRM7F+x0h1GjtqUb8zi0SNB14Sg8PsRPIWvm4S85RwA1dGkekHZnfWUoqJ8
         w3rMDezBcV+PpLx5b8FLjNSdbagIQSBOs/krYQFJCmS76uSt7IZ01WyNQe71v/eiPZbW
         BgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794450098; x=1795054898;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq7GooCIZ7G/d81xEEdoUjPL+7aCqzIfy3ZyVlLQm9c=;
        b=jXRMyjpXMV4gBMRIv0dVEfq7fFTxU9wkZYmXO3WtYHfPkwnm35uw+Kmu1it2hvR+FI
         VguqpK+gGtlESCAiFxuL0jpKxsfncmc9vHsmZr/U8gsJkVLsbuI9jEtX4PL5/ouIjWCt
         2PwDUNi3Rtn1bMknXfIa6x4zFg5yzs1QNkwRUewG+WPfEm/kx0OY6KHr87IGaVUaHUU7
         zyscLjJTJCdtwGvkb9qQ3f45TkJ9VTCn6u/icYU5y5PrxgImFkYs6YNJMTBkQD9VtIJ1
         5KUh3GtQMnZo8CIVhyTkncYOhSJrXvmC8T2YnSsa0wFLec9lJGodu4kL9qIrpDJdIAxH
         7I7g==
X-Forwarded-Encrypted: i=1; AL+hErHSjkY9BMyMmGgGY5fR7ZgQ4veSoEApfsvq9YoiIyjT8ZJFSgNKSGRR8CZnAYd4DzjBobplZB6AeKzfHCxW@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ojl5bm/0i0gdhJXSbnadi+9ktTv2b203DfD5cGznozCrl2TpN
	sTcf1xO2eYWjrzNe6+ja6nShE/5RtcKi+0ukHGkE5KBtryw8Rpf6J5XQeesNvS/J9ag32UsR1lC
	Wz+SA0Gfc1AWJiNUs7SZWdUrP2379imzZqYoOh3jo4bWUzEOm+mQGvHY0EEb91DaT2FaR
X-Gm-Gg: AYBFou2QaVwKLf1w5/lhtS7pFO3ifmHOlwU7AntbT/iCvBS1EEZbDnXKxFW/xp7JPwk
	cAXktM58d9FOi+84S4SLyucCya0pmorrcWPGelXWdqpCMBZ3HlCOCJlOb3tpP49cURWqQdGG2E5
	gLdkQCwhqhdQ9gS92ipnFetdsaLmDBS1mndgEP2vu4xE7l2sKoRvMj2H8U6pn737Ev3YKK+5WMe
	LONsevTqv8I0WFjOuNb4bclsJqBQk4rYQ6SWo+7roS1M2NIcM+LZZ+wpXrFE9wbYavdzaj21dTd
	2h3nS8whaQiAdjRPS0UhfS5i/adbXpDRai0F1qb7S5k5oqJt6hFm/g7N1W4tiqs9XmdXTHhkP9C
	1kVeY55usK+w1de44Pl/SDnRRpDxSefVtBScu1oh56CcfmyBo0pDfWWb32isoqjhOp6VyvavZB3
	XZ
X-Received: by 2002:a17:90b:388a:b0:3ac:a993:5b5c with SMTP id 98e67ed59e1d1-3b182e13d4emr4150512a91.6.1794450097974;
        Wed, 11 Nov 2026 18:21:37 -0800 (PST)
X-Received: by 2002:a17:90b:388a:b0:3ac:a993:5b5c with SMTP id 98e67ed59e1d1-3b182e13d4emr4150494a91.6.1794450097226;
        Wed, 11 Nov 2026 18:21:37 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c9d7c1sm1880088a91.17.2026.11.11.18.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 18:21:36 -0800 (PST)
Message-ID: <fbacc809-7931-4613-ad49-59e74852394f@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:21:30 +0800
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
Subject: Re: [PATCH v8 02/29] drm/msm/dp: add support to send ACT packets for
 MST
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-2-d040fb33db5f@oss.qualcomm.com>
 <ebgbhztbeifcty7tlzwykvwcfrn3bwsktfyy63nu4ocvygnqnm@prggbz5tzmct>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ebgbhztbeifcty7tlzwykvwcfrn3bwsktfyy63nu4ocvygnqnm@prggbz5tzmct>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WLiUxYZYyXAoLUzbhh1Hbisq2b_17rfe
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af522b2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lBWZ1gcxILu1McdKNGgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: WLiUxYZYyXAoLUzbhh1Hbisq2b_17rfe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwOSBTYWx0ZWRfX3J5tx1lgYbU7
 X2GqKOeFWUKAXw0O47yZKeUt+rdNy52WHLaIRtSewaZvA9l+yaEHiOaJHTVFDev1swvcLuiBE1L
 vTq24PEosl8HCuCACDwVAI2IOM+s03wY6dbRD7DXnsMjHtQz6Gbf+oyPR7SSxXU0Jc0D920slfd
 JWRRxnMKPO4AZR+hmGUU097FqksATUhSN//Nh1fr4I844qc3ruKjwCjacBXB8H5QQpElE3ccwJM
 TPry+lL2bN2g0gTu8HUndg5ENufscTLckqKOxSUeTUlqi+sVnsjiLXq324DZyOollN6OB4bOOAi
 lkix9dc4d0LCiIIatFg3d15Aqe9T9E9u5rnjxQnsjZsNUlcBQq+ssXpi3X8SXm4uVdvJwg9Vzry
 myeLyldTSdektLLnFiAU92lL4+Bgqx9OfMD4+ySViQUhH0AIX3vdWSYXlgyow+ZSXEoUb2/0Kck
 I71sSeDdozTDB7Qj24w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwOSBTYWx0ZWRfX4t0oLFDLYKBD
 wQCnXW8q9h9BbrHkHtIY9eyBt8wOF77kRIW1PopTj2nLW4Yw6Qi8skd0lEEzNI9IKpOjsppHh2i
 3m8Sd7410KzBCmDI2OUP6PZbBGoZVp8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120009



On 11/11/2026 10:41 PM, Dmitry Baryshkov wrote:
> On Tue, Nov 10, 2026 at 12:54:23PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Whenever virtual channel slot allocation changes, the DP
>> source must send the action control trigger sequence to notify
>> the sink about the same. This would be applicable during the
>> start and stop of the pixel stream. Add the infrastructure
>> to be able to send ACT packets for the DP controller when
>> operating in MST mode.
>>
>> Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
>>   5 files changed, 51 insertions(+), 3 deletions(-)
>>
> 
> Is Sashiko comment valid? Otherwise LGTM.
> 
The comment is valid, but the issue was not introduced by this patch. It 
was introduced by "38e4b12149792 drm/msm/dp: move the pixel clock 
control to its own API".

Would you prefer a separate change to fix this issue, or should I fix it 
directly in this patch? If the latter, I’ll try to send the next version 
soon to keep this series moving forward.
