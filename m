Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420869;
	b=nR+Cf2ZQcNfgIbsw3mDGHzibfoG0Sd6JKzTALXNCTQ/eSzFbu9Dk1oVSIG7U5yGVqTQ+
	 B4khEOqBgJDKiNWWx2/L8xqGXSiQEz+MQte8TSWxoE2ngQS5cyGCPUMa6qW3n7lwGKBDq
	 xlrPSP6ivO20TGevguo17CLgjTsIiypgHZ3nDs3IEWHu/bCnKmfqeYE474erVRo1ILsXp
	 Fl+mICmhg1BP9fi7PPS3IEZyp2APYoQJ9kvyveC2M02BoblyPbICTJ4etj/IvKj+bAFQY
	 o69bf9MHJsz7ZqwTPd/3+2Q1odm6jJ4pWt3v+zXrKY93b0nWCVTk54lovIXCEPfGo+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420869;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EVDD0ZIf0hmd9TQw5ueEix5rvkoEax8Jzcz8T9iUU8o=;
	b=rWZfooFfLesm1tYoH1OSMHMOF3GqjNj+K2FaSs7KVYkjUMowzRamtgK9LRsdMr4kr0vl
	 KGX8z4u2HVN5VYZNIqJpx3p11CExUNbfZWauOfsLXyy65AD+IrQGJBSKr9lCtFxubTvfF
	 QMHhR0UCq9U8PCquS1xmLS3/5RcWal+LSxfX7ITxLZDgq6M5fyKyaxgquLVDg5VmKHnBI
	 swYBuGYP+vwE2PE1p4PyrBMHkwO9O/hzqaoXSJd/ybHP77hpC0+U0A1v/J+QL+5DdcwSI
	 E5wFx3PUud7CG6iK8r/0S3Q7byRv6ojttwRF9cK8iTlhGLvoMTKRt9fXd7L5w6ctWuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuONsJl1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHLpRWXg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238B8606D73D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 238B8606D73D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuONsJl1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHLpRWXg
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtMc03041677
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EVDD0ZIf0hmd9TQw5ueEix5r
	vkoEax8Jzcz8T9iUU8o=; b=NuONsJl14mEotLSRpoxfRhUuboX5vi8srBBzXDdz
	n26rpdrbVtVMOGXsT4z7KXPpMSu4bvOmar6YXOj/HAnpI9UumXpWDjlX9gy/CIGs
	qw0lgkC0KCTfsI4n1PsoxSEuPXjaZT01c4ecsmjM8kXPyEBR4t41ECPZ8rmlFNgN
	W4IRTefM3QCwYD3jzXhCanx14hrAePIZLqO1vBsz5kdsBex9bXEAtC7osJojjaLJ
	QUsX0PmNR9ashmm++NT7CSGGyFmOWGi4vssF/Nr7y5RgSOd+uRULSaWwQivpC8kn
	I573ti4CU+RX5egjnmUJEqvA6Wds/iJO2qfVzM2DdjIZeA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmc4fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 18:14:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso577889485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 10:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420863; x=1795025663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVDD0ZIf0hmd9TQw5ueEix5rvkoEax8Jzcz8T9iUU8o=;
        b=jHLpRWXgKJbBr0KI40phKI3MHFfnG8u9YbIoQ5VHrek5V/k54VZJsaziDl/3czMIC+
         BPNWyWC504TwpMi86dRADRWMwAqps3lrb6aWvM2T5jFOjle4Cn79Xk+c71puhvtsDadN
         wy9j8LJ7fCIfCMJhd41fOiaN12NjwJ6ScXWSdv/4m/Gm8Bzi2xJbtpQfrrm67wwvMz/h
         JY4w5g89bAZX3lo45gQJynExe6YUKCVxSHfTYs3zepQa+U4hz8kfX9eBl/LemX30//Ra
         KYNkEHqsVCTuTDe76snTNLJtAxlf2tyySDd9PDHRzgvpD0mBPpC8yc6nMSCiR+IL8REs
         hl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420863; x=1795025663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVDD0ZIf0hmd9TQw5ueEix5rvkoEax8Jzcz8T9iUU8o=;
        b=Y6OdH8w3ixVc42mYYxnALbVesvmvIflzliWXOOIXS8xODgTPE9BNu32BsWNKf3r3Dj
         YOhEAJ3X+hwU60EhGq4sSVREuR6VNa5ntF/21Y0cFG4aGJyG0ieTVXcAEbHl1wUvoDLd
         n2rkp6S6QGKiydFSOcbtkO+ys9lV/JE6g9uHBK2DxlXnGosJASLeajfIWlfP/9WuOWAg
         TXQMAStrdIlurJUdYhUxaVFw0xFITFr9hSE9AuOL4NVa1p/OJc9jlyK9ODMf59tykbEi
         +aC7IVYpuNbmSm/tl9HlmbBhd0gmkzXzxJUKF2T0t5UkCIY218C9JcUfjHjeQYUtXmvb
         dxIQ==
