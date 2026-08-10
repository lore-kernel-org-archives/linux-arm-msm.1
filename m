Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750D43F329C
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 14:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786371576; cv=pass; b=lkmacjapZo+DwF+Bdsa9TnuLGnA0RLUghvTqutg6ZWPP7/so3PBCdvLyx8Mf32fmPISv9Ce0pnrCkBk7cREgKys+Gtjha36pzFh7NYIPhLMvkRtCyo22yVQiM3EG7EiHWVu+dee3UXD2Gg9zJxvY3hfjGb4IPXpOW8txoktiD9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786371576; c=relaxed/simple;
	bh=n+Ksvu/zVWPobgx5KX7GBu9XwArpcsGtQQ3SBCwrIrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpbuqa43vXO50znxOEp1YLOJ0kYI2YY6c9fKnuiC+Xnksk0GcNv7WACovZPAQU1RMUwnXzKRjIiIWgZylTppPttCMTn4mOQzNAw1Z0NefGN4/RKfNVk5HOhctVJuWu6pHF0Ru0IT1aIzQS+ppiu5MEW/9L79SIsi009N8J3Cp6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ev1TpKH3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCSWrhxp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ev1TpKH3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCSWrhxp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACiocV397257
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 14:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=; b=Ev1TpKH3ebEU1fy8
	g+4xebhPHPUNEgczi4RSZlAAra5Cj91TiMJid3WIyK5/K42u1qxUcjk7uUCBQHoM
	D8o21YcfVK1/Y97choME6/qa7CdDIhuHrlaVEOIr7xgiuVzpWUQGLsJRHjecc0X8
	5OmdKvdY1UX2SdEE6NQg2yuWzpmvtnJjOYPGFJ+VOPekQ4vxFoORjT1aoxhP7vvV
	YYapTAPpjm+7JFbvSNZqrR5jaeN6QyO+1y8HV8IIM1yy0lsfCMSKDFY5nXQLSOGp
	AE5sKxscyBtkwJygu9QY3Z06kIxGDzYvIbVbErm3jiF7vYdIQvt+b22j8wAU+yxK
	2sR7gA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fycges19m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 14:19:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce64c41efso36494051cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 07:19:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786371571; cv=none;
        d=google.com; s=arc-20260327;
        b=pB2c8MNlTinaVRgDijQH8Odhr3zA0L7F2DPOGM9tmb3H/h2xb+XsNs0eVrgJyi/zXj
         LtJIOdf6y8AoolzrAUH7yn0oFQRwJSxDqG64HA7y/c5QPCm0PP18nURRH1u71GTKp+lt
         zHep5fWc+Mmp7kxZHhhstVUUp350k4uNWLsrzoRRfYcYNtqiEkpquh4sKja3NAI8VROG
         yL0FqVqaEpM/0Wd96QKMuU0mh1zjfFksthTjut4QCGITJAm88zFXuB5hASEy0Kd2Jfm0
         d5TkTuQ4emvPoIPiBfOjeafICjvvaFPd+dpKl804Dd/ia518ue84ZVhVQ21FY9RfRpC9
         T0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=;
        fh=Ib5s63UfPnyO49fDQYvUiwKdJSPbBrxtRWm+eqJJ87s=;
        b=AOt3XFjBrba+5dnnBaUU7Aoqi1+e1Rpm2MFpxUgZMcM4hH+fwRuc8XIiqu3q5IV0ZY
         3g0sdGOG5C4ahM08cjQpuFfH9t+ToBPls9Jqc9ICg8Y2TyEA1Wv+vKoAJjiaOI6QoBvR
         8jd89w/y7M+dA+TiiInu8spgFlcQKp9DDD/WU2r5xeZL+MNe4imYkr5JzZFo+Xo8hEDB
         ArpJpOqxMFpHjNA2RPlnXG0vaX/DC8+aWf+MR1P1W/+qxangG//N/NwjgcQUBiGr0uH+
         445mFInqdKF/vB1nlBOn8+K/j4AhNt+NE6KR0IdxT7J+tp0wkXWLYTaMX2RG+p6AbMD6
         Ahig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786371571; x=1786976371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=;
        b=UCSWrhxp/54c1zxxL6Rv0OqpS43JyRPPHsFf/oQkkHaUQOuChZcrIFqUkWKg3p9f5s
         3n4EjZXaclrirDAZiiexpY/RjB8zKPSQYceo8AasR3z1PQpPvEgeb0fxo/isuIARZGnm
         JhV0uTjMlissRcg6nvjGHn721k/7qrEus1jbl/ZKMYBsYZcn3YkpDdAHKnek8QKgqNDG
         2HlvGa0bplBCE8/Lbm9A8Vhn1apQQQeEqh2E39dnClzQrj/Q/mIPMfcWawvUE4/FK8FV
         wbhn/Gfw8Ko3WABUL6XQI7uUaMwyxTUDlYcCAcvIbaVT3mJuzdGNj2EvffndKF/R+km7
         4bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371571; x=1786976371;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TV2EQ2xg94/gFwpPmqRGt0+RWBXJJXwWFz3sZUe92ds=;
        b=BOjgs2cvkkPS+Js2eQyfqJ53iYX67tpZ5734uyVCm/ko+GugpNY5cAe0pQL+6vvHhK
         k2s0iLIjEbKD4G9MXPVn0GJLmwm4YrWlmQzNSVQnoZbCahstLPLhMhHABZ9IRZ+ATwnL
         TwgQH0h3JvFzD9/ps6EFlfl0RvA30BOfAR4ML/wBgKPDdjT3Taqyf7/mv+Mu9wBrEN1l
         dOdiP/VyPBLRp4achS9iQOwl83niNSShXInoBP21UEbU50x2BlXajOhv8EU303yfSPkg
         G9hATLOL4XJRpr0K0WaDtBRq0Wk3c/p6OKQPaguNbdhbA4iSPaOcd9f3N12GAK0eDmxn
         oAKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDbCYGGI3ZSAilFiAnOSmxwb2pdaZ0qK+gClA1w/R2R8+1T7elGe737a2sN1efcRRPNiVj6vZZHn78PuIN@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo08P6UnfdyX7a+1SyoHThgiPKsKsoxmZw4ge1qTGuQmHSCrEZ
	eURk55lzZlHYC5B9unhADKlXkElWek9p8TgkK7eJOIn8Iu2hyEnFJgw7YJrOLOVyYuHzni0vttW
	j9dfXLqVAk2kWOsTsVhX1OVBY9shlCK1M2My0MENV6c7N2KDhRqpWWB8nfwlc01MvyGJFyJscG4
	UWScJyTJEvaMX3+WN7a7Ylx9igkZzajaXYFDwn9mWIwGE=
