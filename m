Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491050;
	b=RXqmjZmF4bMpIU3U5roPwYHZBrBiV1bSEO5dr7K7Njv2f3UuLZGhMiGJyCvMIfWQ8pUv
	 7u4TZGecUBiJXmU/nfzxFN8ge/8CUkP+Hed/PdBkDXnS1IbzDtjgKp+5A3UiEDcZ0KpCW
	 caqJc8M2KQCb+mPLnJcVc5pX1srJiqhJmeWcHBKHCKkE56mAX0z3thQBBIiDKwLAl81Rv
	 NBvsZYCHMj0moCk7E0cyo2wR7w6hv8DZ6aDW8g2RhwleIMBdW1BuPN46w4F26TALIR/bU
	 mSHOlWmbzJyWuJNh++82VCN7gCCE4l9Mj8Oe/jMw2b/lfuaWcUSSWPjExKjEnSIdIgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491050;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2ws4735qh4wR/HsDhw2lJB9bz2bPEpAWvlil4rhqeZ8=;
	b=Aya7CoIGYEKvbYrari7MvDOAXTwJsQWYie4JKrmFANNtWLQVkRKxlih2fc13kLW6R3CX
	 FPXWL8U1f76ZDufjro6FTpjy9Nmi7XcvYnPS4aTvj8qDKqDKyA2aAjmudpdhTXSjQGG9Q
	 QAHAHr3p1EelaPYFkNKYk9TGPHyG0Gyxb/v8gQT5ibrbK741S8IXBMup3Gj0kCT2qEtqn
	 EraL8NwuqnVorz7jKXFLPaRNSG7RAC2aXLvpNH4XTV7FJznucdjqtiWPkFnIzKuJJZkUn
	 iGfytIarYKQVr5G9yxMGDmQKRzcjTStZocJAgVWkQ/hkB5GqtO9u12q+kseSZAzhmtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bx+azzKj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ddJ30F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4037160A2636
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4037160A2636
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bx+azzKj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i1ddJ30F
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K9Dd8i1785417
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2ws4735qh4wR/HsDhw2lJB9b
	z2bPEpAWvlil4rhqeZ8=; b=Bx+azzKjdEpWAZ29MxriNvuN/bpRtf4SUZlWdF7M
	sBmGqesvDT9x84K3FFggEf688tCYYfCBDIRh0dqL2iKUCw8wl1hFb8wkFcanZYsD
	tfGpZsuT8NiwfjTxiQxp90UAMaoDU7LOurdfXV6Rkt3OYwRZz+TdSQh82i3iC1uO
	YsxSiA5Jdp9Z8avezlbGbUFWiH3cbBIARD1ET8VAlaEdDjNBRCJ0iU/IHwyIKW45
	V3dSddkwWvDO5ExUlG4qnjLwu64D7rKSKDrYbK3MR1ckJkTWj1pgT1mtcX1HOHDZ
	50qpRgs5g25LIjdGIvIsIovUTAgowlMSfVnK1CggL2Kj5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pj1bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:10:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so368796085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 03:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491047; x=1793095847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ws4735qh4wR/HsDhw2lJB9bz2bPEpAWvlil4rhqeZ8=;
        b=i1ddJ30FBlnpMa3/PtZMQZtAr8t7fGAkTMTkn94NJsNkI48eTCXEiCj5yNO5e9aVAA
         I3/kmwbWuQjSAdsAKcwhPqbF819F8KA6usedje1bRZ+2YgmnAkUb0cj0ro3N3RjH9Jh1
         fpHusyqxaN5ftI6e+9axPFHbkWZH66+mTSyGw5N4cstg5HxP12QcXfLn/ND+BixoJTzy
         Qs84pNF0pYtoMuLA4DtIb7/tGSA/b9w+5LpFri8PE5t/h2OzkMzpnkk+DUoYYZzl6cbN
         ezDFTMIXeEgDIaEKnMwR/GIUCoHtfkIVdYtGpPZMyRIa7blII7jE+Dr8CM+3vFCiabPf
         n0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491047; x=1793095847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ws4735qh4wR/HsDhw2lJB9bz2bPEpAWvlil4rhqeZ8=;
        b=fxg5AE1+2SvK8cjoWOSe/nHdFo0gyiBYFEacb2GdNOoIbaGtnxYU8Wew1imBSRiKza
         Do9ZcxjONoBY58wXc8GNS4Mbd9unORaL38hdgVEf7erWaX1Kah3urrtLs9tTjBXGUBKc
         a0cPNXE0YayFWiX6uZ2kZnOKvVa/I8U8bPCUV+xi4ZhPVZrZz60/RyBBxHyIa+zu0PVe
         zQkVM8bnRh2reCq1gB8kfFzsYCRnOWitHeumu26AjTWOny5jYHjsWW5OwFvwiIWP+C8v
         MUCyg2ENtpUWCiFa50DtxOqTSN9FJTkFeqHU/+DJRkklcMXVIlrs8G5+RsRP/rnQX2rV
         NxoA==
