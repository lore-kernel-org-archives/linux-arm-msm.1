Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252186;
	b=iJ66kLmyJHeLcMW4q9oV5w1H5V/J/nf/QyGv+Oof93eFsiaBb3iMHJhc2OFxCthGzzWH
	 gpUOIrouz3mP+WAS+vWb9JmnPFoYd2EVWRzAO5MhjavPOGErTCeHpZNiPNnD/tLsNU2YZ
	 J0Ig/QlF1QVI+L8qe5gnY8Z1qHODe4OwK3winiBLhKDi8kdHw/ta45MTlncjUv4WKX8uU
	 VMYGdzJtSVFF2MtmHHSimUE2mEwALv0LqMqnzXyXk6F/RdD5gUo/kYI46YNDmHmO2w2m1
	 tsudznGFkUvnjiFSmbyopxNakQiEoFjntmGZCEiGlhADQGQUBBZ3oKDvXtRXLWBda+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252186;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=;
	b=UN+Z8/L0MNJcaLciEDQDu4gbzzqIDHutuTOMIbGOQS6QUiWht1GwS5xjHqTt7T1tPWKd
	 nBRjgtdRISQNyvYiu8WIRx90WXJyVit18NMuzWaXQbN6wadVnuTRAweImCT67xDBmx/fq
	 TgsZ15GqcK13bLD0kr5VFS2boegYLB96+tsga9TcmmGFfdjJastiHYeTK8qnGeXXSrIVH
	 XA+DQxAc9joyf13AEdLq98Q3AwjpdRwm44cOcAEa2VBUIssPDg1VtInY6uAEEX988VUse
	 HE2QAgx/cN6BmV+8eQHhy1mzEE3kbcqptEAUcFX+ugEuAnTA9DOyIgse49mZVdYFQug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLVwEfMa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MA/TZZpq";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E5D606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 05:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54E5D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLVwEfMa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MA/TZZpq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H5MZ3282363
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 05:36:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=; b=TLVwEfMakAs6PB4Q
	p9p3OujGCJ2pTjhJYLMjThVakBXfVBcBUHHCy1THoDddEqOJesE7CN69fBoFkeIa
	utLbGQEOhzG8uZ18aQ5WuHjbypBgkh7lXRrHJaaZmDLdn77jgBRLjgLerz2JLRlI
	BnzmvcYd3dqFJRetHukHfuFeI7HvFWnwxKJ51DquEo4e4/oQEX77A0JDHnMvCmyP
	67ax6qNdZ0JQ9tZDSJnabSUsWjMgFgudUjvr41SrhSb95Jhj5tKytWUAJTEgZRRR
	46RTKsEfwE8pRGfqUCJKkiKts9vtglLOHFc6ALYxOqNeXL9nFYNwlZtg3IuCxgOa
	6ulRog==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpt1wm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 05:36:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso15925385ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 22:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252184; x=1793856984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=;
        b=MA/TZZpqTudMbtbdd74dbNcHJ3IUJh1o/PXKrfM9TFxKGOA/iqq1M4eOR/4Ozmh4nS
         2RleXoaWFFz2Z8lHt/Gcp7PgtsRRhV20BWrERgduQTuTdKE8b49C0QzDR+JySJXPWvUq
         HlXgmoxSleYGrBq24NM7EAlUL4r/f46sY4MyE2hv/hW6T+ETFYxWnOYnkvU3WPsxToRt
         2KwKTiI4LuJF3CaZwASBxYtaptdI+2srKoccAtCH8vG6oWlXr8BCzVURocTPYFVVmmkp
         2r9B/ZNcDbIaefCW/5Di445Qdz10ii0V2yN5QYG7oaGYrTqcdmg5fHMJXQHTMtClU1Hh
         yunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252184; x=1793856984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9rrk0DoqOXK6wTcBk254IiD4um5GCM7sPdSiLC3uULQ=;
        b=vW2ZSjyXDAoEvUKrsgYv9INsNtcjIXVVHrAsOM47mLVZREz7eeydAJ4rmv7OqnoLai
         Gcs8qu8fqDqGzicd2HVEjGwDHTbolw9oQxL8pttOzKM3snfwFRu8zplK3Apr+ZBxTb0Z
         KTvNIq0xfFQVw2Hb7NOwvXrSr0OdKWAtoOU6kGQY62ah9nYqSftLcB86026nHen1HUXX
         +q1Hr7w3bsMC+iALK0m7cDTBzmghJBx2D6rEPhhz+ltGQaJxgkT3odyzKD/rQcKyyj9N
         +G1h61nkFiUpg3v2zN22TBoWQxbVorGHYWShLRUtZEySTrcv3gsGLwT6a/lW+Q04Q5Vm
         +qmA==
X-Forwarded-Encrypted: i=1; AKwUvBxUGxuwixJovAIh2ycGxAX+WMvBOFNoyaamHDSp5OrfuXbi1ndso6kx0ffwjOC36Eh2J5FLrn2O5tKVeCAd@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2Do5mNosi7rfTh7a8v2UoDNqlFm2owlWJH4UwfuvaxRcP0r2W
	EcibhloXUaPMHTEBqI3SBl6gqTSr7QP1WhlEQyWsBmbgxbTuRSQzGJVD+rn2vi5K2ECZxICtzZ2
	LpcAVBglaA3A8ykmEUuGe+075zTiEkpL9ZfZ7SdLr4fOB20VExjG5QH9SRKW15zue2o1K
