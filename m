Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007876;
	b=Y5aKKziaZQEN9rIupyvTBhVI4Mxkv5b8CS7h2Wx4BajoqiClxVRWdHHbKI+nqRser0RQ
	 hkwTdtJZpRf6Rts7fYbLzAYR1Z7w6mM1F3tcmJZLWwVuIGX48k3b6nYow5GtkFl12xg9h
	 6yjKEeX8B1NDiQ68B1fpW+ZGlGqm+4wMsJwmkW48WEZfEOTeCy1ZbqC6/q+iHcIB3HJeu
	 pFAuYL/UFpobGD+IOrp9APgBQ30NIbhA1uIPjbXgTNMcFySzTt1LfPWDfbOzUDM28311O
	 8GjXLU42rOC2JUF8mr/8Eu3R4v9ncw6LVTus4dTlKvL9O+tlogGWA3BGsi9I9UaxI5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hKXdfB4Gw4NaKIutsMligvpwPmDeTaajtEivhe892x0=;
	b=JMydGQ0yPb+1skxY4Z12rDinuW4JpQ9QsVlTmTlw5jMZeB7o2O9/mpUzOu/2XLanuwLx
	 esIGYLcyDls2GnWO0BUaKPP2S0clIApoK7IOWeNyIPk5RYxH/yaKk6JkOwIoYq09HNbRH
	 jjctwZf5GBIgDxq4z8FgpA0sAb1xMKylGqX2YG184tE3NNh1AW3U41npFNDkiHEVdVijj
	 1Qif8FUH6hvGpiUYJw/z+kuL9SpaP3yg5BVxSzk23oqhM1b8a7h8/N8fhBCfe5ElYsaV8
	 KiQdXYhII+F6iS4xSRVpam6CVnHfLbGrfRAw4qRVJI4VcjsK0awR3GYGzj1dZXfjJ6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ooOInxsA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8XULosd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3266606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3266606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ooOInxsA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8XULosd
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4auuf2727072
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKXdfB4Gw4NaKIutsMligvpwPmDeTaajtEivhe892x0=; b=ooOInxsAYZUTmA+l
	b1Lf9QSDcCoKKt8RehLUwMOId5REsiEg30o3HM2PgbLcOxdVXKJW6+RAR/foh2rB
	yqWuUEFfNmtEzXqD+6Ws8uSr616ZhYwzxAtaimbIk7Eb5gg8iTkGGGTtRboAez14
	hkYz31H2qowwoS+KbF4puBpVbD4RsU2VwcS7Q+kNROYK9mM3SXW+6WUPKN7+JOtz
	IiAO9b71Ip730jAwJzso42O1W1Z4t04aZ9lxEEHtbL9iLFUDbvjKFCfKsuQJxycv
	HSSaAPKhtffrnHRvbOJ6SuTmm2nEi0sVFTRnutmED2yzwgUg0eAosOICKXknqzzo
	1au47A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6nvve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:44:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so35696485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793007874; x=1793612674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKXdfB4Gw4NaKIutsMligvpwPmDeTaajtEivhe892x0=;
        b=E8XULosdBaRp1P2hgJIPKijVJ41FHP+xl18abmWhED/wPzoAgjBYMBiUeu+JMpBn78
         3wAC0NBqHdzCYH0+b/ABBsqwKjUM/p58qMFXc2pWc5oR74XlKJtGcuJ8llCPHi2lvhZs
         FURV8Q0rbkHGz9TEnQclHalROvr8HhNVEdQEBBIi6uY4M8iG4YvybVfQEBhaEkIOA32f
         E9wB2sTJ09HehzY26rjcIx0vC5ikizNHUpd/Aitgx7JfZlwrv5yH3x+e/3cGXb8ZMUqE
         GKrHr1F59+w5ws8cx1zbvwSKVRjA0Y3JzeAqVsphXPmgjRMuGQ+HNSE8Y5HDOlVwbvdn
         ZSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007874; x=1793612674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hKXdfB4Gw4NaKIutsMligvpwPmDeTaajtEivhe892x0=;
        b=nYwOcJMW6X9AOJMzXvVKjMCqHo2kroJoWXOVW13CzCOCLzqsu7KhCSjAbgVsZqVTqk
         GrdxFbT3PSr4S8HtBZW5sqqlDreXPHCzYxvMWe2zt+IDgxW8ldb3Tn8DS+e9iJlQ7WGN
         WJsCTP6Fj8KKa1iJ4g44aj6bTjAU7/snJOu+MwwzBuKMTaGmV7OHhp6Mvzm55JZleR4B
         kcLDfYajwRA/QZd/nIW0pBR5/LNINjP6fkEEQOK4Im4DbUM9Q804P6/Nut7dG+oPKv2Z
         LF+GjNpvfS5t1n96YCX+liccNMOfy0q+1lQ1CwuHTfX+xT+aadURtRm8d6n+yifH98AR
         eqmw==
