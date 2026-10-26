Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793040955;
	b=z/VogzEWhsedUYP8WEie5d85atVprmkcQzKYOmqYh7AHQz+9GyvThx3S8QddhvRlDSRa
	 fx1O3ASXjFTwiS/9UpRvw/WN5SpJtdjsaYYAssZBL7nM+W29xBxFmOd5PHbgqwAyfBJ3t
	 2XozWWc0XWbaQ3t3G1W3ADdLMB26wMeovXuVZfPdUOyHbYxY4zi+ipKlGFw9wA8X81zUk
	 MJtYJS5Iwd41yrWgWADfsdcuub7TLuSLHZLZYoAWJsbFzhyASdaRvdGFD2QkBHsAtlqyL
	 +FBjev0n4coiTIJbnhBwJ767buoI+yJozUde/CGEJzHhHdQwypEd5fB0fLFQ7sSqGtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793040955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xEsMpsQ55jhFoaZnvSydqUSOdqSiWLsTJYnvaYwHwnI=;
	b=mFqkkbsYMH+RphmLauMm6mkcdCbL5PBJ1AHS6W1ptGTiun9ulj9Y3PetQ1bs6LeekBFA
	 xHAGicpf3rmV3izcHFwgMj/rlZrgaVxTgDbxBZXb2sapjYsTVj2eaIMhXmlE06qT4fbok
	 TJ+ys4POzlVNvhsIJTmHrWpSS5NVG2N0AlIGwwtY/Bw9dUpOn/H+GhnblaWlWLLx6xUzQ
	 KEOzrUsAbWPmyrrktziWZYQ3q8nX23vTIKFOJatNKIML5jSnodF9sxaZEPHonJLJbCT7m
	 J7HsAggB8rM3yOgvYuoroOW7Nwmuab7TJrGUCySh0UlacXS9yZRE4ELGPg8B0/szL+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8CcWGjO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gppPlZ5C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB14606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BB14606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g8CcWGjO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gppPlZ5C
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIo4jc979669
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:55:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xEsMpsQ55jhFoaZnvSydqUSOdqSiWLsTJYnvaYwHwnI=; b=g8CcWGjOODJf0ZcM
	rWkRfR8bRcCQ87JhB8IasVUfx/x7ASY+14OCCcYts0SlZ4cwSV67RCV8ify1x8fP
	69D2U/ApSx52D7eAETPaKBo+7mJNyWbyp8ubAnAok7RNOKoUKzyfp/z/hfj6yRgg
	UsfArqARmzljpTmnNvoQQ6V2WKGovw2H4bbGavm+CLr6GFQDTr5wC5qpVC3cdaDG
	YFd4lZRXJzu7YX5VALBTVPYGLcVO8l/tRSrdayKE0+/B6f9pCMLMygyFMN+7ur1H
	M+BLRguXQrcLi5/tOVNSkYoJR472vf/n7C8QQqehf4+HkIJchzQ9MaoHKTkStHgV
	cuimwg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpuxcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 18:55:53 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so2439217eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793040953; x=1793645753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xEsMpsQ55jhFoaZnvSydqUSOdqSiWLsTJYnvaYwHwnI=;
        b=gppPlZ5CtlJAmB3Aex2hWqbpd0eZHpNin2NXBW9FMwXs57fsHRR2btBBVfZpugUu/D
         UoGMvBRWJekNBh2KDDU//KhAElG/HkaQHdjwlu5oxJ8vnZSB/5o2VsdgH6rtTqXC55/0
         uXN3lGXtTB8rnu3W4xnF+Vxtd/DtTaWWMbFTdfyULpbjabE4pM3tJ+lMN+OPUqWBYhRO
         zeUnRavRH4PetasOHT2tx8SynDuCZnWsDebHJ0oyY7ShkoBFtiHTPFh+5I09Sr0fgILu
         NN40bH5yirb/EAkJIUiosTHjxXsSjmMuT7Xzj7FD8g+IQ1AqCfh7vdNRije4ySbVn+D3
         gq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793040953; x=1793645753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xEsMpsQ55jhFoaZnvSydqUSOdqSiWLsTJYnvaYwHwnI=;
        b=BA2r6pGs7y3dlY+YEAZSyutdqRd2tFi/o/rvOf5TvNg0y7gIh6aJJBrgGLuWunOs5d
         cSAzv96y2uLWUcP2yuJvv1G8HzraT7U/7IhFArrMdMuW5v7LQe3OUauDCPAjT8XUdpv9
         DfO784dJreBScRvxvFnBwYTUUi7v5GIEpI/g7nPvWWZh6FUz308r38adzjL/0u48W8D0
         qWqg5gMbaMGtwT5D044Y57AooAP/djh2rOBqujrcIstnUFSGEL2rkMsDrLcHOG4v08Km
         YNj5OjB0T8r6cFWg8nfoNam8VOLvesI0Cx4XKiDTvmr5+ydYBQPtuhtUBzlks4Ew+N5k
         LZaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwecrWNXAJ7R2CanCl4VMDCoq1I/cYT0N6I8bL9OB3IzcX1nsgUd6ZAUyUVZnsXeoBEM7TiEM7zetb29YVg@vger.kernel.org
