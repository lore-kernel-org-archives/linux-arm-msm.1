Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712430;
	b=BWw7pfuJbDICDDaBr6uq4vaFTmS1uzDw2LkxNBSRh7H7xV5Q6N1RuwByVBnCZ/MvUsyL
	 gnzHPAIiV44Ys9gsyiM5STclwuyF4Sbx8Ixjkzft2pDZxnV4txxyfjzMyM6P07a+SEQRk
	 mNhceNFlyfIoZXk8yTXvnqGC1QRxZvNtnaFLiRYLo1QR+delpYNMM+SsL74XhXyK1MU1x
	 5gZ1kMuSCbr3fGfsiS3ErE5WbvuNsbHpcOl5S6v1Dvbvrp/taZgWBI6/PEqoVRU1zsyO/
	 ePVeavyAb/UbbeUxFm9K09niPeQgSoiUticTO7cQ/yXYsxobOa19XPutCHIQVb8GIVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ta7vqfu43+eJdwILEtJUiCIzSZFnqUgMnY49Wv68/Ms=;
	b=dEuCnp4R2MW1N1+QVDayM2FLaIxDZNFcVF179g45kBjQL5w+/I0FAkowzR62815EYg5C
	 U+3JrLKL5YPMywE7Sgb28HsHi6Jb0Go/GXotoQMYHWnyVxbZ8qRxYws4bSvdL6EN3C5b0
	 YLaaHBsVGBAfuHPP75tA5uFMD6NNyJbtxGt1TFYwxD6dNpG1yq7fsKW7Nkse3c4uPv186
	 OAUOrLUoab559LqoJk+ksuGjEgWIPRQnDmUkP+FZaH2IQEgwGW8kt748Zv1xhr5T5vbfC
	 UAz9NaYDYGoGwqCFtNpMuxMcA1PujCwDfhI6osdajeJEE0CRuL7lWLsji8Mrsr8MllQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFRyNSk3;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCBC608362A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DCBC608362A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QFRyNSk3
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so31579675e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793712427; x=1794317227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ta7vqfu43+eJdwILEtJUiCIzSZFnqUgMnY49Wv68/Ms=;
        b=QFRyNSk3MIGPcPGWWiMdc8sLrAkZyrmXyBSaJ4G2CZv2ajMG3p/eDD5KRL79rX23Jw
         gGjN0UgPiE/T4N8DlOTIaNbnX4CTHrANgdoHCor34RoKg3bUYSL4x7BQ+dXaUbU48weE
         HlDdpHouawugcAymcWBAH6jTgRb1VtoZ5Y0ArCo3l2OgbVYIeaLRmu8SA3BNSg7DxNwQ
         nn3d7q5zNzLqOrmrMEpP84DhtxiBfko7gfUlYgnFXmYfT+IIXCbOprRm71JUMNPCXmis
         VTMyllKDZWgYPA0USFYGAXEiwE+9aQb4iItSkr35CedLAbP5uFmkKuC1iCDWdEnveWAp
         M8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712427; x=1794317227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ta7vqfu43+eJdwILEtJUiCIzSZFnqUgMnY49Wv68/Ms=;
        b=NWiQ91Y6JsBBTKFIJOclRo1wmkj1bfzMoe1JXVVPDSVAU+IoUEfko0j8p3Big0+mS8
         8ol8Xo5MizZeuoOXO3ttfFZQJXWiDQRNOciUcw64MBnVG/3z8btZjGnhM6nJGBxAMHng
         z+g5qb4XaL2AvX/0w1Cl9HrPqnOiZezqMqCr60MYe+TZD3Tww4c5de1Ow0KKdauDji9n
         vOYby01DmEro1OeidAzhLBeWrCBKqaIINFTEgOh29kJKIaJSPlK2O2jUV9k0yyVOMiKF
         r3BB0zaWQjf4Wak7sQVi9UC/U3kwyu1jordRYXzOY6sk/ixCAMqyWl/rSbTPeeXa3N6F
         6KPA==
X-Gm-Message-State: APuU4Z9UUQbKsPxkRrU9QcuSfaYIwLMrySHHuYYL6CI7wvkY3XTuwSVo
	3OTHSZG8TkNiFquzr32sLjD8ge0IhVm+b0mCcnQAhGh4K6dNnmd4ebU=
