Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483797;
	b=O6yeLC3Frtk98wtTcWxTw9KHPvhwHW7NaQ0xb9W2ZDGys1JOHHsejRNaQvUdlt/17X6i
	 qWSYrZSOpWyyUGj/Tx1hhnhr9hxGdDkt6Rzl0K7W5g2e2G+Fr//Jt1C8i58kmzdtx5CS7
	 pBN83J8FB+ndusiaHp6ykIu4OlX150/JqWSn1iJPZE9aPfmVwaMiEvB/o9EKOjoyQfubn
	 n/Es9DTGa5IIMSEnlLRsZ8cg6RJ2ivoUcrhIEwRBpuEiGvXTHz7w5o5UIkBxtVLg3LN3n
	 xDDayv8HqKvLSPvTaoAUhFYhLfu3z0iwjY1zcxqXdGun9X2ISIQ1xUoU6LobhwZTiTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/UsmZJteRaFetcrcRELxgEEeGkrhNoxIFJFDkJKP6UA=;
	b=Fyl0gw8JnnEEb2pkN+r9tAjiUA0d+5RSQMso+y3Tv8qEfbDTT+v1WEkurpzCcGhS6wH3
	 guOGL+NJLCeJ/0Q9ifqp9eT2u3mRkcbtV1wX+M2eltEdebJo0g4gNqG2sDQE20sMYGwUn
	 +Dwbd1/OQj2Umm3bfadvS1bJa9o4zgo9UbToh6AVT5PfWhphXalPw0nujrfZpkI3Et5RT
	 EcIu0+UOUF+DR1Rc2xjJEBUZgJ52QkqfhoyLTHNFEQ8psyGUUeINhHOZsN7i8nfWOLVJd
	 LEhdtteSZaRQfPIsScaOAVgL8XjTdG5++CAbPTsOSZR0PSbK1q6N/fmm5qRpjaBHKSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jMyJkN6c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dlNsDC7e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE56F606A33E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE56F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jMyJkN6c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dlNsDC7e
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8wPqC4149502
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:43:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UsmZJteRaFetcrcRELxgEEeGkrhNoxIFJFDkJKP6UA=; b=jMyJkN6cn3Pey+t6
	4FJSf4pRce+aHImgnkYtusCwP5HDljsirOVP2QTdMrAV6kBAr7289H+ZHBoKdeOw
	9IWJZJJX/jOgqMN0zxnghXIn7ThYL2KLzrumuYKMLIPhEPlVW2HDS8u/Ao9M7zj9
	zrNIOGksuyAkbXeMV3mRZK9RS8YQEcRsnb59S9hhkZBhOoyaCHqJps38hV7qG/J3
	Xe0tX2YXi7UH3Cq9zjlNgVKQMzG+DERrpC6OVP6dqGgR6AaNYZ6S4DQuO2Z7Nnq1
	eKTroqerpmhAOp2aF3PGjbHQPNv4WxucwcLMG1jZyIt/5SI/oJ/pHcvdMri8hA3T
	4qeRqQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc637w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:43:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so3516627a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794483795; x=1795088595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UsmZJteRaFetcrcRELxgEEeGkrhNoxIFJFDkJKP6UA=;
        b=dlNsDC7efncryoB6kjy/7n+VYE/nkSwEwEj1uVqyFzjCB5/N7xOeOS2SOsotpnsmDs
         /zBKWzphEipaPiGEnIWVzkPXo+k6TR+iTJTXyct9EynZ954r/O5tKIkYlLXOlckIhDip
         mTihcpmqA/j8CmzG6aFa3IxqmQW+P6hwwURZKdpt+fRvg4ullNRNV5dmkq1TwSrX58oS
         qEm2sDrdgYS5pD0l3sLul99Lgp0i/jLys5hcOtpu8saC4qtWbaW7ozwhAI3dtPfRWQA6
         YlktiKdzCiFpAyygV0I/FDVdYtuq/+7XoV9MppP69D80tNZyf069PhumW3fwG6SmZD0u
         wK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483795; x=1795088595;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/UsmZJteRaFetcrcRELxgEEeGkrhNoxIFJFDkJKP6UA=;
        b=OEtjGz00642KKAqEuWYRltIz3YneYLEJGqzh+HofSyM7ag5/GDQiCmhI0hbzuOUfbD
         hNA0esZ2P/pUxx8JQarPfyaurtnQ13/h2Tj95+SinEShLX4M2nrni2GRrk8k+COYWabN
         lW+BFrjwdwY3m5BFLyN5Q7mngdhBtBrj75Qd06PkgoU16HdJNC4bE0iRqxW5XRoZqBEl
         LSZjLYVymvkhjzNjItaITSbNmnft0RVdTGVoWVPJcNDMX0scFe1wWXk0ELCHhIgblzUI
         2iGzk5TEGwwfPd09RDmmiG3o7F2OEyJK03MV+vYqjPDagF7OkPjnTu5DUFYeB3jC8mEP
         qRQw==
