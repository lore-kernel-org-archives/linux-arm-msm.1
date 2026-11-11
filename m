Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420510;
	b=tqVatLC2Z6IR83BleCL8o40782lWAhBPbwfZz1Zvqzafe0vnhrn/v/99bGaRuFJeax9Z
	 QhweSe4lA5LRKHUP/hL2XcmML6b7H6XCMY5kOnQRElOMOXD44fxEdDma8cia43IfbFsUB
	 wk1Dak1d6cG0g2v60kvgaG9s715kyBXs2zSj7xe2LDFVmXBdFzQt25UT7fiQ2esUjZStq
	 0sI9NCNxPouTtaf260s1PfVQ6fPUDEqtuzi1kcVw2ZNYrvTWXy5jjQii/fhd6P1COGsRg
	 T0s7eCqiryvYxQNsvZI76vhpSvNoA5IKl+Y/3PGZeFN8WRGam6ZFkxHYOe3D4ujllYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Mek+GhpJgbAlj6PFKAaMZa1L4pkrsPGjFMnbflusKoU=;
	b=FZ2kzqt8m+hMZIn9xkMEywmDzfEYwcbvTaM30UAkmk7ShlJ8+k/5AjuheLiUD+kxFxqO
	 XvbA+myDNCA1XXHR1AKzTuaHrW/8tVCSmh7lifnXHjz3Ev3cJAir531t3fJHSYNIDBdmE
	 QLTy7LOjf6pZN7nJ+DnlFAgGzVMbYDobjopE+sCoBU0fUoabKCpDQ0YwXtPafe826lKiy
	 mhQMFJqiXlS0HLx3+ZJCUyqfOiZHDBprM5Q92lSX4BAyf1SA3syNW7itzX2FkEkvsy206
	 HxDx0ALGPxw6St65ht/cwnOP4eR8aEsXjld9UTTQ5OpR21ABhFUxIomsmttLQ3g4quA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HkRp8tNl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZQXkZt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6E7606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6E7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HkRp8tNl;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZQXkZt
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtLok3041668
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mek+GhpJgbAlj6PFKAaMZa1L
	4pkrsPGjFMnbflusKoU=; b=HkRp8tNlH/IHx4K+SnRTdTHTNZmewDVb125mi4ug
	0PNYhPRbnIzlTF9dttHZ2bv7GvVrhlYbAU6zCArXK71VDab/lX8OkmFNzgq10Hs2
	TqRgCFQnVPisJDEHHu1wLnwuDBZIXnfB3zRlmeFTKOkb/y0l/AVKVoOBA1bNDOl/
	AGns92zlCbYMecR8cQpSHf9FXLmGLBOS+D1bJoS2rkeRN6k7ViMmep8m1i8vhG3z
	+t4IyK+O5SlJEiJ6fg3U2Tq9Vg+oprgYeIyXycLOUxvJJFyD7i1EsFxc/gCI4pqA
	JGKB5lDNX5acXmPJg/bu2SE9u/jFTagrp7HxN3070qH0qA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmc3hq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:08:29 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-998a2b06e4eso742948241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420508; x=1795025308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mek+GhpJgbAlj6PFKAaMZa1L4pkrsPGjFMnbflusKoU=;
        b=USZQXkZtLVycy5Vz/3x6ZU2k6y206q2Gzc6VpDYwi+JihZ+B2TGrRGQG2bL7rmJbLr
         cwqYjkzsYlZjf3zw9eSizLUjnpWTIgwMnRKyI5hcrbqd3aUWuKRCNnMXXrhGHaWx/4m/
         7TXgNd9GS9swz/b2bKKp/bxPplqt7yuDcMoBcNBV/2qBMEwmtXSLBoJQiN0H82gLlm3w
         JVFLN+K6FRNW/70A3+cLD1B/0fZD90V1FmjDGyGTY+RSM+Gav8vi/iNl/z8GkCcivTu/
         6v99shOLb68mA4FpSGnsHOgV0WZoDZHE6GYpPhswKTbpPhmTk2aYPtCqSZ43sg04JV3G
         KqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420508; x=1795025308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mek+GhpJgbAlj6PFKAaMZa1L4pkrsPGjFMnbflusKoU=;
        b=kY0jtRxRAjz1Jr0S6wKiKnKkrgunHsxcAmHxAJnFcgdPou1u8aYkJ6rHC09GKg1fzE
         Jps4koFmg/mOND/72nyA2Pjnm1mwGG60qsvC5MjuxYoygm6E2dqKLYhuSm1OUPEV1QqF
         D1lsn/qVeAvux4VufJ/Ni/PZfaM51ZnXWCMYTR0LvWdsoE9TJ88htTw+3HG/op9uzPl+
         MV/H118/h3184Qk4ZgbmnfrWW8ZXjq2xSHss25P72pCz84N8E2uxF/qZT8QV8whQVVng
         y81t4wWy6ThNu2OvcBfmPRmlLmyl3Ui62X385EW/BCpl642kF1zoXTMdJ4Qs83TdjqkE
         4lCg==
