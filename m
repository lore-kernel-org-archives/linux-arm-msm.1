Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85B3A4F35
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387163; cv=none; b=lutUAM8F1gs4TJMuALRriTzW+17zPN3qkN1Ml1DF8saW3pP4kvB65mBI8itiBBF/sqnIq/jLBHT84tpW5E7FeIhiyvbEgv6sndb8ElC071NebxTTY1+q4Bpm1Fz1fuG3rzqDrfEH/RJkakjlJezyxLnQo2SmDMQPLpLi2TW2+78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387163; c=relaxed/simple;
	bh=9R1jnhq2oXjdoMBKLvZuU0Q/c4UWJnm/6cs+1wVuRyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=edJkOsAnDQPRsZv4Kbx3LsWaaGqMO6gREBV2K09HTi97Scsmx0qZcB75027QO6NtNHusQr8yWKkoviPVPTYzFPT70k/CAPwhOtW54oXc0VfWvdnMFmXBnEGp8F6GXc5twilBcKJ77ehvcwdWDrEKZLDyEvA+VyUaP5AzFyKGhHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fir2qQNx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NvPS2KRX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fir2qQNx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NvPS2KRX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U4kvQ23978102
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTnb0bbBTOh0ujs8xWkkOVPWXcBEgS7OoCRQ+dvQBes=; b=fir2qQNxhq8EnkM7
	DvTLumrNy8XRHoHnQEsATqTf0fbMZyUte1xt2nwo8+jSAV5pfVyMsxhXXptxFqD2
	XURBZg3KGec47VkFQjsEzJUWpvTOnQaq00AkH8cO8YavrB7cYzI1pnmZcXaDatPs
	7VIJCzlHL6H3eGfTNCsh4b0x6WJbJ5LWADmMIXovkbOsysT9XnGaij5rNPMQ5iOO
	MagHalEgOEfyYhknPKBMkP5tyNwTOpKvvngGl7WwejYFQ1W3UWWfhr9fjIWgUNNe
	sPLZv5noskD2EB7fMc4gEcYa2cmbljuXCYq3LM9L3OenaXlgvU42Di6rTuBUNRCS
	62u5MA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqyvxr0ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:52:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1408582a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785387159; x=1785991959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTnb0bbBTOh0ujs8xWkkOVPWXcBEgS7OoCRQ+dvQBes=;
        b=NvPS2KRXqf8dz6dO4mTatDuw6mQJaX/lejg6G/yxpsVLO2o3UZlduLftpKfwipLn/+
         Zu9+uBOv9enX7iPFs0LCGFuGI8dICXl44yJP2zSQev2NXgpipoxNuR2Z7c+j2LbdJ+l8
         VCukmUpmPFZUZNCaM7QS7wCW35vDHqQBEQPbp5jLx+x15sbb/QqRTI2M8P4IKW2maOCp
         veewvi8C8NEFNWbrtL9CQaAQpPwo4U1oguXSE3HWkHkg5yuk1vAJyrPt91uSBWe9Hwig
         ShNyK8SJol96mmdKZD5rkPHS9G7HS7f1THjMyuy6W+2yq2/DeIm7bme7c07bpwQimfFk
         HXqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785387159; x=1785991959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTnb0bbBTOh0ujs8xWkkOVPWXcBEgS7OoCRQ+dvQBes=;
        b=KVt2MD6VvFWT1MtEvWsLBMrVEq1JdeHgmBp6wVQcffyL8DY2CGhUXNIHM3UK9HS4ZG
         8yJyK38qSpegPYP8usCzHZBCl6exh60PdbAwqYrDEniGfJK28lQpvmNk10JjB4ulVxbN
         JABXQj0s48pyZ/TJigRtOmikRxvrEBa/f3cOgeesa4RbJTUVvdcuN6/yF7wNjRWMPNl6
         0SCxKHo3wvoICip9Bo29do9AQaGbAwqA2rO8Xh0hpovphPCnvX4goMqT5loZuxJa8b2M
         LlEAtgDuOvGSMQCT9UiqWC4+Q+N7SvRTtorgHHdlLwWF47a/7+TMvOoWciscTc2UqAWz
         /Sdw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3YsIVqKfX5cJ1eCFbiN1ojniheJD2O8LCmIthrb7PZKUc6ECTkrREstpxrUulTfJZcRyw3/fwd1edimBP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1NOx6Dejoui9IGhVdESzfDpwwivaGmqDQK+RIUfNuscCy0NP7
	FiRDNVYiJ67CVd+0eqn2sQFyjkDw/frvuMveMqWWViYHYSx5+cX9KgSSqVa0kPgfGE55VgW+Om3
	S+cZ4nmV3jCtsaJVxNfooWF5UAuSt6d9I0eVH2ewy8dCUrr8oa0J2f3idZQAbf9jA0ZhD
