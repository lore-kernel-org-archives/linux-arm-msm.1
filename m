Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A84343E7
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620564; cv=pass; b=J22Zq2iPYzFodGJ8ANLFjhpRj8fLh2XFPX4PMSEwm6DKxgWWBcsTNXy+Pcwn0td/27Nd0liM1Viuu0qveWCwg8A23pQiJ08ak0VgG/kylyGVkXeXc1G7j++Q4dvAfHztUvWoyByEdOTjNjDBu23iS0/u8D5u+sGqDaMGRXkfxtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620564; c=relaxed/simple;
	bh=+6o4JpxYSvOEXAXdKaxKGqi5Bt3+bNdxmyqjdvBUQvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZaIt39b8hiv69n6WBMS0PG4yoG9whuW4AUpIWjWokvA/dDLSSaroy3Ff9srtkuFNHSl6Gjyp2+3hprAQFarRibEzIAYsLq4eajwsjVnpuMVum424Z3mLfkks6PW+RIqCVTVgTXyH5OvcSgzsqtVokiBTKAT7p0QAS7m3LmAigA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ki0XVw5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eXzGlGiC; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ki0XVw5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eXzGlGiC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L2nDcG043319
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LfLs/0uM4s9Zo8gKC8WEqb5My0uP6TmeTBEW1gK8v9A=; b=ki0XVw5OcjLdTW2R
	Rm5OBKzKrVE0hRYY9pwjcs5mUa8PMDwUvGTLB60NAHajoV3rLB5VijsnvX1hjkiD
	yOwmhxtSZTpiCec3gHPxVMsota7uHXCAv9cmXDWGzobjhxGm5FKIlWRQaOCxXeOo
	P2h3fmQtb8K/8mmGtfTkSeiN2GVEhAoT8iPs/20fmCDaHWcWjt3AFx6RXlJJzGHw
	Z8/69z9lFT9aVUFJk98/4GE/3tFJay3a0f27kDpMnNiUhMGNWUJScV63RAtvPnxL
	hq/DyHgljzOX73QWDubZctL2bXfNHP5KHpivWclkv6e3bF60OueJsOsTTKFmbj9s
	tLwEvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as15xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:56:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec91dc265so738032385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784620562; cv=none;
        d=google.com; s=arc-20260327;
        b=CydJuI3T4WTttgNXkPO/Oj3fcVjObC+epA1WyeOyDp0Wj68QJLPBJEV4xuYRE/TM6+
         IB7WeOx8LJCGUbJFRUKV7Qj8WC4fRTWujLcuD0trOHpDX14u2HlgpBuzFebbd/HE4ahi
         tmisFu68Cq5+dHq4qz4Sg8bUiVxW2ntoyrYa5Nn+Q7vaBztvLKy/lf4gwlHuqIaGUxOx
         aeKnpP4LExwa1lr33jU46mN+fRXIsGhTDU/wM00iTQT7Ifbz8wBEDZ4f9x8qa0eO9ld7
         NqIKCa72BR6HSaqpiUG9LbJFb5nbP2WdpZxXvQkVVHJq8p6yoisEdja1RXhDyeTFyFbB
         o7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LfLs/0uM4s9Zo8gKC8WEqb5My0uP6TmeTBEW1gK8v9A=;
        fh=9iEE15Lij5LvVuo7qhqYlbGg7HhjHkj7kKzorV6Lj7Y=;
        b=oOIROAfQ4YR9ZqFN/564WWYINOmAe9yHoEDxiQi9EeUiVvxHAgbvQVKRsdR1Lma82T
         zv/WjU4ijuj9/4zglcWOKUEago3eWc/0PqnsYdia8Ig+TFkFJKfToSAZRKpkRWnDlZFM
         IJPWqWfLFWJwCkb7nBnAJrO6GKXG/dmrtiMlE9T/mCr57W4T2dqPTpRcZNcjWK7x/g2q
         NNNrv1eJ+o79nqkC7wO2spJCK6zaJHeb9xArnpMgEinsqjqktT1vCx9hg1S78sgsyu2E
         zSIcpcJ3ryCBym1K1hY8TOL8d9Qiv6cNOQXxOlBCOc0AGrsnkxAi923GFcPNwj/g29Ts
         WePQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784620562; x=1785225362; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LfLs/0uM4s9Zo8gKC8WEqb5My0uP6TmeTBEW1gK8v9A=;
        b=eXzGlGiCFU4l6PoRoC3i8CvGSCxo7XwqUEmEmP18eV17mSXKXq7hedTIaNiXEIKhTm
         OJ6iMksNWesFlNwpfSWAuWOslGl37s0bL9iEw86L/X/3fyE6pLa7fzgkbbZKP9grXAFe
         hi3w0VdHEYXx6wvA2i5VY+fFOFfJszOb8b8MF0NcN5oG8zJcPq8PLRAOiAmisvYz69Zg
         XxSoUsFjmR18BijPQQ1rxyLgh/OOi6PSW/ZJiL2zKTbmqaJmjmkpT3d5DIfZpni5dGBJ
         WtA1+O18v9foT/669U9obrWSa2xh3H+kq5PU517P6JCt2468v2xR2A/t6COmVt5MT7uw
         v/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620562; x=1785225362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfLs/0uM4s9Zo8gKC8WEqb5My0uP6TmeTBEW1gK8v9A=;
        b=IEwyQY9SbMMfrQZ5VOgI8ymphN8blFsoHn47Gr8XuWU+ewOi+nBakrM5Ks9XQyZAVE
         sKwzqvPzkVR96kdvGBfjrGOGkupO4af8QzpGX8Rz/Ek3VDWU67hGmdcv09uSPZwgeVg3
         CEHSextOBQBRU4PnPBV0F0eJi7IOeM5DH1eZxDkbIQdk2a+Ag4Fdjwjq09K6BpYEies1
         qbg6QmbEXV9nCzZXi0jvd0AP16D8J5+BfURJKtUFFJYrxn/VRBWM7gi49QNzA41RKJPP
         6yVyreATvV7LrxnlB6No6+jx9ENMAisPfq4OY63/dmkxrHcRTuYKW7I+OdXtIYJ0ihRB
         dhIA==
