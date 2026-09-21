Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A55492E48
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992643; cv=none; b=QEHa5jPYD/6wFYelA4FSllmXSbeXHvgf24v+Wh1lh+aim5SSoK+7VTHHPioKQGm8EORcRzK7joFsRDTNImlcI16wzuiXCAgKPZMIiB91LMeJawoQWNoPelO2s45t4TEcQEHm7BwMzp3CDEmI0+SPzEGeMyb0iE5HOtmVIllmo9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992643; c=relaxed/simple;
	bh=EbK6ODNmO0D3SZaqHghB8w5UPz7lhy68KwjWae3JCWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbE3ck6VjLgJD2OwB/sh9pc1pkF93olRH8WqsRVC+f6PdMEMB1KSMBFTGKKvOMB1zy0zZFuWwL95f6UX6i/vWUzS2CwpKLkTtWXjnqw+YgmBFIVPpIBgseHUi2xkddvFbUQ//EwwKOd5GEPFIn28BaQYAU9EldbzUQBQdwVM0Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFyqWjTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U3J4yaHB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFyqWjTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U3J4yaHB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeC7k419389
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:10:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tL8IyACdL/zO8BuJLGunz4pX
	sGhD+T9jiJsqTTcZuvA=; b=VFyqWjTwW54GTNCnz2FKpdw20pT1oxAyyab+0Agy
	FSdcsuxzuMfu5Oa7nxXGkQgU9mrvXECx2grs/OAVHnPgbHA8BrF/89/CV9OWBd3m
	9R27Z4CEzmu85gokRnGzaKQoIPgYguh0dOfk4M4euUDhiV9di2201XccN1CfPIKl
	bCUG+ol7CrRnXEeAaUbooBVbNpn5u1ZPJboPtxVfv32FdJEyJjjC9+G4sXFBGKct
	ChnCpsB8SFElmEbR6y6OugjAzjZATqVFLTHak/OzPyvIGaO2KkdN+Z8jDWKN7iCu
	ISihCh9M4mrCNC8DzLvnexyIfa2f9bM81g36NkKTRCi5dg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq95qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:10:40 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980989f5030so2313459241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992640; x=1790597440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tL8IyACdL/zO8BuJLGunz4pXsGhD+T9jiJsqTTcZuvA=;
        b=U3J4yaHBkM/mnZbtukwDB/5Viwi4eYDpCuKgE6JBlc9Kn6UDb2Z9SAfmHOU1i+Onzv
         BC2bF5l76rkTzC9lZRTYcB6xpQr9ahyzCpG0QdJ7HoC1BGJ8ponZSyhallmSoyU2gA8U
         fEFzzDclZ3jvHmQiI1bjWoZZF1+ICG4oixONzXIgOMvSQdMQenG98rEl3rzXL79Hx7gR
         W6OPKQdnCAAotcqSP+9J6K524kwpRsgxy7d5Fwz5hmtZhCEPHP2EZM1HK9uIJQiCWdd1
         s5+69mpRvnBgoAoywmvILCZ0s02wv/tMHxKhSYZinZ+EPX7Z+UtEr+314lgHALf54t7A
         JRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992640; x=1790597440;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tL8IyACdL/zO8BuJLGunz4pXsGhD+T9jiJsqTTcZuvA=;
        b=kmR2CONdHofiCIdvhh6RB50UzSi73HodL/Vpg8ILXEiJ0g1gB3upM8w5K4iMb5rHhJ
         NC5ByIH3FmPnJSYey3ojZPY0AJ1YAKSHD5bthD9FPPJ6kKzePIFj1zIZ2Opq0e+c6e/V
         BDsb7FB5b8tlvmM//jNRcuLNmSx2qb+louhWxSRaYjBA+dg8GE56Kv1TqM9wRQiPlLhm
         t9xE7buU71TYKqwLOlP94bzo8qACuxRosJkAmvSLXKVoY1UOdfEH9981BWy+xB95B1Ib
         fnjBlfBMTVX42sU9pW64TGUiJkElcxK3+orzrEj4PTN3/TVJMNYdrVzzFvAFAE9WHRxR
         4KbA==
X-Forwarded-Encrypted: i=1; AKwUvBwNfZljf6T7ooIg9vqOlAfR04iCpxVLHhLNsC1+brM9oJAxl6MNzFVyhT1adCuwpWkDHxL8ECWtwO2ZKEjU@vger.kernel.org
X-Gm-Message-State: AFuF++khOVdrLhdkEm3zFl81yjCpIo8BzEJ6jjhc8sDj05+iSfCpCBgG
	QsWWjKRZ3Ww021ssyol0KuDqP97J0OGz1mirjo0OvxuGEVelVA3+w0J1yfPr4mq3P0zWmUZfB63
	lVHYZH/93YMb4pxczQBcJik7X/gfmsCumVvubRyyd1E0p++DogGYy81f5FRRGuPvS/xkI
