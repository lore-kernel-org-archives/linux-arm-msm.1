Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125A42E7366
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791951062; cv=none; b=DIk+N99sQEH4Gnyj3Mbi9K088+kMsw67ukRzYz609V6ZWUdU7bF644fcFY8BTMIqjzXPbyTBh6BAAYnWLCf4+hnfH40hwUSjdwJZBUuI9yer21guYl/rxeoy7hzsdfynjvOge3H2ZztPwJ3pSaduJUNRvpsO0ApnKaF4VnDMI94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791951062; c=relaxed/simple;
	bh=fG6F8KW3//QwM2F9KwqNIGjLe9hz5DHZCbg3uV2d0JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1Z8YxDBCw90EdXBdx+M7/B9zVIqwt7eJ18Ixkf3qjsDhUZassCJjfTSlEypq9YCRIBUexy86OGxXXuNob5FuC9cpakPP7wFGNP7lhuT5gA36K+MA51tGBbs82lpj7WL26wut0fBdhbVesJztygukA5PHGdi6eNXlxn6p6tB+uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0NuLLlk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dzebd5Z2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0NuLLlk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dzebd5Z2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DNCgDo2087990
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tQ/c0uS9hC5Os56HC6aI7TxaXNDLsi+KoptbI4i6IM=; b=R0NuLLlkhxeN/yPD
	2psNOAKDD8g2at7B3HZwUIGuZnsOQNPddoXeG0VZqy1h2tO7WVSe982vJS0Mg4+q
	68eYvgxZddQOdD8AlpUqGHAjkpKnm38kJXgnfygwxHdMuPzO0qWENIS9r7hyI7nW
	yJ06jyakCUj0aSJOOhpKf4pFY5c8QZ/1HQMzBnR35vrg7rhYAY6IWgmluvtmc2nn
	Eo42Hq2LVj44+JCD4jFtt6Y/WPy/WbOKe8k1IN4FfM6c2m3xEjfLpN2Q/bh6VuCr
	dIRk4aYYTc7jDyCM6xVc1YVCp6T0Z8k2kuLlmTS065bFtVU8p7l1OyCosFqwT9wY
	DCE8vQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49gvrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 04:11:00 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso2064053eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 21:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791951059; x=1792555859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2tQ/c0uS9hC5Os56HC6aI7TxaXNDLsi+KoptbI4i6IM=;
        b=Dzebd5Z2Jh5LeiZYU2rNHENpYk+CRb5MfVKSvI3QF/1hyA3QicdV7pKLT1EGbHvdHs
         0AAKez+QT1QhjVTUAOzXnuaAS3FVHkYoMdnBZhJRprO02bxTtrBgMRyysbGIyXVK6PwR
         vi0kZHjh6vChdsZiB93kZ4kUE/XQDNQ/gHBiL5XGCInTOY/zkcaQK+5KjaY/Sb18a0eG
         CVcMu0Osuj5ke/t5Gusu/nE2cxMBSAQUjegBvMYTLllsNPBlrpwDHdNUl4qub2dX/fWO
         ONPQvFcXTK5NZFjA3yqgv/6sQws2AbeWyJk/lA2AnFm/Lx20bHCeFxhZsCBfWhWDPdvh
         BBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791951059; x=1792555859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2tQ/c0uS9hC5Os56HC6aI7TxaXNDLsi+KoptbI4i6IM=;
        b=BxdCpKiGftmAi43qP/31vJ4WJSBS2jaK5OBJw6l5LsqZ041ZeKN9ZL+982l3eYRhVT
         cOK6Gcb9nfmICIHSOPdvySShlW1ytq4NAI23K5BaB/8yilKtmpJKK8DnPOkmwJM42apG
         t6r7LgWGxttCxggj7J1xEzk/pXqJai3sFNioWrA2UP0y/cKb2JrRxx30gG7Rh0LI375D
         xWJGvm9Vga6rTUlxuPUi6UJWYApCmucEjsGbnzbvlt3QbGxhasf7QuYkrkzvajOBm0av
         sgRwM6XKuF1G5ivxRxS/5VI8NpOezsbftNLk6gPLSlj1cbvpLZajEY6HmhDae2ySqqQn
         rBRg==
X-Forwarded-Encrypted: i=1; AKwUvByNoPwiiMcWT0fwO6U+NSIoxLwYBxN93G7lA5brxTFhpV7Hho+d39QqENcEeIrxhDnEkL+Hvr5vsoBCL6gZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKv5dJx6+/WDONpoXOV/ND1FGdk++bBWP5RL/sInbEb3gH5bYjq
	77821MROIyFMDzCK+ougr+Z2l0yuUwQ6EfyJ9WR4kHsMkNMCSRcO4+o3PGhU7s+ojBssTvCnqK0
	J7WPtcgJBNV/dL7lXNWUA80Gt+KWotN3atjT4meHQR08T3TxE5HY9wnG9ZPVnX/yLSpqG
