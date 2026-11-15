Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794736965;
	b=hfOHm6IY1N8iEkRNCJ1enf9idA7uET8aKzSvD2ER9RScroejR0MpwxrciJDuZAOMOlms
	 c30MAlR8376laQglbNEC7C7OeHP40CfKnWFBvY4PQQih/MtulEUU4d2ZN8BgMB75DDza9
	 6wYE7WZ491ET9MFe1CFq09xXbd9hfjfELzWD88OpKHZNtKppdbHJ+7kHYQk2GpPO6iHq4
	 5xF56rLHMu85fyuZ7i4ECvvfsQFpzntmM80Zjizo2mN+YBZv7DOejj1c2p1pnaRs1VTt+
	 VFdU0BYG6EDbc+x/oYPHl6h0Nfj57OHxBsZiUsf/TnQp1ZlK1vY2ichYLSrlcmAVksg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794736965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=;
	b=DQfIwJeXDEuhHPXBXHn0RQQbiUWvgNYdXIwWj1eg9i1CKOxkkauJA7QuLDxtGkb28QZ0
	 3mkLcxIQ8CrdVEo1R3fnxQd2rKaYfTrsFDgOgDdNGCVY81YuFH1S7kVySDBGDkPsppD7M
	 QxlDvGQRmRzUIS3m4XFr2A5i8enFcuwQmqBgk4vfheE5//8U4+gtkrtVCDNRQmj+gHqlp
	 S7CBbHAlQZEIPCnKYtH3RkXcZMM7OdnJ439ciTZfzsdOh8/6b5ex5LI4p/aiIV3qL9tfw
	 tPANIqMLu0SrJn2t2sGKM1DaMA2bDOFkNHiIenGdZw7qxGErHlc9mHJmt/b6mSiilJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Bol/AyWC";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdOul042;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DE6606A32D
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73DE6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bol/AyWC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JdOul042
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wris2338012
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=; b=Bol/AyWCN6ZEcdfs
	TxAVv1dMooit387uEFZrlTAWoYmIC7f4+2zetFuBDwAX0Auiv0YX6W0tpNzpkQmz
	/UEOH3GbokV0tBawBrRfq9T8I+w82cbS2HqCAeahx761WqhEP6n1mCcj7NGVOCl7
	+AvbFV1vKPHAhT4ypjYXdLIRdlmwpl1PTW1P8aS9pvs/+/h0eGQk/bmTUUW0zbi7
	phkonx69CBS+g0k8Ce10pxYfWBh2QD2szta8TuKq5HD+o+ypQ+aV7LhLPafPg96u
	nVUafaGQC30hF4hdMCLLJ9QJkE0/JJs20Zkd8lFI6yz4HNiNmLdkq9fVuyyFBlVV
	GtIcLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqjs2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 10:02:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so660931785a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 02:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794736964; x=1795341764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=;
        b=JdOul042eRxfGjWV1XZaVl4Ymnhwc3l7L8X2wrEUYTijlqJmnWZKEgoldSbx9yPade
         NAaMHGMqJILpAFDb8dNVFoqx3nLRor/VHiSB//3jRAwiDs4WysKiHO5zCT4KYVfhPT9I
         WUrgZWv+EAXK6xyC5tYP9PiiN05h3oIOaSAEFg8q4FHPLMV2ozr4G0hz8GNiDhPefpxQ
         vssPxmQ+zDUhflpvp3MFYkRo2CfThUBZUdoNZAmz3/ca4Nh91hwFkvlmIteSAGYz+O8d
         OJfoPqLrQv92McFuZ5oBKUiCZJVFjJrbDa+H7zZM0rsSI9CDxRvuLSOqNVbHkDpDjT//
         blqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794736964; x=1795341764;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5o4pY2wXroSbGGGCyclcMAo2fhTRQLykBlTxy4hcPec=;
        b=zwVMPHTqm4KQS0scY/nFLM4ekxG/zXaVC4oAtrrZSHoKEkjhkUI582cSPhJQM3Lu5I
         tupOhcaVL2CjG3fgeNcsKJzhEU/S0gY9xVhsnm7mu1mlQJsYUyGVNWKVY2EAF5vDcyx2
         Lj4vA6swqoW1KMq3W7QE9sVasD15WaOeK6obRhi4Z3/KhtlOpB76fYOgBYHxlHU8sK/Q
         Kk3GLKd9CkASgN4NiaPa9jjAF9vA9QPGG4C8hxf3e8Y6at4u3tFUyJ/mfkCcZFgInsOC
         EvqabC3sbh+li2kFtaah4HfaP9PEoD3hPJpJheiHD6DIP1PECUVUXuH2D95kAEar/pNx
         zn3Q==
