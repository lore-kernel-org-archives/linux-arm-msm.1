Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D65E43BDB0
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457240; cv=none; b=BfSlnOWTK4JlyPlONcYeOpbPxh17FNNSDSUOBcfyyQKyWAOszyciQ9hT0QFR8RUHbEMEuEQKL7ee6CLMbs1ARfWXLSm3Tg9H0UUCjhmweBXiYdnqylXpoeua9pyO+AjB+OfwXVyIJuXXL45a7munkDVw2xmeHzvrQg0dnxacASk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457240; c=relaxed/simple;
	bh=teMokuG5eAWz337OsbJemBey333F13RFcsDFNyApnuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbdeTvsISd/LSXKyg6ddR5mB3hF+bkgyaaJ6Nvn2KLPofpgMYNoCh+MMiKA3FDtQe4CvqG9A6bZq0x26kdUwomUgIvx/Cen9bB+XtN4iaMq0kr9CnoOXXKgV/vr+zS/Ylcqg46mNBb/xwOWFnaJNar33IC6dHojRkY4vVGWLhzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pa/G3Nnt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3U5bquE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pa/G3Nnt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3U5bquE"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWlZl3718178
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:07:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vB+L8IQzMVlUf6Dw8qOqlWDCsl3ywdbDtRCKTwpuefs=; b=pa/G3NntkkJH6Hr7
	EZXyeb37cBrycJ/zEXuxp0UQGPD3NwKZ6PkjwKPDos4cNaxJ9PpfG6xsgoLKPsjD
	iB5ggGJaJxhSAlsNrt3CNL88Z3gbiRyFA3FFb1XUKdW2sL0lXIEkpiUm3sFe47Ld
	I/VoJgvhbTspEptjFpqdbRoZtqaifNAISGAnPibEIVU55moA5+Q7Yf4nCDiPd/qG
	Fz9uC6vihrrHAYG/4vj6ndKO/xHkRBcChnMR/Ap37KkiNSiguewDOWx4Zba6z73J
	PtRWCZUQnfArmjgldOexsn0SJZRe2PgaiaVS/tR/sdqXaYjUCVXaQoB0/Z0jIVHF
	QYQCUA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxweskum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:07:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5283fa0656dso13685611cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786457236; x=1787062036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vB+L8IQzMVlUf6Dw8qOqlWDCsl3ywdbDtRCKTwpuefs=;
        b=g3U5bquEWoJ5rXW7/5pjCpXPubIUuKAjmLXbil37wr6gPLxA5qV7zPBDxEVjzMmOmX
         4Wjrd+6SxJur8N/jjaJ/wFhoqaS0OhlkWQreDhlgs/8RI0j+JnKMaN6yNpOOcn8jUlW1
         vb3i7reWXLS+Fa8DyHNDHmxM+zogyhwjQf20PutquHXuQwPZujhHmj/dsqONhcRyZog4
         xBNLgcMMQZ+zp1LOfyNtBOxn8/AYrIsS0ujNk2R9M9gp6UiJZZRQRnB0CEfBCePHu9AA
         +VwTrjihH/xXwKVdRmk78fbK00M2D53WT1pF6P1hN+2d4wV1v7mwF1r5wnmebcDxsKok
         P/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457236; x=1787062036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vB+L8IQzMVlUf6Dw8qOqlWDCsl3ywdbDtRCKTwpuefs=;
        b=PPmClPlCoko1LG5Awx2efD9TbpFcCq5wPRnrEcgMrvQ23+eWKZZWEMiasePSIcOL5t
         v2SRF5zXRxrkM1dqg0iGNVc68/Ia1J/8kgbsblBp0POnG1lKyvTmtv7rlLJfJd3eKk6K
         GPTPycLt5otuXuW6nHSKxPiINQWC7q1gX3iOdzlULP01b323JG8NRk+T3VznTH/USi7x
         yXFbgxHAukImjij/IQuS1PpG+JYZE42gTof0jg/X3ytJeh6uJsdkoi5eXpKz8rLJM1ge
         V0dcEq1gzqK4vpb7jQLi9uwcxrLtQVSa3P+crSjQWUvtCEJ0SfgBg3VSjhxUBzBoU/eD
         EajQ==
X-Forwarded-Encrypted: i=1; AHgh+RrONek02Uij6jMxzCnLauTueTjsiXoaV6PbX11q8uJD5hKuoV0CIbGUuhN/vN04bRWJkC6cxA2ByE28S1eX@vger.kernel.org
X-Gm-Message-State: AOJu0YyqY1pxvDRY9gpn3fEKikPsrRmf99aOhBmnOW1hV2RkVe4b2amN
	Mn4J/aL/8IBMn5E7n+yMPOaXgZJ/AQUHPajuCcSmyc6v7eteZSx5DnCuz5xlzBR1Rgv7N8/N/UP
	GsgQY9q+tw1JC2w9F6WDE+BwdU5farFNgkrW7bDTmMZW6/SXU5dFDrtZELwKuTJYx4oqW
