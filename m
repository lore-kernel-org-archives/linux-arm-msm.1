Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2AD4266B8
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 17:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531744; cv=none; b=mxeY3z0e4c3wsWzCMhZiAjJs3ktK6S9+YswVqSkH8hp89F8T5xqr7FSXVWK/qyuSNL65hCXZeCNkqScIS9QJLLBM3pLDtvhGQ27zaSjB/EshzaPQIBef19EVewqLa7W0YeKxJsOA/sxHZYfZYGrL+ccEgPJ5ctN2Dn3ubjzZzvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531744; c=relaxed/simple;
	bh=uzulCFmfSKx4L2uI+AawFiAkCbCZ9nYjgV+Klw292bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELh+ZW252wTXB18Y4ciX8Xj4Jyi48Pz9LimOKpJik3F14qcXB8DEgKKzoWte8BrIJXiIp8xQJRVmhHqBk+/zpK0SzZeo5ByZyiGI7XixhbCK/djq6vl+fNZfEF0UtMHUCs/FZR0GplcT1KcnIM625gd7H8lRcNWQaJKco0i1g0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGt0TzC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=au0sNVU9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGt0TzC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="au0sNVU9"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QNJuKo300129
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 17:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eYTBzgG20csW2zfR3sxsuXAX1IOCeJol8XD1eAHh4xM=; b=TGt0TzC1W+DHwGVw
	W6Ou9mO0ezipe8xZwRbureLRbkcGzR9g4nF2P6i7aD6nnNpsftwQxK98gCRkYRZ9
	gDq7TDk35Rmf7aUT3h80U0+Zv2oAJ84er1BoOrdfZlF6amZt/oZSyT4ktBu3O99X
	6GxM9w5oIWukMXAq7qWNgnpABMhyrt5lWDNmrW0B17K0/BE4NvZcaCU0+urDDxXj
	rEFcpGiRzhV3K2CqcTCnZFQq9ifnXHbw/76+ryCAd0oHCVoS2kP1av87eF1UkxfX
	NHd75BVCj2dZR83xZpvUE7Zr+6Ow7RDvqsDciKXnqYP/hDmgNIaSrxECxIWgTLC1
	LmPvNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx6e83c1k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 17:55:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso567901385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790531741; x=1791136541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYTBzgG20csW2zfR3sxsuXAX1IOCeJol8XD1eAHh4xM=;
        b=au0sNVU91100p4KEVo3fPpjlp/apx9zBJ8fA1wOUNPPcfd5oAN36xSh+V+ENw/wFeV
         OpHT5wMkJ7b1ZzBs7inY1fR3Z3gCMVe5avJCCX12MoBUnbprQ50Q5yh7GN7PBcRez5in
         up4Zgqb6WD+0Kz9oEm5E/682JBfuAleRalnSFr9N92ZM24B2rBEt6/Hiq4DBYh/KK7l+
         /jBqFLmrpNoZvj730slpfxLRi/H48mljTRFbyuZsDvltfUaxcqJVbgv03oOmq1M08uO2
         kf9slDWtoja7VW2o+C6gSupnwZ0IW6N0VVf2Z7JwFkUsvkg6zNck/MS8I9j+0oy/25x2
         UyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531741; x=1791136541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYTBzgG20csW2zfR3sxsuXAX1IOCeJol8XD1eAHh4xM=;
        b=0cHjwoRq/zoaXBkcE15el7hFye9hLfZDSQbPn+mT4c0sEzMEh7fwtrMq3r9Q91KFFB
         8x9ZPpuHVm3CPnh3zkVD+tEv977BI3Wyz7WUeeYufpv/tReJlRP1+/L/w2bp4cXylUDx
         MlB4cj0pqFQJZ9gU+4HBPTIxuenY4EncbVzDjiXzx6QRSs/jZr+ku10SAqnFse45tbNf
         4iY8W9sCjEXI66toj9/zwGSxIF9j1EUkKmn4HsHQ8jHAh0yrgqWP9gkPlPhgzfwtHsRn
         QyHc5YHEgpRTjCMUNLrGy9UzFM4YjusuMz8kZqoLVQnxGGUObvc5BbQpUSEYMvZs1vJm
         AQRA==
X-Forwarded-Encrypted: i=1; AKwUvBzJn309iMwSRTup0qt92uSUlQQtJ3eRv1/2IAS5YarhqDNpQqno6bH/9Y1JRm8PVy1y00g3ONfgC/kkHLZM@vger.kernel.org
X-Gm-Message-State: AFuF++lMQ440rIj1lcX8itOsqG9DtgCAIPA/Gda0trje8NzIXZ31cHvK
	JmiQTbgCx+Tj47xCqxhgfcyL7BX0IC6AmyWFdREvy+W3F0E5ZuGlSIlEpnzJ2WRi9X/BeIDODTO
	OqC0p7E6xufjhRcl4qWiwm1x5miKeUgef6IbK1K+zcpSyBz7bBDF51gYvhhhqxXPZhyl8
X-Gm-Gg: AYBFou1mF/kqeLrfjrqsHstET3PvXuSAWMHiebPtvfvuJaH3gHpyuEJeP4M5obth/D5
	jPLSy039xN6SCIS0RwACCLfZdWhmN9MGq5mJVgOJSaZGhzUGtwPHF0p/Q6RYxSIzcA+gqoqkjw5
	FSEXbg2NLGirJ6SQ1skTmMkEklqAMu8Cnog07Y0qS/w/R854IRpgYUzK+PzKlOjc0qz4Q3brPQN
	MGv4vk0dRs0uKubbDdgwSxWaoZKv3vG4gN3W6r5DwbnJ3NefH7+D5z754WH/Rc3ZKUDJpWI336F
	pNuzWMSqfdKPu7WRPHenvYwKmbnYOJNEpvr9XfhOjjF9uPR9rajYM3FLsmRBXGcuJY+bVFohcIJ
	JVH7bO2AX2MIN+zzVDmu+vRRERQ==
