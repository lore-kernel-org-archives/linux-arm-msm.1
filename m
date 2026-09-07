Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30949403B13
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 09:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774448; cv=none; b=vEttN2ya27dA/tUSsXxWz0vkk9FElpDSXcNhJ8sei7YWgVtya5me5Nd8O7Jqej+CA8P/382cYnhlQWUaORoWslXB1EG8wSfx9QHL70CfZzJY/0W8P8+WAeo0tyIGuhe6OFnRuV6JHyrGtuP1z+wi3ysQ1SyRKPg1d5S+zaInrj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774448; c=relaxed/simple;
	bh=Y+EIlACtqhzi/4yUaNBKx56qGlknGwzAT6M2bCf/hIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rvm0vX4iJket6QRkkx6MMCy0TOykVl2uTrATehe4T4IXmusmQAUOC8waO3/DnmkM8ZNmqdOQ9C7UIvzkI5i7aCKvCjGlF9GYtU/drQzS51X++EwAt+lpxQNQB+XTda/3+dtGIbexGhGvNzyXS4GZbORTG+JA1mm794scbA3CtkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPF8Rn3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gk5PTp/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPF8Rn3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gk5PTp/L"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bXSs4037023
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 09:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E1hA4N0/5088URD+WHAfkNeTqW83E+jKM5n/INb5X6E=; b=BPF8Rn3g3KB5h89b
	g33DLCh/Q4y0z5beMVmxTIHjgxln48sF2e7OWck1NJat4gsnZnSQ7h2NX2dWGvAZ
	FdyVirAYpD6bmXrpf4ramF03O9HSdW1bGhCf2XuewY6OeHDs5SuerwQaqgPDmrwy
	QlSLXuIuWPua+ZH5Ov14bhWv0yr5mUNZQ966GJmxmyYWm1+cely1utSJkH109ggp
	ixwgzQDVxrJMyzu6gmJ4rIMFrkSPysJsw7kum+QqS2gaAS2PXp8pyapp+9kNlJ1B
	5HHt0SxLyOh3ysLhkdOL025TihOo3l1+BkD1LVtaE2OfEn0uTnu5t0DIv6sA5W9q
	HIBSdg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg0cc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 09:47:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so3112753a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 02:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788774445; x=1789379245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1hA4N0/5088URD+WHAfkNeTqW83E+jKM5n/INb5X6E=;
        b=gk5PTp/LLpdv6sugqhfV6L6ia/8sgYK4Oi/CoGKpgAhQcycF99nJvYgL1yfJWllAGb
         N8TIE3eMErcuk77mXBMgbLJKri5mXBV4LD7K+IjB18mzbl9g8rChauZ8P8QQLRAYprpr
         pCr/7QNp4Ywm3d5CqI/G70ELL/3BaHkRICK6ZTjzQgcT2tfG5l2paP5DN74pgi+So28R
         vgOgdfYPkrAk65E+vZNIw80zBvQf4Yx/C7lMtTYuQBtJcvQMqjC3qWbACyt61jqqySW5
         uEB+7cadWG+4XbyFERRSEVOM5vUvxAyDVN9CImU32kpV7O/tUyfZ3JDPYDMPJShMuvYl
         UzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774445; x=1789379245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E1hA4N0/5088URD+WHAfkNeTqW83E+jKM5n/INb5X6E=;
        b=qkx8DNukiG7KssEC7injSmEQbE0kwcSeNCmaX+hMFgFWbM3UeZ+7EgTzfM18Ss/Sk4
         JPDqywCOGA4/Lw5fwqGbQ+XeY2/XoidFbQB+0gT1Hn+MGIyvzMVtlZe4eyKJgQBnRZ0I
         JpDPF2b2RgShCkXhLjkkhaXG/8zhqWjqTCXr8qyaaUJ44kOxiBfYyrwuVCwdtuTtTZKd
         Jlmbz/gcMcszA9/lmIJvvCL/Bn0X5X1cERJ9hz8zvMXVMNSLOCjTXxc7HZbM8fZPI3X8
         x0OSWTUxRT4zcDcrhBsv93rLWtkT2KWYPhYbapWRp17upJ6blOMNd/2+vnyfEgzJhwcH
         dcGA==
X-Forwarded-Encrypted: i=1; AKwUvBy+xwkT+Pbg52lmJ2TP9PK1UAFSQDfFrQQ1MliE0spQvqS+dDc9DMrymsmFt9C9F4LWWSdfrpMdRZWMWO0u@vger.kernel.org
X-Gm-Message-State: AFuF++lipUj1qBan2QkbEEW4/IpATsVy4HikV0rIFyn8Mv0FhimZHqha
	ThTeTkPIoky52i1Lr7zBtLIWSVtacbiEduINTVzZCjti2ryxz6kVj+YcfWCozOei8MzKYl1TciY
	UKMSzK6XXUuR1yJlK/dj1xF1r6XJ/4reZ1auFtBTSpZysGR+f3afG4zhjb33kDjBlaTtg
