Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B8822126C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184658; cv=none; b=p0UYwqQNs+gyy9lfPLnNhlFtWvJ/elp9AqARH1I6wHuuBhvHNVCi1X2LX/Nh4j+WPXfZsXQCeEyMvfAOE9bkWuROgs23DdrAe5xi9M9oauA77AHFSFQQfqDI5D7aPZIyF+gKM9jpXHeUEe26IcqHx0GmlTzEiCq+KRxIQ8JBCz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184658; c=relaxed/simple;
	bh=xDSwLSw9jQjM4t1WpbTdcaKoUkOq1JTx7zT+H6MGRyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtBIOiE5h36YGaLDZZH4XeTNFd8ZVWgctbXA64/GBx6ybl0/kQJpeiK1fvaveP5gKyQgwjNjRi/B919OThZOB0GmP6qv3BbHqvwI0YHGRppfT4frXlAeLs1bmeds8BB3Dwn2tJ7BECyYAa7sJ10Ydeo63UYkkdLFgMNVyJgmUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhedRyIl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YoK8t1Iw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhedRyIl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YoK8t1Iw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510EJS3838666
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 07:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=imz7x/wVPwZKLDpg9Q4Zq3lR
	2I09jdP4oGd3XJ8uP7Y=; b=GhedRyIlw7haVqBVnqmp2l7uifqO6PKbd9210YZB
	cSCFMhS/3A1YOL3KY28GZESOHRLCZOYCAg4b5ZQgOP5pEt7PQrfQCY9Yi5Hxisa4
	DZIZ+mDXEPoRwUSQtbc1hafFj9N0hvIBnGN/JoGOBgQ5enME2nSfcswJ71gTtnNW
	CQkFffhrByP2qiZZdwZgKyhADm2WMfwBMzb1VSP1sD6qubXIqDKKNoqI9oEINg6G
	9EHgH2fTGgBDYdb0uaVCuPcJCemNi6QH+nL87UcDRyp2noLZLP3c71q1FSk0IWWH
	x0rBrdLn51DAYLtN7JwxYOUscgKrZu8ifBWNNxCQHn74Yg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08mrh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 07:17:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-533928ef33aso16148941cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 00:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791184656; x=1791789456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=imz7x/wVPwZKLDpg9Q4Zq3lR2I09jdP4oGd3XJ8uP7Y=;
        b=YoK8t1IwnJ2Hny5mEpEpoThDzx6n+joy8w6LeJk8a7GOC9JvT9VqEcxANga7pZhTIO
         sVUh4R8P0LC/JlMFBaLuoDNrfgPm0Ax+OWk+ENVIubqmBu/ZloKTHww9h90zCdwYhNsR
         5nPqqQX35pJd3hELv13JZ+lzj8MyciatabLag06VWuu3j/FjlDxpbnkx15FLiLNp0aDa
         fg2ZGb9vCH6+fSRFS4X0p/TwgFPig+AXlAwZnEEIcDmXIG26i24bw3YlBXORpWcbGEVS
         6cEqzZmLrwpT59F3dO+poKx+P95411WPx7gfGIySwl4ai4H8m+kgQaebKPCNvXmnV6mL
         siRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184656; x=1791789456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imz7x/wVPwZKLDpg9Q4Zq3lR2I09jdP4oGd3XJ8uP7Y=;
        b=Ir2oODV6soibADuyNqXh/0bv/Bn7z9MuZEpOzLbL3zecTvJEWUQr1kvBPI8tyyAxvg
         CFbOziNSZjHMwMs2blxkBs7k4NH0vzmJgy9/DRKeSYPYzWXRiZVT9/apUwLJtSQ/Ok0I
         EhlNFsgzNogNPf+ctMHWi+yXqLwtgzP7TA/jR+ObJ4G8rUJvnFI9bMpvSL7ScQ+lzxTQ
         OSJ+3rlf6q1yBSXlX8JQVfPkQ965+z0XBX1H09lk1myvtwknGHf3LBiURZz0iJ21bay4
         BCfe5FNqGB/FSWhlMBTPPgb16ayy3LxdoRzStz3oMFVKvLYm4opLQH+5FUTHYec+l3Vc
         w1cQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIaALp17+clm69T0mzBq8B1vQz9Onuea7v5ZIJKva0wypd047lJJXGSZlLBC94zuovTVPjKroefnWg0Q6N@vger.kernel.org
X-Gm-Message-State: AFuF++lDjghRWe6TGJ2zScm70uT7VM3YgySgO/sq0L28vEAfg9ofWVYL
	96ykXghZZvY53HbMHT5GhhQ3OT7d6qPxC2tRG/lvRiRZ9A5KaVb35WLeg14Zu3qREPRV9aOlymo
	sSwcKDKUf2eA8ZwpH49dpHVU/sVBS9kG6DJre/r+I6gr2bckhbx58UYXyX815aXMPOXkT