X-Gm-Gg: AR+sD13K2soD3bhqXgXS1nuPCF/JpjnaZzpPdg2JNRsWhXE8pwvAjPB+0b4RNYZq8bE
	UNMPp2E6/8Kyn/WnvUxK5fIzCjakp2zSZl3gfKVWK2Cr+rtmJZHQE896sdh5cZ3u5KU365Ro7cr
	l4km0wDQKDJi/xwMNhimFDUZW9mTZw9TGM2PDBkh0N8oJW9GBvFgiAy+UEAQ==
X-Received: by 2002:a05:622a:4c8d:b0:521:8ef0:b4e0 with SMTP id d75a77b69052e-52d4bba4201mr24352851cf.17.1786371571051;
        Mon, 10 Aug 2026 07:19:31 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8d:b0:521:8ef0:b4e0 with SMTP id
 d75a77b69052e-52d4bba4201mr24351481cf.17.1786371570441; Mon, 10 Aug 2026
 07:19:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
 <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
In-Reply-To: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-1-61171ab1cdce@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 16:19:19 +0200
X-Gm-Features: AUfX_mx3R25JFulSxbPIMFamz2pIVHYPn9K-rVq3DlUVa-mxAozC_itBBx8G2xk
Message-ID: <CAPx+jO9MZTsDpofZ0fR7FxJbrfuAV+soqN3x7ttK-F7o6MkYmg@mail.gmail.com>
Subject: Re: [PATCH 1/7] pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state()
 on state 0
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: l0cpPjJlJ_BZRg333b9Qs-9hag6_Q-sw
X-Authority-Analysis: v=2.4 cv=R4cz39RX c=1 sm=1 tr=0 ts=6a79ddf3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=IN2mYG8luz48gvOoqwMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: l0cpPjJlJ_BZRg333b9Qs-9hag6_Q-sw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfXxctxfL6ErMrC
 T5yS4AGxYMLP6gS54qNyath+eXeqo7jtucTLhBPgX9wYm8Ht7wGYq40kBFZqgImaaYzFWgoPKT9
 3VuBJwpPaa7EEsxs+ZpV+k/vuO6/1j4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyMyBTYWx0ZWRfX4UrhgtX351fr
 VjgTLIYgmpL638IerPUGkotsz2hvQPc7ThHYtv5LHbpJXbcBh2in8ttt5hBvymU4eA3riB8imu3
 h12uV2g+1MpiMHiKU9HiZ97CWO1PUlTCWBBUZRxKhnCY0QPDrat8zd5dTtwhjYudJy2Ou+GvoS7
 pyYEEGZkfoz5Jk0CAd/Ke8ZCN/LPhbnsnEG+KAMC7+11Fs8YrdAwvDXNH3fClEUyE3wtJWp1ycj
 F0y/w61NadCGhG8ICLNwsLuJVlzU/XYDuCQFy1uSebJMXgPabZur/7CrmAwFi0YTkGsqb0HTNB/
 mPZB+f1otRwnlBUOnsaz9y7HCECoQJBatn1Nk6QQHICu/RKBGSBsohXnb3h4mCGjWcN+57Z/iDB
 20xWdbP/LJCb8/AY+FObWF5B6sttwaeC33D6XAcvNqyRtEllf/ZLL9dP1+Vt/TirTkDRpSMinvO
 86yY862Zm2pBGEF+rOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100123

On Tue, Aug 4, 2026 at 9:58=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.

Yes, this is indeed a problem. I recall that I hesitated when deciding
what was best here, returning an error code or 0.

The reasoning I had for returning -EINVAL, was that I didn't want
genpd to believe that it actually succeeded in setting the performance
state to 0, when in fact it didn't.

However, except for the problem below with the OPP library, it
actually also screws up the internal performance state aggregation in
genpd, potentially leading us to running at higher state than
necessary.

>
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
>
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

I added a fixes+stable tag and applied this for fixes, thanks!

Kind regards
Uffe



> ---
>  drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/a=
rm/scmi_perf_domain.c
> index 3693423459c9..e390f902a444 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd,=
 unsigned int state)
>                 return 0;
>
>         if (!state)
> -               return -EINVAL;
> +               return 0;
>
>         ret =3D pd->perf_ops->level_set(pd->ph, pd->domain_id, state, fal=
se);
>         if (ret)
>
> --
> 2.34.1
>
