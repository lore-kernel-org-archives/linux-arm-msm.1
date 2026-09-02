Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D514A2A7F
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 14:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359760; cv=none; b=o2xNZlY1j6ZcbmJfED+nlR/bkahVDFPhyLJjHnoHewaWZqAAqeCEFmInoAUWbbBkjkuAmh2SivPGjvgAYpLW8EMygp193SHeCoixLHnLoxnScc5yiOGhwWooK6YmmIorsEHTx5ZXnJRsuWx2sBPeS7KCs94lVqGWOAdyXqgdYHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359760; c=relaxed/simple;
	bh=99Ch+3LYFJ9N7TSsuHX98/Uy8K9XP6/jMla2yvTy2pQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FfsdIMcvCKnnRxI84Jlvn/rMdeBBFoLfY4ZTF8YxIGtTevS6tRYJ/a6VUypJOx04ySZSLPdoQSRwxLHbri933OPXO22R/i4m19x1hBs576grUhMDwsCYTSr/Ut1z7+rbo/tIOnNbtzudv8rXH7PvpBlrgsRbTh6yvnyC8M79bao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RtZDvrbU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQ/wXtjn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RtZDvrbU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQ/wXtjn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR7SR1549918
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 14:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yyLhoiY022AQ3A7dmKbaF46+l4kfEuJhlZPs9i/eMFc=; b=RtZDvrbU3o+ONCHj
	MZVRtG39PdHqIzVvQhmGgPTm1uAjU3lDDumsAkY8CrLMc5FUg8yw1XFfVNbY8xKF
	NlRokiijjifPaIj5MReq0aTURNweJZpykPyoMReodH8YX7czofD51MzkQQ4+sNv7
	QVC51UA0pUn94mG5T/F6YBlnVShxtNKoFUICPtO1GNPQEqe0OgPpi/wUCO5iU6bh
	+UlXXZ5lQyQZlYwhCN+qDE2nImvb8CNt53wNRrVUHc2hXxH0I7wyAM05AouaXhro
	F38CR0pbXIT5HXYHRPQpNW3wz39COje4JhQcbR/MjVm8OVKd3QAQc/NZZCQw+cw2
	Kr1NiQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c8xcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 14:35:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c39b4f3229so52289e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 07:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788359757; x=1788964557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyLhoiY022AQ3A7dmKbaF46+l4kfEuJhlZPs9i/eMFc=;
        b=GQ/wXtjn9AAfSeGj58d8uxMtxM3mSx0ziLne7gaY3aF8ntGtdVfTrCU9mZ6L6H79fN
         5BKMb/5oqmrh/pMerZxRtN2I2YV/XGQqpaSvBxScwH04gGrvCbfVaEdhbJsVx5N0Z+bu
         ZK9rzVTAqCDkiBk9HoJrGngNAZukarI4da5L/SvyBZUqPxHYCLrMO67VK2IJQUrJ37NW
         Wm7/FeQNG8jWncTXcR2qez27GjFhYETjpgEc2eQ+shsFqeB8T9Z/rlEY+4km5WQ13uiJ
         +UYjPhi4WeD8br8kUck2Ot4qctUhMQBO/RX02rkIvmG73Mw48eWYoVSHNdeYwRu8flXr
         bjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359757; x=1788964557;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyLhoiY022AQ3A7dmKbaF46+l4kfEuJhlZPs9i/eMFc=;
        b=qWXCiO7xtb8wb9rVceqtw/5I3NPK9/ljL0YNuuPkbMpfwOO49NjYxU+7rR5YqBM40H
         h1tlS9tR9rr51UyCdGjnJRx8fcYV27A8qcuYLQbskxqPTC64sf+l7Lz62pGDZn+ZoZAv
         SWXzFbq/X2hn15v/Ae4MP6qbJCtZYaDVGhiMk3UZ1SHSh1d1FeI/EPSBfWH+WEQXAX2N
         gji4Nlh2U4SrDY5vmnEvFP0Rv7MvVnUeahulx0ocyGZMHSz/d3T4mugmWn7HGRfYTbkM
         jD/fcM7iJGiCEERAdNxqdbJndCBBffNag2wVXJdf1htrkuR1QSwY3sGL1i8mfLCuUvpT
         EqxQ==
X-Forwarded-Encrypted: i=1; AKwUvBycLYyOgeJGlGARXyb+XlwbMKmse4NHaHPsjxviQTVbMPgMCr24UqfsPAKWnkL3ITG2Q52WGkIqo9xbdAol@vger.kernel.org
X-Gm-Message-State: AFuF++nQuwnCezwzxBMaONBCx0RUM+mqVo/keI9LdvuITCcZV+imZrK6
	p7FDwd0Ht5lFvj3DlNQOO4Y/E82BtJVwDgZ176WiUoC3gMDKa1aODqGKu/h4n5royzvkC8Ck7fK
	u0YdH7+FKbXwOfHD3fA0F2QdZMEsy0/L4hXQnL+cpodN/5t6QFPXu1GHfpiQ6Vgcx3SJY
