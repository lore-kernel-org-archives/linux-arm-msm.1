Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D8146A5EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657255; cv=none; b=Tqx64TbdRpuf/ySipkPlYG6Vqla+M4PrO+J0jZW8uz8SRrkNFYH8TgDc9nxZzkpx9BABq25uuksMgpihX72v9z1SoD0SUIQXrj+t9v6ktKR+xFeGEtXC3shyo2TT45104GaalByAYPHxHjAUnRMZ0CcZo6hC5vu3/epCzJ3e0bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657255; c=relaxed/simple;
	bh=x7ZJS3f0xRb8AdncArsAbjSOaFWnv6AX4C01srI9uQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaPo95Soi8NN4LiMjlustcM93fAxs0WUY9duR6MMh7HdctwfNcN1FGCZwvkd8nCquzoxWuAo+Dh/wYf+60mkRxizJd/4fPnOfCdl10fbesHqN5woBKskmzUVBECNNJFkurtOdGja2GMGwnHwBiHESY9WNs04kX+bYCgJaZhqNNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dfw0BPiD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtkWQwaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dfw0BPiD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtkWQwaE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRkKT2447308
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=; b=dfw0BPiDNUu0Gi6Z
	bWZ3/fyFqObxL29UiXVFnI/KCl+2rr8TGeyYQZjQabD4ckCreCjBTPgx3egEwyvQ
	HUp4GxBfAysNYgFdVArI/zJeIyAdHryaFXC8PAme6e1CRNA66zQpra3j5T1atC2R
	XGhGKcIygx4OeLyJotMKrlXoGD39Q7HauokoDHMitgaIrkIUgRoD0rjmoHrU6YK3
	P2VxMU7kRFR8UHIS0q7ENORA3m824sbBGu612WYq+Ngq7Zstai+EPm4heyT0vE/o
	LYKby0qSnfBmvUvqIe0zUmESvWxtOXYo7y/zQFIPpkWWOVGXF5oyhHDYDrzwTmAv
	MI7oIA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d06kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:07:32 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ce7fabf76so16732641a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784657252; x=1785262052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=;
        b=BtkWQwaEuVZ43hW9tLmB31J4XV3xQ61dN8Gs6rLOCwWt9yrSi1peqcOB3+PLOEw6Qi
         jGGCD09VeAQFakEPoSspipLAHF702ZSx2DC8I/NFW6J4V+zDK5Wau2JSoAEdEcmZp4C2
         Mz2yP0MUfvTVv4LvE/bUNBzk/bS4pNkbcksHjZCE7bGm5m5s6n6b1sI+eVrbru5EFuAi
         y32477uR1jtw5bqB5VOFfD1h4KQz8coZ63AdUDTAiaT65YRYe0PlF+TsAHyaYVKOwEiB
         9/uV2vWW1YvMCdzSJWZMVNAcv+r1DIvQm1zSrrnwtEFbJlSrSCt6pq/s7AWixt96expc
         aikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657252; x=1785262052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvgrk0JD8puxwL9uCDMq26QW3QE0+BHmqpodlHbEJE8=;
        b=JZtcZg/8mmMI8blQ4CD4liBSf0gZm6S84rUB2OaM/CIpiRPUpIVJvDT5TbYarHt2Cg
         P0+QkU4ZHx2HvXZpfcuQVTm2tMc5amjT3q0oaKemHCpgKLtcSLEqd7RTsy5j5/1dCW7l
         mlEQ9+TFUbsLBHd6/g3lnqEYMLE5VWYwRmUjxXNhFT+LgMymOxocSpWJwCBsRFC5V8uX
         H0p+goAqHCdYtW8l4XNzKtTgedTLUEW6T3jVt+VKkOkq9VRXw2W7Egpi1OebQ6DxuHpJ
         0W4MvQn+6dizMjE7XInhEb7alDzAigSUhCMZepNfa6LCsdz0FHQ3xRYYD3tEqM0GyK93
         lXwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/xc2nZi5MrmmEmmyQh0vPtIqeobOYsD3XcyeoXb1Fxvl3Ri3xXDGhGuvIX8f/rytKoPe3ln9Xadsp5Vet@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+4z/efvhPc3Ft69io0W3x0watJ+Sx3+0p6dKI6j+RpTr7BqP
	QI8v8fKR2nxFvZDwP5lnucWdjKyr7y721Qe3IJm00H6FsIlbrAQGRkMQXc8vqpGjwL5Jbo2o5zD
	le2TN7KBm2/FVpRar3h5lPACLRZ2vCo/zYW7EOeVu2VgGnm2Phb8jNtbT6jZsXaNSHfhz
X-Gm-Gg: AR+sD11+vpNiTXjA564tAqhdguP4v1FqR7/Rr7IGQIXAwosUuh142CAGnlHKY3tlEzz
	nf42qizO28zAzsIteV1b+AbtD+iao/8Iq7HwIHZHpFjM1GSqS6AEdm4GB4EuI8FE+3h3esaipgs
	A1MYI8DHBvSOG+GQm5Vhw4OvMxfKD6y7Hts4aYgvX+YgmsgxEzMIFenjN8QQXh7bkvHOsI/wFGd
	vTi4c2SbV+YD3fDS+9cryx0xxJR+ia3U/qnuoJtqTjwf+CpF7AinkQCIzvaq0kGuseY98NlaWAL
	aBk7+4sJ0Ktt9oF7KekcKfgBSbl3HB29j+B55qUG/ma8bjC2Rn8C3b6zqOQSESDk46Xa6Yv4jnc
	WNhk4OhJ8TYlGVNn/UbeIHlclYm8hW6gF10o=
