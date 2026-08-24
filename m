Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4EB3F1AA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563040; cv=none; b=ZosWFAmm4NlaxUEgi0j3jW//FO22YzHcGF69bwJf51y2EL3CDpCu46uWnkqLZxib56AJPITxjAkzDT8B61e2xvf7nucZb2E316zPtZ6O75OMw8tQyhpFzn7fuO9Ks9hp6NcmllVLJlUKym8VXhmHIJ7N/Rbof75fmSxR+I2A/zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563040; c=relaxed/simple;
	bh=HY3quUIZFTbjvevuitlFBgXCQy04pa7QPQrGbVgQ0yM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yq8DxUXITD060MJXPJHQit9LR9R7wnbwj2pQ81ziM4sb8WGsP2Jj8/p8RCJQPeyOHGpTxx+rgerOFqJdzxc+wjv8k9Vo1o5kMw4jwa82bn0Uff4R1DEcqXFt+hvnxSXEoG6YWlsSlWJM0eMu/Zun5XpcI9YScH0/xuoTk4MW7zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzBpy6bL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wz98jR22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzBpy6bL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wz98jR22"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O98uuj3109557
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:17:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m7lsraZhCPgC1BRKXbcGaxnflmdJRncfoKjV8SVGtLg=; b=HzBpy6bLvxcKobmj
	kjeekBmBj09BzR2IySij75Pa7rmheFJ2IPQEeDK+5cEuAijTDifdPe3hssBmG1fD
	eAWwaq3diN81Z7khCN+eP/JM6x07pnxYMaxY/HztC4Ya8VSe4kVc8lgDtEbzk7c+
	MupRD5LQBlogcQVoFJ1dx27SBngWbiHNuDAqPOXIRfhqFitB15K9yNcIkmltWLWc
	8x0cjXjeEpqH42MGpsvR2ie1i8OGXNoNfFHaXVJVVTlLOD6nkh7+uUBOws+sebRW
	u7TNkQgUdmUouf3YPwLyvcjW8J8Ae6xYLd5IHj7LYSZnfcWm2fzMku1E5qRM5tWh
	5nUhpg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8jgk07r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 09:17:14 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc86a9ef97so13000445ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787563034; x=1788167834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7lsraZhCPgC1BRKXbcGaxnflmdJRncfoKjV8SVGtLg=;
        b=Wz98jR22cKjFjFAwQy+ow/UcPOuPwSt1mVsiJjltjt+WehBP1/VGzVwdBR5UTs0Dv/
         86W1bXp80f4bxAxr594G3t+eYQINYyDSPY6KeJI3/2MmuukocWxdja2FNHZh48AAG10K
         wDovVGlgTvQWqdfVBSmokLUNAwZ/TRljuMmwTQd3A+LdtHFv8SRLiByfpA9VFoVD15dU
         ySDWj055JNwaNrF9Sc1mhWgpBAx3X6o7mF13vJe+llwGdSOok/ZvqT0puUrwYh3VL6DE
         GGCxC0UaOkeOo8NTppR7QgnUuuEmX83L05B5PivAspdq6MvbPWGyy/DP/ZSsYVNa4HRN
         qKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563034; x=1788167834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m7lsraZhCPgC1BRKXbcGaxnflmdJRncfoKjV8SVGtLg=;
        b=K5X1NDRhhisDIhb7/9wLzQU+Z1Oc9m+ts2a733V1OtUvY1J6Vu3lcsxxf8T4aYPKX1
         HWUozTsWklrw3ZRqOn3EzQNelUTb1MiuuxAvhG6sPHickH8U+MKIvutYh+J8O5J2znTy
         5atD3BcSuQEIOIbXrC6fWNOZWHsd8EetrCcOakcyjR7MjuewT5+0GhGySvqxGKYdWash
         lSEsqIOfUDDvX7NvDDr8YfD1WIm3hPzPglmaIEniJE5Y73+YYMH2Ex1BxkJ+lanfrIWe
         FOixab0LGy7TlBplWhoUGEXCyh05cdniHabIgwX7YCrNQKmPrhWt3UxuHn9URhx/sH4C
         S5Uw==
X-Forwarded-Encrypted: i=1; AHgh+RrQl7OF9OMsCspzbNUqxAydeUAEo5KesKThxE5Un/TE8nifLNKgJbm4j8i5wxfbeybtY6wNSNfGSqu1ZKzt@vger.kernel.org
X-Gm-Message-State: AFuF++nDEO8GYIm8r5grGO/sOeTdgDQsNucEC2I7XqsFQYyah/r4W04f
	U8Susp+IPuEX2rysNmc5bvgB7o3ozeXLbHY8UpHH7XUQ5xugSDfPf0BKZrvp+WcVc1iP2KcXKWL
	BvscQX5qipG/zWhNrKYwmMwMXgfzXVTk3FUBqudjDTTkGbpcPak9ugkDl1PRzJrtP9DU=
