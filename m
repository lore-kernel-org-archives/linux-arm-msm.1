Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1672943C07E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786975980; cv=none; b=iF3PH6zpExbO5YeGWesQvd1ZHZnhvU4WwvIOctpoKz48rbf/jKN3nO1nLUs+8LCaLRnaviI7DQpdJkaVOyrRb8ugiAd7N32OUyTjumdPFjewW94g3A+ZPWoKfspD2Uv+veqRMrkbdurxBlndujt49AtMxThdTwo1HukvCjxsCoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786975980; c=relaxed/simple;
	bh=Rf8qpxJky21106On0owNre7jLTC1WLcsDBEW+ADVIIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Clep/M8E9l/ep6xVS5mAf59XUW0Xy5qHjrTsPbwRZj1/yVYwnr5trWcfVEHojHPRfbyiIQ0dNl4sZ3G2q6NWTDpAi9KRJ/mKmZ1QoqmQ+zPXNbExNd3UQHImdDX907s8V+C8wdB24cD1Wgx9VWREgJVqQLG+Xy7dBbUp6ByqCC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYGyarDy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JAXpdYad; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYGyarDy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JAXpdYad"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5vgs2008459
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6EJqjf/ZpjAHqfRtSteItluHMK97of1aYhfzczi1y4=; b=DYGyarDypd/DVrKh
	JgtV8dWBq+DC62RIAJWVyE5ZX/xfrd2rAaXQE8UX7BQ9cuRATgNLnAmno3TIQ7nM
	VtUEoX05NgcbbHCh0Flky0ir+y6ZOd1jKMhpuyluR6TOXl3EO7tZU6LjOSVVtCp1
	xCob9W/Hl61UIeXox6tjaJvCxxA6GLaLUrqf1tJ7IoCTYTPf2Q4+lfKQZEz0CZHF
	5vdU4mZY/4LL4ZwevfNUm/F3be767vUW6sX6WeKS4JxvGBC77AfDX9s1i2J48Oer
	o4OPxM0ghRjWpYUkAPXZGSunpdxEjuzkcwjA81w6/M4FPFdnEZHN9XW01EbT4Cu5
	O3CDrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8h98j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 14:12:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930f80ae4f0so20611485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786975977; x=1787580777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6EJqjf/ZpjAHqfRtSteItluHMK97of1aYhfzczi1y4=;
        b=JAXpdYadPxRFP1kqOf/Ax/3AGiAhQqLt9pUm5H+g+ddjSy1gVRBsh3XQYHq9AHLEek
         gXp6fQVZ8R5gf5/gXU70Jwxv4NdfG/S8Fya5qWFVkTdITaaoK1Esdq9tK0XA04z/vx8l
         EKC4fBIc+A3RNuuBoZaDIXL3JEDMfkgduKZlPqp26N4emXtYVYIc6lcwsrUA2amQxILx
         xhB1jbzoL1kKOdIZyVsHwb2ke08u5ftOgf66Fc03DbjAe+Yx91xWme5ZEuVOTUBKVsMA
         brMLHa0HR/gdv9HvCDXI3mlAaDakTHzMRVQVtMrflQXeVrEsEJ6zuD4eI3fyFex5VtSK
         uBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975977; x=1787580777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6EJqjf/ZpjAHqfRtSteItluHMK97of1aYhfzczi1y4=;
        b=lR/HaAJrvHKGiAPUy+KHH21AJGZqRriMT0Y4lV90zpOLwTA31YrNGK1jFWAYBiQ1Zu
         62mvdVqVNMsxxPxqEd9dE8YOQ1cRuHNXCQxHq8/sUKy4pcDwDBu2gE+LwkAqEU27EgpW
         afD3f9Uu66gmu1pHubXtl4+c/HY27ITmqmkenewMxgyG/rg8MtuaHljskUMgWgXGptdy
         dDyleY+RnxwRrngiaZcyXFVmnSzMKQ1wCOCKvfCBq9WrekC0le8ENmassKyCFbdFn481
         Pj6fGeJnSKhoplpqzIr17XdHAPqGiRl/C7yWrhOYXOheuxH+VHbC4qE1IjYye7PtVrvx
         gWOw==
X-Gm-Message-State: AOJu0YwrthCNeCV4EZdYNLMer7GcLFBvsqTB05ToTav3LwHaVtVCEb6L
	6OR3fvvJ8m57mCd3BWvZny1MPx30Q8Dhk6gmkFQdEsIxny9zODBqRekQE4Vld35WXchBTDMAnK8
	jQNPGo5c+CMUObl6dsw7K1WsKwRg4/1uqASgug0tK/YA0eEvFCRe5FQ4Ox1tI6FFloZwC
