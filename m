Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A100A3B6BEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786968067; cv=none; b=omp440LUUpS0POBWOAxRYxu8cer+McU7OypQ5cgmOzP8/HH2cGdIIVww2RQB8xoDAhxTOFEqyuS2CHiDl4g8hBYNpFDNuZKg8qhLmMIAcErVz8uCsRnnEZQ4piLRg5+XqriEah0Eq8jH9MaNNiI19tIClwJkeAsqnTbwU0eM+gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786968067; c=relaxed/simple;
	bh=OgJw/v8EpI3kGROG72e9JJGsp9MXz1VbFAY9BnBF208=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gXysKiyvUSn2YAVEsMMnIcVwESXDwN5Idlumdio4cHlBBycjR8PXmY78XDiLpoEq1fejOsyJQn1pHwJHecubMHJy+u6MhE1nak2ECT+MTYlE3F8kUh/ifpVCCiS3kYhD85LLVBVmpAsI5GBoFr4aYjeobrqjNXOkGz+kCkJoroY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XRVemVB7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4j8YFip; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRVemVB7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4j8YFip"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H9ddOa2990862
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSATXp9QJh37aHfasXkd8sfYODHkh/uv+2k6x9xJLYQ=; b=XRVemVB7N27fM/As
	AHNSMOnOGSvUoWbSZyQ8CTCe6Y5AFplZ70QjzLSB1VB1mlc+LwctFJvlDsyOSm9A
	vyE+n7u+cZPOPERoMhY8VQqBEMmW+C3pM8bpfoqxMctVKPPrbHWHdEOZmpM6oBxc
	5/6rkGD7IAsdWtuyFmQNATR9USOAxilzLRQuvlthdBLlKb+rezyw2lasyauvTaLf
	Q50dhbWpa7D0SIBCfk8ps4mnsKzEpIdRbysV1gBLFJNLCR0KfFqVfVxOv5mmmgMV
	FFVnbbuH0hXado9S2ZoU1C6OL64vnOjgWstFzlGf3/tn+3Gsswv6fjdvK028g4wL
	oB7wLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7krnnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 12:01:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52845bd815bso4047071cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786968059; x=1787572859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSATXp9QJh37aHfasXkd8sfYODHkh/uv+2k6x9xJLYQ=;
        b=U4j8YFipl066Lu9SwkVIEwV+wp+aWzK3fzkyMl3LR9yxNdZiuBr1C3CSlhb5yEZtmG
         7UklBnGv255x6qlrA3yGUTDCVzpJIq2HOl/GuNBrfqKM/PVD+Axmu/492RGr3r6lOGcw
         9Ec9r8fRW0z7mGuNhawbzISookrVGekusTlvZ8a19lOBMc1sFuls3NkB3IAiIPc3prKw
         jQkmKATvkJkIfrmfs8+aShD7MZq2K6SMniruRzpRNxqmEcpugpblYJvM+PFb3Ev23MFR
         huS20wIGR++XAyCjByeJEqbuzCn62LtgPMB4Niw/53nC6sFwuKlmsEmzgY58gLr5rM07
         KaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786968059; x=1787572859;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSATXp9QJh37aHfasXkd8sfYODHkh/uv+2k6x9xJLYQ=;
        b=dc2SP/5ZgSStNc37/fzdmjkepcUDOg3OvHGN5miLl+D+yIm1N+3OAi6bNFCHqnPlp2
         5mZ61cu+L66/q7WGiCsJt6fVlXikLYTWcK6ujKtdR9VWfO+Xim/2oYYIpHnj9muRQRkc
         mAU+3VctucdDgsTAO914+arcL0fhUIgGQ1h2l3EuHLKfxtuN9m91nO6xCn1p7OYWeO0V
         o4V0VAeuO3u0NUpu72m3Y4QbVpyJR/ELusROF5RSqtAIi4k1VoQTZRyfwK0KsMMtMg7C
         m6Mvf6SDHP265FDSadk/W2UcoiVrymJ/og2SsBxuVvJNv9NMadNHhFWxTF8FvfRxQPxP
         IlUw==
