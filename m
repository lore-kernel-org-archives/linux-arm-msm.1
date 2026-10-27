Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093729;
	b=DiIF1yRsFUZCcgSlHWLS+hBqjLtwWUnmjPStG+i4zCc3JmfbcHA9/VKCsqLJ6IBBlC+5
	 K9KVAjY4isOeQxs3XtZs69c+n90JdLAFsmBWdnTqzgpkAASYt5blSdS+eE0syJ3eUcJnM
	 BeVIa+rhnt2021QlARsQ4xPQnCY3sy+/uxcv3dKR70nERr+5XLw6LawymvwaJ4jfDbpxD
	 wqBDBCnI4KI30jq32mGPUtcoyKOGI65bcZ94CTyyDtXHIWE3VkZQAvOvXRMH1Ki4lT7CS
	 La0vWu2QZGVt3eg4GV20A96g3PLkqneybXKnPYUSDA+kJ65oyIf9ZGX3iYM/Cr6s1ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093729;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j6yPMDXi4fS6KQ3576nZY/OVApnfprcl/P19fLe4qcQ=;
	b=vuP1Al1LwfcCopKR/9NbX+W/EeJoY2G4SlEyhVfoqGJytHhVWQnJK821WUy7QiPnyHTI
	 srdGrdIb6QYaus1kGhN+YTQ5vdvVsC+3TPZgqsZnxDZTmHENkwpm8oS3Jd5qKYAdHcXQj
	 E5Yoo9q5SZopoZV2nRiVZDdq634/C4P+F6W0PPdLtfSKN0xGe4kQBrXMJPgTe5/QTE0XV
	 e/NExQ0xaj9tizlKvFJaSqArWQ9+sRkjFtlz3xMzhTNm6eDIzVL/LkQorW/H8qXnam5fM
	 bMEM2Ac3wgoWPXXuxtHHCFsFwbSOWms6QSp4m9A2dUgL+cdYw+65u4bcvyD/ZPFKvLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRCBryhV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MudagVxb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D799D606A326
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D799D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRCBryhV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MudagVxb
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gJM31162699
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j6yPMDXi4fS6KQ3576nZY/OVApnfprcl/P19fLe4qcQ=; b=CRCBryhVSiz9hmn5
	WNjNIF0n6TsVPZRkGrzm6EgWdxYT7/8pSIbWs2MmHL5eVGe7f3RrA1i+2A1iXtT+
	jnplF4qHhSttPzkVc1nbpv6zktC5x0aP4awSTl57EgUAXQqckxqpy5r6jJFRnK67
	oZHOqgJH5ldqBLDkgLeceO81PvGGtH8BZBJrg/u3ICRol6RErVKqjn+r7UnJ4ocg
	rmAXBJ8zamLt27pTzeWsaeem127fcw5cwehjYUItzJjSq8eCR1aziuxH13bmCxtD
	6+yW5CAAL3oPPNQX+qQI/Si4SrM7UUp/jkPyEf8gDmhvY0YW5wnDujIamsCgtBWS
	1FGT/w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmax5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:35:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea0fe07201so26894705ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 02:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793093727; x=1793698527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j6yPMDXi4fS6KQ3576nZY/OVApnfprcl/P19fLe4qcQ=;
        b=MudagVxbWo4iBOXHsGektvCMaHc+frUdhZpA29pIX5Nj+eKn/JU4iJBNhXZc1uNcLf
         c1o3jEIgNfO2tOxKaWKBCemtZ5Wq7oC1aNZIZyezMOX2VJIcbwAyh/ayPj9TRMsmWM+X
         aU0fP8q4QVAfrOTMhApv9mongxgBHItSTAH7kyDGZuX6nMGi5ObzJVeg5fI8uqLM/09z
         X31F+1/BaJgjWGfrz6YjZxMwg+uAGw23Rq2ztuihwJZNg6bimnz47A0pn7f/i23IwbPu
         F+DeIQuyhn/q6oJt3Gox4rcsDt7RPf0m8S2TCYe5hhniLI8pbIgBJidwCkYeWGnjmNfn
         VlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793093727; x=1793698527;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j6yPMDXi4fS6KQ3576nZY/OVApnfprcl/P19fLe4qcQ=;
        b=wLK1m+wDDb3nV29ueH5iu3hCreIWzxdlLfVArjjHvqfoHCiELmo1DyjB6Pixy2hbHA
         cOnGdRo97eDUaUhX97U9L6Q8vZnkfX+pJt/JYjx30zV7Jz6lho2YElwbCZELjNmPW/j1
         uh9xJuGfunQUZgWTZeDltOEHNMkEVK/e+IoW97sktVLA0ikgedIqQH99ANzSrGX75IjG
         Xz9zcHPCQWBMmRIeBsgne+0Q7bLeZaL8Rf5AT/VQiHwENq1THOyR65sFtMKvwFNwMc3B
         U+zwpC2dp3sZRxMbkGe0QhcXToxJNAfMaQVmXTEcVR+moXAW4TtQrA+CUerpNDsfaPQJ
         C7Zw==
