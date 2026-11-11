Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408175;
	b=W8ywCFkZSXM4QWbkk5P9OPEa8NLsAQWqPzehpIj0PjAT/2zXPoHld1KfXh3fwYJ8SQ7P
	 4bd/OJn0uimNrcUi77R+FV1w9ZJgScgoWlgDlH9APLoKMc+08Vy/bmgmCsc9fkFeX2TQg
	 vevS9ppyiT6IgvCA19BWdBOIqYoShgwyNgYE6+hvAzVbOyz0AuhetYDn0qGyLoRZO3B0D
	 F+3IFXAiIoaYmWdYBeHuF/OFNUIeNLl0hAsTBx3NH9VOHZsqNTlZXjSCSQ1JybdGVo8I7
	 IJB3MB8fioA4cg45oiWLGvscV9lHgkVMNV8h13XpOGjfudrDpI9rKRhie7NNT+ZCgKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d7YWesD+GB5nb3CzhEof/BBuTYLIyzteOBuwYIYlxlc=;
	b=t5phdga0hWiLWOOyDrxDFH7YX7hmA+8U1B3ibddcC2ncsreHn+w9SdVwdSDt9SP7JUIJ
	 iFGj6ha8ps+gojsTHRbAxK6POkeoJDZJ/KsoK8au7nDX/uzEjMP7J9uOQN6oHYv0K+18u
	 WnfG4k6Tm1GouMAXMDX2WlIbVl29pZGjQ34OJQkroDW/RKdpb9Mo7GIXajdFxOW6BVEC4
	 wUO64RayAjpWOVXDUgf9SmqtM2nolWpurB5fpVYGpaupocINv/7dbD44oXH3u2JuY1qmA
	 BLhdPH5GXcfS+dD14eycrqbbZuFJD2UIb7Iv/f4ZRv5P6RtMJ9Yc99m451Xkdt9+fLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m60zK7vG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Vvs4g/lP";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CD1606A336
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CD1606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m60zK7vG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vvs4g/lP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHRXC2556252
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d7YWesD+GB5nb3CzhEof/BBu
	TYLIyzteOBuwYIYlxlc=; b=m60zK7vGf7P45pIBeebd2jgoWwsaVJEBqLy+qMlQ
	ATunjdolsf/BzEMj8aILHeChoKDKty60foKGj44UDIVwuMi/PcjFgDgKKLJ0vr+n
	CpywMkm21mSC/wwEJr/q5RdQzd8hIa9cQPUu8guE9kkFW4irIADzRAqMCkE0cz2n
	ivHcf2NBQFaXpVxOXsBFg6qKnxg0KFVBV5SsTBpoSVWOLKDZYLWJQKtTmUMhRDzR
	vs/eG/XCUj8g0yfHMH7vg0D75kA+Utf5CmPUDfzA2A+X72za1QFMzeZAbPxFO0vE
	v6KXoT0w3cMIxGYiihrByu+6D+L3dkfRsMNiV2Ggb269cg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmb4b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:42:54 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99c3b473613so34585241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408173; x=1795012973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d7YWesD+GB5nb3CzhEof/BBuTYLIyzteOBuwYIYlxlc=;
        b=Vvs4g/lPUTaviAC+KJY+YgfJb47eQTxStaD+7NYxdFHVXMuq6HkM0HM+Kwy8mj5xSs
         4oi9qcI4Y7p/q4Os9PHvpzizGynB8jwL0NCqw2SGoAuA1PfYnyaEWk+t1hDKz/eD2nvF
         T3W46p/2J0obKV4VgFCdae4GN5CPffHS23MiKxpngsw0pX08OCKaomkonnES6A+k5xar
         9CzDwLSIQ7eR9KxKAl8IbVIjDRFi4K99ra+c5O/lOdsYiJ/EPN/Ej9F2IZ1zXzHPYnhi
         5oDBJkPE1JX1OfSx8sWrfMuaHhCy9/2sPc0tJgmjeZYzmxBvMiNAPReCGYVoyNXTG6Cm
         HWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408173; x=1795012973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d7YWesD+GB5nb3CzhEof/BBuTYLIyzteOBuwYIYlxlc=;
        b=GZiowyV5kVt7k4JHKuaXJ8fs1Tt/vtTk7diCR2DukuAoco7OCfa2ZmJONL2qK67ob7
         iyAsGKnWdVqSwBbX1v/3c/YegF8TW4zvVEofDVPobyVLj6wCNRVPi02i50oXvB7hnFxQ
         dUuRcAVek6RIdVEkOfSFsJOSNu8zwANdQwhYVBU0cFcoNfSadaG+a64dOJkY5mOgdXAD
         x7qtIQzAFIkQwLb3eimyKpyudEApkDpRZD+2MMuRTpqctxLGYmmfT2fNnbTLKdNyclKW
         u0eu2DdM5GIy64JTGWU+4Zv3eMP/M+IWR++PNR4CtKkZTIxAXaQp94ErfUWAiv+kL57I
         Uh8Q==
X-Forwarded-Encrypted: i=1; AL+hErGfRWkMQGFW3h6fgSbeIcDgNYoMTvZ2ITWrvuRzaB9yux3nC1fClEByTjDWs8iiLK32/Xe2Z1dG036PSBeE@vger.kernel.org
X-Gm-Message-State: APuU4Z8UNlcgMu0uKdRbh5pf80WpFhmlGPI03vw8WT8fgpDxuwQKtXqj
	31v3vNU1mCIqlBDThOFpyTMKnqBrKYErE8lekwmYmr+uB8kA6ZuwwzrpumjRC8DAK4s0tJor8+W
	fCJJrhIxxfdfHfsv/rKquU+/OBrOiaruKMPWE4Il7jya42tDKjX5Lo7AjfNLgJhlqvlw6
