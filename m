Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD17823ABB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785480289; cv=none; b=pBgqJcQqh1Jf6Nc94PcGqW/cbG/BG9Nnmwh0562dwToGB7uX/pirPxMxC/zr8GyDW5DWeu52cuiFcoa6crb8pqD3x15IOmc7gc+0sphjI8hj75CWrxhh6aZv5KkPKxPT7lmwGlb868P862ocXI52XQjYzJmXlsROKfe3zctTsF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785480289; c=relaxed/simple;
	bh=1hlRueui1NmKv1smlCKcJLo67cY+C4l9M+U1Asy2YuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbTx0ZJ5Vx6vvW4OQCkbVjZN0cG0WGlUMUnhBlKmYHiPjhrJt0/s8Rx5xrZySlnoI5Uf/EtsdzwmqO7fBcF6wWyJehz6yn4xEtXuCmFzzWnxMKOQ3b7dH+xOgwEkB538RLotyTrmmt8LMMuZX5BMEb2n8WsJj0ARpoA0rE474Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U4n2VqiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmNTlGXF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U4n2VqiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmNTlGXF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V6h8sJ3140693
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sKWmxBXJBHdVo9za8nnXMGzPjkbzHCu2a0+Of4kjIIw=; b=U4n2VqiQuX8wABmv
	f1gA+D4klb+g8U2EZnjMK1ZGevTrLmSNprtb0zqwh1/e8l+fXteGj89kT9jB75nk
	fQwva0twAeUQ5fd8drmijk2kiyOI2bo4sOuTMXJ9iLrr3NsbWJRoiXQpxz6mAXP7
	5cod/r6X6xnj6RK0Xi5QTDoXIn6dHuQ2FOfitUgabjlcvWUYoZ9N5atU0hwlRJXp
	iMY5ibCyRRjL8xsJgGT+UOlM+szY9c1tdFmPx4fmMc4dijfyee0mEEJbQ9F9IKKw
	jD2R/7rBnFjQEBIZvSRv4DlJOjPmbqScPloMObIqJm8gIpOJHEiK1yRQ6zCrhrrZ
	lkou7A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frpp70077-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:44:46 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e375d9736so1077676b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785480286; x=1786085086; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKWmxBXJBHdVo9za8nnXMGzPjkbzHCu2a0+Of4kjIIw=;
        b=YmNTlGXFvlTCtCgR7CVLeofvdZ9z6fNeB9xHbiwsN9UAeiQaNzn/CCVrcvnMk+zAIx
         FYUse51jYuUifLdoEj0lzimNiH+Gi0uASRa/gXbSSOW/cKlZmKF9S53IvCLs4FNCSKyA
         yi76UPYAKXJDbLh+6u0ivSv1XpsshUobVk/Rs7oCWvr1j8jLSLKbeIyN2uEVt0XuODn4
         3e6Oa2EbOMcJ0FZ0X0J2Q+ltnkOoG39wlfpN79L3oarAHHvK3yflQM75HtrouRQkY32p
         cy31znXlXTO6rQANj3uFSpzbmTvj2f37B4bts26q9indtmud/EftQcG2iQalQXpXN1mD
         W0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785480286; x=1786085086;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKWmxBXJBHdVo9za8nnXMGzPjkbzHCu2a0+Of4kjIIw=;
        b=JoNob1VKDdwUAV62e8hXi1q/P0rfbD+scKWU5rTRw/CULoiDq4vP8C9EbC6VbwPMML
         36ryJbCbwtiLi4cZubhip2zRkwe19jBorIXu+/CdwucS2TpQj3Qe4RKHYwFrwTzrsF37
         wMbfDnaDBpLn8m/xg9nc9uF0XdkhalRuFJxUHldramLKRNGpIJg1xzaCb74VWlC78O3d
         wTBiPx7YK1TVjoTaF3Roe99jbQpfWNNmJA+HQKLaQT6oAWCxJtyPRJKtNZWLcY1Hehlr
         M/zEH84YI2YuUaY2btDiTq5soJAXJnE/khi4todHYmvASC7TuQ8OpdiE6RH/zvS2JB7W
         smzg==
X-Forwarded-Encrypted: i=1; AHgh+RpSZ05gSqxphTNQoV2LSfQE0Jhne1yYytD8b8mnabeicRcBM0CV3a5fhs5JAJkYXoEp5HWZrQeW8QPV4npG@vger.kernel.org
X-Gm-Message-State: AOJu0YxxO2fVQboraEyNp3OY5eeq6rd8CFKuwgTMH9XXSiTQjoqAVeKg
	uUVH1IlfiIG5wPJI/CcLV625wMSR8BvoSUuTYoeNLM7QOfQeLJWKVJ1+ZRgJCbmkPkrPQhhobcr
	Z2Wzh2eGWu+CoZvVmpn9kI5pitAR0P0m8aeFWCRt5pHlVdli6/ULTrq6NqD1FTcNu/wxQ