X-Forwarded-Encrypted: i=1; AL+hErHZXLTzayW6Bt9KgdgsV6Ia8vujiOPcWe+vUAKPD1uZ+g1zBn8+GokS9whQRsfpky807i6UB4M0DkSe2+NY@vger.kernel.org
X-Gm-Message-State: APuU4Z92W6DRW5WUP+Af5NxSDSKg9rZzTcvBwKG5xTYRgYu8RlaOjIMA
	3PhCI1wqfgYeLW7D9USNlWp0rMPJSvQUWDz4ey6DFqKTUnDIOlEXYscF+PpI+kVaT618r3mfdWH
	Zo6H/egMeHKuPogSrqG0nV9YKVvglYLQqglCsDIiiIRxFz0oea3OubY7s9j0Gparqj1nq
X-Gm-Gg: AYBFou33UNLkT5/TXbhNXFXrm1rVr5OU5roEKnYeY/vdIBQrlDyHrkjScvxV2iHuM/r
	L/XFG+Q0ohj5zSvfegJqYoqJp+b4kzJivIQtboC1Dt3EMaXjU63txExRe6H59jQPeoBiNxJ9SLk
	OLmEXpJXt78oWOJ4/4WC6Q0SQhRRIqNoOctwqOY8IH++5RD/upLOJuC87nKn1joZv7NiIbgtxcy
	uCRl+Z1Tn/fhV8Oxxs2i2cKanb2ZVCpSHL+LHq2rmnXCgPicjsPpNVcxQESKmcTIfxVQd57jaoD
	pBbpCncgRyAlPCGu/7+LYoC9c4EPeFy4kiw/rWko+gKIv9IuSzOG5c3mV/gOMXsoSXnTDfoDrZj
	YELc60JkioXjO/gUmIfVl8hmSxYu/mGU8d3jEt55zg1OpW8wcC1EBzk9Zm002npUvcck9mcXLKr
	eJlDjVx71mHHCCxPpMxF9hoR0rSiw2lMxFuE2z7ym817GlAWR4qq8zFjdvtLIUqg==
X-Received: by 2002:a05:620a:6cc1:b0:93f:334e:df21 with SMTP id af79cd13be357-947b007b8c2mr552403785a.62.1794420863130;
        Wed, 11 Nov 2026 10:14:23 -0800 (PST)
X-Received: by 2002:a05:620a:6cc1:b0:93f:334e:df21 with SMTP id af79cd13be357-947b007b8c2mr552371285a.62.1794420860004;
        Wed, 11 Nov 2026 10:14:20 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae115a2e05sm6552871fa.19.2026.11.11.10.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:14:19 -0800 (PST)
Date: Wed, 11 Nov 2026 20:14:16 +0200
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
Message-ID: <dkplnfllwn2zlx36yh43lynz6qwcnzp4af7l5d6yph32shcy7g@cup3aqkgevw4>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
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
In-Reply-To: <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6quBLA9YFyk2lDLUR4GMFwEGV3n6s1PK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX2L9qwu0porLC
 bRFB9ejY3jYrh7iAp2ldArmd53+CbmtQm5ZAx9DbegMVlT1SlCOtxeOezy+Lxj83Ypb3XT9ljtW
 i4wjWWLO/KtsuYf6yToz9KNCyR9TQMo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXw/hSolTGbRtC
 zumzdd1ZCALKXkFjJXdQvl65S9kafVGHh8zMrjALCbpNuWvijOC3kHAQ3SLqrJSstRTBl8uzC+H
 xuj8zTu+gfHw4lT+yIewGGtlcCeNsjKXi7VMnKqatoSB1hwMwG3NS4IRnJxeX9yX4BXzNYbRWWZ
 JwjUYwqBhQfx1gAwxXdCEpB2z/k7ioi56fLf2XJl5sUyABOqAXhJCJSq3rHAs6BmxQi7/JWsumb
 3z3DwkGKo4mc/0FNuhfruUXDPbPe1urdNiz3lk5xQpiwa6afglWxnRGtqoSbwWtiUAq12aJ6TJM
 il/VRo7uvWgmEDMKLYWJI1BjcKnyYbfTQw6Sucyg0XCHsHDkhLTHlkc2j/XNx1afF3Y+8xMHPml
 MkE/yO9IkoT5Dy3S9Dcn/GLPKZTynwVnOyswhJqCkNEb55eX0HEeDCY4wnp6lE+Px0c3Kf7NHjm
 hdLqLuD31T4hkOXnb4g==
X-Proofpoint-GUID: 6quBLA9YFyk2lDLUR4GMFwEGV3n6s1PK
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4b083 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FelehbBqFq-cYOsUXMkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:01PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
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
