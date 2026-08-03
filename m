Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DE639A054
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 12:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785760550; cv=none; b=Qe1n2LZsGoxfLlpdxQEm6drRkrVtef7xe0DOY87U8fzRTOZ+XwKBWtot3W5Ysw0xfAtTGe0IR4yN3VSfc2MuKx1PSr4Ss0boM6flNbi87WbQZ6l/BBCJdrDkheVEq5SnmlRjtG1a7y5WtbN4n9oqFmC1VkItTc+F5/mnn4WCl04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785760550; c=relaxed/simple;
	bh=99ukNQ7BdIOZb2JpWnfJu5Xs1lh7ce+r0U0zLUuRsrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQNrTeelFKWuTDKfUPE8Ozy9mXiw7+COnfoI7YMHBR50pagRs/gEJGX3KZvYEbGVol5D2BYHhnUPHHDWOn4ydcLD5sZfzk99Cfa0A3I5bbZ+9DABcyrJlLZCrpwl/sweJiMqwn1db7ZuNTJ14Spqp7lUcB3k4Bm6McVLQJ/i54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzz6n/gc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P33rGN+9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzz6n/gc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P33rGN+9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673C4jjL4143560
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 12:35:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vc34inBE7889SKrHzyISv1++
	OnZDLFt/IxkNd1Y3Ifs=; b=bzz6n/gcx4wNDTUR80fvp7zdbk1Np0p4Q0+DfsOq
	RUO4Rc9qgJKcKoE3mVBmJqfWPMTyzsGSgkppMaLQ+Bj1cLuU0ZpfO7fZjV+1g2N0
	UBqH2ZzLi5rZWy/Ggv4NXZR+N3+YyqQ7hfBEcg03V+V/OE97BsNkSojdbNPW+jBV
	j4srs+OQQNB7PYne39ga9tGf2ExmoUR6ktZu3wRs65eoN+LEDzm2W4KPLVyZNdBd
	cSY4LgRsZZhH6hdkeZp3IeP+gLZ/xzAfPFUL0vuf7ZqoKWAr4R2TJxNHSKWk6kw8
	EuWrqWc0aFe3DEvmbA/BvtolX/pVLJ59g55RnPmgbQdWXg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmxapvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:35:48 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8fc92c5373bso36390806d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 05:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785760547; x=1786365347; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vc34inBE7889SKrHzyISv1++OnZDLFt/IxkNd1Y3Ifs=;
        b=P33rGN+9HCFAXO5WLSwLhJckQTHxaHMtSNwSUWyJDwi9vEfxvMT4pf40u9N1yGSOPQ
         BMGWKGugfSCaf9ZExSSiZBKapmRMzYy9HhCNYkcYwLl/BT3S7rxVwt9IXFK/eJ9HIfga
         kBiTh44mWLrOEXKBlAav6/9J3re3PRGyGWcGMVyQrGiRIa33iqZ2k8V/H123BCtArmFi
         Tr7vehaDyIjXh69VwBc8IrvZ1tdtg0HWbOQjnEHZKxqOcDZpq5XOzdmRYyrhtblD/WiO
         d9/hEFonON/xe0LYeDhKCgQn1LKFEwppBPoJS/f5cqSWCzPnTZI76P+Mp/StMKl/Z6kr
         yvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785760547; x=1786365347;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc34inBE7889SKrHzyISv1++OnZDLFt/IxkNd1Y3Ifs=;
        b=rgn7820JdR8byjD186M+EKxCZkZsTXePDJhBVvBjnBS5zceQov2oFiImuO4Yf1NjXC
         TjK0iVYZSMJaGOOQpC2mt0hH1QYTzCUL4i6rsFMVq7Ffm+ojb5sAYmmVBFqMLyIgcnrM
         KRaCOxv3/k5Z94WSBApOz/djt88vGeIbBLVkkOJEO8+9o/WSoUqHIV09fWvU4xzip+Vv
         WKQaTP5Ga9W8Atxen3z8sDAR4UkSJuAdtp8xDtYULxhXZDSCvArMrXA0mHZJRDRqObJs
         bR1NpKmAMcUWOHnpRfOgCutqemadtlbywhMvRjBuKECSV0HNblfd3i/vHFR5kGuBBL2T
         FL4w==
X-Forwarded-Encrypted: i=1; AHgh+RqV1/NQeuJLE+nj0KDdlzj3XcrwuqOn2KlYiBDhZ175ZYJt3V3KOhskSSZroejMCU8/wO+MmG1NYcQIhJMg@vger.kernel.org
X-Gm-Message-State: AOJu0YyVbvo64PMl71iaxE8TZVVAUJ1o5/u2Vw+WaFOMLuu3cPKQb91r
	gdN7ZE7VQgz77Qtc+5+ZgcLdpE/0Un+9/1Xbu0qbJRX3npcXS3or1ngZdF9PexZ/qd/0IB5vABe
	TzglKEw4aN19uJ8BLQaYMmZ8airX0ml38636q4lhXBWdgUtJyG+WBWjavBheJmGfhQwbs