X-Forwarded-Encrypted: i=1; AKwUvBzrYP82nvDp0wQD1oVVmBceoGSuoQ9ovjFIVIziHY903SPbIfVOqTFGTaq/1iXGZYW0bv2SV+1IapSdal2i@vger.kernel.org
X-Gm-Message-State: AFq9FYLYCUDB+pfht6ujfY6XcHft87zY1KkZGi9CTP0ZtJcC4MYdItPR
	nPCQI/nISThhXKVUmbtqu4HMZVWyuZEMPhiJxQZFwVxzHd5wc8nBurEKXQR4T0RR2+YWtr/v45G
	tjVTMvqDxMYKWZ220OXHijHsDLMjkxNgM2Bn3SkfqZM2kSbVkbEZvuKBfeNBmyQPAImRo
X-Gm-Gg: AYBFou0qEVVrsKtaGSyAU3G8Pk3mqQ9oZygAo5dYuwMPI9QEsN59T5d8+yzsJzOTR4d
	KfsH963uQfjWJSKILQ94Bw/WwmaAu3i+5pk7ARspOWRerRh/JtXM0dhH42/tqYD+h+eW/bhdCGo
	objw0I8byXcIYB5OTeqG1byY7xNp8vACSmi1p9OK7UXYTLWyx2x2INs2OVYdplUs2BBCcIzUak4
	CCjujJLo7RnHoLmtTGlflIfPS4CvvkI4F/b3AK14y9oBBcpKPY4Hk4LtcxqCyBM0UaBSXCakFZy
	k8jxEw2r0meu02ifnt84DnOc7xXIwdUMZiMFFZ+Y+RmUqgFRwPlp0TaqZkjUsL+VxisEkseHM/q
	Q8yGmPLTg5b+NJE6y3FAUc4biZI7mhAdOGbaXJ+8t3IpG8M9htuyplMd1Ng9xT3b/FdAC91ArqZ
	MD4ZTG
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr70643395ad.34.1793093727130;
        Tue, 27 Oct 2026 02:35:27 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2e8:7686:4d46 with SMTP id d9443c01a7336-2ea9c7fa255mr70642895ad.34.1793093726553;
        Tue, 27 Oct 2026 02:35:26 -0700 (PDT)
Received: from [10.204.101.238] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm6260945ad.16.2026.10.27.02.35.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 02:35:26 -0700 (PDT)
Message-ID: <73bb47d6-af10-41d0-8fd2-173eadbaa937@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:05:14 +0530
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
Subject: Re: [PATCH 4/8] media: venus: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20260925155737.4161358-1-mukesh.ojha@oss.qualcomm.com>
 <20260925155737.4161358-5-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260925155737.4161358-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX94E8zR7OZryT
 F1R+3A3hG6Tzz3rS1CWXwYElKzDl7T26R45+GmgFcc7eRClpbXxCkWg07i3/oE6aOvvIynhQEiA
 nsqq6V8TdrJq96Z/zcBSgj8vC906Y7o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOCBTYWx0ZWRfX5izSPaxEP48s
 z+lXTGOvyI1o3vrRLmzNdIivCP0bF4cmckyB38K53pgZGK/HE2TK9lyIG6D9iYpjLiVxq3fzwAj
 eCNxFWhzT+oE+1EFMJzEU/QfLJWDEYmyIL4xhTz4fOHd/J6tVqu//fxelfzdyvAK64q3VSfofAE
 Ex8uWS6ivmiytDPR8hdpoh3CwPG37bqMPvJwCXcc0PsDw0cPWBPCj/qRjhHUUGczs8VSyxTpgUZ
 4cK0mtDabXxQG8hSyzHnb9FJGhqlDNSCsKFAqC9r05fWaLUpIHqZ9nb22CHZJUQSVhj0mjxVXq7
 /YOz/3A08pSgjHwpg/GOgAlOVdgHVchTcBdU87A5q2i9XHUucSkNdovXLcuCX1hZIZ6VApiFmVU
 zTV8BEUZnlBNFTNlX2LyanL8LSrL3SGSzaEDi3bvKLoMByNSnE+f9tQui2BhqHdfIuClm0EpxY1
 lV+QVHrVJJS69PNLHlQ==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0705f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=qKw8xLqAnBtdxZYI7koA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: YshXKNB6mslskJRWo6azJlFf4-rmDOWi
X-Proofpoint-GUID: YshXKNB6mslskJRWo6azJlFf4-rmDOWi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270038



