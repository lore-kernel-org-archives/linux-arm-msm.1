Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2902836F
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784984803; cv=pass; b=Vi5NFkLtJvOdK6uPsDYQ82yzM5FCZvllLSmLzbXL2BRUNyB4y9ROGjjJXyfmLoSKBX67AQwoX3aT8ZHcBrnShWuarMuYh8hu0oIcXUeA2w2NFQaKJ6n+Y6On6DJ7llVZglhrF4C1T9E09l8QzHGg2MHOMYR+az6dk/z3ySSRwes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784984803; c=relaxed/simple;
	bh=2Uh9eT5tK8Vo6mo+sKW6kVlIwzKg56YPQeznGWsFhOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrbrjGxpW4F6k2tE00RqYvgH8VhCZzHgALdvLvm0BHDU1zxqglETXqsvTfujqoPAY4WLjNb7X2MZkR02IcNk6dFDEKMg38xZN0ZJr2SttRsKz4nxT/KkQBi8lb11y95aCDe4bym+pNOpjbZkWqmhDe9Z6uc6HlQfd/nLI/m6hTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BugCbEsu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BkCrxuxg; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BugCbEsu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BkCrxuxg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66P9Bi5a2648260
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 13:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USdCGOXvhOSXrJtdi7etv1/dOPdyWHrZPu0jrOTEMuE=; b=BugCbEsu+a/LmeVr
	C4J7OmznDDC4jOhjg1zfq2EOMxHu8yQMNfqPMtJ8ihMtU8eHOVWeZqARl0ImbUCz
	GA4kej0I5fNfP4Y207KjzSNgcR0JlKQ7jCVeATmYF/zyhKdFPJtep6Q8V4UEl+MI
	FKIZTgSW2uxXraygkpoL5zcNvTVchFr619V695N0ZTK0l9Vk0Eke7/kZdw6N/Ab4
	a9KKNH5rodrHNTVrUHZ3/D6K6vI958FCWZeVpasJKLI0jHYSSZx+sZYGM6ytnWmT
	lA3rdNvpCuKNVHqTjpsfa+wIRn5KRhtnd84YkYuCRXUJV0TWqwrAhKCkWKA6iPfn
	tR1+fQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufs710-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 13:06:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so163596985a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 06:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784984800; cv=none;
        d=google.com; s=arc-20260327;
        b=Cz8T4PD/Q0TpSMawTIZ1267TM05pulV1+ItNUrKeCJkQxCkvWSKCgMrhfSCKA7h5af
         Zw4+J+cIjb8M6QqIJcDjxOIavEQeMxAJ7fjt6vRrXCkyseqcInNDvblsVy1YlNn0CZrk
         6rYVnoUVH7L26/SciWogfvqMlsyBgKIUgBmWMHbYdmvA1oOXTRg4pf2vypR3cqKWS1jl
         zhvXTMKULhLZb1xU6Dk3r6zviQuFgHe1KH7PxBYkT6R0blPKZHPVYQ1q74dd7V34HDDE
         T7AD9oKKNOFrGLVLH9yy5LZYP6HPdKk1Ggk+y3vQp+NZhj2JxTIzxr2v6wfgMeP/jDFp
         H0UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=USdCGOXvhOSXrJtdi7etv1/dOPdyWHrZPu0jrOTEMuE=;
        fh=m7OzDeW0DMFg1LJ6mLDsJDU3kVBA8jIrOx23pB/iH0A=;
        b=Xoj9ymGj53Sf5VDQe9cGO7Odg6LfykJGKUXJ0CO3EQqCqYzppaOJxZcgmI5Ndbfy/M
         BIGC/FK0nYq118AQB1UcrkYfAGVpQQmh1MO8bNn7p4kON3ik9VWryFFMvZeOolvXCGMi
         dkkU/Vr5gp4J1+o5yNS+zzvEQGs3QQsB0Px6pI2KSSbQB7gVvZQeogkReejPuqsaU1qY
         CPMTQ80LDdyMnS8azctbbaQXekrhT0ATHNiSarPz1e6SgcLG9ydCXPYAqbLn/rpforrX
         zbTV+qhBhc4s/eBZq+dyUGcTGjb23lr7landxMR0ejVHYu4JmJXUaqJhUUyrjJ8mcJY/
         Zgfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784984800; x=1785589600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=USdCGOXvhOSXrJtdi7etv1/dOPdyWHrZPu0jrOTEMuE=;
        b=BkCrxuxgMrcmfSw0kdCsXAfmlvKL9vQwDlrsZVH16ZBSWzSwCk1cAxDPcEf+Cf4e7j
         s0eF3e8qfsQITi7M3nAxg99zmaWkIaCzS/VrThiq3IchqKisUnxcr6rNpHd27Fsg6LDI
         YD26evVx+apwWkPGEOnglnfkG9sKcEuHlEJ4+wAd7SRCh+8fMWAdmgTZYyizW5WziXFD
         kguQmPfC8W9adWHHnwg0w2c1Tsy8U5M8qhoNsuhfsI3VWm2/+EPsFYcb3mkcBX5UabC9
         GVKaIRzAQNtCqOHEIdJTxLtHnXlHiSmRx9n7jf5StHANCFb5+o6EDXJjOf2fxigoBSqh
         QZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784984800; x=1785589600;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USdCGOXvhOSXrJtdi7etv1/dOPdyWHrZPu0jrOTEMuE=;
        b=ld03yfbinn43j63vTKOV8wrPNrSLPXyK9RM+Ryu/qAJ7Kp3q52vVCkzZtQFm6mvAVp
         2b+iHe6jH7H1+IaLjq7IL59iZi5irrBoOjzjSwDWwfvaH3H557OLU7cki+jUtUK+5OdY
         MRjwRndktvNwudzi9Ky6JuWC4bE2rykSqCg5zpT8wIqsSXqu9uf6Ge9Lgl1E6i+XpGsr
         33s3crvOSjtQEyGXX1ynDt8825I0bAFfqfGFlHQx5YKd0mIGVtoZ0ZNzVU3T7SCpwg5i
         hwtg0UBDP01VxvwLy/yroQLt5w1VcZM6emGSPfrdgJ4mNtGprE15YZPT8Nd2VxL5+kE/
         +5Kw==