X-Gm-Gg: AYBFou1FavicB535LhqrBW7IKPl0PsKnYwgfVotBeEfSSNU4C1GcRZcxOcujxiqQ696
	yPSdyuJI4j5tfmZuJ5uUYbMuNmmXR2KIvTgDkifpNHacyc56s5dziYZnok4iog8O9AuqQahJIgX
	+JheJqHdYIX+bW//Z/gCoFmha8V87fJwV+iUAPWBV7nN4O8XhnEggBec+Y/hg2pty8DSj7xZkBw
	8mi7BhAv3ilHN856CIMzBwCOAANk6PqCeFmmysJwsuOpYDmaKb5GnEJD5PDWmsNrpeXV1vUpQmv
	6elSxkckig/iNymrxbjfq954Axjlxn65Lfb4Kdx6eOBgs/6NsnjI081AGX/bzXAKxbKhjEZVKqw
	hv/3ZXrXol70f4VzizdJTAg==
X-Received: by 2002:a05:6102:6884:b0:786:8d84:5aca with SMTP id ada2fe7eead31-78a1f339246mr824454137.2.1788359757506;
        Wed, 02 Sep 2026 07:35:57 -0700 (PDT)
X-Received: by 2002:a05:6102:6884:b0:786:8d84:5aca with SMTP id ada2fe7eead31-78a1f339246mr824434137.2.1788359756585;
        Wed, 02 Sep 2026 07:35:56 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b22ab3sm635362e87.30.2026.09.02.07.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 07:35:55 -0700 (PDT)
Message-ID: <838a68e1-c12d-4f1d-ad89-24b799f02a5e@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 16:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] power: supply: qcom_battmgr: fix CHARGE_FULL* on
 SM8350-class firmware
To: Jan-Michael Brummer <jan.brummer@tabos.org>, sre@kernel.org
Cc: andersson@kernel.org, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260829054546.86210-1-jan.brummer@tabos.org>
 <20260829054546.86210-2-jan.brummer@tabos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829054546.86210-2-jan.brummer@tabos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyOCBTYWx0ZWRfX54wBvHMooiGs
 9tOzIRhKoap1Qit38Tp8bDl+CTS79kXdAD0WSUSKuzRxGT7gJe8juD/myrhMfyU0LM1mUgOUbrB
 tLdZb09swlQsAzJorXhJAu8PvW/RplU=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a98344e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=DYa_1O34AAAA:8 a=C9CdgfQ6oJW3jvxbsIcA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=piCpHeHFVjWJlYWd443B:22
X-Proofpoint-GUID: bQaspj-rdwFRsnIEdWLy8nw9-B-RC8cw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyOCBTYWx0ZWRfXzuquxwbZRlvd
 v+CvaDjpHyklB5yolvA4V2UeesHVlPI+tplEJzFJbnIyGHAXL++5kVReJqnS+28UcdwuwWdb7Wl
 nKucM9L3z0JhUKhrGhwbSFl/fnspf/7CrzYgVurpesyxJ0FR92vjgEbZ6TN9T2QHPC6KTawm4lN
 fVyK3EtTgd2JletjxTUyu/ObKvh+6mcmjwASSxzskk8HJJjwkEd5o694nGf6bJzl0QB2UdtVQLV
 p6aqfeo7mPF0RfKOWk90Dnke3qE1IimhyYjmKteptBNRKftB+nhEP+xXf2ue6nDnsw1Ihc2QrkD
 fLHRrSdjGwF00kztueQT0ACAtMmkN0oLn746cQUzM2djbTXYw1VXeBzSLY0ZJEiwG+XiyCQ3sKe
 A7sHPZ6gaL2PjcssbwELHAwailntVHUfIC4ChmYiNKAEJoC7+fBEX3CNBaYK37Uc3kHHSq0r1tJ
 BWCXp20Hj3exo/PNGHQ==
X-Proofpoint-ORIG-GUID: bQaspj-rdwFRsnIEdWLy8nw9-B-RC8cw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020128

On 8/29/26 7:45 AM, Jan-Michael Brummer wrote:
> battmgr->unit is only ever assigned in the BATTMGR_BAT_INFO handler of
> the SC8280XP callback. The SM8350-class firmware does not implement that
> request - every property is fetched individually via
> BATTMGR_BAT_PROPERTY_GET - so unit keeps its zero-initialised value,
> QCOM_BATTMGR_UNIT_mWh.
> 
> POWER_SUPPLY_PROP_CHARGE_FULL and POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN
> are guarded by 'if (unit != QCOM_BATTMGR_UNIT_mAh) return -ENODATA;',
> hence both properties always fail on these platforms, even though the
> values are requested from the firmware and stored in
> info.last_full_capacity and info.design_capacity on every access:
> 
>   $ cat /sys/class/power_supply/qcom-battmgr-bat/charge_full
>   cat: read error: No data available
> 
> Without a full charge value userspace cannot derive an absolute energy
> level, so UPower reports a zero energy level and never computes a
> time-to-empty/time-to-full estimate:
> 
>     energy:              0 Wh
>     energy-full:         0 Wh
>     energy-rate:         12.4713 W
>     percentage:          59%
> 
> The firmware of this class reports charge domain values, so set the unit
> statically when registering the SM8350/SM8550 power supplies. With this
> patch the properties read back consistently on a Fairphone 5:
> 
>   charge_full         4116000
>   charge_full_design  4260000
>   capacity            85
> 
> Fixes: 29e8142b5623 ("power: supply: Introduce Qualcomm PMIC GLINK power supply")
> Signed-off-by: Jan-Michael Brummer <jan.brummer@tabos.org>
> ---

This also implicitly unlocks reporting

POWER_SUPPLY_PROP_CHARGE_EMPTY
POWER_SUPPLY_PROP_CHARGE_NOW

which are not populated and will always report 0.

We should probably further limit that.

Konrad
