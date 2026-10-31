Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453316;
	b=HY3n4MfzCxSGMW1ULsEYX5QVFBJwkV/ePx//eCwEd94U27ikt5XpbxPq0J7qPbrogLkg
	 3dnCrC6oyRUlCVhvh9FToZ4+7UaHrj6L7t5SbNPaRx8rRPelzj7fQzPI09VD984KeDVwk
	 ThypW82DJRMBUt+7DdDCdoC2bstnnAoQeGpz+0m8E9rA+rhioIF9QBG6ZvvSL3p53eNg9
	 6aJAVSn67+jOXi/4bldBWH1/gq6djVIuvz9wwD0bmiD79lG+Z5wtGmRbeNtwMGI3KGqE+
	 LCdui1v5aEt6okUDZBgixq8Vf97GMtAl2fwZEIYkHaevvW4QVUojtJ0Tw24wOuW2MCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453316;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=;
	b=0zDfROWAPOkjqxM532cJzof5WBHo1M6a23mhr2kRZdohNGXxNJ3VceIFsNjr3A1Hr/l6
	 ercoz3hdnSIS+eFlC0WhtdzRYYZ6JDIHJ95dVUaWRWszxMszOt+fsIE5rgNZJZXXMYKMc
	 zB4a1aeq59xFArGgOFlgr59/WOgcuArKJwEfzNthqUiyhpDVbc1rhrE/Riu2VmqHj/Vt/
	 vjXdNdz0fpqaFmKBMSMHcpjatLb97yASORCe0qnOCLP2W/oG1rHUQQdruLkaLLLfgDH3k
	 0yqwFi3goF2M1joC2vLtUAfjhlvW5FogY1BFRK3V67F8UlX9+72XF1BZRQbUYb1Xiag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTxcVNZP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6wRNcY2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19AF606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eTxcVNZP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6wRNcY2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD01Qq1232956
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=; b=eTxcVNZPJplLzNjo
	NY2tYdtB225XmF4MtDrZR+o/gH69DH9RcSKfCxEmxwXYkgne4rVIZdXKWqNYgVwy
	WrTNpBWBqx79kl7a9uVOXJKg6+aKxJqkpQjJIM2R4Ge7A/7LZu7rZjIr5OtoJs43
	oorLdlXTs96/zn9JXW6+P7BCTkhGnsbvzJsOGbWqtcqOn+EyJW84sEV/NCRyuIrk
	tTKtbzMr/K3a2H5WoT4Cz6OfPHm0o+vZtlkcUuyiYMD/p23A4RSReQ3EWMAQs5iv
	SYct+gH11TTtRfaXNPSNPV752J1ktMQ/oCmg0MrdEuaEeyMgkTuESSZTOv4181zX
	Lyc6JA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9904u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:28:34 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1acbaf81bebso1904412c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793453314; x=1794058114; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=;
        b=f6wRNcY2J5It1Ti83W8W2ujSf7hPrQenDiD10C8Mw1VRt+ly9ukaOsRsEKY/yT75PT
         5MV/pU8E3Bxn+jhgVgQ7Nm20mGpXe+holhxU468ENhIcFH2svoAg1OYTTSNWDRp28i2n
         sS5hgkGZ1Z7FOu7STSY8yyP59Lda2/MwB8gJ+Z+6pQ5gOfKVa2RGsLmRBFfpdBF9lF7m
         AtD4qUbSc0v1RVBbPYnoAsXRbQsRqb97Z+EPJ18r2whzUvqTvkiCMue38ODBkgjM8K5F
         ybJ+n37ljWfBYCDZWfVdbgn0FnblWG4Z6NK92Dk4DowkM4BxcXA1Lg6njOghbFaAnG2p
         PHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793453314; x=1794058114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=r5M7MBbW/Suyh8vDkmFGXN3FZTnS5DGduJhU7w+zV68=;
        b=Bgz8FPtHqSMtLyTny1f7FXP3w4wwEk1o4yBA9bcu5LKc8j1Sk8nw3VBP4o6bwZAPq/
         XgmtMViF49GSdwxBsaJ3psEgEGb6JUjklWsaDx5LgeM0rKF3J62Hhw5bR5bmVssIfpL4
         fIGuN4VLPLxeXlUxxqN3wMx1ep4AeS/I90oKITZQSLL+ZSF1fXbcsZecRRv4DMG0tAHA
         pQeRIoZ8zOvEV6WSF3kpxjJGUVGk0ify+OSWAk8TBKXXGpODOn6oior7hoY7j0ncAvzF
         s3/3nvvfNslZCtGqU4dKeYcZuSsLqdUgC27P9Yb/l0jCrfzuU2P9NOusoPuv4hXUWUI0
         qE/g==
X-Forwarded-Encrypted: i=1; AKwUvBwF+rzvYlQRH8hjrPHxlvbGGmRlpAOcVkXfJTSy1qiurMdubU4F1YIMVJFNOMrpc1xIGC415+CtAR+ZRxxG@vger.kernel.org
X-Gm-Message-State: AFq9FYIXkrXXgojSvKclHfsZIHFaJ7DtBx3//YNrHzo+/x5Ojw9S8cJ/
	xHRwN6PgtkU4zzL+QkjUci8PI6ZUyZCJHUPhHUSTkSwoIbeZU1tpAyUFU0nVNgC2p44Qe2dfhvQ
	FhaonbC4CrZptGVEpWev1JUd0PEE2sOsjME5yH1yd/7MzL8wYgiFa709PUWf/ZkdsJ9nt
