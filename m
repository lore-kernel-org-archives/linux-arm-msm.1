Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585435;
	b=oLOJ4vl/ZeVGwIErMgTMFkH2vR4bqw7tfF/R3ipRWbWGrPxmk6OUK0MKRA7yCiNHOBaW
	 LNMAuC4d+gSMlVbSMXLpTuuOm3y3M3rsudq43yucjAoNlqnhxp+ivdUjT3Y/rofgVCFk+
	 oxE+y1oLeJ6fDdg4osebLYcUwzUJzid6e7rzVC9YPdewrOm+6ofw1Y3AnoTzBSHZgoPnP
	 JTCP45MOc7Q39Bdim9Xq/Pld5RsxvvxuJVI9wd4aM0iDtijsi8CjD51mN3G/zSdURrscc
	 naC4nR6jqySTtCwSDJO5LTwCycgKXt2UrjktwPVZ4w4/ImzE7V8E7hzzeN8K4lv44xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yuu4QueJRDk0ija3ekrKStL4rHiHPhZxLi2O9vwmeE8=;
	b=czPQ6cbxe/22dMBuwuN2MwOunyuB8amIB3MqhTFj0+Ik3SOEKc8Uj/2px3RYY1lsC3Zw
	 lyI5qpSDaCd6tV7+LkgI5AjDVX3YS4RRxGT8JkyZO63ZI9hgcb4UufQNF9YFS4y36StOL
	 CVxFK/Dt8xqbYfaUL9PrjItg7SrtK7wap0y2iOz2/URCZtQ8/jxbdcRCBgQPVy1s0Wwya
	 TH/wnUgl/9m2ek0KRH8jLP7O5WszMBDd8X63CALNz1tU1Bm17/3/jD0icOX8+MpN6/e7d
	 K1TeBvGVrPnvtCb1yqQkqfuvbFgtNxGMm2NexWxo9x/2bBuER0BmQK168kkER4K3k0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gEnf9vQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcxZ4UKr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB66606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEB66606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gEnf9vQx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RcxZ4UKr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgJer184041
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yuu4QueJRDk0ija3ekrKStL4rHiHPhZxLi2O9vwmeE8=; b=gEnf9vQx12aDBTF5
	yrj37zkFVateVsaNP1nmWrclXd7+e66p2UuN21RwTd65ufnFQGK54TSn1vo+42WV
	89i/AkWcRCKXJF5F3TxQXbtTpNndt6maLm+cbbdt9KryReaubmLSn5SiSHDeMndz
	Va0ZhgurgdhaFWa4oBEOfus6FN07fOR7PXg6sTsjTZkGxNGww1Mbs6VSxjasa3KK
	enqHjewWj2uUfJla3dM4LGGxoFEIdyfTxk4BuN8z2EI0oeX0pV88cNR7/J3u7gBS
	13Z8xLunjEjBXggX90MSQM2f5+w3hoq1wxs/H3d084SDbUcrdsOWw5pNjgjM7oSE
	lrsNiQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9huu5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:23:53 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-917a04d1cb2so1941906d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792585433; x=1793190233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yuu4QueJRDk0ija3ekrKStL4rHiHPhZxLi2O9vwmeE8=;
        b=RcxZ4UKrFMxc16hCnaxGyFN+7OYH1iVM32N83mSteTDeu5EkVDiFcvFo7Mh8N98V3d
         8UJ4daCERT+DJ820FqQbTxn4Pqawff9XfqYAr+AljVXQW5hMr9FE5PuJmINXFeuc48k4
         KrpD3tZTsIG52rvzGznhsEzJpDwYsb6pXVmrtyby9cGWjedIc+vMHTGMYylVN/0q2hXG
         zqI1Vkiii+uQu1ghLulG9JoKD20cvAu4x2PXugZL8V2tMAeMTcQ7kF1r3K6ZmE0AbV15
         prX2Vjap8HBjh4p7buqJldMZFau9+Gl89B1Jd5y6UsbSCErOV+G748cBJr7Q4xCx3Wkj
         ezeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585433; x=1793190233;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yuu4QueJRDk0ija3ekrKStL4rHiHPhZxLi2O9vwmeE8=;
        b=FTeuwPducTwutzWnUIBfGQpfoOhTVngpv9+4bmLdclBVZMA/npseKPUQE+AU/5nUOZ
         qFSYtJxq4NAmtFZMpx9WFwhy7UZSonKEEjkBgmHGJHd5NEtbA3W7umX335i8PuUBrqsX
         8td2+/PBLSX0aRkWoad/Ljzocplfw++KiINks7bUWYz6+cI6DqD0Zuq9l2B8m94HHyfs
         pDLeToaopru8OTl8hjCGRSRnSlgCHs/qHpTt2BAE92vcn+uo4HPJ5egbDTr7uU4gHRPD
         SjYVkP37h3e9UvjWSMiCsBZ04+L4Tyyg5xsbFQz1TJDVXIU0LZC7K+5zd2OGMRvhW1PT
         8a9w==
X-Gm-Message-State: AFq9FYJezTWhfVOgRcBllGyFi+drg/6oCDDfcmtkjnBLLYF6Vcpu1Ji3
	/x351mWcWtbctR1wMGhB8XUK8RKxX3znidSIlEze7P1rHVEP6CnlZxug/rVNjamIZAWwghUZ7ts
	aPJojU515VwxN9z5L6t2qGZ8wz3RHAtuxSc6bqOLUu9FLJv7FTqNQeioFeseYVAmcPOjq