X-Forwarded-Encrypted: i=1; AHgh+RodLKsEXLORtOQzBuJN0u3rtJTkBpixdHd/HLKd2Or127FzWy6gM6DFpx+6vVNIefXXymWvTqWp6ZBtd7qu@vger.kernel.org
X-Gm-Message-State: AOJu0YwEj0WZ1gDIAJMd2c2QF8uh1nLHSxRXXhk2emTTpPsFGpiF6i9H
	PKtdgcRJ5cBbD7TzJrNrsm+9S6azB9kKRQhEJxJwM87TGQD6ym+1ZkyULJfgmG7Uvly+EK44BbW
	7XqA6WfHq8/18mH3D6wtE0Pbd/oDCVLu36RgVdrYG2cG7+Cs/glLbg9u6x6YCT+p7qxsvkLixGj
	NQUknrbWCN61d4InOUMSrsDjm4yzpPa4aX6SQcQ1Rwa0bCJIE3sGERnD8u
X-Gm-Gg: AfdE7cmRNKQKcqcW/5U19g4oFg09ZqE/x6Es1zrliRe22357u6q6Vy+2MWONXW9OwB3
	jfP98J8xaY8bd8DkZHZfZEs27TfATnWpHF3ViGKa65u57FuRQsVNw3WNb3YgwCG1u2T57TH/wDG
	x79Z0vjDI8hQBKF+MZMaqQZg2keHXpDGpcHd+nKJBHpAKDIAWAWkJyQgoR+cOD8wMzpu7ESoIm+
	bVyRBeYicJesz50Ha0HIC/4mg25Ohu3/qyBZhIjGZTyc6t3i+P9fG1lqXlmj7Wk0lO1yt3b8Ys=
X-Received: by 2002:a05:620a:a0cf:20b0:92e:c116:beff with SMTP id af79cd13be357-930b432b542mr1210392385a.92.1784620561824;
        Tue, 21 Jul 2026 00:56:01 -0700 (PDT)
