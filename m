Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27540370AD9
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787118663; cv=none; b=fdjCu3k/sEKbAsHMh9B0q6sO9U3wtYwPPgNJxnl5rzkOEF2qtMPBkHeAFMdx1E7qnWHRCpRirAVVvoTRqedL6bqp/JSo8ERt95MMTrSOomaJUvA/GvJqdz7i0HZjdK7PK8CZ59QUYCG3jHp1MQA4enLJZSKg51717SF2jlQR+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787118663; c=relaxed/simple;
	bh=b4Wyi6SOndJWDr1nvfDwCFA84uIVGowI8AwiCxljYjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZirMeXLiNw8DOTdK6sUYgPyzxjBTxLyreALZTG4/pcBBjLymw+KAU6J/CUHEVnnpBJ2IEY0m58//N1AUq9UCXLAxUZ1WCj7s75KKv5YRC9o+d2bh9z8ja0CQGOee+b5Eah/47wuVOxhjJXblYuOhpNLCNfpIBJROKH8VkNVOQfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b5h+Tm+N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ck7o/Yr5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b5h+Tm+N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ck7o/Yr5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J5HwMr3419002
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ojm2+u9vHv8+sQ8wnLowKabjsVDJJmVlvtgKrDJSMuU=; b=b5h+Tm+NRxgoI5Vs
	ipeYtg1F5HmRB5ZyWZFhwpECHFsEUpxPDja+/P3B3fMqrPFWlBlpbUBBoIk9CcIb
	tInEaY5ikGxQ1N8qJVkH8dgdASWVJeQkog7prhow0nk5MPYfxNb/kbECYDa70NQD
	FUIiPPQN4jhVLfjlLS0Mwosn9lbqGwjZ4eqzIu18ev4ijWKoVYb0GhmgrSbDLWc/
	VXQiR9T5PkG34+GlAXuO26QcOyCd9S2QuyPLFnPM5l9wypnNm8pwVKIYBo00rH7o
	RZ6AjSX2jBhkj066rmGYfHtSnyrQl4Cw8LkGUCLRLh1qv7nxfh6ujLSeGiKqkBa/
	G1uqRA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfn9h3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 05:51:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d54187d8b0so14401825ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 22:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787118660; x=1787723460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ojm2+u9vHv8+sQ8wnLowKabjsVDJJmVlvtgKrDJSMuU=;
        b=Ck7o/Yr5/atZVWjy3lCE8uZL4ztC/JWNgs+gj+YSnsdpPFa08yQMy2q4M1KsPSxn9I
         64WMCc0+d/PGgI+BovQowodPo4EVTSJ7QZO5n8VCPePQBWnxY2NdpDi5/bF5nXuTJhXS
         g1dIt/8+EFqjRW0l22SO4MPPexuWKkN7zQM14G1fdr88MY3YYZ+Zg7/191DGWA/SHLNl
         rN4Hiz5FXTicu6VYFVOJWSFBRa672+Dx+/cVEfVioJMBaCBon9jeeK0AzCzTZ/RV/SOA
         zLepnYWRyK40i+C+8KSznxqxn2EQQOTLQfZ5gvbC5BQaI5jAGAOA+A3r4XNWq//7woRK
         9mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787118660; x=1787723460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ojm2+u9vHv8+sQ8wnLowKabjsVDJJmVlvtgKrDJSMuU=;
        b=qt3dF0jDYtnwycUQ5rrZlQKgpV6pibMGg8EBRYfbielB1tWWVBuC3kOnLTgxcz9GvW
         xyirOongT5NWaZCjQV8Id9FbYmXOmrHbRcm/f7MedPhECG0BuXMJSkW2omZMTjySMA2/
         G3H65gYmRk8R5QNn2iEn/Rn3RaQ9RK5SikoVnKBUs9dBlh5PkgUZr1+AXuw84Z96svzl
         BXEv1a29KCJyYNwiYuRbBdpik2z10JYWIU1WbLDKZKBlWuwawyYP3VKKVMG8gKKM1zEW
         AeCqBURwgG9Tbs/F2GDdTZleeufa1bVhU0X0DkOzw5gF8aCFCbnwTxlcw1IyV9QAWV6I
         j02g==
X-Forwarded-Encrypted: i=1; AHgh+RoDKE9rD+3qEAv3bclKow0Tr0NecWLg1w25ehuEbTVrubNtU98agO+3l0OLrMtXBg74QXL8lyoriQQrHL/k@vger.kernel.org
X-Gm-Message-State: AOJu0YzbTcy+qOjqxraiDsU30dFXzlmycPa8DiXnnNV53x0cDuuyhDiw
	zyUBm27sft+9YpMVyV0KyVTXvq0EsJ/t+3HiwbCZ+RtQOvHwqOSSElj/tOLmI4noTAu2a28SQr0
	3rvn+5Swcgy4p3Qcrapxr9TRsDiYJtPifdFVm5Xyr+9WKgz0C7oTmGHvewV/UOjCTx6Kr
