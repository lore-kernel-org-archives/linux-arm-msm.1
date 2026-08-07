Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8223A8743
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786093174; cv=none; b=pd4mAvP+Ybwtmp5Ax81D7LIUIM7LKTTV4NIXIG7oeccj80vJMUp9Dy+JzPZVzufTCfLZ35ksb0xmuLbDE6mA6XgJU/WJIDFqye5dMDilEXw/DNEVFH7XfK4Ef3tk6A0Y2ry8Gof6ZCYw9YLfLo5h/kAW4BGJAsvdvDjd2rVfDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786093174; c=relaxed/simple;
	bh=m3cLy8H7aVTQ/HOLBPrz36pUo2fFlg/U3/FjPrkCskw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fuLLXljFh29mxnAyTO92Qx/+95khEbuC6aKlx1P1gOngsFbj+deL4Wgo9aiBWbBHQMgFF1BgSdblvi0Y7Hd+QuKYKGX0hvSzMmFNXhIfC8ACpqFEdfWGBVJPadYodAzbrFKys0CpBUpDsjeBhtDpZ9XAiMG0Kzco+96dwySo0ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxIVn4bo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZWG2kkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxIVn4bo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZWG2kkd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778IohJ492960
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 08:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fFyfIfef40XBEj4qjtduNFV7
	B9VtZ3DAarqWCGGTDZ0=; b=GxIVn4boWmI2w6nAwtgqzNFjwmvjimW0rguMkDhq
	ql05pNq9hJ8joL0n4+lZJ3wZuhznCW6+M55/O4u+RVVUxfucZ/8sVn08sqK1Men9
	fhFyG17N2FNokunoMmZAl/NqHXwrB5huZL7tORQ6axcSbbFJ210o6wYubwANlhvP
	qltbxJoe1KzVCi7Br8DhH6anrugoBz+ZxI60SIIzHAsmynv+3dDM5HNmj7XVBeZY
	0ujhTbTt+scEag4BU/ov4E4domT2LH52Si+uW+PkUuid0nX6FGkDLAYbwi6T9WLq
	dTF1dK8sjSmMm8C/eD+gxuu6fS+FwMfwnTbh2MlbCKl/Qg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rb2kn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 08:59:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so33173711cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786093171; x=1786697971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fFyfIfef40XBEj4qjtduNFV7B9VtZ3DAarqWCGGTDZ0=;
        b=gZWG2kkdHMn8dE5/ZoIGmQoXttug8WcPSG4Uxy1hBDn6RcJV4XiCQCGrJf+bwewD3r
         GCMtuoKZyKSNALS3NNDYeTPpGoibOcQMs9Pks1lKNC77hBUWlvtOpTccBaBpnWhzcblA
         ev7PZmUmtjTz0vbDKpVqwv3F4LaMNwNyS5G/5INilBnYOoW2XrjmmXaVtYCGKkuQMfd7
         EKzWAP9VwzOU73lxtcRMZqKWL4O1uHYZJnddZMckgZtb5T3lww8CNAPiwsGSwU2lcLtW
         tzcZckwLNVN9dT4FeZfa8Bf5+7jlA2HNCtYADlHKmYOjJxe8dbJSVl4oLFzwIDf7rcUX
         Q6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786093171; x=1786697971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fFyfIfef40XBEj4qjtduNFV7B9VtZ3DAarqWCGGTDZ0=;
        b=VIHc2W0MkWEsyz88Vy3G8ackX/aqAlousVxIg55glTUIiiIMhi0e+Mhny4tmOVjEW5
         9OKoltInjMkcB2E/Y3frV58dIlx3Cdu1YT+pUtKIfs0uyWP8kzclkW3u8x31rhj71pL3
         9ifDEPNfRdGNqYwuLCVnKVEoe8dVwRLzk9oF+NwwqlbBfJa6HZJRvg4XSPP4vCo7MPnm
         nvbX1iF7AjPSdvmgqNvdE7lgCRQ5W+zQstv/MKPb3St0XNgJP2Unip5MccghHrqSR4jY
         2d3HrjAI0Toh76QcdWOg0yS2FNI2wwz0XsvUJSfUOtiNHsZmn4emvgLZ6UJ3B73ZGdIq
         QvSw==