X-Received: by 2002:a05:620a:a0cf:20b0:92e:c116:beff with SMTP id
 af79cd13be357-930b432b542mr1210391185a.92.1784620561397; Tue, 21 Jul 2026
 00:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com> <f0cd0e8c-3782-404f-ba75-8e339ee678eb@oss.qualcomm.com>
In-Reply-To: <f0cd0e8c-3782-404f-ba75-8e339ee678eb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 09:55:50 +0200
X-Gm-Features: AUfX_mxzuTeKA_VNu0baSyurSHyTuviQ1rzwQWjinQ870BTUl_N2a4fzkb9f1dw
Message-ID: <CAFEp6-3m0LesW_QUEPc=wLbBOMXo+YXSSw=5YpZgg3P5wsz3qg@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: qcom: camss: Report hardware version via media controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4MiBTYWx0ZWRfXzghITkV7nr79
 kQCElaaQatx7aVzMaR+glUcyxiVjbKjRzWCvYo9RfSy2+w7OtPI+8feCcayeuGueMZY+93Jh5mt
 YVH42Ei3tePF90iDnUQRVRVOWa4V+RNhF6iccJ+ceTAIUNhqGAgJmbsL5pPXpVrKZIZsbH9Yq/R
 QWnS7H8/CQACoZeR5O1qnVVqXb+YQEeovrdDlqDbpod7evy0c1i6/trEszKsn9VAqWrIhAHjBaC
 Ach3OCFmrB12jxICtqIryl1H5C60to1XcoZz2VZwvri+5ZfOcYNNJm3oH+jfkXFrJ/qySWS8FAF
 h57KHB6Pt0GjLTmLRJVlO9vZlplJDCHwaZnZqRZhMpSZZ8BTkItsX8Q4aY6ICc60pjCujUGry3u
 TAuhmHTMvZOQ+OKHF8yAR6pI3oUAWAdeSnwKGldkb84S1GmUsnjq0VnpCkHA9TlH5S8NSuaeMFs
 7VMMh8kGHPQWzhYkpVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4MiBTYWx0ZWRfX/IO715ceJLNo
 GjvJUd27dz5RZo0tXGeid1cND24T0A6FG4qKqFifxkCucJby+cOKcvcTzeV1p2bkDlvBb8KnQ2Q
 6HKKO9D9CDqLGozQUEnEqS5Wl4bNikw=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5f2612 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=6qzp5W7T3Ocp0w-4ubgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: uKOioCRSIYMYMBtcssMTCC1jLuOnQXL1
X-Proofpoint-ORIG-GUID: uKOioCRSIYMYMBtcssMTCC1jLuOnQXL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210082

On Mon, Jul 20, 2026 at 11:12=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/17/26 4:20 PM, Loic Poulain wrote:
> > Populate media_dev.hw_revision with the top-level CAMSS hardware versio=
n
> > so that user space can query the exact hardware variant through the med=
ia
> > controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
> > identify the platform variant and adapt behaviour accordingly, for exam=
ple
> > allowing libcamera to apply quirks or enable features that cannot be
> > discovered through standard V4L2 or media-controller APIs.
>
> [...]
>
> > +static void camss_read_version(struct camss *camss)
> > +{
> > +     u32 hw_version;
> > +
> > +     if (!camss->top_base || !camss->res->pm_clks[0])
> > +             return;
> > +
> > +     if (pm_runtime_resume_and_get(camss->dev))
> > +             return;
> > +
> > +     hw_version =3D readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
> > +
> > +     pm_runtime_put_sync(camss->dev);
>
> I think non-sync is fine here

Using asynchronous PM may result in the runtime suspend ("work") never
being executed if the probe function fails later (read version called
from probe). From my understanding, a subsequent pm_runtime_disable()
in the error path would cancel the pending suspend request, leaving
the runtime PM state in a non-symmetrical (unbalanced) state.

Regards,
Loic


>
> TOP+0x0 seems to hold on TITAN, MSM8916 and MSM8996
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Konrad
