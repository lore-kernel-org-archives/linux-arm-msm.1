Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A93A0E85
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790669514; cv=pass; b=uuS4Qw16ZsQUv6w9ECtuRWBHCKc671ZE+MN0azdEfwgxs68vpSyVDeFlcmSKSbsvQzOkBGnbUnaQQ/bVmdcYxkCQw5ak9AfxtK2th3Aj8vEUDy+eZjlPVOCGL4klu5RTr7sSl0hOCpF7QW+ZkDnZS5sGY5OYjC1XHwySLl9A8Nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790669514; c=relaxed/simple;
	bh=HoGjfIBERBjuLlbfWX6YofwkC+7tgErkdW19lovibhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aMr9lgSHZr0tvhRBJXRI+CpL6OXPh36PNBF473A7aAhy4DuqDC7fPy+X5ZsFuo+peya2QkEFsBuSxCZtSY55j8nJBzZCxrqcAxtYnzSL1bVo7RW4Vfg+Mbw/+MuPEPujRPt9kW/fPtUpnUa7O1zEv9gayf5SuEMIPzR/vtK2Y6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvTAuSg5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aJ6TTw1v; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvTAuSg5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aJ6TTw1v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U0Ed4087145
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 08:11:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8n8olIhU2MMWC1LHor4cPhfWXcE121qFu8pwc/M0v7o=; b=CvTAuSg50oMo9/0m
	xDDnOPZtJSEth9eBTCxnaJUwER+mJqKf5oQYYR/cDGCX8LR9CZUvS+Puwkd5S+v9
	6COfMrg8zEspOP6N20tApNPlGc9pJyb+OXj48kgMeA/rPErxFsP1m6cAbGlybrNT
	ZpYY6fd9BkAXlj0doSXoS2uMaQWFN0KKrXgUKys1DMU3pYv6idIu3CSTxnwe0AiB
	mZNQlcFd3wy4AOygJYyru59JYssZM6jug95kHc8ZXEJt+Ibz3MiJMbeH9zzVJ6+D
	F3+LkeygJ+5CQn7tbO6QwOjmcwg0oWDlYw2xD/Njz+qO7qguy9oTscF+QZQNIxha
	sOiyyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4sym7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 08:11:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so1037098985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 01:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790669512; cv=none;
        d=google.com; s=arc-20260327;
        b=fjxmMPtTpKPqwpSE+DmWxXxlTzgP3M3pIIfaxpJBpYOGnNZq4MBHSXiDEp29lJ2SUv
         VGw/89oAD9y1iXZ20PNw4aXmD17q9O2AFImncuSnTK5/IvFv8gE73u0VHyPyPYe3LjUF
         Cuj5JtS/XslBntn9F1vvq7T7RdMMjdiCJdThEEQl+LlCMDYmzU4H1A1yZ51BrBDa7eZf
         /3qEzh6gT1eY9SI9n7AsDHTBrSKdvA0RbnvMJBN0WJsTzn1g5pioM9qHWaHGj+3A3j56
         uDxAacPqPPTf9OEKuaIi1Pq3iWZRrGrVEFDoGa7xDzgMSX329h+5F40Ra8NslXVEy8qb
         avTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8n8olIhU2MMWC1LHor4cPhfWXcE121qFu8pwc/M0v7o=;
        fh=+xQlHW0IbpBipfcBAM+HOX/eZkIOAYNn6LFZVnMLte8=;
        b=nlH+UtPeRBbcpT06YcNiMqm5uzjlwKB1GP+3VXwW+AF9Q8y1lmQ0b/MmJhj9XMBZDN
         b59+/ThVdG7Djo4Kt1MKPaC6s4Mjs7py519slUvdaecHV4rlmU0wSdVM2nbl7uykFAip
         BKm2Dp6kg+Ir95hKDdG/+hxqGoYCbv1rznM+Oe51KF5nSWgXyTQj4MiGkb77UaeomkMQ
         r8hgUyMQSZTFx0VEZEZwx7SjWM4cphM9u6GU2pMlD4kx1MCYc9MvyBvkujuzayS3X57J
         f4Z2Ep3gu9kJk+mAHEO4F17hCxSpCnHajQhi6yY1DVTP1CK7+/vt948q7gsxmcvXQ7tS
         UQIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790669512; x=1791274312; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8n8olIhU2MMWC1LHor4cPhfWXcE121qFu8pwc/M0v7o=;
        b=aJ6TTw1vnPSVbdRGOkG1NAObhkulrbj2nSWly4KBmLYCIxzOF5ZuJOfkS87HKaue0x
         YnkCHnaiF8T2+Bs06prU7fxvYnkrtbQpzw00feHjAm/U5shw3drnYTEmWm0q6Xdqc17z
         +QLGQwwscemg9IKsO3vIRFb5THsAm7dwulUVHIFAuf0K5k5euUTQJUprGbmNRWgDd92n
         xMbsrhfzsSW6t6SE5/D2kwIW0t10vK3Da1Xv9rKgk/WU7KdO458sc38m4aqbESFJJ6P/
         YdmMVa/qVQK9KpHXH+y1+NsaPQz0yBWYhTTDJxMzu1r2KJLgxiaixtXx6jpFfp5Xbq+c
         BQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790669512; x=1791274312;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8n8olIhU2MMWC1LHor4cPhfWXcE121qFu8pwc/M0v7o=;
        b=f+nsU0x5o0OgJQNLEFZ4l1dtN7RTdrWzpGdT873Wg3pA5yFFguecq7Hnq6209gdKHI
         TYqwMAAhg8KRaIlmejP3B6pCWWzHG2iW/EC1OPO2GYA/R7wqaUi5RHFkfF29HdyLQVy+
         nNWWicwfwtArD3nYI95ok97RbCsbTK6GZU9P2flgX5Cps2IjU5lvR1q/kuPrlYH/aLnR
         TNu//zSZv8Lv5yNmfHeu56TIiVisnFYajd0xjgCl9P8VNlw3yeFtUL/qEqVaZHQ/Nosv
         ft+jnxC/TD05nSmO7Yn8+Y8raKe1fq+6KU18Vmq1fmd2PAyPPFcTF5il+2U5dSfwgttR
         imQw==