X-Gm-Gg: AR+sD11K/2AmDB/lUMWE4gXZtUOixnU/RP7PM3OqYmrNUmUKc/gzIeMkqaNrUmOYNfm
	F9K/VpXXIHNZy/3uEnObNVvvceO5zOu4s3hM+T0J1uGtEc/YtHrhrEvv9OH7uEc5N1LS4hmelAQ
	ckRrOZVuOe2DayGflIX2f2nsOQCd+mTK/kk/klIjiRlAoUbUGOMiXs8ONiS/xvVXlzZIKI8sKjf
	ryMNF/Q6np/6K892SxtCJTDyfRIn8ZWg9m6spZEbS/VbNJDex/dq5lsQbe5bVRsELKOKum3RaVJ
	aGGcy8Wvd/JqtiR0GC0SWQ1sHFbHFwSeVff9DvSlB3z5pAOhUV1szps+y8ocOm1eMjP61MJlnOF
	wtpgdwA4di7lZjUSL2g2svDP+
X-Received: by 2002:a05:620a:454b:b0:936:5a34:7a6a with SMTP id af79cd13be357-936d237abbbmr1883534485a.3.1786975977194;
        Mon, 17 Aug 2026 07:12:57 -0700 (PDT)
X-Received: by 2002:a05:620a:454b:b0:936:5a34:7a6a with SMTP id af79cd13be357-936d237abbbmr1883523085a.3.1786975976586;
        Mon, 17 Aug 2026 07:12:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8596d4csm718864a12.22.2026.08.17.07.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 07:12:54 -0700 (PDT)
Message-ID: <53a32af5-daa8-4a11-86c9-10b1fbf01566@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:12:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kQ6qM45rOozyLOlRi692v0qak_5hyjUX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfXwXTcUt2lAxws
 /5zNBfMtM99CYu3vUdab4tTpktGWFjCBW4DRIj7iPqZTY7jt0JtOzVuGZBZkhi93fLlG/VbZ097
 ymMp/LcXFHe6JtHbl/JSd4ZsiTUUpjE=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a8316e9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=HZuXiAIfS_KyvvDLycUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: kQ6qM45rOozyLOlRi692v0qak_5hyjUX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwOSBTYWx0ZWRfX/1T5/qSXlmTT
 92NyVhkCPxT2sp8cWhDkSBnkFYVsDOUnpDjZX9MUUKvIbReLAxRAjAf/3PKOCZ6zpnf3s00myuU
 esVjzC5konsVSx+qXx7LGa/m81YNR6FO0fCwYkD0EH/w/oNpZJs/7ZpBdnLZEfC5Ddp/rkyPPIF
 KTCECiG18fj5A50S1BTTIjSsBfG3LauVuQ+XuAIR0Egu1/giL0xFRuJ5tWFLiOOMUmizVppGlQy
 lAhkk9gb+SgkgtPs+Qft7KOCjqSFlRBZu2E+n2eActyNO3I66Er79BKE54z0oailbiRze2KcuDY
 lFGg7PUPNK1uYPu/GINsRs6bdOyQEC8g09swO8w14B+ddVN8nwswWjf4hpBj5BvO7mpozgphL77
 wkPR7ROex/URTazHfVA1zRV8CGIO20Kv4mISIywoSvalmebmj+YyQRxunkg0vVOqjBcEUucbogZ
 bKKOcQNsiK3VetaLYyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170109

On 8/13/26 9:44 AM, Yongxing Mou wrote:
> 
> 
> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>> powers a subset of SSPP blocks.
>>
>> Can they operate independently? Does INT2_GDSC need to be
>> powered on after CORE_GDSC?
>>
> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should generally track the same state, except that INT2_GDSC may be powered down when SSPP1 (VIG2/VIG3/DMA5) is unused.
>    - CORE off, INT2 off
>     - CORE on,  INT2 off
>     - CORE on,  INT2 on
>> If so, perhaps changing the clock driver to make CORE a parent
>> of INT2 could be the simpler solution
>>
>> Konrad
> That would still need DT and binding changes -- DPU has to reference INT2_GDSC directly to gate it independently, so it can't be hidden in the clock driver. The two GDSCs have independent GDSCR registers with no HW-enforced sequencing, so they appear to be peers rather than parent/child.

No, if that was a reasonable change (which I don't know if it is), the
genpd core would take care of enabling the parent before the child, since
the genpds are intrinsically hierarchical

Konrad