X-Forwarded-Encrypted: i=1; AHgh+RpVkevKG71vpFp9Eraegq+FzBO4E12A4sbYmoVBrvz1wThC+9AGhqk7U1+4kaA2vSg1XJOCqHeBYrvBF9f3@vger.kernel.org
X-Gm-Message-State: AOJu0YwYpPOPQ9+YOIuvRYwzGQykQl1aLO6/mIAu+XGDzfZZih8qKb31
	uFdq1lb3e7nv8Qn/nSxoElunquR2jvtHCSiYyyIE3+zT3c90/qzDjW4pg//j830kvkT7+0bMyMR
	vdUG9SdJHtH2jo7dtt46lkqNgvNbn5uemFSpOOJ7W1z52RbAApsBiByATNkuwRImodD/v
X-Gm-Gg: AR+sD13swWj6CfWgBdcU1rpzXYPM85UvROzktbWUIf6MWXhzaXGy4XzdG0/lORxJfWd
	wcVOOxzeEt0sDNIlVZ3JU+DQaeKaNasObADSoeGc+qxddpbVbzBoizwqHTHD3rZDdvc2TKM36jz
	Dghz88Nw9wUPj/iuZCrSaH7eub43HbWOvvh4qXSHByIQ0BSMDyCzNomh1GkhApxZDEOWRVcYy9O
	0hRiWHgP3mVchq9gb5OdlQC98RXQDplatRkRWXhkTSOvcc/xp+uxkNeDmLD6H5/nWYOQIOejrTk
	Xe1Z111nsT1zkbqnpVHQxbPMTbhbGQsRjejFhxmoDX2V27jy97M9hUM29MNOwyKDaVQ4lDwGPf8
	cTmi6FhNG/Z2PqOcgKfqOsFXHVzAGJZIYUKXU3QIiIUGGuJsPgGagXOq4o/36JFW0FqZXYTCBSu
	g8V4TsuCl3xKGewA==
X-Received: by 2002:a05:622a:1491:b0:51b:f640:2a4f with SMTP id d75a77b69052e-52ce5f8f692mr214740731cf.4.1786093170888;
        Fri, 07 Aug 2026 01:59:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1491:b0:51b:f640:2a4f with SMTP id d75a77b69052e-52ce5f8f692mr214740141cf.4.1786093170421;
        Fri, 07 Aug 2026 01:59:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055dea21sm340009e87.47.2026.08.07.01.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:59:28 -0700 (PDT)
Date: Fri, 7 Aug 2026 11:59:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org, Daniel J Blueman <daniel@quora.org>
Subject: Re: [PATCH 00/22] media: iris: Restrict lower IOVA range for Venus
 and Iris VPUs
Message-ID: <5pnnu5nc6tpptw2wriq7r7mxcjvn3kvi5auz4vqffdent5bxiu@k5pbypgpgexl>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NiBTYWx0ZWRfX3XZBRJOXIhzU
 z/QrGx0ll4GNrFY8WIVcOleqzDLMZX1PzaHpwgooZmui3SwzodGUPRDWREZZ+draRhBURjZ4OnJ
 Pn1DADQaVXec6vzNRUHWbceMupt3TbHHC/6aIl2xT0aoxrdg60LLiLnKkzitm14k18b0Erz6SH5
 C50FzNogpoiDQMTmCIdL00GNSELh+HYE447gCKW45vt0sC7fwLq1RC9IHwj0zGy9UcLKWZ7JNfv
 Q2D2aCiPTYqBE66KtoCLml4rueL9/iCDjzi1xDSUKx36KvFT/fjPaDtaXaskS3npU8g/hLya1GC
 WfAV+5FOcudI1KzfN/J/qUf7ZgfytTrPWcw5i8dQIz7wCELV1Cn7KHLSbR+AGYKHSy66t3ukzsy
 u8zxiYSjtLPuITeAhRcl9Fvkv2ov62Y7MWGkVIWxp0AYYMgPBshiGiR6GXt9DnPwnTc0blN9wgd
 yUeB6Owl0JLWgEWYTNA==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a759e74 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=l56uCoWjfwXz_vPCyOUA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WHh8bCYzi-n_T9rNs1uBaZmJZUkJFp1_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NiBTYWx0ZWRfX26jyvdXngIBG
 W6H2EptaZyCyX87EIc0Rl9pUIaySPyDl5kOiNZywqNwb4Lsq/i2nZe+Ts3n/+NRCuc5YQNunCAg
 V6VbrcuXd2mZyKTEVa0QIMMk5X8sd0E=
