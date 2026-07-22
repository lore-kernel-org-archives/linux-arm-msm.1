Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1A93C3432
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784707241; cv=none; b=gGT3UjWEEKC7r1CAtDFvplOhxyIUX37h3PRcAi5B8tTrzUBgxbVZC4PiMsltMYat14owtPLmYM5HZBE7FXwedGcSt6C91tfUM6RWLNfru9gH3TvLVrZYC5CpxWtYe4f+fLWP+67paXupjKGdHfl+QxHDPm8RO4KVxWoaMtuCz7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784707241; c=relaxed/simple;
	bh=4VpytwC09Qov53LruegfplaYigW5Psmc3PClQcDO/1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emKAkzKJ81f3/dEcR+2SOLm8t2w+mS39DrHIECOISjMJlU/sj2BZJnFQzYI4UXaNlK0Duk6yN4e+9/Mh1t9IvgTyq0iZctnMVWIvxc4IoloLZTiBMvwYsBZrTqPqJEcGZ8ORfcVlmoJncIU7/fU4XQJUR266yy6ovxo/yGOggFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j31v4J41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j70Jzdw8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j31v4J41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j70Jzdw8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M623U4984644
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgU+BzNuR/deTzqnhX5m6s/7fOxLFizypouvSda4pJw=; b=j31v4J41YDqoQvLH
	2pvpaHGCExy4IvSS7DUY7C83r4mlw7tGQ2LgdpDVfDQ4Ko9wXkqfCAoRyT9vdUAW
	FVPVC2uFH0/AetlfXaaIUt+s9FM8+z0tsjCat/LI7fv0QVExZExYW9+LwGMdYwTM
	QhjjvDyFCDF738PnuSln/o5IYBfb7+52S1n2hLOTvsQkvAyKKClWhbI+1tulT6em
	rZ5khgbD3NZUdwIwROUi5BJlxql8OeICAvN0jXi7If0h/WdbL7b572YJ/X9QZeXf
	kCxtBuivs7a1LCnqtdB7Eais/w3RTe96aYMT69M5EBRPzsTHiF1kaGrGrCWHKabV
	aGK8eA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr838fs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 08:00:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07313be5so23565751cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 01:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784707239; x=1785312039; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgU+BzNuR/deTzqnhX5m6s/7fOxLFizypouvSda4pJw=;
        b=j70Jzdw8aXfU7vVa4NguhLqXEqYlr2ETog9vciVCZuaFmY0dCEH4F51AbaV9lceKAf
         FyhOKhsKhKmC7n+olYTEt8EM45f9MXqhE8bMkNavMImTh2e8kuFplM4Dyf1PsPUBqppI
         keYhmxnaFCfgi1rm60rP822pfj1Anlnwa4u8FjhbSWuUOE8ZgWMUNP3xdZgaJ+FNVvdf
         TRLqPUf8SViswpUpsVMWKTVnXbeil2jqqJ5Gtmu5p2bi298tP+LtblmVQ028aucpd4tw
         Cebjq5xfZXie2iYWs3WhzGrVR5/U9Hyw4Y3DiitB9AEA0HpVO9rNGZFeTl12h0nswyRe
         Epxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784707239; x=1785312039;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgU+BzNuR/deTzqnhX5m6s/7fOxLFizypouvSda4pJw=;
        b=Zl1oc7SlocAqjx9zkqR116UW/YtRkLIq/ImCZKhjNvFpwtHWO+ZYBK7ttmWMYtbvME
         Na8xtOhF0a6dN7eKBjMfB8ed3HPmDeMRqNkUAxo5zhVCEEUm2TC4gSt4VgMqpZagEbV8
         6plmBCS/gjny5aKTDTtqoGWfnInNQXg2rnTnurPqHn9jq0q0gFd6Qmuj3/+nDagqlx1A
         30j8LVZK0fv4GSTmvu8dFGt0wRcsmsbA3t+pNXy6tqCAear1SWdOH6y5CSpfZK1UgCXk
         K9V9twOwAiVWA/mMI9HQkNxWIoGJ58z2uVQz6IfKJStq8gP96TXxYJXC94TdQUg0xSzl
         FurQ==
X-Forwarded-Encrypted: i=1; AHgh+RqwNuztoRXDuijSB8qjpOh/ltGdeYKKc54lxO1JRzqhgwyfWHiE7Sf5t+gVCutUMXjyclWwffwarbi7LX6y@vger.kernel.org
X-Gm-Message-State: AOJu0YylO0V3IIfGVqc/u8nlTeAemv2rxRoVLA74Z1+48fyh2vjV2F21
	rNQrFv2VfFYuzZOSj8Ixbazjga4CnEyqYEtOmfJ4mTwCcErTl5bNU8r5Wir239QIFPdWrjHRJEP
	zF7DoeIlpogZgVlnUM2UeHUA8axfLvEx2ARNGjjOjOzofzQ3yOqqwtkh6m4srisJsJttS
X-Gm-Gg: AR+sD11hJN3BXq2Cr5WF3zxhd0M22EAqChWFgUaTE8zb0BxFfozbH+zGrVQT6ik7/c0
	GczIXAPbdQGA4YI1koF1oX0tuo2YihwJ2SVl2Nc0uxFYN1xSp9G9NxVid79YfHjKYX4A/1XRaxQ
	xJhtCUELYIZm39XmDvPLtNiaX3iidVjzuij77QKBYOOiF7B9nfIb9VUCIpHelMAucd7pzHHlaxY
	nHjo3tyCAc0Hc+AQT+7mGqmd+fpSV4oug9YHkFeNdx1CLlhcRdEkCvUZ1qhJr6Yx7i0zots7hQB
	ktG6FSLrGNMi0Jq9IgSRJpMcdK1/psk9qrHB/78420Oef1Ef6yG52QKYYAJGyLRrwrBU21VHKfh
	RjjNWXtXgJIvTSlB9+GOL6SuZ
X-Received: by 2002:a05:622a:841b:10b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-526756d33d1mr39223541cf.11.1784707238707;
        Wed, 22 Jul 2026 01:00:38 -0700 (PDT)
X-Received: by 2002:a05:622a:841b:10b0:51a:8c9c:7de1 with SMTP id d75a77b69052e-526756d33d1mr39223311cf.11.1784707238338;
        Wed, 22 Jul 2026 01:00:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac7eacsm66595066b.17.2026.07.22.01.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 01:00:37 -0700 (PDT)
Message-ID: <85f2799d-fadf-478d-9f3f-fb8ff91ba84d@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 10:00:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: qcom: remove ipq806x Storm machine driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20260721-drop-sound-storm-v1-0-23ae4a689ffe@oss.qualcomm.com>
 <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-drop-sound-storm-v1-1-23ae4a689ffe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ks_yrQhAjvh-_CbO1nSNlW-utnYQhbyW
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a6078a7 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=54rlfCshIiuqjZLbhqIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Ks_yrQhAjvh-_CbO1nSNlW-utnYQhbyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA3MyBTYWx0ZWRfXwtW12UZanzdC
 88n9ZL1JcgVgBbq7GKfI5paqOv49CDIqkk+NpOOtE7aoGs7vDb9TDoUwAZ6vlSIcLLa/9QH9OBw
 5fPgMJ61RzcuApdwY8++RotYVnQnQMr+9gzH2XCMD4Qmzc8ue0qm1VdRHMPQUHbUt5otNdaGUn/
 3NJd4Do0tm0XNkDXNkSSippgUXbFEgL9+fw2A7tCcsnfRlcGDUnmQitcBkzJZSf91/8Yn1NGk0W
 8lBT9ZRapodx0UCL6wB9lmorYnv6VJvHJ8e6UJxtMGfWzOvEjjqF9aAuZ4I6c+Ud53KrY8sSj0s
 HCa/xjlI6Uf5abgNfpu5cZ5oqunw2b4UZX1zTxKN0XmR0XyazRGq9m80JGiz/I918xhp+yUvFyc
 g5sv6xrRO6DF6kn4phjSMm1nM3HcJTcLiKU8v03aJNjW34PLiGDddCsBHdsnV6t0u46CGbxlpRp
 X3da8tloY+ZjABF9F9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA3MyBTYWx0ZWRfX6Ri80GJDnNEa
 kZaTFdWyRojj5W4aXtwb2CXYXLGD6/Rblt2kxM9P0jaytbqzEmLQIcs6mL8am1xmy0d825vgWFG
 yIX1iGcpYz9n7EJRiTEYoYTuwF3tt4A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220073

On 7/21/26 8:12 PM, Dmitry Baryshkov wrote:
> The Storm board machine driver targets Google's IPQ806x-based Storm
> reference board (a MAX98357A DAC wired to the LPASS I2S bus). This board
> has no upstream device tree, no active users and has seen no functional
> changes in years, so the driver is dead weight.
> 
> Remove the driver together with its Kconfig entry and Makefile rule.
> 
> Assisted-by: Claude:claude-opus-4-8

Using AI to `git rm` is definitely tokenmaxxing!

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