X-Gm-Gg: AYBFou1QjNHWR5bC5JiGwNZmoKzb+HTbi+vQJinMwQdA64PTHPXvocAQp8bV05/7aNQ
	0nilN0zBvkaHNNzjEWjhPjG7uPBYvTIVectZ9G3R2vjVxYi+aKRC9OviOiDSy6tyPsUA9Fu1lep
	t0gcY6G5OntyfEK2xt8XCqR+KFG3aE2PqSUzcUd+rJlC54o1/B/mv9HNEPkuD4DRaPhXCDEyfyv
	Ayn0y5fjPJatCGoZm+99SIEbMVwneHXJVcsmD7E8tR1717rZ92G03cRKAy64PwCNLb8VMChqZg2
	zLNirKpu9k2EgB3yVK5qoIMxyhsnZOhhwZ/RGfhiV79Uj0Sg0kYDqEjCOOORldK8rM0kb24jFi7
	c3AKQ9RFDRbt79ZtCDwKJdzk9rTTVFJzhh2lkiUuMGf34FJM6FLKqwtfFZiCpcLQy3vPJCH1hsB
	IHw7CXWg==
X-Received: by 2002:a17:903:380b:b0:2e9:9c65:1aff with SMTP id d9443c01a7336-2eb0041ee21mr40133615ad.45.1793252183688;
        Wed, 28 Oct 2026 22:36:23 -0700 (PDT)
X-Received: by 2002:a17:903:380b:b0:2e9:9c65:1aff with SMTP id d9443c01a7336-2eb0041ee21mr40133445ad.45.1793252183141;
        Wed, 28 Oct 2026 22:36:23 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c3d17csm29267465ad.53.2026.10.28.22.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 22:36:22 -0700 (PDT)
Message-ID: <84e53a4b-5ea1-430c-90ce-09d98948c8de@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 11:06:17 +0530
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
Subject: Re: [PATCH] i2c: qcom-geni: fix double free of the DMA bounce buffer
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Akash Asthana
 <akashast@codeaurora.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-i2c@vger.kernel.org>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20261028153353.69651-2-fourier.thomas@gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261028153353.69651-2-fourier.thomas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX0OQ6tVyJprtM
 ffPkKhYNffgpioiVtfbqAsWU3AbyXN9YnVEzmQQfKBEOC5OrfGTTdexta3rAvmedLUKFwhonITK
 QudHo7M+b71G9p833YjBqDVzNblRSzmQlfjAtF1LUNgzeXJtr197a7tlfo0Ou8jJYoB/ypbCiL6
 9+DCTUt5LafaPXjCGmJ7i0Z3uj3jlqJe3YsveizZfPhbcyFUQM6J7gZXymLM73cic5DiZdhvS55
 pJW45puB8s8LLm3jOCFMQ5HSzYdYj6QDY+1t0Y1uWyBY3W6e/XmDmBWyiWZsj0smVPpxtlWsC2x
 m0r4zBniV1cFFIlC5ICpjMwycQ/zYintwW5BripqhOio2kMjaL9ryoY5wwR2TH0zyjDIh088sB9
 Q7OOo1CuwK5DE3o2tOSRxMaN3G48CzDKygeBXTtziTkvnH3bSYBYBL5LQQGB3ZOusjdfdzckamt
 m2b/ECW2JWUDzf5xz/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX1RRJT0idO9Bp
 ACiNv/NbnqsBNkBRcSn4UC7MqsaTP0Od3k12mn532mT5vzSjCAhRiVk6UaXklrHFbjo8fSk6jAQ
 HvbrHT2iK7nTgqEXsRzRvFSjjFT5fCY=
X-Proofpoint-ORIG-GUID: fqhF4bFvN2CA_4smFE6lfkSpf03M4h49
X-Proofpoint-GUID: fqhF4bFvN2CA_4smFE6lfkSpf03M4h49
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae2db59 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=5U0EVFohHyNS2EaXvY4A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290021



On 10/28/2026 9:03 PM, Thomas Fourier wrote:
> geni_i2c_{rx,tx}_msg_cleanup() release gi2c->dma_buf through
> i2c_put_dma_safe_msg_buf(), which kfree()s the bounce buffer when the
> message buffer is not DMA safe, but leave the pointer set. gi2c->dma_buf
> is only updated when the DMA setup in geni_i2c_{rx,tx}_one_msg()
> succeeds. If the setup fails for a later message, the function clears
> only its local copy, so the cleanup helper sees the stale pointer from
> the previous transfer, unmaps it again and frees it a second time.
> 
> Clear gi2c->dma_buf once it has been released.
> 
> This bug was found statically and compile-tested only.
> 
> Fixes: 357ee8841d0b ("i2c: qcom-geni: Store DMA mapping data in geni_i2c_dev struct")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