X-Received: by 2002:a05:620a:2686:b0:93c:208:3d9b with SMTP id af79cd13be357-93c43cd656emr1657226985a.41.1790531740758;
        Sun, 27 Sep 2026 10:55:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2686:b0:93c:208:3d9b with SMTP id af79cd13be357-93c43cd656emr1657223985a.41.1790531740248;
        Sun, 27 Sep 2026 10:55:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a00179c729sm116866795e9.15.2026.09.27.10.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 10:55:39 -0700 (PDT)
Message-ID: <9f76e45e-5b0e-4a79-b4b0-a41795d9d025@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 18:55:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: qcom: lpass-cpu: use DAI table index for
 playback constraints
To: Zimeng Li <me@lizi.moe>, srini@kernel.org, broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260927010911.51980-1-me@lizi.moe>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260927010911.51980-1-me@lizi.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vvzh8V7c_AsOjYbZ46-KBhlPUOmOJUzu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA3MSBTYWx0ZWRfXwcaQ09CjzjPE
 DxCwA1wDGvXssPOu05FP+CsDe/BBLPp48wwh+Abo2CWx1TDFmSqSap4KhqFXJrWHyH4WJHEJYG9
 G5Aghr5mWAqchKTj7rmtRwvu4lKDaEvrvC7L9zeOAg/LRjGqswNA00FU1BdmwLPOCpfoxImMBjl
 YOh3hqcB49JdVNVVXa4FLP0WmJ6DDYORSSW2CqgCSo8GFs/KW3AMbNl21mTXhXQhfJV2TLVvr4j
 ZIMa2W/euIW4dPJk0+li68MM/WFJXcfWCfqn0+nCqAxlaAloKwrWCJWg+6RKdh6CA3aJWrXqDbt
 /lRHYQkO0dHOeVI6P3kvQlhQU9I313RkhgA6zQX2Gn2yvm9Ri3r5jgj7Mxa+fbqZP5Vefchz5CC
 2YWqAYuI4shnZVPMXmhJqAjqk8430Tp/M39CwcZvwJqbtyHKldXm576Oi22CC/ilHsdaQzuaZDN
 /8pVJ8LaVSRkf8aG83w==
X-Proofpoint-ORIG-GUID: Vvzh8V7c_AsOjYbZ46-KBhlPUOmOJUzu
X-Authority-Analysis: v=2.4 cv=aIFlOr9m c=1 sm=1 tr=0 ts=6ab9589d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iDUYOmZZWeky2fLdnAoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA3MSBTYWx0ZWRfX4DOHfCpIitV4
 dnU55d6Ga7Civ15+HvkLSSdjeF5uE+FH1e/h8chb7MPqOVDSgzVNWpO6dCxQJrZUwb8dBgiPnQe
 xwGI0BgrTuTFntqRh1n0LyFzpCO8XCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270071

On 9/27/26 2:09 AM, Zimeng Li wrote:
> The DAI ID is a hardware port ID and is not necessarily the index of
> the corresponding entry in variant->dai_driver.
> 
> When configuring a DAI with LPAIF_I2SCTL_MODE_QUAD01, the probe code
> currently uses dai_id to index variant->dai_driver. This is incorrect
> for platforms where DAI IDs are sparse. For example, the IPQ806x MI2S
> DAI has ID 4 while it is the only entry in the DAI driver table. If
> that DAI is configured for QUAD01 and probe reaches this branch, the
> code writes beyond that single entry via dai_driver[4] instead of
> updating the DAI being processed.
> 
> Use the loop index i when updating the current DAI's playback channel
> constraints, while retaining dai_id for indexing the hardware-port
> specific playback SD-line mode array.
> 
> This fixes the incorrect DAI table access for platforms where the DAI
> ID does not match its position in the driver table.
> 
> Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S secondary")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zimeng Li <me@lizi.moe>
> Assisted-by: LLM-assisted source analysis
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini


> Changes in v3:
> - Describe the assistance in Assisted-by, no longer name the model.
> 
> Changes in v2:
> - Add stable to Cc.
> - Identify the model in the Assisted-by trailer (superseded in v3).
> - Clarify the conditions for the IPQ806x out-of-bounds access.
> 
> The code change is unchanged from v1 and v2.
> Compile-tested with LLVM for ARM using multi_v7_defconfig with
> CONFIG_SND_SOC_STORM=m. The lpass-cpu.o, lpass-ipq806x.o and
> lpass-platform.o targets built successfully. Not hardware-tested;
> the IPQ806x example is based on static analysis, not a reproduced crash.
> 
>  sound/soc/qcom/lpass-cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da..079177a6d 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1234,8 +1234,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>  		}
>  		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
>  			LPAIF_I2SCTL_MODE_QUAD01) {
> -			variant->dai_driver[dai_id].playback.channels_min = 4;
> -			variant->dai_driver[dai_id].playback.channels_max = 4;
> +			variant->dai_driver[i].playback.channels_min = 4;
> +			variant->dai_driver[i].playback.channels_max = 4;
>  		}
>  	}
>  
> 
> base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4