X-Forwarded-Encrypted: i=1; AKwUvBy9EtBfvON+/YyNgfS79xQv4t+7yFrgqf6JXahoU5n9mKb9zKd+fvDvOyg6IdpnnVcnf2Hd2kRJEBW0Iu+5@vger.kernel.org
X-Gm-Message-State: AFq9FYIQVukkdQQzaytcFnxds8rz93uX48zR/8fUioEbXNCG5DIErdq8
	V5ZJLLe39B/1fmVzasmFf7xEwEaYEF5CiHGu9labeXXJ9lH3HaOJKhBZCHJSPUjhCYjZx10K3NM
	ehF1EnACDF3pfQgCsTnVQUc80/4dPEbt1//oY8rUvOIQ+w7xQ+DZvRfAPUYrtZznR5Jw0
X-Gm-Gg: AYBFou0HplOm3zF+7H5y0+1NdGZGS7NgoL4X2gE7GLJZIlirGZR0pQAvn5sRRh/vDqB
	pdH5LKAj50kTUjPZHmIWS8HlzaBGaxZYjnIc6im6g2lSuXZn+xfXnqJcY+cRj3g7WOwQmGkEVEw
	tUOxb7bsMcQEmElXLWE6pg6z5aSzm3ri+kR4nkRoLepJxrwDHVMItL4XuPKP2I9bHPQH/PjjUjY
	+I9w2aLmhndtxtlKL1JeVN2sgRb92TxQrMRKp47wAA3EkiIVW73mdvM20iVH4L3gmB3u3Reu4cG
	PkQwGskgV3v6I0bWGIKcmUGg+2WJkdPrhdo8gSf1Bo1X8Ggpc2HEG1S55CcvZaprgdA0KFFZ70g
	wgOAzGwO/7nMzmc16aCCT7B4gtCTrXOByxkvvaQsvL+IKY3hO6JvbOo95SKjW0wcQIqnH6+E60W
	4YRg2UhEzI2zyz
X-Received: by 2002:a05:620a:bc4:b0:93e:c12c:fbcd with SMTP id af79cd13be357-93f29dce8f8mr1810484185a.73.1792491047338;
        Tue, 20 Oct 2026 03:10:47 -0700 (PDT)
X-Received: by 2002:a05:620a:bc4:b0:93e:c12c:fbcd with SMTP id af79cd13be357-93f29dce8f8mr1810478785a.73.1792491046763;
        Tue, 20 Oct 2026 03:10:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fceafsm2479209e87.4.2026.10.20.03.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:10:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:10:39 +0300
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
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Christopher Obbard <chris.obbard@oss.qualcomm.com>
Subject: Re: [PATCH 05/10] clk: qcom: cpu-8996: move off the ACD leg while
 the PLL speeds up
