Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792984164;
	b=DvhvlkDzgn7OXq5sxfgsCam9989pSE8sdFZ+S1FBLU+UgzNim8TIu7AkgR+4ENORakhB
	 5KkWzQ9WauM69pXjQxq6dv8A/tcRxFx3liSU1L9N4ymvzFuOzFX4D8WYQ301CTTAgLxRp
	 vgZGwOcwpzHC7x3Dd7EbbbxzFgHSR7EJbnTo/+pqlGcaBrnZQwqJYNbFLu8tM7rKTV78J
	 K22vtnm6z4dSPbje96kFz0ZcQx84KzCBuJS9pvzY1u57MCvMK9Z1TdRZG6kvV8VjcCmnA
	 jvLP728MOT/2l+Q5VIA/mWG3yfNsp+gDibR1iKbF4UWlfPGl+Sj4q+hR5IrWkJfKjLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984164;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SgSpBWnPBxyf15iYq1+d2gywSzNfOx3Fmff4tI5lniU=;
	b=F3Eio/CjF9POAuzOYkDVPFVZboRXxALEsT89/tWlOLAzIUhFY7RMHz1EFXUDn7Uzlx20
	 7NfzY7HflC7CeR5UWwmmUooGxOU72gJrQeAgXOcXtXrpeHhc/Xi+qIMAR1Yzt9bAuUTxW
	 q5iOFABtjWz+G+80O4Hnw/Uiz1Rfo1juhkucwOTx4Y+UrFg73fzExUosJKj7DjCjGGRe3
	 ruoE1CHqekWqQEdEOu1sI9is78/gJXC4MqspK3Y1Q+FafcKHPylgda55hL1peiYQOwdGz
	 pYubehM493tgdiwHD1N8zrfVVX5FhzP/XVBLlES1O+wb+uzE8VYG2el/zLzdbpELRZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dUd1zGgg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrlYzFaN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544FD606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:09:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 544FD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dUd1zGgg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrlYzFaN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q2KlYg431813
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SgSpBWnPBxyf15iYq1+d2gywSzNfOx3Fmff4tI5lniU=; b=dUd1zGgg+y2P+cVB
	gG1F4r1mjwo9Z6GZlYm3hJMhlMpWmTJt+LGqYoG2vNkupDFwNnA7E2ZgWgAz5tHR
	EGeapD4PAacE2uwyvEKVQESQ46Y9IunUoMyNAE6T/bEAygCOOEjEDhMIOPgs+9n5
	u+ONQW26qA1Hn/GlWr6shMAqij/i4Xncsvqy7nY7o6WSschcfviHLbiVTNovp5qJ
	0uehcsSU27OD5qdpG0mmkmreHJVtlZSFlltTKRyoGrgrcH2beBwGAWel6zt1wgPd
	+pDJEvmJEZ4US1JA6NweMBUJzr8o0J+QXYdWwfTcDpPvJ9EA++u+VQrs7UKB+K32
	rCSFkw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgsrkuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 03:09:23 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so1787542b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 20:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792984163; x=1793588963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgSpBWnPBxyf15iYq1+d2gywSzNfOx3Fmff4tI5lniU=;
        b=DrlYzFaNhuQwmhU+dCZn3P6vi/0xJN9HL6Uf1rBxe3HzQ6zEue63fw+7dZx2Km7GI0
         875tuGI+cu2u2ZKBThYcboHIY+apj5oDdfGUrJXZgdLtEkjII9KvF/P7wsjrf2HU2lh3
         ZR2pAZFwh/jFeZETfNF4NHO11QbpvbAcciliANcEJiWTButfz7PxgE5vC8+yGNVyFA8U
         l9qUDxTuQYoYkQhg6Kg0V8cu3EMycdxjQ4dvkVzhH/6i+4A/V5XW5eV67AdmJaaFXXHa
         ZE6C57LfmYVHykW67myhawvxCrkQUW2aFgn3Ko3nYS8oSQ1Is/fVVXDRA7zOVZQVElMt
         ZgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984163; x=1793588963;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SgSpBWnPBxyf15iYq1+d2gywSzNfOx3Fmff4tI5lniU=;
        b=onJ6hlmrm/9tcE5h30AqkR6KubpN33ttR7KSnMDu0Sj/D8OwS+UCU1oUDBE4UAMwV3
         oWKfkQPPdwnY4hQGVs0Ut/WoI7X46/chHdY8li3+vBgCwxD5bVtQ59jbNdxuKtgMLD4z
         ZNPQLZISP7MPJBb/xQf7HKciGD4pLdCIXrVQ8AOqIGf5PGJUpE3HdQtfBj4Dy6NXQehN
         VTXo9lY3jlyQCbi4K8C0gnfb6vth4NBZGHD4RM28lxmvfkgFu7BamUN5IkFuQCuKeKFx
         Sfl/2w3LaCiqZusctzsCAmZDjEKdKVpyO2xfb6MJs50fNYfvyc/dBNtQ/wxWcZ6zC232
         lwqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwskxiuiF7xubIR0/isq01N60rUzzp6dd1kroRK02EKbV5WgvNryLbo8s6wpoMfxDnTcE9kohKy1Y1r/m9w@vger.kernel.org