X-Gm-Gg: AR+sD12P+bDEWRr8FVtV4/afivz3xA4XJqVqiHarxF6yCwSKU9G3kvwvMHmmO/9c8FI
	6uyKDi2nVwWv5VA4b+gR8hHG1nmW79f3YXTKjOu/TW7Q7nuZGMwRqp5DnQYLkhQ0SjrSI56C94v
	qmuq4zXhAJ2R0hBgqFHtYLaShrD7i7nyQPGnj/EwxiM5jez+RaJqRm9B/VatOzHT2kr5B7+T0qo
	/kxqTFAAD0mxNJespaVB8+k58NgZmQgqFJzF6TEqwu5/y12FBk3ZvpVn9bJpq12bY70o4pdWEjP
	15RfapbF45gtIrf/296PY7E6bUfC0GAaIqf4jm6R9Jb2ayj+5zsCtL8GO+T5sYereVODvLUlKZu
	/kZCsOyYFzEic3e/HYKE6LBsYeH8=
X-Received: by 2002:a05:6214:2e4a:b0:8f2:1663:abe9 with SMTP id 6a1803df08f44-90849602f41mr218707946d6.19.1785760547049;
        Mon, 03 Aug 2026 05:35:47 -0700 (PDT)
X-Received: by 2002:a05:6214:2e4a:b0:8f2:1663:abe9 with SMTP id 6a1803df08f44-90849602f41mr218706876d6.19.1785760546375;
        Mon, 03 Aug 2026 05:35:46 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90843604cc4sm75444116d6.43.2026.08.03.05.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 05:35:46 -0700 (PDT)
Date: Mon, 3 Aug 2026 18:05:37 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
X-Proofpoint-GUID: ov6f0Olym1wP_r_C0XTWz13yOTvqpLvn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDExMiBTYWx0ZWRfXzjoqz6QtTkkD
 HgwmMImiwhruCylxddcpjBgM2ZpyE3BIejmZJK6G3l0gdcswLdAOvsc16LedThsPeqjiz7lCg29
 hRCg5Tg3prHZtH82VcdSyIqWEy6US9FyaTcZJaG0XeK56vzNUQirpWFoii5W40W79p1VljbQX3H
 adXqe0kPu84WUavj2jFqrMiC9Ff/5fpZKHSsN5GjLquJ+dcY+EiDnd9o/yhObzwRonkapMj+GdQ
 Q+Xy+uNGqFBqvdT9ta6HxUUfQTaePow1xxNsAXs8bwkGhtlH8F5VF3dEQHfa25BP3HjoHlVKVH9
 CRJucF8WZLRw8UkJCOWHeE1H6eSeqXXhjhJgwHITyU6lFawXRzY93DVeBZMTky6bLPIee90cwm3
 EsFsNDCM/s0EG4v11Gkrnagmj9BG8LdgDjOJnnXzy5c9hu/SPo1dpPIZi7b2sVrJWdN9qMx/DUT
 IOSS0LVruHOm9O7MUZA==
X-Proofpoint-ORIG-GUID: ov6f0Olym1wP_r_C0XTWz13yOTvqpLvn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDExMiBTYWx0ZWRfX8DlFgsJzaMsR
 MhE77zOnplix1f7Gj3i+jwtO24y3q7mybLU/gQhvpj3DTrmeVJWHo7teWP9Mh8SdXjybmg5Y+d3
 Kr5cH8/rueDUJtPQGGu/ZDTbEValWns=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a708b24 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Xm20eXZJH854yidWDHkA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030112

On Mon, Aug 03, 2026 at 04:16:07PM +0530, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> 
> IPQ5332 security software running under trustzone requires metadata size.
> With new command support added in TrustZone that includes a size parameter,
> pass metadata size as well.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 16 ++++++++++++----
>  drivers/firmware/qcom/qcom_scm.h |  1 +
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 3eaa4c9ccf3c..8902c445cf19 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -598,7 +598,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
>  
>  static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
>  				     dma_addr_t mdata_phys,
> -				     struct qcom_scm_res *res)
> +				     struct qcom_scm_res *res, size_t size)
>  {
>  	struct qcom_scm_desc desc = {
>  		.svc = QCOM_SCM_SVC_PIL,
> @@ -619,6 +619,14 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
>  
>  	desc.args[1] = mdata_phys;
>  
> +	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
> +		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
> +		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
> +					     QCOM_SCM_VAL);
> +		desc.args[2] = size;
> +	}
> +
>  	ret = qcom_scm_call(dev, &desc, res);
>  	qcom_scm_bw_disable();
>  
> @@ -644,7 +652,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
>  	memcpy(mdata_buf, metadata, size);
>  	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
>  
> -	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
> +	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res, size);
>  	if (ret < 0)
>  		qcom_tzmem_free(mdata_buf);
>  	else
> @@ -683,7 +691,7 @@ static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
>  
>  	memcpy(mdata_buf, metadata, size);
>  
> -	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
> +	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res, size);
>  	if (ret < 0 || !ctx) {
>  		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
>  	} else if (ctx) {
> @@ -2528,7 +2536,7 @@ static void qcom_scm_gunyah_wdt_init(struct qcom_scm *scm)
>  	gunyah_wdt_dev = platform_device_register_simple("gunyah-wdt", -1,
>  							 NULL, 0);
>  	if (IS_ERR(gunyah_wdt_dev)) {
> -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
> +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",

stray change..

>  			PTR_ERR(gunyah_wdt_dev));
>  		return;
>  	}
> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> index cf90a565fdfb..e58c76aba45c 100644
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
>  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> +#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
>  #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
>  
>  #define QCOM_SCM_SVC_IO			0x05
> 
> -- 
> 2.34.1
> 

Otherwise, looks fine.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha
