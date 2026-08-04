Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6774534A3
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 11:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842108; cv=pass; b=FfWLSYfv88Dj3tm2NkKJqxJbK/MBRYBYYZTlhRo55C8M9+2bYXXI0MTxRdi+RDiYj2XEljsa0Vz8V1r0/x+rGSQEm+2zBhkvg0r4gaj2SySk0o+vfnUcdx5oxp/1Ux39z0EKlsUXfKGCeapI3Ko2UmQmlzzxw4pGIWm0NOfuA90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842108; c=relaxed/simple;
	bh=B1hmO8jXIEO7PaV3TkwuJAmsXF9Gf8g1uuHWkE3kRqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e26Ma78hQVqhXJH3vJ++icORZC0IKEJYy1w6UfaB1koVsq9iHdrdkjVHZsjE85zN7pGk4D765AUknM/71Sv6aZVNLm5le6MpHpTW6aS7p2pSRz80mDKggRvYitP2DLIGVaR4G6vyMVeiGOz8X+pT2/XRg1Qce5cZPE76iROGQNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0iRK3a+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C+7T1dFJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0iRK3a+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C+7T1dFJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CEcj3779552
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 11:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	52R+QMzPDkl+NQTZQCm43R/hfEzoiVQdhDHxPtxU13o=; b=f0iRK3a+JbdzQPVS
	QEvAAMsYS4Il7T2OiVt+AnMEsXJwviF4eQMxFc/p6ZyvRERccvQaFMO9ezNxHZfP
	LBjOL/fsdcdThDxByKSglSxWywaNMKXvxp+kuujQHq2bCd+5IU4ZQFvdbWFE4gah
	Jk4jw6c+PL1W7alsy+cQsreOXpIXn+TAxtdKnfSPnVWP54vORVU1rnGrQOzI0NzF
	YU5qfUrANx9nnWvS9VJ227uByq2nglTUFORDs5JyldHGolKFxT58fcO+N8q675CV
	/nkLYZkYZ/m7IPtdTpKzb6aDoS9aEHiypPtHfY6+bmHXx6qj+z6NI/OIvYSWxUvr
	mEP8XA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p4u76q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 11:15:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e695a3b28so84627085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 04:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785842105; cv=none;
        d=google.com; s=arc-20260327;
        b=pUDqBCo4OkIzvebQXbyGa6hrZrOc2r7GcfwjuUWqt5t/GCx3EES7oAyo0rSUcWMhyd
         eKyGezAeofjHiWwchJN0SDQZTMKyFwNroKUrIMMCiD7GWSraKPJV/KExFvAHD1V1Xpiv
         GC/w/vr+fM0Vnq/VdHIxmwnaCXIAbXXylcS69GrMhzkPolF9Zs1x8OwV9voPmzYw2sHP
         BbpIKjt+XIy1JlAtauuZQ9kfqBkko00Zm1ICynn8y0ZLaqfTh3mUlhC+uMss5qaZ2gxb
         8iylzzBbFoVoGA2Iz6M/wcGIZhzYqNyWRDrj6UNU+8kj6REdZJezdGYUYh7OaVUkFYLB
         FB2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=52R+QMzPDkl+NQTZQCm43R/hfEzoiVQdhDHxPtxU13o=;
        fh=Pfj4TffKBqyYYo97bfA+qTnK+fVqWHW7XYaxdHBP1uE=;
        b=l5kBeJs91MsXOd6JCgf/+Y6GcAbRbyGSMYnPLSD5AiDljzLr3UrArIbovrcnfXQ37M
         8yhkpWLzWX7hHk+SOL3BYRwsLxNY23qlGr5OvKHrMiIhXX1UIZS8c09amIlTX2C2+EeP
         RA6fnqJbE6pUnhUBhyZUvIT4gcraKmqXkDFpi0ZF4hPzGd2X3VVST38rrPgzfcAITJY1
         wzU9eRBtP6NfnB+VsHsyhF52WOvkBTCb5O7119ZnYo645JIkmKq2hTYcGyy/qbZSNvVD
         CdHUpNsNOF6EAhoBt2w5YZt/1eYl66vW81IkxAGiGXrOO/IpP3fR2nx7PcGZWHKRPP7Q
         EfdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785842105; x=1786446905; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52R+QMzPDkl+NQTZQCm43R/hfEzoiVQdhDHxPtxU13o=;
        b=C+7T1dFJyPw3/2pgARO/t/2CTaA+U9esTGQWsHYGPYH3MiLJCk3r+wFNo4BrD+6fxi
         p6RYCNKhhODO5oGTO9freEEHoDNrzz4b1fiJND+2zoMTsC31+xUqo8MpPO49zVCmgXNL
         pr1S1pthFkoATkgXSEAW1EAFjlJKDntEj4jt7jYbiMB1PTUlDJby99roKhVnvIaU3XJU
         1Bhi+WROuaN3U5wVvOJ4RWdx2sKVlPpwc0EzMnPOCfXX6biq+ciuoDPnKE7qgEZGhsvl
         546oKzr1uq+Kqwyo5P5s8YMzYGCWLLYxjx6AjmEoCe4Be09VY1K6nqsDVyjgQdzpRur7
         5cIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842105; x=1786446905;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52R+QMzPDkl+NQTZQCm43R/hfEzoiVQdhDHxPtxU13o=;
        b=tLwEtoUFbx/+W5PevJc3IfFRnE7NcJTuet5mEvwW6D1FfaZDtVG2FoKnQy1qvgc08m
         ow2kmW9l6nqNA1hpQVOzSy4TUW4wQM7Kr7azbs+hbpWly7FWgNMWwetsw3a0nRau+lb2
         Sx300slN0IDJxQXnqiT5nDYiKQNV1It9gEBncrCcLpVVBY5ZmdJEz2x7LrWl6JL3970a
         vYyy9N8kr8XDDHMO8Es7Eq1HMtzBLbPgHh+9nOkZ1M6z7t9gVAXEsXc4TUWpMBREtrQv
         jWRoZeIpufk+EXi5HuhLWRO9CKpToD8DOakchAeFZmuWsl//NrJJAK5GdI/zFfmvQanS
         D3pg==
X-Forwarded-Encrypted: i=1; AHgh+Rp20U3uU9sz/jnnwd9wJx+zPRoHdeo3xwHnVPX9ZJRmLuMh52SsaWC8L7ku3rXnwcUMbZxmKVduGN/lZ+Wj@vger.kernel.org
X-Gm-Message-State: AOJu0YxGT11L49eDZ8/2FksQhGH/EvBmfyTNIUDuBCtahLns0b8Gd7Nd
	YRo4dkK+sHTT8soURnu1Lwr2m20YaUWb2FLQcHMa3Y/VpNM3XRIovp4/2gCwmA/F3jWHy20rl+s
	8dxJGRS10xOyAdy+mDT61qU6errqR7PHGYr9WAKeEcYMzYICkfTPHavswu8cIDFaVIYwQh29u0y
	10M2J+lR34u2CW7mgw5cw8OZXpHdwyCGLvw4witQVjs0Y=
X-Gm-Gg: AR+sD10MSZbwMCqOnHuCJWG2I4YCHaaBlZL74PQc7EzdHLhB4b/+1x92KoGPRfdjj3H
	8tI5ebgistaJ59pQDMI/UNJ5KLk41FuxKpBht+Ekj96rHcvY7jPnD9hKArWhJ59RsKIQqMg+CBz
	ND2fXJMyrUp5QjyBr//S/YPpb6zUhEZ9/hI0WXLfCivb6o0Eh4zWxYHOzhuQ==
X-Received: by 2002:a05:620a:51d9:b0:930:d48:a3d2 with SMTP id af79cd13be357-93631984d5bmr406517985a.21.1785842104827;
        Tue, 04 Aug 2026 04:15:04 -0700 (PDT)
X-Received: by 2002:a05:620a:51d9:b0:930:d48:a3d2 with SMTP id
 af79cd13be357-93631984d5bmr406512585a.21.1785842104418; Tue, 04 Aug 2026
 04:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803163123.1802005-1-neeraj.soni@oss.qualcomm.com>
 <20260803163123.1802005-3-neeraj.soni@oss.qualcomm.com> <stu224dgiay6mau2enqyf27m54laucdzqaudya6wxcnm7ldu4o@omftbvyuvmqa>
