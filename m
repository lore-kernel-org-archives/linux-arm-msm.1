Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6576E38F945
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730552; cv=none; b=PYKuEzX50DxFtuhMALKKrY086U5Z/TaUjkRknBTFAgn6yGyksL4264MTemu3m3JZKAt3QM1OMESCjqIB9QwrArzIzqRgFyeIRk1i2RHcfkK5SDtWWFEjFiRHVLfKUrXncHjQSYx01EkrEkSx9mwaDEP93xnjB3KTV1LUHhIJx4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730552; c=relaxed/simple;
	bh=Z7A/HhSYZQDyVp9Lr1bXfvW1LxAa3LrNWha1kXC1itY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dZAwL5xg3pzknHMw59Jo8/JHNcSDcggEVd6bdS63efbj0SCVmBedbus7pKeG/Cfcl2pkgAJD6HgB8l0cMD/3gZvtpL/nHSNRh1T+eragaXmEInrLTGuvgcrIF9B/eGyYRahjE860mboKawYS+2o0xjTfAqjS9HVe1DeuslfHvsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQRCnF7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fxONMTaQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQRCnF7d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fxONMTaQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S6hb4097202
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+ow9xkAE9f8Iw4EUWsQR6aXbP6OXWNdIHYU2Fe8tkM=; b=BQRCnF7dQIkrA2WH
	LEjmgO1Nw6Wmkpx21GAAHSgmyv7T7PeYd3nUMgfHC3e2iwOSRkdSyBrP7DhfNJsI
	7aTR93uEPWt0FH4wJyz3BI/936gsf4Dd2WnyvL9sI/mpqQefei+GubIi5GzT52kr
	yGH+clTh9eqh1K7M/wut0AsVwdYzrFQFp7MARyWNLlYprGnH8hOaamJXN80hvv9e
	k4eBVa1uQGNfthU3hF2UnhHE1vCyd512caoOJSAU7YOWj5c088CM+7naewrJOpHL
	Zy+pBdCZh4aFQkGstfWSJ+klqyIiyx7PAWzd/MZ80pf6ZuCUxgnYPh++oHe+hmOZ
	4LmcgQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fcetswk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:49:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84857446424so1316846b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730549; x=1788335349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k+ow9xkAE9f8Iw4EUWsQR6aXbP6OXWNdIHYU2Fe8tkM=;
        b=fxONMTaQxuO1gfbXqTVg+7Akbd7737JkvC8cqwBQPQR2Z3XjUcEfWGbFqQmcg3ZKYJ
         XS/2Swmk8T5TWjtSXqT2cSeCcad/8941z/U8mB54OwsOfATXWwzS4uXa+UA2ysFFhaRW
         s6/GwEJFLEsl6BG3zkanCtrxWUCQWfGzMaPGfTzFvfFRODawDUV+QZOwSoVWL6O112wv
         0wYe4FhBXnlLaSx8cc1jPvIlM6bncilW83VWxssQofwGiJ0kdhu26BABp+5ma/r5dAgO
         fTyzrKeharQ6/bNkOrwnl9H0bwgDDDzkVlQ8+YOhNHavxTqtMJONZORylxl5DuOtH2GZ
         CACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730549; x=1788335349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k+ow9xkAE9f8Iw4EUWsQR6aXbP6OXWNdIHYU2Fe8tkM=;
        b=mOFcZikjhiLfuO5wiYAs/W15uZicDrloRQwJ7nEqcMis1m1v93iGDJyjwG1J7OrvK/
         GRHDapeoggwSuxFKErEy/dLAT/9tGnlIYaUtj0lMqfc3YBKEf0yt7hk+Owcqc3pSa4yF
         hVsP8fyHoHzSuG4bGTE6JcACXSTT1dmdFvCpyyxnDycLqMJKrMoqBAOd8LjVzfw1S+OU
         v/gxzVj5W6lIfR7aGXZ1qgDHfiw4Gj9fuE8fX4zuhnoRLr2wFWzAiRyKGBHhMVaJEaPO
         9l47/SfGIWn8gBJ2tpZEzcGgSMaj1fx5OsHdNC0ND6RgESpLR9jLnpyGe/DQeLtHdUrR
         tQaw==
X-Forwarded-Encrypted: i=1; AHgh+Rp7CP4q+PXyTapCT4OP7brRNiz6kZbog3oxYkvbRvhaJRIuDCxfD8EoR4vrHeRGatO1t3P2aTTCIAV03fSp@vger.kernel.org
X-Gm-Message-State: AFuF++kVdRx5A0KWAwzRrpXwIbWC/23iI0BajXqHDG/OH0hwv0uou70I
	kJhoGCnqmWGljIItcG0okuZcn8N5btp+FDII0FcHezn8hwgH0ynBC6TwGoepkbl2h8oM86Htk06
	bxkQzJCz7cPsCsDt0Sl+Bwu9u2iYXO8Ge8NjZsO1NKqBWnyzRd+vr3h6RLnFwYju9BcHc