X-Gm-Gg: AYBFou1dSPtDhLz2x4p6d/GWpVMxEQeSDaxGck1tbIJ3dNznVnsjSN6EG+ui/VWLfPO
	U4xUQoS+Pjb+VX5aHFf7PQxNcbsVRmEuqlMNEeIKprCB+AH9P31COy8JhgKeNZH/SaE5gLXQdoK
	llrT+U99/inwA883MfUAVm3TZ/AYncQWpZvh1xX3Ek14HB7Dagua1FrL82Sp357rvLQ3zoL2SO9
	ZszUtD4LHgyRHiknqUdoj666enjCOCnYGFgHAmAAeonETISKCjbMZtZymsoE4b5C3Rw1z7RmDTm
	VVMTNcDC4Hphvwwbx27HX3nu7r4eXS6WDtivSrPGokqrhBijpkTvZXNBzm4siUIKZnVKrUiR73k
	Fanx1YLUZTWKNdEUL/u5xAnmWaPMdYtsGXrrJEIpQtdH/LzEn4UPhwDwF/qiLG1/SANIGs5PmAN
	4Ys12/xs7lw/ZhiJMENv/pWk0KGr/AFZzoLjdDrn+y+sHqOutVZEnFtmQBJsVYNor0zvGqpFXxm
	PQPTs/v/8Z4rL+//IkL/zycVjm0iReuaBT7DRhPhVIni3NKLWurVbjDk84aDpt0NiWiAzIu2+fm
	1QMwML+70b6KyOrGdevTPAvJsqA7TRmozDuAT6InmCDPx+kWzj8FphEseonSF/XtESedA2WzIy9
	g74aiVZj2
X-Received: by 2002:a05:600c:8b54:b0:4a1:fa21:fd90 with SMTP id 5b1f17b1804b1-4ac16bc547dmr316952755e9.9.1793712427364;
        Tue, 03 Nov 2026 05:27:07 -0800 (PST)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa38bb4asm57032565e9.6.2026.11.03.05.27.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:27:04 -0800 (PST)
Message-ID: <a3da6619-b40e-4118-ad52-bcbe319cd601@gmail.com>
Date: Tue, 3 Nov 2026 14:27:03 +0100
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
Subject: Re: [PATCH v2 2/4] drm/msm: Add cleanup help for disabling IFPC
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
 <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <20261102190010.720443-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 8:00 PM, Rob Clark wrote:
> Simplify error path cleanup for IFPC-disable critical sections.
>
> Note that this moves where we re-enable IFPC until after the
> wake_up_all(), but that is harmless.
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_gpu.h      | 4 ++++
>   drivers/gpu/drm/msm/msm_perfcntr.c | 5 +----
>   2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0334a0f604ac..e7912d2180a5 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -399,6 +399,10 @@ msm_gpu_disable_ifpc_put(struct msm_gpu *gpu)
>   		gpu->funcs->ifpc_update(gpu);
>   }
>   
> +DEFINE_GUARD(ifpc_disable, struct msm_gpu *,
> +	     msm_gpu_disable_ifpc_get(_T),
> +	     msm_gpu_disable_ifpc_put(_T))
> +
>   /*
>    * The number of priority levels provided by drm gpu scheduler.  The
>    * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
> diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
> index 867dd476ed88..995857273aca 100644
> --- a/drivers/gpu/drm/msm/msm_perfcntr.c
> +++ b/drivers/gpu/drm/msm/msm_perfcntr.c
> @@ -259,7 +259,7 @@ sample_worker(struct kthread_work *work)
>   	}
>   
>   	/* Inhibit IFPC while accessing registers: */
> -	msm_gpu_disable_ifpc_get(gpu);
> +	guard(ifpc_disable)(gpu);
>   
>   	if (gpu->funcs->perfcntr_flush)
>   		gpu->funcs->perfcntr_flush(gpu);
> @@ -295,9 +295,6 @@ sample_worker(struct kthread_work *work)
>   		}
>   	}
>   
> -	/* Re-enable IFPC: */
> -	msm_gpu_disable_ifpc_put(gpu);
> -
>   	smp_store_release(&stream->fifo.head, head);
>   	wake_up_all(&stream->poll_wq);
>   }

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