X-Gm-Gg: AR+sD100EWi9dlAzzWmeLcwI/0vdDu/IiYiNh2ipJnpDHgUcoAVKHSmlePSJghjiXHn
	h/YonOaOse1U1YZv1ng6/1yoer35cRQps/RMgr5jFU2poBJZY6dKNB0SWnkRwodxo0ZJ5Njj9iI
	28YaMg1Xsw1dj9zzpp4HmEB9bjvyFVERMHZq8XEDfzuprGqU8l05GYOohLDws9Vaka8cJ8bclyR
	B6JiQYL4SIZchZeFKQcAvh7/qV3rca4yEc5V9kuLEFaSlxcsIcm/YESVi1nO9v5MM+d8fkpmPgt
	V7pi3hkS0EgAnq4OJa7nN6F7zKaYJ8xB1PQoM4owVrWunr3LtXMQMK3C6F7iaLUT+Ut1eGlkkpK
	CgbA+h7t0U3TJLd9R7CzlPKYRSOw9yA==
X-Received: by 2002:a05:6a00:2991:b0:847:9151:3409 with SMTP id d2e1a72fcca58-84ed6f4d301mr799858b3a.55.1785480286300;
        Thu, 30 Jul 2026 23:44:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:2991:b0:847:9151:3409 with SMTP id d2e1a72fcca58-84ed6f4d301mr799838b3a.55.1785480285854;
        Thu, 30 Jul 2026 23:44:45 -0700 (PDT)
Received: from [10.204.78.242] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edbd31590sm29318b3a.8.2026.07.30.23.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:44:45 -0700 (PDT)
Message-ID: <9a5808d9-9d95-4491-8d44-647b08a6d058@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 12:14:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: remove map before remote unmap
To: Yousef Alhouseen <alhouseenyousef@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260624174932.7419-1-alhouseenyousef@gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260624174932.7419-1-alhouseenyousef@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX2wOfCpSU0MVF
 tYSVfsdjZuPALgIlAWlbY5taC+mwljFHpEvzFVIoZ3vpx5LJSzOngAP5oc4ATnCc32LthQUt1Vc
 s3AiaLxcYslPJctl+t5wcnHti4lEuqzXpj83qwHCvUjAYxR/z+eMxqDIfy0pNvPEsWiiMCPvTbI
 /GpoNgXkgAjsld2p+xVZuH7PacFmeEcT3mz/hHX1Hzbv2lQG82PnF+eujTHPwAbCFc8EJNRvCD/
 kM0xbekwgrsH1W6mIl2b9J3zNW7NWaQ/GFDEdOtFPiur3AI0d3KO7FYx2x59mVRX+5GMpRVK/5i
 I9HWS5gPico2Pr+EeNb+InBfBd2QvtuzVV3hQZbFnFhLNhAJLRoTjwxnmkOpfK3RQxvtz5GDGhT
 qfLsFStYJeTlZAFvAq05lqM1rsS5wqG0Hy7LSnTLqddH3vU9FUtobyGDxqSkZfllW54sIPVYLpp
 vP2pLVFbu/Qy84VkKrw==
X-Proofpoint-ORIG-GUID: oNyPFpC2pIcYMec81dlgWgjmdAFfbRmk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX6RnVDDqrFbhX
 hmWPRiQG8oDG9RU/WN0Ho4QPnclhUcju0vsc310Ej5DekkYQfA1mNsAZw0lZHdE9VjWXfCo/JvU
 Roa4QDiG1CkgFKYFt2OquIGyV5b0jKQ=
X-Proofpoint-GUID: oNyPFpC2pIcYMec81dlgWgjmdAFfbRmk
X-Authority-Analysis: v=2.4 cv=AsXeGu9P c=1 sm=1 tr=0 ts=6a6c445e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=s0Wo0hrht0JdwzRqEpUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310045

On 24-06-2026 23:19, Yousef Alhouseen wrote:
> FASTRPC_IOCTL_MEM_UNMAP found a map under fl->lock, then dropped the lock.
> 
> It used that map until the DSP completed the unmap.
> 
> A second unmap can find the same map and race to fastrpc_map_put().
> 
> That can cause a use-after-free or double list deletion.
> 
> Remove the map from the lookup list before the remote unmap.
> 
> Reinsert it if the remote side reports an error.
> 
> Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
> ---
>  drivers/misc/fastrpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 6a5239b1c..6ced210ca 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -365,7 +365,8 @@ static void fastrpc_free_map(struct kref *ref)
>  
>  	if (map->fl) {
>  		spin_lock(&map->fl->lock);
> -		list_del(&map->node);
> +		if (!list_empty(&map->node))
> +			list_del_init(&map->node);
>  		spin_unlock(&map->fl->lock);
>  		map->fl = NULL;
>  	}
> @@ -2064,6 +2065,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>  	list_for_each_entry_safe(iter, m, &fl->maps, node) {
>  		if ((req->fd < 0 || iter->fd == req->fd) && (iter->raddr == req->vaddr)) {
>  			map = iter;
> +			list_del_init(&map->node);
The map is not available after this point in the fl->maps list and there
can be another thread making a MEM_MAP request for the same fd/dmabuf at
the same time. Now as the entry is removed from the list,
fastrpc_map_lookup() won't find the entry in the list, the MEM_MAP call
will go ahead and create DSP mapping for the same fd again. This can
leave the same buffer mapped twice on the DSP with two different raddrs,
which might cause problems.
>  			break;
>  		}
>  	}
> @@ -2088,6 +2090,9 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>  				      &args[0]);
>  	if (err) {
>  		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
> +		spin_lock(&fl->lock);
> +		list_add_tail(&map->node, &fl->maps);
> +		spin_unlock(&fl->lock);
>  		return err;
>  	}
>  	fastrpc_map_put(map);

