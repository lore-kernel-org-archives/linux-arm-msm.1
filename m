Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793192101;
	b=dMzNZJq+wGFjUOB/bhF8RCVipDacFg9snyidaj9FfpwtHAnTxJcl3na3fPSl29ja+9Rh
	 k9ShGscGqgOqa0C0ehOOl6FIHpoimx9oFED/I3qaUZGlIcB4E6YlEcmHn2NzXbh7euCZ2
	 dk2p++O9wQD89x+5ZYhadhZlVIAo2FTW20VthMtiJ2yysVjXftNOesIvKcC8Bzxxo7Dt/
	 zjq8xsXmjvb0ZRfCoaFVd4WvNcRlOZESvHjlvt40Ni3HPUVZSD35S0iEq19H8v0Rb6U9h
	 dm/AiwYwdblVBq9rNP5+yzTcsr5fEz5rJYPKXDxyk5eog4JwikH5RkIXf/1IwJmrDeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192101;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oBGX3wEUWU/zL8/JcUQMeSMNE0OdIiQmKuQoXCX4P/I=;
	b=t58sqyixW/zhV22GpNpkSe46zwh6yECHbcG5G7gHDpCFuvwy3ZzqmdeQIfCBGsYCFDlW
	 GyEySihCvlS9H+UhSOWy1Bu4+mxoM5wiMSTuENFpwU3EpQF0r+pT07TrCnRGmf5fywQuP
	 3TyYmMLjE1P4bKsEo1R9fqHsLsXqe13uplsAFdQvkBQv/B6ruUozr16X0hNFJrH1BnznM
	 mfHHS1BYT1oRfSd0VGbJ82Z2/jNBvbtrhPhed6FsDArxLWOX4bLoaTaeqIWozSblZGgnQ
	 JJnn5jWij11MqzVw332cogZAM/XiN8EPgnKz6rXYTSgoBisPXJVkpLGCa4tOZdyomoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6u90Gqi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuExwkTa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84A4606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D84A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6u90Gqi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cuExwkTa
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe5vR3704261
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBGX3wEUWU/zL8/JcUQMeSMNE0OdIiQmKuQoXCX4P/I=; b=U6u90GqiFQG1SvVe
	b/7ZAEfeyt6CT2fIbV2taQhsmuDKtZVKiz+x4u8dTDvceG6TIDdV2tT8aOPWbaY9
	jqbfr0uNY3ipYT4UkfAWN1h3GRkfxdBS/nkSgUmAPciCC+KCd7LXpuNraJFMvmJ2
	vD5HVicr0NH/Gs8pc0hO0dgfypEX6JmpOi8sVeqY3U8GZ80eL8S5OZA5wRN9APfW
	KxCj/L4uZnPS6n3D3AQnz9JKlsC25nHSFwJ+VZBQvfSjOZOBr2o+EeKCgQif8OW1
	buV4B8HQPc/a7Z2r3SVMHh070uTuWpxodJFKgzq8oPBoqcBnOkmIBMWc00AghWfG
	qHZ8/A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy71484r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:54:59 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaad898904so47688e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793192099; x=1793796899; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBGX3wEUWU/zL8/JcUQMeSMNE0OdIiQmKuQoXCX4P/I=;
        b=cuExwkTaOWnC0henazb1cB0kjMcMPO/l26BX8MJeFjxQV0AHgXk+/jHSpH4rgFX1Wq
         VKUQJScQAy7Q3hY0iCc03ewUrKcYGsMDVa5sz2IqRn4Q3yUCqcLRFhdB7dOftJjZ3XmD
         mwKUrTeMGcNHx1LLa9CMUWQbcrdUApbhm06t7hsAk2xmEKDfXluvkra/jRgfd+w0DZZZ
         QUnIQNF7KaZv2OdS/APF9FJWbV65enEcz3sNfl0+GECCj1rw2SqBIQ1cGnd05mL/UaA1
         LTX/9DuZR3UVMwWx7FBe6zqHDJ8B4xY4+poQqkEo5agbRanOKRfKx7QqnZ2+OrTHrZ5g
         KyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192099; x=1793796899;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBGX3wEUWU/zL8/JcUQMeSMNE0OdIiQmKuQoXCX4P/I=;
        b=pclkQyOBlanwDTZb94fPj6PFhDT4uvnJTEfFXJJF876jnwQzZxmBZgSygRNVFqJcyg
         D1PQMYtTlRzF2wX40VLzKtQ+azhtJC8jSsfKnoXzp9QcjHcT9VcjyAco8NYAS8muBurO
         alNgU2N2XuwV6HIHoOSLi1xEPjPPWz6iRjLg3RBaSiRRfbzoA41/8/sp2Vo+UPXpAG95
         NZYzAKIB4S16Iwr/V7wA9O2E9f8khdqbb92jT+FPADWCnJO072MWYTH54jayIyVKpwLl
         xgYLgvGT78Sl+Z0ocRV6oRZD3o5zPlcdbmRk8XzWE6f603STspadzciFNXZhQUFY4v2M
         04yQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2NEJpVyNO0MNuWBHD6B6YiOZ6OYkn+V6+Y5wkU7BVnjoN2iEtAJ8RozVpbIjG9uTFdnrb734reawbAtBt@vger.kernel.org