X-Forwarded-Encrypted: i=1; AHgh+RriqPjiRdAjFAi5hoHjFnoZeo0fzmxZropNw6Uk+9eyVKVHC1rCHCQhwaQbpaMlnPGNRtuV2oDt5aMRrvA9@vger.kernel.org
X-Gm-Message-State: AOJu0YwAaiWHPqQUX+YPLkh6AZjw4SgzXf5Xs9/HOE1SpGxoRj8c9b+N
	viJp88Lot0iCBu/EWop9WzlKWTEyiv1YrKqLA652AMZKK35JxvUo9TDcMka1OnKxKLzc+wmVTHd
	s2O0A0WolECku/NiySdTbK8lGFJ0qtIn1xXwhrXyK2ncxckDDJn5Z0vVaeIFQ8fXJIckGE3HjmG
	3QkrDDQJQPmp917xGunmjYIKQwpt/0ZJCSDBYGo3N+kRY=
X-Gm-Gg: AR+sD12LRVqf+BWtcBbPBc2jeDp5lonZZpjHjH7YDKPSbabRYl+nEi+Q20ewlZ77ocE
	+0CjKmQFw2ySeSs9WRAdHus5HQN1/JSO6GEnPEy8D5h3kvggRDNoAP4e+jsvrgekbzPKZHiQ6yB
	GaXKWHjcNOfeaFwcfKX5s+5x871jby/cCz7M+yovFXgj1620nBLEYOjuzpSq+Ocsd3UxCOXFIVo
	PvELG21WfwbnINvL8gR38h8mJNKb5dpP7DYbLO0c3bzm8lUE7dA/W2TflQ4XKUCswz+CZHJnRPT
	rt+dDxZVA/TJzuPfl6TrK16dDA==
X-Received: by 2002:a05:620a:7081:b0:915:29cd:306c with SMTP id af79cd13be357-93283072ba2mr474269585a.9.1784984800354;
        Sat, 25 Jul 2026 06:06:40 -0700 (PDT)
X-Received: by 2002:a05:620a:7081:b0:915:29cd:306c with SMTP id
 af79cd13be357-93283072ba2mr474265385a.9.1784984799917; Sat, 25 Jul 2026
 06:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
 <20260721-cci-clk-fix-v1-2-5eae78700da8@oss.qualcomm.com> <8d20f3ab-696e-40a4-a05a-688779299071@linaro.org>
In-Reply-To: <8d20f3ab-696e-40a4-a05a-688779299071@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 25 Jul 2026 15:06:29 +0200
X-Gm-Features: AUfX_mxBZYabrUQfsrUEOG-i_LCjFJ1GwsQYG5u6cV8cytNozvrdZqMLkqF8--0
Message-ID: <CAFEp6-3OKp0XhpNmp-yYwf4r16A=CD5eA-Ts1kk+mFjdCA38RQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: qcom-cci: Add missing cci_clk_rate for msm8953
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: IUXm9PtJzx2DQVabwknR8pJo3dth5itv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDEyMyBTYWx0ZWRfX2MMFNzekEFzr
 5PFaco1R47j7yQ5TkH6sYqdP0u+jyrQG2yFaO2kSJLrnAa2Elpf19s1XtdHsAMCgYoMtqHkcY1K
 eFjX64OAyqMgA+jm/tLauOOGNlq2zyo=
X-Proofpoint-GUID: IUXm9PtJzx2DQVabwknR8pJo3dth5itv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDEyMyBTYWx0ZWRfXxLLS406T8dnA
 U9gw1Hh4EGghGjL8X61sbDzDpX5/8mqgouVCJ59uD5snhuwp18QcSKFiS1pfFTVJXPdPs4Q90y6
 c2SqmGf47jXdUdxkvCFNvtYFrdoIqR1pkc8jXc1/FlTRp2vvpsEa/Y2+kYhWT29RgAb8HS0Uejn
 4uPIiN2f9o7DMtZ2x40MXLywel7egrgHvTbJhne3bC7XTO2esn5NZ7PALum04qAqe4vCKqHCg0i
 C27oTYjxcSeiLLZhpiBL3o1l+Xg9Zg4eIspO3J1oXm5oerVeeHyUcMSWJLGqcfR7HhFOQ93TyYP
 HizwS5YumOhSMaMrFlNFOVTKbp3KpLkREPR9u/TIqToTCmRv6MwHQyYu1qgl6/XrPOizyB8PrhK
 nImMd5VpNq+5jnrPQvrUnqy9xe1dOjb7U7PsZoMQ/riNAhxLbkvm88x0NapcibZL+9CXoNfGlGV
 JVZgZUD09Mp47PtnhsA==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a64b4e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=9uqHTFpEoz8C6ldqAIkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250123

Hi Vladimir,

On Sat, Jul 25, 2026 at 10:36=E2=80=AFAM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Loic, Luca,
>
> On 7/21/26 17:58, Loic Poulain wrote:
> > The msm8953 CCI data was added after cci_clk_rate was removed from the
> > driver, so it never got a clock rate entry. The DT assigns 19.2 MHz to
> > GCC_CAMSS_CCI_CLK and the hw_params values match those of v1/v1.5 which
> > were also calibrated for 19.2 MHz.
> >
> > Fixes: d202341d9b0c ("i2c: qcom-cci: Add msm8953 compatible")
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   drivers/i2c/busses/i2c-qcom-cci.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c=
-qcom-cci.c
> > index 19e4719f13b29b2cf60e113565b1b63f19d0e669..5f74edde8558382e63e2c3d=
0fbe19489f325e8ce 100644
> > --- a/drivers/i2c/busses/i2c-qcom-cci.c
> > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > @@ -783,6 +783,7 @@ static const struct cci_data cci_msm8953_data =3D {
> >               .max_write_len =3D 11,
> >               .max_read_len =3D 12,
> >       },
> > +     .cci_clk_rate =3D 19200000,
> >       .params[I2C_MODE_STANDARD] =3D {
> >               .thigh =3D 78,
> >               .tlow =3D 114,
> >
>
> this simple change is wrong, but commit d202341d9b0c ("i2c: qcom-cci: Add
> msm8953 compatible") causes it, but please note that the commit d202341d9=
b0c
> has no explicit issues per se (if proper frequencies are set in dt), but
> this particular commit 2/3 breaks the whole picture.
>
> Let's see, MSM8953 I2C_MODE_STANDARD/I2C_MODE_FAST settings repeat the on=
es
> for v1/v1.5 and 19.2MHz supply clock frequency, but I2C_MODE_FAST_PLUS
> speed setting very close to v2 parameters and assumes 37.MHz supply clock
> frequency.

Good catch, there's a real inconsistency in the table, and it's also
why configuring the clock rate in DT independently of the timing table
is fragile (and not even enforced by the bindings).

> So, at least one clock rate setting for all modes is invalid in this case=
.
> Automatically it means the reverted commit 1/3 in the series does not
> directly lead to the wanted and well-managed data, and the logic in 3/3
> becomes invalid.

Agreed on the analysis. To be precise though, this doesn't make things
worse than they already are upstream, msm8953.dtsi assigns 19.2 MHz,
and the Standard/Fast rows are identical to v1/v1.5 (calibrated for
19.2 MHz), so those two modes are fine today. Only Fast+ is broken
(without a DT change).

> I would suggest to grasp the statement above carefully, design a bit
> better solution, meanwhile postpone applying any commits from the
> series, especially if a breaking change holds a Fixes tag.

So if you agree? my short-term plan is submitting a V2 with a
switching of msm8953 to the CCI v2 params table, so running the CCI
clock at 37.5 MHz, which is what SDM630/MSM8996 already do (same HW
version). Moreover 37.5 MHz is supported by the msm8953 CCI RCG, so
this is a viable single rate that makes all three modes
self-consistent.

Longer term, clock scaling (probably OPP-based) could be an elegant
improvement, but it's a bigger change, also CCI block's masters share
one clock yet can run in different modes, the per-mode timing/rate
can't be chosen independently per master.

Regards,
Loic
