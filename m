Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612841;
	b=fxbgZLPC1U2CZFymC56XkiYK/HK5gglWhzMjsflbjKT66U71U2xIX2cZjLoQyFIirA9F
	 HOzWxbF7ePiQOm8pCPFb/qH7pD2JG7DgGTlFAQ7uQteIRS018gNUZ/xuvlYELX4vj3pM+
	 ffQgqwpcl+TiZzUhrKRQbZKnsKUsFl8oZk06wwkThYJsyBZPj4sRtMYZ0BFfNvFJiJw+Y
	 NC9imuIoC44re5jSdziUXKo7xRea0lcLL4M09BOsq29aXXPRq9JyPXZAt7QuFXiyAoKKn
	 x7/UYR018ImlSNen2MjwTTC7bh+6NhrTpzH7zczmRCQD4kJEDlrj3RaOpYoCLGvwZCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612841;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=;
	b=pV2HXgGpx2u623iF+lVKimibVveoT2dCnsGpjKgSnwDC/4vGZ7sZsocj1WgIFSpuNMhx
	 R8SRgYClOpXm0w9V+L5iiG3KpmrsIUo7TvBlZwAqTNHU/eLyMi8k6F7v4iBbGszEYImnZ
	 +KSJZpvC6YTSy4aX/AP+sHmKPb3yC6/etuAutlouHUdx4gFVyl2cG4lKWX0oAQGjMK2I3
	 t5qVk5yCY+TvWXYvT6vZKbVa/b4BW/OGSoHOYkpn2zTTrO+ef+wzJHjRahSq2f8zHUrCm
	 WIFbAEk/rFn7GUSF3d9I5Kxpyt27O7IzMzYJp3ngNL59U5IfLzbjdd1CxVGAQPB5LVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSnohwWi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4ThyiBE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2917F60A2604
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 09:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2917F60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSnohwWi;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S4ThyiBE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AOlr3086541
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 09:47:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=; b=jSnohwWiUBZ9NtOR
	oHh5Cwu3ngWVSgEcNRLn2xJVxoWzJKvbteDYpb14R2Eg0tJZ5IWHEp5j3q2VOx5b
	kKWIN8wgEFGsoHxjzPvqxMGHmmWqSvP4o7CwVGi798X8CEf4jtxPLl9wC05/a0b3
	wLQacHVo5zMf/nvVzW2Ckp2jBa59W7Wv0dmCyDxDwMqN/jHefWCmZ1ySduX9qc80
	G7gPpSFsGI9iCNHPxGmiifj8qfz1tMFduKIQuuVEmUGRBmtWa8/prA7QWai0nR5A
	rvscJ6qnEwgmaV4uOfsRguvcy5eDdTQnuGWJXXmZZ2jPcfk522OyklBvMPZlyJtD
	ji8rTQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka616ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 09:47:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-536540909e5so8278271cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 01:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612839; x=1794217639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=;
        b=S4ThyiBEFfAjuY68WREfOJV3RblxoQANX3grOmM2hAr0u1YhH8Cs6btTdggqtY5Kd2
         zg+u0S7cZYJHa73Gwii/jT28w+e1jIzRzxVeQXqs97NTc6gnCyKVcahSqRA/kWO8yaGA
         OuD1qBnQTJojAoe74FrmEchI17NS6DQLGp7dUgUHM6BiRMtMpf/xAKBYcwXNLPElQFwE
         1cEOp2Hf6Z72Dfp9nv727Lem4F3XKVsGIrveOsPxvK9y17pgaQY8JMXvENWVt23tv1uY
         feFxis7w553U/2qT9rUSgnvg48pPTbXc16UFhJSU0G2GvI9t9FImCYps2+QjqfsPxILL
         ukMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612839; x=1794217639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVHnQxrU7iotifddxQWwphpnn403VF4eD0r25uibKE8=;
        b=gjXWsagw6gtFsCngBu0GURi7MczfHauraQOO7jPOgiLQMwx6/HzCb5RwDj/pm8iQdu
         OGBoCJapswicN4Zzo0M/iNbKtW0jppGCLmjv6/zzgKajEtMo2O7AG7exgxq7d2vgHGil
         gZvIsDqKA+xwRWutqq1boegK+OMlkAdx5CULv6mjm03zPEjklhoi1QDMONk8iTwy4gh5
         WokOgVy+vAzgdxOxDbjYZbYiHJDTJ7Dvf+ltakWnQoKBElYnkjd/pbe5V/klf3XRW8Kr
         srIQzXUXL445hF6+Kmpt8uvSYRU+jNbotslLjOU+p5UQVVfveXAs1q5Zp31WbtMEUCsS
         GtHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzd6hBx4ddBlX4IJrMjUsU7zwXonN5xkyC/wo0kREgNoOT535zZK2s8z01yEejFjtKeiFfu/mWHr06iCy8@vger.kernel.org