X-Forwarded-Encrypted: i=1; AL+hErHNpMGYdxR4qtMWiB0w3rN7rZtrBQVMo6oAWgfUzMPYZj4NLjzog+JWAmPP2dvnFKG16HGq5rytMg7lXL2c@vger.kernel.org
X-Gm-Message-State: APuU4Z+7E/0D0B3yvY/reQHBwdDnjSVY/pN71Ot3goKoeORmNjPUumgp
	BIU+mszTjLzqZCBuFfxFDAis7fJJsU6yDdJcLMg/3CdFqVY8ls+KVoUTzkRVtQYWfqnE2wvPJLP
	8i9gRJEZ6ZyTbCDH8cR7H25YE4s6S5ISqSepuaKc4icJsKcMARgggbMzY4uSq1TqzsX6M
X-Gm-Gg: AYBFou0YT3eHtZfPI5CkND/38HnJem2Fb0iDqxAAsIRsvpAmDSmq/1K9vcJ949jsQTL
	ObH4JCSfNytXjBAsFd88zGI8xeZzCCSi1rSdBfGtBrclIeWFUaH6VltxNbMD5jaPP63c0IfnyYB
	ZjGllpKn4ghy8ZtF9jVED1ZI2BUG0txPPZs7K8PdvoIXXFTXMi/lTR2d6t9QPrySm7FdOdWjNW+
	LYLQGle1FE0p04sfTb54LHNmzXhyXFA7cnR/XxNPAtIMD0s/2VGeSK/eF9lmgg9GCJSBym+ueg1
	dIjR49t6do0GKTz1m5s5pfjn90tpXMcdcmKFiu+aR2qceYgReEhFDB5+dAPQ5yMlISzLzZvlpiY
	DwJzWEv5CsKGxuh/7IaxOZj3Pb2wljS4adwCt5ws5BBGtuLpTIVnb3RTo+3kMv9EBdEXRwtBQ9f
	6Q+LiK8lQNs2hn9/Vtgg==
X-Received: by 2002:a05:620a:4043:b0:93f:5519:5e87 with SMTP id af79cd13be357-9494b9c444dmr1229406185a.4.1794736963527;
        Sun, 15 Nov 2026 02:02:43 -0800 (PST)
X-Received: by 2002:a05:620a:4043:b0:93f:5519:5e87 with SMTP id af79cd13be357-9494b9c444dmr1229401885a.4.1794736963104;
        Sun, 15 Nov 2026 02:02:43 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c5095b6091dsm295722066b.57.2026.11.15.02.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:02:41 -0800 (PST)
Message-ID: <f8e1ad25-f2ea-47eb-bb9e-79ee8dbbe598@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:02:39 +0000
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
Subject: Re: [PATCH v4 3/3] soundwire: qcom: check clk_prepare_enable() return
 values