X-Gm-Gg: AYBFou0Sm6LxoCjVWhDvHPR//k1MZJZhp07ubBQsa5r4c74ga3R5qu/3YxMCmPuiA7j
	mvy30RgOWVMLEeSUtPVBmBEWM6ExIOPaYIoxUo++fiXaQj6yb9aaMJX2BYaNCMG5fXSSHI4oQsN
	Ncfj4f6z0KpQ25wEKVlMtQq07UbzkHiyoS3OYSyhuhoF6VhJHKidiTvE8yY09+BkGieNWdLd8EB
	nU5XAukKRnJGSVrr9KUmsLMhDAogvO26GRkTwTDN+zqv35imqcn8h3OwjutzZOsD/DlJ+8/cxEc
	KYuDxH27n9xTFVxVmNeX9+6xOSlRseil9ADR2x7O0S1guOv0aE6Fb7g9q2NFcPKUWNhqbHwuh8D
	IVJbuCAgCSmxJCRzdKrNKfjD6rxStUR34wtzdpabpDTR+hGvNd6Dtk3ml/xW5TlrUdCtUZXVbIC
	mgcKDMkVTkwvh8dus=
X-Received: by 2002:a05:7022:2097:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1ac5e8e1e16mr7121610c88.41.1793453314279;
        Sat, 31 Oct 2026 06:28:34 -0700 (PDT)
X-Received: by 2002:a05:7022:2097:b0:1a0:b650:5c93 with SMTP id a92af1059eb24-1ac5e8e1e16mr7121569c88.41.1793453313298;
        Sat, 31 Oct 2026 06:28:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm16412510c88.15.2026.10.31.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:28:32 -0700 (PDT)
Date: Sat, 31 Oct 2026 21:28:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/5] arm64: dts: qcom: nord-ride-embedded: Enable
 PCIe controllers and PHY
Message-ID: <auXs-qBMufezjqml@QCOM-aGQu4IUr3Y>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
 <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
 <cb4e821d-a2e7-4ca7-be1d-f92e20e52260@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb4e821d-a2e7-4ca7-be1d-f92e20e52260@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: yff_I-oKML3HKONMSLYoesAn4Fyc0Juq
X-Proofpoint-GUID: yff_I-oKML3HKONMSLYoesAn4Fyc0Juq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfX4ydr4cUeHvRY
 g1fH8u1pY6dhRdlHLOUdfruvTLkG5Zw1OjmgDl9/X3/XpXvyIY/fPUwsAsUjBXWclxC/22Eo5nL
 TNfvJy1EP8IuuU8+FRtWMiMf894D2ruM/ZHvxvfbFjmHGRVaHBRoLQd0qzuhfmVrcp2m/CS+Z5Q
 sBcPp+VixZk5k8U9Vx2jd7gMizqZpyJMAmuBWlOnBhJL/y6/KNAC5Ul+54TYcCdrd0e2J89oLce
 C/DL3nIYnrtgQIMesbVXSvAAmkX8JbAK9CALtRBhK4lEITsPGz1W7yoDb7nDLFiHG+JC3eAV6WL
 I/oexh4e1/xoUHJjMWXUY3QcGvjJWtqgrg7K+dknetfa1t117YTTWoj0NT7ywGfQMf3UZpHA/wk
 vZ3Na9WYdO99EGbyCy0an91LD5vceteIZLb6jSJmwe0fZe+aHgaYu7uWgtx0c0/ZcqkH/lo+TGG
 c1wec48R1Zme93C8GGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MyBTYWx0ZWRfXxw+DCva3iRZz
 cdtro/pUjHGH58Z8+5W/jQRJl50/5TL4z/S5L0Kk5NTUsDkLg7N1yNUfyK6D1aub1vr8/lOHTbj
 NEIDpXtp9+hiMP4XX80itgwNmXGDWUI=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5ed02 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6Qp4BPjpy_d1hweZHL0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310053

On Sat, Oct 31, 2026 at 03:50:09PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 10/21/2026 7:59 AM, Shawn Guo wrote:
> > From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >
> > The Nord Ride Embedded board routes all four PCIe links, so enable
> > pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
> > describe the PERST# and WAKE# lines of each root port.
> >
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > index 49635695f832..fcc07226db8b 100644
> > --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> > @@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
> >  	};
> >  };
> >  
> > +&pcie_phy {
> > +	vdda-phy-a-supply = <&vreg_l6a_1p2>;
> > +	vdda-phy-b-supply = <&vreg_l4a_1p2>;
> > +	vdda-phy-c-supply = <&vreg_l4a_1p2>;
> > +	vdda-phy-d-supply = <&vreg_l4a_1p2>;
> > +	vdda-pll-a-supply = <&vreg_l1e_0p9>;
> Hi Shawn,
> 
> I did a mistake while sharing these changes, pll supply for b, c, d should be
> l2e instead of l1e.
> -    vdda-pll-b-supply = <&vreg_l1e_0p9>;
> -    vdda-pll-c-supply = <&vreg_l1e_0p9>;
> -    vdda-pll-d-supply = <&vreg_l1e_0p9>;
> +    vdda-pll-b-supply = <&vreg_l2e_0p9>;
> +    vdda-pll-c-supply = <&vreg_l2e_0p9>;
> +    vdda-pll-d-supply = <&vreg_l2e_0p9>;
> 
> Can you update them as this patch is not applied yet.

Sure! I checked schematics and RRD board needs the same correction.

Shawn
