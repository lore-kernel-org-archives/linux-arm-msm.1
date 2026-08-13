Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E3E374E48
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607110; cv=none; b=agyk4NbTCU19XicEGQL7uVsez9r0J/Xh74mmSK4aAKvek/sqczneyt6N3pBc7/ClW/j9XsS0fA3RO7pVdsiZk2s2y1HJ/fs2qfb92RHIVH11F21BerFXEm/JOhuJvpEcHDo7LiddsRaXImn4KZ7d90FpBc+feoFsQqit2/4Hijw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607110; c=relaxed/simple;
	bh=UPR1oTO3PJmUqtl+n5kQsgiLADdLpG5fKdCJN7CFOS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n499z1eRijlVn09LvMGV7kzEX6FZZkQbfjvdTAPS1RhkP6WX1MOiSIATUzrleJLXw0L8ubdSLRFipJg5lqb+jUl1M97EGBPdJ94Ar0KFXyOqV+2VSGycB+I65inXUcqtYlHUctdk62Hjz8mvZmMKApfr2XVi0kDRxvzLIccXTXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WINtlxai; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZF2n0pZk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WINtlxai";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZF2n0pZk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g93T1874651
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQDbfdUN+IyLcTMW/cXFburEFTlhuo3IDuFHy2Cp+I0=; b=WINtlxaiEPxBdINV
	RjV/6G0okpXR/cNMdHwFtRLdmIMluUIEGulmVO88UR8RVQnYIqkpZbkZzAl0475I
	ZB/Z3kPSf+0FKdIMqG7SvCQ6xRDr6VuKx6/Z89oKELFVqGTaZM6F22ih8lo0cTMU
	dBxI9BTY7+xGU8IXp1On5Ntrhfg+0N3z+XYgM1wRkTYt2h0mQRsYKz5X58fcfVat
	r6Oho6qA1Q0ZryMAZCKN3HaONBWhIWg+v4p8SUeo33by+Dlsmfhet91kcoDzG2vm
	oAFE1ZMEjO+9fLMvO33FwOeVWb9OwSPKcQlhgebbTya9MYajLskAuBx8X59Q0Dah
	HYLuiw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g11ashvm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 07:45:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso8779776d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 00:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786607104; x=1787211904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQDbfdUN+IyLcTMW/cXFburEFTlhuo3IDuFHy2Cp+I0=;
        b=ZF2n0pZkDnJvN6qvycj/FFu6V5Mev9bLKAgArBrRb8g5keue9ANeeWgJxIV+1cJ4gb
         K0m/ZTulAEe9Eh6/h9UrysqgDP5syUiAAnE/qOpIHD2bIcNe43gZOOjBcNpY9rnZoRac
         sLJSqiYExVoAGCbKdhb+0BM4xuWK5/Xvdk48XZmpnsSDIktnvtfii4WW8YMuMwVS3fiL
         YKLJQebXcq/oXFGCE0w4SweIpDE4qzazJEUE1HUU6SOG2F69XfX91aqYQXvPH0+DtlLV
         ottFESEihAeUWrsoK6xxSMvhpQasxOoc0d7MEXceyFwrWZ8B/zkue+0acYm9nwjdxPQV
         wyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607104; x=1787211904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQDbfdUN+IyLcTMW/cXFburEFTlhuo3IDuFHy2Cp+I0=;
        b=QqKXgR8+DG7mh4q3llQMZwGlh6oSNUqYgKd+ZnJaMTX3TzJChuKr5t6VfPXAG1JLvJ
         N5ALqiF7J8J1lyE3ctghR3JxTH2zbnh+WH5N9ezsMdP8WTWYGO2gZ4MskC6gdpuD+zf2
         zh+++t0Koy3wpw3aQbrdcsNNSfexVt9HGneC5TGOo6m/oK4VAzgqJR2fUvJk6Sg76hDh
         M1uPFMzTAdCe68HJ9EICmOEhvPjVzdYlQw2QP6teFOItAFAi5KWNmrdzBAtAYvNRj43E
         FOEnAMKLe0GS0MQzzI5ov48fYg3z2WmnZ0vHIxA8lDSMj/Bw/qjR3MNxB5D9lB6P+wbn
         E/oQ==
X-Gm-Message-State: AOJu0Yz+uQg56VoK8uwWAMkM5NtmlHFIuMAIgSQR7YXXg2AsYJZBLXtm
	EpXgoZnymp8K9z+yRG5VC9YEGX4KrekBwh+vCL8JIWeiaC0xDRwVMUKI3J+kLJOyZO1y9Ni4Bx4
	ywfjH6rZum3TWSapi6/KhJpQtc8JZ1bY7pOByb3T/2ShDVr+Z5Vq6O1Y31AGsWJuJIPts
