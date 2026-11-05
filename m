Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866499;
	b=Bofgl1QAmiGR9I8LL4ph2FVdKb889+t0K0PowbgIcvPUHEIc6Oz8IL0gGCAkOY6s94yv
	 BzPlaZnigPY4ivx/UWwb0MfYC4UOHZR1+eXnaZuYDP6eT6FQLHgt6D+bAKeIkcxIYgkPu
	 Yr/RysMEYKFPZSz0UujnmFnIJy1CeSIp/AVdH3EHEYZodkNsrglX3e1aIelc6aViJAipd
	 3h88XqVOd9FJ2Lvzd5E5/zZB7O+/plXof37Ly/39Awt/WAyLsf30320LicSOL6m+nQEsf
	 KVykf0gCdm0XqIKdjagYFPqDuDoiZJXCR4GjUSf/Ao4tXXp95uK6pmTwDzZNHAjSEjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CNclkriunYbBMaVdIXTN6SL9vtukgwN4y6FMbEyV2KM=;
	b=lsYj/OBMpLM9G1cQIAsvS2OqAoPFJO1al5RSAjDKbtwau8dz85vDtpIUOKiT7JQOWT2H
	 //z0kDRaiNN+ux9oRA0mpNXmHyv/7y1MTAy6lvOvnulUwhonkVcamyNnMjQ5NRjmAt+ee
	 c5DWRE5gNcLuGyRINXEvugkTmL6RLVuMARAp5ALrB41SCKzfhNI15Un//R8KZxEsSoIid
	 axepIJXjP6BN+bkV1gWMlJSdbUpAVbcMdrvBUiUZO3olWmA5lxeIXKaaZGFxtVnIei8xj
	 5pk6KNSnjMW1a9BJU371VySAWgDusIB6c4rKw+XLf76aAy+wvrZVX3q+s1I8slYGGZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j77L8QPK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NEypo4JL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC5C606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BC5C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j77L8QPK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NEypo4JL
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UCFe942014
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 08:14:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNclkriunYbBMaVdIXTN6SL9vtukgwN4y6FMbEyV2KM=; b=j77L8QPKWZBQ+jZ1
	K8Btva8ICOlPOodpHLv4RKpgwyePhZRn+zZizN9rDvlunq533kw5NK+baUNrpaTw
	XK2xXF/FJfDqIS/uHxgblKfJQyKenikPMofnghGau4ED6zfHd+w1vLAlbZPA+tpn
	KVQiLJAyrsnOZaqh5jfgjxAW8pRJ60UcAnuBnAaIeDiyynLO4/VT4aGSxQxZ2hRU
	8KGehbPJU8lnW6XuOKmsmknMr/eq2BdVUbsvCuEuFBCMy8pPw+J3TnnO5uEcIV8o
	pp+v5LicooMtD5U3luCR06m7sdbaur9psqVgs0Vdhd6OiTt45gaFSZbeqVPB3rcx
	PbkHvg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj3x96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 08:14:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c8f9f6b49so3880696d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793866496; x=1794471296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNclkriunYbBMaVdIXTN6SL9vtukgwN4y6FMbEyV2KM=;
        b=NEypo4JLIx+ttCtAymSnLgxu3GqopjSNEbPkV+aaXKweiuefd14BFfQ/9jWh6eEfnD
         2gAaUdObWg50i6ZQaV1XuPDRW8aqsWO88fjIJgOgcYtB/vCz6vKU+Uo5zn+sKDgMP8Qk
         W7MyerPNgMRbov7z9eeXuWM6KBtzGYFHwyRdR5bW9hEKC484ZS+vFYYVmiHV2BcAKetG
         3x1dxG2M9v1z2LEVD+l6uoKUUg7LQx2WG3dje9ECuxwEVlNy/DSC8ivweHj1EACa4f5r
         5u5b26QbVnDh4wssiREHHy811zxwFc0k6guELIO2rrBjtBejcPNAe+Ou5ymwytCOCvLR
         iuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866496; x=1794471296;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNclkriunYbBMaVdIXTN6SL9vtukgwN4y6FMbEyV2KM=;
        b=zC0Oez7Ii9T0AJT+taQxRdei9Oiqo0yGSri3FA5jPBj3MoUzK2zZG3jabCp3ZcAc8b
         feMBMtPgMXPW7BZ7jff7vJKyjyGmJyfC4F691kit/oJZm766Epu//3eeSTDzqedIQHtG
         oh9UFQ+s4pHsplD/MOv1QPEk616NVFyDUCjkK0kThdZyMFRGfUiaHXf5SZyN+RjzxqiV
         KAiiHJNusds7acmqpKtHBJHy1VVJ1AfHNiM/KzhgEOQOtD8tvKt+YN5D5/PRtbBqvctW
         0ef1D1VEiEtzAMwa/pZd/oWE2JZa/0uf+HAJ0qbIE2qJEO5S/iAkCVdo8+uI7VwX3qfD
         1bZg==
