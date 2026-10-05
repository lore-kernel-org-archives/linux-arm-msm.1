Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E740312836
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791184325; cv=none; b=ZP3nqxjNwT2GQCwAVLE5KEOXvATPvyeVDqw6CEambZOx6LchAoYnw0bFqy3/99DsJEQSE6QDlvAEH+27BXuHNTUzDBpHAGY/9Fr1hujDewda57bULuaP4V3ZO2L4aaXKPFfeLD8BVPltXcGKG4clncNPZ+HgfPlX0rhg9tjMFuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791184325; c=relaxed/simple;
	bh=JzgPfIolC5na6aUj7+dX5thX8j1KpVsMxiVdOu12l/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKggUEkKiatB5THdoZ25UVWWArf0Ljt3NNWqRk+7nZoq/DPxeozQbJHgo49iCf6/MkJ2TjbTt8i5BDLs9XEcw4m66hrDtY+NWxrfwDnecvpyyiR+isMBD+RazyUoKWzeIlOo1pZrZYLX7BHA4304MyXl0rPjlEvtAWoQUnQAwwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvuCFon9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPAfNNZU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OvuCFon9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPAfNNZU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695104XN3688185
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 07:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=URjcDDJA4qfVZPodw2oXAPuE
	LBq3OrBWrRQkdxFEpqw=; b=OvuCFon9JXldwHpbK4PUuldtPdxnIe64gDuf+r8r
	pj6/nEwp5kMObs4IJeblVu9vkGYRWezmnMbmpOe6HZE+chwzOCYse0qXdo+fid4w
	+ijKKln45MM3uPBhq8upvwBT4MVjmEff+IsP7DMi0T1cqO84Xs/myxuhtFLoEIab
	D0ruu7vnb/uArLp48eup38SzLp4qOscMLzk1hjv5Zq6DEvoVO3pye9CMKPnFR7EE
	hcl9KyqszwnYZNjB0yBhHdyoNydS+M6C8X3QPblaV2jwhuR1guxE6nNVEzuFTytZ
	m9P8dJ2wwj1ALXHbKOvkpYoP+BX1wvdt05iW9CIKS51wCA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3chfjr0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 07:12:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso383488285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 00:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791184321; x=1791789121; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=URjcDDJA4qfVZPodw2oXAPuELBq3OrBWrRQkdxFEpqw=;
        b=iPAfNNZUo7yCN0qh+3dYFaI8UO6EvaqHrtvOBIuCDrc7a1IUeE1eC7tBOaAkpQzsW2
         9xmzdiNW7wXCLHytZsmuOzKzKEHa4IAW7nTXZ/Y8V/SE9Vm4zxeSEWNX58h0efYnYV6w
         EpmI6vlhNS/2uEPoO9w87v+6em7TCvkYVEObmsscjGUviklemuO3UdoOU3jQIHmdffmW
         c2ab8+KXR2Un1LbyEBk5AoTqzGMkYDspXrjSNcAyCVIC2kPk4oNMRQYqah9dVC5lAto4
         YJWuZ4ew/UC1TzkFdoYvfEAvtd4QHyFF1laJsrzgI/0Q2tBRTHj8Z+KjWbQ1B3SCr9op
         qAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791184321; x=1791789121;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URjcDDJA4qfVZPodw2oXAPuELBq3OrBWrRQkdxFEpqw=;
        b=1J1+xkAuDzPIYcOuJoXI/kh2ifXgpUhV0hI3YztoFZMwCodFkJAElVfkxAgg3pfWS3
         ECZy5mzrY6W/jL2A8nlRlYWabp9lJsNdb7Bl/Wq/Xu8ZEzRFa1BlCXGQQCD++JOuGNjf
         +otJA4YC5hI7zx6uCVAmxlxPpvRmO7HlfO9X/FbxpptEGxhWOvtP8h+GFeeCI/wiEu/E
         ADPnbrEvk4ooZJ4fUsJ1+FvyHGoi7/ItlcpaQ8Whvht8ck/NYQGsldmb41N+XIeQSu4b
         2dvETab9mvMCTBpoKilv6RZkjutCwbLaB+niltb29NZIavEpEYqZllUqK8Nn8EJjMQ3T
         il/Q==
X-Forwarded-Encrypted: i=1; AKwUvByywjoBIdzgmmsv/sDmrtRnjsjn26LtjLYs2Wl9Vl4nPIJSTtrpKgMz6XkYPEn5o3mEFphUcGHoDR97uYZ4@vger.kernel.org
X-Gm-Message-State: AFuF++lVmgP6V5vXKRMmv8JvQb+3vAeT+vOGYJ74W+TZSKKL/qrsjX+k
	1Dp9NNiU/TsxTT3rDfxdMDGDjROdfpdlIYeLf2xMX3mF4r+3z54ISsB9My4s1sZqLxscAXLE4TH
	s4ZE6zeH6is/7rzvT5X043OGjHbOV1CBWONXTa1lOdNaS/fB23BXVoIe24eL81Kgp0iX2
