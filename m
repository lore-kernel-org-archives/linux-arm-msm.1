Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3204748663E
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 21:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787261377; cv=none; b=gr5RaGuP/+S0REeTgxGLWIgsniDz+2kyKxlvLnGDikyhqhEd6l/G2EUnuLJDL8n5/Hjiwf1JkF149ndnu5Dfq8+4ruQQgi9w71ynsjhsz+jD9ku2AJv2fnsrSn+wi6ecCfuEx7PwoWFOzYA8KDut377/nD8STPHSw1PIODT66KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787261377; c=relaxed/simple;
	bh=3U8hOhcUaSM8cl7H3bgddxz7BYklyKGXNlS5hb+5tHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJOEigOvU9MEBVL6Qb9mxawUnfIX1cQLyXi5HooU82L5SP3WZNDE5MFZ3R8ucjjlkjNtXbeaTHOZj72GQwwznR2YtwF5iMABTFDCEpA9ZDxvpRRQ4+CULv8WlJgCdvJfV56uqzIPxDVGnMZcBTFphWwN9eOrb+6gRhEBzpbuh5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKmoS65s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fcQNv/T8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKmoS65s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fcQNv/T8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7mSQ3491838
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 21:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9uqQFxwRodtFqYlk7/aYNiLJ
	ChHVTsRqrvG2j+wl1c0=; b=UKmoS65sY/1qA53XAr8HAzNF3W2rJ37i1muVQ7m8
	jHwLnFlPzskQ8D+JEKe/SNMZTvy38eiDYgAVUNfRkiNz1dQWH4gduOO8Y5LDsBJ+
	iWjtKEse+PLr3qMi7UQ0+fiD07yHk7Nh8d6SVgCOyhF38VcvIJcoRciST1jAHKSN
	5MkBGWdcd2ZmtwghljdpX0iWE5N0gr3Dsw2O6l5b188Zy8yEcMfD+9E6/ba3k7rG
	abbJxXH0N9s6DjuLrrNjG9ANHuOc2SODLGn4aGulm2eJD1j1hYtWPuRxY/APcMvk
	ngqLxVQ2mgJbkRrfUnOuF8aIq58QYJA0fGZqIwCNewBbYQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytcaxvt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 21:29:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso5028451cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787261374; x=1787866174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uqQFxwRodtFqYlk7/aYNiLJChHVTsRqrvG2j+wl1c0=;
        b=fcQNv/T8cG93Ghve7jRTcurgv4w8oXZ+/EqzXgpkKWxGEjN/BoIw90t7RkTjBMczrj
         WOU9WYRbbknxaVOvJUjfwHzh8dfQcB2MBTb7MA0w5njeDLbqsAAqX24N1FnhsTrtCoVm
         gMAYD6VpDWWEgobTdCzoTUVAOyI0M7TD+atorLj+WBw/kxSck2S0ht8FNxgpYYwEW99a
         EQo/Sxn5N8B3Fzm/Hf9KyMv2w7bj7uGIaK58bb7yXHvTJ9dabL6HjXGJt6sGGEHkUFOE
         xRzr7URoAoHeFwCxEby5EmBOpq7mnTCjDSPonDiItWXqZd75mMWM5yRjziA2GT0sqBcF
         p1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787261374; x=1787866174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uqQFxwRodtFqYlk7/aYNiLJChHVTsRqrvG2j+wl1c0=;
        b=P2Nvcmw0tKx4VMTeA/+T35ItXi1pWv9Ktji6UNVFL1DNq4724F3AeVqDdMtsz0VFE1
         x1e+OUtT1g3XSqT/UJK74eAg2PWigGJ4pDwYRDpKGPT2DmZxeSx/EYa/2OYvklgY66Vz
         EZ1R7OFkI5sbo//0sk7HcJe96myHovMRxHDnsuZubK6Y86Qwzc0GFOMFSk5Pq3m8NaHK
         GBnsYs2wj3Ua1xCr6k3ihSURx0cNGaOQ1Cs733NmtBr2GeLG/XSdJgfXUDHGIvhywkAB
         yd9WnYFebAed72WbMZPeAkTCOYj0ytBTo2dFa+rI7GlCRqBWN4G34GhezUNHdMZGfMwt
         oTOw==
X-Forwarded-Encrypted: i=1; AHgh+RpY22B9ANa4+5c3m62XTFvcyJeyJGFv75bzz1fuLyAGq9HN7KtXBazsqI5O3vVuPEUkuY7NXMV7iCLDQa3k@vger.kernel.org
X-Gm-Message-State: AOJu0YwD8unjIywQ/j+pIKgMvdglKvAaSo9/xUR8x5oy8sxZ4UibHOW0
	tVKm7t8Uco7IuCQIEFsJlynSAVaqOw6tYOvp4DNHDhmv+xqq+Ahn6bhC/Aw4vrcQs6sOzHYsbD5
	+hEw2HTyTP1eHVRgwOgQjXD5agYVU2AUKkJHpyAp7wtgSHRo6BaVDkkJT72+JbbXiYLb/