X-Received: by 2002:a05:6a20:6a0a:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c3ad9e597fmr23899557637.66.1784657251630;
        Tue, 21 Jul 2026 11:07:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0a:b0:3c3:8041:89f5 with SMTP id adf61e73a8af0-3c3ad9e597fmr23899525637.66.1784657251224;
        Tue, 21 Jul 2026 11:07:31 -0700 (PDT)
Received: from [192.168.1.8] ([106.222.235.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e088d3fsm908106eec.25.2026.07.21.11.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 11:07:30 -0700 (PDT)
Message-ID: <bc7854a8-1dd4-4e0a-83bd-a8c9dd95645d@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:37:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UJvWgJ1L0Qnoo_fAH940SKj32Y2Xjm7T
X-Proofpoint-ORIG-GUID: UJvWgJ1L0Qnoo_fAH940SKj32Y2Xjm7T
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a5fb564 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nYgDJefOb7ZtON2RxEtQrg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=5tee5T0z8aEC-XiIPRgA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX+w5uTG14XNYo
 DjaPlsGBMbpA9FJhsGVBko/lHKT0eje8zOi5ZmpJ3ZGJYYrg3ZBL4B+CV+yNcnRqLwMr6/xLo4u
 +3P4ET4+z4QOCHgp3hcnaiWwpYQYDmX57TrmVYpgq45pcW6lFY91QU/YShKAbALLrFxP+CQTQdK
 /aJ+Prw+C391ivhfFU1vPR1VNQMEj41FQdR/v9ODYhuFXlGo9JX2/fbLzwklQOMGt3ZoiDi9Ejr
 5s01C9qECZt4dAeyJYy/X+BJPI8ZpoN5/H2+5VFH7r0AKggI0X/MGKkfCg5/LuorFaBNV2hQiFd
 8V2bCIx2QIeeZPfYo6Tta4v9TzESy9JRAnPMg6I/wrbM6L2myM4pSCNSQS5GO35CruXfFs2Q2Jb
 H7RpVbG8BbttbvxdoFepHo+kCm/MJAecEFGl8o9OYIEP9XWDBD9NZ4JujGXLIaFjRjI5BXNXz2G
 wDdjNaRtkxYwrPpdG6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5MSBTYWx0ZWRfX6H5kv1GvEjAu
 yyY1L/K1fBVbuLE45Eu3VI8xeYZ/Fd2IzN4k8063nf8GBwde7aJacGUGeVeBnoJa4J3NAHYnFx5
 6pCBZbAHlQLb30jUBj4093RgZjB6Dlg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210191

Hi Bartosz,

On 7/21/2026 7:03 PM, Bartosz Golaszewski wrote:
[...]

> @@ -676,13 +691,26 @@ static void bam_free_chan(struct dma_chan *chan)
>   static int bam_slave_config(struct dma_chan *chan,
>   			    struct dma_slave_config *cfg)
>   {
> +	struct bam_config *peripheral_cfg = cfg->peripheral_config;
>   	struct bam_chan *bchan = to_bam_chan(chan);
> +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
>   
>   	guard(spinlock_irqsave)(&bchan->vc.lock);
>   
>   	memcpy(&bchan->slave, cfg, sizeof(*cfg));
>   	bchan->reconfigure = 1;
>   
> +	/*
> +	 * This is required to setup the pipe locking and must be done even
> +	 * before the first call to bam_start_dma().
> +	 */
> +	if (bdata->pipe_lock_supported && peripheral_cfg) {
> +		if (cfg->direction != DMA_MEM_TO_DEV)
> +			return -EINVAL;
> +
> +		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
IIUC, peripheral_cfg will be filled by the client driver of BAM right ? 
if not, who actually passes it ?
> +	}
> +
>   	return 0;
>   }
>   
> @@ -802,6 +830,7 @@ static int bam_dma_terminate_all(struct dma_chan *chan)
>   		}

[...]

>   static void bam_start_dma(struct bam_chan *bchan)
>   {
> -	struct virt_dma_desc *vd = vchan_next_desc(&bchan->vc);
> +	struct virt_dma_desc *vd;
>   	struct bam_device *bdev = bchan->bdev;
>   	struct bam_async_desc *async_desc = NULL;
>   	struct bam_desc_hw *desc;
> @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
>   
>   	lockdep_assert_held(&bchan->vc.lock);
>   
> +	vd = vchan_next_desc(&bchan->vc);
>   	if (!vd)
>   		return;
>   
> @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
>   		return;
>   
>   	while (vd && !IS_BUSY(bchan)) {
> +		/*
> +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> +		 * already have bam_locked set and must not trigger a second pair.
> +		 */
> +		if (!bchan->bam_locked) {
> +			ret = bam_setup_pipe_lock(bchan);
Hence, overall you meant to lock bam pipe once during the starting of 
the bam dma engine ? is it ?
> +			if (ret) {
> +				dev_err_ratelimited(bdev->dev,
> +					"failed to setup the pipe lock, deferring transfer: %d\n",
> +					ret);
> +				queue_work(system_bh_highpri_wq, &bdev->work);
> +				break;
> +			}
> +			if (bchan->bam_locked)
> +				vd = vchan_next_desc(&bchan->vc);
> +		}
> +
>   		list_del(&vd->node);
>   
>   		async_desc = container_of(vd, struct bam_async_desc, vd);
> @@ -1133,6 +1285,10 @@ static void bam_start_dma(struct bam_chan *bchan)
>   		bchan->tail += async_desc->xfer_len;
>   		bchan->tail %= MAX_DESCRIPTORS;
>   		list_add_tail(&async_desc->desc_node, &bchan->desc_list);
> +
> +		if (async_desc->is_lock_desc &&
> +		    (le16_to_cpu(async_desc->desc->flags) & DESC_FLAG_UNLOCK))
> +			bchan->bam_locked = false;
>   	}
>   
[...]