X-Proofpoint-GUID: WHh8bCYzi-n_T9rNs1uBaZmJZUkJFp1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070066

On Fri, Aug 07, 2026 at 01:54:44PM +0530, Vikash Garodia wrote:
> Qualcomm venus and iris VPUs reserve IOVA addresses below 0x25800000 
> (600MB) for non-pixel stream ID in secure mode. When the kernel 
> allocates DMA mappings from this restricted range, the VPU generate 
> unhandled SMMU page faults, leading to video failures and, in some 
> cases, spontaneous system reboots.
>  
> The issue is readily reproducible on affected platforms by running
> multiple concurrent video decode workloads, such as opening several
> browser tabs containing video streams.
> 
> To prevent allocations in the restricted region, this series introduces
> support for an IOMMU IOVA reserve memory-region in the Venus and Iris
> bindings and updates all affected device trees to reserve the low IOVA
> range [0, 0x25800000]. The memory-region is referenced by the video codec
> node, allowing the IOMMU layer to keep DMA allocations above the reserved
> boundary.
>  
> The series consists of:
>  
>   * Binding updates for Venus and Iris schemas to permit an additional
>     memory-region phandle describing the IOVA reservation.
>   * DTS updates for all affected Venus platforms.
>   * DTS updates for all affected Iris platforms.
>  
> This ensures that DMA allocations do not overlap restricted IOVA
> mappings for non-pixel stream IDs and prevents the resulting SMMU
> faults.

Some of these patches have been sent already. Why is it again at v1?

> 
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
> Daniel J Blueman (2):
>       dt-bindings: media: qcom,sm8550-iris: Allow IOVA reservation memory-region
>       arm64: dts: qcom: hamoa: Reserve low IOVA range for Iris
> 
> Vikash Garodia (20):
>       dt-bindings: media: qcom,venus-common: Allow IOVA reservation memory-region
>       dt-bindings: media: qcom,sc7180-venus: Allow IOVA reservation memory-region
>       arm64: dts: qcom: lemans: Reserve low IOVA range for Iris
>       arm64: dts: qcom: monaco: Reserve low IOVA range for Iris
>       arm64: dts: qcom: sc8280xp: Reserve low IOVA range for Iris
>       arm64: dts: qcom: sm8350: Reserve low IOVA range for Iris
>       arm64: dts: qcom: sm8550: Reserve low IOVA range for Iris
>       arm64: dts: qcom: sm8650: Reserve low IOVA range for Iris
>       arm64: dts: qcom: sm8750: Reserve low IOVA range for Iris
>       arm64: dts: qcom: agatti: Reserve low IOVA range for Venus
>       arm64: dts: qcom: kodiak: Reserve low IOVA range for Venus
>       arm64: dts: qcom: msm8916: Reserve low IOVA range for Venus
>       arm64: dts: qcom: msm8996: Reserve low IOVA range for Venus
>       arm64: dts: qcom: msm8998: Reserve low IOVA range for Venus
>       arm64: dts: qcom: sc7180: Reserve low IOVA range for Venus
>       arm64: dts: qcom: sdm630: Reserve low IOVA range for Venus
>       arm64: dts: qcom: sdm845: Reserve low IOVA range for Venus
>       arm64: dts: qcom: sm6115: Reserve low IOVA range for Venus
>       arm64: dts: qcom: sm8250: Reserve low IOVA range for Venus
>       arm64: dts: qcom: talos: Reserve low IOVA range for Venus
> 

-- 
With best wishes
Dmitry