X-Gm-Gg: AYBFou0Pc6gi73fuSIQnmfrW4yXC19qC1r2ACl25KQ3hSt439U/7tYLvFSE3QHN3sL2
	IeHvFQ6TbcKbjS0l2pYSwmrrYdrDR9yfH74o2+BfxL2wZ1H727CXIRMr+yP8RqXRFv8T14yBF1U
	4GjAarUtvuhhz5DxNrJ3IUm4u5ahSIM8Ccrcvjv421Ay5FXgAClbG/s+Xpot9uUMNeEZsdjvxmO
	JnLfxZQ2kNV0/BZhh44UPGmqG9ILXIOFraN5a8pEnkimSruRtQE/zQHYzdmZZgiQKePYk14jmuq
	UsrU6SWrruTgz8bhqbiPBmadW88p8T3WN60C/44OIXvzT2IXQ9QAIxOgJREajqCgGYboOAZBZNQ
	18eoVjfx5cOdC9J5IN1BRZlsObgjs+g==
X-Received: by 2002:a05:7300:e9c5:10b0:359:f28:412d with SMTP id 5a478bee46e88-3590f28533cmr16950845eec.36.1791951059347;
        Tue, 13 Oct 2026 21:10:59 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c5:10b0:359:f28:412d with SMTP id 5a478bee46e88-3590f28533cmr16950811eec.36.1791951058726;
        Tue, 13 Oct 2026 21:10:58 -0700 (PDT)
Received: from [10.219.56.188] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca6d20dsm52191349eec.12.2026.10.13.21.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 21:10:58 -0700 (PDT)
Message-ID: <73949657-9beb-426e-a966-6f990eafa247@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 09:40:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] misc: fastrpc: fix init ordering race in rpmsg probe
To: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20261001-fastrpc-probe-fixes-v1-0-1376d93b8b3e@oss.qualcomm.com>
 <20261001-fastrpc-probe-fixes-v1-2-1376d93b8b3e@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20261001-fastrpc-probe-fixes-v1-2-1376d93b8b3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf00d4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jkHBZFC6afHL268QTXoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNiBTYWx0ZWRfX3BIAlOyxC02w
 mkr/jylhE2Bx1e5WsVYJvUxDR+XiCkJihYQeoOUdtUuWK4wRzIZnnKy3pUO+79RwbgZsyI3bf6P
 hIxayMkR2W7St8zUntuT59pTGY+4tgT/DQFPW5IoSsvrEe+dNbolv5wz+Zm7pd62feowlU0YldX
 A9nAhdI/etPrGxT1U5jyTFNUfVzYuYTo+7/XGscXMWjjzUzBDS3uMD/R+lpbJwrtvKXp02KKpRV
 jTk6Wl5afIy2AktmCTu3a2cOa/FFNBqa8VRxeB64McyefpWkkuKNnnkiJ2QnL63z+gjP8noNfoF
 ZbpT722K4ljlk8dX/lc40qY9LA2qrcNpgJS3sEanUwbHTjIN6LMDIWegz2NNWzVZRwTJymRLzXe
 CbaTdXaEQsx9aAM2cPXn8cFdXZN8m/Hlsg62MDEWj/IrSIlIuU63McNOlLW0Mwha+nlbaJTDeLM
 RrusSUA/AqkA5EiL1mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNiBTYWx0ZWRfX+kEdDJq7aYV4
 QaIQiutwJzDXOO8Xequqlmkn94Hr6ZVr7WUgFIPTl9LQMbAd6IOHbKig6X0pU7e3F58bp4/6OUH
 NYtRviJyKlE1AtXpxnJSrHUCLt7Bimw=
X-Proofpoint-GUID: xBCBVIvLT2l9OnRYAx5newzM4DOgp57U
X-Proofpoint-ORIG-GUID: xBCBVIvLT2l9OnRYAx5newzM4DOgp57U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140016

On 01-10-2026 16:31, Vinayak Katoch wrote:
> fastrpc_device_register() calls misc_register() which makes the device
> node visible to userspace. However, kref_init(), spin_lock_init(),
> INIT_LIST_HEAD(), dev_set_drvdata() and fastrpc_cb_devices_create()
> were all called after the switch/misc_register block, leaving a window
> where userspace can open the device and call fastrpc_device_open() on
> a partially initialised channel context.
> 
> On a concurrent open(), fastrpc_channel_ctx_get() calls kref_get() on
> a kzalloc-zeroed, never kref_init()'d refcount of 0, triggering:
> 
>   refcount_t: addition on 0; use-after-free.
>   Call trace:
>    refcount_warn_saturate+0x120/0x148 (P)
>    fastrpc_device_open+0x204/0x258 [fastrpc]
>    misc_open+0xd8/0x1a0
> 
> Additionally, fastrpc_cb_devices_create() not having run means
> sesscount is still 0, so fastrpc_session_alloc() returns NULL and
> fastrpc_device_open() hits the error path which calls
> fastrpc_channel_ctx_put() on the already-bogus refcount. This
> triggers the free callback, kfree()-ing the channel context. A
> subsequent IRQ-path fastrpc_rpmsg_callback() then dereferences the
> freed spinlock:
> 
>   Unable to handle kernel paging request at virtual address ffffcd5841510ca0
>   Internal error: Oops: 0000000096000047 [#1] SMP
>   Call trace:
>    queued_spin_lock_slowpath+0x414/0x5e0 (P)
>    _raw_spin_lock_irqsave+0x74/0x90
>    fastrpc_rpmsg_callback+0x4c/0xf0 [fastrpc]
>    qcom_glink_native_rx+0x6c4/0xf10
>    qcom_glink_smem_intr+0x1c/0x38 [qcom_glink_smem]
>   Kernel panic - not syncing: Oops: Fatal exception in interrupt
> 
> Fix by moving all channel context initialisation (kref_init,
> spin_lock_init, INIT_LIST_HEAD, idr_init, dev_set_drvdata) and
> fastrpc_cb_devices_create() before fastrpc_device_register(), ensuring
> the struct is fully ready before the device node is visible to
> userspace.
> 
> Add err_depopulate label in the error path since
> fastrpc_cb_devices_create() now runs before misc_register(); a
> fastrpc_device_register() failure must call fastrpc_cb_devices_destroy()
> to clean up the compute-cb children before freeing data.
> 
> Fixes: 3abe3ab3cdab ("misc: fastrpc: add secure domain support")
> Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Cc: stable for both the fix patches.> ---
>  drivers/misc/fastrpc.c | 43 +++++++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7ab1cbbf19bb..93d07d28a0f1 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2614,6 +2614,23 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	data->poll_mode_supported = soc_data->poll_mode_supported ||
>  		of_machine_get_match(fastrpc_poll_supported_machines);
>  
> +	kref_init(&data->refcount);
> +	atomic_set(&data->ctx_seq, 0);
> +
> +	rdev->dma_mask = &data->dma_mask;
> +	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
> +	INIT_LIST_HEAD(&data->users);
> +	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
> +	spin_lock_init(&data->lock);
> +	idr_init(&data->ctx_idr);
> +	data->domain_id = domain_id;
> +	data->rpdev = rpdev;
> +	dev_set_drvdata(&rpdev->dev, data);
> +
> +	err = fastrpc_cb_devices_create(rpdev);
> +	if (err)
> +		goto err_free_data;
> +
>  	switch (domain_id) {
>  	case ADSP_DOMAIN_ID:
>  	case MDSP_DOMAIN_ID:
> @@ -2622,7 +2639,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		data->unsigned_support = false;
>  		err = fastrpc_device_register(rdev, data, secure_dsp, domain);
>  		if (err)
> -			goto err_free_data;
> +			goto err_depopulate;
>  		break;
>  	case CDSP_DOMAIN_ID:
>  	case GDSP_DOMAIN_ID:
> @@ -2630,7 +2647,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		/* Create both device nodes so that we can allow both Signed and Unsigned PD */
>  		err = fastrpc_device_register(rdev, data, true, domain);
>  		if (err)
> -			goto err_free_data;
> +			goto err_depopulate;
>  
>  		err = fastrpc_device_register(rdev, data, false, domain);
>  		if (err)
> @@ -2638,26 +2655,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		break;
>  	default:
>  		err = -EINVAL;
> -		goto err_free_data;
> +		goto err_depopulate;
>  	}
>  
> -	kref_init(&data->refcount);
> -	atomic_set(&data->ctx_seq, 0);
> -
> -	rdev->dma_mask = &data->dma_mask;
> -	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
> -	INIT_LIST_HEAD(&data->users);
> -	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
> -	spin_lock_init(&data->lock);
> -	idr_init(&data->ctx_idr);
> -	data->domain_id = domain_id;
> -	data->rpdev = rpdev;
> -	dev_set_drvdata(&rpdev->dev, data);
> -
> -	err = fastrpc_cb_devices_create(rpdev);
> -	if (err)
> -		goto err_deregister_fdev;
> -
>  	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
>  		struct fastrpc_session_ctx *last_sess;
>  		struct fastrpc_session_ctx *dup_sess;
> @@ -2682,6 +2682,9 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	if (data->secure_fdevice)
>  		misc_deregister(&data->secure_fdevice->miscdev);
>  
> +err_depopulate:
> +	fastrpc_cb_devices_destroy(rpdev);
In case of CDSP/GDSP, if secure device register is successful and some
application opens device, that could result in cctx ref being taken and
direct kfree(data) might cause problems, can you check that path also?> +
>  err_free_data:
>  	kfree(data);
>  	return err;
> 

