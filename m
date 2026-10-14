Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E8048C41B
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967360; cv=none; b=MjgX4TOpRtaiKlPZgDU+ok9OSuv/v/efacmF1nM1hd9VcyR5d1w7D9+SWmfs/4f59OSpYDZDhoeRsEmqcS0YAQeoyZ4TWnYnwJ242GXiHj/DTlJqsDIlmSHDKaC98Aq2/U2ZgNVVMSL0QmXxruQtyGXHr6/NjPXjJ7NAcLTdqAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967360; c=relaxed/simple;
	bh=DZjiREOEPLWxaSXYcMVuRRT56WXD2E3nM+rovrf/GCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7T14acARmpmiCxaRiW+o2LR2psT4YTtMecKRKvYHNACYFkEkit0DFaA7RW4s044RpFgEIK86TCeJR8WpQgRM9aHPbtCmESBVmBnxaKAAOtg9bjeWWyUtu/oHQ5VbWnQ290RyH7MrPgeZZyE5TPIQDFTppG1emeufsYh8Drf438=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DpbHQTWM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SLZDBPKW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DpbHQTWM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SLZDBPKW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663VK3365345
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qgRxWrIOTdH9QqccB8WERobO
	gjeOV/SCKx62FYHmlxs=; b=DpbHQTWMdjGAHfU43Qgy/+Y0HlvsudnMdw5/PgMl
	u10wgsfLAHtuKKr/8nB4bmhH/NmnkSEvOxNWKujWDVdwn7enDFNfUjQyaj0ZVfSQ
	lWd75CT2gBI/KsnQdmIqtzoWLFkEIPMCEWZWs8kHY1PzVZ53wvRfISx473XSXnHJ
	8PxzMi0dRT6KiE3lX2NuMKsvuTzgT70sE5zdalnfVl/I8EKiBBfayIUJ/gHISapu
	kyLdY9s8ZXitmQzNDwoI8s3RRCjJtIR6u+S2TtR8R1W2sy0N4HfRcCzpToMZJcce
	XSRNnsWn/ZyoX5FyMCfltOIp1853mM8He288aOHfVgoJ1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620m7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:42:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso676020785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967358; x=1792572158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qgRxWrIOTdH9QqccB8WERobOgjeOV/SCKx62FYHmlxs=;
        b=SLZDBPKWU2VZ06jWYDovlNiEeq1y5Num4jj8qW3j8GCU+DAXDChBLeO8ctJIDLuQCY
         jsJOSjgpAyyDXLXfvuDW9Wo70/ESLjsyylDhc5ZyyQiBCrhaiJonfCZWC5dZpESURUyC
         R+0pjZDno0bQ6Xp66DyxdmCKB6AhL2qJmhY0a57qYv0jZk78XZZukhRuWB41wPluFi6g
         /wwdICZY81GABPTLwe06Rwu6b7qINGRsf3LdI4HjHleTk9WeasLFVcRSrgh9JN+b89fd
         cr/szty3cw5I70sRsrhlnrQtnWGGtC/jOfttp3G1p+Rjkeo2maNTDg9j5RqhS6X70yuD
         CR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967358; x=1792572158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgRxWrIOTdH9QqccB8WERobOgjeOV/SCKx62FYHmlxs=;
        b=bTPculfGb5kYlSsehDVXD9aG7RqgRg4m6O2FzfE6K6YHgBJKNFPUW+Xf3hamwR489Y
         Gf5WRMw5mL1RUGI1oQ0cLQpX/jw21wQu6h4fH36DOszGO8qCZC3+fC+wdVKAee29KoW5
         B6/BV5GYH7mUG3CNKZbBP1+EUaHSXMceuFkPDP8bW3y9QV6oM/pDGvJK/PAiUZefusX5
         Fe2K8dwPwf0RVUdp4+ifId1JT6KyUMcbOmy0HOTK+R/KpZpVKpK8UECwqOpYFW5dpptG
         BcfadzE8U6abzaCuwNLK6mXIv0JONq0sYeWBJLB3nV8L5IpTBkq7oCGfdbPfUrL7ktNr
         sB9A==
X-Forwarded-Encrypted: i=1; AKwUvBxzY6xLeiW1wNjw9Aw42bijOhjOyYv+Xf4KzmKh4WXAUmADXSZ0GtFg2xYULE0KsIane7hJ4yRA5O/G8vHt@vger.kernel.org
X-Gm-Message-State: AFq9FYL1NmrnJn5fNH9mHWE6wMKtFIXCVujcb40QWEM6tDrdDsNs/33x
	Q8KtPrILCW/Yemme3p/QqzwB/klM9kfszvDVFvCUVbTyvGSz44pEVTHAJN15xRwcGRJtw4HU/8j
	cLnnBCXuJRpwRUG4VCD5r17xDgWWb+UXPpdT99oSs8/gY6/lAY++jslUxpOpa1sSsQ6Ri