X-Forwarded-Encrypted: i=1; AKwUvBwWO+htyBNUBPZXNNs+SVMxD0bbMeHDjjtqOkLaYyfKaIB2WSD/56iLOeNLU0jfZgC4beY4wZpUp4SsJasS@vger.kernel.org
X-Gm-Message-State: AFuF++lS5rPSxYD0PgiOygO7SbHmH6bKvNjRd5AJnphTcvMau3WYI5TV
	Bx9IAtmay+yNQmKZ0cOvysSsvDV1nLThPji7SSXhyB1Mx6DPrZrf93dBhqpM1H1V3WmsQnfQIer
	6wzmOwcZXlVTQ4m/PaWFkhWXH7gTmsZokzaT75+6RkV524DGxdeIeMH8QHMSnm7CSpHcJ7iZ9K7
	hHqedTbmNXm7qOLLERasNLNSRUesEPmcWkaWOkhzPFkq8=
X-Gm-Gg: AYBFou2p2Wlhzh+/OjCOG3bZ2jxqekljaUW6lat3UnMxmM4NYVQ/nArubX33yUi8p/X
	nnAedySQfYKuchTiVjU2LBXMXoCYiyW48whh9bVsE4Rx6TLa6/nE656eTbS4vcC6v1YrdZS9BuR
	ZJZilHoW39hE3+jKExKStOweY/MH+aWleoyJle0OSvb/M+ua6U3qhnnoLPmZpv+b3MKwjlDF2JM
	Mk8AW6jOB05cE5YDUf7DtFPVM4PI9UG7DdscdcK8BMW6Q3s+PFOGyc5zqfZxGEilnFR4UZJGEo=
X-Received: by 2002:a05:620a:2621:b0:93c:75f3:e146 with SMTP id af79cd13be357-93c75f3e31amr1222359485a.33.1790669511516;
        Tue, 29 Sep 2026 01:11:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2621:b0:93c:75f3:e146 with SMTP id
 af79cd13be357-93c75f3e31amr1222357085a.33.1790669511064; Tue, 29 Sep 2026
 01:11:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927-cci-clk-fix-v5-0-4cd498559ae5@oss.qualcomm.com>
 <20260927-cci-clk-fix-v5-5-4cd498559ae5@oss.qualcomm.com> <arrymkYqBOzLrgnV@zenone.zhora.eu>
