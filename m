Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBBB43933F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669885; cv=none; b=ZgPbOekAM3dcfozvPRaYP+5hlTZJrWR1JQZP9H8QE6KtBsojmdjJfUsseWxh++b51GKrmBJmHpTjFEQudj40ZDIVBu5yTIpts+PUhTPb9or/Yvej0KCNi8wQ1eAaviYSXwzoOgYt4RFZJAkQA5e1KfXMMcrmLCfRJCz3GOBPock=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669885; c=relaxed/simple;
	bh=4Vc4LLoXb8IdFlbthM8VmyQ/2GF8tCJAvXydwEaK8k4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X45ESS6W8XF1PvQ6TAm53HYVylTbNX2Wnwb8iCPsaoq7YButhfEgHfMsJm9k56tksi5OZDcv5JwwayA3CkN9Gm+TNTe4oplUUv0kEujXSsPXLNPEVpDtgVUT8kHvCqWEuFXgfbzzdIefVqd3SbknXUtjaK6sog9llJypnd71deU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JF+08X0L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M0wigpz5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JF+08X0L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M0wigpz5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKllFb2701838
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ok9fniegEQfDj1/O2qO8zWDl
	AsO/LiCXdrMzntWc0G0=; b=JF+08X0LVz766AYEYWpO/zBAVP2Cf3PfIP/xm8yu
	7eAklh7Udbiuv6LmDxn3arDOIt861pmLNa8p7L/GrkxcUEduZuBP5g/A3sRFFoIQ
	WRHn+26XYfBoVPNrBkNkmn0/o1+fSQE9hXMXUfxtL9n4HRDjr70+SxCwAdQAaS+S
	vDTzQ8ub4TDGgrgOF6DTtdnMnNIuPu2SI89QYGCGgsAHQqe+xEjpLhd/AzQj5MLy
	LyWLKxUt6EV9lnoWWA+eJEs5KHb2d7yxOnqKgi03SReH/LH5dX5yodZ8LZdNNjfP
	BhdsXKdlWWJm+1gb6VOlTRBe2EuR/VPqbtnYcumApI7r4A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeacbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:37:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52769fc3f2eso13662641cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669877; x=1785274677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ok9fniegEQfDj1/O2qO8zWDlAsO/LiCXdrMzntWc0G0=;
        b=M0wigpz55XAZXarqd8GJ+p9EDNrRHZZ/vfEgQZ8xKcJMQ0udtcsoZaa6XrAyytP/Cn
         WUHy4fhfziTdgMDWcaju3FxD4NY6xzSvoMwsxqchRvnsPBWUlnfuhyktO5Y8GbqnTOig
         0yxCTk2FFrWUt4Rgt00Ea4cHQXnOn4j9qlUadxwd3IBvCp/v+YsXJO0IQs5vur0jb3vR
         E7sIblG92v+9kLUOnv9f4QjHdByMfDPxDrrFmRBaTDjEL6FkQEJ6GowuFSG2p/fHH5mF
         7PUmChrrA7bwbW+Q7vE29yRgSiopCqWsDqMboHoizWhDbYhAxdmHs1rUmkDhlcJgTedY
         lb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669877; x=1785274677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ok9fniegEQfDj1/O2qO8zWDlAsO/LiCXdrMzntWc0G0=;
        b=K5nqKB9+wvXevmxZxWd4DLp3cZ43LkdaxXp0CoJyEwCwl4EUheN+XP9rvMPr39eazw
         w24dot2QMZs7a4zRuGhMcXyowgfpsOTJXEuJs0WTA+5siXLY60ZP8EC3P0KUhQzb6udL
         fPgAsrOS56epiabFLZRpkXA4ciXAcrLhp91sCl905FOmDP6qYxFVpUWbVasNdAPmgmPs
         7Mq9BZOwITNXQdmd72TcAiJbf2ZqlQpiGA8Ial/HF7/TuSo7YTAKJTge1ucsllfhwEpj
         /+iwLpgh6Uu9pilDa+pJk3uxR9Cd2kUSb6slps1i/dX/qPJooZMiI+ScvfmmuMVbE0e+
         MP2A==