X-Gm-Gg: AYBFou0qkImllyNol/d6KiiZAGoUZiqj/MtYSfT1DWuALOWfa6SIY9+9Ptcavg1KgxF
	68/mfsvqP/pFFVYEUFqInM21W9/o0XY26vdQwphjUd3V5cWCX6wpyAb1MO9XNSTwQY2GusyTfJ+
	dzVxB2mOQi75dD7Z64pOlqmR6GvaVZPRz08OyZOhE8TRmAEb78qgE8l9f0QgngFh0UJ7WwNo7Fe
	jlaNqzJ4X/J7qE2RK5ZQQ3MsysxEnM11XPFVs8y0XRlEsbIPvroK5+tdZKtfOcgIZhyTkJZVOVh
	B7BLqZo+5RMB18nzBpdEWEoH+V4XiRCR7OLGS2/oNfo4tKqaw5dJJa8kSo2LvVGWvr4tG0tiSQ/
	ibPatUuKXveEEzNe5
X-Received: by 2002:a05:620a:470b:b0:93c:29b3:3525 with SMTP id af79cd13be357-93ebd262b17mr2334031485a.36.1791967357883;
        Wed, 14 Oct 2026 01:42:37 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93c:29b3:3525 with SMTP id af79cd13be357-93ebd262b17mr2334028385a.36.1791967357269;
        Wed, 14 Oct 2026 01:42:37 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm5635211f8f.29.2026.10.14.01.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:42:35 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:42:34 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dragon@radxa.com
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Fix GPU SMMU context fault
 interrupts
Message-ID: <isktrr4zb4wfucw5dxv37rocjoz3v3p3x6frvbz4k4pysqsmtn@h2kcalqncd26>
References: <20261013-sc8280xp-gpu-smmu-fix-v1-1-8a781e3f1554@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-sc8280xp-gpu-smmu-fix-v1-1-8a781e3f1554@radxa.com>
X-Proofpoint-ORIG-GUID: aBFaNBGgQLDSpxtl8k_cC9cIt99jSSpj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX5b6QAvpNkGum
 u6XbcVil3y0qLHYIYMZkCBAA7DnjeOJ5PqucV2E7Yu4cgSNa3qiMhqi/uiDBl88OlaFNBqVSwmR
 61H0d2sJjgamsDSDpG+paqL+vXU8/7ksG/8N3Z7oHgVnrjPLXphCg91jiNWX5ooVJ762Cr6CUL5
 eVoI1iMXeGP0z4ywXHISfOCAnI22XSyXJa52T9j9NRUaHNm5VCxKp73pbfzCNTf9vJMIExJtapF
 y84h+Yv8nXy30yY5vDBeE5iSmcxYa8m4KkqSShi4EMqn7kxmYS+wXXH1Df1FSq/t0ilyZcCjCMc
 pjHCUFv1biZjEarZzlNaIbuzEjsxfSYR0s+MLgM9wJBXYoYeoPxjw1Qt1kJFWzts1aRmk2Vb8M2
 S3EQgF3fXBd4kC4WNUN7a7LJJ1eBG7m84yO5XiTH1mJLa9vfD8NWkhcbDwr/qnTYS8SAE31QBUI
 ukmI+7AX+eVeJArufvw==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf407e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=OHRUEhKCVAIpKXg0jaAA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfXwII0ATxlmWN5
 abALzUmUWBPHzranMv5RvR1J6QSm8FS+IhCbd6v70aRKGht/cy46Ry7h/bqyjuRJqdj4/1OmAK/
 wCcRxkMnnDI5VFLUVePLz1OsUGGBDBw=
X-Proofpoint-GUID: aBFaNBGgQLDSpxtl8k_cC9cIt99jSSpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140034

On 26-10-13 17:59:19, Xilin Wu wrote:
> The GPU SMMU interrupt list includes PMU interrupts as the first two
> context fault interrupts. This makes the driver register the fault
> handlers for context banks 0 and 1 on SPIs 678 and 679 instead of 680
> and 681. Translation faults are consequently left unhandled, which
> can stall the GPU and prevent recovery.
> 
> List SPIs 680 through 686 in context bank order to match the seven
> context banks exposed to non-secure software.
> 
> Fixes: eec51ab2fd6f ("arm64: dts: qcom: sc8280xp: Add GPU related nodes")
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
