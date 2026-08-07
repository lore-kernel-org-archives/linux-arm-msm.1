Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE6537F74C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091636; cv=none; b=s09cMW4TVHOlhLr2nsbenfloBsJkX+kRJEC649LTR2LczIlb6wNsTqLmlv1m9GOAaYdOgAPyAzzivmpIsMJuhH24O3YJNULk7rKB61zND1KwKy372P5Y58WuRQLst38o+laK2aHMhGH3NbYzieCbsawk++sKziheBLh4OdUnSQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091636; c=relaxed/simple;
	bh=x1vVKhvudq3tk61eX99pQTPKqzE1dzS9VLqLKXITMPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=e7uwIl3ICrxbNAt/2A9F+BizkR4ry+TCIzAn5uvynCBeamYzf7mbfzrwAN+liZR4a7lMEfHOAS5ol+xQXy1QifHvt8nWih3uYjWPSwQNBWPhx8kB6mhcvNf8noFgjo/U9NrujlAfKlkgWs0mw3+sS6dir7M70r2Yl0yDza4JbB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7axpo+s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKNzoahm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7axpo+s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKNzoahm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776CCWL3576262
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3wO87GXdMZGUsWi3XJQTeTTHtW11dI5D+jHGfKjZEU=; b=H7axpo+sdS1G5PPS
	ud7SqW8n1iTiZBW5B+oRtcscyfCrcuVUE3ZcTxKNTNBEE/HTK5LE0p6wLOnuPTfQ
	AsYRNoXudI5w1fKkCNSP9+aRhs35FfUEWl3DTkphXz0a+TZ+qaCmCxwhXeMm8aZf
	OwUHnqS7PQl4aHXHYoPPV+Zg4kTlwFBN4aqpScxyjVTvKU5c2SUi66KzHin9NPQN
	ChVByH73UJIBlyg/EcGFygITRq0sTQ9wO0vTshGm35KHBtsX+RI20k71trcCTg0s
	6sY0cvgufheIJvbLhaJIqyyXIRTqOTmGmLGFEPNyDlO5MSXAhWWbHpk2MMWEp1FC
	2VJAxg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu0gq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:33:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so2727160b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091634; x=1786696434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L3wO87GXdMZGUsWi3XJQTeTTHtW11dI5D+jHGfKjZEU=;
        b=ZKNzoahm0II56mC5HubHshdaUqkXpYtDDEessXphn05jvYMLzGLDk/7t6ZEbDhifvZ
         hdqG0mhV7woMtPcQrtyonkL8Zr7y3Hi5UyNnrSqwloH6OaPtDP+gpOWQ2tHs70gIDU1Q
         GCnmqYQZSphGaHn3E9TDKBoVCP73t50WaOUHqo3obOdRMTh0vSyEL59gP3edpK/50wY9
         AXmK3iaL7hylPCgOf5FxdH4kFVUS7irc4ESwQU22b2+Xz3eHTXLW3PhzEa6UHmfyOBZU
         j2ns5cHBI4xRe49HSuGyZtSjjkTo3KYxS8SVgL1q/axQinIaW+tuRl6MGOTlBLl6Dv3t
         G9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091634; x=1786696434;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L3wO87GXdMZGUsWi3XJQTeTTHtW11dI5D+jHGfKjZEU=;
        b=Le7c4PxV64kMWUUWtt7gmqgAFt4TC5S/c21c5KdmDwrcrL+n/hX3JMTMlUncw/rjtJ
         5KXzCWpPVSBzDk8VC+/ygpX77mZPbFgjMCD1XIsQK/fVygVi4CP/f8pC3KjAikfL3OoE
         o8XdU9WmojtrYsZgGiJ2LRaA1WJjSayfr5+mwrwJ7RVcXtYXd9vNPjj6MRA5Hy5sgtnS
         t9AtaUgJAK1RiPSO5xUP8lMkCrIta6Jv4HuG6yZX2iuN2A6Tgsk8h0aaH8OJaTW6Zcjp
         R3JT1TtdEZAHaa1486/+INmok2Do2caT5oOAgRP46uE/HPQpDi5MvsjhYZ7jPaCr3wuc
         MtEg==
X-Forwarded-Encrypted: i=1; AHgh+Rrwvxe1f2b27NrXyGdP/IN+pVEyE/FAg8wIrrmFS2vBm8jC5A6s0aSYidPh9c7ZoOJtdyd8es9ik5W7JVtG@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8unDoetfpJOYTNNUd6s+oMsGbFFdxhE/gMFNYrY1s3TqBoCR
	ni5Y4ipw8TnyH0iq2KD7+hi7/iCnLGORXWr6qe2LMmC7YhD9feKPTYPaqIRyMLxXvczew0esDpa
	vp/f7b2dH5FtfuoibnZmQ5Dh8GnZXyXa6+7vFxguLHGmvBQUbWypujtDE+6RDqbVSEvtH
