Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699685;
	b=e7+raqHvqdZcrwH5kW87gZ6JAQGOl93vm/P93MFqIudvhXytMF0wWWwn994i5S6kZbPU
	 +lfNLmn1WwueZpl4aP/tTacic9LhGxsgXIfZ0dLJkKio1ykwd/65CoQelP0hDQxhBBCI5
	 4rbgLQTUirNl7x7sShlzuzr3RARcuvxEYZr9rh/jCcWxus1d67KLx6OhOlxODkXZl+22q
	 TIcH1HZ5xp6YEhW5s1uNKWe/o4HuV+jRTLHQMQAv6bwtEs7N7hfSaGm8H/IOhoLEpQWol
	 7ezVcwnH4tTg6FbpOT+VCN3TIaotHsE7W2LnQvuJTzbFjk7JA525lqeackeEsObBLGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MlP1q3VZQzMJWxzzvYQLQv+zuzEymMrz2V7pNvd5GA8=;
	b=MT2dQ+viHr3u7KxFH08RGzrbd99ENYzHwXdNlhRo6hmdH6ZMf1Ao3bffZZ125uPTthMY
	 FsftW/gdYFH6iwu/BJZHrFX4RoMV1efbLdHlS8zB5DaKNpyQhNGYnABZdmNjMYqyEuNhk
	 frXSmuTnUFUqn6NlrgpAjDpQiqYi5bNOY2/+eooWHihXpt1Waeudx+/pPhcsR/nc1l0a3
	 ueNK2KSwlrb5+BO47biBMe3xd/MVjmHyBKMC/96PVvcURw1kWx+Mfab0oxfpJv7z6yJan
	 7xFuGjUyw3yKYjZc3NGYQnju3UvJJv0jUhG0/mlwXPDVrcBdTQ4KfBchxR1KHU4cJdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpCO823S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJM31CaU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D095C606EEA3
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D095C606EEA3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpCO823S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJM31CaU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A352lZS2449022
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MlP1q3VZQzMJWxzzvYQLQv+z
	uzEymMrz2V7pNvd5GA8=; b=fpCO823S32g/4N/mDAHnZYtkrLuTEeHpslQYwUZ/
	0xJKZh2WSWxgEV1KXXtn+QGzIzJaSXjmEwfXOgcmdqGpiyCvUZ6V5Rhr/dF01sDB
	IgI7oWryKEE1obMccTAQvR4uyR4XN1+52edoTQQbuWNgDBnAwyfkKxSmeJ4sIGJM
	xRqoWqICgoMvMWf8QSSJEheO2AmZK+KLLoSTHbGc5MtuclgIFOUFT6WyQmUXD6wz
	klh44eKpTODAeI+OuJ4KjdhFTnzMbGSGJ2Kf2bfOuEHuo5zLu1E7WyDjguema3/b
	MTgg7VUk21N2xwyUAgsRkJnvlsWPERsfQI/UuCwC8XAeyQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cs3y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:54:42 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso407360137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699682; x=1794304482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlP1q3VZQzMJWxzzvYQLQv+zuzEymMrz2V7pNvd5GA8=;
        b=ZJM31CaUQt1CYhSIs6qQpS6MiodNNi+hnp73uLmctfkN8zcJjbHFCbC6Zd5dBNRZmP
         aH5LN6ZOlkuyzXa9tIQGFgN0j5HanJ+HK7ITIxrPMIo6rk9t3+z3ajk97VGe6Ie8mFj6
         iE/wCFbc/I3Z0Lm1TlQ4mGKwNM1TAfSamp+mvW63uD0UvBv5VOD+fT3xNksDtUHFGaA6
         0RMmVCRjBPaa+5iB452WZI7gfmr7xp7L2IqjOXsseznleSYN/o7Uc3wUvrH2N0Hi82HW
         2llMdbJMaZm9IlPH5ZvUYh1Na7KZ4sBSk1iRoHeAn/Ti8t8jaN2lVEoXFr8TZrZJwx93
         I7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699682; x=1794304482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlP1q3VZQzMJWxzzvYQLQv+zuzEymMrz2V7pNvd5GA8=;
        b=pJYQvPTvaAp9esHNpBHeuws+jSy1QzfE/tjFxlsZ6UXD529ohfW8PxOtMcfX1U5qmK
         FgyI6RoiFVyolKk+9CY4R3YCoDSOiRyTY4JWArtKNk15Qm0dm2/tHatVqUyuMXICxPzd
         1TCKJMy5GfOYRwZrccdzfU0idPouZnnk5U4/VX0iNLCL7nA994GSbruVgKJUP5sAWDKC
         LkHR1YQxhHYWvHkj+KeXTUkPFruGMfbzGimWxHNUCD8ZDimZiClz3Gb4MqzvjwdDQT0h
         xRn9ERFkOj60jw7T5okwhkrAy4Wqd6uEOcNClm1P8auCszPhNoOTqF05cZTCzUfFNz2t
         gqFA==
