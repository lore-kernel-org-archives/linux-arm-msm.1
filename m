Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109422;
	b=uiDfOrWp66Q/GbmKljNlJt/mXLeLGPK98TDjOoft30DL5GwODjlMEPVl2aG7VNuUXMAN
	 sN36lKVx3m0rhPrs+m9lbwr9P8yXyvjkEPq4xMLPKcIPEsXpiitJ6u8aA9UueUJfS8ZYk
	 xGGxfH05lxajDsfiXmz4UahQGo98LpTnZsKst3S/jBnfDY75dyspABKfYeT46sy4bQLxC
	 vwJg8aHd8VNxViuFv+4h8I46FDE0yAx6WexU1cZLDcXcQs6KQMaGagxCeynwS4S9zOXXA
	 kIF9tRsTDM13t/4TknG4S30C637XTWGAOyuQ9UQldA5cMxMGufFZ7QDSB/1Iai4Gkog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eGxUCtRGlKme+ehFGQNa/Gef806lpWSevfACq5r6dV8=;
	b=WbswfHkySXVGL0N7pitj33e0L4GjezxV+lNYUEjROOtMeQq7KC4OQnAzSR865NMM6089
	 dk6POPcd9dlDlEpNEOo6KCyj1uDrr2PedzSsb4mocc6WgszIqVJfkENNclMANL0crfS3O
	 sEmadZh5Tdy1tVEtOpAoLzrG5JZbVcQWUwi1BWlUXza7MHQD6s3pSDCC4D08IgZa9Via1
	 7ME/xIwTJpY4/0qgRJtYywNahEK9obT0Il0ST8fN/9a/MV8P3SmEOUiS306uj7Peh0eJ4
	 cYET0LxRyIK31fYUBTbLdG0TWm4BTC8tQgCXFxhPFjCdFY71CRIvuY/Rx7AhY5JxvvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SBzDW7w9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=el72giF+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADAF606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADAF606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SBzDW7w9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=el72giF+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoEsR1316505
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eGxUCtRGlKme+ehFGQNa/Gef806lpWSevfACq5r6dV8=; b=SBzDW7w9EPZSc9IB
	65tzcXMcjsf2Y6rKkD3TdMnxWYF+J6N3keLNG+NmBNiu/oY/dmhWQCY1GjwjFZCo
	KbRx0abceszlduC5i32dgjkQGUo6JQNEiqOmtpkSviCB78WdDnJesmeYeQ+dOvva
	sdXya2OhgNTXkgo0MiPPXmlZH70cjrSOMW67w8MqNW/GjDVbB2ZDI/eyxWMjIxy/
	WKJKi3jShDyC+yQ6wiXw3W5AO/mK94zUcBLF5lHT5P4xkfPkm5YVS6I/DaAIDWjY
	8qYgz4EHz6Y8SrVWXq3YSVyY9UOdS0DDf/izbkAKpuCHeyplpb+l9enEah9Dwp2D
	4WtHlg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux98c18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 13:57:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c6c1e082bso18163556d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109420; x=1793714220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGxUCtRGlKme+ehFGQNa/Gef806lpWSevfACq5r6dV8=;
        b=el72giF+gGAKLL7v3838X0LfcF7z93zg9MawtBE9dkPpw9mu2Gf340godP48k5y2O9
         v9SSAfJThBWNR9aGLYnYJJE7K7WpolzdzOC7n/0DJDwGwUlJ3f5rdhRrcpOcdsaJaBNd
         jKHOsiI8dViFZp+QNa0rS3pbU7moPuxj9Qmqm31xUjDpB1uIQWrRA/oigsUhUZofUsNQ
         awYioGuii+TU4niggEpPbwkO8ABunuu21zPRwigvQNx3sCML34rrApKj0DufV2T0OeE5
         8DJH5YRccLqktXHmlKdGjtHIMu1BSex1DdShIJ/4IXRL6xbhhxN6D7JWQgA3QZ/z62Zl
         WixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109420; x=1793714220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGxUCtRGlKme+ehFGQNa/Gef806lpWSevfACq5r6dV8=;
        b=vZ0H780/NtiHdp/M+ZsQeLh7zmfWY7mcoAiYSDVmilscq/zVJ4ab046nfcOQqwWhtn
         J5nAkFRCZ5aM1wglqgR7OrfvaLnatE0Eh07RTIuJH8kePR28TG8qFWtY3Z83lQ/sVTG8
         qbqHMEfPWqqM/0XA3qAUTWHvGhXDjRyH56T44cE2nyGJropjRDZnGbNb3KSWLb8ZR1mk
         Wp8uu9DG4d7wKU6IbGbweZURYJiEHwN30BwlmLvpW/ZMH/7o71eLQau6odOlEJpyvvdk
         AzL/Ey78jXPi9lg5vfx9JWJDr6QO/QzNzefpDpNtOtwCU2wM6u4PxI5vfWijGMcwlfDF
         4PGw==
X-Forwarded-Encrypted: i=1; AKwUvBzIsq0TOFV6iPVoh9FDyCCEMRsFird/zNNw3chn8Mr+1CK7yD8spUIvZR9w5KCv4kl3z+GSj+Naq6ulGCvo@vger.kernel.org
X-Gm-Message-State: AFq9FYLHp1iD+Wga67QY02h/hY45MwInKch4rMC2Iv3qeslZdy546HQh
	wNAX0F/O6SVNNLlP/P99y2deyYy3DbMVifqRjLC2yUXZbQHrO4IOZM6zpKbi/zCPi+8aaI7WU1c
	o9i+JVyF9SW0YDdwrxC5TFG7fEOAAO4DZNN8bgP2CKfiymfh0XEzDLtUIwna5IJHGrS4u