X-Gm-Gg: AYBFou3jg23xRmDx8Z9Xqe9T4TYnFaM3bUnd/hRPEkexv2mqHeVqYzpwuJHqSlvrOi/
	biBQ+qG6l52Bgqisjg6LXA872csxefmz1rkSeqMs6GaBtqnSJ9WwVEty7cQjQYp8n+jl2IVkr8g
	67cYL/sMZSlQCU00acRZAX1oWH2O4nxOQx6v0A4q6RBRD83OU1AzucTpWq0AqWNEnNz3xLw9+ta
	5Ff1G8Ss871oI17RvZLdo54hLOtnukPSczsjAoTDmsk+pDhwdcF23daqQ6Qd2EjITpkPOaaUzhE
	0XoDSgzryN6CbPOgEfXiuaxt2zoSf3Tx82evi18FI66KqnZLD+hFoqdccEVMhzS6T5qMEJG6Irt
	ju4zGTcwxz8GyZ49vH7iPSzLDIiAMx1dCmgY5GZYtmfKtDcCWTylBNb5XIVVb1/6xMpP2KDMfhK
	XAUnsrGse7G/ZR
X-Received: by 2002:a05:620a:4093:b0:93c:2ac6:37d1 with SMTP id af79cd13be357-93cf1a0d7a3mr1788789885a.49.1791184321372;
        Mon, 05 Oct 2026 00:12:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4093:b0:93c:2ac6:37d1 with SMTP id af79cd13be357-93cf1a0d7a3mr1788786585a.49.1791184320953;
        Mon, 05 Oct 2026 00:12:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c78bec9sm2935220e87.27.2026.10.05.00.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:11:59 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:11:58 +0300
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
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/6] phy: qcom: qmp-usb: Add IPQ9650 USB3 PHY
 configuration
Message-ID: <nprwacqpxrdobhubo4crfgtbqbx4xs3naxlbazslesonb3jyo7@nvsmvy7av6gf>
References: <20261005-phy-v4-0-b04c4123ecb3@oss.qualcomm.com>
 <20261005-phy-v4-3-b04c4123ecb3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-phy-v4-3-b04c4123ecb3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: NqFNoZ_NNyKnH1eYAwcu34GLBrLIvDRl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX9fE7gogwyIBP
 KwevxnRWkqIMSk8bQ3DwfAYWU/FAyABVHMTUMZ57yeYkdbN4xGETplPU3SNdiYQV2Ze54jEqHNJ
 tuWR0mCahzLnSylktUhC0Ffc32lGHr8=
X-Authority-Analysis: v=2.4 cv=eZSo7LEH c=1 sm=1 tr=0 ts=6ac34dc2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=NrRSp6wvv_rQV2fpQCIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: NqFNoZ_NNyKnH1eYAwcu34GLBrLIvDRl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyOCBTYWx0ZWRfX6f5rRVGoEAkU
 kKHr+AIJektR/bOwW0g0wQnQQutDtK+4qYL+YA4aceWXtgKxHI8VLqlmzENp3bGC5PRcDFVmYiH
 v8KPf4F7iAeSEVCCyLU8EZtuZ+VTzFPUdm+oxPy4NfTNuUmffP01HdjRdmxHBtO3pfHxzdtp6/Q
 D7lDexqsH4oddQpmPAj1JAveN5Scm5byhHiedfa03YdmHTmXnvAw0LulYS1LxsNeLng2+KPBuPe
 irZ3itzSodwm34k2Wpi1rtjbBF0QqITzVCLFbPNlrzNSebmGjJTrh6HK/jbyvwk4QQ5r0GFoA4r
 nBkde0N0PDC1xFo2rh0ShgRbH4/vjTgEWSHdeu37CxB0KYltZNy9errx1YasEBtrDwFL0S5hXym
 Kbm9T4FbtXwxc0FgGN6Wr4ydA/chldgamIVTBiZsovaxZTgLSgMwgDJAlG/zR4lCse04W+/DwJE
 8ki2o9DeKXfoVEOqbUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050028

On Mon, Oct 05, 2026 at 12:06:28PM +0530, Varadarajan Narayanan wrote:
> Add the USB3 QMP PHY configuration for IPQ9650, including the SoC-specific
> init tables and compatible data.
> 
> IPQ9650 uses settings that do not match any existing supported SoC, so add
> a dedicated configuration to allow the driver to support it.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usb.c | 118 ++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