X-Gm-Gg: AR+sD1043yW8Mzmwm1SuPh6dq7JeNBiedQHQfhcF1NFB+9ra9tGvd6CosKP5Ra8YdT1
	r55SdCisV3hwXYkVvoGLKXVh/uNirbaTb6C8444uUZElKivoTddwOfP1Ry9KzoyflmrYV6Rrp/b
	ISFLwUrLyVffacMgC1+OcJ5Ny/gfL5nL/ArnpOY/fNBN49LiqXtNslNqZfWFLYonjWtJQQHDmLq
	zr5lwzCZxOQsjSjyjn526dFOPhMsrZeUWv2GU3twe5++JjYnm9303YVb5VXhMLBZrOzYAfwcG/I
	CEoKFyQSR/ngg/7MyJXSxORR46BchaJyeeW55hba5Vv2dvWlNyLaIhfMqdpWS+gWAytvOp+94cy
	an/2WkPyzF5h6b/AH9OwbXsmS6I1qDdsqW8s75Ab4oRR3d9Uh5S1VHXGfgEPWBm7B
X-Received: by 2002:a05:6214:1301:b0:8ca:f47:25ea with SMTP id 6a1803df08f44-90a8092ee22mr36705126d6.0.1786607103922;
        Thu, 13 Aug 2026 00:45:03 -0700 (PDT)
X-Received: by 2002:a05:6214:1301:b0:8ca:f47:25ea with SMTP id 6a1803df08f44-90a8092ee22mr36704696d6.0.1786607103539;
        Thu, 13 Aug 2026 00:45:03 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e4fasm9733956d6.2.2026.08.13.00.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:45:02 -0700 (PDT)
Message-ID: <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:44:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EujiaycA c=1 sm=1 tr=0 ts=6a7d7603 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=TWG_K1dlhuyH_i5ZZ2cA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX2zr044lBCTIJ
 wDIj3pvsxvCUdYLXHuYdjOig+yISUd9T4FOwAD+RMM9zzCzUFNUFbzGN//Zi6IkhKkZa41mCEE0
 DT7i1klO4/3ygZz6YqCExz4Oviv1XoHRrNbmBT07kAUh8L3e62WQTY7cACkTB9A4ciIXeLspYij
 C6Fv9iedUibT9SgStdX1rc6waUalK+JQEnctmtAVpx4E+zGet1Zi7+p/OgZ/DNWhQxNm1KlmB+X
 YxuMuZ73amtEqoTYDkI/uM596CdRT7rNwLuXOC8rFz8TKJknAvhKbIP+syZkVDRoCfsMFQohjsJ
 IytKPwnTQXXqpTAzvgLmGKlzaITWqRY1ktjmtCTCulYcBG4XYqAf6Y7N3xJctlP+cRdpCt1Htgx
 Lq0UlSEfg8L3Tn8H+meaBh8N/Ts/CVwaTGha512wCl4qqdyGJ6ChU4dhbnbltxWzY6NCRPQ0+ar
 1sdand0CrTvgbeXOjeA==
X-Proofpoint-GUID: zroP7ycM86C1wXXH1u69nk5QcMb050sD
X-Proofpoint-ORIG-GUID: zroP7ycM86C1wXXH1u69nk5QcMb050sD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfXxQEPWBnE556O
 y7UYyfMSvSTqDBtIh6smp6WHeZBjPrnGKo6j/hqpHG+pjkW32lG00oM1700TuwgGPu17rVTsJ4z
 rGGe49BvkBmc7Qqy4b2nN+kURrO4jrw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130052



On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC
>> powers a subset of SSPP blocks.
> 
> Can they operate independently? Does INT2_GDSC need to be
> powered on after CORE_GDSC?
> 
On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should 
generally track the same state, except that INT2_GDSC may be powered 
down when SSPP1 (VIG2/VIG3/DMA5) is unused.
    - CORE off, INT2 off
     - CORE on,  INT2 off
     - CORE on,  INT2 on
> If so, perhaps changing the clock driver to make CORE a parent
> of INT2 could be the simpler solution
> 
> Konrad
That would still need DT and binding changes -- DPU has to reference 
INT2_GDSC directly to gate it independently, so it can't be hidden in 
the clock driver. The two GDSCs have independent GDSCR registers with no 
HW-enforced sequencing, so they appear to be peers rather than parent/child.