X-Gm-Message-State: AFq9FYKIHVdjcOVfVrlcDLlaV5PejmieqIVkwCjSLpFa7ggNchS2RXor
	XUiThGomdIux0uU2X8SkrZUCyt5vJvz3ON1MvodJoh7HjErrAYGWTUT8GXUZjLB+h/2aY4cKSQM
	9bpwhfZWn0FprAajEeWovZa43o14IfDo0pQlJyX6gEpgxwSjXEiDAptQpdUinzYjTGnM=
X-Gm-Gg: AYBFou2DxHqUQC8q78AZCY51XL6d5iJZweNHZmfCEalUQ4yXmbsIwdkGubYFZh/Dri4
	db8DnLSZ4fOUS6uKMhmX1W8/1eP3gitog0wNt255dMlwdJDIwercS2HJcnobSL8M35gZIEmM3mT
	ynCcl3Pnd7XsFwhWopC0/BDJZNnaicXFsHeLm9qkck1JD+CSQOSVBWAXuSNM5pQEOhdIWKTGjmO
	qQVXXdUMzMEsAhK2SUG/Ybzddp1Qx/Zb0FSfJiBXN+St3MCUXDTfjHLfsYi1OXI4kZsAZ3nfvVw
	cWy4GNqv3AoNQlQgCWAH6Yj5SiMjExm7vxjEjfYpUxk/V38tqsZO3s9ToABtXAF5LiSpTJC44Bl
	SIuUu0Rlfb2sztIti+wOQyWHL1wi2FY0X
X-Received: by 2002:a05:6a00:a387:b0:890:bd5c:5710 with SMTP id d2e1a72fcca58-8a369072ee8mr4274279b3a.41.1792984162616;
        Sun, 25 Oct 2026 20:09:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:a387:b0:890:bd5c:5710 with SMTP id d2e1a72fcca58-8a369072ee8mr4274250b3a.41.1792984162140;
        Sun, 25 Oct 2026 20:09:22 -0700 (PDT)