X-Forwarded-Encrypted: i=1; AKwUvBysA0kDTGKYrR5Bn+lr1LtGcJYx95ri3m8hvgV8Q3S3c+xNv4IeYV/a44wLY/Ca70vk9fmCsbyuTqnGMJ1m@vger.kernel.org
X-Gm-Message-State: APuU4Z8g3g8F3D5vZwYWwI2L3QI7iJ8KYKMvUUTTpJcuT0W+XUau1pgY
	8LfDlDR6/ZsMM6RaewlcQXIDrXmAroYRn9oX8ryvboTBClcX+xYzqiU23XfWydUz5WuI0S2n5bV
	lm++Bm45As2c/TeYtPnq8v+vueZcCDNr8vgUmYL99Wro8/m3FviAt7T76RzU8g2QRSP6x
X-Gm-Gg: AYBFou3APoKIZR5ouTxkmoqle/MFf1EoAaS7t65hJGgnWLT0paPcgsY4kIzqc4nI9VL
	sObEYZqJZIN0LPAmOGXdFXUsI+rd4To6H1yp+2jB6WXVDXhe9gk7hT3NOgdyekcIapRKAzqZcEq
	USRQQ/esvQjIV+IFWEyhSQADJ/HETgF/PMxyGG+kV83xG2fnpmJDKGMuToExVLAI9cFOpA9ksxO
	R3ew9KVneSfGIjJV6hkaaHXGDqRDgliiPwjqGIDyQSjyecARzM3Z/Z31uTtN5zGClgL2/exXDTB
	1MAM003Mq/Yv2jFTP4NHB7cIoeQVGIhKdMEgEpIkAgKHbGzN0jj97pQetbiyU6/nxlONKdmxA4C
	/1qKVeqGo2Bfd0ne6WzrdnJjhdWKYmrwDM8I1PAoaMHJLaBY6k0wHeU/GHt58dFb5RZIS
X-Received: by 2002:a05:6214:5913:b0:91e:94a2:f994 with SMTP id 6a1803df08f44-91e94a312bemr42645116d6.1.1793866496638;
        Thu, 05 Nov 2026 00:14:56 -0800 (PST)
X-Received: by 2002:a05:6214:5913:b0:91e:94a2:f994 with SMTP id 6a1803df08f44-91e94a312bemr42644466d6.1.1793866495886;
        Thu, 05 Nov 2026 00:14:55 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e44650bsm149681966b.43.2026.11.05.00.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 00:14:54 -0800 (PST)
Message-ID: <54b22ec7-f763-4f89-a711-c6c6796550cf@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 09:14:52 +0100
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
Subject: Re: [PATCH 5/6] backlight: qcom-wled: Check for auto-detection
 callback in wled_ovp_irq_handler()
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Kiran Gunda <quic_kgunda@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261104183935.1214630-1-lee@kernel.org>
 <20261104183935.1214630-6-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104183935.1214630-6-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfX7Fi61gveZeca
 kFVN1ODYMZnOO7GRQCdQrKgnpMIJ0EGdYQVaU//XajOwPc+jQIBiiOHAYeWREXh+lTm/moci4fU
 981oCVWPbNds/GLdQTKTAZliDsduhjkEifeq32amB3M/2/mT2OkjJ2hvrPidclw3rTSzIROr21J
 OQqNKhonaKke79Q8QEzBt+ZWukGTs8pm58wv6Ag482W3XzJ7WYPd7Iey/e8f5g41uQzcRWnar3L
 3Pnjv8Fl1vaSI6pTVP/n47M6reVVrxMQR+ATx4/BUVoDiL15S5hp5Z4hpLGnmSnT4/LHzRxzPXZ
 iNW69i7+CQpaGjkGRnbNuZU1+mDecfQLqjY7482Qb2Rz/TBUgyPjIctDB5QnmTbQqDpj1hydOPd
 jEer892B22p/1JCL38PJCAKIMKIhQMkJFWDE6SWB/iQO5ydbcQkBLDjF8O/UA5CNVeczS1Q0kHo
 9/a5qn1wcOrrHNNmVhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMiBTYWx0ZWRfXzoaoaPtNAcBB
 ad3wox5QHgs1bpJ0mhD4Hp5lmtbE8WQi61g9vrWB3Xk3Q6lsdVcrdnkPaA9PFkdwXvI7kTBPLCu
 A893euS0+NvWRnuY08QShQx24l//xak=
X-Proofpoint-ORIG-GUID: wFVfzd1eY1BWSo_ULoIORkF7DG27WYZM
X-Proofpoint-GUID: wFVfzd1eY1BWSo_ULoIORkF7DG27WYZM
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aec3b01 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EwSOXpY8fmkhG1aJMgAA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050032

On 11/4/26 7:39 PM, Lee Jones wrote:
> The wled_auto_detection_required callback is only populated for WLED4
> and WLED5 hardware, remaining NULL on WLED3 (where automatic string
> detection is not supported).
> 
> However, wled_configure_ovp_irq() still registers wled_ovp_irq_handler()
> on WLED3 when an "ovp" interrupt is present in the Device Tree.  If an
> OVP fault interrupt fires on WLED3, wled_ovp_irq_handler()
> unconditionally invokes wled->wled_auto_detection_required(), causing a
> NULL pointer dereference.
> 
> Verify that wled->wled_auto_detection_required is non-NULL before
> invoking it in wled_ovp_irq_handler().
> 
> Fixes: f16899a6a7d4 ("backlight: qcom-wled: Add callback functions")
> Closes: https://sashiko.dev/#/bug/linux-d3eba287-2af9-43fb-851f-78ab3df0f35b
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