On 9/25/2026 9:27 PM, Mukesh Ojha wrote:
> venus_load_fw() uses qcom_mdt_load() for the TZ path and a bare
> memremap()/qcom_mdt_load_no_init()/memunmap() sequence for the non-TZ
> path.  venus_boot() then calls qcom_pas_auth_and_reset() which skips the
> shmbridge prepare step required before TrustZone authentication.
> 
> For the TZ path, add a pas_ctx pointer to struct video_firmware so the
> context can be threaded from venus_load_fw() where it is allocated to
> venus_boot() where authentication happens.  Replace qcom_mdt_load() with
> devm_qcom_pas_context_alloc() and qcom_mdt_pas_load(), storing the
> context in core->fw.pas_ctx, then pass it to
> qcom_pas_prepare_and_auth_reset() in venus_boot().
> 
> For the non-TZ path, pass NULL to qcom_mdt_load_no_init() directly,
> removing the explicit memremap()/memunmap() since qcom_mdt_load_no_init()
> handles the mapping internally when mem_region is NULL.

That is only true after patch 7/8, which adds the NULL mem_region
handling to qcom_mdt_load_no_init(). Until then a NULL mem_region is
rejected, so the !use_tz path fails between patches 4 and 7, which
breaks bisection. I would suggest rearranging/splitting the patches so
the qcom_mdt_load_no_init() change comes before this one.

Gourav Kumar
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/core.h     |  2 ++
>  drivers/media/platform/qcom/venus/firmware.c | 29 +++++++++-----------
>  2 files changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
> index 46705a666776..adcf67043bf6 100644
> --- a/drivers/media/platform/qcom/venus/core.h
> +++ b/drivers/media/platform/qcom/venus/core.h
> @@ -9,6 +9,7 @@
>  
>  #include <linux/bitops.h>
>  #include <linux/list.h>
> +#include <linux/firmware/qcom/qcom_pas.h>
>  #include <media/videobuf2-v4l2.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> @@ -223,6 +224,7 @@ struct venus_core {
>  		size_t mapped_mem_size;
>  		phys_addr_t mem_phys;
>  		size_t mem_size;
> +		struct qcom_pas_context *pas_ctx;
>  	} fw;
>  	struct mutex lock;
>  	struct list_head instances;
> diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
> index 3a38ff985822..4ea4c7769ac3 100644
> --- a/drivers/media/platform/qcom/venus/firmware.c
> +++ b/drivers/media/platform/qcom/venus/firmware.c
> @@ -86,7 +86,6 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  	struct resource res;
>  	struct device *dev;
>  	ssize_t fw_size;
> -	void *mem_va;
>  	int ret;
>  
>  	*mem_phys = 0;
> @@ -117,21 +116,19 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
>  		goto err_release_fw;
>  	}
>  
> -	mem_va = memremap(*mem_phys, *mem_size, MEMREMAP_WC);
> -	if (!mem_va) {
> -		dev_err(dev, "unable to map memory region %pa size %#zx\n", mem_phys, *mem_size);
> -		ret = -ENOMEM;
> -		goto err_release_fw;
> -	}
> -
> -	if (core->use_tz)
> -		ret = qcom_mdt_load(dev, mdt, fwname, VENUS_PAS_ID,
> -				    mem_va, *mem_phys, *mem_size, NULL);
> -	else
> -		ret = qcom_mdt_load_no_init(dev, mdt, fwname, mem_va,
> +	if (core->use_tz) {
> +		core->fw.pas_ctx = devm_qcom_pas_context_alloc(dev, VENUS_PAS_ID,
> +							       *mem_phys, *mem_size);
> +		if (IS_ERR(core->fw.pas_ctx)) {
> +			ret = PTR_ERR(core->fw.pas_ctx);
> +			core->fw.pas_ctx = NULL;
> +			goto err_release_fw;
> +		}
> +		ret = qcom_mdt_pas_load(core->fw.pas_ctx, mdt, fwname, NULL);

qcom_mdt_pas_load() passes the ctx to qcom_pas_init_image(), which keeps
the metadata buffer in ctx->ptr, and qcom_pas_prepare_and_auth_reset()
does not free it. Who is expected to call qcom_pas_metadata_release()
for venus?

Gourav Kumar

> +	} else {
> +		ret = qcom_mdt_load_no_init(dev, mdt, fwname, NULL,
>  					    *mem_phys, *mem_size, NULL);
> -
> -	memunmap(mem_va);
> +	}
>  err_release_fw:
>  	release_firmware(mdt);
>  	return ret;
> @@ -237,7 +234,7 @@ int venus_boot(struct venus_core *core)
>  	core->fw.mem_phys = mem_phys;
>  
>  	if (core->use_tz)
> -		ret = qcom_pas_auth_and_reset(VENUS_PAS_ID);
> +		ret = qcom_pas_prepare_and_auth_reset(core->fw.pas_ctx);

ctx->use_tzmem is not set for venus, so the shmbridge creation in
qcom_scm_pas_prepare_and_auth_reset() is skipped and the behaviour is
the same as the old qcom_pas_auth_and_reset(). Please reword the commit
message accordingly, since it currently implies that the prepare step is
now performed by the new API as a fix.

Gourav Kumar

>  	else
>  		ret = venus_boot_no_tz(core, mem_phys, mem_size);
>  