X-Gm-Gg: AR+sD13eBgfHG0AY/aqXafRC0EBgdiJxEjo1BcEnNv/CwsUeQvQeTvFrnCtNwNYyZ6I
	0crNezJaLmFLcJ6cvTieQKB79CIN0n5GI7JUUdAx8DcKZAuAhaz82XuGwxllNhMwgWwfVQ+HKSL
	I+ZecbT/sHnoJ4+6wHw/Nx5kyO4YinsuM6UhpiZH5SDRNGUNDEGtXNpNZWxprwajKaGDYVYb9P9
	0CpupHC6HS7QOS5zoFSVfpYkXLASLaPT8OWSYoGI0f5Q2mUqyMWgoz/glybKrY+LLJvMJzuqd8S
	3tzBVaLD0gvBfCm55w5Ywn3fJWHgZZJKEiq47p1gnG8VNM2Kg2WCG+WhGNa/KVKo40NeQg9Ua7S
	e76+4S4LDoXIXnjg37fZvXd0ec/kdH8U=
X-Received: by 2002:a17:903:b07:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d64ada8eb8mr488355325ad.2.1787563033973;
        Mon, 24 Aug 2026 02:17:13 -0700 (PDT)
X-Received: by 2002:a17:903:b07:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d64ada8eb8mr488354125ad.2.1787563033470;
        Mon, 24 Aug 2026 02:17:13 -0700 (PDT)
Received: from [10.218.33.235] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d67679e55bsm15110925ad.30.2026.08.24.02.17.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:17:13 -0700 (PDT)
Message-ID: <46db44b5-ae8e-491f-a381-0494fd4916f9@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:47:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: lemans: Add PSCRR NVMEM recorder
 node
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        =?UTF-8?Q?S=C3=B8ren_Andersen?=
 <san@skov.dk>,
        Guenter Roeck <groeck@chromium.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        avaneesh.dwivedi@oss.qualcomm.com,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
References: <20260819-pscrr-provider-v2-0-9072383e0f4d@oss.qualcomm.com>
 <20260819-pscrr-provider-v2-4-9072383e0f4d@oss.qualcomm.com>
 <yh4d3236iq4kjp5gumj6sj6b2dbiwjbmyywiayzbm4ul2mqjr2@hu3ddfqxfftr>
Content-Language: en-US
From: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
In-Reply-To: <yh4d3236iq4kjp5gumj6sj6b2dbiwjbmyywiayzbm4ul2mqjr2@hu3ddfqxfftr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jLnS8uhiaD-VRK2gfZ92tdK1a2d8Ox3l
X-Proofpoint-GUID: jLnS8uhiaD-VRK2gfZ92tdK1a2d8Ox3l
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MSBTYWx0ZWRfX9F6aDNKPplQ6
 i+1IviQdJZvqLblWF8DtZUiL1kTlnIa7tUK19Q3Vtpx4/Iyr/p6pphquaqtoQqkTEWICVvVtsiS
 l7VStD7VOz6oVCY10sRiZe/bOuMNLbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MSBTYWx0ZWRfX/l878hB0NHG5
 jTqzk/qyKspQz3t+XMVjNgZ2fS+C8G9YJ3hm4ujIYXyQZdwiD8yATcUCNA8RfeJPf+jWkjqeLOL
 QqmdwuIUBmPraiDwU39nH4fQgrqpCQFPW3Gd4S9XW+r6LrzSEoxWVszw6fKkKUQXeiK79emoTDr
 LmlXeqN4n/NBMk0ar3D9fd+lILtBIxlSXBE62AHD+5QdgOBdRpWismO80phUJzvTa2p3gPXxFXJ
 gKoqkmTcTB3aXxs3kqv8iMIZVg9xgZlIt81naru+i6Dl+v5b3/L3jo9aAm+v3Mpz11CZWtaZXja
 WPmCDLLqMQMdJjpytS4K7ZNflQQUKNMcEqJGx6TwOzh1pdB4TWzMPL8+KPDPaJ+wVntFK2hJ8vz
 sC1xsAhP9b0EKEnXohLSSrExe5B3KoO+YHkIoKJMlxHB8hTq+XiRESW9k9M/F2wgZJrTsU+gsOv
 qgo8azWAPlZVfnYln4Q==
X-Authority-Analysis: v=2.4 cv=KcvidwYD c=1 sm=1 tr=0 ts=6a8c0c1a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=A7GeVftTVcCg-GgeXEgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240081

Hi Abel Vesa,

On 20-Aug-26 12:25 AM, Abel Vesa wrote:
> On 26-08-19 22:50:46, Faruque Ansari wrote:
>> Add a one-byte NVMEM cell node  in the SDAM to persist the power
> 
> Super nit: If you respin, drop the extra space between node and in.

Thanks for the review.
I'll fix this in V3.

Thanks
Faruque Ansari>
>> state change reason across resets, and wire it to a pscrr-nvmem
>> recorder consumer node so the reason is recorded before
>> shutdown/reboot and read back on the next boot.
>>
>> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