X-Gm-Gg: AR+sD11eevnqhSDe/0N1Aev0u2Sn3g5MOH7XQi9dMKeKSdCZwuBqAkBOJCqDbs4Ct/O
	JGhf04LMEdpEKHeiD56j2XMGcxMQ0+C6zT6PlLeWCEae4IPWWgbJFQzD0jADz63eXpt/sAs9xxh
	SkDs98jpl7CF4O6ZK9WPw+d1xCrpUjyG+MD28QWjP0VzchnideekDnfNmzcpxUSUExhD8banNLy
	uTNbUjbtv2jS/BjcK7w0LHxv0AcetrxLWAWBpxL8h340tJVdhsVt5XEiSdwFLS/dTS/BQ3phhdh
	vwGwO2sOwU85Pe8Rh1jgnupkf+zKrYJI2XTKCiLLUGpnlY+ieHz19WtutczTHtB2+il8/nbD2tl
	/DMhINtO+3bsdmU0d9hU4bcdaW5Jglw==
X-Received: by 2002:a05:6a20:7f99:b0:3c4:42d9:58e3 with SMTP id adf61e73a8af0-3c90066b1c6mr1078125637.13.1785387159511;
        Wed, 29 Jul 2026 21:52:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f99:b0:3c4:42d9:58e3 with SMTP id adf61e73a8af0-3c90066b1c6mr1078107637.13.1785387159035;
        Wed, 29 Jul 2026 21:52:39 -0700 (PDT)
Received: from [10.204.78.242] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb78ae98asm1601217a12.1.2026.07.29.21.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 21:52:38 -0700 (PDT)
Message-ID: <7942487a-1a1c-41bd-850b-25f1f4bb0773@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 10:22:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: fix UAF and kernel panic during cleanup
 on process abort
To: Jianping Li <jianping.li@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        stable@kernel.org
References: <20260630063409.475-1-jianping.li@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260630063409.475-1-jianping.li@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c7ubhx9l c=1 sm=1 tr=0 ts=6a6ad898 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IFEFMmON-DzK0gGTnVEA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAzMCBTYWx0ZWRfX8/eseWNr2Mzp
 YFsahh65lz9Nd9/areN8cbswg6ev/PagWjn57N7Aci0JLdC7aIQMXUi+H3EkEG5D6IvTdj6cmzC
 NM08OkAgmXe6neXQZ0hnfwzUWT0cY/Q=
X-Proofpoint-ORIG-GUID: 3M4__MdjwTemZRya7NzQR0TzwT4qAI-Z
X-Proofpoint-GUID: 3M4__MdjwTemZRya7NzQR0TzwT4qAI-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAzMCBTYWx0ZWRfX9j87rTvsPw/T
 KMuDzNszQf8qKgMvIREj05AvEUQLsrSkG9YDfhQxmOwV2it5C7WSN5ymVVO7ZfQXcyt7tlOnH8l
 fwN1r/uJE66+AEp2neETGQ4HIJYE4IT7EoeaUxeUQ03sVC9mboOUMAoW62jvltREbnGiaa/T8ty
 wc6Q57Kr9GgITHTXpyit24d8imyRiDLJbxgUm+6NXn/4K2SHoNikBXyfiFs21HnCmQoWVzdd/0T
 AI2kNmnQyVSJuMWOANaJpuh/z6SKfxuIwTe7UbV/Sam/wsaAdJ+qIlVA/7rlfyz0I7BBCyPbsUR
 +El3Ght23mHbzT11RaO2Y7zyAAtx3MrFVEO1gZlaphudZ98qQWsnmnKHBxc9l9ziLkATiv4JxX3
 1v/vYqjpPafCufFy/mXq1O2ufo4hT7ntKl6eaBFkebTDnvDtKKvaV7TCxzluVWxc/KtOuHytwjN
 Wk+54b9o7gJQ/+EAG3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300030