X-Forwarded-Encrypted: i=1; AL+hErEbu8eY3J3e3JO8717p7MvFYupVYnF654H2NOswWvFO6tcSS2wNGqyrdSTXX+kWtKpbXUeMTiRpO5hu7WwY@vger.kernel.org
X-Gm-Message-State: APuU4Z/kBD7GdDkx9UwzY/96Tmp07RrX8rLppFTgAJ6Tg/4pjITnYG0L
	zn0cKYDlFoa0PXg32Yr4D7DU44d1ywLskIQFg96oxyim2KEExEVWN1EDcf+29yc4jrfg/x6oVxH
	2cdbE4ZL2gLlp6Zziw30EDAOPfcXADdc18g15bX5j2um8GYOtHjFGwc7iwrKaPU2qU8d0
X-Gm-Gg: AYBFou1RqNdB9wXz6eQn+AxFfqlnvoWSq6CKyxmbejIKXHmKUxdc4mr8j8JCmixbS6u
	HE7sHu0H4USY6nYxXTs/gl8gFG2ulw6s4+TUMkjdARD1L/KJH2uD/i7BoSItWGSHELIq+pvAgno
	5XSycp7Hc2ADW8V8T4uiLIYhXxJwWooTFGzGtp5Gf8MaegLNp8o3qKA8cRh9hxtIW/ZgyP0ztIJ
	izubSr8gF1zHa1dW66lxss5gyDD1551BGebP8yxlk5xFEUz6NHkkQSZ4xTQ/CO34zQ/U1kO/HRP
	yZh+5x3jP6dmQPO+hX9AYn7UmmsSdcxhwT85f9feNGs+UIJBgBKQe9kdY7abA6ydSinf90+Gxle
	EOQL+iW4s59sgUS2rXP1JC8aZyg7HA5R7AGyD0ovpjFiDcbs9DUHxRQ6OYl21RcLwsdQ07J5YZb
	5gWX8=
X-Received: by 2002:a17:90b:3c06:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b182df2f25mr4726549a91.1.1794483794729;
        Thu, 12 Nov 2026 03:43:14 -0800 (PST)
X-Received: by 2002:a17:90b:3c06:b0:3a8:7096:9b48 with SMTP id 98e67ed59e1d1-3b182df2f25mr4726519a91.1.1794483794297;
        Thu, 12 Nov 2026 03:43:14 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b2cdsm4350657a91.16.2026.11.12.03.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 03:43:13 -0800 (PST)
Message-ID: <d60b437e-b1df-4a9d-be3a-a53c2a369f84@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 17:13:07 +0530
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
Subject: Re: [PATCH 0/3] ICE: Enable runtime PM support
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <mkp@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org
References: <20261022-qcom_ice_pm_enable-v1-0-f7a84086c651@oss.qualcomm.com>
 <CAPx+jO_ywfJUAGs6Zo8yJyTpqui=qN-T9qqWN2hKCyeegAeF=A@mail.gmail.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <CAPx+jO_ywfJUAGs6Zo8yJyTpqui=qN-T9qqWN2hKCyeegAeF=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fAimZRVWKDSEWDgFBkgmdEp3U8RU2Pzj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NiBTYWx0ZWRfXyYt4P+RoakdT
 bsOzJCeX9kjvmG2Ywx/k/MdA2g+11wfVLG90PSt15nCS/5fl1ZLOC37QdUUEopLUYyMQxSmu0kB
 btyuhvdgzMnEmszGXIwKmJFiYWHVyb+4jvWOhx4/2JolxUk2psTpqSrk6WH7saWUGefktIvlz6H
 SbtLOsEcPOIzKOrkhhWr8a5XKYDgFQ/hAFusZYItzroUk1w6BUFPK8cD11IRJCm9bZcJSBufAfg
 KFeH+zKROeo4C4cOCxxnkBnTSgCH5kHH20uRm9D0qiS1E4oFzWsRsuGOv9F/YVawYgBJ4qqlWuW
 bSPKOtD5CbfVpqbf+I460lOKAPgIOh5NWH55JviMmktiZFAXpmFJkBq83DnzokPm/yeEy1/nsja
 0suW7j8RscCAWWISbGxmOeFL/SN0svhuLxcIxlSiA6N0fmUKnBx00U1oD86EQU9yh66038l9FM7
 f9+ZLuSxvFfGsKKqDWg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NiBTYWx0ZWRfX/VCxcs5RYuBv
 b7CKIFfkwL0Hkgej7pSAy5mq7IollM0ADtiBNfpQBsZObTp1OtXahg8yJnKZE49eQypzkv70CsS
 YjlwAPkOEyNNyI1s3l5iEuO9FMBgbtY=
X-Proofpoint-GUID: fAimZRVWKDSEWDgFBkgmdEp3U8RU2Pzj
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5a653 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=wrTd7Yo2M8a-6LQTD2sA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120046

>> Merge strategy:
>> Patch 1/3 and 2/3 are storage driver fixes and should be available
>> before patch 3/3 lands otherwise will result in bootup crash.
> 
> Then it's perhaps better to send patch1 and patch2 first to get them
> landed as fixes and for stable kernels, then when that is done, please
> resubmit patch3 separately.

Sure, storage fixes are currently not tagged to stable versions in
current series. Let me add tag in v2 and drop patch 3/3 from this series
currently.

-- 
Regards
Kuldeep

