Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F21B3DC4C9
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140657; cv=none; b=bPbaB9JVdRHwknVt2XoQYHrSeD9EyliGCoMACeEG3vSKPCHWXMcUNsYgR+7sgENOVZSPI08d0oqv37D43ToGSWtfaQMdVDzXW6uZZGPW3sqmy5+7C7LNdWhxHGyl0ZGsiVS9+IJM/H4pJ3pc6PexgIVEf9pDpg2EmLElofb87xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140657; c=relaxed/simple;
	bh=hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+6K+iakFZKQlD0TpRG1vmLavDps7Hs35rsdFR4uz8R+7ildjqruRdY5qWqTH6JcfRKTMOBKc5Qw1hV2kUVdtKH0WPL0nsEGYy3uUQfcdYD0NSd0wI59zVuUFIOJ75/A9y4L5MrYaqpoLkptb0tZn1nwyx5D3Ib194M2MIRIy/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epnIfv2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFkh5Co0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epnIfv2Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFkh5Co0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8leCp1218634
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=; b=epnIfv2YPnCmZH3G
	XNNFK3X9+iLNlMw9bySonTiztaHiOiHLZducHovrRXVO83TVcR9IebpsH9GhijAg
	WGnaUOt0FKU61pSwOByAe3Yp16zTI9lseO9husEoPIf1kkNlm2Q2CPHWVvxbPKnm
	5iuLwek/AslPSNXeBrWwWeuKVk9Ql0v26n+8PnG/IFWYdgPugJio5aXRSJ6mbw5u
	JxIc/RzQzGTfq5vmP7+3qERXKcQVzOgBNinaNvfG08IoWwQjMRzgeJwcEgjtDaSN
	59ksRMbXvQscr17XZBQzAj11vj4dpXYjMXf4KZuv1qernIKpLl6raAmbNDR7ml2I
	Oy564w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb5seadkm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:50:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-533962f6bc9so13286541cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140654; x=1792745454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=;
        b=UFkh5Co0XgO2NQ4KTgbKK9CYTHudWKx3rJ0yw8y9NDek9kleszxG5W2tMsg5yMI3OM
         8VrhnomUCCzVJ8FJzyh76VEizhek8ljknXk/Zm45KziD2BH8jDvzd1LoNC71VWkr8GKS
         QmTNhijI5gT/4LarrXWirdIHNPhmyJa+eD0hWdFHFpATpJ72uY6VtWiYTpb3pQ9vjIG0
         Vyk4c30WpS3DGDRf5CkqFuMPrw3ZPlP6x+r+xYrBvj3iSLfYgjcf8Y1a787UtObg9dnD
         8WxfmPbZPY7B1g8r4sEYn/BlO6AZYMPlGERDzQnple3JxFkk7Si5wnX2DIXvikrzhtbb
         YfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140654; x=1792745454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=;
        b=jhrjtPHk8HYiTTDDRaXzTahWZ1ph3gtsgdHOjwQvrqJRHnFEfP461jp0j5b0zmcBg0
         wuu1DQqw3DiqLxj8IQIo0nVVCKtQl3RXk31K+DK98NZJhx4qSn8ZevwSUc3VpapMwZwc
         D6F97L2EiVw4j8Z/lKgbWWXHfi6oL+lNcZAMIl2ZxsbJxwKR3n0hO7qJY2BiLHjZaiPy
         k0c8xicihVw5r/V7EEYDrFUsG0exjGIP1D5QIkKEhpFlMj81T7FvugcBhXBgWH2iQFve
         asLGjHHu4og3uHx1dZdyv+ICYIlOYVWsHpHXbpL0AjWMROly4lbxdOvGUEgzUdY4/ulI
         gxcA==
X-Forwarded-Encrypted: i=1; AKwUvBy2PLsVTIHHySk+dML0kVBVZHIboVOtpNTRo0PAqTnhesxvJed9dgZOYKN/CSmHYRIBnAQdTzheHxiHuPm0@vger.kernel.org
X-Gm-Message-State: AFq9FYKLY13P/SJj2WVZffvE8FHDv/57KQmm8XJTaXmfB1+FtFslUAAt
	flIlttvb6RsNxOnEyV5pANwYkK78hbVxc3Yr9zquefWCeE0OW7mLY0Mpmo3+0pVzG5xTL+H9ey4
	4OTjEWM5Qha4rjNMAE7yuVjr3LFVFP/XuwytwFHUWKEHolfD629pYgOOQVVUvIVYSOxA/