X-Forwarded-Encrypted: i=1; AKwUvBxShgN4ZBOUJRXgMBtzbHdAtsOLAlykrM29xqF1HX1bUeSKnogMyvJA/7qdDSxBAmlMKz+QvjbOt3f03ldx@vger.kernel.org
X-Gm-Message-State: APuU4Z+q9eBqTLi3dHCZPlILyPi3QH6SC+3saqHComjn41EXOVzhxrSm
	veBdwR8re+Ago+uyF9nXrUdCJQrHw+dtJP2h12Qppfh252+dGJ65Lxvdmxc9wXg8F2i66NwjQim
	LNpj1ZjG0ShtiFPpqUtBq1CQSyga0sBfLYKL+jwACOZ2qfVYdy/5XAgZjjo+sOS1q4KaV
X-Gm-Gg: AYBFou0nZOTRBuBbQvBwt65SB7OYWpjFqrdaLuPNpHF+zAb+s03fAWxtOwnwbeviYPu
	KPgmCMjHG0HiDIIyzuj34+H3H5vCKV58Mx5G+kZfXs518k9Qu2Em5aWaWCDrOdiQm58rDu/X3kW
	Iowrz35v+JgygqFJ4x/Beb3dwtaCsch1jmdZmrRou/+V/pnhEhtVU9CZwYQTRKQU0I117kjkRgu
	YXd8D6+t5GtS3nq+RYbTPaOeXAm807uV262pMGv4U/3342jl2gfWuv67xwtoyglHLyV56LCenyI
	oGiLZRd2tWHTyW4PFe/8y5IEuc6KJKqI4Fee+RnkRfr4h8Up5oT4tFbYuZ9lGbQJ8aheNYYAVKY
	Aj5Z7t7JYM3ZbRBzTHA2nzSSS3Bub/y53Als8ERZXQ8nuIHy9JfJlaYSWxoTO/EM=
X-Received: by 2002:a05:6102:a217:20b0:7d0:5add:637 with SMTP id ada2fe7eead31-7d05add135amr2794501137.19.1793699681848;
        Tue, 03 Nov 2026 01:54:41 -0800 (PST)
X-Received: by 2002:a05:6102:a217:20b0:7d0:5add:637 with SMTP id ada2fe7eead31-7d05add135amr2794494137.19.1793699681192;
        Tue, 03 Nov 2026 01:54:41 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm25815616f8f.55.2026.11.03.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:40 -0800 (PST)
Date: Tue, 3 Nov 2026 11:54:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Fix the L value of Zonda PLLs
 with a negative alpha
Message-ID: <gvcpvbyzxrgo52iu5ba2s4sri4wovte7w6pss2zuqtiptemy7f@5k45zx3uih4a>
References: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
 <b8d60bb8-7000-4f9f-abff-02f596e1bee4@oss.qualcomm.com>
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
In-Reply-To: <b8d60bb8-7000-4f9f-abff-02f596e1bee4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9af62 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=U0MhLFlXrxXVFuOl:21 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UVt8oCwF8lmOR23gQuMA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: acvcqa6tVrzLHMdGAmSAkAIC_kfwdpTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXwwqMPGo5wz4a
 hgwEcydbhL9dKXRPn/gY2WDbGSLGWfYBFV4fUx15mMMMKEZPLLzeQQ+qE3Logx5riqcCEFw9jFA
 n976dg+41+nK5pfEi8MgTxdTV7v7eWUnk2clrzIuJdWqgwwIMVRuQa7YraI4Ax3IrpdXzyHIkEF
 aD76Gb2B1M3n0XWpbalojJe3+bweCHvG/xMaDlxqnwdEYwhHHTy+x1qGu820aIVMBMwOb2anoiV
 Gm6mPRbA7jfsgGLdZEF+mpzrR8iphtuYZWTXc+3h74UxZwWOB4v/ylMChBrKgfZpTBkp0QIn+Du
 t22oslxLixszpEQNwxu2stJr8w4S88KkfQA0rSEWgKYwyb16sy1cadBpUWGPbrUGb1HCd8wRwFC
 Gl2/xzvh7BuWg3IYPswj00aIwurl3x7EbGJ8lITMYY2lxVs/Vm3/vhRb5f7IY5K5ssLE7c6S0On
 E2QfnBC6ME5IzyDwKzg==
X-Proofpoint-GUID: acvcqa6tVrzLHMdGAmSAkAIC_kfwdpTd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX0eqSKYwSTYry
 c+IhIzKhgh/i7aHnGK46V3+rx0zEiKRMPX9CAq8vqukzEyBsB9AKjtYJyD9yzAjYp2Kj94lPsXz
 dgIZ5r8o4Vl9l5pVkL+icNje2fOIHGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030039

On 26-11-03 10:49:34, Konrad Dybcio wrote:
> On 11/3/26 10:48 AM, Abel Vesa wrote:
> > The alpha value of the Zonda PLLs is signed, so for a rate with a
> > fractional part of one half or more, clk_zonda_pll_set_rate() programs
> > L as the integer part rounded up, through zonda_pll_adjust_l_val().
> > 
> > Since commit a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the
> > zonda_pll_adjust_l_val()"), that function adds the rounding to the
> > requested rate instead of to its quotient by the parent rate, so such a
> > rate change writes the rate in Hz, truncated to 32 bits, into the L
> > register.
> > 
> > Use the quotient again.
> > 
> > Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Prepared with help from an LLM-based assistant.
> > ---
> 
> https://lore.kernel.org/linux-arm-msm/20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com/
> 
> Konrad

Thanks. I missed that one.
