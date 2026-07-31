Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C4733F5A3
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785507455; cv=none; b=FWLl6qVPgFlJO6v7c4iTgS9v0FLfP9SvJF12ij4oa0YD448P8LURrr6Me1z0kYk/kVmT2mrOmD3YctjSThcVVuiVvfBpKiB9Z8m3SP/UgWay176GE5QcdFNaWW05YRumVpB4SyzW1AT+rWcZRdmDJXrd4oURejWz0YajVnsDgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785507455; c=relaxed/simple;
	bh=kvV24HDq2pW6zQ1KUp26qMcUcr50um0GSf7Whahrcm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaBQbytkIgz/ITK9u68P0Q7GBnQSpbseyOOaMa4s9DloNuqVUxwob58/qpPmbiR7eVhjkl6v5S/aX8bgN+n/34usV+Uhoag2qlIv0x7OGucwYCuSVX3fOGcdNfMaKIc2x5NlVbIeywiujF165iH2/JaVGhCfanRMZtcNhMnGzZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/wHmwzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PbvfVBbZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/wHmwzI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PbvfVBbZ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBeXlK188861
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s5AJxZBwX5mdbJEKMHHuL+U3
	UVoTEIUr3b1RqdyL5Jc=; b=Z/wHmwzI0J/xGBX+2HmqQYRDu8BhHnn6cHf3Muw8
	0qTMsBv6bmscd7wjWtqoT9EpHTOUKPXI6lQ33V91h5tWxx0KOtz1VJRKQv4SGpo/
	eFpipcorY5wFkEy1VYvd24qzSYptHENOMsIydOd1WvHOeQwlWxp4wNUX1rFLz9zH
	9Ft/cu2YNufKb+1LljqtP463Z0K129st+JU7r4g8jQ1yJ65qWCIV4sSrvN1nOuLc
	D4WPztdj/VOKLuQd1WoQF8HBQK7/GoROobDkI41xPAA+U193OC9zulnowAHefoY0
	9WeEihGYFjHTgFxmkHLR90ug4g8RkHILezaF7VW+MMQbeg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u0mte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 14:17:32 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-73850dfc198so161726137.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 07:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785507451; x=1786112251; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s5AJxZBwX5mdbJEKMHHuL+U3UVoTEIUr3b1RqdyL5Jc=;
        b=PbvfVBbZPbSqITXVghe9PrC5u+3vVYa7lIonycMeVvzFBXbKvwk2YFc7cxSpJrKMiK
         FG5rvyfiWXrMtMw2G37hpgFQFaupq2dOBqixgueFRrnPPJRUq0zunQPDmL7nf++ZvbDK
         knnxs0z9eWMfUYIGWx2Jn3onI+jjjnimYm/lrNJdfU5zcHXclL+cxlBglOC4WzME0iBq
         A4HsaLYWZCKFheEC+tPMNGdE3tbedWhciUVWFMFP70uHUXcZO72REaX4U0X2mz9o3spy
         00E3okE9MFZzhc8Qoa/LUSUUqLeClZj/s01603Y0PiNrJFAUToJ0ApYznJp6hpwZgVD9
         uMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785507451; x=1786112251;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s5AJxZBwX5mdbJEKMHHuL+U3UVoTEIUr3b1RqdyL5Jc=;
        b=W5dRlWQtVOL9kYO2/4lu5YfOuvyJDVsPrp04UCbz1MgqYzV4oAIacUokn5PTD1bic2
         M7u2shuJu6LB4c7j4cqXCS5H19jTbsJlxtGXEusbb5taitni9KyGPtTIPmGssOpDzyu5
         0LISYgWoBhTlItyuuPVg3gvsn7IwTx+a8VnxXTmFviq1iTsgiBTc3L1hKTJ16xl0Rmxh
         Dlu7Ot/xu/rIrALSrtXIRQBq/C0GdpnxbrhdPUSpcrub09KAYB/cwvm8PY/hxKlPFVTC
         DkZ/scZtksg/ao9Rml18LxVUGECC4mwS4VBixij434eY1ai80dD3otQkmbTEnReoFbP8
         0yFg==
X-Forwarded-Encrypted: i=1; AHgh+RrVCouAkZB0w1o3Opd2ruNdNOFDN8NnfK42qWdsDkcypGMqGBihaWRE4SwIGHY9YwAc8qVUv8ThFboJjyCM@vger.kernel.org
X-Gm-Message-State: AOJu0YzpdNqQLmlFb9tlzHhAMOAy2ieTk3pT7XPvi1xAZ1qupQR8u8bo
	H6VRrJ+XBHei7a7JMECbLA44Mug+PWczyhW2A2mWcIFLv1jrZAG1sQLRTm9KzV2eOqK7lqhwiUQ
	/hDdqoJe045NP2TJUkd2gOtgvblDUcwChlFxQk0yEOkFhyLeE/j9i0EbYB45+OwH7RNZS
