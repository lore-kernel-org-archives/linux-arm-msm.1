Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702681;
	b=J312+3qkNUUxOt5J5C/sTOx1p2m4RxB2wEdS4VZAww19zxGfMwQlxMeaw+TR7LzSt1XY
	 An3d9PnsBGjPx8Q1VkcdeeBPGDT6n2cYM9nsu/u7FtFq8vVDoEbbdlyP/PMYXK28W6DVp
	 Xa6RMaE7P3O21fn4YiOJldxcVZGa+Qplgj61I9KSWF9oFrchmTvl2rLvl3Q8NKoLLOMIw
	 wBePq4pdjlesn9MkoRf/9ei8oP5CgfbZ/xztoFLXqqaEH57BO16tS99VXMk+ih25W+OLz
	 1o+xIFsBwOYRxkWEYDugsDniexFwiX6y3J4Bc2Ga5kg8X5Zo5BtyQ4hpH5L9RYIhWYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=;
	b=VdnnpsbufQDo1dTVFqe9ybeH7YThOtkgz0Q46JVpaMyoCisSv4wjUt3VoID+/6udBRb4
	 qKz0cG3NTnCwUnQV/oRcDPJxZ6WvD+aU+ErJF68JO6cXHEZrvak+0cO2+lEw4qYWCU8Pw
	 FAR+7PF+zeRNFcKbrZFLdnQnSlGkR13Hwfmqu2H1qshsE/maeHM4poOLZrKWn13LF6vV1
	 xVsh3lCh+KN79QpM41s1WZenQIahMdb/No48uxOCcLVCgpmFZPCB4IlH6uFZh0BBsDr2y
	 9TZGT2WUxqmg7sTwaCure6cX1hTDnByKX8GP9D3vESeCP181AldAbakInrGGePnr/Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dv+1M6Y8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZhsBkh9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F314606BF97
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F314606BF97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dv+1M6Y8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eZhsBkh9
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ABX4Q2002721
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 10:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=; b=Dv+1M6Y8oPnp7pGN
	xv3vplmWBRqQZoDov8Gmv2RcoelY6YFKXuIQxjoWRLHxQRybtILGIRPc+TDLzPo9
	YSMSmuBamhxMjvRv1vKDlgpZ9nrfE/X2yvp5+iGFXNl/K/etC+Yu+Rl5FaEQc0Lo
	WV/Ksj/5fDSwIL1boFCAc1jMP7JdmtHzO5Z9pYdz/Gq7b7s7VXF04zaFXLCNJ21j
	euEuz74Gi0UYeH2Lu5V1F3mFLh4mtS7Qq/XjpgZdx6n15FEiVnAmZMc2y5kx2hXi
	9Ex4s7e6uPtpOqwjZ8TMpXbb3/5LhhFlRIsQAHFnCr6hl7eI3kily02PSEvrpHTN
	A2Kg0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycsm8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:44:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e8ad8c5f80so66163205ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793702679; x=1794307479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=;
        b=eZhsBkh9pZcqiCmMX9B0WtgvFwwrhbXfZBU6W3cpqriBZ6tLVpPSkmOIVSO+5x5w/2
         rEAOEfMAu1vObsDVgXv8h8QZuBcYLq3U799TUROlLQufMEf4ang7fgVc2OzHXBg6d2/q
         XFWAe8Bmcp1edRP5EnoWmWIPDzZ1Pt2hiz0hjLOnD7+tKHrZxoOFf9pgd/p8DbvHQ8wb
         Iy3iunDJBcC0UNK4fmlT5uLB1O121YVAhFvwelnhFOTgbbieXQ3fiM1vs2yqNEmvYJXF
         Gv7ztZ6xGZq7Z61RCMEFU8uNXKZ4tkEChKNZFdjhcaaRSVTyqIsMr2gqrsNJv0juJmK9
         as5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702679; x=1794307479;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OUMpP78XK0QBfxNlzG054RC9Nn7KQKdmJG3l5IpB0I=;
        b=uvapl9ne9HAT/AvvgwCrgcnlU3wnTrU2IJQ9QlRtg6/oc/L0tu9LeXq/GO7qH0/m9t
         /Eb0ITc3fmQqwkU50QbX9T1aLZHuRBzUD8ut/mgx4VHzVL6FC3dLZZYneRWbzMjAmr6U
         jkJAdzdF8BlFNREzN3dCwTtUl8QrQ4oMkfZMu+uHvdT67i7oFTUBZ5ckkxEezOyGj1Ia
         MG1p+pb4l7b52gFSHQ8K21fXX97rF7bVpp25uSVnyDyLUZgIAkp+gfKVec4xV46eU0d3
         e6t4NLbwzmoCBo/IihkYjakNJ6c/L9yTDcf5ABV83+RFM4Ej5dT3maQNBejiwyd8sQxR
         lhRg==
X-Forwarded-Encrypted: i=1; AKwUvBwen+v1A5Ml7qkmpm7w1SPnbhe4BuqZStoHHhAsLFp0CZeNXWQDX2c/DRf2adq2jlPHD5qyTWwTcTUozPUK@vger.kernel.org
X-Gm-Message-State: APuU4Z8n7e4wHiFg5ZDR3hS9xhKt9y3wSCe+7TlwiaLP3RptUNNllpsk
	WYDktAez6sngxyHx238AY7RLXFNAbwr2uGA7GZj4waLIjIWNzBFbdwqRf+zgji20TdGUvHoPW2k
	LjFSm6Od0NLLoNaFtUzaHrsuRcNOYPVAMcsBpFeFhemgvK6I/YwYVQ7Yud3hZqvn/Lrw+