To: Daniel Carter <yass27106@gmail.com>, krzk@kernel.org, andersson@kernel.org,
        broonie@kernel.org, srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
        perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
 <d5888e6336644236bcb3dad4e28fdb5f@gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d5888e6336644236bcb3dad4e28fdb5f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yBPcbGVS9o6kpWgYzAw2VNtfdePYMXET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX2JEoKWJkqbO1
 1pIFGRP8V6kPJ1woOkYZR2Ko2lui2m7P0hCF2rKqOFyrYY91MZ9nI9NNJUn10MXmnC8DY6i7Et0
 dDXzWlf5pYyRgLpvINqu+RsEyFc5AUhh4eeMqQm8T+EqBQAhmE2mSXxHtyEa8nny7RhU1DaXpMb
 ATI2pXPV+44mFKhUVuF2veXw2aotQbhK9MH9/MzkoB6nN47LVR2ieKG9Za9NEgZiL1wt564hKbA
 Njx8UFJIQ7z0Yi2O7bXg7sGf5229Pry+zlNFMaZdOUwoE+9JMwnPc3HesGzIX80LUc5u1F4XX+G
 tedu2voBoj1+H5B3jpAGO2imBbVIJL9IpzJhTJNxgmvzjmXbRhGCwe5slGtHIBKFrzeNjW4zMOF
 8SWeN3FTDlkH7XLFTIE5ovw5kBC8HZDorXDpS+mv3AEuWqHK+ZAUDnKNnhEuYNBgq0egbhZ0CKf
 lXY0xXvS5pq0oKEYi+g==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af98344 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JloCQWs77Wql-FaIygoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: yBPcbGVS9o6kpWgYzAw2VNtfdePYMXET
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDAzOSBTYWx0ZWRfX98aoiS6qLutf
 fipAX1tUdmnwOZxPZ6q2/K32IZEwuUfBXaCzDO1aFa1K3QNc9W5M8NjUZUSlVrjACx8WMNF4sOM
 sny5XRq4HiypVMS19NXOVwimrrWsLXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150039

On 11/14/26 8:30 AM, Daniel Carter wrote:
> clk_prepare_enable() can fail; unchecked, the driver proceeds to
> touch registers with the interface clock off, which aborts on arm64.
> Check the return value in the interrupt handler (returning IRQ_NONE,
> as the interrupt status is not read or cleared on that path), in
> probe, and in the runtime resume path (returning the error without
> unmasking the level-high wake IRQ, which would storm while the slave
> keeps driving the line).
> 
> Fixes: 02efb49aa805 ("soundwire: qcom: add support for SoundWire controller")
> Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")

Missing Cc Stable.
> Signed-off-by: Daniel Carter <yass27106@gmail.com>

Other than that, lgtm

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini
> ---
>  drivers/soundwire/qcom.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 6e0c5fb10ef..62a44f64dd8 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -778,7 +778,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  	u32 i;
>  	int devnum;
>  	int ret = IRQ_HANDLED;
> -	clk_prepare_enable(ctrl->hclk);
> +
> +	if (clk_prepare_enable(ctrl->hclk))
> +		return IRQ_NONE;
>  
>  	ctrl->reg_read(ctrl, ctrl->reg_layout[SWRM_REG_INTERRUPT_STATUS],
>  		       &intr_sts);
> @@ -1675,7 +1677,11 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		goto err_init;
>  	}
>  
> -	clk_prepare_enable(ctrl->hclk);
> +	ret = clk_prepare_enable(ctrl->hclk);
> +	if (ret) {
> +		dev_err(dev, "unable to enable iface clock\n");
> +		goto err_init;
> +	}
>  
>  	ctrl->dev = dev;
>  	dev_set_drvdata(&pdev->dev, ctrl);
> @@ -1800,7 +1806,9 @@ static int __maybe_unused swrm_runtime_resume(struct device *dev)
>  			disable_irq_nosync(ctrl->wake_irq);
>  	}
>  
> -	clk_prepare_enable(ctrl->hclk);
> +	ret = clk_prepare_enable(ctrl->hclk);
> +	if (ret)
> +		return ret;
>  
>  	if (ctrl->clock_stop_not_supported) {
>  		reinit_completion(&ctrl->enumeration);

