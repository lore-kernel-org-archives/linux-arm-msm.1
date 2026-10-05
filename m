Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D812741A0
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 01:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791162377; cv=none; b=JfWTCSeF1u2UB1Fi8DfV4Vy2cbLtZPjvn9bIlKN8FfNkpEd8SsdvpJvBNYOWcus2sy/Kl1Rqpbnd0ADx5H8FTO/CNNOIigjMlMWS/51YZ62vdODDYZw/tytCRNme4zl7fo+q/lD2Olmnr3eqV5u6hlIACk/sb+Jmqk555qobdPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791162377; c=relaxed/simple;
	bh=pdeXZ1cEruzDL+CWGUpzxxXCMKVZYF/YnvDigSi07po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DU7hDl/oWhEWg44atjBXxCnPQOMNGOTr2hmFqRTBhlhXdQBCYUpClYCi7ODD0ctquvbdTFrACT7ydKChDhz4f3q2CmlPwaF0otUmYi7ChfEhBITZHF4roGGGvj/CdSrStqCYbmrB3lnpeOxPoyNiueffPzBmbS/wrNxUtKoCpmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvoqzNZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ddk7zG5E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvoqzNZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ddk7zG5E"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510RGq3688775
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 01:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=57RP371wUSCZPw6u6uxhcm1e
	ciD0zGPP4tFb3PYgbLI=; b=PvoqzNZd5o6PSmM8Cn2262wbRN5h7S1ueXgX376k
	QilApoBgoEFeAXV3zA0jlxlL7dLP8ORCvzcPLb1MVuEa6ZaLbF4axqleA5yth53p
	mcTrxzaPcuAl6u28Q4+Xx2QW/XCBouMxcUaespB3fkj2WV6hpka7K3AFI+8J1UF3
	Q9Zp4Pm76GjAZ6D/KUv+GyMzGE43parIPH836FLbZq9F3Zn3251ALSXUvdWeAdct
	ml5L5mYgOTD2yolt/1+mZ7IQBxWHyxgc6JTWnfGLkQASDXfC24qq6BP7mKawD7Q2
	txc+Ssrz3o6TrxlizeHBDh5FXBxBTgfVfCC+nl7T8iE9ig==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfj025-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 01:06:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso632086e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 18:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791162374; x=1791767174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=57RP371wUSCZPw6u6uxhcm1eciD0zGPP4tFb3PYgbLI=;
        b=ddk7zG5E+t30euQyOWbE6nmaSM/Y0UuU7TRwVJ+azmactcy4XLLkWFwdPVJNhW5NLa
         2v/OfT3UXSz/tRINY0BoVpL/Uep/acNhFkI4yP5S+LeZo/9gPnTxDI7SsNmPTRecWRds
         6G6ErLotkHUohkbyYLG5Ut/x1WjI9MySo4bnXZjdPw1rlGZaEHIAO4/OSwoOFrc+Z4Iz
         0QHrvgtVnuZEisMtdA45L5DBZmSs4lbsovdrllP8rH76qKPXI/k5Vaj0qRFH1PvojxWT
         v+br9hmvGMwD6Ve+F2gX/ktvuA5TXLxVNcrLsdupHBHw/Px4RnDyM7k22cTFr1avEx1T
         xQ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791162374; x=1791767174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=57RP371wUSCZPw6u6uxhcm1eciD0zGPP4tFb3PYgbLI=;
        b=1/DZMOSUXChyskLrsu8W9uhtH5vxASeQhae279i7yLeFMBYBGqitOOUGmvSRS0qR+F
         92fCnSnOgd3irExnTxBe4lsxHqnaNetLLQw1R8ztPqxY3KpLePCQm7yQ2SjcPN/2WosS
         E7LctUZiI7C8e1HZYyRBNSNrU/KeAAhGrbSgmUPxDNeCqtU8M1sVf7rz4DnI9E/ZIahd
         CanGOiRPeAA6LlWJeufsvNkd8qmMyBxN+I/9LCe8sXBXOkWmnNusHyOekdFiTyEdCEJU
         oYCM+wsu+2Fr0gO11cqkzLLys7cx/3u7KHn/dMPwsaiJqWaOBX/VnqNoddUFU48Lkc8R
         AhSw==
X-Forwarded-Encrypted: i=1; AKwUvBzL7qWtstB21oc9OqdOiVP4ex+S8YOGRlgauBoSsiD1UBKpekcnX1MWHT51DnEoMCLcE7muhKXuP+J3lqrr@vger.kernel.org
X-Gm-Message-State: AFq9FYJesUeLFd66PX3WPG+tQz4vbzCewU3cB29RDFnALZsDPADIdRxc
	aeeOnLb7A/s/0+YwOc1R0BKsvEpc9CUQFJmzWHy/n1J1ll6JlSYM89LgmhYGzzp8JGlwSVcSbfe
	+69FDaNkaJ7+4mmL3+gSIN9CZpkzX7D3voSt3xwtAhP9MzTxzTp1wx1OXSrDL2oZyKraR