X-Gm-Gg: AYBFou3CHR4BqhJrWM2mDUl8yrB6h0briz6uBKu9OPJz1SOD0zC6T24ENNHDRlx/+6W
	Dqs70KKM0M+HCqF6B1BO15ro6j20ik4fiuJsvdh2rhaw79tNY983nMm1wUwQsNR8v9KtyN/Ka1J
	xwtZJv/1XUf9TTSpGptI9Mgt0RmHIpF3FyANOjKbzWFJMMUxqXXWuSjbvmlXV6Ss8KPFCaPlcsh
	OSQG4iP6z0KS3uldoTVgIE9xz6fIigFNl7bkpC3Sm6fnvE2mvFuqX5PliCkGmnAkWnHgKTHYOGh
	l/vJU5UIwEySE9Bw1AFABC+see+GIZjGDsokndg65bFwHSWTnGZSG9/MDuWwca2xuGm5Ibd56uf
	/4Zo5e4+vwp+8LzCT8YETVXTcVN0bm+G+MmjEuD27okdP2Z+dwn4AcsyuZ1wzbntt
X-Received: by 2002:a05:6102:5cc8:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d505fa8765mr740499137.21.1794408173174;
        Wed, 11 Nov 2026 06:42:53 -0800 (PST)
X-Received: by 2002:a05:6102:5cc8:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d505fa8765mr740488137.21.1794408172442;
        Wed, 11 Nov 2026 06:42:52 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5219bdsm1014835e9.14.2026.11.11.06.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:42:51 -0800 (PST)
Date: Wed, 11 Nov 2026 16:42:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/7] arm64: dts: qcom: c630: Use the idle states from the
 ACPI tables
Message-ID: <vfggukocakkxuzb4ghmiecig2jdelmm6tp44xwehgepn56phe2@kf46kuamtvzl>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-13-ardb+git@google.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111115303.3749380-13-ardb+git@google.com>
X-Proofpoint-ORIG-GUID: ijnmsmSwa18bajircLrcy4t2cNbMltYe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX0J091xY/aWES
 L/aHxjoDm/844on9AtdfkIf0QwX01lC5axCeXfX+5Tc0SxzzN2B0cTpP9fZYf/1MO9XKlQYY5aI
 ULaQR7MvmTCjpOPcZ/bf2089mD+uKEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX8Qgha4pXC1Qy
 ArNbZ05wx36MhXTVPjYqA++njTgA8qrySlvgZPfx/4aBPfoffYpsQFWeQaw9xsnHD9gjGtVvk4h
 Y9BdQZBVb0EMrlMKBCvIrFmTIQhCHLR0vMRF15y80ZdVHvLJicqb+lhPF5SG6loloHw40NCIvcJ
 n0rd+2+85p+wzeWOdrDghsJCgruFg03A2GmRjMAPLygV9DMmsp/667pduK3Fc69+zAgs9WGmgP+
 JIjprSpXray6jmrFbcQ3iGbud1xn7neDP+IPVKoBjM1TZMbOs+UZfzfV94bxTXFsbpNcU3sRu88
 qdyUDhCMnA60VUPtDqHP8CO428TD6o4A6MnQc1iN4pEpO0CeLpJramNuGq2ttmLTf95cPGH7dUE
 og+iWq+TJ3cCkxsvy/vPwHZkzVvZCie+xKYlmN8DtMBcllEUiUJBMQnOUFSFSIB+KXhbM/4t/Zg
 Wp0uYe56ACNUn/Jg4+A==
X-Proofpoint-GUID: ijnmsmSwa18bajircLrcy4t2cNbMltYe
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af47eee cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eEVhis-_e-4xrOTO_4YA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On 26-11-11 12:53:08, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Commit 07db10de262f ("arm64: dts: qcom: sdm850-lenovo-yoga-c630: lower
> PSCI cluster idle") dropped bit 14 from the PSCI suspend parameter of the
> cluster idle state, as the C630 would occasionally reset with the sdm845
> default. However, the firmware refuses the resulting value of 0x41008244:
> the cluster power domain is never entered, in EL1 or EL2, and the last CPU
> of the cluster keeps retrying instead, including during suspend to idle.
> 
> In EL2, the firmware accepts the sdm845 default of 0x4100c244. However,
> besides powering down the cluster, this state also puts the rest of the
> SoC to sleep (LLCC off, AOSS sleep), and entering it at runtime while the
> display is off, e.g., right after locking the screen, makes the C630
> reset.
> 
> The _LPI objects in the C630's DSDT describe the states that Windows uses:
> on top of CPU state C4 (0x40000004), the cluster container has
> L3Cluster.D4 (0x40) at level 0x01000000, and the system container has
> platform.F2 (0xc300). So use L3Cluster.D4, i.e., 0x41000044, which only
> powers down the cluster and its L3 cache, as the cluster idle state.
> 
> Add platform.F2, i.e., 0x4100c344, as a second, deeper cluster idle state,
> which lets the SoC reach AOSS sleep and CX collapse during suspend to idle.
> It differs from the sdm845 default in bits 11:8, which are 3 rather than
> 2, like in the corresponding states of newer SoCs and of the sc8180x and
> sc8280xp WoA platforms. Give it a minimum residency of about 71 minutes
> to keep the runtime governor away from it: suspend to idle always picks
> the deepest state that satisfies the CPU wakeup latency QoS constraint,
> regardless of its residency.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