X-Gm-Gg: AR+sD13v8TgBtB/k5vppvCGYl/ZG8NiZYbkaINPD8wFOuPki98wt59oDiIsE66WWjXH
	fXo5zvaaLfe0O2EOKWAT2Y43sm1k9BFhYoCQRC8Ai6d1Z+ObOTBgOjlhNl4d6rbWtDmRmOqKohG
	AUksjIRXjKMh08ofGKGcYoXvXnpTa9rKWAHMF505b9d2Lq9ryPZF7+vo7lh9E+nwW6TE2USwre3
	hxdJhmLzv4OwgUgQlSEQZwBG7wJYtAogKCrSjpW4T5QWo37NtlEMbv/XTDRHDPeoiWV02dSJ6lO
	O3KgN6t6KVP4EmS4iocjv4QPqvQaFiFblwbmEqGff7clI+GpKabBvFhVJZVEZj2RCgqJg7xe/mu
	EsC3o2VEHLxvk9qz6wovDQAnjEYxvEQTip9o+sDApvvknLFVoY+s6lHk9HsIGZzU179vuO+PXuC
	A+/zEYgBY70NWv
X-Received: by 2002:ac8:5cd1:0:b0:52d:bec2:c34d with SMTP id d75a77b69052e-52df59fa01emr14900101cf.25.1787261374261;
        Thu, 20 Aug 2026 14:29:34 -0700 (PDT)
X-Received: by 2002:ac8:5cd1:0:b0:52d:bec2:c34d with SMTP id d75a77b69052e-52df59fa01emr14899701cf.25.1787261373882;
        Thu, 20 Aug 2026 14:29:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4788d9294sm1539670e87.40.2026.08.20.14.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:29:32 -0700 (PDT)
Date: Fri, 21 Aug 2026 00:29:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/3] media: qcom: jpeg: Add Qualcomm JPEG V4L2 encoder
Message-ID: <4hsy4gguawcbxbj4vdei4mlimb5b6gf4idnpcdq6rjyondn4ff@3wfuii2ogvzo>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-3-atanas.filipov@oss.qualcomm.com>
 <vz6a2qugu7kkci3fcdkd236axr3ur33ghrgoopbrz3isueml45@b4frwo4l2hfh>
 <8997090d-1749-42cd-b9ae-b9c42f9e263d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8997090d-1749-42cd-b9ae-b9c42f9e263d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a8771bf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Wzl9js3sJEcO2ZUYT1gA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MCBTYWx0ZWRfXyTkWjSuPI57p
 8EMsI+ETYDHRsIfxVlKIQxDEwgqllpxPKf0nQQ8IkelUfHD1Uit/Lgb4evuE/ZonNFmzcWp66wv
 wQ7/s2+3cEjwf1mpL+enGwhlvaUjFVaiyYXueT9fNY65T9ryxe67gUAMtLQ0b1E5v8Nes2jjJbp
 rBk903bOttLwUSAld59d8KSwU7ifYT3KFUEkkm5aowN2JLxWDpdLOkJRjAiXcGDHf4IPRewI38t
 bp6F/wEM09CynKMA4UFynn3lpupQufnM+KIAQItdKn8y9Zru5G211tIp4IL7W19cuLAqk6mdlpH
 gRzzbzEo8U6n5PHEjY4EAyBdm+tkh//RGGAJKRje666R6L2DUnAjE37WdS340iPQhBrIuDLcMbf
 MYT7AX8r8JE009EvcHIQCI99kwnV1W4oQgDqt3lZkQ7laUUFEozbQfTVr7e0Wm+OVfv4Yq9fZCu
 5sXoK1lBcyBUuFsI7+g==
X-Proofpoint-ORIG-GUID: m5pE1-nzpeUYN4pvIbXB_okhnTyDZE1g
X-Proofpoint-GUID: m5pE1-nzpeUYN4pvIbXB_okhnTyDZE1g
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MCBTYWx0ZWRfX51e5Jtj0cKCf
 XTSTe26lZtxDgKtJf2LoxPpmSJ9MDaxKvFaw11QcQbskF6e22oKBeNh8pJ4p3EIsNp+QyfDOTKg
 i+itMqEwMjOBMzDqq27YrTTobQIZ4Qw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200160

On Thu, Aug 20, 2026 at 09:38:16PM +0300, Atanas Filipov wrote:
> On 7/30/2026 6:57 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 30, 2026 at 06:05:23PM +0300, Atanas Filipov wrote:
> > > Add a Qualcomm JPEG encoder driver implemented on top of the
> > > V4L2 mem2mem framework.
> > > 
> > > The driver wires vb2 queue handling, format negotiation, JPEG header
> > > handling, interrupt-driven job completion, and runtime PM/clock/ICC
> > > integration for the standalone JPEG encode hardware block.
> > > 
> > > This series targets SM8250 (Kona) platforms.
> > > 
> > > Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> > > ---
> > 
> > > +
> > > +#define JPEG_V420_HW_CAP_DOWNSCALE_POS 8
> > > +#define JPEG_V420_HW_CAP_DOWNSCALE_MSK \
> > > +	(0x7u << JPEG_V420_HW_CAP_DOWNSCALE_POS)
> > > +
> > > +#define JPEG_V420_RST_CMD_FE_RESET_MSK			BIT_U32(0)
> > 
> > What is wrong with the standard BIT()?
> > 
> 
> What's wrong with standart BIT_U32() when dealing with 32-bit registers? Or
> do you simply like requesting meaningless changes?!

It's called uniformity. Most of the code in the kernel uses BIT() rather
than BIT_U32() to define values even for u32 registers.


-- 
With best wishes
Dmitry