X-Gm-Gg: AYBFou0Dg/s1VuDjeWMfnFYZiPw4ZREEAGVYVSL0E7t/Q4Dod1uR5kNO/TdAKxp+sXW
	ciQt+R/N8VuuMh+YC/FEO4dGQyvs8L+N1esz/gJ9QMelsbsF4VXGaxno+9osStVrmyNEZiDtYyA
	D2IXnloX4NHa50ffGU1SgMkphq1URof9qa0/ihEazZFGhpupNPgXWpr1cbwAcGz3mFO4j/EJJ6n
	2BS2FYYAbdF5lgfEQxxgriildsGzhb2qa3hGI69kT7DfHLMdweDW0VYsblQ5Z/IX9RJ3V5OUAd7
	3N+VuT61npmckQSofDXAXYU8qa06SVHMuqjC9NtBC7bnTxTExH2G+/++jjK3HMXfOWI4iUeO8GI
	fa6EyZmrB9IGc65DP43Y7cWxhvmvPF/wZ0CwBy7G0m7+hX/YmNRfYKpxGd1Tb5V4Lq5dlMZx/I4
	SM3sBQf8KV0Trt
X-Received: by 2002:a05:620a:28c6:b0:93c:b33a:5ee0 with SMTP id af79cd13be357-93e510817dfmr1146322285a.41.1791184655700;
        Mon, 05 Oct 2026 00:17:35 -0700 (PDT)
X-Received: by 2002:a05:620a:28c6:b0:93c:b33a:5ee0 with SMTP id af79cd13be357-93e510817dfmr1146320085a.41.1791184655217;
        Mon, 05 Oct 2026 00:17:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bb704sm3043111e87.79.2026.10.05.00.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:17:34 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:17:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/6] phy: qcom: snps-femto-v2: Add IPQ9650 support
Message-ID: <ck5st7q7rbnzfp26kbwzixorxlikq6hpmso5fzz33dlsqsrnrm@g3aey2pabkzb>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-phy-v4-6-b04c4123ecb3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Jqn3GdR2cz8YfRL7zGLpeGyUe0pH2mK2
X-Proofpoint-GUID: Jqn3GdR2cz8YfRL7zGLpeGyUe0pH2mK2
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac34f10 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=unmdmSOhVQtIpuyIt4cA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX7Lg0MRWtDep0
 xypsnDiPmkx0lQ1DIldOLwKq/fvpjigImzfSo1Sqww6O/b+MdeaG/K8NH03je03vWyshN7UJMtQ
 PPeRthXfarlRoHzkbrKxlp+pQX2J2g0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfXx7PhHSzqDReX
 8dFKp/JjkFw5DQWPAdFR232NsDzdlELtMm3K4m4hJ3ELmky1OlrVXCAT7IIRJ9JpTySEASW3hNF
 u8GK2yC5YNw/a0IMZPcfWK6zkLvHnU5nv6OVxhmPlPWlAnmF3zCvO3mnS8Bp2VJ53gS2Jpyhjr3
 ZX42E4gHc0oczmqpwxScsBwImEkJ7GWe7yuflaDw+nrYC1QE64dApmDJzF+2oRsQwct+6FPfBEm
 Yk+JAqYp7DxuQuQE5KgUqg7gKu1jDSl4hXcs8uUKEC4ol0wQSEEjqpaAX0TQFxOhi72RIiZJDRa
 2C6wMllDk/nVrV+azcWv95IUW4bhF9AsShIe5HuyDQawp+4SRUJdhpWrRmojvQ2qQghUyEcHk/z
 fRnxyTbYv8agdt894D4aoy/rLiJfs0rsFqBvvpxSCvluKLhLf6VsoaHZzsf8fqy/poqf2w9tM5q
 CIJ0d9cbwA++XfTD4RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:06:31PM +0530, Varadarajan Narayanan wrote:
> Add the 6 nm SNPS femto USB2 PHY configuration needed by IPQ9650. The PHYs
> on this SoC require a dedicated init sequence and override parameters
> before they can be enabled.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 62 +++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index b6bbf2b570c7..8957f208bc51 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -29,12 +29,15 @@
>  
>  #define USB2_PHY_USB_PHY_UTMI_CTRL5		(0x50)
>  #define POR					BIT(1)
> +#define ATERESET				BIT(0)
>  
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
>  #define SIDDQ					BIT(2)
>  #define RETENABLEN				BIT(3)
>  #define FSEL_MASK				GENMASK(6, 4)
>  #define FSEL_DEFAULT				(0x3 << 4)
> +#define FSEL_24MHZ				(0x2 << 4)

Use FIELD_PREP, please.

> +#define VATESTENB_MASK				GENMASK(1, 0)
>  
>  #define USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1	(0x58)
>  #define VBUSVLDEXTSEL0				BIT(4)

-- 
With best wishes
Dmitry
