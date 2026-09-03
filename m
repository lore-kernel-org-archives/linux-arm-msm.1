Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE04A5EC0
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440277; cv=none; b=OfNkxHmNZCnw+qCKwg+os3W7B0MrpAmzkvba7YbrNN/nOZselA7ZzE4BFgqHFPC7KHy0zbekHRA5p00AaaOdaCfxvgPlUSq7bNmMKGbgyP9SdFhJaIKB759LeA1MixBqhLxEcEk2IwFfHl8gHQM6yS8MZVWW3ZZs7YghFtK2qiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440277; c=relaxed/simple;
	bh=iqfZxZGgydeO0s/QsW4fg0VSdH+SWdwmNCrt0n9J3/w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VlskBJ2hO1khIWEK1EFz5m3TlRSBXh2bnDJ3tyXzIQwzILqrJEAatfr+gPtnjX4UcYcnMbPOfskXkwjaR3EJuS02lARGwzHc3SDo2e5kVB72PE4qB8yw+rvyeKXpzt7IajM161KTsO3bftCLWdk7Q9pixYOrMTStX5jTHXukhTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NkOAFKZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0Je3F++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NkOAFKZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0Je3F++"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AH5rq3720249
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 12:57:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwtjBaZlwvf90l0KsuppypuDhX9EJ6Cw6utM7JsqnMI=; b=NkOAFKZ7LhfpbiDw
	T3C6WSiykerqrk/l/zDgZiNRbJZ+2fxqUcXUW9USUTO7BMmsNcBTaKZOzXphFXpJ
	xthpyfZrnDLhsBVwtCyNmex9WZLIf3s7qoEV6Vvdb+2gpD1Yo0ITKIFrmdSBG9EH
	T12lnqqiRiz8yiZefVCg16BEO9w80kR1M+6PrHZLGUT1hXqK2bDIRnGmw5HzDDwX
	KO4vz+Clg2a8vpDwwvZuNQ239+DgFCkE5jXyMDkLmBWIIy+mBsaCDNRud8hafPkK
	+uwFwKl+Xa3XgGiCj/wTkVCE9vpkdbZksSuR9+/20xCouYLu9iKiLqOiEO2rsFQJ
	HETYQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjt6a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 12:57:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930bd2bfc45so64921885a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 05:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440274; x=1789045074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HwtjBaZlwvf90l0KsuppypuDhX9EJ6Cw6utM7JsqnMI=;
        b=L0Je3F++2uoLKjGRwdYh7ZgoOsdbPpCHn/SVv/2lUGUxD8VNkphZeM0UMtsXpYDGAX
         6n40gG+QevbVFrFPIQStwpTpzGv9LuhV3QxESA+QZalEIWkrkw9J1pRDS01bS8iT8u7d
         TfyGCK/k1AoSXonrkfHT7lLeykLH3Ve588FjQM/8Cb6ilbWMOanv3wkL/V8VBCc2TRGQ
         kxs13Fk08LjAeeuwfn4Lgnei8VTjfEf4CW+OfV/Dz132Y/kWUmMb3CxhIxqSzezf+FgD
         YgwIteNgaunCdmiXif7g8gXoyLptV3Jo7UX0veIkF24NF2vPfV2a6hZySU3c4/57wU/k
         2GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440274; x=1789045074;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwtjBaZlwvf90l0KsuppypuDhX9EJ6Cw6utM7JsqnMI=;
        b=rAZvjhEeUqDitDqi7yg9GjmowSgae2CW1uyOBMMxAsgJ1dhcu13GmGA/H1QMdlBhwB
         WPke29sIEjDTS18bM8xhvPi96u82VEHm9phhMHVnlDMdqWADG/VzU3MODkYMAWnhZx8Y
         mBPGkYMGOxQOg8TOPz4oqtZKgAUmF2T70EzIQx+EWQkcqk+18c51inmmyor8ipK7jlt1
         8Nq86MuaJe6CggI+U9eMnH9aTVMK30zWugd1aSap02FoX2b/hrPAROx1LycG7W/h+rVw
         y7WItYzOL4aNRbcZYJxnkOfUnB3DWW2eVB4XfbRbk18lWj7mGft1l5qjVrrl28O6JS4M
         Zwlw==
X-Gm-Message-State: AFuF++kYAu1ImG/eQBOr6RvSlYsVLYzcJ9lBKmmz52gl3QVF4kXSJ+wn
	mTAZsrBNGeqV/i2e7EHWa09nFPSH8LIy+F+aUesM+CzCikjoduCnQJlyLbiBUpEwVPvUc4JgRcH
	L9W6AA1ypylLGchb4Cc1gqdWg6pNwIlsY3iLiSOYK1xFngy+EOF8zROQpbzeEjgTrR8rA