X-Gm-Gg: AR+sD13WPGOdf56Az6Th2mX1MjNnpD4tdBi/RiH8gZjhLBkpMGnkLvpfFN4WQjxwmOC
	Zsm5aF4qlLjo1+HeGZfaqRHhEeyZ/id+kr/4YEU6ilkAneWmW+aiS6Pgvr5ytenY0Znr9UB8Wx2
	y925LhT3cFeWexP2BOdCvOgGivQOqwrR7xVd4JTQ55zg/TjnGGLNzeTBUKoGNmKg7szn/kjZFrB
	BdkOO7F5tfmDfgMo74dPyJYfVSHAFSDkoY4l5ODTjpoPci6Qvsb+3oW8FR9mQ07Chk7HVyVYcbp
	ZXBEPqk5CfWcqVIGJ3ts0Sur9dkc5rdwzIlkhRon8SQySUC6SnWGglZZqWOUNXlX6BwW0WcPLE2
	OfvZaIUuMPBO3BWqZa5hmb5yls/w=
X-Received: by 2002:a05:6a20:3d19:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cd00dcb3dfmr5032693637.2.1787118660007;
        Tue, 18 Aug 2026 22:51:00 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d19:b0:3bf:b1d3:393e with SMTP id adf61e73a8af0-3cd00dcb3dfmr5032622637.2.1787118659611;
        Tue, 18 Aug 2026 22:50:59 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc15544d5basm211672a12.10.2026.08.18.22.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 22:50:59 -0700 (PDT)
Message-ID: <5355d0f7-4987-41a7-9640-886c90b5a2ad@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:50:49 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
 <5hksiunlpcuv6b6eu2tx5furtzhsmutlts25vi2t62totceedg@r6fagkhlflic>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <5hksiunlpcuv6b6eu2tx5furtzhsmutlts25vi2t62totceedg@r6fagkhlflic>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QedWeMbv c=1 sm=1 tr=0 ts=6a854444 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=BEJFxvBaT2hUfSgglMUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5tuBlz1eJby01Z9B950ex98J7UOAoMNF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfX9y2mI6cgKWuK
 1z4WFFMxHr+wE1jHgCMaTAx7f5US51J1R84re/UvZMQMRixtz9o1x+NlLVFquBFB7FMgweaj8Qq
 sXBDfLup2wIO15UCldJzf3VYRdo9G98=
X-Proofpoint-GUID: 5tuBlz1eJby01Z9B950ex98J7UOAoMNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA0MSBTYWx0ZWRfXzUAwyvT+wf4t
 iG68gHa4Rdj1eutEHHqJOwA7NEQcMUh9r8/uBMNf3YYRXPk3kAoJ7lxxAfPVixuxxlcBH5l3ZCr
 COv30bdDCd0HRL6C4yCMDQWkkiHb2gYPv0SEfrsvQ2DG3d3/KFODBa5UkTfHONhdre3DEqrMEu0
 0QqqREZsfHjHunNaCILBDsB0JxY7R9Sq37B41dr19w78EZr2oBdy4wVyX51QlHPajpzsOGAVQGB
 aSmVhyaUQZEDkCwh/hD6QDLe0vg+g/1TxlsyQ7doZ20O0UCaOLBuazz4HqzgUSqm+xgi+gD0Bmg
 FiWwXKm4W8BqNAnUZ4/GSobHG2CkfyhkUoVIQtDP9JSs5TGLG6SMuf4bXl6JCPfbnPa7ymw8VA7
 xAro6weWk36MOG14QeF2ucmRuJeiTPDZGN223Fs1TkqQW3rfNeMMlnV0+bm1F9MtlVV3z+aNd7O
 5MAjH4kMHNYyZI/GSog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190041



On 8/18/2026 11:31 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 13, 2026 at 03:44:53PM +0800, Yongxing Mou wrote:
>>
>>
>> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
>>> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>>>> Kaanapali (SM8750) and Glymur use two display power domains.
>>>> CORE_GDSC powers the main display hardware while INT2_GDSC
>>>> powers a subset of SSPP blocks.
>>>
>>> Can they operate independently? Does INT2_GDSC need to be
>>> powered on after CORE_GDSC?
>>>
>> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should
>> generally track the same state, except that INT2_GDSC may be powered down
>> when SSPP1 (VIG2/VIG3/DMA5) is unused.
>>     - CORE off, INT2 off
>>      - CORE on,  INT2 off
>>      - CORE on,  INT2 on
> 
> What will happen if CORE is off, but INT2 is on?
> 
As mentioned in the reply to Konrad, we can't do that. INT2 can be on 
only when CORE on.
>>> If so, perhaps changing the clock driver to make CORE a parent
>>> of INT2 could be the simpler solution
>>>
>>> Konrad
>> That would still need DT and binding changes -- DPU has to reference
>> INT2_GDSC directly to gate it independently, so it can't be hidden in the
>> clock driver. The two GDSCs have independent GDSCR registers with no
>> HW-enforced sequencing, so they appear to be peers rather than parent/child.
> 