X-Gm-Gg: AR+sD13FiGfuDeTgYuwwY3zu5MJIdIjGHj5PfgfodGCHGL/nYv4VjYZAsbTKVzLVHT7
	fKKDN9o47XrNULxi3+GLwX36QFqQaskVuSY16Ss4B/1q3hpOdis4w4GsUbH6hvdaixSAq4Su1Kd
	ZZk5UWJTuvZSNeZ0uphjKYkuZWSLwpK2TP86u0x69A/QRvJnp4HCODEE/OfDZ4oiy2Ra6Z44W9X
	gkBSQz8qTsvdikjI04q/kPOQhBcqvdtUosmmABn7tuR68vv0KZbsxzmJO5SZN4dNue0qmAE80w8
	1oQ5WK79GCvOC+7AguID/IPGKIdtZx+syRmkO5U2kROujW3G+jpvJEkr8bpSWWX7Kcqoql9joCf
	A2JgG33xeKH8BmA+Ul9xggnUIjPjSedRuqw==
X-Received: by 2002:a05:6a00:a116:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84f2e04b336mr22951207b3a.20.1786091633786;
        Fri, 07 Aug 2026 01:33:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:a116:b0:847:439b:ae30 with SMTP id d2e1a72fcca58-84f2e04b336mr22951163b3a.20.1786091633331;
        Fri, 07 Aug 2026 01:33:53 -0700 (PDT)
Received: from [10.217.219.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3a2173sm649751b3a.1.2026.08.07.01.33.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 01:33:52 -0700 (PDT)
Message-ID: <d9c7934d-8b88-45fb-a3be-d1dde01d8eea@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:03:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: Simplify PM resume error handling
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805070013.494426-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
In-Reply-To: <20260805070013.494426-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: o8bkwHzVlEkJat3dUVPD3mMDRz9nP9Ar
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a759872 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6z8TwaGRFWoLiM2ZyNYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MyBTYWx0ZWRfXyf+pzuMEmw0z
 956nqLK0Glm9nwD51CHKSs9rWD/dUz60VUYcWmT9C6jR6qD/L65xMCYSApu2o5rSpOI7RcI0lsv
 GkDbL0X2fcOsY0MnJzu3TwsyZOg/S8k=
X-Proofpoint-GUID: o8bkwHzVlEkJat3dUVPD3mMDRz9nP9Ar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MyBTYWx0ZWRfX/EKOVEYi3Egv
 xcq/vbN8eBsZ0d0cAKaLfCH/vCZRTCRh586K8hb2qs2mE0asaCqX5RlHglqoAX9br3szL64SceV
 8fD1XOHNstwxyY0I2ZiH16Fb+S5RSa/JdrLrNiLPHqdN/HkXUU+BaGZMXFuKy7fSIom8rPDapIP
 FNi2dpEd3NmHWOokn8BnRjiM8LqRiftiPLt3rFmzvJU+li+4hJ2Gx6cK1FieatIaMotMJo8LoMb
 RL7JZzyJClCBjOFFuTB7QIny8scg/l663s20yl0GKST7oi0kjd27nrjuqSkyE8lFu/Qu9GZ9fvM
 hJOlrF545OGRmfVeUvCZFYCbzqd0aGgAXHqoKUq9O+TPdf6lr7LSipCTqXUGXlBfqkO7GeLVjCy
 01xktf+sM3HbyDb1RMjCBF67o1twRtRp4btqBTKSg+Vwq6GSdkKsd4/gDA6I9zmTaHeOE0euZLG
 PScIlkZAjtxMMvy3AUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070063



On 8/5/2026 12:30 PM, Mukesh Kumar Savaliya wrote:
> The driver currently logs pm_runtime_resume_and_get() failures with
> dev_err() and returns the error code separately.
> 
> Replace this with dev_err_probe(), which combines the dev_err() log
> message and the return value propagation into a single call, consistent
> with how all other error paths in this driver already report failures.
> 
> No functional change intended.
> 
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index d5c977e34994..96015e077b69 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -994,10 +994,8 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
>  	int ret;
>  
>  	ret = pm_runtime_resume_and_get(gi2c->se.dev);
> -	if (ret < 0) {
> -		dev_err(gi2c->se.dev, "error turning on device :%d\n", ret);
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(gi2c->se.dev, ret, "error turning on device\n");
>  
>  	proto = geni_se_read_proto(&gi2c->se);
>  	if (proto == GENI_SE_INVALID_PROTO) {

Reviewed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
