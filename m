Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72C84756BC
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 15:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361341; cv=none; b=M/LhFWu0cCxzLp/GAqOATtU59oUjtTqHDMLHOSOaWkLHgpBGcUWkaZo37AQpK0XzF2IV7I+Zoujo3pd6uGTwyTNmg/8K9+azRr83m6hnWnDUiuHSpRIMz0LjK5280UXO/HcwJn2XI8II7bmoliM06qgsAMYCCMbaFlVlYvsIlgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361341; c=relaxed/simple;
	bh=8ZSjNYTL8Ml6u8jCUwBjbxNKyQONvg0xPIbXWyCmk6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ay2702StaYE7sxbeYYkwDIRNZfkAlhxD7NzUS3Xeb3b8x2faJRSooYTZWhrgnXt/oWc6yGimIuyzhAaWay13sbwWtQzT3zJgwcegHQGNRRH2ImPrn2wG/zkdmvGlfMNE+/WnKmQQeVHIKOzU4PUYul13WI7/4W0/TZNhoF9Gsao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QqANDGqG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5ytJ/bn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqANDGqG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5ytJ/bn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CR9Wk1647747
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 15:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kt8GHJ5keyTKWhMxN2RQEwwtSHHHEF1wieLuKB/lRZw=; b=QqANDGqGpXjF+DYp
	IBRL6lfYikbQmTeC7c6WcGbbSL2wYiX9bvWlvwu084h1ED9ywp1Df3FbtmUTNCO/
	yaZnc7Gzy07aBxyeIzJY59Wg2P75plwEbwzEbodjkNxBWzS1z3Wxf4z+1k11ABV0
	u0lXx9kx+v/JmGSyJrduX4BrhuKweRfcZKnILKTBbyHVCtjD1kLV+tw37Ie6DXNH
	PImaCSZ1FaNxN3sdB4ubnLMxCRc+ib1capPrp1HI9iNsTzMVFmNCLEh+RcI//mqp
	dMglTA5ygllMR0MPjoDhtjgeVep0hlw2LmmQClTOxMK6OkxQx+7opzPBH0ZR7W8Q
	hO4AqQ==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv88ue1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 15:02:14 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e6b5741bbcso207401a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788361334; x=1788966134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kt8GHJ5keyTKWhMxN2RQEwwtSHHHEF1wieLuKB/lRZw=;
        b=i5ytJ/bnTUtQLBAn4ejjiY3aTnFDcynTvOvtRE1a545+Rqrb09IaYeqH6uSWpTVZ/M
         LtjlcJN/9oaXZsunZVURLK/SGkdTQ8VzfKc73aowYByvj3fUf2GsOAqzKNwOAYVeeoe4
         sB1riHN8QkdSfSxaK+BTF4jhjMZr7zTJt+Cygaw5XkIYCLykSFl8WRkEKv+pnUlkk7u/
         4ilssEQCiIQDPpsQlsOyGPcWQT1xRm/H83O71dQvqFvUYJRF/7FjnSQVcORsmnTYCueH
         ojCY7l/EYC1MjR9TfEnV/qoOvxfNwYDCIFqKNwA7AtF0ZPVV4EiPebwr5AKG+wR0FAya
         Z8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788361334; x=1788966134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kt8GHJ5keyTKWhMxN2RQEwwtSHHHEF1wieLuKB/lRZw=;
        b=sZvb3FxEZqACIv4G2EyZ2/PZvHk/fivT/gRIe2MwR1S7XzXUwaBod+3yoxwDW+7iVH
         cvtE1smxOn79ayZjDT3vYYPWpA/UDeBdrqLW8lFFFbV+61wYHLuM1HipjuI+j50KSfLd
         W2/Ee7JzSl69Pb47VjrWu5LrZCtHf83SV57bZfNhkRHvC+CUOlycE1nFMamQD90OzTr+
         c77w7qB5RA5ULDthJWscDckU6nmuRk2USsLi5sRKBXgdPYRpNLJjfJHdWLxQoOQuSh0K
         fTqjmeht4flrkJ1/7+RFeOaIil0BtoqQXKYlmll2UfNdRo99G+PCykcRcMO2mI8qYmIp
         s2DQ==
X-Forwarded-Encrypted: i=1; AHgh+RomkV3fG8epdglnuFxASfQdSP13FVSzAYmF1YNcy5Xrgb+U7FwqvfpOIP+YNb2Xc9U1CeHkl6iUD3yEIQfx@vger.kernel.org
X-Gm-Message-State: AFuF++kYdR0pg/5dKQryDFCCW7Pykjyq2FITAWTjt5vne1M2n9T0duvz
	Agc90ervtWiaB9K/uKH9cvHzNYdtCGe5+KhGVvxcdEKF5R05dI2prPNJZKeNm/WkgP/Wnh0svjf
	KPddb2xrtHmJ8vLyOPicMGwfEc1Zl3lm0nLnZb1CxDLquf9D1YbDH6ZR9jdvePFfX2hqe
X-Gm-Gg: AR+sD13scGXPWyXrqcwcmaKxv9S7EIC9hBibmpTQmQKWQVjHvAUnc3Gkp8iUlUZLhgl
	H0gugH3fNtmbAkNU4hYzfWsr1drzC/jChTiytdJpCHk3nmI/SqxxyMbzAfXIn2QNJFkyqlyKgEG
	HOI2qkX+4K1TLxXCFocKth6ACZla+KaZnVMe4Df41TvcpsID0pPf/7Uyfc46w0IOvwQ3qZP9AEe
	iF94V3gWBFcOYiuUqH9TAaY9LtOcMu4X9Gueh26ll3t9yMBN2EEofsxupu5Fx223e/dmuAYyYUt
	e6j421ea2ZJbvgm2x4Du8dlLsDN9vvzL7wFXcuMbtbyQNWYtZelvGiS/OobuSh++Ovoi2gJzZ2s
	4AzD8p/EmKUhifniNuQbFsw==