X-Gm-Message-State: AFq9FYLUZmsjOfJXAroR+lSaK5Gij3RuDV5ku+ounG12fhsLoMmOjejv
	hucxIRxjIFfY87EKDnb6v2uXZkiTFeaFZqE4hMOeYt8DLA4nhxNEf7C88gqxDddKi31t8d+CjIW
	/cYJ55WpILtD4wSc42RKKpI6JLJAOu85qPGKNYUk1moeIRxPs/+cLY5Mzi44d7+2PE0On
X-Gm-Gg: AYBFou3cUHvR2OvrY55iWT4QMsfK1H2L7Cyv6iPn/Jixs8j3ihld2jigWAF+Swrmyr6
	C5y+qT3CLycsBgrBM30PoTw39HJZg7g+k98PWkzNV5Huzl95EwXWC3sNq6dAoZIBJAblpqc6+Q5
	aoSs7vJ1UqW/v7GrUZkkdU2CyXNVuKDgaet/DiRxTknVUQGMv7FfSBBN5dqt9XoDtaIRYWu+59Y
	3mrwonsyAmKofvnp9CH1FdtRvwCDkzwikCg5xmXgaWKRrse4NnR5rwLRCdfvcIhntxXQ8Ib7wX3
	NkDt7dTuiHH0Ys1x1Da1HNMDUGouJrcxc2URQlRBDO36JGQ+1MlakMtyXLDeskvq6rqdunmGcFM
	2Ss5VeiX2l4bLQsX78iCFEj3NfS4w73xuHyT0KB1B6Ej0OF+WkDRNb31vxaemFKWK7m9MHyA=
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707759685a.0.1793612839293;
        Mon, 02 Nov 2026 01:47:19 -0800 (PST)
X-Received: by 2002:a05:620a:85a:b0:936:2f59:dfe4 with SMTP id af79cd13be357-9442135f71cmr1707757985a.0.1793612838806;
        Mon, 02 Nov 2026 01:47:18 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9ee537sm2987089a12.10.2026.11.02.01.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 01:47:17 -0800 (PST)
Message-ID: <d7a919b1-3a41-415c-9deb-9a0dca8bfa46@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:47:14 +0100
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
Subject: Re: [PATCH 3/3] iommu/arm-smmu-qcom: Use identity default domains for
 MDP5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
 <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-3-a2a70580eebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bAJfdc00D6nVDl_HjVFbLEnGvhgnYxUx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX3AzmjRBzWv59
 FcXnWt84fTNzbJCFhTHKBZvRVxEyNHPeHKyWIh/13RZgWRW3uysEL0kO6UAcVA4PphiR08cZNnz
 KQH2s2xDfCOFgZSqbSYRxaR8CTXOqGo=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae85c28 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UxUOhlBcqau6VQlabQkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXzeDJYiPSSTml
 xqWee35Z4wkMcaY35RckQ+mGQ/HcqhTAh4Sh6Q2TWuqKrkfSLyxKNu/TwoTkgUT96tuo87SMJn/
 FcD+zu5YTIrhqR4pjqKT0dbSX7X60B/B7HlGAIcSVXM4yiifVQgklYa2v7Cpwsmhki3NbXFt8Xu
 KyOkqbFa6gKCkZPdUFUnCDbd1463z0mQh5i4SxtMAGB4jYAKj133c9hbGPMAP/xJ4Eynx8RymMp
 0bXwXp/VoqsCM4IlW8In9ES40dsYCh291hXE+9UwszPqxhoO4k/koTt3P32lAKOY0HFsuP38K+g
 DvC4RtziLNjN0dHv0WTKfZ4w8GiX3HN109a732GUV/35zhw3OJxdUemwmSxmElO1y9xOxEiofD5
 2ki4VYe7B+TGUemZPNqUgZczVJjVv5XVxU9HZpj8PcHcHHo9RB0tS/p5El5+Nek7YQkQ6rn0jVD
 aR6HrMkxHHBgmvVNWQw==
X-Proofpoint-GUID: bAJfdc00D6nVDl_HjVFbLEnGvhgnYxUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020038

On 10/30/26 11:04 PM, Dmitry Baryshkov wrote:
> drm/msm writes the addresses dma_map_sgtable() returns for the DRM
> device into its own page tables, so they have to be physical addresses,
> i.e. the device must not use iommu-dma. On MDP5 platforms the DRM
> device is the "qcom,mdp5" node, which is missing from the client list,
> and the msm8996 MMSS SMMUs have no qcom impl at all, so the device gets
> iommu-dma. On db820c the SoC then resets as soon as the GPU starts.
> 
> Add "qcom,mdp5" to the list, which also covers sdm630/660, and give
> msm8996 an impl with just def_domain_type, keeping the bypass emulation
> out of it.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
