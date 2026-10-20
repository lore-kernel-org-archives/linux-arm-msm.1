Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487054;
	b=JGyMY7zKdICSzKrLqwiQOFczDFsi0nPB/q+3fXOnV6QrE8H5leRa4qqpwOgpEiQ0F4OH
	 2RWFlx7duZX/J5wb5Foallg2M6rTcNVZJ54eaLREjxMKa5DkGYp7L1ogkMCDKCwOlCwru
	 8RZXc2z6k1/3poFL0bTE9jAhYx1++lTfQ3XZEDgZ4+XnC8WBhmkQrt+yB052HVgzIoL2C
	 kJB7+cwi5Gx2UKDgyOPLXVjEK280G06o6NLGlMXn/sVrlrcBREJvmQrrdKmQPyYLKx34L
	 D0UNCEHwnAJ/zv6paJQeuJzazbdZNEipo/QkJd58WujhemvNreQ4o+v56/Qqq2xIgNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
	b=biJ/RCa3Y/C7ygJNaOGIEl6q9ZZ7H4tTR+HHC96ECaM22OmR8RgS0fFOyWo8+6C5rzsu
	 icmD8UY/yzJWrJHr9vzHxBO6+6CViW1kspomxIE90Dzpybaid0Ab2XXbnhpaGebEi0zaA
	 eoM9FRIyo9rn1W/RNUaGIF1A2Vi6tB2PrF6gkAKUSsAE7svwhyK3ApeoVZDQCX5kKPf/E
	 yvjPqJA4m6T1YqVE1453PaG+GtDTzNEFHF/OhXD8PEgmqJXu2i/KQwxVpyx+tLJIIV2bd
	 xsIsM1NBB64oAOAQWfEG9TSCXSZqKGgGeqeajrwNL8lLVh5i3czeWfqyUZH3JvEMDHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81F3606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81F3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP0BhtAm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSpvEH87
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8NLtj2877952
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wzX1TW2NwI+yWssGoHbGc+/K
	6ykZuk0NhVu5SB7QmUk=; b=CP0BhtAmyCT6JyLAkmqWdyIfIqbOfM4Nfxl5Nrdu
	KmRJTmyZosrBtw/iaRX1wdVgSBjVPmUIMVhWovX6ncpqb9k9WXXADINBVivRrH0q
	TbLtJ84eSTo0UiODkhGpq4usdA8zwPF8z83+bxw26VUz8YVWBXoT4OUEyYGJV6Hy
	OgFc1mR7lwPS/vEnfHXLIdHIAO3H+a5M657e0Cav7BGQx7B6qT0TPsmMJxpLhtty
	uuZHLlvmiZB+dNueEAJs3pxrSQyBMvj80JBx9FHzhsiKpg8dHXXPrNyE39DliMTJ
	Z3DLcT0g7H9c2ntNhXDqgb+0OGyskd802zcs65EcThsnsA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pss5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 09:04:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so676230485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 02:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792487052; x=1793091852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=bSpvEH87sYF5X9Do9f74ghqyunqFSAT5x2b5vT7JYTeuCIK4yND76EmlHKuX1E2t1W
         zdLOmCaCEg3BctVhP6zkJ9NubH8p07JZ9b2DYi0qkUr/GjauUelho4ssezuiIst0asKW
         AyqeSqy+e6mGg+vjewwHEEH3igSEFtLtgvRwEBRnckY9aC2P13f1QywEVoQZlAWJToZF
         Uat9pTO+aVyo+JvJxYMkiHXYZw9F/qYijHVa9nfwZc0FWs0001yyhPS6evjhaLX94B9c
         nwG4AtYlpOachqr4KjTuycuMZTyZY2eKMz8/qUnZmZGWMfv0Y8MIoPoahAGcKQNZkrJC
         CWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792487052; x=1793091852;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzX1TW2NwI+yWssGoHbGc+/K6ykZuk0NhVu5SB7QmUk=;
        b=0BsoBW12PkinMcJ2M0megkpZmAffWQAIY1FFhr6Zaz3PoyHRxrmrM9njstMh5qQEx4
         osIPu/e/XqapYsT6XAndIi1y5V/mpkxBTi0B9Wf0JYreAWzaNkgMzr4FAkJQKunyJ2wU
         G/oyAbi+YEjCeOOyJPZvw++ThTwbFROHxbg6IhTmHkbVaoHNTvwRYFu06UQfTVOjARnH
         B/zGEYSK/EmogUD1dGI7ER3haxLovCwn80kpeEJpGRuqjVTKxQT0DMV7JDu1kuwUQzPU
         2UAKUvJFNMq+jwo89JMmRK4r/kmzKV3ULlZm+tFovqfP0FJSgyoKPb0WaIQZaT8BfaFN
         PKUw==
X-Forwarded-Encrypted: i=1; AKwUvByMu3GV3TFrFC0eozR7+ngHIox1RBvb39ooEi9IqfLUlEweNFW/gJezxe76p0Sc5wHrBAxOQrktRX8St1WU@vger.kernel.org
X-Gm-Message-State: AFq9FYJY6zDgBPEhoNg3khiLhniNjg9dgKvlzcRMMmMtRFUNIkd4g7/3
	iH8LkfoyMsViUj8iKE089VfXO0TM+CMLOnUkMDiqX0B1YMuCg+oMtdgj+Il3IYTEHCHVFmAT7rJ
	W96JbqqmyBxEUH032qHPiQwc2P5BzlT3vWh43IqZxWVrzd/xomJulI17xyShGnWQcwBht