X-Gm-Gg: AYBFou2mKiaSFIs1N6gR6XexeQI//pnFpe/9P14DE0h2/s/67ZK6VVKzzeohDgRavW4
	XYzH3PssMXpRrFD0NCpTIdYK2vauzUbkvqPqVNdPT4C5Jaqas2Emtnd8gO0P9qF7872KIhc7mGv
	n9KFTApH5UGAS5tA5xdjw1F3mzqrk0p2QkcA9odbFGeDiydBWgnTVJmUBQOTMJ2pL9SEtQbHFg6
	XCKZnG5Hpprm7uBcn6xHqoxOqnISvuYSxsBTHrcIS6P0oxz2qiie18e93LwQJPE5Gm/e6QzV9Dm
	/bgKJ9nv/+bcHbDi/ZzBIaUEGNdjf5FSyhAR34MtW9M/11LVYiOBCpwfqp4znA9JEpE+4brFrl0
	pvx241lLBN0X0QF3ifk9bEE6Kt/ufxxYdHUhbaWGKmadUhjIG8pTkFnrtE7JigM3Olds5HniZLD
	g=
X-Received: by 2002:a05:6214:2622:b0:919:5896:e93b with SMTP id 6a1803df08f44-91c6d30d225mr47556486d6.19.1793109419854;
        Tue, 27 Oct 2026 06:56:59 -0700 (PDT)
X-Received: by 2002:a05:6214:2622:b0:919:5896:e93b with SMTP id 6a1803df08f44-91c6d30d225mr47555996d6.19.1793109419252;
        Tue, 27 Oct 2026 06:56:59 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91c6158e404sm58349196d6.10.2026.10.27.06.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:56:58 -0700 (PDT)
Message-ID: <45815874-941c-4e63-85ba-e93fca6b2b70@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:56:56 +0000
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
Subject: Re: [PATCH] ASoC: qcom: qdsp6: fix device_node leak when parsing
 "iommus" phandle
To: Selby Mashiki <mashikiselby@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261025190340.449613-1-mashikiselby@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261025190340.449613-1-mashikiselby@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae0adac cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wKGBcDPARhIGGqfS-jYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: fCW3PDNX_NFZ_rn-Bbk5nfgwnDGot57V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfXxz6acBkueafm
 Gdo0WvDqlZLVq8fpdhxbDko+VGrFPgih0h3dXXtqJjWCAq4zKYW6eu7xcRU4OKdIAMwmfWivmlo
 E23KFZ2jgGzQi+yr741RKFNJzddPcBiezvEuJPVGGIZuwfk7ov6kC0GSErf5OJULw+SNN5zGLem
 qfJvwuvyptIEJc3u0/+cW1tSRyE5RmT656xccuD711wASHOWCf4wNQwfbWxrqR08Db4rgRBg+0v
 79CrzbWxFfRbxjPRosfZWkjBWeJKol96gOeGhugufbLLoouKGLfOaMuHHJplvjd5gWItqm2bjcc
 wCg7yXPBoq4OW4V5ziahMr/zaeaWzvvyVznsMsDUhndgU4ds4Qu2HfM6a2I4KRtHHQ0UPnBVA3d
 GwzkCpShsY3Vs7TrhO4z0NbpffDHaT15l/SrYYK53wXXGUIip/NOk8SF57Hv2zyUodmnaSgZy/W
 nJEyx0mW1OUyuq0okWw==
X-Proofpoint-GUID: fCW3PDNX_NFZ_rn-Bbk5nfgwnDGot57V
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfXzCNo4wLwYi0C
 4phlK1tpo8epJEYIR6I+670s+fDfC9WCh1rHmixVIJ+98ZolvNSl2/MRgxWW7OGEU2Cuo0CbWg2
 UwxE+NfQ73vBs6OZNB0iHXFcjJTp8kY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270055

On 10/25/26 7:03 PM, Selby Mashiki wrote:
> q6asm_dai_probe(), q6apm_dai_probe(), and q6usb_component_probe() call
> of_parse_phandle_with_fixed_args() to parse the "iommus" property and
> extract the stream ID from args.args[0], but never release the reference
> acquired on args.np.
> 
> Call of_node_put(args.np) after reading args.args[0] in all three probe
> functions.
> 
> Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
> ---

Thanks for the patch,

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 6 ++++--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 6 ++++--
>  sound/soc/qcom/qdsp6/q6usb.c     | 4 +++-
>  3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index bf1f872a0..49bd0582d 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -1030,10 +1030,12 @@ static int q6apm_dai_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> -	if (rc < 0)
> +	if (rc < 0) {
>  		pdata->sid = -1;
> -	else
> +	} else {
>  		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
> +		of_node_put(args.np);
> +	}
>  
>  	dev_set_drvdata(dev, pdata);
>  
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 4f09fdd40..f09856ee4 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -1309,10 +1309,12 @@ static int q6asm_dai_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> -	if (rc < 0)
> +	if (rc < 0) {
>  		pdata->sid = -1;
> -	else
> +	} else {
>  		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
> +		of_node_put(args.np);
> +	}
>  
>  	dev_set_drvdata(dev, pdata);
>  
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index 6381b289c..5888bc41a 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -382,8 +382,10 @@ static int q6usb_dai_dev_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> -	if (!ret)
> +	if (!ret) {
>  		data->priv.sid = args.args[0] & Q6_USB_SID_MASK;
> +		of_node_put(args.np);
> +	}
>  
>  	ret = devm_mutex_init(dev, &data->mutex);
>  	if (ret < 0)