X-Gm-Gg: AR+sD10U8PwTtNjZMFR0/NiRox16egbnaOtJyzYoDTtL+P3RYpH/qWJUOh5Q/hiUxbt
	NdileLJGAkNfDg954iYVIMcxhpd6KLLBTN+unWdZ9TLtoLMPH/J7kcQ7r3i74VdDREJywRbxY5e
	kY0qwTSI8EbQwbxR/bki6Ayia1zh4IdcoZBOAenjle176joLA13/BJGOhYCkQfTSwdVrDt2clua
	lVzSVpxkLJH/VJFl+JUVnRV6YaRyuLqtPZdSDvB1WnlR3/+25AzBe+szY4EqTgqHi5rLnAjFX/C
	X5fIX3NdnjW3ybx12qXQvxUtV9hN6t0vEhdzgqogp7SOG4AgC2wv3EtodzYqprGU5pWaFw6f1nb
	Z3JhHOmx9V3wBVsP0aR/vYCHsEgRKEvU6/AGGazrCZ/fqGOBGnbK1059ULDRErCSJX6tPzTYC
X-Received: by 2002:a05:6a00:390c:b0:84e:b7ed:7d50 with SMTP id d2e1a72fcca58-853755c3b2dmr8288511b3a.16.1787730549102;
        Wed, 26 Aug 2026 00:49:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:390c:b0:84e:b7ed:7d50 with SMTP id d2e1a72fcca58-853755c3b2dmr8288408b3a.16.1787730548632;
        Wed, 26 Aug 2026 00:49:08 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8535cd8a41esm588474b3a.29.2026.08.26.00.49.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:49:08 -0700 (PDT)
Message-ID: <4958551f-c65c-43ca-8cfb-c76fbfca5f2c@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:49:02 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 14/25] drm/msm/dp: Mark the SST bridge
 disconnected when mst is active
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-14-2ed6aee1867a@oss.qualcomm.com>
 <g2irqebm46aiuyp344wg3zjdzn2qn7q74bvppcgmveaoj2ndtn@mng6dqinykmm>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <g2irqebm46aiuyp344wg3zjdzn2qn7q74bvppcgmveaoj2ndtn@mng6dqinykmm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8e9a76 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pmlfr3f6Yr8kXvQmqdUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfXxCPD2EMSAkMn
 8zoXbxjxFmd7J0DNyzCDhzluGmM8RTB6kjdGTlfLyhAs+PzpQoYDfkwmpmTE6yhriVA7E06AXJ3
 IkfwdFcUhGD3o2in50FSGme7F6AwQ3c=
X-Proofpoint-ORIG-GUID: d3t4JFXfWLGbnY0QJkx47wCSqdj819d_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX6yj/4mUsm0pF
 Epywvn074Wwx1Hl2H/YdrgmILqMbpGv+qaxerAJSaAqq3P/M7R6BcM5Myb4DGzIMilCqM+mDIku
 YFZt+7vSLLuy6Nalp7rHKXgkhLd4rWUrO+BBeX4poYcehzKkuIQJSBUFxJiruuByBkjMzbEOMvw
 Es5UIgGtxTFD1NOsWNwlXDFkrvg2Ru9KkQ/o9BZvP9wegJV19ZB1swxr7xSdNgg8/LLos7At8rH
 XaZ+xrUBi7U13p2q7olqaePHcdr7RhjOfqbL7upJ9L7vRsowOmGXZgL2hjFUh3EzhXZUqnP85JB
 69rTatMSnLUIBf/s3ZtktCafPO3QYuifjpJyaRaejGPYhrRU0gRgg7RpWT4w1ax5KeVK4mQ8w+q
 nURRi2Hbie0F2yR2RJyXT07S6GCnD0XnLsyxxoRAOhzduwSwGm0OJGGnmjHXkjQ042mcIIu0ycp
 ceRlzZFLEvn9fAlNKcA==
X-Proofpoint-GUID: d3t4JFXfWLGbnY0QJkx47wCSqdj819d_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 7/13/2026 5:00 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:35PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> The bridge detect function is only applicable for SST. In MST mode,
>> connector detection is handled by MST bridges. Skips detection for the
>> SST bridge when MST is active.
> 
> Please mention that it matches the state of other platforms.
> 
Got it.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index d0081ea9f5cd..5786e598a406 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -910,6 +910,9 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
>>   
>>   	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>>   
>> +	if (dp->mst_active)
>> +		return status;
>> +
>>   	guard(mutex)(&priv->plugged_lock);
>>   	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
>>   	if (ret) {
>> @@ -955,6 +958,10 @@ enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
>>   			status = connector_status_disconnected;
>>   	}
>>   
>> +	/* skip for MST */
>> +	if (priv->max_stream > 1 && drm_dp_read_mst_cap(priv->aux, dpcd))
>> +		status = connector_status_disconnected;
> 
> Hmm, should it only be marked as disconnected after we switch to the MST
> mode? When is the switch happening?
> 
This condition is intended to handle the DP boot-up case, where detect() 
runs before notify(), meaning mst_active is still false when we reach 
this point. In the normal plug/unplug flow, notify() runs first.

I think this should be split into two patches. Adding this check only 
makes sense once MST is actually functional; otherwise, it risks 
breaking SST.
>> +
>>   end:
>>   	/*
>>   	 * If we detected the DPRX, leave the controller on so that it doesn't
>>
>> -- 
>> 2.43.0
>>
> 

