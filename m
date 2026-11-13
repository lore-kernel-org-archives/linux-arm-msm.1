Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559343;
	b=SiP2pHsu3ZlvZ+M4R4LY43iKm2rEuocSoBvx57ZTnF/2fFOd71miPgPWmfB3dKvOxmAu
	 xJg33N6adIeWnEqvaVVLsGUpXSiEoEmMsZfCs9h0clmftvqLEcINd2Hii9BnwEv0y4J6r
	 xrxXh8WOkaEU6ithCPvmVfw1jkI7V1qU0WYw5Dx1jvU8FcjvcpeyExDvGP9ofvbh57s8a
	 4InMTgBcezEQxrFJN/i2S665DF3RrBy59TP1pCicHSf91kZ8eXj8Gc856UNBbLfKc8OHS
	 Y+HujgldX6jjk5f2qWqFkPC4pZBhdcMafD6vMEK8B6IrFdFuesu5xEu0zKlPhjY5H+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=;
	b=T+22ELACc7psOCX+/nkbWSDqW5wfBPDjpT71VLcWZq/hEDeKWvub0nkSi+f01Vv6DXdI
	 r1gZ9ZlCCYcVGgKahuSdaUgpCbXdiSrqcYgW5K9DD5Ld2MqXwRVMyTCkVaxIUAJuVTQmt
	 XcqbgelIPDMn6wejTGIHeZtaIqnOY9RYG9qkfv4FPrAirn5MNz/yfh3s7neUowYW1fANY
	 FWbrkQYla3iopnYeVpwnWuk6DFuMIwj80LrDV+LqMaOq6gdbdaS6zHB7JnfCz6jH9N34Q
	 C0zuIYKrNNAvRB6PUUzmI6furTOokQXYuvMQoWYna8De6HMwR586vBEVTlKAg6gvKww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGimaLUT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvc8X65e;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F5606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335F5606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGimaLUT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zvc8X65e
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VM6S2515758
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=; b=fGimaLUTuSPB67+L
	gkMMHlc562vtZxedcLBFHVCNY9pUSb5wic+JzVyNQC1ApGW5gxEPJCrGVMbLeGhP
	at0naneyMKTeLeh7CM/W9aU4HVHbb177KouisW5UPzmGkyeeEf/xMk8Sgmj4PNCi
	zb/Bddm9d2PDbV2/x4DROibRhIvH6dC4Juv0BlPKtRSYWSepO0yjekplezkHDyND
	tmQbv5xLCk/YTQyoR7YHZndsEI4+EKZ4s5llIUcHkKEKqwA3WubiOHbWVKXREdes
	G09MQgWippVzJhJ33E3es1ATdU3m4HUN9nWCia8E8yUyUyXXwzZq+F/+3eqpzZXQ
	nldyrw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bb974-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 08:42:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5576effec09so1052691cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 00:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794559341; x=1795164141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=;
        b=Zvc8X65exbYm+98h5ztZOo1g0aYl2ufrTl4e+b+Q8ebFDiZi7oyZs9zEXAlpXz5MEe
         AzbTG+CcE37JW4oKwYHtBLO+apmh8Qs/6PQWhaq56atoapKmfvm4ek7S6rFq67x+M720
         7h4bSCzzwwFGYcmR7lVeUffSVwyvVInZfwmnGcuTTvi4P45Jt/OYsGlHfwVENVkF2Jjk
         2fmAqLO8IVV+dXNSdHpDC3bleVa2jSUpQFrPXvcCXdCAE1Jl/UstsAFnAK3EHddYz+Ld
         9Cv6zS7CHXRkkydivEWn9iut09Dn1vm3u9BST8kD5eM85v4fZYN1TY2lZsevfd30eBIR
         lGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559341; x=1795164141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNGNRf4R7EeCQJB4NqQr3fbvYkp5IfNH3Pwk65XPQPk=;
        b=aowYl5OHB2w1rhWA9pn6/+qa+lwD0OM3VUlVltP1G0J59NwlRgyK9uk2XBLQHP5WUc
         zQzHuYhpL2SZlDSieVxeTHtdMdr8nHMViFNYarod8KBMQEuimJh90zZw9XBYUAslpAF0
         MUE8L0mJb75CEtYMaIukBOfUvdQQp777IePa0txi6oewlasNVXwuimp5hxpbOPsMXoPv
         /VWpLUP7iLEDm/cr1RCdG/9fdYpnksT5mLDQSyTC8XfypPKWeRZGMPpzWmFQqjEYd+Th
         iB8AOeOTpdg/8VJ/cJyZyxNXE+8r/9Ohonlvc4VMZXeYIr8a3d+jj6/Iu/4lt7aNfKd4
         UYYg==