X-Gm-Gg: AYBFou0WPT6sQGfn9/0j0qopbwPOy50FJxynltRR+d6ZT+VGOzl7sLbhCv/+oa0PSII
	QbXJk/eBju7/2tWDFdOyt7ZGXa8J5tidBG4PvFRY7OIRjF7cWwJhHSGox08zDI10w52dgqeJ0YS
	yqwdzhUD5si1zsbxmmp9yM7pmviszBIfruQaM6LEXIuiyOFJdntC+MzvxkVW3Y5+Z/I9rdUswXe
	oNlx+6qbHRgLiwKWpcBW5lqGOaEZy2E4fZL6cEJfq5G2HLA9PaWOzr90P/9SMoVop7AO4Z7TUuc
	UGc9oOabW6aOm0bhvtRQXmJiO3xUlC/jE9zVAKoe1ikUqBQhf1/J+sL952mBO5aU/avnc4/M9js
	ZtFmDNJbncMPhC1C+Hl79+A==
X-Received: by 2002:a05:620a:489c:b0:939:6c63:a7da with SMTP id af79cd13be357-9396c63c202mr592624785a.0.1788440273629;
        Thu, 03 Sep 2026 05:57:53 -0700 (PDT)
X-Received: by 2002:a05:620a:489c:b0:939:6c63:a7da with SMTP id af79cd13be357-9396c63c202mr592620085a.0.1788440273117;
        Thu, 03 Sep 2026 05:57:53 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172091sm94908266b.12.2026.09.03.05.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:57:52 -0700 (PDT)
Message-ID: <2fc08924-2ddd-4f89-b962-5218c31857f4@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 14:57:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dsi: round the byte clock rate after reparenting
 to the PHY PLL
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kavan Smith <kavansmith82@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com>
 <a3c60bf1-ef2d-4a6e-b237-1a51bee2dcea@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a3c60bf1-ef2d-4a6e-b237-1a51bee2dcea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXx2eFHupvygbJ
 tqSPsuEN2DSykmSZ42QQwbNQ0D0Rw6m4pYRLbx7dBzfQ25b+zxOeercOoydREuzYvn1N5bIP9FU
 oAOwts+T/wMSWBnd6aqPEXrS/huhUdnJ89eIymbcQIsf+XhiD7/KYwic5tuUZozXxSjuMpufGeM
 EeJ/jsZdGmEwBkcFsxe4i/gpIGa2/plt12FIERLZtbHzXROmIzvjmDGmhkmxbQugBw2NhDhB4xP
 aCMlpvKP4vpVZ0TwBd/aC/uorbTS5forsWLvFJ44EPisu+LPnKI/z2aKlDea7W+7+ReH/UWg/yj
 U0S8rD/WBIECXe0ooB4CGDNfCbaEv60Wlxij+E3K7bJreaOzsfnYjUVL8ldrH6+cPK1gdnT1H8G
 bwLmz3d7/lI+Jz4YEsgkfWsO5czRs3Di+NUrOLZBGJ5fJ6rkR1cfTOutZZwt+/uWlWmxDJ0Lu9O
 6zImyOYHnEbgKppIs6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXxW6CCS7egHqZ
 IlKbGSyxmfUoIA0K9WbW9o5EGL5qKX4yfeaUspxTbsSuvDexE9vb4Abw87DoGxZRGNgBYPvNnEL
 Kzr+GE+D3f4iXu1msoBBthNFK/AFZz8=
X-Proofpoint-GUID: Ht5_H-1XRhod3UXLcEs35KKl0yyugFWF
X-Proofpoint-ORIG-GUID: Ht5_H-1XRhod3UXLcEs35KKl0yyugFWF
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a996ed2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LVy3vgBfuOLURpGlahAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 9/3/26 2:44 PM, Konrad Dybcio wrote:
> On 9/3/26 2:19 PM, Dmitry Baryshkov wrote:
>> DSI 6G v2.9 hosts (SM8650, SM8750, Kaanapali, etc.) reparent the byte and
>> pixel RCGs to the DSI PHY PLL at runtime from
>> dsi_link_clk_set_rate_6g_v2_9(), after the PHY has been enabled. However
>> dsi_calc_clk_rate_6g() runs earlier, in order to compute the bit clock
>> request for the PHY. At that point the byte RCG still has its reset
>> parent (XO), so clk_round_rate() returns a bogus rate, which then ends up
>> in the PHY bit clock request and the PLL gets programmed to a wrong
>> frequency, breaking the panel.
>>
>> Move the rounding to dsi_link_clk_set_rate_6g(), which is called after
>> the RCGs have been reparented to the PLL. Storing the rounded rate at
>> this point still makes later link_clk_set_rate() calls no-ops in the
>> CCF. Derive the byte interface clock rate from the rounded byte clock
>> rate, otherwise it would keep requesting the idealized rate and
>> retrigger the PLL on every transfer.
>>
>> Reported-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> Fixes: 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")
>> Assisted-by: LLM
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
> 
> I don't have HW to test it on hand, but it looks good to the eye:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

for some hw that doesn't fall into the issue that Eliza and the newer
ones do anyway:

Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> # SM6115P J606F

Konrad
