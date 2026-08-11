Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7160C442B34
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453093; cv=none; b=XwKfegDl0xV2i7MKMkrHBaPneheSYeFM2TgTKOKjY56UzEcO3JuOqnVWbgVERuajiDD8sXkTSUA8whifmcmNzINjtX/9rEyO36QRY724DgwcU9csmTCaAS8gAfoQIkdjdeWzCq3KmIWEBm8VHZ2VCf96ZOzssuIBp+GZsoCH0k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453093; c=relaxed/simple;
	bh=OJ0ZBa2cHq5Y0PEgrdjMS1IPz7CDjDUEpXOidvKmPwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RP0io5cL0yLwOz0FkeO792HWJ2PDwKkZrmJz8FcfNTz8n7KrxwLHHFqWs9yLkCfSlL/2d/PoC15POBrv3fuXDY3r6qkEGVQF9WC+rpWXJbKy4teCOMrrYLwjRKmwGexu0y25MAOCKQuGUVawISG7ZX6hNZQL/72IwKXhTBPc0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKrl/IcI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMkga1Lm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKrl/IcI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMkga1Lm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BCRkni313575
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qPcvYs0iKc+a8lJJW6pcLmsa
	ycbftBlE0kRPRVi+ltk=; b=GKrl/IcIj5msfP/wCqpLsESIRzCG/yxbkNIId7VU
	xQZYbI0sTOeSixUhqwm10geU3z55j0w97xS7PuUp+N4rylJ++uzcEra1uTg6iiO5
	ZrwdVOm3MZboFocuBfPnWIf9G9o1w5YmSIpTw+MBFW9oBeShEJeBmt16ldOxsCJX
	nvbLq6NOGMbeffsQc24WSI63UfKqTwPpkfMwYM55E1but9WXSFI+XxaK5+JMTSXR
	6hZ2d9duvVYHZVs4zRbZCGVnMXU+Y5Zguj7kzGYzthZuzYBF2WHhus10yjEmwPKP
	p4NjJ8GYelRtFt1wjFDPFc2WUQOmZPM2Jjqa2eDuTTZb/g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk64407-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 12:58:11 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9080b7b2f2bso29991106d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 05:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786453091; x=1787057891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qPcvYs0iKc+a8lJJW6pcLmsaycbftBlE0kRPRVi+ltk=;
        b=MMkga1LmKjKWAL8oFY+EmjL8ITph14ESslZ3+oMBtWXzm0palq+yka4tdIpiMg/q/J
         7Dva833S5Tx3KgLojZECFbOtpA8FB+QfFYXhePOQZyUrJmqDicAXaJK8MEWOx4WSWfxZ
         oqD5CG+RkgiCWszlMJLnxX5qR4nGRB4Aki74WsU2P4Lz15PkYLG04fMt/RdxJ4ku1haw
         dM7Uv1dqt9CXqqVkddclHtUd8tU1MulM2W9Zau5vUQlXErehPqZHryjpkSNUhCEQIMPv
         zHDEBHEQwqy2orubYrCemb+JGdaJFlz+3bP61YyNllD8vqfkGBJEzLcvg/R+wpissv22
         joSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453091; x=1787057891;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qPcvYs0iKc+a8lJJW6pcLmsaycbftBlE0kRPRVi+ltk=;
        b=LN3LMA8hEAjEFfboRQYZ3CRx3RR0hJWwEDWBvz93ZzV0ua00wzoB6TSJKVz2rEirQW
         m4aPizHyIzMPIX7HsIbArLiLkuvGDjiOBN74q2Y93RLTLFk3OliYlbcQtlRhLQveTp0M
         oNL6zsRu4iL0UR1s97M/H3ngjN7DLCJdm+7iyeq990ZNTzoAWc7Jj0P/cztdRkWx29mr
         Ks9GvpUDW48Odv0hIg5pudYIi/3l2NY90UJoZkPHAfDUm6JFE1rOnmr82t+Ga9IZqRmK
         5jYeb8WceMOkc0GTuEqdvWnYPBrOxACnPh8HM3LmOeCmAVIRQCQIf2Zq6zujFape2XTr
         r4Dw==
X-Forwarded-Encrypted: i=1; AHgh+RqzJBGIAkDo1qLWNfIts+h1owjI8EFCWt7EEFlv1WPN+jlqgx/SZiS40f8Me6oiqXSzxvKbgJ3KE0SI/R9m@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/uvgjx53mZSI9kA2PK3vnYOQfu0i/BpF1YF+5H44tPEsTCSS8
	+cERlAAbxzxdLm1zVExUgOe0QEcBbH4mj2YbuSiDZHldfPbmlyPl0F9uD8wyxfJYhtO8JKDfDxX
	Xgdh80s0qwoueOc2HYbHKUV3qIaldSRq3hDz7AW0xJaRxn6c9v+iAciZgua9W4+mjVjER