X-Forwarded-Encrypted: i=1; AL+hErFOxxKttcWRtSuOLR8a0wPZKf2Yai8277HYZ+J4t7yLr6SnvMoBKm8ATMEVQkyDEwFfQMxtoHTCJH8qJHWw@vger.kernel.org
X-Gm-Message-State: APuU4Z+oPx7zQI3puAm4wplgG2TXlXKvWU1ewg/WC0FDsBwtOuIMUKfv
	kJoWcQjqM9ERhjp4eVFAqauXlYwA9QdzqpOFCIQ5xm+q8AyaJKjlsQhHhC+8FFUqqhDhO2Z7kDb
	XL1JcjK4D/fJA3BLrEPs51pcOAMvRZFUivrYzyG9yykeV24rQDbXAp2alUSFVdYsxmRj7
X-Gm-Gg: AYBFou3gdwgn4/oxb4/JpD3jlGVuMZBWkWbQwWOFn0Ik3XvKv7qrya87M3Qxu3GAnrW
	wEjVM2TO2AhUuFFYVT7R+zaXp23v+1dXI+Rj9wp7jSOzUWxsfEJ5c4nUz3HVVjNRv17IFr0m7VV
	JZZdJ4ZOwrhIA4meRC5xADF2E3fmtE1Jvv695s1lTPUdlUidCkcECOZjfQYRLUi3JcFHF8DZWsu
	E5zgLcTY7tri6EfZ7eftIyo0gm2ygQZit6fJXQhGoNrUDr/i3/RD1llTZ/o3mdgkptkbS8NJZi3
	fn9hD8L/LvxYGLH2cweW/yy+mmjZ+aO505HhtAx3IibzZCXHYDgDLJ+gjr98CB/wLIyTrlIvPKY
	P7+UdW5fJPc1FAW4q0K9RBGrauErAViguivjuaIsbzNn1EBfByPwWc90y+CVw9BdMh9UCBCk=
X-Received: by 2002:ac8:47d3:0:b0:532:d67e:bc2e with SMTP id d75a77b69052e-55ac1235400mr26691371cf.0.1794559341246;
        Fri, 13 Nov 2026 00:42:21 -0800 (PST)
X-Received: by 2002:ac8:47d3:0:b0:532:d67e:bc2e with SMTP id d75a77b69052e-55ac1235400mr26691231cf.0.1794559340706;
        Fri, 13 Nov 2026 00:42:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b911desm64855966b.81.2026.11.13.00.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:42:20 -0800 (PST)
Message-ID: <9d0a3aec-052f-4209-b2db-0c2112de33aa@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 09:42:17 +0100
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
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm8750: describe all MDSS block
 resets
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        taniya.das@oss.qualcomm.com, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <cover.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
 <8a0c75949fcf428a2163a2e63b27fcf08d3b4f9c.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8a0c75949fcf428a2163a2e63b27fcf08d3b4f9c.1794558882.git.xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af6cd6e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=PjA2QlHgYP8RnRe0R20A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: clXfloXSdLnKmn3ABKpOO1F0YObvkpAw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfX4fd8Ky6yuSsK
 oUtJKiBwwt9UAHOhW30oqDFzVBb5XaZ+zq/XR0NQxq15c3l7VUW5JoujhrydqHhbn4ZG/eVCPwP
 GdScUKvmGtzsbmLZ4VVwyaN5eH+7qKRErVE1U3uNYIYsAtQp7hwy3Hy2NBT3rySsBAClnG//BiM
 IuM5DNAb3ZF3gVZZnwB1k3PTxSH6/exkMkQRsDfvk7bzkX9+lQUiTDnvP6X6NaRHKov4zSCiUUt
 DAle5bKXY2+KfiPr+0HlFW1b/D8na9jbmzXup6YilZMF86Ly5RK68Q72IywitLPv2RHR8naChrZ
 AnU+glwSb2tETuY5lHI+8g7OLZk3P0kcqW9ySDXz47n0fxfufx1eKBouD9e/GYMHrJd28zkcHeB
 0uLmE0d4NuW5Ea33J4cTk7615RdHIztZghf7jG0P1LigFxX9z8FhYN7jJJOYWKbk5SLaVlMaIsW
 B+mP58NQq/QubGHc1KA==
X-Proofpoint-ORIG-GUID: clXfloXSdLnKmn3ABKpOO1F0YObvkpAw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzNCBTYWx0ZWRfXxRuv/Tq/gBB8
 R2ml41mm81jpirt5vygErLPHKDOz1b1YAr82ns5VTKmmwLtNtr6iJDm6/8iblArzlyxFByIj+rP
 41Iv13kEU/L9PkeaOAEm28YZ0/xWOy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130034

On 11/13/26 9:36 AM, Qianhui Xu wrote:
> The SM8750 display clock controller provides, beside the MDSS core
> reset, a block reset for the MDSS core INT2 interrupt controller.  The
> MDSS node is an interrupt controller in DT and the DPU takes its IRQ
> from it, so INT2 is part of the same block, not a separate device.
> 
> Bootloaders hand over with the display block still running, so describe
> both block resets and let the MDSS reset return the whole group to a
> known state before any display hardware is programmed.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
