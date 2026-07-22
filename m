Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FAA23183C
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784680579; cv=none; b=LmGBGapXlBc4oBzBmtBCvhRitnZ57XcphqsBVOmK6EvSvpwOzD5x+ULDQNf3mTbbJ2+2V+epMEF6LP2KVLmpaByYiBEEY85vR/37zjT1FVK6hXkgPpAH9zpqS0sWNXjlXObvH363WqYWbJiV0Njy3Idp2NsuYPEQc+e3FrSbYqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784680579; c=relaxed/simple;
	bh=/KHk1NS/0j3U1q8hqYXp736oLZRg6FpFENhlXX0EnGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLNufZ/QMw+AL49B1VAGMacWaw6WXexhZVjIQYJ/ONWQWjn0zDBNHWuYT4NcVQpNf1oEsow+cna5GSDi6Wf/YcPPPQMVXz62U/wCqdkOl72A4wF1P0wK11MTIvXe0yZyf7gHw0tld9r99Wg0q3Wwq3Gr2doYTPpPQFjxy7RKc1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o9vZbl5J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BI7GeMSS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o9vZbl5J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BI7GeMSS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LMZI6X2934425
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BJqQU7V8wmOOD/5srz/ytU3wA9lx3lhIkGFMiLfAAXo=; b=o9vZbl5JWZ1pCfZ/
	0zsJvaupaCykQk2PWs9bQ3TYwyQ7G1p4Kf/F1oat/NdY1K96Pw5Onlw5Ig70/K8P
	kDa6zuBs26lDR5+taP2XPW3Lk/4zDCJE9uqsU7kSPhJRhi9ob1ri0+SYEKLq3zOh
	Uvtns1RNeQX3MOErz7z8rUrmrfOAcehwBHSIp/alq7bJfG3LknV8CvQW/E6XpC/d
	cmKLssAw5YhHsY9z5L/FL85GXZqMz9xMaPAxjD40kED6zHYgXvviOkZAtczfMu68
	sJqZWWLjvgHh+5x1qPULPD1QfGko1j9UrxhO8aiQ663wYyV8pxx7W1tI+SCYDvP8
	q+QSpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeav8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 00:36:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0408254aso123583571cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 17:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784680576; x=1785285376; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJqQU7V8wmOOD/5srz/ytU3wA9lx3lhIkGFMiLfAAXo=;
        b=BI7GeMSSAX3P/EAolHp1VvDNsAfgO6m9YYPZhAbGFo+tsEqUuOYkCtlQtIXFCTSaYm
         DKZdK0ocfh/v4c88e/XeQ6DAfs7+y2qNG+MaqaoJGJNQp0To93lTJGxX4ciyyAQfBOe0
         otqdN/BFfZqo0h5nA5ww0v+YnYLtKZFFTyVrhjBi1tkYLpHTpHw8Md6MPG8P0H7nJGdb
         s20PUKB+zWiAY8Qnh50gmnure36SdBpJqDrObEv2a4bqgkMbYUmMY21C9QJl4Pzl614G
         RxoxhPfO4jvFQsa/Ca26y72MbSIjYz3Vjy9gnf8wTgSrvILivJ/oNN+LNmlKsLoAFKE2
         tw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784680576; x=1785285376;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJqQU7V8wmOOD/5srz/ytU3wA9lx3lhIkGFMiLfAAXo=;
        b=MBYImp78Umd9FCgMJl73jrxqZvfvDwawVhBOxPvOZS108kD0tw/QcQ28vjgaonj0qU
         YDlYHcArvdpj/Epch0wqDyW2i1HGRTaxV5hV0dsM7RxL/2yzeODlZJx1Ehzba0/8LRHk
         g9IKssoTuREQJfJruazp+DYw8rWWo2hz8qrpur/WMr7XsJOE+dtObgb39UToowETatsU
         /im4obBTl6DjzjdYja6gz1QB6YxmUzwQJR04TSHmJL8HMybUz/yU14aEFIODaKkAQ5IG
         0AE7N6M9TBsNxPdGjMMTKbK6j/15vEqRPhrCdYzwfy6B3Zcs1Kd6lSJkHenwt+DNLDoq
         avgA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5Nbmrfyu6tty73IWWXsqPbKCkcseBWPplPWQkIIth6zHYte+mUHmB+RSVfRiKMNbefGxK/5/87JxMOzJu@vger.kernel.org
X-Gm-Message-State: AOJu0YxSlpOfgY2QYSU/IMPUirSBOMxWzOZb+G/iusU4jH9nakNazq+G
	prnKnA8jxcTgYlNEoELLO4VK9XBcDzfVMqX5RN3X7bE+IVkf9qW9FRggNySsnGf3btGWA5YIbRl
	rxftbdmQbRu87dseJ+6odjcj3bQyxIctm0xNiBRFlPOqo85MLGgbQkqW9g6Q7BsX6wKRm
