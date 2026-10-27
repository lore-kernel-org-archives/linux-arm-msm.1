Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112260;
	b=RSOl2JtCwwxVwGWoG7D3mkqSea3IgExP8tWXG4DYj7BWbw8z96HXxXKokxP6WSfmSdLl
	 WsOe/6PvSpgD4Ox8qrW3BR7ihI9BlpNUZRqc9J0aaqESas4A11zBvoI4HdMqq74/G83oL
	 EcWzTwSe7Z2cpQSepWsur682IjykANiFj03v/u4YHNpuHgpMh1vTWhzpbhs8N+6ikmimz
	 CwlhAao7jV+DAxBtC7RpvqPeX6/c8AlH2aq1tijIri5gkdtlZxd32r8sOHiMdRIWsnMMY
	 3AjM02hZ7yYCoxmPGZGx3oo8GMtPVVwN+nsdnrznliqjIaj1ED60xeo+5q8kx9WPcSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=;
	b=zWb3oaaITRX66di4fJU5XVukcU14xn/L53Z0ST1bwxHSSAR+2G0IF4+Ufgr6icyDohD0
	 2Nbh40BiZQy4mYbUBr3TomMwwXHL/74YIoh17KRRE+VuznGPjf5VxzPCiWUUezd6gJfS5
	 o7r0bRtwpiEjMkgUxeEtifFd3Fv4Sz0crhO0q1pVEwJHrU7u8R61ewbnMfsbMZ8c9bnXx
	 NTj9bS6O82eWJ/IbiyQtKskUGZ+q7bo0QSQAgQDPG+eygXzQm3JbDI8nkxGyrLdEDw+JL
	 B2Fm4/obqBEjFhXgjyqCQPl+3ul3FERXZIaWapG/97HwkrLxhHfZfMU0SVJKhVthOfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyTYxZdG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kkdu4xpS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C2D606A321
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35C2D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyTYxZdG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kkdu4xpS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoYmh1850885
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=; b=OyTYxZdG5+M2clOm
	mpj2PFqC20PW5yT2WKOHbRjUQd4kjm1lHHI6h7rvY7k08UybYm5zCJcslMNG8Wdd
	6dSg3QSVjxaV5v67NV7UJlPFHifZsFihgctUVQ8TOibpdjPE8ex6jgcPiY999ZZF
	QLRo1Nt+B6xgDoJj9OGyEHhqTE2SLxQ2DhYJn0yHhKKkunbxCxJKKbRXTXILjfPO
	YiD8za+0ifXd+ziLHf5VtO/xKankz40QRfDl0FP0Vf1bRbVOR+qzzbWA3LYjv6bE
	aJYmbkhzGCRhyEB3sjS95d7yDnMnM3J/UFyBwtEHHmbC0loqY/DT984+SufrEM6h
	8H7Uvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmc5c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 14:44:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so679800785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112258; x=1793717058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=;
        b=Kkdu4xpSycubvYo2VxZEIvDxRi8LwhL9BdwTQxbJICH3Gna7MCt4YhYIVVN5XKW1vq
         MydGVrA+aI5kfZxCErCCablQfK8klS9a4bp1BEF1FyVoX0++q7NRlY8mkD05m/YHvLJ1
         rgxPsXeqzQ8DJuqPxs0d3tqwxoe9tCBGvKtcimMSLYrVpBTPHnZMVGA+n3h0bX55pB/6
         /s7fLJEpPBgwkXp+yhcTf1+cSzUACbRC/PDzYoej2R2kwcCTCqDvnLCMwY2XINLYYqgz
         oyCXKxS5gTxSVsYrAHfSscex7Ja0uCorYn/Du8kPS6kYUIlJpKvs4/mAoZC8tCImxzmC
         v2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112258; x=1793717058;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=;
        b=ZITzW5DVjswlQS0PywpnzgMWEv7nb/s0qiSci4Q7zwRUL4p4C2wGrwa8Egtv2UZ8pr
         ElTF5awF5ouEkroEa7lhu5uHNub3IkCClAwB0Y/+28/ke6pYTvN9vD99qOrUXdo3Frw5
         wn0LmtVaH2yd/QaVtHU1F/ebJmsi3phmrxnSWavhs2ydC8Plxs8SnFq6i6J/Ng2bRGKE
         EnqG4pYk+Nm1wMJzOuj3MyfT424w2bQOhhX64ezVKTqQdgmyp8vJgr95HdZOm9R4odiW
         5BMz0B2aSuTZ/Egf9XNGr6NSAzjOipNJcm0HJmx8Ug3g7pB9TY6Fi1wB1k6DtjMtdOX6
         IqBw==
X-Forwarded-Encrypted: i=1; AKwUvByslzxQMd8a5AEu8GTBjGTWd7yjPvr7JGRUq8EpGrtOADzMxq9opW0kL7WGFYhEpxPBr5LBoGMMvJiNgArD@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8Q8rNQ659xm/xRzxx0VG3YlP/DoRxpu2TiOGYNtYu4VYNisuC
	5DKydHDr93vDIQchcDKVOV9mO3z9nb55Uj6VOSl5Tv3mLTLLmooyzLR3TPGgBdTEPScVbhxZhHS
	rGC+0d6fOi6E0FX4WCmFn2BmA+WE03DDo/JwFOgBHx+83ktNi084azIuVsTbJOFFg3uyZ