X-Gm-Message-State: AOJu0YxAEFdhy+IgnusxB55o5q5CdA9Bj+8KfmBwit2Dt6qN+2a8riz6
	rLWyxPmC62HlPy4peUP/qb1FGSDCS0ueEZSWufjK3o1Yk9Z78qQRIy/e0QI6K9riinChstJvEah
	Ujz3SjY1bB5xCH16uvoqsB5oHVZCp3L8ul81+6PTpPQbhxkC3QAPpBR+8HRsX/tRdueH9
X-Gm-Gg: AR+sD11CfLyXgOrZqRRnH7a1Q5pAcS+8JDrKZZqFrODLcxWBryUPq8tIhuE0GhBiYP3
	lJzK9DBNZDzMeUFRZBB3Ec3c/FzfGt93m7Tu2Cm1XzsjMpLxxFDev4xGaod0nyIu7aw9EKFdrvJ
	bgwE5ArAj0cl6Dd44PFlHkNADeup8geD8vYmjTGzNcolo9olxjKRYf+PtL/GdPrwwrLovQQX4ar
	hvc0mZf3Ru8LvSv6mpmqMj39nwllIP0p9JsHjurbML7Je/S2CadunY03uFkZRrR/4SBvZz+XJUP
	Foru+e4syFseTZdjrvvK62NzaTZ6FoDDPP2xqjQsPYI/iZVcyLo/XM/ez+tlCwCtJukQUbPzajK
	LkBjgfcKoh2aoHYcrt0XwtaGk
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr188658491cf.2.1786968058230;
        Mon, 17 Aug 2026 05:00:58 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr188656281cf.2.1786968056229;
        Mon, 17 Aug 2026 05:00:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66bdsm12587866b.58.2026.08.17.05.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 05:00:55 -0700 (PDT)
Message-ID: <37d4eb09-75d3-4a95-aa1f-5a76d3ebb95d@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 14:00:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8750-mtp: Enable Adreno 830 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-5-207ad1fac1c7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-5-207ad1fac1c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xgYsF61wdxoLzK6hIZnF2zf2T-w4p7dM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA5MCBTYWx0ZWRfX4Rvbo2DTV21c
 THRDcSB8IjEluglSZhuBqLnp6GJghUwyPno2jeGzE6aSodTL7GQ8y8aYHApjT0fU4VogS66jQUc
 a9qYnIYvZ6dgYr//234SmhewqWUfo0A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA5MCBTYWx0ZWRfX6j/01yXMA0ML
 3/jcsYi+1PD6QXOeMFuHoSRQhJQKyFYovwdhAGd6szTt1wiIzUr9MFTNHDKmhnWIuesMQTW4bVl
 3nK9U1rO6ra9jqyNxWD7VGcJ5zFkS8JlvfgZO/jbFzzEHKgbMShVB95Bf3qF/9TpKPLX5TkVmZP
 Qbc/3ZiHcxioPEqnA4MXXi14qgjyqxWVMXuqv1fMnAQw7wEX9BfPe9ScX76qlQTusjw4megt/74
 VnDRZVKsZy7r9z8PlJW3WwJFcYOIjKZ0lsQ9QlheONP7Sis8xLhuL8m6037Epc2CheMRewAFmSl
 aDyMocgf78TYA2Wq7150XtTzvcRZIyE4eyykZJompd9JhBX/pnBHi+WRcYMYzGEt+VoKl/IKzjX
 ssCSbGk0CGU+lEA5cW8EvHkxnJE15lFK0UDKqOdMSoySJ9/oYdxac6kxPb9XxYxYrTgOHmUjugb
 nGVYNjJNALqsCQI1oVQ==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a82f800 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=QDjCMyA0A8yHJihhU1wA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: xgYsF61wdxoLzK6hIZnF2zf2T-w4p7dM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170090

On 8/8/26 10:23 PM, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for sm8750-mtp platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