X-Gm-Gg: AR+sD13HAK0CffcOWdvAV4vkC/HgvbQtYUr2w0I41GYa+3d6XStNtvwH8iBcQhG4PXy
	+V+F/eIxt+iITKRQ4cufUCb5caoMJ3dXAcvSrl2kM0v1Sjmm2QpanImafwLcWrK0SWJP8UXVXvE
	OGg+sfxkS56Sm2r3n6v2/Q9DdwuZkCwdx+U+m/LJL6WoIteXiJk0yfpVrH9V1c9bNdVb2VCmf/a
	zgS716Jl6KfBTrQopuIcl+RkZ3g6CbKrN61WuooG+lo7TcBuDNAweZptzRE15u70o6CPQdWPE7c
	ghc8xncsoaj5mrtqaCdcow2g29dd9eo6PV+Bn8pYkPUbMbY4BXg524N1fblKDCIUlk8tR1uuRvo
	NufLz6Wiq90SxJH4Y0yxFYRTuyjl+CtDx7ABbMxQwEP9I5Haun2WTOOaiGQDC4kT0qN3wt3nh/O
	CkS8uKQETYzjGcjw==
X-Received: by 2002:ac8:7f46:0:b0:517:9095:c31b with SMTP id d75a77b69052e-52d586be44bmr24131871cf.42.1786453090687;
        Tue, 11 Aug 2026 05:58:10 -0700 (PDT)
X-Received: by 2002:ac8:7f46:0:b0:517:9095:c31b with SMTP id d75a77b69052e-52d586be44bmr24131361cf.42.1786453090242;
        Tue, 11 Aug 2026 05:58:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486d5207sm254769e87.36.2026.08.11.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 05:58:08 -0700 (PDT)
Date: Tue, 11 Aug 2026 15:58:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: purwa: Drop the Hamoa
 workaround for PDC
Message-ID: <5oriin6jbb3cev32ttb6ctmb3ezrerczgvfbimfa3kyp4umxet@fqvnrfbuotrf>
References: <20260806-purwa-pdc-v4-0-62467f4b4ddc@oss.qualcomm.com>
 <20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-purwa-pdc-v4-3-62467f4b4ddc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7b1c63 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=px_f_vAfgXbzbh29wf4A:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: o2OX97xaHDf5jkf4zrs96WxslW1JIP3r
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfXxWjuDJHAI/i9
 V2agE1zb/uvB3TNFkGJp3x8t8edCdqD8ahAYAcIb8lYxR692kDcYTxkBUsY0oVuzQmz06q0neF3
 wptlBmQ/CQtMb8dopPOI1uKcKdlLGVE=
X-Proofpoint-GUID: o2OX97xaHDf5jkf4zrs96WxslW1JIP3r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEwOCBTYWx0ZWRfX0L6mmdZ6kmbP
 tFATiJkyQ8kJnyGKWctzzXm4YKMviRAXgajf2jGFm9trfg+Acu2nV6Kz4Mx+cHFMCQ0P4Rg+P2o
 o5PLHZltyL61dK7Ev5yc3Lq7hzg+wUkYItlnRb41UDCEp7eGC9Z6QRycUHcDPOZy+ijTYpMV5cg
 OLDusxbZ8MukPGkzBdS1oyWs+DjMYIKAye7kWc0R32OcbyrZoc6Qwgm6j9gxJbEAs8IfY+k4jDd
 McNc4KjUCXdyxtHytNLRiKV/sIw5txKeVjL85Ynbj+n7Ch2JdgbCT2lebZwxwLSi+GuB8WSmY+C
 FiDjQv0xBkSD4EPP3MJR6BhCJHdhq7wlVExIvCmC7qFLPAQ3jYQl2Aozwo1h9K5gNcjciCtRDC8
 4z2O+EP2YvL/sRUZDA4oQEceblJC4+au4fPiCjW80dR7yF2oq/94ur4r2zj8ShK3wmf/9/5dBBz
 roF23P3r2hLmsKZxTsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110108

On Thu, Aug 06, 2026 at 02:26:29PM +0530, Maulik Shah wrote:
> X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
> register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
> Workaround hardware register bug on X1E80100") is already fixed in
> X1P42100 silicon.
> 
> X1E80100 compatible forces the software workaround. Use the X1P42100
> specific compatible string for the PDC node to remove the workaround.
> 
> Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/purwa.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