X-Forwarded-Encrypted: i=1; AL+hErFfYF8aLI3UVBguB//k4gpphjE4y+jkRF3TZrz8Swgfg7oMy3PDcVlqZqkV9qdJG8cu4/GOSIs9FnW/PPwF@vger.kernel.org
X-Gm-Message-State: APuU4Z+sj7CJrl8thXMa7MxCbPb8nJhxYSCGmur0qt4s9RuBhD+ns52z
	eCyX8arZQ7VZBnMDcd+K0q+HLPutWz/wAvLhRTHhaOxmxMWHbOSSzciY349wgqyuSeTn37IV75P
	2Lr6J2bscLX2HX4YBgesP0xwmKhTOZa1dMVIgLcqEI9SxR+XKHb/EZAghqMD5vOn4GtyJ
X-Gm-Gg: AYBFou2JrxauKvXF1aPukL4WfGb7cvSqNkuFrx2HCnBkFWdACJYU0gwQoHUr+3WKDZe
	H21jdom+Q17Iy5Bg9EKl/NrYwA3Xjm4PJ/9nW6cIfkNfn8YefR5wyvhQOfQnArth7kts/eKKP3u
	rhs3084QKNrrFnXmPQ1v8M0TlFu2SKrgOGcB/GuJnP1mq1KeH8MJWWy+Z86VW8NEt3ONiSueN+r
	iget6P7yYiavBFuJ+2P7obMfzQYVe7iwSOaBLqkG0lm25PUvNLdkS+5extM6VzCT73oCQdq93C7
	LHBRI/7meaLYto0jpOv2RoprqWS9MWKaTUAjgDwdMKv/oox/1PcB/rBJk4y5LY+NcVl3JIYBRRT
	SjOdMwyCKJ1emURCIeliUX4u9F12D0x/i3LUNUjgyQnqAUeRJVSMV3ASpDS0KLU5Myfzme6JfHz
	sGgbAAA23Fe60IFZO8cQeyoiu76fkjNu1E96zkkwruiM6VFiz0ZRxPNeE3JO7OcQ==
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr1096424137.37.1794420508197;
        Wed, 11 Nov 2026 10:08:28 -0800 (PST)
X-Received: by 2002:a05:6102:334c:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7d50615aa99mr1096382137.37.1794420507572;
        Wed, 11 Nov 2026 10:08:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae09224efdsm13131431fa.14.2026.11.11.10.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:08:26 -0800 (PST)
Date: Wed, 11 Nov 2026 20:08:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
Message-ID: <qobhsifyot6ahopugvgsmtzvd3oby43vg3yhjxjf5r72zdohhz@4r4et7fookge>
References: <20261110-display-msm-of-graph-v1-0-0f3106f817b4@oss.qualcomm.com>
 <20261110-display-msm-of-graph-v1-2-0f3106f817b4@oss.qualcomm.com>
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
In-Reply-To: <20261110-display-msm-of-graph-v1-2-0f3106f817b4@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 74QYyfIL9EWUPtC7jBc2bc4wTbKMyJRg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX5K+dBsepZqeQ
 U+96IC8Vh3H5pZNx5kJ05leFWZ+sFQl1OmVLRL5aYMRe4ZoacUJUz6S8gBOVbLCydmVG8ATsWXN
 LNds8hjza0p1hrbV0gZ9S9UpueYaEBo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX92qP7IUAM9Ld
 SGl3IJyhG8TpkAKp6IPWmcfMVjQbkCPie95jOWA5kcARcl+Ya863fTfuaMU0uPf0d2RWXa8C4bs
 GWloWy1USAAQbiLUzRJxvLV2YU5L9V6r2cx6kZOhAXAwSU0H8fxDGblsCDxv1tyCxcU5b6iJCec
 +2iwN1/GN4vDkzoId4YKw1D/IOLwY2/f301ExrDjEuqBTtrW2bceRfzH2bvk9tBjLcunM0aWkqF
 1dTxL4oGdWrlCuy/XreROSf6zvZ0KvOAJmhRwep1qGoUw2lA2ESvkvGpBy6G5YGS8xA4m5l+ygV
 mMDfSXgulhWzDNeVMIPK1i9Jzy2NnIjdfVkZt2Z687VqVEPo4GK1bwlI6TiAOUbTrxem3LHl9q0
 v96CIZ3UwjUAxga57LHqOoJD87+ANR1rFDLNi01PPVk+Xbs/vdVuVOVgcTv8frzOqibQ5Vxouhu
 cm16fPXeSfO9qLnXvTA==
X-Proofpoint-GUID: 74QYyfIL9EWUPtC7jBc2bc4wTbKMyJRg
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4af1d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=udFPpGrmtiWedX3Zxo8A:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Tue, Nov 10, 2026 at 01:57:43PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996-oneplus-common.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