Received: from [192.168.1.86] ([206.83.119.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867adsm810745b3a.5.2026.10.25.20.09.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 20:09:21 -0700 (PDT)
Message-ID: <5d260732-c586-42b6-b7a1-e8eca9c41229@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:09:16 +1100
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
Subject: Re: [PATCH v5 2/7] tee: Add kernel client object invoke helper
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-2-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxMiBTYWx0ZWRfX4M9R51thJVzC
 VqNEclfO0W/ooZqaErDwwskJJjv9cYpZUFDvvKLyDKRSAWKmigQni33IonYekdUXj15Ipm6QxAE
 MffDR4NwnmFCRjMI3Xm9WpupWDQoh1k=
X-Proofpoint-GUID: 1v-y5JU-QhIHb3ftZiOAzuHZJBdtvke_
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adec463 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=pnHLkUe0LhHGSDu6DPowAg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Vsz39dQLEg-ztEiNogYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: 1v-y5JU-QhIHb3ftZiOAzuHZJBdtvke_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxMiBTYWx0ZWRfX/oyda5E3Pd2p
 nLm8p0neypfsDb26L+oNLFSgTOM7GfpDfNcrqiTqmuALzOE+sWyrJ7gTyK75FKnbi/fiJlsHNPF
 wUlupx7/HvAlq0vViE6WW/l/6d1GrKj/8oe8017NeAIn/g7yTJej2fsLUJqg+bsZHawI8OQUyp1
 WrCnDawkurGbjh0yMrdm/Hy1jAtoG3uyEkagbIg0bIvxszWqNzmtIx/fgfg+XHslzXXRD8xHgIv
 Mo5C9JKNKbhsyNIsX8MQcDLwg1eGrDPILcx8cAp4WrQg/373ft1lAhf2FfAlcJnjZZc0C8Ta9pD
 WJCFl1xc0fEOFoIotdld5kCFCEru78ih0bbadUsGPuoIAO8He3uo1da7H75elJtiPkL2G2Hx7L6
 zzOusCzdVbMIt1NbOkrLZNn0mIog6ES4n8bY/I86qxM3+lFK7azLJ4Wbh/FQWJS6HdJT6j+2Xjq
 d/flAlqatggNwnEskDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260012

Hi Harshal,

On 10/15/2026 10:39 PM, Harshal Dev wrote:
> From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> 
> Kernel clients can open a TEE context and invoke regular TA commands
> through tee_client_invoke_func(). However, there is currently no
> equivalent helper for invoking TEE objects.
> 
> Add tee_client_object_invoke_func() as a kernel client API for issuing
> object invocation requests. The helper checks that the backend provides
> object_invoke_func() before forwarding the request by setting the origin
> as TEE_OBJECT_INVOKE_KERNEL. This allows TEE backends to support
> privileged object-based calls from the kernel-space.
> 
> Co-developed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

I did not notice this patch has my signed-off tag already.
You can drop my Reviewed-by tag.

- Amir

> ---
>  drivers/tee/tee_core.c  | 12 ++++++++++++
>  include/linux/tee_drv.h | 13 +++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> index 30901390149c..a03a3d645dd1 100644
> --- a/drivers/tee/tee_core.c
> +++ b/drivers/tee/tee_core.c
> @@ -1404,6 +1404,18 @@ int tee_client_invoke_func(struct tee_context *ctx,
>  }
>  EXPORT_SYMBOL_GPL(tee_client_invoke_func);
>  
> +int tee_client_object_invoke_func(struct tee_context *ctx,
> +				  struct tee_ioctl_object_invoke_arg *arg,
> +				  struct tee_param *param)
> +{
> +	if (!ctx->teedev->desc->ops->object_invoke_func)
> +		return -EINVAL;
> +
> +	return ctx->teedev->desc->ops->object_invoke_func(ctx, arg, param,
> +							  TEE_OBJECT_INVOKE_KERNEL);
> +}
> +EXPORT_SYMBOL_GPL(tee_client_object_invoke_func);
> +
>  int tee_client_cancel_req(struct tee_context *ctx,
>  			  struct tee_ioctl_cancel_arg *arg)
>  {
> diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> index f3c5e106d853..369c87ad0205 100644
> --- a/include/linux/tee_drv.h
> +++ b/include/linux/tee_drv.h
> @@ -283,6 +283,19 @@ int tee_client_invoke_func(struct tee_context *ctx,
>  			   struct tee_ioctl_invoke_arg *arg,
>  			   struct tee_param *param);
>  
> +/**
> + * tee_client_object_invoke_func() - Invoke a TEE object from kernel space
> + * @ctx:    TEE Context
> + * @arg:    Invoke arguments, see description of
> + *          struct tee_ioctl_object_invoke_arg
> + * @param:  Parameters for the object invocation
> + *
> + * Return: On success, returns 0; on failure, returns < 0.
> + */
> +int tee_client_object_invoke_func(struct tee_context *ctx,
> +				  struct tee_ioctl_object_invoke_arg *arg,
> +				  struct tee_param *param);
> +
>  /**
>   * tee_client_cancel_req() - Request cancellation of the previous open-session
>   * or invoke-command operations in a Trusted Application
> 