X-Received: by 2002:a05:6830:6d16:b0:7e6:6ced:992f with SMTP id 46e09a7af769-7f781694bfamr2826309a34.2.1788361333579;
        Wed, 02 Sep 2026 08:02:13 -0700 (PDT)
X-Received: by 2002:a05:6830:6d16:b0:7e6:6ced:992f with SMTP id 46e09a7af769-7f781694bfamr2826234a34.2.1788361332925;
        Wed, 02 Sep 2026 08:02:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f835955sm1260039a12.0.2026.09.02.08.02.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:02:12 -0700 (PDT)
Message-ID: <a2f3de2b-90f6-427d-9994-a8b1ec8cbed6@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:02:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] power: supply: qcom_battmgr: expose CHARGE_NOW on
 SM8350-class firmware
To: Jan-Michael Brummer <jan.brummer@tabos.org>, sre@kernel.org
Cc: andersson@kernel.org, neil.armstrong@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260829054546.86210-1-jan.brummer@tabos.org>
 <20260829054546.86210-3-jan.brummer@tabos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829054546.86210-3-jan.brummer@tabos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dnut1SOhtOiOCrNLB1QzEtGvzMgJ3JxX
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a983a76 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DYa_1O34AAAA:8 a=qAZn5fJD0YA4aXmIaTwA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22 a=piCpHeHFVjWJlYWd443B:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzMyBTYWx0ZWRfX2mo8jn2voieU
 qSzEBUp/oTiV0zjTbCBOM1JX24XEOB/yrirbh9mWPxrI9Tskjd7XPAZgXDp+XWmpNmvbUA2/l8n
 dEz3KUo+3fNz/PJWaF87GdaXSL5Z1AR01JasJup6X7wLBFgdNiarXMJruqf8P4R5Ta/ofZv9ZfE
 UCJk5R7NpPKqvmd1nMEFtZDfqaKfNNfzve2Wq4hCGU990llEw30D4Ly8jJEaruai37srWbiiAjC
 EW972VvoDAua9t5J6Pb48Dc+4vryno3gNGhpNAp9lhuNPpJYVIMZEkIbqQUv7DksnEbjBejSXcU
 WQSh2H6p74TR5FqABgJR6aa/i0DgWh1mvs8TSg0LyjRVbD88ZuSEYrbACqmMaT41qcmrWrPs0oN
 ES05KRDf8utBD/eLqpqhvwKVRD6fmGLUc2ZcOwRk5nAhTpVr9QVQZwr2D7JocMtWxeyY8Yj/Tff
 6WtWLLg2SJxj8l1jpCQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzMyBTYWx0ZWRfXyJrvH0HxdfVq
 isASAUJ5x+5SuIdeBQGVql/2JtnTLiz2/YsYEOP4Ys2qfokQ2fD7GBZlBD6JM5gpiiH1+KQJOwq
 VVddknWMZyex0oKpfnDTT5ikngEh780=
X-Proofpoint-ORIG-GUID: Dnut1SOhtOiOCrNLB1QzEtGvzMgJ3JxX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020133

On 8/29/26 7:45 AM, Jan-Michael Brummer wrote:
> The SM8350-class firmware does not implement a dedicated 'charge now'
> property. It does however report BATT_CHG_COUNTER, and on this class of
> firmware that value is the remaining charge in uAh rather than a
> monotonic counter. Measured on a Fairphone 5 with charge_full at
> 4116000 uAh:
> 
>   BATT_CHG_COUNTER   reported capacity   counter / charge_full
>   2434614            59%                 59.1%
>   3525354            85%                 85.6%
> 
> Map POWER_SUPPLY_PROP_CHARGE_NOW onto the same firmware property and
> store the value in status.capacity, which the CHARGE_NOW/ENERGY_NOW case
> of qcom_battmgr_bat_get_property() already reads.
> 
> Together with the preceding patch this gives userspace both the full
> charge and the current charge. UPower now derives an energy level and
> runtime estimates in both directions:
> 
>     state:               discharging      state:               charging
>     energy:              14.4347 Wh       energy:              15.6003 Wh
>     energy-full:         16.8807 Wh       energy-full:         18.1505 Wh
>     energy-rate:         3.39313 W        energy-rate:         7.3492 W
>     time to empty:       4.3 hours        time to full:        20.8 minutes
> 
> Signed-off-by: Jan-Michael Brummer <jan.brummer@tabos.org>
> ---

Ok this makes more sense now. We should still gate the other property though.

[...]

> @@ -1442,7 +1445,10 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
>  			battmgr->info.technology = le32_to_cpu(resp->intval.value);
>  			break;
>  		case BATT_CHG_COUNTER:
> -			battmgr->info.charge_count = le32_to_cpu(resp->intval.value);
> +			val = le32_to_cpu(resp->intval.value);
> +			battmgr->info.charge_count = val;
> +			/* the firmware reports the remaining charge here */
> +			battmgr->status.capacity = val;

Let me try and find whether we can rely on this - on newer targets
many properties are more or less just front-ends for vendor
plumbing (because there's a ton of different chargers etc.)

Konrad