X-Gm-Gg: AYBFou3IrrmNyrNJzjvMAOzliQLLqS3F2E/Q0AUc6Gf/Af+oCZN7f16dqswVUGBiuz/
	ahS+Iuk08uPC1Y0ujEVPS1PgcNBt3i7vOlVAs3UPaLJ0Q7srIsAOLXKktUQ5SNRBzsJBe+bW4ZL
	qWpqAuKcHg8vDTxftZqXcbVSw1+dOxWZj7Pu9J9gujNL5vv00ilJN+nA06E2sGEmyeC3xTnRYCP
	9uzr+Q0/HgMmQaG6edGwCGBbzDutAynpLwSx8Ih1HxpDFGHxoA5fcfaXX14Lcviww+FxI9VSuID
	YkfiM44aG3NUN2uiH5fItJw4TDJBb7F3wqqYL+cwfl8AHpjFB6ngqBkZpaZlu/7Ah9PKwh9tjlm
	OxBI8HAQbJvtgew==
X-Received: by 2002:a05:6102:370c:b0:7a2:568f:815d with SMTP id ada2fe7eead31-7a55c2891a3mr4038166137.18.1789992639887;
        Mon, 21 Sep 2026 05:10:39 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7a2:568f:815d with SMTP id ada2fe7eead31-7a55c2891a3mr4038117137.18.1789992639421;
        Mon, 21 Sep 2026 05:10:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc55cd8a8sm283004565e9.0.2026.09.21.05.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:10:37 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:10:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: geni-se: provide PROG_RAM_DEPTH for I2S
 HUB Serial Engines
Message-ID: <ol2x2dw6akjc25o5kw4ji7h7niyqtpvjopg6xljy2rob6ays7u@n6ufsrlev3dw>
References: <20260918-topic-sm8x50-i2c-hub-fw-ram-v2-1-30e960966802@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-topic-sm8x50-i2c-hub-fw-ram-v2-1-30e960966802@linaro.org>
X-Proofpoint-GUID: jHpDGr96aq7Q4-Y1xMwHi4EFV8wcAHTy
X-Proofpoint-ORIG-GUID: jHpDGr96aq7Q4-Y1xMwHi4EFV8wcAHTy
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab11ec0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=U8wyIeYwd4xs6rStnZoA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NiBTYWx0ZWRfXwokGuTbUfNhM
 ZIxftyOpUG6wQPbO/hJ4xGpD61lMmkrjYjupOHLuGHsXtjo7wiC9ZzJ6xTkQUt8kjgLeC8q8tNb
 jg3iSs/opEx7jr2iUoQyl2EnJ2U+NjIz9IC/mWGKCKZOt0UWKIb7TLd62u5Al/d8jzsJAFClAjD
 DiTDrLOCvFaM0ULHWvzFPT9mJCX+v2qT8gkHFVqjhUxJqNtTLo0zgUYg8EsmgNj42+3cn2Etzz/
 BoSAga5GKYiSZ0wyRPciT/OkDbL9qJwz1Kh366iCHvY+I3fYwG88cEIMAPXIWeR4XyoOdLbsYG3
 UwYygDSrtUz0WvB8wHoq+Fs5pyoWqWY51Bfsbuou0zwMvXOskI4/c2qnB8lDy6iCwVKB41CCDq9
 T/5nV6mZK45GW4k416N/zVOZiDOYdf5QykQAz/czl1ExBAQuLjHoLKVIuywxRqAh1vEXUwKeFVo
 0sv7tBZPfHKVMxj2scw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NiBTYWx0ZWRfX3LkZof/hweb8
 4I3hYjGVJGAnSmQSrq67aSt1J4hpFHcJFaitJHnNSLpRxD1b4Z9J5sA2bZMKc98Mt9Q4sMFUZis
 y6i1Sqm/ceexJpLjlxMrRMdjcas0NGs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210176

On 26-09-18 09:29:04, Neil Armstrong wrote:
> The I2C Hub serial elements lacks DMA, so the SE_HW_PARAM_2 register which
> is in the DMA register space doesn't exist for those instances.
> 
> Provide the ram depth in the compatible data to be used instead
> of the reading the missing SE_HW_PARAM_2 register.
> 
> Fixes: 522bfb4f33c0 ("soc: qcom: geni-se: Use HW PROG_RAM_DEPTH to validate firmware size")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