X-Gm-Message-State: AFq9FYLjm5NyMawMw8BweJy9Jy/5uHkrDMScYSJKG8YD19VsgvGRvpOW
	JdIlW44GjH3IzTH02fEmhYYPBEGLw8GaosFPN6OVQ33mIK9Z4LbrapVvFnkGM6gIpRnOKWGFT1V
	7J2Ag3VxuExoDox+7p9IMAVCwh4IYHKYHJT9M1PCVMrJw++V4eYJAjeQloFJYS6ci/F44
X-Gm-Gg: AYBFou3TdMHZ1OznvRv0naXmSUTKGx0FsHjXX8mPJHt0lsNdXVx84+O2BKIop5wg6rK
	8RVcW6qdne65CsispIGW+y8huUus6Nojy6i9yK1mfwybAC+OMniq2EkOGuAqZIgm9e9IlhMF/B2
	CBDcaF+qL8bj/WxxpDnRBKPlLNZTNWVgF4JXawhyewpwUxJe3dRiVobcG4HryTr1e7V6oZAGpJa
	b5Ivfo/mPXaFIEz6Ws56W51YyAauOOiF8Ob9oP31OVWusOAneVXAZxPRLpJStGLmAknF5+qx5sO
	EQJxBREK/OVI25UvIL5bVxeyCXvWbpuGhIkO1+4EzyxF6CYV0+BHyYQ8RDRQGSHX+Oa3+Th+htN
	QtrdiJ4HRskLPvdlh5DFgaRfWv4k/ip7CcQ==
X-Received: by 2002:a05:693c:2517:b0:36a:1104:5fb5 with SMTP id 5a478bee46e88-36a110467acmr156827eec.1.1793040953003;
        Mon, 26 Oct 2026 11:55:53 -0700 (PDT)
X-Received: by 2002:a05:693c:2517:b0:36a:1104:5fb5 with SMTP id 5a478bee46e88-36a110467acmr156797eec.1.1793040952484;
        Mon, 26 Oct 2026 11:55:52 -0700 (PDT)
Received: from [192.168.1.2] ([106.222.233.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm25032317eec.21.2026.10.26.11.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:55:50 -0700 (PDT)
Message-ID: <ee64a2df-db9b-4768-965a-bb95af55a6f7@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 00:25:43 +0530
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
Subject: Re: [PATCH 2/2] i2c: qcom-geni: Add panic notifier to prevent
 transfers during panic
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260818-add-shutdown-and-panic-notifier-for-i2c-v1-0-9f31b5fae5f6@oss.qualcomm.com>
 <20260818-add-shutdown-and-panic-notifier-for-i2c-v1-2-9f31b5fae5f6@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260818-add-shutdown-and-panic-notifier-for-i2c-v1-2-9f31b5fae5f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA3NSBTYWx0ZWRfX0sGHsECW8r6G
 ad4EKPowGGz6IBdrBTfsJimz79eXKA/BO2ayfIzL1kzWt1fyGKiTwY4UaDw7aK8N0xLJ+crtV84
 2NH81wOY+PP9D2KmsYJPyyFTxkgV3GA=
X-Proofpoint-GUID: yf4femmaqCIxOIFtY1rYdA1dtoGGuoQP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA3NSBTYWx0ZWRfX+hq16EusLcYC
 sZHLI5InAJk8gn/ch7zlKhE55xMwc4vtbb7gOXvThPePHVajS54kaAOR79cx9i6EXngXY9+eqNx
 mBqb/xQx5ncYnJqM7ucWgya/4brNUeFriiwRZNQIdpacKbZI4EiNnwpe8qxg7AMtLwkfWr3Zz+w
 3qfSb3obABJbrm/MtIDQmyCklIh2ftUesMjmHOmxDeG8FND9JPIQjyhY1A2UWrL6vSXFaAmdcCE
 YUi4zNeuEI95yJrBpIt8UtJQVxJJI9H8JGqRsuuOc2TJFurPIzALs53uE5mnFKI21GrflCP6hTU
 G9yT3Jy2Zg8l7s15PFDNXTNVegQPAqRlhybPUk2IdkBTdCrG0szlYXGamAuf4XLa9gGZE/Eh9RD
 FzY5KqHfvL1t3TuQpDg7X3cF+RToBu6xFMysp4iMdvF0UmtW36FRv4kxKMgSUaBv4EJ9st9Kl+x
 EkdbF0H6PyI0eYL3jJA==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adfa239 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=5/Y9Gi2N1OwmQbPtUd2E/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=fx1oF1ougfxQs4UP-bwA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: yf4femmaqCIxOIFtY1rYdA1dtoGGuoQP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260075



On 8/18/2026 10:31 AM, Praveen Talari wrote:

> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 10c6a4b0b825..2f8237c232e1 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c

[...]
>   
> +static int geni_i2c_panic_notifier(struct notifier_block *nb,
> +				   unsigned long action, void *data)
> +{
> +	struct geni_i2c_dev *gi2c = container_of(nb, struct geni_i2c_dev, panic_nb);
> +
> +	/* Make client i2c transfers start failing */
> +	i2c_mark_adapter_suspended(&gi2c->adap);
> +
Duplicate/Double  call - i2c_mark_adapter_suspended() already called 
within geni_i2c_quiesce().

> +	geni_i2c_quiesce(gi2c);
> +
> +	return NOTIFY_OK;
> +}
> +
[...]