On 30-06-2026 12:04, Jianping Li wrote:
> When a userspace FastRPC client is abruptly terminated, FastRPC
> cleanup paths can race with device and session teardown.
> 
> This results in kernel panics in different release paths:
> - fastrpc_release() when using remote heap, originating from
>   fastrpc_buf_free()
> - fastrpc_device_release() when using system heap, originating from
>   fastrpc_free_map()
> 
> In addition, fastrpc_map_put() may trigger refcount use-after-free
> due to concurrent cleanup without proper synchronization.
> 
> The root cause is that buffer and map cleanup paths may access map
> and buf resources after the associated device or session has
> already been released.
> 
> Fix this by:
> - Introducing mutex protection for map and buf lifetime
> - Serializing buffer and map cleanup against device teardown
> - Skipping buffer and map operations when the device is already gone
> 
> These changes ensure cleanup paths are safe against unexpected
> process aborts and prevent use-after-free and kernel panic scenarios.
> 
> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 57 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a9b2ae44c06f..3521518f9fe5 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -255,6 +255,8 @@ struct fastrpc_session_ctx {
>  	int sid;
>  	bool used;
>  	bool valid;
> +	bool allocated;
> +	struct mutex mutex;
>  };
>  
>  struct fastrpc_soc_data {
> @@ -335,9 +337,14 @@ static inline u64 fastrpc_sid_offset(struct fastrpc_channel_ctx *cctx,
>  static void fastrpc_free_map(struct kref *ref)
>  {
>  	struct fastrpc_map *map;
> +	struct fastrpc_user *fl;
>  
>  	map = container_of(ref, struct fastrpc_map, refcount);
>  
> +	fl = map->fl;
> +	if (!fl)
> +		return;
> +
>  	if (map->table) {
>  		if (map->attr & FASTRPC_ATTR_SECUREMAP) {
>  			struct qcom_scm_vmperm perm;
> @@ -356,10 +363,16 @@ static void fastrpc_free_map(struct kref *ref)
>  				return;
>  			}
>  		}
> +		mutex_lock(&fl->sctx->mutex);
> +		if (!fl->sctx->dev) {
> +			mutex_unlock(&fl->sctx->mutex);
in this case, should you still delete map from fl->maps list?
should you still do dma_buf_put to remove dma_buf reference?

Also, there was a recent change where fl refcounting was added[1]. Can
you see if you can take use of that mechanism instead of adding checks
at all these places?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=e85eb5feca8e254905ffa6c57a3c99c89a674a0f>
+			return;
> +		}
>  		dma_buf_unmap_attachment_unlocked(map->attach, map->table,
>  						  DMA_BIDIRECTIONAL);
>  		dma_buf_detach(map->buf, map->attach);
>  		dma_buf_put(map->buf);
> +		mutex_unlock(&fl->sctx->mutex);
>  	}
>  
>  	if (map->fl) {
> @@ -422,9 +435,18 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
> -	dma_free_coherent(buf->dev, buf->size, buf->virt,
> -			  fastrpc_ipa_to_dma_addr(buf->fl->cctx, buf->dma_addr));
> -	kfree(buf);
> +	struct fastrpc_user *fl = buf->fl;
> +
> +	if (!fl)
> +		return;
> +	mutex_lock(&fl->sctx->mutex);
> +	if (fl->sctx->dev) {
> +		dma_free_coherent(buf->dev, buf->size, buf->virt,
> +				  fastrpc_ipa_to_dma_addr(buf->fl->cctx,
> +							  buf->dma_addr));
> +		kfree(buf);
kfree should happen unconditionally here, it's a leak if you skip it.

//ekansh> +	}
> +	mutex_unlock(&fl->sctx->mutex);
>  }
>  
>  static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
> @@ -447,8 +469,11 @@ static int __fastrpc_buf_alloc(struct fastrpc_user *fl, struct device *dev,
>  	buf->dev = dev;
>  	buf->raddr = 0;
>  
> -	buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
> -				       GFP_KERNEL);
> +	mutex_lock(&fl->sctx->mutex);
> +	if (fl->sctx->dev)
> +		buf->virt = dma_alloc_coherent(dev, buf->size, &buf->dma_addr,
> +					       GFP_KERNEL);
> +	mutex_unlock(&fl->sctx->mutex);
>  	if (!buf->virt) {
>  		mutex_destroy(&buf->lock);
>  		kfree(buf);
> @@ -491,6 +516,10 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
>  	struct fastrpc_channel_ctx *cctx;
>  
>  	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
> +	for (int i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
> +		if (cctx->session[i].allocated)
> +			mutex_destroy(&cctx->session[i].mutex);
> +	}
>  
>  	kfree(cctx);
>  }
> @@ -855,19 +884,28 @@ static int fastrpc_map_attach(struct fastrpc_user *fl, int fd,
>  		goto get_err;
>  	}
>  
> +	mutex_lock(&fl->sctx->mutex);
> +	if (!fl->sctx->dev) {
> +		err = -ENODEV;
> +		mutex_unlock(&fl->sctx->mutex);
> +		goto attach_err;
> +	}
>  	map->attach = dma_buf_attach(map->buf, sess->dev);
>  	if (IS_ERR(map->attach)) {
>  		dev_err(sess->dev, "Failed to attach dmabuf\n");
>  		err = PTR_ERR(map->attach);
> +		mutex_unlock(&fl->sctx->mutex);
>  		goto attach_err;
>  	}
>  
>  	table = dma_buf_map_attachment_unlocked(map->attach, DMA_BIDIRECTIONAL);
>  	if (IS_ERR(table)) {
>  		err = PTR_ERR(table);
> +		mutex_unlock(&fl->sctx->mutex);
>  		goto map_err;
>  	}
>  	map->table = table;
> +	mutex_unlock(&fl->sctx->mutex);
>  
>  	if (attr & FASTRPC_ATTR_SECUREMAP)
>  		map->dma_addr = sg_phys(map->table->sgl);
> @@ -2246,6 +2284,8 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  	sess->used = false;
>  	sess->valid = true;
>  	sess->dev = dev;
> +	mutex_init(&sess->mutex);
> +	sess->allocated = true;
>  	dev_set_drvdata(dev, sess);
>  	sess->sid = sid;
>  
> @@ -2260,6 +2300,8 @@ static int fastrpc_cb_probe(struct platform_device *pdev)
>  				break;
>  			dup_sess = &cctx->session[cctx->sesscount++];
>  			memcpy(dup_sess, sess, sizeof(*dup_sess));
> +			mutex_init(&dup_sess->mutex);
> +			dup_sess->allocated = true;
>  		}
>  	}
>  	spin_unlock_irqrestore(&cctx->lock, flags);
> @@ -2282,6 +2324,11 @@ static void fastrpc_cb_remove(struct platform_device *pdev)
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	for (i = 0; i < FASTRPC_MAX_SESSIONS; i++) {
>  		if (cctx->session[i].sid == sess->sid) {
> +			spin_unlock_irqrestore(&cctx->lock, flags);
> +			mutex_lock(&cctx->session[i].mutex);
> +			cctx->session[i].dev = NULL;
> +			mutex_unlock(&cctx->session[i].mutex);
> +			spin_lock_irqsave(&cctx->lock, flags);
>  			cctx->session[i].valid = false;
>  			cctx->sesscount--;
>  		}