X-Gm-Gg: AYBFou1ofu20en0LKB0V8Bl9xwogDkTZNm8uLBbT/gTdVkLozxVkc4z9NV09wea/hGP
	l337b1tvps+U98Wt05L5f7MGxrmpFpzdSLjeXdQk5EFYpsgAT3y/mBbKwu/GX8eXz8X/QAsVeXr
	RXbN3zoCSZbMp5XEMsUqcpz3oDAf2c2pkNx4096AofZ3GDjyUBJBxgnvg3AnsJXD5CKn0uWB/p6
	mg419EqBHhFhM2T/NMO3jDJ3FGCYTCm5YCMYIP1CsiE1G6/JfDMi5NvG0b79LK6y2e4aRz8+h00
	NnAc5Sc/c8lRPC6neJMZV5+12y7oosMSbMJm+Xvfs8YO3oktNHLBezrhJqLHZox1AobZ1uIEfW6
	FjWKdiK2bw1cc3pjOcWyeQjZuDuo+RCE67SWM+gRAordGZVcBe608vsaKprbq4S02cL+I1P5Neu
	fc51Lt4Q==
X-Received: by 2002:a17:90b:3b85:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3ae897e4182mr10616878a91.56.1793702678727;
        Tue, 03 Nov 2026 02:44:38 -0800 (PST)
X-Received: by 2002:a17:90b:3b85:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3ae897e4182mr10616857a91.56.1793702678102;
        Tue, 03 Nov 2026 02:44:38 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8460acsm3905297a91.7.2026.11.03.02.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:44:37 -0800 (PST)
Message-ID: <2ed54730-75bf-4368-9391-5452d0a31fa9@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:14:32 +0530
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
Subject: Re: [PATCH v4 3/3] i2c: qcom-geni: Add bus recovery support for GPI
 DMA mode
To: Aniket Randive <aniket.randive@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: naresh.maramaina@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-0-59b3ce96dc4b@oss.qualcomm.com>
 <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261103-20260826_aniket_randive_oss_qualcomm_com-v4-3-59b3ce96dc4b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9bb17 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Ljc_7vWThQ_RCqSD0EwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 22wQaWnJWeZb0_5YIKsxrbDoQgoYBOsO
X-Proofpoint-GUID: 22wQaWnJWeZb0_5YIKsxrbDoQgoYBOsO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfXzUbUsImGGrB7
 uE7P3UGo3Ty1RnVdlnEw56jngdTsjlXnULo/1Bsh1mD1Tws1NVKIEmx+Cl2kJ/Ic+Fr4Op+rB9h
 mO2hnkEnsUlc/dZ4QLEwlPedNuiHIjd04baAkuV5BylGg6h6AkOso1ymBKxZwQMacw2DjhFLMHN
 Hrs1QvwP76oSMpuqvSLA1fuUg8xMzzZ3FAzVEJLFH67xUlxZF5cdGZ5rsZMn+NqDr884EdnjQNB
 maFeqrHLKOhZB0+fakUychiDmCQ0fhSUD3k2rttUfbwrtoe9tgRL5NrcPzb5GL3sP7ouhw2hKTq
 bPvrxORED1QKVbALBoB1aKz81CdOhfwUAC5hWXxM7louv/65LW/tpovekrNHBX0FFeWjA7pH18d
 T4LA30b61aS8B6Rb/qTexdZfodiw9t9zwqSt4zyFku8JbQKHRJzD/8QHWaeXi+UvqPutC0EdL80
 tC6ZRTrIZiZBB9hB+bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MiBTYWx0ZWRfXzklRrFFjz+gC
 CH8IZcVgn0uEI24HxLVDlo2U0ESlu91D/oqXO3hOgCnSmpKurpjq3Lyi14g8nFFl6oytVWkG7g5
 pCl4dG9WbR+YdnRetj6qhcHcdqtpSBs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030042



On 11/3/2026 2:26 PM, Aniket Randive wrote:
> I2C transfers in GPI DMA mode can fail with -EIO when a target holds
> SDA low, leaving the bus stuck and preventing subsequent transactions.
> The GPI completion callback reports a NACK and a genuine bus error
> alike as -EIO, and the existing recovery path switches the SE to FIFO
> mode which is not valid in GPI DMA mode.
> 
> Add bus recovery support using the I2C_BUS_CLEAR and I2C_STOP_ON_BUS
> opcodes issued via the GPI TX DMA channel. Guard the -EIO recovery
> trigger with a SE_GENI_IOS I2C_BUS_FREE check to skip recovery when both
> SDA and SCL are already released. Extend the recovery callback to dispatch
> through the GPI DMA path when gi2c->gpi_mode is set.
> 
> Use the adapter timeout for GPI recovery commands, and preserve the DMA
> configuration error code when GPI setup fails.
> 
> Stop recovery on a GPI command timeout and report DMA termination
> failures. Do not issue another command or override the timeout with a
> bus-idle result, since DMA cleanup may not have completed successfully.
> 
> Signed-off-by: Aniket Randive <aniket.randive@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-geni.c | 107 ++++++++++++++++++++++++++++++++-----
>   1 file changed, 94 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c

[...]

> @@ -1356,10 +1439,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> -	if (!gi2c->gpi_mode) {
> -		gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
> -		gi2c->adap.bus_recovery_info = &gi2c->rinfo;
> -	}
> +	gi2c->rinfo.recover_bus = geni_i2c_recover_bus;
> +	gi2c->adap.bus_recovery_info = &gi2c->rinfo;

I guess one more time this. Why patch 2 is adding and patch 3 is 
removing the change ? keep it clean way.
>   
>   	ret = i2c_add_adapter(&gi2c->adap);
>   	if (ret) {
> 