X-Gm-Gg: AYBFou0L8Mxi3KWsc07CU/RavZVWCZk3qciIweuEplVaS8rz3UDLts/VzU0cLvIKpl7
	ZSUx5m8ib+Fv8vWTa9W6hdm5GqrVrLetxi1JaQKFSM3MPj3bKJtdmryxXX/Yc4DtgKDboXGg+vx
	ozyvCXMk6IZ4fCU38pRLJnUN3sRNFNIO5728hcg+/V855CPklFqbmHZ4I9QLV7ruLYHqsN7KLVN
	5OFa8BURtAckzaU1Cu52d3ShysB3L1s8UrZjs+5IVA7gn4DPvTCa7Lsmmzw1cRmmcPvTqx1NVC/
	Ok/94m1OsAjJmq3rGVzxlWvZ7dfwb+L5Sqnzg196zB/lbv3Sv4KNEvd32hnTuD594JX5VjfUm9w
	HAq22deDM4PFL7dq/YqOJaQ==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr425420485a.5.1792585432522;
        Wed, 21 Oct 2026 05:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr425416385a.5.1792585432004;
        Wed, 21 Oct 2026 05:23:52 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b402f2a8ecsm827827a12.4.2026.10.21.05.23.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:23:50 -0700 (PDT)
Message-ID: <2c748a4d-b416-4f33-a6c7-195ccda6a5ee@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:23:47 +0200
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
Subject: Re: [PATCH v3 1/4] soc: qcom: smem: add IN_PARTITION_RANGE helper
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sarannya S <quic_sarannya@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>,
        Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
References: <20260924-port-smem-v3-0-fbc2ea81a654@redhat.com>
 <20260924-port-smem-v3-1-fbc2ea81a654@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-port-smem-v3-1-fbc2ea81a654@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad8aed9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=WmP_9K7zJC54z-20-kMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX/esubaLvBNhj
 HgnvHyChY+GKvbMGe1duRWddgIqIJAStpilzZFkM3yLVCCN11Aix/e1hCNunN4lorJGRASzZroM
 p70pn6AfWXP7FeD9IdGhqxz5B6dGFSw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OSBTYWx0ZWRfX24jkOcV1aHuQ
 zOIypVxUwXStdRty2ViiikE+HLLExzT/iMORFEwOHGMi7xNOh7pm09OGhrFrZkPxL/iB6bE1ljh
 KA1/ZH5wgvxMQMqbk8hwIHBI/FYt2fzY41zmmCIw2HhFD6g+oKequMJo9DRrZo0vxk4ntUKlWez
 jwem5+zHH0uvVa1KSFa9BfMf5ir3hjel5Xi6r5Hq8XBevvq8pbL3IDDUBbbVjd9udDqeH9qc5gl
 6PtbXfRMs3GVoLTWNNPGwV2YuFGal063GTJrjK9ix/5XDNmAwOXtb7Dj5QcTQYqa6L/po5b26P3
 Fd7H6X2tNmoFEyNLhZLZaVMd6eZZvmOtp65ACFjNa9LNrvGcPay7rpxs8f85Vt1W/2nUdz/7XSr
 XDq8WGqYF4FAxml2X1OpCSh2Rxh1g7JrJjSSV951xpAx9KrZIKhmqIVqugJM3GzBjfXDao4zv84
 QJmOsiDRMaHm6LxPMHA==
X-Proofpoint-GUID: xizbQv0ZbA4Foe3vjbvQYNz1hfdMFuuS
X-Proofpoint-ORIG-GUID: xizbQv0ZbA4Foe3vjbvQYNz1hfdMFuuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210049

On 9/24/26 3:10 PM, Albert Esteve wrote:
> From: Sarannya S <quic_sarannya@oss.qualcomm.com>
> 
> Add IN_PARTITION_RANGE() to test that a pointer lies in [start, end]
> and that pointer + size does not wrap.
> 
> Signed-off-by: Sarannya S <quic_sarannya@oss.qualcomm.com>
> Signed-off-by: Pranav Mahesh Phansalkar <quic_pphansal@oss.qualcomm.com>
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---
>  drivers/soc/qcom/smem.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
> index b5e7bd8c1512..6783a3c533f0 100644
> --- a/drivers/soc/qcom/smem.c
> +++ b/drivers/soc/qcom/smem.c
> @@ -2,6 +2,7 @@
>  /*
>   * Copyright (c) 2015, Sony Mobile Communications AB.
>   * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>   */
>  
>  #include <linux/debugfs.h>
> @@ -88,6 +89,17 @@
>  /* Processor/host identifier for the global partition */
>  #define SMEM_GLOBAL_HOST	0xfffe
>  
> +/* Entry range check
> + * ptr >= start : Checks if ptr is greater than the start of access region
> + * ptr + size >= ptr: Check for integer overflow (On 32bit system where ptr
> + * and size are 32bits, ptr + size can wrap around to be a small integer)
> + * ptr + size <= end: Checks if ptr+size is less than the end of access region
> + */
> +#define IN_PARTITION_RANGE(ptr, size, start, end)		\
> +	(((void *)(ptr) >= (void *)(start)) &&			\
> +	 (((void *)(ptr) + (size)) >= (void *)(ptr)) &&	\
> +	 (((void *)(ptr) + (size)) <= (void *)(end)))

LLM is unhappy about the 32-bit base and suggests this instead:

#define IN_PARTITION_RANGE(ptr, size, start, end)		\
	((void *)(ptr) >= (void *)(start) &&			\
	 (void *)(ptr) <= (void *)(end) &&			\
	 (size) <= (uintptr_t)(end) - (uintptr_t)(ptr))

Konrad