X-Gm-Gg: AR+sD126fB640im02OWGVe5NacTzNHHa/p6NQM+wC6iS/u5NTxQV1GzP2tOfRsv76f/
	JIkM0faJXi/cGjRbU2Vy1jp+CPrcb2Oi4LJnVXC8E35aBG0ta/clQX83DiBiK5LRKTxGS78bDfP
	4pvlknd5sxebR4WiK/hr/6StMhQtYIvX+ABGAcThK3pQ9xa4E0IUa6mcY0vOpG3FNP0cCG87A2F
	v6h3jGSUGKUi+UEodFuig+nLkXDFw2k2v7cxfkUKMXn9RJ3pju/RFwOrtSxXIfsn2pn7doUFx4w
	bFgkPJm6STAmTxFcli29Nf4jlrByhyzg+Ai5wbFvjwwzlTq31GUQhBENdomb4Pm/8b0V+ZtAKzA
	Hfh+v+FmsJm2wyXyYZ73Kn+KdJn0J+PBD8+jEZWKLq5CcgIH75DYa4a+m82/ZbOnGRaB2ndX5pb
	rq6dlckn0qEj5okQ==
X-Received: by 2002:a05:6102:549e:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-75b2226aa3cmr244633137.6.1785507451123;
        Fri, 31 Jul 2026 07:17:31 -0700 (PDT)
X-Received: by 2002:a05:6102:549e:b0:6c3:1bcd:31dd with SMTP id ada2fe7eead31-75b2226aa3cmr244598137.6.1785507450531;
        Fri, 31 Jul 2026 07:17:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23c46ebsm329552e87.10.2026.07.31.07.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:17:29 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:17:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v11] misc: fastrpc: Allocate entire reserved memory for
 Audio PD in probe
Message-ID: <ba6v23dn6mmhnowqigsojbnjnuhzr7hwmoe3treklr2zpbnfxt@vgvdxiarcb3k>
References: <20260731093210.473-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731093210.473-1-jianping.li@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6cae7c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NXPZQVn-1uHl1nTrLQEA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfX9fz5bPVmHjiy
 9h5DuvaplFYPAm0ttozIxAwmJCQA0TlInhNNS+w2m/xra2LRlSA7keWMAFf7rzlHM32wrbD68Ia
 htCMDsy2rRQsGxbYQlaVexyD9CXQLCy9R7aUjYkVWZw6xNLx9u3dMOs6qEVYsfIFbpX7hzC25fj
 jdB/znTV7NoOADPX2Dp6hrLOTZ1zCMKDMBrMcjBdGg0XpEwZkZXk7RYb7C/OdjxuX6ofw1/vj5G
 sBrdibw6Djrw45U3ynyUrHjlT3FKdVkdFSB3QJbHH186xIaJhGG/kQt4tEPg0PoetDOIVnkljLY
 wzjISCwh/bMjc1jctc10zNQ0zMHCPuzRs6b/1QrGgT5JuZwwMnk4z8qak+KPlupSdBBOg/CXnt9
 nmYE6ouAm+RCgtWK3KVhtiaBq3eGV32gRa8NbmN7W5bmKLoC89WDQ0KbYVDzT2IDWR3Uol0E1kr
 R6jwN/99aB7BjS1RbOQ==
X-Proofpoint-GUID: zBpJbXUNfVH_ojua7B8XqQRGCkTXDgPz
X-Proofpoint-ORIG-GUID: zBpJbXUNfVH_ojua7B8XqQRGCkTXDgPz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwOSBTYWx0ZWRfX3ljU5Tx/xqlI
 +frMKHaWCX6huw48jiVNReqFc0Zs/dd+YUuw/gJoRHwg+ACvkVfKzUM6eunYD79Ei2B6ESV5PGr
 Z/l/kRMJT1CISoanFhoUOqE6TNtUg6s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310109

On Fri, Jul 31, 2026 at 05:32:10PM +0800, Jianping Li wrote:
> Allocating and freeing Audio PD memory from userspace is unsafe because
> the kernel cannot reliably determine when the DSP has finished using the
> memory. Userspace may free buffers while they are still in use by the DSP,
> and remote free requests cannot be safely trusted.
> 
> Additionally, the current implementation allows userspace to repeatedly
> grow the Audio PD heap, but does not support shrinking it. This can lead
> to unbounded memory usage over time, effectively causing a memory leak.
> 
> Fix this by allocating the entire Audio PD reserved-memory region during
> rpmsg probe and tying its lifetime to the rpmsg channel. This removes
> userspace-controlled alloc/free and ensures that memory is reclaimed only
> when the DSP process is torn down.
> 
> Validate the presence of the Audio PD reserved-memory region during

This will break compatibility with existing DTs, which is a no-go.
Existing DTs _must_ continue to work.

> rpmsg probe and fail early if it is missing, so that a misconfigured
> device tree is caught at probe time instead of at process creation.
> 
> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> 
> Patch [v10]: https://lore.kernel.org/all/20260716095847.479-1-jianping.li@oss.qualcomm.com/

All of this should go under the --- line.

> 
> @@ -2584,12 +2547,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	if (domain_id == SDSP_DOMAIN_ID) {
> +	if (domain_id == SDSP_DOMAIN_ID || domain_id == ADSP_DOMAIN_ID) {
>  		struct resource res;
>  		u64 src_perms;
>  
>  		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
> +
> +		if (err && domain_id == ADSP_DOMAIN_ID) {
> +			dev_err(rdev, "missing mandatory remote heap memory-region\n");
> +			goto err_free_data;
> +		}

This is what I mean. This has been working beforehand. It must continue
to work.

> +
>  		if (!err) {
> +			if (domain_id == ADSP_DOMAIN_ID) {
> +				data->remote_heap_addr = res.start;
> +				data->remote_heap_size = resource_size(&res);
> +			}

Too much of the spaghetty code. Can we replace all domain checks with
the functions?

>  			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
>  			err = qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,

-- 
With best wishes
Dmitry