X-Forwarded-Encrypted: i=1; AHgh+Rr5zume6zDbhalUB46vyXa8TsXFSx+30rX6CMktVoh3qMLQkd7uUPihQgdXdKC2rS3I885VsOQt3Vlca0aZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpdqv5QH49UPUMi/HmRSosW4awjzogxgQIY3TtOrHw0sx5137j
	6/RWKSGbqXUKquY2OTbCCGUlb+P0jzA8j1tfj7h96CtkLhfspfg91cBwQSVI9kuVL9X9ReAWs/g
	JnqGeAloH4NKNE46TkK22DdCYZeQqCI20lT+GyuD+IepQ2UxRsXFXXcHLaAQeOBxFQnrU
X-Gm-Gg: AfdE7cn8JiwEzFKNUJMMEBOzL/FKcotW35m9ohlGb06BQNq8oIZH2YTgrD3spJRHqTS
	J6niee6BeIVrulQsYnSTt9gnlSt1kutojo8fRZOXIyPgfaxMnlwlSIHsr+KUHMvY5aizi9Kchvb
	rzpBBs34+08w/dlThiVejA3neZnKXTqbajr9HvcwakGvmkwFMGqUgeWZvAbkrSOYRWk2xYV8joh
	zwQl/GLaChBpY28UzghP1zwPulhd8k62yhm+0iK6+6hvlwN8McC5rAf8CO/p0SfcFvqfGG/wRYH
	CEPgyxp7k+Tq1iOEVGOag/q67viQubZnDUC3cMzii+/WP0+q83vSaYCVHOqAM9LdByuKKjwnlpq
	aLQaUK6g3P/in9orWyQ0sMocEQYtiBDZRBZnZjolS7x8EzL2Q+h5x5EL21edouXsz6A1TSddPUk
	U75SWdRaH6niHAbw==
X-Received: by 2002:a05:622a:1307:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-5213c9db3f6mr193033791cf.26.1784669876352;
        Tue, 21 Jul 2026 14:37:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1307:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-5213c9db3f6mr193033611cf.26.1784669875964;
        Tue, 21 Jul 2026 14:37:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d30d9asm128181e87.44.2026.07.21.14.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:37:53 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:37:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: Enable USB controllers on
 Shikra CQS platform
Message-ID: <mh63jqjocq2mm6h5dpqck6okfmsugjg7frrehmd5t6f3mynojc@tpfnitctm6ye>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-2-2e7a092d7f27@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: GH4FOPOIGxeZXbrGyLseTEpOt2cBpvOb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfX/vo/Rr0oKxez
 RAt/UueZvsonxSkikVj1kjzQ5Dv+PfnSRds4WWG2/xFF6REv108jkedulgmvQh+dlYN50JTz/Sv
 GBlbBBkHrF2obL5vg6n5qnZr90Qryns=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfX1qsyGf5oUvUm
 0Umq4X20p3lPRuS4s+Qvmq9ESu9YFxdna4YI6Qx+/10KIIIRTxp8kZbr9psZttxZdyj3q70mymR
 SdqXJtVRIVD7R8njh7LG36ROKsSDYi/er2Qadg/rloOcyCNF15dE+Mg+2/3PJFi1R8uJat2P7Zl
 kY6p2bIDTO29T23xxVKbG6oMYEPdW5x3/IXKBuIPoBgn1kxaYeYlqA0k0ckd0irUGMDKB6/BjyC
 KpJSIK6KtWuyWt190VVJSUk6arv478DRRaH78Ts9W7aA6lrRFRL7qq6YUkK+KSGv7MTYMJg2sDX
 AZRT7gicW070sdn36ELGAdMvCGRaxMooddkqniguez9ztdlQLrmMV8t/PKQ+0QrhOfjrQx9ChvX
 d46Y0hqhQJ/bbx60PrlKqrZRKS0JcdnwuW81zpUO1UF7mpAFJwk5yhrA/sHXbX3m6DkbyTCwbEm
 EeH5rcpxWiheTTUElHA==
X-Proofpoint-GUID: GH4FOPOIGxeZXbrGyLseTEpOt2cBpvOb
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5fe6b5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=J2N_nXOhfcilw9lcM9MA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210224

On Tue, Jul 21, 2026 at 03:23:46PM +0530, Krishna Kurapati wrote:
> Enable both USB controllers in device mode on Shikra CQS platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> index b3f19a64d7ae..006e24a62f5c 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
> @@ -38,3 +38,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";

Why is peripheral-only?

> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry
