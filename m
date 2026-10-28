Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183126;
	b=Jm1mPZC79gGSRvq+yUFPEhsVxO7VnKZm+DPZ5e/7xUlOi3MUXvbkImnBSbH+ifL+AltW
	 L5XL2xTDtzNpxAh4RZAvTYCuAj3GX+7xSKz9Xa9MAKeash8Ojnd83ZqipjohGVgEVr2Ir
	 xQ28qvw8yD2/lDhTul5RokHdVja4+b5C2y3j782fU5Y7d0/Vqa7AjoiAXfjRvomtftl9z
	 IF3Bn/DPGDg7TPERCDbSOC8kdNlORnrORfg6vB41LI1U/DZu2e0TqZFCnGuHLcfPP9K1q
	 upTF/GPplBSkFkwry4+GxpFdUNWAI9hDCnP4F8A0TN5NfZcIxx3ZXs7p/1Uy5Dj2VMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pv6qltU9ZJwrGqHAOJc4GXQkLhFZfzdGycprY/xroto=;
	b=GnsxYAmZaTjSuv20/Ip2H16HHYpimwc2Rq5OoE38NncD59yzZ0UBUfFRtnDakNSIC1PS
	 Xq4Ly7suAt3SlYySufMozoHOjE71ad/yi5evDoZv/eFJbBqcRclViC/5pWghGc2mvzamM
	 iUPzhyNPV+j1oLjN+VaBR8Y4N1odLnPdEP1PzYBV48rOGJyTa+PJqKn8qpez0EhwdLSC4
	 gXbKXr8CI8za+Al8kBEvyFJ0WuDemq+UPYqmjvLWKsOuURUzeAz1GFF+DW3mwIo0DoSy6
	 bx9z8kMWC1zwnB8zS5DcufEImVhV3lobpl4MjOGEgMUGW9F4GNdXMH0Z1Q2brlOVlNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KNnchJWO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDqWFqDW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11312606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11312606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KNnchJWO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JDqWFqDW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KCdL1642992
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:25:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pv6qltU9ZJwrGqHAOJc4GXQkLhFZfzdGycprY/xroto=; b=KNnchJWOzM20typn
	qvk8dIaJwseYSglej5+f67IZgWBKrMvqFnmpGZWwMok0sKH2+QBHuS+pg137z7O6
	LKR/GrxUQduZ6O7+g1o/a9h0aBuXmkzFiJu0hoz5eUttEqwskRc5vNUmrGhNSfqE
	deU2yRoPWA7qdorwZaOfVrGJ0THo4VOXzaFFfkbT3+dYTNd7lDmr0ltvkHS//+XF
	ekeAeuJJkk7NWcBHF1ZU9Z2kOitHzdK1JqIJoqyjfkVHpD3Bb+/VE3adFCucwPej
	2cerc+QmOTapsLS/L0tiCKtpYCmgttKqh+QLh03o9R1o8W0U+/tMZGk2zMURgblH
	HGomnw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpuhf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:25:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso144782385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183124; x=1793787924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pv6qltU9ZJwrGqHAOJc4GXQkLhFZfzdGycprY/xroto=;
        b=JDqWFqDW7fioWsqsPbe/+4U/DmnQZWmHobC7ig97W8pKnAP+zGAKKY80kaRXx6RdK4
         tWESpB/Y2NwJEz4Rtrx0oiRu9LGgSH0NOUtveBGwIMnwXgoC1W7rbf4a3LMVKBvv4/+a
         yVuNCGsFXi8pF3MLYBtWAyd02D2daSGY5pUk/Lq9Y2HAHWoOwpUKnw5UTwYCVreNA46i
         XNqzLaXwFa07Std0tlziB+eEutClI0RJxy/Kw2tpwo9lNK/EmNuMxmBpPDL+xO4p6Dc0
         cl/V3mhzAm/oPBTVMexQ0Nl+VoRaSTDgM8cfyJZkhd3uiuXbQC2ySwkh107giDXMkUNJ
         rV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183124; x=1793787924;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pv6qltU9ZJwrGqHAOJc4GXQkLhFZfzdGycprY/xroto=;
        b=K53IrbxnWe1wRQqekQLgDlxlVbEa3EBPybWT2xwg6Zmw/t/NXPhtyrADFDoNzGe+QI
         qf6c7vShmIP0jD7oJVIbsiYTrnBxnHV1vrzpdo2w9BaILygr6v6+d/sYxHD9+v3ZTt3s
         8J8FJTPKSzgju7pStx8UYID2r4jKG94O4izORvKThzRvtmODzT1mjzfGDD2duIyRgai1
         fIYUb5RbhLnpO8TwjMzCtQy1qki0Z4bietHs4tmtqUuTtpN/cVlaBKLOiWfs4wd2v1YX
         CqFx6cPRkhyTHfCiN3lzhcoMGG0cs+28je9j/75BmOMLk83kBiBUFttrrRBkKjtH4ns3
         QOJw==
X-Forwarded-Encrypted: i=1; AKwUvBzrdWFCOHqbL9LimIwNUN3cIB3oKkEQnOJRfm0YSXNCalBFEqJE3EJAsdvnGChVG8DWzuKCORhvJ73/99Lf@vger.kernel.org
X-Gm-Message-State: AFq9FYIyNor8zsRX6GnedOjFPUYR5NcqeiLv+CiA5jnTY9dWZsS957o2
	75hU3vg7sGU3Z7Jl1z1NVeMg8I7vLgSZrWgB9AJH2caD2C4+5m0MrGpnci7z3OeKKLuX9poOHHR
	Awei5FBhYfBegSQ6egqOfQTj91OJqK3mH6h4kc/wP4nKRe5d3DgFz9oppJyyiYx4eio6e
X-Gm-Gg: AYBFou1jKGdv5L0AGVAoxpy/hTk/lAbyivkdNR0//ZaHAu5rMO/uMQ/gp8ZH+CpJRnH
	LkfcIL71CuwV4fwqPD25bcQPQdGPplNU6Z100GYs8dChh91XLlYv3hfJCDLC+pUD9RMhpSiGHSM
	91WAhn95sLYHl7jL1qx/0d1zGRrzuK1mEnjMVG/uvxYJRCvjIXic0Jmn01J5bDSgCVOLEKmwmiv
	et00LvM73BbnOplr3RfDLc93cT/pTdooN1tOyOpmpzJpauoqhAD9NyHv26aV9QDStHmOuJGBWG0
	0w91ial/Hrs9OdW0N1Cjs+rHbmRFaUwt4NJxIUIymu164ubCdPeXgNegIQaujhpbWxYEIE8ffiL
	6HYnv6DgLWUsg/FXeTXiL92YQRlOzuzz9UGe6GWMvVTXkRjqKAGl1dlnvxzQmM/jdJZqexbp3St
	0=
X-Received: by 2002:a05:620a:4686:b0:93e:90e0:d2e3 with SMTP id af79cd13be357-94408c949ccmr235476585a.39.1793183124073;
        Wed, 28 Oct 2026 03:25:24 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:93e:90e0:d2e3 with SMTP id af79cd13be357-94408c949ccmr235473185a.39.1793183123394;
        Wed, 28 Oct 2026 03:25:23 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c46bd650118sm593412166b.49.2026.10.28.03.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:25:22 -0700 (PDT)
Message-ID: <09f04f21-6200-4db3-93f3-0399259982e3@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:25:21 +0000
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
Subject: Re: [PATCH v2] ASoC: qdsp6: q6routing: Fix memory leak on probe
 failure
To: Tang Bin <tangbin@cmss.chinamobile.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        srini@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <6078ca7f-a511-48d9-b5fb-a7b3339c8569@oss.qualcomm.com>
 <20261028015732.1985-1-tangbin@cmss.chinamobile.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028015732.1985-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfXxqv18kcOw6us
 mWRRO13WMMIGwMOm08sMDLbiLJ93PTlN32j5X1KvVDPROiIeVJmVFJOCnS1p7MZJtpajQN8T9LE
 G+2xdRUnzAQWufmc1gfdQb28IsOfFRsbavQyq1Q3kJcVfIUyE13ptdW731+PkneKzapKPXEg1Fm
 WnhyewlADbx5ipx+K5RoG6dElE0xIfeIPQ6KCNtX3XwselCcobQzGv45e3eJ5HJ8TToMgcv52c2
 2Gmb3cHMV1LmIGa1QFwb78r6t8t482lFgzaxvkZcZdLR+BjL3vjSQfB0w48xQUcZveh7mT88Car
 xyNI+zku13AH2AUfNKyrIaqe0y2KCutcWPHHtIAhYtVDWdGeQMtPIYuLBg6r9dde7GABqPIMVrj
 m4SEx9z4wJjwVVITfs2iavJWNhncK4ahuxFrj38t/aPzfPslfdaYrvFNnlP1HvmIbfnXxyqK+CQ
 VlT1wfHxfXWNvRmKH2w==
X-Proofpoint-ORIG-GUID: N2f_8Kw_QIYdWJeEtLcB6Tj5FBDxTS6J
X-Proofpoint-GUID: N2f_8Kw_QIYdWJeEtLcB6Tj5FBDxTS6J
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfX2Ztu6ytghEHU
 RH8c9ftL4Kh4lZbhErzELO93HsAfs4XfQX2oAMTcsUWVGzzehFagLTQuNiPG7ehn+wgZ8nTRxee
 MIWL+ToBO75PG7NpQuVatE9PwCSi7e4=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1cd95 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=R5C9hjxsAAAA:8 a=EUspDBNiAAAA:8 a=tTWfHTwrCVQG4aLPPI0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280041



On 10/28/26 1:57 AM, Tang Bin wrote:
> routing_data is allocated with kzalloc() and stored in a global static
> pointer. If devm_snd_soc_register_component() fails, the probe function
> returns directly without freeing routing_data. Since the remove callback
> is not invoked on probe failure, this leads to a memory leak. On a probe
> retry, a new routing_data overwrites the global pointer, permanently
> losing the previous allocation.
> 
> Fix this by switching to devm_kzalloc_obj() for the allocation. This
> ensures the memory is automatically freed by the device core if probe
> fails or when the driver is unbound. Consequently, the manual kfree()
> in the remove callback is no longer needed and must be removed to avoid
> a double-free.
> 
> Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--Srini

> Changes in v2:
> - Use devm_kzalloc_obj() to let the device core manage the memory
>   lifecycle, as suggested by Srinivas Kandagatla. This eliminates the
>   need for manual error handling and prevents a double-free in remove.
> 
>  sound/soc/qcom/qdsp6/q6routing.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index d076c99f1..4816d4b9a 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -1209,7 +1209,7 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  
> -	routing_data = kzalloc_obj(*routing_data);
> +	routing_data = devm_kzalloc_obj(dev, *routing_data);
>  	if (!routing_data)
>  		return -ENOMEM;
>  
> @@ -1224,7 +1224,6 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
>  
>  static void q6pcm_routing_remove(struct platform_device *pdev)
>  {
> -	kfree(routing_data);
>  	routing_data = NULL;
>  }
>  