X-Gm-Gg: AR+sD126mpP5F6GqRAWh3G+aKBMrWcxqt9YS14BcZ9/zqgI7TRC///vgzB9hvxtVO+j
	wosRL69ujq3eaqoXORE/vTBmSQG8WRx85/LVlWTqIKZijLdbzVR2IGQF1WCSmQK5T8oGwCPOTS9
	LKWfSj2y2BMVAlKTTBYc+EkijwTtlpNG2AZbkkIhe5saCTKKPpy44wSA6r9pDryX73AoT2P4emz
	TlXaohVA6r40w4pLIbSn5SiagUM/5X5tMxZ6nwPAtj376E8qPdO4uZMzPb6CLby3ih67+MYsC2L
	il29kL6U5CWs57zvpei3nIkpew6uogOsEMaQHOVTWID0kuaZCt0PKJbTNy/cz1RbcL7L1HCQeW3
	E9XQ9N7X55zHXlaPXXCAYB9XstXCljExZ+SYq2YLFwcCPBjT2qbvsKZgDTwxNXDYhbBj1HCjPfe
	jjqo+5hDh8Hp8a+g==
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr4447081cf.6.1786457235746;
        Tue, 11 Aug 2026 07:07:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr4445721cf.6.1786457235149;
        Tue, 11 Aug 2026 07:07:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3fbca3sm2995831fa.11.2026.08.11.07.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:07:13 -0700 (PDT)
Date: Tue, 11 Aug 2026 17:07:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 07/15] interconnect: qcom: Add Kuno interconnect provider
 driver
Message-ID: <lpzyzjmnhofp6plxscqsuisoujfdviry6xy6poghyltqtm5ean@dum5bcc3ffqx>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-7-5e0ede4a0c72@oss.qualcomm.com>
 <xmj3xhnvdixooy3l6wro5f7eeehlrlrq44y2mwojzzeb3yjdjf@e3eo2772qctz>
 <f7a76790-0e7f-4c4c-bb33-36134a0f3e29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7a76790-0e7f-4c4c-bb33-36134a0f3e29@oss.qualcomm.com>
X-Proofpoint-GUID: OWjE5RpGsBaBN1kG-k94hYmzZ9_KGyNz
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b2c94 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=ixw1xMl1IcNJksMvGswA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: OWjE5RpGsBaBN1kG-k94hYmzZ9_KGyNz
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX5c5p7df6ZwHs
 JCs1hdAhg8L9bso2AyI0+0uTPefCoJhO7qgKSBQG+N5wJ8ovaS9Isz1b9jD7KiNd3bxgmWQVzyF
 aW0yco3C1IvVwOWIKL4Kph5YIjRvyoA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX2tm0kpIrd1+h
 dLLFl0lwuF+5nZ9a0dmmBeZK/e9Bm9LavGd0SR8G+0t7ng8YF0mfOXvelWSjdha8/zP3lTB8oyK
 pvdbE0OZ4uqEGsHBCjInghWvNCPP01++cFUNoRvH+4DzHy3TfeZGNYkMc0d9FesOH6sq7IIUv9n
 m/zrFOi+wrAmJOk8ZvQxv1gEXkHZqXXRUgxyNqbrIKYOB2D1q+n3JWcAoV0wKkYd11h4lVSQKn0
 3wnwptFXuTsnMAL57QZy18NgzcI7KLH9WxWYpZ/Y6RIZs6vqovOxSssAsR3hYbvXxhttmFnJ3SN
 28AGE+O89yEuIOlt5hPe9YH9imWvzmyl1B00Z4bVXsGBUu57VX8+GXy7FOYp5c7wIcaGmmAb6ON
 MJCo78rNGXsQAYov57Nwxnhwu/7v1EEInRqbtgIraxfF5txlfAchw+sq9az75K8BD89Lr5Tuqux
 7q99XNx5NKuhuzlR0QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110118

On Tue, Aug 11, 2026 at 09:17:08AM +0530, Hardeep Sharma wrote:
> 
> On 8/11/2026 6:30 AM, Dmitry Baryshkov wrote:
> > On Sun, Aug 09, 2026 at 12:57:06PM +0530, Hardeep Sharma wrote:
> > > Add the interconnect provider driver for the Qualcomm Kuno SoC to
> > > enable bus bandwidth voting on the platform. This includes the
> > > aggre-noc and cnoc-main NoC instances with their associated BCM
> > > nodes.
> > > 
> > > Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> > > ---
> > >   drivers/interconnect/qcom/Kconfig  |  13 +
> > >   drivers/interconnect/qcom/Makefile |   2 +
> > >   drivers/interconnect/qcom/kuno.c   | 978 +++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 993 insertions(+)
> > Please add QoS settings.
> > 
> Thanks for review.
> 
> Kuno's NoC QoS is provisioned by RPMh/boot firmware, the same as its SDX75
> baseline.
> 
> The upstream sdx75 interconnect driver programs no AP-side QoS and only
> issues BCM bandwidth votes; Kuno follows that precedent.
> 
> Hence no qcom_icc_qosbox settings and no QoS clocks in the binding —
> matching qcom,sdx75-*.

The QoS-related clocks are a part of the hardware description. Even if
they are not neccessary now, please add them to prevent future schema /
DT changes. See how it was happening to other (mobile) chips.

-- 
With best wishes
Dmitry