X-Gm-Gg: AYBFou03Qs0hjS1kSOBf7uJMDMy+PoXohl32QvD2Cw0pSjfgpKa5Vje1JWTCQw3Rggp
	b2cT4BpETo1o1ZTgLmBTQCM3vlyIxHk4/gEkCbbsttC02jLlWFgFb02coV7mmQyt9iq3eb5kzNw
	yDRiqxkEayfUcwbw6MAfztv0uydwAQ7X8arzC0Ly0HTWACC6PTMglb3qdM7bFQYu5Q/VQ/VcSEl
	Odc2cL3zEOVJOXZ/eDsud3DHYGyg1ehQJLjdixLWLHrp8S9CMxbQMOv3HIGsMW3Rn6rNQVY47sc
	ROL/4q/sQ2Rw0ZKIrGvJQOZKeaL3dnSTHaHiWrYFh6z+vbdFQW/MZae7Wd9HW6gh29GpX8h720g
	Hp3M/TART1iivzTQNJLJpZQ==
X-Received: by 2002:ac8:5f0d:0:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5359f069904mr444285091cf.0.1792140654536;
        Fri, 16 Oct 2026 01:50:54 -0700 (PDT)
X-Received: by 2002:ac8:5f0d:0:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5359f069904mr444284781cf.0.1792140653931;
        Fri, 16 Oct 2026 01:50:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1762sm52191966b.73.2026.10.16.01.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:50:52 -0700 (PDT)
Message-ID: <42a66c40-4185-4c70-a26c-75705f891263@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: mahua-t14s: wire backlight through
 pmk8850 pwm
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015194732.64428-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX9I5eH1UfZGHq
 hIDHeOHNZW/mdizOu6GJj8LcsRbUB/Gk4DO2fVVCx0oLZaCJ4P9MW+flnXRJEj+e+HAphgVvSvU
 reTuO/q8U0UkQWiizcIncWPR1bxeUsg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfXxQrg31WSZIFL
 vtof4HXN1u3YD8QVxQ0bOsfu/zyPIzId3XucnVtP/3DKBLT8POdNwxalmpouste6dbFLdQZaeUQ
 O5xCpFEeyPbTXoodrHMJiJqqDX9me37R+LLBkFYEIz7BdB2iTRlNSS5mVliyNxvDO71hADLN+1W
 AXqM+62X1zDY3t5BHX5RejhzOnvyOQhyH/KJSeIVuJb7dcxqI796tk6jTcDngzam/i108X/m6EE
 muqHwxhcaSAG+6BboOmcn3aV4OBmGK6HEoe0BWHjhNoeh8lE72o62Ravu7ObjVDyhVnVIw5EPPg
 xnEvGlH6iJH3d3VXef2xr/epMeiuuQHledosgsK8RTUG6ytcwMNhgTOYqSuLQkmj8r7EhSOe+lF
 P7kgshobMQWjZo7EkdqjyhXbzh9z0+U0dWtunkmWXvaHecpyIRtvvH559mQ5yitK5SmTKifl0cg
 KfWC8RAHjVUScWx3tbQ==
X-Authority-Analysis: v=2.4 cv=P4yvFSAu c=1 sm=1 tr=0 ts=6ad1e56f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=J7U4xS4vm7cozkhYKksA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: qjOzubEi7jtv0E6s2j6m9gxVrDqkXDF7
X-Proofpoint-GUID: qjOzubEi7jtv0E6s2j6m9gxVrDqkXDF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/15/26 9:47 PM, Srinivas Kandagatla wrote:
> Move TLMM 18 (EDP_BL_EN) out of the panel node into a pwm-backlight
> node and wire real brightness control through the pmk8850 PWMR output
> (EDP_BL/PWMR_BV_PS on the schematic).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