In-Reply-To: <stu224dgiay6mau2enqyf27m54laucdzqaudya6wxcnm7ldu4o@omftbvyuvmqa>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 13:14:53 +0200
X-Gm-Features: AUfX_mypoSUK91Rd8buA_r1AEfxdX1ZW90xiiqDRvPYyeMTjOiciexB82CuBqiU
Message-ID: <CAPx+jO9ikCQBLxzc8814C3LnFHQoejjpL3kUvCXE5T3OkQYz6g@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] mmc: sdhci-msm: Use pm ops instead of macro to
 restore crypto keys
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neeraj Soni <neeraj.soni@oss.qualcomm.com>, ebiggers@kernel.org,
        ulf.hansson@linaro.org, adrian.hunter@intel.com,
        quic_dmukhopa@quicinc.com, quic_rampraka@quicinc.com,
        quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com,
        quic_bhaskarv@quicinc.com, quic_gaurkash@quicinc.com,
        quic_sartgarg@quicinc.com, ram.gupta@oss.qualcomm.com,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=auOCzyZV c=1 sm=1 tr=0 ts=6a71c9b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=tekg7-5syIHPVG6I5CMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: JSN_cu1hj_MC4z-a_yTXHEoZkPUZY7CQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4OSBTYWx0ZWRfXxBYyr6yC5dkN
 CCdCcsLfDmVda1JiKyT/aYDGEOoNlZLVuEm3mERkIRrTclBKfhy3MiLxDtzjhC29I1dsboJ/m0s
 cS7DNDo65X8TchKSvwc0p8PozdLwWPs=
X-Proofpoint-GUID: JSN_cu1hj_MC4z-a_yTXHEoZkPUZY7CQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4OSBTYWx0ZWRfX46dKeamOZeeN
 96qFkMAzTGOaaO7gQoheq8lfrIueo8AospgbEPIfM5Y/OfDd1w97j6Wpgj9OLwGb3fHtEh9mEbL
 lC50KfYNwvY/EYXhiFAYZ7R+A1ql2DxzOXI/xXShaTH2iToT/AdHWmB51uHG9LNw5YNR7owH7j4
 J2+ilqulgvc4LuyG2l9wiqB89WmsPUUGqhtzJfd0zu9Nd7GG+Rs7Hza19oiHaLNt7Zl7l63XD2Q
 wgULp40uwFQDm54Pf5QFux6TMYIupGhuwRn9qtYo4jzGS8afXbeOmG1FyPd8cw2lfH+wBFFOrai
 Xdu7ak+CLGXfMCd77V7o+IjiCeqUxoMf+fDxSqGKVl9hyI3QM8WuTpC7NbWL+Q2+GuHpzeQzgYt
 RQg802URKaw/pYWnAjaA9gTu6xAuYy257+//jRQc7weFknR5ZnFhH6hhOhysTsHNs06n4sbZbf2
 O+xVh3eTltQye27LZKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040089

On Mon, Aug 3, 2026 at 8:10=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Aug 03, 2026 at 10:01:23PM +0530, Neeraj Soni wrote:
> > From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
> >
> > Inline Crypto Engine (ICE) keys are lost after hibernation entry and th=
is
> > needs to be restored when hibernation exits. ICE keys are re-programmed
> > during sdhci_msm_ice_init() but it may not cover cases where the
> > hibernation image is already restored.
> >
> > Unwrap the pm ops and use directly in driver to add the call to restore
> > Inline Crypto Engine (ICE) keys. This ensures that ICE is brought into
> > same state as before hibernation.
> >
> > Also set MMC_CAP2_CRYPTO_NO_REPROG to indicate that re-programming of I=
CE
> > keys is not needed during MMC runtime suspend/resume.
>
> Hmm, if there is a flag which controls reprogramming of the keys, why
> can't we use a default and make the core reprogram those?

The core is responsible for managing the card, but the crypto context
belongs to the host. Similar to other host registers, it's better to
let host specific drivers deal with those.

In regards to the host capabilities flags, we decided to add
MMC_CAP2_CRYPTO_NO_REPROG to avoid breaking the mtk-sd. But long term
wise, there should be nothing in the core that deals with
re-programming of ICE keys, hence MMC_CAP2_CRYPTO_NO_REPROG should be
removed at some point when we have verified the behaviour for mtk-sd
too.

>
> >
> > Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
> > Signed-off-by: Seshu Madhavi Puppala <quic_spuppala@quicinc.com>
> > Co-developed-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> > Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> > Co-developed-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> > Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> > Signed-off-by: Debraj Mukhopadhyay <quic_dmukhopa@quicinc.com>
> > Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
>
> --
> With best wishes
> Dmitry

Kind regards
Uffe