X-Gm-Gg: AYBFou3VAF0O86ytV5sDNDUP2lo12c+dNHQ8nj0sKVO4K9oXtluqHOD1t5m+FEgRgF3
	43hHpA2zjl+T8voSkCSK3gTqKNIeIkoNgUfVowBBzlzu8TvA3G1+sqGAm238LY9EM4OSOq18+Ai
	t3/sqLrXZVAZDvMZDIq1Rsq5xZK5eWimdnmXjRCvFWvqmQ7a6NJFMM78SzqDhpeBowjr804jhzi
	ZdswbVaFOXSuUa9tXU+X/lt3T6a9atwN0Z3+yO3T8FQNWIU3luYiMC6FbAL07JD6UpBLApDg2eI
	YbkYoypor3CE90sRpQLcVvBR+PSJM67mlABUd8v6NLc/lfAulsg+F4wFXpbqOx9BUPG2c4Kgisu
	OGD6bJtlJko0H2TmqwvWG3/M7lSIhRnz7S4a4j9LZ8yEfk8KPiEhmVjYGa4/qke734s2o9RoWCF
	jFrsOh8gwaVyA0
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724720885a.2.1792487052049;
        Tue, 20 Oct 2026 02:04:12 -0700 (PDT)
X-Received: by 2002:a05:620a:17aa:b0:93f:277b:313d with SMTP id af79cd13be357-93f29b9742bmr1724715685a.2.1792487051406;
        Tue, 20 Oct 2026 02:04:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a434e4csm2531830e87.42.2026.10.20.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:04:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:04:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Joonwoo Park <joonwoop@codeaurora.org>,
        Imran Khan <kimran@codeaurora.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/10] clk: qcom: mmcc-msm8996: keep mmss_mmagic_maxi_clk
 always enabled
Message-ID: <vs77pfhgismmyrx4ftmsrl5hylwcjpxirnjdw46c6wu2jcvczl@4wbizp5p247u>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-6-370949e4d8a0@oss.qualcomm.com>
 <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
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
In-Reply-To: <3de40458-7d7e-4cd8-a200-746e4c2adb13@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DrrDa2/+ c=1 sm=1 tr=0 ts=6ad72e8d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=_XvO8LXBJ3Q0iDersrIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX/RdGlNpTsjZX
 nKaKguCIAnqXawAxK1CiYOE20VZUFdgNbs8vdZGVAB2syqhATE3gH65EFkuB6iDuwWwXX/QHxQl
 b5im/dLLTZ12GExUKx8LzHOjKOfHHYd5kD788lHN11KD11A5WDum3M2qr9iZO43J7CsST7nm1qS
 fLzU1i0b8aUlrYsobPHbtsrszzP6ufcEgy+tPRW8dIu6LXJt2DgbDC2ifOFcLVDl0G5PQzAoooM
 2ns1jr8PdZZ2zyFZ3QcoXRHgAzpi8m4r4+L0yK+CqY4vFhW1WCMdPhBErA6wPvgd5aw6UP8avKJ
 nznc19SK4h5O/vH8UCUMfVYQrqryFex0e3sKwCKO3U2j8kOi6ijX/lPzP05pX7+cZTG1WQQOZgy
 wXc21c8qlDltv2HFiahFRU3SRPBn0cmHftHbchLm74Qzzyd+BnWwhx5pcx4hDA+avPD1qs+YJbo
 c49uyacFVsKXYXroezg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNSBTYWx0ZWRfX/UnA0J8wtiqW
 dFQWvFNodp1YHuCfbzOfr/me9GgQssUrxrvBk+i0f9fJot9P4QovNW4b2CKtfKCij3PKj6uw5M7
 MO7oWIs5zcolR+zVJvCh7JpeJ87YJXY=
X-Proofpoint-GUID: AtsVAe46H02PPCKhu8uwnVeXueOHTP5V
X-Proofpoint-ORIG-GUID: AtsVAe46H02PPCKhu8uwnVeXueOHTP5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200035

On Tue, Oct 20, 2026 at 10:35:36AM +0200, Konrad Dybcio wrote:
> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> > Enabling vmem_maxi_clk fails with -EBUSY, the branch never leaving halt
> > ("vmem_maxi_clk status stuck at 'off'"), which makes the VMEM block
> > unusable. The MAXI branches sit behind the MMAGIC aggregator, so they
> > cannot leave halt unless mmss_mmagic_maxi_clk is running.
> > 
> > Commit 7705bb7176b9 ("clk: qcom: mmcc-msm8996: leave all mmagic gdscs
> > and clocks always enabled") marked the MMAGIC clocks CLK_IS_CRITICAL
> > because there is no bus driver to manage them, but missed this one: its
> > siblings mmss_mmagic_ahb_clk, mmagic_video_axi_clk and
> > mmagic_video_noc_cfg_ahb_clk all carry the flag while
> > mmss_mmagic_maxi_clk does not.
> > 
> > Mark it CLK_IS_CRITICAL as well.
> > 
> > Note that the halt bit is truthful here and must not be papered over
> > with BRANCH_HALT_SKIP: touching the block while its AXI clock is off
> > silently resets the SoC.
> 
> Will the right fix forward be to grab a handle to all of mmagic
> for MNoC and activate them as needed? CLK_IS_CRITICAL is obviously
> a workaround

Most likely. Some of the clocks might need to be removed from the voting
model at all. I'd say that it's a separate set of fixes, possibly
affecting other platforms too. I have it on my todo list, but it's
long...

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

-- 
With best wishes
Dmitry