X-Gm-Gg: AR+sD10DA2KlYOaWhTjK733afi/AXdC+t5sIQJopLcT4kn1zhfKRRngB0cuq7RTr+Ec
	J3USa6ESPwRnr2Ww9SSZSkdDSTFap+36OQKpaYa7ipRMJ/xkhi0ocdr+7LobRYsHWrybHG3E7Pm
	zAf+7CDBSdVEahiNeW6mwyl9UDI2ovLrHNhV3dSA80wHoA8w9h5ANxCdXI1M5gOhJKAy3RTzsbR
	1f6EdTZKpEox2HecoMGL0Dlmh9iOzdIIVAZqUwqnZe876thj2vX8cIcwAlYFrkVUCzwNRBUj8U8
	Y0Hr5dNQmVqJlP5iL/GvOgP1/2IOuaxCLMtv0wCbRgkH9QKxl8XVC1KfHm+Hn4j63s4PsTgVIfK
	mEeYzYZPGgTvCmcgkiPLG/aMICUIsgJ+u+n/EvDuScUmq+ahxLM17qH+Bv53XPT9y5Dj33OO0wz
	+U97gTIaIyp52v3A==
X-Received: by 2002:a05:622a:1392:b0:51c:98f:f288 with SMTP id d75a77b69052e-527a817b718mr21525741cf.25.1784680576030;
        Tue, 21 Jul 2026 17:36:16 -0700 (PDT)
X-Received: by 2002:a05:622a:1392:b0:51c:98f:f288 with SMTP id d75a77b69052e-527a817b718mr21525461cf.25.1784680575600;
        Tue, 21 Jul 2026 17:36:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6d558bdsm1803721fa.32.2026.07.21.17.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 17:36:13 -0700 (PDT)
Date: Wed, 22 Jul 2026 03:36:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 1/7] media: qcom: iris: Centralize internal buffer
 table selection
Message-ID: <obfonexwxzhtofwumxz4odjsavekgal3utvum5tigeg2xdkpor@ej7mmndux7yb>
References: <20260721-iris-code-improvement-v4-0-4395bd8acfbb@oss.qualcomm.com>
 <20260721-iris-code-improvement-v4-1-4395bd8acfbb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260721-iris-code-improvement-v4-1-4395bd8acfbb@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: HDsY2JzrDPsPd4CxBTTO58c5RGy26szO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfX52Cqpqpr/Q1M
 dvEaP22cN6TY3hvaN2VUGCkq0sTYfeDmgbBbNKNA1dzFsdiWV4eFgzUxJPUAXtxR3S1R5hQQ88n
 Xz1kt/BDu3vz/XTPNjzkVtugHK/rwfI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAwMyBTYWx0ZWRfXw/0n5wyIum9l
 H9r1FYf9srIkSNanvYp/aP3kCgRD7xtEo2h8CZTV6g58mK1r1ygfXeVh0105b3reZ0PeZ/FJPB8
 /dg8Zsshm3gm+5Rly5T4ap/F78iG2jkmrAaJhjtpqI5RqoOrSYTIuw+hdB1QKUFpRyEzh5KTSpv
 5oQ568wArHVPB6EXH2iyu7HfbzBdXtglfBTm2HF7EqMq+PA/CaD3qSpTViIlF/6+0N5gkB7eCvJ
 e6rI4vMQnMMifpi0Ym5XTkdP/8aTxUbOvt9/FprdtfSF8UxwyGYhgxJAewDvn1uD/RNiq8zthy5
 xUmBxBwX36H43ikasLCWndfWjqy8ySirekWkExT8Eyr8+/Ph62z0cT5vNuYWk6gNnZ3Yzqkl3AD
 8ANav9Gpnqx+85CObmSFw3b3NCc44rKraqOoUWb+PHxiC9ccHmXKDCiqzQtaJuNcwZuFX4cx6HL
 aO9fuwwiYp/DQXUNCrQ==
X-Proofpoint-GUID: HDsY2JzrDPsPd4CxBTTO58c5RGy26szO
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a601080 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=oW0KT12sG60TQqSn0TQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220003

On Tue, Jul 21, 2026 at 07:50:34AM +0530, Vishnu Reddy wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> 
> Internal buffer table dispatch is duplicated across multiple Iris code
> paths, which is error‑prone and makes future changes harder to reason
> about.
> 
> Consolidate the buffer dispatch logic into a single helper so that table
> selection is defined in exactly one place and keep call sites minimal.
> No functional change intended.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_buffer.c | 107 ++++++-------------------
>  1 file changed, 26 insertions(+), 81 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
