Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792604612;
	b=aM4uXPgXc2+zb5DePPtv9ga9ZvrLCYAGoe17RfeMz7FOEvBVsGYGcTOyZc237x+EQk97
	 LjMUukVGR9Tdm6FP2fNEE5yzZaMBZcMil1usj8Z/6NEgDL1ykGjjrLTR2nvLLwC/hoT2i
	 cY1bBTbgSB27O2hdVMlBkgEH7dxG+8laP5HK8yQ1Vn5m2/nceI5bQ2t0SZSjFLUpYmdlO
	 rHzWT5r2SZDPk1tYP+QFBPVd61QrxOqF+Avls2n0PqqmtD/RGRuA6nKPePj+QivFhQRrq
	 iN0bwsi7olM/O+1w+MfYL5leGAqIs4u2phe05DgAKDAy+J3dmtqwsJ4z8xBQmRWX+dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792604612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
	b=2e0LcQxC3cnZ0c7Qi0drcyG5wLfwP2bTbei6rk5WnYZeir1KsCvidF4I09Bzn9aNAJdg
	 FKUyOafe+QCQKYgifUXd/O/IUOleDc6cgmyBbJz9T/5pA0Q7KYgLm87vKwUkRF2Av8bbT
	 9M3ZwxvLCiuhswYthY0gZXowDDEpcA4c02qTnKuSoqLm/uH5QqEG9VXr6kLsl8+vvYsJj
	 VHX69qgh2WTQKq4WDWUE2KgOjSYmD0UtNFP2KB5+q/mwvd4RWG0BrlzN8vkzyf1ps7GJN
	 9VkDdbLjsbClvgJEFD7TG/AonhOIr9hMKJjVo2em7zCIq0n/gsR3+TLIZCrlX8JRf2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khjXYNgY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OayrCijp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B66606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=khjXYNgY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OayrCijp
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LHZs7e1269970
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aSFKPdeTRbaa2HPhrRZ5lrX5
	j562cGmEBOpF2qSZv8s=; b=khjXYNgYOHV8sfchxq2tMxChs5gp1WBoK0+wGuuV
	vrubl1HA/2f6mHJ/1GdZHeEEjTsGufVlDRIDYhhf6TlrLzYusF8ifSqsd5wE+Abr
	ewlyso1tgsJDKqPW2E7FEgTk2y/7HKmg1Tee05FkYZZF0zI428AXaBt9BhhVnQBB
	+SkzeP/dfIevydKZatyDL1pMO+Z6mte5JRAGq/IMounxO/iRlt3FVUw6CQL2Cx7L
	+ytgjwP39PwH4lCvSKTFDxhxr8BoRdcE9AFyqm/twgU+8QAulUUk1HqYGaxlswlS
	F6CAV4HrHchMvniE8akFXyUO1X2up4jPjZHiz4C1abruhw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r4cq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:43:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so214491885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792604610; x=1793209410; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
        b=OayrCijp16EU3jPa5yO8/sliQOVNdMKp/iB4XHvSCVTnyR4HHdltnejRAZQyZdB3FN
         dBRSn6MpyyL+m4moC64PaPx7BGw80TS6yAsudVpQt21kHjdXUEuE/l032wm40hcl7Uqd
         C8uHVnivziK9SMc3d4YJ9DOGBuUyjju3qZUCdVQ4NhgqrHA30aLEi+iWIsUtanI2snc+
         y18KexqiONjCm8L5S00KuQJA/4DXTg5IkVH2J3pBzs2hew4O3wTXJZP72BitnlX1aYO6
         8ENNMbQ0l3XV4w8jyxn1cXw3+L+r5E4auZosU4O/NKMRBGPzgGmfXbQXIdEil61nTRXf
         GT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792604610; x=1793209410;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSFKPdeTRbaa2HPhrRZ5lrX5j562cGmEBOpF2qSZv8s=;
        b=EsuEq9QF+y85OCsOOoJPpUQ9xm2JGgoo+HBf0yPlviNdilI1i1wxU9TwTkxnY7cHlp
         oisQOFjPx2412sxZsE4Rggzywkq5IW3iidwcV6lRLri1xTAo9lmaBuhXVaO6R7IgfFO2
         lY0IoAr/+I8PfbXcp0vjI/XEH7f7b/kDO0RDADZJ1n4dovoRxxycdP9KZZK+HMuoI0i1
         /p1jm3rvjVpb8S+iZvD1Vya0rclO8zkn/Xf88SNn5vs91ZDBRMjR8jHPacFlsm+x0n1Y
         bjqYjAFJmeIvGdMlrYhLgJYynhBvWdWF8YeD+48od8fu0a9x5Xt1WtvwcxoamFWOgNBi
         o4Yg==
X-Forwarded-Encrypted: i=1; AKwUvByDK9lhhjA7Z5cPRMc1bRPHUr4H5vuSTRUiRkhTgoibwm912nBrROUaldcx0zrLMIv6Du5iMrLPEdffAC2T@vger.kernel.org
X-Gm-Message-State: AFq9FYLVVNBJLuVFduEETFdfLoGVc7HJSD6yrGk6xLFDNQOOy2Hl8wON
	0QVcsDKJ0mzxlwbOEqikuKl+9F9nwUKuX4AzpDQ12z+10t/t/eYXjDNEfQAlQvQEemmCw4fLTx1
	83jJgNWvV7dDdLxkHlig4slLpasgAuHYnQWWTX9xKad8jwCSgtGi2/vxJdllSTW+poIsD