Message-ID: <iqwdlpjvsilp2zwvp4kljoc4txwaw6h6ndz42hgvakfcgc4lqo@ajr7xrkiwmle>
References: <20261019-msm8998-fix-clocks-v1-0-370949e4d8a0@oss.qualcomm.com>
 <20261019-msm8998-fix-clocks-v1-5-370949e4d8a0@oss.qualcomm.com>
 <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
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
In-Reply-To: <c3ac769f-59be-408a-81c8-9d6a2693d3f2@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad73e28 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=et-XlBO-5GXiIU7lIcEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: VOfjIwzZJMbDGUHzhpnUBPej1GNqH5IF
X-Proofpoint-GUID: VOfjIwzZJMbDGUHzhpnUBPej1GNqH5IF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX5wbMK0OfX4qP
 aBafJC4gAUtTNQMrHcv2538KqQnD0XNfvxM1BEpZS9aPmzalz/eIjI2i3KKHbqaoUe1UB2taE9U
 BnOkokXg5iaqaMuUwElKSHLbbDwLqPYyBOyPVmyTzuVM5BZ+2lxzHchow8bPRprEtJgrRlv/NDg
 Wofc6fu0XATPi1lOvGYq90ORDqNggewuSmxXCPQvbCR7Dbjhz1E28zgAWi7KbhTR+RTQxRSgXEZ
 9E5OTatLdpql5/RxeiQzkc+aV/aTaamHENCEcDPNdbu0gYPf3j3gNimgI9ALNsMcIOLGt8rxWva
 U9/ErmzeEySu0hJunmZHgKYvDoPUmij38RGcQiotkMuFlseinibT290TUgKg/n2Q52h249m0+nm
 uZRv3gNm5iYvL5qYAPdzCt/B7pLk/6L0BbVhPxLPjCn6MNz8W0CYq8tUTi684cc0A7ZSWsIxLyy
 sdhO94EHjA7EN8Zw12Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MCBTYWx0ZWRfX/cX3unW5kIaW
 Wxik6xQahg1MXuoq13eKwOb4d2wqdMngv5YcdicLwXcxkYCZVu+wiFfWOtKYaER3250kjZHX8DI
 2r+V9IULjmNdcQ7U/eduLNSgh84kV5I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200040

On Tue, Oct 20, 2026 at 08:52:49AM +0200, Konrad Dybcio wrote:
> On 10/19/26 3:41 PM, Dmitry Baryshkov wrote:
> > The MSM8996 CPU clusters sometimes run at half the rate they report
> > after going up between two frequencies above 600 MHz, and stay there
> > until the cluster drops below 600 MHz. The PLL, the muxes and the rest
> > of the cluster clock registers are all as expected: it is the ACD that
> > latches at half the rate when the PLL is reprogrammed to a higher rate
> > underneath it, and selecting the ACD leg again clears it. The driver
> > only moves off the ACD leg when going below 600 MHz.
> > 
> > Like the vendor kernel, run from PLL/2 while the PLL goes up and return
> > to the ACD leg afterwards. Point the SMUX at PLL/2 at probe time instead
> > of XO, so that the cluster does not drop to 19.2 MHz on the first such
> > switch.
> > 
> > Fixes: 03e342dc45c9 ("clk: qcom: Add CPU clock driver for msm8996")
> > Reported-by: Christopher Obbard <christopher.obbard@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> LLM has the following comments:
> 
> For old rates above 1190.4 MHz the SMUX output is old/2, which
> exceeds MAX_PLL_MAIN_FREQ (595.2 MHz). Downstream does not do this.
> clock-cpu-8996.c acd_safe_freq() returns freq/2 only up to
> 1190.4 MHz and MAX_PLL_MAIN_FREQ above that, and pre_set_rate()
> retunes the PLL to that value before the increase. The comment there
> says the main output is what keeps voltage constraints satisfied,
> which implies a 595.2 MHz limit on that output.

The 595.2 MHz isn't a hardware limit. It's the rate at which it is
possible to start using non-divided PLL output.

> 
> Up to 1190.4 MHz the two approaches are equivalent: both move the
> cluster off the ACD leg and run it from the non-ACD path at half the
> old rate. Above that they diverge.
> 
> Either clamp the SMUX choice to match acd_safe_freq(), or explain why
> old/2 is safe above 1190.4 MHz. The second needs the hardware limit
> for the non-ACD output, which is not in the patch or the cover letter.

Downstream isn't keeping the main output below 1190.4 either. After
pre_set_rate(), cpu_clk_8996_set_rate() asks the HF mux for the target
rate, which makes mux_set_rate() set the PLL rate and then switch the mux.
So the main output follows the PLL up to new/2, e.g. 1075.2 MHz on the
way to 2150.4 MHz, on every increase above 1190.4 MHz.

The main difference is where the cluster waits before the PLL moves: downstream
first lowers the PLL to 1190.4 MHz and parks the output at 595.2 MHz, while
this patch parks it at old/2. Both are lower than the target rate. Following
the downstream approach would mean reprogramming the PLL from inside the pmux
notifier while CCF is changing the rate of the same tree, which feels incorrect
to me. Also it wouldn't lower the peak.

-- 
With best wishes
Dmitry
