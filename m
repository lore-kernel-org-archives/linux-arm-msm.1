Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD4B566C42
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998333; cv=none; b=q7LQ4pUGDmirl7agEnVlLDMcprVTOR3e3ZC0HQRUfCzzxr7lZ/ChVxuj60j/fM0aggYGivpw/M8Mx/du17NfijGDRKuZsqRK3ywkdm7d0XFeD467V4PcLW+0KWIlF2KrCeSmF/mWoTYdqVbGe4iEEifLcrM2KKyp4yIc9yfOK0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998333; c=relaxed/simple;
	bh=+A9h+HrciS1jUyM1n3Niv63g7pLYlAidJxXoLzyQlhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JtDWk13D+MbbGlLDC1ebmAKTx+iJ/wvnoFmeWL3F09MIGgIBiM5A64NF/VhFi852JARfX63c2GJMNhw9GrMgAXQfQEnfZneJnJV8+pCBjM/Fy3eEOrMw+1+4dd6+EdfNdjuENl6SpnsDErOphwaClyjQJ6flGyyFfTZdr8eFnP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gDUHVz2X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcIYGrEq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDUHVz2X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcIYGrEq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJhE152440
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=; b=gDUHVz2X2N4nKlK1
	9d0GfbuuRhKnWi27WLFsjAk6144T6WQv4gFJE5vaspnGCxv/NKVLvoac51xnLLNa
	WrOF9bWbmyYvznGq87RYwgHAoyehPSo+IdczmyjE5DG+uxM1G2gpzwJooEtRVtFD
	nZF+ve/mSOeAKMeoVQ+NOyfLpO2Ph6IgP7JqenyWoduoIRsOD4wFmBYvUxZqXxwU
	niKX0iOgAjSRqTSBOjkxn3FrIoEtANSyGMplhabWpHmo62Oh2HxhKQHhpuuDX9vJ
	6YkcZ7fnhKbc3kR48x/j7sd3u0ryq18oyaGjDzmlDOSLQVUwXsWUFqk2bvs1tHJz
	T1fC1g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aehuac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:18:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3580c07911eso11426147eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791998324; x=1792603124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=;
        b=XcIYGrEqFfbWpDBVhJ/KxGC9djdguGflnpUDIxoK2u8QsKO1kSnxlIpLV0d3qzO5J+
         dcgDM/0hML5owCURkfdaL3Nwo7dG8PPXbTuPy7spwDIqHzVc00/PXBXmJG8unmZXTt0A
         Ok2DSIiVNdv7zvlfkHTpWvovPynW7FtWybcNKfnfZc1Mgg099/7d6oue2gjmXuP/4FVB
         Mz5lwbmcc+TSJ2MtGAg2co0RX/PCYbGRb8hBpoCBKgyw1oJYX131XzSeDKcQ+NvMZC3n
         GOo6sPjppbXONDCkBNGRbYXmZk94rEAu8s9jP+7cRvb+Y7WAkW56LI31sKwVajt7y4Mi
         0STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998324; x=1792603124;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/qCByzycn+B3kkz2skwMI7OpUktdspIUK2ccIXU2BQ=;
        b=Yw+ziufJg4mdHD9tTXpqQfj63d63GFWyqgfrpk0ZJR0aYrsyn518C+bvMTSh83VDZx
         xE8Swoih9l5aLVw0PSbv6IbkBCRS/Y/05ylV7FQW+NRWWuCvkhr62U5e2BTgf1pvZILj
         1J0nSA1ksHlzj5e0USj4PyUlIbyFgTPp9KoNX6sLaSRFhT5pxGybN4RBx3AZC9ZVtADy
         wUH/h6Isl7w/41loQI18/kwdoy957Sv+MGBq96Jm636bP8YOKnx4KRjJN6eIHAlp7umn
         NQKm2RG85U9mWpd4I5kn8UBcigMW8ZHTehk9wYu20Hn9/UfylZuORgpxLjNNArZ2c+63
         vzRg==
X-Forwarded-Encrypted: i=1; AKwUvBx5tnmHO4fAhY3wmSOCyKOl+cigWg9A03AJdErRgrrbkfK9z2h5LUIZTjKi6SwxqNprinHsB8Dwg+8z9otJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKJhNX3iMvGzgsKdDQFM98SPMEQi1lS1c7N4u8FDgILaV/3eOAs
	LO9P/1CpUR7ybys+7mx+r9BNnVFxi2+PWnrkxTgjSPupkbhopCxE0P+t1Z1pBgiekErLnDK8/3X
	0xC0B3OOefIf4g9fNNWhjjpDyTFIUQUcdG0qz8szViUh4wcE8ezeMLgzLNrHEWVYzCcYG
X-Gm-Gg: AYBFou3ErLq/jN0SkDcRhWjhJsv8RctgqCzIiUFbXZ7lmRfqWflq/m/DUwSPnvgz5va
	TuXVSpYZKdva5HOd/Kx3Je1fAP+dPtgIs1nyWGYRhKEfKKAbYi4xEKVGEjGwxvgqG3yqJRkWa7C
	5z6biRotx8mqDluptCao1mOlNSKVIYOA+yuy9PdGP0wj7nOoKk1ymnpYAlWT3lkhtaYHeXYTFSa
	HROoiDhfzSJafktqwjQQJ/5fd4DUsT5qoW68pl4VxR63GpAgjbFz4nFz5yjDG54F8Z/xXjtxVFf
	j8VsTF/KIN3zF5nHSVesUr1RgYZgJeOzjW0DfGygbIS2cKLiwsda5C/pH3O9vbBYWI2gjS5+A/C
	Iesne9AAYSBZ7At0j5ReHP409KxGDuktt0ICL5tE=
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr10483792c88.37.1791998323791;
        Wed, 14 Oct 2026 10:18:43 -0700 (PDT)
X-Received: by 2002:a05:7022:e806:b0:178:4a98:8751 with SMTP id a92af1059eb24-1784ab70e5cmr10483748c88.37.1791998323154;
        Wed, 14 Oct 2026 10:18:43 -0700 (PDT)
Received: from [192.168.1.5] ([223.230.101.206])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm62844317c88.9.2026.10.14.10.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:18:42 -0700 (PDT)
Message-ID: <3c40a4f7-b191-4a04-8886-7578fe3baee2@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 22:48:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] ASoC: dt-bindings: ti,pcm1681: Document the
 PCM1681 supplies
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-4-0c1897f21ccf@oss.qualcomm.com>
 <20261012-aloof-cordial-starling-4accc4@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20261012-aloof-cordial-starling-4accc4@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lrIPkhUcrk3XVw45ycG4j7NA0SYT6yTA
X-Proofpoint-GUID: lrIPkhUcrk3XVw45ycG4j7NA0SYT6yTA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfX6SuHb8i9K943
 n0J+IU88mtgcQsx8PzrKyeVazOZq93WP+9lvfljkTUzQiI/lRJkWvLuwVQTn1UCXerhTSToaNu1
 YyVSXgXgoMsYlQBpcmD93AmVB8AmuK4=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acfb975 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=89gBhgtN2V0NwPD6rb2Hew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=EeIf7S6Bmj70s5Vw-GQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OCBTYWx0ZWRfXwtWaTRowdCy8
 N+uLtJNq6Zjn3Wu2T180+X35cfLhJA2Us0LpQWu88L7hk/DU4PEGWW/4+OWpJ5bmMuFa324h6o+
 ApwDNrbc7G3Qus9aj27A6rHouImNcQMpgWUEFLSNu3Ir8BRhrOdi/ZtTP0H0H0HbFavoQmAiGJA
 ASq8y4q0laFCkrM6hdicc8loxBrbSmmp4IdamfSZIJl/f+Bl8eWay2BQj76qUzk3Gq5A39p5sHX
 RJo94TG5LkshUnG136Jl+81f9PlFWHdaas5UrdFu0sTMpgTW7wKMCr2eyO40l/cT3REeH+Ac7Ct
 1lmL5qmed0oCY/bN+ue8TB5TobJ8l/aXycKWgSSrnxXEYkiZWrxx4LGGQsbiHgnXKmo6shZtEfU
 JlsN4V8ZwZp9E8OxU1AYscXqjzhpIYou1D1i1vF03AWUhCj+OMie1gI9bzIN0pFsHTOftzDyavX
 ZTvAG3a2H5UVmEGGIpA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140068



On 10/12/2026 11:55 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2026 at 06:42:50PM +0530, Mohammad Rafi Shaik wrote:
>> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>
>> The PCM1681 takes a 5V analog supply on VCC1 and VCC2 and a 3.3V
>> digital supply on VDD. On boards where these rails are switchable, the
>> codec has to know about them to be able to power the DAC up and down,
>> which needs a way to describe the connections in Device Tree.
>>
>> Document the VCC1, VCC2 and VDD supply properties.
> 
> Property names in the bindings are always lowercase. Please see DTS
> coding style.
> 

Good catch, will check align with DTS coding style

Best Regards,
Rafi.

> Best regards,
> Krzysztof
> 