X-Gm-Gg: AYBFou3vqmn1OAODRA/qw5xKo5LBuRBgTt3fC+mAp0jhCUJ8pKWBDOYeuU+Beb+JgqI
	DA0LkxNzlTipqBdAXUL8BTXGywyghLZ9JsEhnw0JcPSuYU6l/IArVnBIBt3cuNLDzLkRywzLJ65
	5x38040RfEkvGlgoTP2Z15QFlApZ7bjLfy7vwl9xMBqASUMGkyiLzGd1wW+xJOdnyxwqfcO69Wz
	hvlsq1NAaF0o4s2EJb851yIBDjLNyCKquE0tFdam7Uu6Kz8CId2+1EoGEx2BiD6nptcCrT/82fv
	Al4kNYWYMgVcjQDhFfsnLj1zB5egLdXMafh7eyxN2Lccd0M1ruDQDbDkLO/ivIh+w9rZGX32mSr
	UFabLlnWr9HwlcTm8SgerISMDdz+un1JKidVKi/B9Lvf4EgwCvxRUUYkpK5icLHpJqfcxTyofTu
	eo8JY8DbXTBvmv
X-Received: by 2002:a05:620a:4496:b0:93e:5861:34df with SMTP id af79cd13be357-93f57feafa5mr527031285a.47.1792604609938;
        Wed, 21 Oct 2026 10:43:29 -0700 (PDT)
X-Received: by 2002:a05:620a:4496:b0:93e:5861:34df with SMTP id af79cd13be357-93f57feafa5mr527027985a.47.1792604609508;
        Wed, 21 Oct 2026 10:43:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa12040ecsm640028e87.35.2026.10.21.10.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:43:28 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:43:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: clk-alpha-pll: Skip Zonda PLL
 configuration if already enabled
Message-ID: <tx64ni2u6paa7pofcylmlwytjjqsi23pbiqnhp7wywbbywla2f@3xaql533unhw>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
 <20261007-ipq9650_apss_clk-v1-2-fd4c2b3cbdea@oss.qualcomm.com>
 <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
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
In-Reply-To: <3faeade1-1bd2-4e74-95ae-7396a1ef1ce4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8f9c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=JR2_SSPbN-Trn9morxEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: aicQI4EDeEUns_VR9y2OtH8vsOtEf6BO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX1Umw8OrkLMEJ
 YsILJvD4r7UeXVmoNggvPki0yRjMlyhyJaMLnvOriagwtFV+zdxzupekidZZDVGzA/scXXMvK2h
 WS3Xosy8ZKob4dJjeoXjLnYAuerTyId+OlVw2jQqSrL1r80cDDnbPjitcEKQLCr1/mjaM61hjN6
 B1uuqZM2U0FkedoBJ72x0QBmAo/ulIrGWlv0m8m+wrZaj1dmSKXwInVqz4sdHbNfajBTvyfgul/
 z1sXjUsghgCA5QmSctFQ6qh1phZLpLLhmkfHN6YByfn3w4BaompQ/j1RQNytnVVBa+vCYrB37q3
 IqTrJvG8z+fKHqattJGFo+QARblhhwZRYCNiLZ0SQeWY6isLA+pcoOcCxfqfGioD3u2OUsmOBip
 3E6KgKA6adrmuxkir/TGPsVm/DcfE0TC980EprZQ7tx3fFD7GVS48/dlC11It0iK4Y6eTrQyNgi
 kheMh6Wu+ZT9UYWALog==
X-Proofpoint-GUID: aicQI4EDeEUns_VR9y2OtH8vsOtEf6BO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MCBTYWx0ZWRfX6vSe40PLzwfC
 xGsHRq2CbsNkfK6ud4Yhqkx1LGDLCKOsDY2OznaSgVJEgpPYOP0GcaWOi6msk7zFv7Kw+TxtoVI
 sX3LiwnmdnuOT1cNJheE4KGp+B1QOYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210070

On Fri, Oct 16, 2026 at 03:50:19PM +0200, Konrad Dybcio wrote:
> On 10/7/26 8:50 AM, Kathiravan Thirumoorthy wrote:
> > On IPQ9650, the bootloader configures and enables the APSS Zonda PLL
> > that provide the clocks for the A55 CPU cores and L3 interconnect. When
> > the APSS clock driver probes, it attempts to reconfigure the already
> > running PLLs. As part of the reconfiguration sequence, the PLL output is
> > disabled and the PLL is placed into standby before being re-enabled.
> > Since the CPUs are actively clocked from these PLLs, removing the clock
> > during this window causes the system to hang.
> > 
> > Avoid reconfiguring PLLs that are already enabled and return early,
> > similar to clk_trion_pll_configure().
> > 
> > Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/clk-alpha-pll.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 60173b076cc5..3641b2da92cd 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -2162,6 +2162,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
> >  void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> >  			     const struct alpha_pll_config *config)
> >  {
> > +	/* Check if PLL is already enabled */
> > +	if (trion_pll_is_enabled(pll, regmap))
> > +		return;
> 
> Please add a debug print to match the other similar calls
> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With that in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
