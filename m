Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A133033E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784697981; cv=none; b=Mlk4QYmg4Xc8Ir6WQznTSKQIJGcxjf/d/VwqTh926DGf6AKX8aQJvWHt4wafhJERI45f5Hb7WGOc6Hb9VgjygTdHwZWq2r/6nENca8UprfJKRjkQhQDnnEcs/03/kx1ywwPuZ1yNDolLxzmgK0nkfZ0U5prGSEwIV9Y+rfaM2UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784697981; c=relaxed/simple;
	bh=p6pMiFPNFRV0q/ClqzcxwbFwjahEhceneLX2wwWlseg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADoUysifv6VMK2fXfKQbfmURyT7wMJj8fj/y0M0AXHk5BrA/FljUqsus5p+MOFVFZw4LcoGad8bi3O2zTN3KdNmEv5PHnLs8OMzCzxulT/ajgIDCUetoPAq/6yTOV5D0MvpXO5jPiEnLVlegoK+KKeEDaoMzrN/JnF3s+caOGs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fayd/dXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PpP6qNH+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fayd/dXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PpP6qNH+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53YJf3882917
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XrelDr0RdHMSFDyRQ6txtRLTxoU70OQ8dC7HYaNvxX4=; b=fayd/dXBqsBnkEEC
	mZr5Lg12Q3wn1Ivzjkczse94n9fcFsl1yPlfpSOklxWd2QxzFI0vrToW2Q4URlc0
	R6QFBNRjIplMKh8pzMD4bv+gOnPdA9hNE+E5FVBiYpy/aYOH88Wt4kb09RBAP5ek
	sCoCw5CQ9xeHS4GT973hOpCuFSn+Dqs30h2mU9rd7yDwAdtTR0kEt6l/g+/scY0p
	xAUCe3BRR0xXrwY06VVQpYGTegYASSC7omZPmljBM4BkNEn35e0m0sgtk1YJcy/U
	YoBILXlsjbIYaCSKqutQqTbzqq7tml2B8tRXaVmY2ZKuMOJDczRqT4g980HoSY3r
	5lAy+g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn0der-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 05:26:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38827cee19eso13160516a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 22:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784697978; x=1785302778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XrelDr0RdHMSFDyRQ6txtRLTxoU70OQ8dC7HYaNvxX4=;
        b=PpP6qNH+OsMzBTzhFVth/GMiqHMPlno4fcX4XlP9A6IHhHR44iMrW/w4NEBvU1V83H
         nTmIRaDqk257oMnDt+29NkNLJtqMSbXd18MJAQXIpd9YGj4xHI4N0wWwxjghTHlDu3OV
         bxxhXFUgdahZWyRaMdHd63tyFbqdnXWpBgSrA0W5UcSbs21a7L72jjbg9GSuoef3I3nK
         4iG8uZwAmDaOaQEYuHfJHGb37xwG7NQdeROVnVecPrW7XwZwbOaZ907wooUSY43ZcuBG
         rEdn0GUAq1XtePKlL/sr0gREYrbILwSbwepGjm7lJ+jjQAeAdZHIpD3HqGbZEe6wLNC6
         VwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784697978; x=1785302778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XrelDr0RdHMSFDyRQ6txtRLTxoU70OQ8dC7HYaNvxX4=;
        b=YzJvToM/e+nSCt1WzeqToBabLlVWNEsSUSQ4S8UhzGfnVhhijZDBpZu/1tcAEkef+O
         ty3oAH1LSeF8m1Soe3tlpk7OuQV3O3vGmb2PGRe5/B2wzDOqF1dLwcGwXxdhqmTfb/K5
         2cWoM7ZRuasi6aHG8VdjMloXwUPNkzaq9luOrq/pNv81QQwcCGdFElhSIz1F8gGMwlQp
         O8acixURqSEJobcfhmYDY9Q8tsFuIjllmFolRiP6/z/y8vuAxo1Zpj4AsqIQ8aekmjJg
         Kg6mK9VsxKXRSATppHW7s5E8lTDj9n0oqwdmPZwq1CZ1TQzU9WoWASxnDNIC8GZwNSqJ
         07Pw==
X-Forwarded-Encrypted: i=1; AHgh+RoW3trWNJftE/FpPJJAiXpGQv9WfXRYLsXRID81peeiBiXXIpyTvCxkaL7Qu5nrusQ2DghqwoCsKv61A7P3@vger.kernel.org
X-Gm-Message-State: AOJu0YyeBf9oOutuSuUKvSNgUYzwEjB7UKMXDpGadntK6q3gZ1QInGuM
	D4VDJ2IvXa1Li8AKBQjFRrwWjZdNz4je2YBhsAFgawA2/k3gfmIlFB/1V0pggSgciOgzjaVdQv4
	IUYg3BZPsFUOcUzaLKpthWRS1bvnf+b3VNI22XUPayCuAWpzw+ushdRpYLTbO2bS4C6XY
X-Gm-Gg: AR+sD1250tSfNEORbj/H5HN+X8GgcinSk30/u63f5EH9TWqon7ek9fQd8N88CrhTSbu
	iip9upEWGHEZLOYkh+z+14ZI2BDXCDdRmNW+afXlk1Xx4XFj7rSfZEd3u5i8cWb7oqhKbhdWCpj
	m48Ic3bgn4tXQrBckyzklsdOpaxTeozRSe6gEon5xP5h3MKkn3NnFSvZiFZyA4Gy50OCVNoZ282
	IlCzSh5gDnUujahRow/DfXhX189dabB71OQWcn5b02C0j2nWiBgcRjQzEfIKvh5r61eGJxFsTkc
	A8jzZoMdZhrhMKypLuOU3wWJP5OU0fUR93ixJLgv6WNkdnirwm8iywEJjAiWIIiLhPsyjBMpanw
	EbDAkoPL+RsjRuYbj9Y6ukPS5PRXshRzabmU=
X-Received: by 2002:a17:903:19c5:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2cf348f88abmr242816145ad.16.1784697977981;
        Tue, 21 Jul 2026 22:26:17 -0700 (PDT)
X-Received: by 2002:a17:903:19c5:b0:2c0:db23:4c4 with SMTP id d9443c01a7336-2cf348f88abmr242815605ad.16.1784697977038;
        Tue, 21 Jul 2026 22:26:17 -0700 (PDT)
Received: from [10.217.219.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm5441955eec.30.2026.07.21.22.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 22:26:16 -0700 (PDT)
Message-ID: <2b025902-8879-4426-bc81-484fd9553aa2@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:56:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: qcom-geni: Add dynamic transfer timeout based
 on transfer length and frequency
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260720-master-v6-0-671261b05c61@oss.qualcomm.com>
 <20260720-master-v6-2-671261b05c61@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260720-master-v6-2-671261b05c61@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60547b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=jYUsI6dgtjGZWMlStScA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: KkgjbTgcJe6x026tO4lT4PtudCGu4oKS
X-Proofpoint-ORIG-GUID: KkgjbTgcJe6x026tO4lT4PtudCGu4oKS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA0NyBTYWx0ZWRfX6dIDiv6+/YZv
 WdX1aKQqMwndksg7uAXZPWLlx+2l080btlYVS59hT47Gh3vhE+CoOHcjU9vR1Ia/4casNq+J7zL
 mHvdXYWTL323lzb1UBGQsrc+OB7xoR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA0NyBTYWx0ZWRfX0OYSZdJ/Ni6+
 nVW9FX627hZ/9I/m6vCgTYIHraKWYx+lzAAs0Uvjo8+2mnkb1l5oh20ixcDFvrP2bSmSaP8PRBq
 ddbQQnvKG7DbjFWE0CK4szpPoiXIEAF6wGx43twSIrNoETWLLi+oPQbr7uIAWXvWP/7zBSmTbjz
 3moNCrY/OuhMC4pwAyem7Lc72H0e2B28FmiaL+akt3ximHg+q2SuNAM1YfNDVKdNyMW/ZECXpIY
 oSZ2cvzRkft70pKWr5W77yi8kTp6Gm2a9aYomPCCa/DhzcJOxl5GW7hwArqhJ4eAvo1FUEp4e5j
 Vx5qI91wH0VzBGfM6U/SF2j8d1aKhRdxbaDQY+Aub7hvh4s7ZS6xXh0PiovQlnSfWQK8rmH0XEP
 f08cJ6aC2WYXXcLnvCfBThFbn7l/O6OueGKDn6hwpXA4dSGonYN0mRdEXDLSTUzYIJxwBDF1e3d
 b4Rs/u9VUNU/fgrJnUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220047



On 7/20/2026 5:11 PM, Aniket Randive wrote:
[...]

> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 37 +++++++++++++++++++++++++++++--------
>   1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 96dbf04138be..d6fab3aa8468 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -74,9 +74,14 @@ enum geni_i2c_err_code {
>   #define PACKING_BYTES_PW	4
>   
>   #define ABORT_TIMEOUT		HZ
> -#define XFER_TIMEOUT		HZ
>   #define RST_TIMEOUT		HZ
>   
> +/* 9 bits per byte (8 data + 1 ACK), 10x safety margin */
> +#define I2C_TIMEOUT_SAFETY_COEFFICIENT	10
> +
> +/* 300ms floor: budget for clock stretching; slave may hold SCL low indefinitely */
> +#define I2C_TIMEOUT_MIN_USEC		300000
> +
Let other expert suggest if pass from DTSI or hardcode here. because 
this let all other controller drivers to make change. I request to 
conclude on discussion, i kept my point in earlier patch.
>   struct geni_i2c_desc {
>   	bool no_dma_support;
>   	unsigned int tx_fifo_depth;
> @@ -471,7 +476,9 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   	}
>   
>   	cur = gi2c->cur;
> -	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +	i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, len,
> +			   I2C_TIMEOUT_SAFETY_COEFFICIENT, I2C_TIMEOUT_MIN_USEC);
> +	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
>   	if (!time_left)
>   		geni_i2c_abort_xfer(gi2c);
>   
> @@ -513,7 +520,9 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
>   		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
>   
>   	cur = gi2c->cur;
> -	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
> +	i2c_update_timeout(&gi2c->adap, gi2c->clk_freq_out, len,
> +			   I2C_TIMEOUT_SAFETY_COEFFICIENT, I2C_TIMEOUT_MIN_USEC);
Expect some discussion or conclusion from other experts if need to hard 
code these coefficient or pass from DTSI. if core can read like existing 
i2c_parse_fw_timings(), it would become generic to every i2c adapter driver.
> +	time_left = wait_for_completion_timeout(&gi2c->done, gi2c->adap.timeout);
>   	if (!time_left)
>   		geni_i2c_abort_xfer(gi2c);
>   [...]