X-Gm-Message-State: AFq9FYIC7MVdKT6uEvhJm6FvfO6FQ8+Ft9Iry0JC+xSSizdQu37fyagw
	O3OiKJnCge4aXImGNQ2Kx2H2ObMClxQx52HMfxExf+hvz+h8syeItwz2XXSDs7wRYZ+Fc44Yzeb
	VO1Gepii+x+NpFL4R0mYMrVscvrzD+m6NCAQ18lBIYT9ahj8Iu+AVEHFbarZkWlrDPYMa
X-Gm-Gg: AYBFou3uLzL+plF515C+ubi4g0owCdpcNjpY7d1WanvADy2yIjWkMTnb+qXXv+hplmZ
	GWVk/yl1NjRD0oxEPhc6/iHwZYyI/BLZ13JNJPYIKeWz+p8MsZkICRQF+F/Ma4sxDXw2AaRNurX
	0Qf1pg8Omjk6ZPhzF+OJeHeghzulbjL7WFiLCNGIZ46saLeC+gWDxEJCHBKsTjLJixes8tz/rGw
	VYNFtWvSSyxOIs068k6N1wdqk+WA8w7xvAPygWs2GchVTfazh13hSFeZ6y2+aBqkVq4vrBmQVtg
	UoZoEtEiab+l2Q1/GtqyVjfEwVH+fOj1Mw4e7SfP68eJgixBD0B2JpJRWyyWLL4rQ64CSNcyxw6
	HkogpYM+dlPlSFOkKmW9ZLXspL1Bo1hso7ZB48WtmaPmndATk1ZtsjGGzC7536VbIRnnfdlo=
X-Received: by 2002:a05:6102:8483:10b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7d03a54962emr695010137.3.1793192098786;
        Wed, 28 Oct 2026 05:54:58 -0700 (PDT)
X-Received: by 2002:a05:6102:8483:10b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7d03a54962emr694977137.3.1793192098370;
        Wed, 28 Oct 2026 05:54:58 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4964601f2sm1405843a12.37.2026.10.28.05.54.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:54:57 -0700 (PDT)
Message-ID: <465b774e-b62c-475c-84fe-da4fabc38b10@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:54:54 +0100
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
Subject: Re: [PATCH 8/8] arm64: dts: qcom: qcm6490-idp: Describe the panel
 bias enable GPIO
To: Vladimir Zapolskiy <vz@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Ritesh Kumar <quic_riteshk@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
        devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20261028095151.1682096-1-vz@kernel.org>
 <20261028095151.1682096-9-vz@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261028095151.1682096-9-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfXzOGj0NRqJyre
 +zsFpCIeKMfeWxeJtmJSYAPAllXRpBDvMrwC38YUe8p3AHyvHp9wKO/JcTaM7xNk/IEPFbH48VF
 jNzxMsPlo9rJKnmRRwKDKUF5NZw1linvWnSsH+GcsZpB3th90NUtFHcj3+oW1lcJrp/16cnmcpE
 E3+xzWlx6gT2jQN3a3pZpvWpy2t0DeqQbdRC/e9RBwLdP/06u25YcbshWF4sc5nNE7XSV7UEVD+
 l39BFiC6ABsQM+XjBpu6Kug6I96EuxPM6cvbgdM0SgVI9w/geJyx3KRqhRRkRMawQmtjcnjzsl7
 Jgo+PflJZsCL3SJAsYRJzV871fDgnpAsUPG8nYvmEQzwN2ItRQ37Lbm5I14ExdN4yVtSeRICQfQ
 qnbG9u+5rEszmUwU5cFkiZb6oOWxOfKv7oeBAQNjzcOgvqMxoWwarAu80b+DH6U740WlOo6Yy/Z
 QOsvO7+OKmmwP+eTeZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MSBTYWx0ZWRfX72xkgZ6UJn29
 5Z3zspYJYVUnmz5EnlxLPhazrQRwIwb6J8ojCTJ6pMFtK0HWc5H2ZuI7cki8wMhbwl0LhFmxp+o
 4PF7E05FMy0JwEa2owbYuq34k6MsFiw=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1f0a3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T9w7Rm2z-0zB3deyQ8AA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: pWnykYuPWKj_c0kd2J9XG7A3Qj6o2D2v
X-Proofpoint-ORIG-GUID: pWnykYuPWKj_c0kd2J9XG7A3Qj6o2D2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280051

On 10/28/26 10:51 AM, Vladimir Zapolskiy wrote:
> The positive and negative bias supplies of the NT36672E panel on the
> QCM6490 IDP board are switched on by the PM7250B GPIO2 bias enable
> signal, which is described as a single fixed regulator supplying both
> AVDD and AVEE bias supplies of the panel. The fixed regulator does not
> describe the hardware, it can not supply a positive and a negative
> voltage at the same time, and apparently bias supplies are generated
> right on the display panel module.
> 
> Since the panel binding supports the bias enable GPIO, describe the
> signal as such, and remove the oddly described and used fixed regulator.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