X-Gm-Message-State: AFq9FYKEDMq/BaxjRtTTTjdwfy4xeq/mLZOTsGXhRoBoCB+s+GQTlzU8
	biKrP5R7h8w3cgBEMOSbMRxfcFnI6JaVQYJHyslO3kdoDbvUs3GVGph+OHNpX8deLHxExxY+JqM
	AIlduLxjSpjqYR0OBQkEZabsWSw5cX9x34WZb5i49WtxC2BGRWgORp8degWtzZYhHbsGP
X-Gm-Gg: AYBFou3W5xP5vIV9fzRqmEboiqTvf9NU+jpml6aMs3FGAibxF0AFbzNbG0Pjk7bXjD2
	72Yr5cXFJrfGrNA37c1hmn+1CkYr/hBDKBh5mukZIG2j+0dlzbu46HWwE6Ql5NMiEIGpeJZD7p7
	V7qWPNaypJcUhA5IqY65j8Ol9zfeLVjINL5LL8IgZE5QJilkee1oYY1UJpt19dmB9pNZBFsc/wq
	S3y4nWk9DWMzCF/8vJT2FC/ZLxdLff/PGyO4qnUnjzVQ575CpHe3Ml9UcJg+ytawTC0ZRvXxkoT
	85aHZ0CGk5hDvLoRoIh2zTrWPj0Gaehbxe9d3Td4c3Do4u8anG6Fw0IVfFGz+d29BO1cSfhjnpy
	711CkJ5DISsWl+RNCw2X+bg==
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr1004579585a.6.1793007873983;
        Mon, 26 Oct 2026 02:44:33 -0700 (PDT)
X-Received: by 2002:a05:620a:3bcd:b0:939:9ef4:79eb with SMTP id af79cd13be357-940ef96e36amr1004577485a.6.1793007873529;
        Mon, 26 Oct 2026 02:44:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd34f465sm297052466b.8.2026.10.26.02.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 02:44:32 -0700 (PDT)
Message-ID: <40720fec-3147-40d0-bb0b-44a5a89ba0c9@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:44:30 +0100
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
Subject: Re: [PATCH v3 13/14] drm/msm/mdp4: disable the vdd regulator on
 teardown
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
 <20261024-msm-kms-destroy-fixes-v3-13-66a30120a5ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-13-66a30120a5ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _grg74nQxWx8PE39bUv6vBxikKftfFuV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfXwne/3l3lDFQi
 ip4Uwukw/SYTrYAMoyMFkLwbOEuxe5YH/IG8Bp9PjE9F66V66KMhXKlEEBnnqlIPJfUfv+xCitS
 Uq+bAWN5M0F+GdlrCGkRJjKgme3T6c4=
X-Proofpoint-GUID: _grg74nQxWx8PE39bUv6vBxikKftfFuV
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf2102 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pXRCLyShJLD6FikErHUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOCBTYWx0ZWRfX76Fn24I0jyK8
 B63t1d5S4T/iwp02WVLnh4/1NjUStZzyWbqCZoCAbBRjAnrdWkO/xs49IbWwuk9jXrWFOEkhbbX
 wN82pGtxuJ6euuQnw4TC4yieePNSkJUOaxj3dSFH5WPYK0RME7jVy7THiiNydB4S6PZKxcdQUw6
 gloCI/OtnLB0bp5pmSnKVyT0MVeYnt45zKItZP+BjJLpFfIVDr+aop2pd62Mc5GZARxsxxz3RtA
 8XG2PFhHsJUve7ihCfc9Cs9tV45g6AlM6+5nsUZppXRX0aDBsQBoRkvrtxse6lOJtIX0xF3HMS4
 Iuy6wBBiBYdWLlcqAXxvBzdrtDBM1WnPJld1NrudxeW/geGaNQTrgQ3RTh7gOs20OtqSRCuSmAY
 hNEBQNZ/4BgbsufUD4Hleddiyyr8UkRw0TrUXVKwGzpsZTDoJ5gY4AUNjrgN+6PkaaWy1306Dbu
 u4eUyRhVm5HsQwA/rrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260038

On 10/24/26 1:19 AM, Dmitry Baryshkov wrote:
> mdp4_kms_init() enables the optional vdd regulator, but only its error
> path disables it again: unbinding the display leaves it on, and the
> regulator core warns when the devm-managed exclusive handle is released
> while enabled.
> 
> Disable it again in mdp4_destroy().
> 
> Fixes: c8afe684c95c ("drm/msm: basic KMS driver for snapdragon")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
