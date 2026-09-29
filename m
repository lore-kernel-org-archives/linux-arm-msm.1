Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3AC3BBFDD
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674016; cv=none; b=gEpZ+GXb8P6MqAhn0s7AxI0PM9UcjSRVQeOyn+zLiPEC+tFAlPS/oWVBeAzqTNNMH5kOQ/XRHzDl3OnB7LGggNyMm9EVJusyoxYKUnWWhakCSUea4Y3bIYPdxzAAQRbnD5xbSgMhlrip+PbTMvVx7OvFJ0XFfyuaetyaieDxp6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674016; c=relaxed/simple;
	bh=givJ33BNOtM+J0wL94/jJ/fGolDipRI6WMK1BGzv3AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKx6KweXfCdahk3dL3HNdA0IJS9tKgHvWf4vDPJ87Bcycxho8k/YGfKrfHO2hKOqxJiPTrq0/VKS7nMZT9b+iS4W+0ws7cMu0wve/sJsSLhxTOi3NWEOzjaZn1Hq5artc/GiWiXpgGTScO/VRS7KjiWst5Z967YXiTUgc+zYJwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EW9/NG/9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIU8m5w/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EW9/NG/9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIU8m5w/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7ToS43220591
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3b/ztHMtQJ23eJdc28nu0kxz5IQrerAmBtUuXpHPzM=; b=EW9/NG/98ekB9yc7
	vL3dlgyGjRuvN/954K5yHi3qbF+jUwVaPRRKmkFgx/YDXb4stNFTD3ofcvnLiCar
	VUAW+dcvf7190HGRRyP7fYeaKExoKjnM+hFs3skEjRDGWoVtTykldvn0byX9xZEq
	Qvy0+lmqYtTvBWiU950nK6zO1QLIqj98fAvwB7aPiBxmvcBQK0/l5H9d6AyzeQOl
	LwtLIdqu7dBrcNzK5E5OnaLTB0viAcngKzf/zQiiTVVniVCAWtkFEfmOFT2YrBB5
	8fExxRxrQl3EIf5T1CJO0o/nLLNGWEeuxazy/Z0foQM2zfQBFuFZO8XlNIULib8Y
	N3rGfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw23a0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 09:26:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4a68f7cso3343194a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 02:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790674010; x=1791278810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3b/ztHMtQJ23eJdc28nu0kxz5IQrerAmBtUuXpHPzM=;
        b=RIU8m5w/6Lz3PD8F1LjKQfgVjm3Ji7i38A+wDoC2yjeBlf0P1l26I0US8jHa2RNmLp
         d30FKMUH2pqk72bJvNgYhnjkUdIkPv7TBS+Ni0CqYSe3kD9y3xlatfbeS8jC/SgXUDiD
         Oz/11Nw9Rzq4k79eh1DLxwxAUEUEuRVo9INkGEZAlEVYLxLs4wN5PpurSQlWj7jwp+7b
         cttd4uq44WVwYrqGYW14TkRymLHO5e55ygG0QVT05lnxcagpL992nVx2KnF+5ElMFLPL
         2tQABzjXmk3a4uigPrnOwg+H1rohZLii/aQPP1R9epRAVQ9XVObYCACp+i8462TOWbF1
         +5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674010; x=1791278810;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3b/ztHMtQJ23eJdc28nu0kxz5IQrerAmBtUuXpHPzM=;
        b=TOHIv+xouZxHkv2xAoA3pSxeDa/5LguMDCdRz+qohNPKhdTuIyf+WJOe5Y1hjJLoiv
         2q+/R55d/zt3RGD9kTb2qGCydTJmFyQniEx6UGMXZK7nP40DR3VWbu3e+xSWCWnA7DBQ
         k9CdCtbNUhhWwhUCH6GhoKZl+rNHblMfxkFmE9XVA4fV+kVB0QLjrqg/Jyn87UDWurtM
         xEWmkT8fWtd8T7VWjGYHj+4yszJbeLS2QIEeoYkHM68LxM495qFBiHypvB/VCgrEOMbn
         8PXDMdkl8mS3e1mJ7FYZ5c5c7hOlxnIBUh37NIOkVJsG98yWnZAcqogUjKcjsQgyfzt2
         Abcw==
X-Forwarded-Encrypted: i=1; AKwUvBwt3kvix5B70QfRzAkC1bzx9YnjIKUa1u2dGN38iKdj+9aFm7yJE5Al65EUhS2QjgjPATqtPsoWIwGmbz9W@vger.kernel.org
X-Gm-Message-State: AFq9FYIOTyo6IXCwPxjt0vdXed3fLwySBeiriYO/zY/Hg3dxuokRqY8Q
	KdoaieLZ9Oy3ul14UYxHQrYqYaPS+fnseIyZZAzDTsqgTrp2ulgLi+WyGDaUQovhPKEF0ZMDPDl
	CZyt7NUNGIHjHEOVxVspM9SkSCQmwZ/I9fQdORcvPoRHYdTFyydE4e6E7Kq5nNxuhMZGd