X-Gm-Gg: AYBFou0WcbJfCkryoLdD/qjnOk+I5/gEjBQvOohsUbW7X5IkBMuHjTA7BqS2q3EjOnm
	n88bC6N1XgJdQoinrQIkJdhiIVgYYeo9viEwrUi9MqYG6zaeQxmhKn8FoSGphVtOGVWXJJu80Lc
	x5dCgg64wPSX3rGxhJnnQVAuEI5yWqtvrfjaeXpRoiSyoQuiYk8ap6V7cbtLIrwF4eomMTQMLO6
	7OkZ3yl6YsTX6liPVZ3+vORUgmGnhc+VJAurnadhZbGsjOZUD8QV5CGPGUmUwqDfMxgahvFx/uQ
	UeqXZmvBcBW0bNZ3iEiVJKYd3i0KCpppsUHxf3EuPwlc3W6PfGou2E5Db73fVR6FzuIjGQD56Vf
	O5Vlwc6o9j32rBNQ2kJwy3w4ziB4kMczQKhMk4JfatQNh9vYZPP3SigSqNhXJhJKaRFwSMhICe4
	CKoLwPEF7iypDW
X-Received: by 2002:a05:6102:449a:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7c39464f65fmr744639137.2.1791162374350;
        Sun, 04 Oct 2026 18:06:14 -0700 (PDT)
X-Received: by 2002:a05:6102:449a:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7c39464f65fmr744633137.2.1791162373891;
        Sun, 04 Oct 2026 18:06:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303896sm35500531fa.19.2026.10.04.18.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 18:06:12 -0700 (PDT)
Date: Mon, 5 Oct 2026 04:06:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
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
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add INT2 GDSC to Kaanapali DPU
Message-ID: <epga5fcyf2d3esucs5ulht4s7ixwpwlb35iygz63aqeefruc2m@mwmmkaw2z5r2>
References: <20260915-msm_gdsc2-v2-0-9157237b8382@oss.qualcomm.com>
 <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-msm_gdsc2-v2-3-9157237b8382@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aZdquwENNL1MVtCpb55hE7zwNX9_ESG4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAwNCBTYWx0ZWRfX8BOYCbZajsjE
 oAqrJ8kEJVOIp91BIKGIJz8pmIhBEULMwWSfkhAZcccqbmp2CG+h457LN7SCfXN8E0iKr///bWh
 5oPfLe9Cn2olOwt9qUEhHZctN3CEoWI=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac2f807 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ES-ZHpzwIs2e-kRI9IwA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-GUID: aZdquwENNL1MVtCpb55hE7zwNX9_ESG4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAwNCBTYWx0ZWRfX1GlIXKSJSMlp
 baxK7BiI4c5yYysoPQii8L3qJB1YH2YvkYY298hU4oNdZ+yXS07NrEaH05AU+Qii8DLBbFPx3zz
 1BHCpcrdwoDkZ4vY4tVqeN3TI+If3Pk6VXFK9yp6prXcJ2veQfeJEJKjDcxRdku2ZloB9zvKooZ
 GfO+fJzUuDVV+NU8qsWDc8W+5kk6qtjc3gG7ZoI42Pmmhz26h8vo9Lg+Equ+3KYTvSz//lTIUeC
 1J5yKy8h39VvpawO2eQpn1nDcJuAKi8tASMmqZkBioZykbBoNV+6SyJHboZNx90DIf4InyP1rFT
 JVEYVkRC9Qksfld0i4LptoHYxTv9rv2KHTc3qqrQXqj8ENUdTCXB+8aPrrvh0CEXgQ605SPEiVg
 oiwd2bjle/a/6X/1odC9ZWpCdPp6TCIRiD3wJPhOyaAUTzVlv/phY5dE5EPDK47lUEiqaKI5Wzd
 Z7oximbYe1v2e70BS9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050004

On Tue, Sep 15, 2026 at 05:27:50PM +0800, Yongxing Mou wrote:
> The INT2 GDSC on Kaanapali (SM8850) powers a subset of the DPU
> source pipes (VIG2/VIG3/DMA5). Add it as a second power domain of
> the display-controller (DPU) node, alongside the existing MMCX
> performance-state power domain.
> 
> The MDSS node's CORE_GDSC is unaffected, since it continues to power
> the rest of the MDSS hardware on its own.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index ace19b8b12d7..b3e3cd1d311c 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -3619,7 +3619,9 @@ mdss_mdp: display-controller@9801000 {
>  
>  				operating-points-v2 = <&mdp_opp_table>;
>  
> -				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +				power-domains = <&rpmhpd RPMHPD_MMCX>,

Should it continue to be RPMHPD_MMCX or should it become
DISP_CC_MDSS_CORE_GDSC?

> +						<&dispcc DISP_CC_MDSS_CORE_INT2_GDSC>;
> +				power-domain-names = "mmcx", "int2";
>  
>  				ports {
>  					#address-cells = <1>;
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