X-Gm-Gg: AYBFou2uAaw+fMsYiIdX+w4wmeHT2uOW2STzUNCdx/5C1s2nMqV4xkvxOgigPDOHQgR
	b8Wxz28aFuPHEtKpwqx4BmYawIFFLv8j6eKIFu9StwnPC1nu0CEesDdv6sUwxqiVE3k6P2FyGiH
	QmOlCRFDaXaG+Xw+cHbc2KYVWTpZ53LVjE/tC/F6vTXzLeuTudp3fFJp1siJfbuWX5QQ3QJqZJt
	aPlEpkIDrO8j+hbcNHugrW9lsCqypBH8Ro/uZqNJPe0sY22PmlznZyMYacY5PE8SBgiBC4OEpsa
	RcfPuhGCxif2QHINZC5pLo6lyPyb35zlpW4ixbMGLYu772g57r7fXXLUD1jsa3RGODckMwVXSC0
	pCg/Q9irOYyMkjfKp81B71EzYgw==
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr1645248185a.40.1793112258151;
        Tue, 27 Oct 2026 07:44:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr1645242885a.40.1793112257631;
        Tue, 27 Oct 2026 07:44:17 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm319234895e9.1.2026.10.27.07.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:44:16 -0700 (PDT)
Message-ID: <6078ca7f-a511-48d9-b5fb-a7b3339c8569@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:44:15 +0000
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
Subject: Re: [PATCH] ASoC: qdsp6: q6routing: Fix memory leak on probe failure
To: Tang Bin <tangbin@cmss.chinamobile.com>, srini@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261025080242.2572-1-tangbin@cmss.chinamobile.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261025080242.2572-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX8xTEX9TSASR6
 hvGxvVbC2C4DYaHT9mQie2qWsLSIji0GYksSC0/I4XzJu9Cyeq1UbRCQjDKq8j/zUdxTSyilB+h
 IfI/RZYVizhAxo+ZIYd2JYXSljDl2yI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfXxzLPHmqX2VuL
 F12GdV8ubshA+/zDxLYvYWTxwKl6U9TqRGun3VD39m1c7FpMsu+VDWuOghY9nLbel9UBO9hX6Lv
 MwFVyuld67uvbXfRJtdWdQvxJQmV5AjDEZ9cPmaY6cFwCM8A092k6vOGQ33ro4lJOSAHpOLgYVB
 3DVbeZ2cADovdcs0noXq8T86rNp6wEgOK7LkkRciowJwZsWStoaw1+SaXSrl9aX5XkMIuxP4uEj
 D+cN+8oE4hTT5nnUcKqBvzXUcGO0GpgxlY+cGuBJXiLrtER3fA9D/y9DO6+lmNOuVogzpMSuphl
 4xc1yxOgZjfb5VGC0HL3/YMIaJ4cL7nokLEEoyO2yL3R+R7QyIsP8MNjKsMOwrlNVURGUUkZZa0
 bRYmWpGCU+F8c7ds+ry0DetV+8u799g4iauyA0/VaTaM9h7nGuSzvWO2zTKF9kpC2NBc9dcOJ/T
 F1HlNu6x7mN/61NXByA==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae0b8c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=R5C9hjxsAAAA:8 a=1_uBrm5jZOM9LsB7CMgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: EZS6tAUL4whwe8HXgJQ52MPxHRcXLA7n
X-Proofpoint-GUID: EZS6tAUL4whwe8HXgJQ52MPxHRcXLA7n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270058

On 10/25/26 8:02 AM, Tang Bin wrote:
> routing_data is allocated with kzalloc() (not devm_kzalloc) and stored
> in a global static pointer. If devm_snd_soc_register_component() fails,
> the probe function returns the error directly without freeing
> routing_data. Since the remove callback is not invoked on probe failure,
> the allocated memory is leaked.
> 
> On a probe retry, a new routing_data would be allocated, overwriting
> the global pointer and losing the reference to the previous allocation.
> 
> Fix this by checking the return value of
> devm_snd_soc_register_component() and freeing routing_data on failure.
> 
> Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/qcom/qdsp6/q6routing.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index d076c99f1..fb633efd8 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -1208,6 +1208,7 @@ static const struct snd_soc_component_driver msm_soc_routing_component = {
>  static int q6pcm_routing_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	int ret;
>  
>  	routing_data = kzalloc_obj(*routing_data);
>  	if (!routing_data)
> @@ -1218,8 +1219,13 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
>  	mutex_init(&routing_data->lock);
>  	dev_set_drvdata(dev, routing_data);
>  
> -	return devm_snd_soc_register_component(dev, &msm_soc_routing_component,
> +	ret = devm_snd_soc_register_component(dev, &msm_soc_routing_component,
>  					  NULL, 0);
> +	if (ret) {

how about something like this:

diff --git a/sound/soc/qcom/qdsp6/q6routing.c
b/sound/soc/qcom/qdsp6/q6routing.c
index d076c99f197f..4816d4b9a48c 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1209,7 +1209,7 @@ static int q6pcm_routing_probe(struct
platform_device *pdev)
 {
        struct device *dev = &pdev->dev;

-       routing_data = kzalloc_obj(*routing_data);
+       routing_data = devm_kzalloc_obj(dev, *routing_data);
        if (!routing_data)
                return -ENOMEM;

@@ -1224,7 +1224,6 @@ static int q6pcm_routing_probe(struct
platform_device *pdev)

 static void q6pcm_routing_remove(struct platform_device *pdev)
 {
-       kfree(routing_data);
        routing_data = NULL;
 }



> +		kfree(routing_data);
> +		routing_data = NULL;
> +	}
> +	return ret;
>  }
>  
>  static void q6pcm_routing_remove(struct platform_device *pdev)