X-Gm-Gg: AYBFou1R0b+Arz+8fKepnpbEw5UktIFduEFI+QGQ0M29m7zFkp1o04ennYl5p0AJnVC
	t1HYZXi5HPKCRMpelJ9kcgILUQo8D0LkRhbqI7iypkf32BFJWNebwd5ZO/UI82UA4YQDKBGAnSw
	9HhXy/eXe6ZiHqgM/448bUboffxpe/tLqCzqR6DLdVTFwh5zQrCAh9NqW9mhp+KF/paxNQ5hNuE
	pGQVYlTy4VLhrIIh1ypBE+YLU2wFrLkJXWAgohPohgcv2+Od8nuMZ/Q8QzoBK0/RGVv1gubGDCZ
	tytgYZ6giHP6yybkOFegeNE5qDvr+Y9RIsLc4TIm3jJXs4eQ0+RL8kJ4lKQLyjKnxDMLEA3OUDU
	D4tUMzmXCMGqi2H4PI6fo7c6Zwm0F5r6vysMI3NqCXZTvAUp2ilOeVMVOh41J5Udxz2i4pdRNB7
	yv
X-Received: by 2002:a17:90b:5347:b0:3a2:b038:c931 with SMTP id 98e67ed59e1d1-3a2b038d62dmr3130772a91.40.1790674009564;
        Tue, 29 Sep 2026 02:26:49 -0700 (PDT)
X-Received: by 2002:a17:90b:5347:b0:3a2:b038:c931 with SMTP id 98e67ed59e1d1-3a2b038d62dmr3130761a91.40.1790674009078;
        Tue, 29 Sep 2026 02:26:49 -0700 (PDT)
Received: from [10.149.57.96] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497f2073bsm4511679a91.8.2026.09.29.02.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:26:48 -0700 (PDT)
Message-ID: <138bbe2f-2871-4541-80c9-c7867e1b1481@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:55:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mailbox: qcom-cpucp: read mbox hardware register using
 readq()
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
In-Reply-To: <20260928052940.688105-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb845a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dvwXRZ08jinNhRNPmSsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: jdOCIjBDJDfuD_v8YMylHm15STJtUn7n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNyBTYWx0ZWRfX4BAjywsUoLlb
 BFbuLh+3AvEpDLxqX8TRaNeDvTktFWZS6kC/oQIdWa/M3r9LFtaJOgDrRgdJjj3YcvvffXtndeN
 Z/rX/olGQre9IGe/TsYGnLnq2MkR3lTBYmQUJIJE2jm7ykidI22lEHptsDsjHX64XH04ScECO6c
 8dxkHseOyrgK/yqsIixqtrsVJ3uXJbk6f82tbBhu54HaOI624EQfcWvAd6nbAncEKg9EXe9NURS
 w70Ar987xFt9VoUbqL8CieH2BCE5hGdBr17/KMQjd/mRCsVo26ZXa94IpV0sFn1LtZr5gPacyx3
 fLv1zQSbUb6G/hcmKYp4jGiCD8MsfJdwc+CFdlB8Q3FebMe3E1hBQXsP3OWKIT4O6lJgVvDL1f/
 AecWKMR82FTtuUyoKkU5RSoIa/l5ENv1KGd1YN9yspeV+epBdO2BdiFcDbDJxc7lgHMeCVCNTbs
 TOHRb7lAS0Xhwb4YTaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNyBTYWx0ZWRfX0XF3O/mIW70o
 CfFySHam7qN+VqdvOfJTqxxOwwsdQx0L3vl+q3mVDP1dAFwBkVZlV2YOEShsUL2Dws6ob6ILvH0
 vxIX+1TpefiAi6uFiEeohj4sFU4bVmY=
X-Proofpoint-GUID: jdOCIjBDJDfuD_v8YMylHm15STJtUn7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290037



On 9/28/26 10:59, Sivansh Gupta wrote:
> Mailbox hardware registers are 64 bit wide, but the interrupt handler
> currently reads only 32 bits with readl() at offset 0x4 (upper 32
> bits). This returns an incorrect value, while reading using readq()
> returns the expected value.
> 
> Use readq() to access the 64 bit register and pass the expected value
> to the mailbox client.

Mailbox hardware registers are 64 bit wide, but the interrupt handler
currently reads only 32 bits with readl() at offset 0x4 (upper 32
bits). This results in a masked out value being passed on to the mailbox
clients.

Fix this by using readq instead and pass on the correct value to the
mailbox clients.

^^ seems more appropriate with these minor nits fixed.

Reviewed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

> 
> Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
> ---
> v3:
> - Removed references to an out of tree driver to focus on the incorrect
>    value returned by readl()
>    https://lore.kernel.org/all/93ce8588-7500-45da-9b9a-424c202590cf@oss.qualcomm.com/#t
> 
> v2:
> - Expanded the commit message to explain why this change is required.
> 
>   drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
> index 862e45e8fbd5..0b584d9aad6c 100644
> --- a/drivers/mailbox/qcom-cpucp-mbox.c
> +++ b/drivers/mailbox/qcom-cpucp-mbox.c
> @@ -61,7 +61,7 @@ static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
>   	status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
>   
>   	for_each_set_bit(i, (unsigned long *)&status, cpucp->mbox.num_chans) {
> -		u32 val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i) + APSS_CPUCP_MBOX_CMD_OFF);
> +		u64 val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD(i));
>   		struct mbox_chan *chan = &cpucp->chans[i];
>   		unsigned long flags;
>   