In-Reply-To: <arrymkYqBOzLrgnV@zenone.zhora.eu>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 10:11:39 +0200
X-Gm-Features: AclHuK9tROaSuZGwrgXYftuCTCCZsm9VQ-ThGHIjlFm3D2BpIHH4ATLe6l7ae24
Message-ID: <CAFEp6-3F94+Ve+7cj8Pgu+HMq6=RfHEFksJ1eG-4rcpG+ODW-A@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] i2c: qcom-cci: Enforce the required CCI clock rate
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org, konradybcio@kernel.org,
        stephan.gerhold@linaro.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMiBTYWx0ZWRfXwsP3m2SsLq0U
 y86clX0jLtQVEpCIwmHdfeXYCMIyqKCHACmxZg9lPo6IYP0l3V/j8+74UaQvxRXJoVbfki/OxfB
 VcwUyvXt9SR1IRnvXES2iGGa/d1ibZs=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb72c8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=eW-YW5vREpMiMjnL-pYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMiBTYWx0ZWRfX12S3epezO27j
 om3NB/YFTf1jiPAF772cgZnZmu97ot9INvrOG2h1LZ8hcgfX5BrtFKNXjbQaNILJQL0hHolrmt7
 ybbDE2LLObjsueAepMUsctqVIpBh3jEWKoOTAgAke1aT5vfEaF854tPpGyz+O4mu1D5rNTJfbn5
 bmN4nS9W1WtmHj97bdhbbAvmkeTn7Pi1IRyMtzFUbtOXQ+IMeyUO3KXypEnpW0x/DxPNYrFfm2z
 Mu3I0YxvZUFtiD95NX/PC2ucBE5tg+cBJPWp73E4Im4IqZjNK4qNkb7/8SBhFExr9y3RE64ZQTM
 NIaIIPoX7vYAPyZwPA1Q0748542ALkwk+DZJpEUMO0ApwFJBhAXlmHRSNbJgJL9O3KT3IkiCfWv
 R0d8dGgaFTT0ai9/0DnCTF240YGSAD2q0WLwGhYuaxRurqinsqePFllwFaSyxhKaIx+PXo2R0aX
 YbqBiihwAFISg/B3yug==
X-Proofpoint-GUID: XNKffxqsV2s1UKMPYJZWhqBHV_QYoi46
X-Proofpoint-ORIG-GUID: XNKffxqsV2s1UKMPYJZWhqBHV_QYoi46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290032

Hi Andi,


On Tue, Sep 29, 2026 at 1:28=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Loic,
>
> ...
>
> > @@ -318,7 +319,7 @@ static const struct hw_params *cci_get_hw_params(st=
ruct cci *cci, int mode)
> >       unsigned long rate =3D clk_get_rate(cci->cci_clk);
> >       int ri =3D cci_clk_rate_idx(rate);
> >
> > -     if (ri >=3D 0 && mode <=3D cci->data->max_mode && cci_hw_params[r=
i][mode].thigh)
> > +     if (ri >=3D 0 && mode <=3D cci->data->max_mode)
>
> why are you removing the .thigh check here?

Because it is now redundant, the mode content is already validated
during core clock selection in probe. At this point, we only ensure
that the mode value is a valid index.
This follows Vlad's comment:
https://lore.kernel.org/all/CAFEp6-1GCa2t3wBznoF-HnmtNCUSsshnWnrv8O6R2_06Kq=
gKQA@mail.gmail.com/

>
> >               return &cci_hw_params[ri][mode];
> >
> >       return NULL;
>
> ...
>
> > +static int cci_set_core_rate(struct cci *cci)
> > +{
> > +     struct device *dev =3D cci->dev;
> > +     unsigned long rate;
> > +     int ret;
> > +
> > +     ret =3D cci_get_required_rate(cci, &rate);
> > +     if (ret) {
> > +             dev_err(dev, "no CCI clock rate satisfies all masters\n")=
;
> > +             return ret;
> > +     }
> > +
> > +     ret =3D dev_pm_opp_set_rate(dev, rate);
> > +     if (ret) {
> > +             dev_warn(dev, "CCI clock could not be set to %lu Hz\n", r=
ate);
> > +             return ret;
> > +     }
> > +
> > +     /*
> > +      * Sanity: The hw_params timings are only valid at the exact
> > +      * expected rate, verify what landed on the hardware.
> > +      */
> > +     if (clk_get_rate(cci->cci_clk) !=3D rate)
> > +             dev_warn(dev, "CCI clock is not at expected %lu Hz\n", ra=
te);
> > +
> > +     return 0;
> > +}
> > +
> >  static int __maybe_unused cci_suspend_runtime(struct device *dev)
> >  {
> >       struct cci *cci =3D dev_get_drvdata(dev);
> > @@ -678,6 +739,19 @@ static int cci_probe(struct platform_device *pdev)
> >               return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
> >                                    "failed to get CCI clock\n");
> >
> > +     ret =3D devm_pm_opp_set_clkname(dev, "cci");
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to set CCI OPP clk=
\n");
> > +
> > +     /* OPP table is optional */
> > +     ret =3D devm_pm_opp_of_add_table(dev);
> > +     if (ret && ret !=3D -ENODEV)
> > +             return dev_err_probe(dev, ret, "failed to add OPP table\n=
");
> > +
> > +     ret =3D cci_set_core_rate(cci);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to set CCI clock r=
ate\n");
>
> The error logging is a bit messed up here: you either print here
> or in cci_set_core_rate(). Besides why is a warning there and an
> error here? I would just print error in cci_set_core_rate() and
> return here.

Right, will fix that.

Thanks,
Loic

>
> Andi
>
> > +