X-Gm-Gg: AYBFou3sS4bNkQ0gErVzlowKyyM6iKRL6j6YT+19ZjEqDZcAYRwmJ6YOPqNC6I8nNdZ
	crjiZ00CeHb6Um51N6mEo2DUp3A+Lw5OD3LOpyNPHy4R+geTbWRY/GrKM73XAnWb9QLW05vceng
	oLmb5np3RWqcs/XuwFgNwVcOcJ9V0YIDZm3+pvvXlLGiJz20YosadueJluxFbxJC4KjUTme48sb
	mhhUU7vfcPhv10vEVzVc1zw3sNTDa1ICyNX3Eq0o9+ZB3JDxLPupZaIoo6jqPYncntgyFQ2segD
	wpSJy956tJuE40lzLJk/bPcc3C0qd+eSpynqLHmUxVryTzstPGX4S/f/sv383wfGTfaVHLyxJ8V
	mIOQa4YPV6EE6KB9LWGd4RMVfeAZBkrY=
X-Received: by 2002:a17:90b:4c4e:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39b262aaf32mr33970806a91.19.1788774444954;
        Mon, 07 Sep 2026 02:47:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4e:b0:399:1b64:e0d7 with SMTP id 98e67ed59e1d1-39b262aaf32mr33970740a91.19.1788774444513;
        Mon, 07 Sep 2026 02:47:24 -0700 (PDT)
Received: from [10.206.103.40] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm34741879c88.2.2026.09.07.02.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:47:23 -0700 (PDT)
Message-ID: <902c7a41-363a-4ee7-b780-4d8cf2155d39@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:17:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] phy: qcom: qmp-combo: delay Type-C mux switch while
 DP PHY is initializing
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-1-2825e5bf8a96@oss.qualcomm.com>
 <37cs3ejjaldogjlh3oyhzxgedl2w2s6qk7sercwem5j23vdtb4@2dzhapohcgda>
Content-Language: en-US
From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
In-Reply-To: <37cs3ejjaldogjlh3oyhzxgedl2w2s6qk7sercwem5j23vdtb4@2dzhapohcgda>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwNyBTYWx0ZWRfX2D72h3JyaP7H
 0AGpk304KcsXmfWUb5TwqrE0T1iiRPlM/1vDdBrJ9rFGggtoethze5ayPLA+yvExMI/zbnfI94I
 DKrhTKEhcn7siAowcdogvFAo6jAFONdei8NLBIBmC4DV18vvo0orV/fT41eU4ddZQ3nz1gA7X0o
 lvpaiG6tm2e9xPL1IYJn0u/y24o98RuqwMn5xLKjwK1ZFgZLtnW+ee845p43JTTFkRbccG84S4S
 SlpRv0wDDJpbHE69xeAUJCtZh1rZlLBlyYu71tGVJ58I4S9PXgAmhURbsXr6saUwEEacdB+CTt8
 2E0ZyKIji2BkjlMhL/MNsRAWuqq516qB+C2PsGZt7Obfkfjf8mAKdQB8Ajq2Q2f6+eUHGVgjR3X
 M5kaskCGM0ogmMmQPBM9UvjFWHFSfvyrhdC+ZOjioLiKpdaZqaRH+uFfgoL5G9yi4c5smvFbKN7
 Bt0Um3kUbwyXD8+Bg3Q==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9e882e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=5J6vajjZXZgrfOcXjUsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ciS9PiO5lL0GZRXbExlRnd_xXTXmEVZc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwNyBTYWx0ZWRfX9iDBl65lm1p+
 JONUHYzw/l1+o2TkuntC9H9frKLYh8FBSGD2hoTXjDZk3RtzRs1a0JIs9s0u8ZlfTVgV2gFMVve
 zzOOj2b5jGjmxdqycMBdXgs+Dj0S9UU=
X-Proofpoint-GUID: ciS9PiO5lL0GZRXbExlRnd_xXTXmEVZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070107


On 02-09-2026 13:18, Manivannan Sadhasivam wrote:
> On Mon, Aug 24, 2026 at 04:58:04PM +0530, Saurabh Anand wrote:
>> The Type-C mux switch guard only checked dp_powered_on, which is set in
>> qmp_combo_dp_power_on(). However there is a race window between
>> qmp_combo_dp_init() and qmp_combo_dp_power_on() during which dp_init_count
>> is non-zero but dp_powered_on is still false. A Type-C orientation change
>> arriving in this window would proceed with the mux switch while the DP PHY
>> is mid-initialization, corrupting the PHY state.
>>
>> Extend the guard to also block the mux switch when dp_init_count is
>> non-zero, covering the full period from dp_init through dp_power_on.
>>
>> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> If this patch fixes a race condition, it should have a Fixes tag.

Sure, will add in next version.

Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to 
change the QMPPHY_MODE")

>
> - Mani
