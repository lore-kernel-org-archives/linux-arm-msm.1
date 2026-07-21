Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748014D90BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784648502; cv=pass; b=Aa+gj70ZSnG4Cx9qhEpQ01aYm7rHTLztoTugdx+XWG2NGrqVycMqbrxPYpCR+aaahuy9HTP0wXZDkPZE5Z92RhXJ5hM3Ncx+aDmkUwjnYLAFg1HhBzzjAXfGeUXr7b8hAlWmhIyp1F0RrcJAJBTA5dRX4iBdRkRajG7c+7Lz8TQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784648502; c=relaxed/simple;
	bh=hv/1/jgmosWZG5CXBogS3OC1HHR2eX8+DUld7zfdxto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gvp4DzR6US7BTcOS+kia4cYnnveJI8hFO/Mpklj1nrZqsn8FWXEHzwvMzYFBjYtrbOU/mRZl3pQES/iZMyibr8Lr9R53v+f9kRq0aArvSdcLgXrtaBtuySgAnlze4pePC4f9b5ME9uvc06n+J9hPuI01h3BWXIg2N/M6yiJCYvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=As1+TWHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZU/OWDPx; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="As1+TWHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZU/OWDPx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg04O1841254
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sbQkCvHWiH+eSaZ7UFMbyQp97oOU9T6RmNcXd0SaV3s=; b=As1+TWHHRKvwyldx
	M1qiXni7Oo15ZrN6OYnQMaoTXu4vI6bnum1fFiftxK8NVHVWPiuDtvRn/hd55h6G
	JGjascXut5zwgTocYWdA0JoD0xTXDQF5vGCDmrFZiQe3ao4+KbcZiY/k3Tncmlsl
	1nqIuD44i5c6RS4BX8C9pDAbmOxa//GboFuDJM6T+xQxXav/cdoVa36njJZHFykc
	RsPwoJC/1d2UKvCNsHVqqZ7ZASwZjAcLo6cKi7+hdVQdHG0f34wK+0VH0Gbw3rkc
	RvXqOqNZLCCpLmYJvb43lWnukTi+EwaWna7Rw1BgSYUPjNk7TdePowRrmJcWQ5In
	J7Fo1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se3322-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 15:41:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e63df032bso956938985a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784648499; cv=none;
        d=google.com; s=arc-20260327;
        b=qq3+5NoDlwyyQ3lm+Lai0OuuyRKXvUh/xeygsjPfl6GSxiNhsYg/oLPNrYXZ7Qxzex
         IOHcrPw5gDrCpkm71m+f0v5PW5f9GV5JZVUU8SVyn7T7jNBCuUQG0wEv6BXvUmKKzXJc
         Fzm4sFc04EC5bVY3OPh39HQ3dwWpUsYH0trI4tlSYX+zyAYV6O0Wm9SVJA4f86MMDtyT
         9HMRs+e4x2anAIkMTShRLT2K3d0pqomraNo4P2tyS88AXhYAgj5hEysnawOVkki8zXxP
         OrPb1j2ivtrJpiAy1NsA9CuyeuThdmy0SZmM/iDC7E8PEQrQ/25RMqYlznHgpCwiPGXB
         TySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sbQkCvHWiH+eSaZ7UFMbyQp97oOU9T6RmNcXd0SaV3s=;
        fh=T/n3eHcmGnozJsnG2ixlXycTBESFM/QK2zAVhb+hPyU=;
        b=aC3fRtlDPCwBECD6WkF7Xrb7yc/Ada/aLSX3vONb+7qx67kQ3Z6ZzToZ8I5vSXKRjP
         sxa6WKkPJhiuQofnd0quLbL20xtQQm/Ej5jMghOQnZ1lRYGK7/lmoTSxsiYvXGKjNdSJ
         ic1ynEpY2syeRRTRWsZcD28rJPBMYwL8ox7qFbLH9JoeNIDS+dGGfXwXrhqWlIBQ3cPB
         5JslkP6tURR8/yycaJr4I23E354ZhdqVOJ2ZF25PTSNvFM3IgYnwmQst2zRQBdH1mCf4
         F9roU1KlCezeMap2N0+UrtOKRQWojyj4cZcMq57fyKPCsIscE9WGa3PL/uwjpjnV0bon
         3dhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784648499; x=1785253299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sbQkCvHWiH+eSaZ7UFMbyQp97oOU9T6RmNcXd0SaV3s=;
        b=ZU/OWDPxVchFolWlmrIjDdqPFYDOvERAgs+15TRD7RxWSgRVgRoNrgC7sb9AJItjwe
         9ec48Imt3r/AFehg5AOXwxQktVsyawcpQ7vjeowiJf/NS51Dwo1e/rCuTM2U3Bg8Aweu
         tYYAxMy2Yvvy5SF2xfne4j1DDOorvEHAT80MugPZal59r3QTUArh0YHnb/YPeU53N3au
         FfgTKkXwH8P7itpDnpP/MVBm3W2VgwyDs2DJ1s9mrukZIjcJ5Bru3HLLX33mo3zuVHhx
         gDxBkEaQ9a9dA3B7jnsolvCwuTAZLFDG0UIasiDYtnVIjxfwLqvJiYoeuJzU3TwOqpB4
         O9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784648499; x=1785253299;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sbQkCvHWiH+eSaZ7UFMbyQp97oOU9T6RmNcXd0SaV3s=;
        b=KdAJAfUzLhSnN/68HYMWQ+IPdU8ha7m4DQ3UwnG4jOrTygKnk6alNrHYY7hnbfjt6e
         55zoy65IUwanM59OKflEwmvVVU5nKoNHJebclE/rog7WyMqMpuqS+0YnjUpplo0ojusO
         GkyvuJ1JGDWFzrj3FBaWa0HoLzmSSccPiKzSsENRzZCON4Ou6q8cmWcynKfDho58YTHB
         IfR1oASvsUyzmFlrtqxjNNheQLxYniwEb3o+tHDP77JB1A6kO4L8xVfKBg7fFn2/A54r
         CZnjmTbG5dqBu8ps0vosDt8CNGgEoehkgrYsnMADThKvnjBIHqKF+nZpnzgYEY6oJwRH
         LD9w==
X-Forwarded-Encrypted: i=1; AHgh+RpYEixinl4w9wRB2LW9cfRkh0WJ28NXreJMBpzPnlRlRJPDT2D7fBok4hA/G5WUr+qjVqb+txH1CNdBVadR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2jxLD1cj6JVESSZaB8P65gmUjxyb5AegCNiculp9lIqenQp5Q
	YODdcfEo8tAlwxphNHVRcSnLebAI+0Z5G1+5PgWcfnxlu/UBeTsAlFKTm2TU19fjsFi1VYOUh11
	9V3ilvZnmWFklaJ2teyzBE82GbIdYlsiKQcMcfI+ir4Vm+m5Ef0MSCu/q7Z/xjevHqRcH9O8ljL
	o0/tXnJpVFFKLFrRdG13RQTCEVkeTbIU02KF01y/GKUSDWkUOq4wuf/g==
X-Gm-Gg: AfdE7cleTs9OpOXjPmEzXLeWzuh+oftUMmZ6QJny5TC/fohklZpVWjwTy3YP2820/5t
	7kO4ldl7P4yTOC3eSnpE19iXCmR6knfOOqFr2BzcAxhctwcuNZniwDq2qWaI6F4ZVNaRMYB4Y4n
	ze1eUdbSC3ytUNyVn2U1au1MrKGyDq5esa2tHCpXmt+mulju283UjtVz3/k4R9eYFjTQ2hLGDCn
	HIeZ4mPH0Nnnut53zJ/hh3Wi+BJOxNxo2T8WWzsfv4xkBXErGJxuPJo01E3SRFR/C8rKHpb35w=
X-Received: by 2002:a05:620a:1a17:b0:929:f78f:6bf9 with SMTP id af79cd13be357-930f2d6a162mr21888285a.16.1784648499421;
        Tue, 21 Jul 2026 08:41:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1a17:b0:929:f78f:6bf9 with SMTP id
 af79cd13be357-930f2d6a162mr21881485a.16.1784648498688; Tue, 21 Jul 2026
 08:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com>
 <20260721-cci-clk-fix-v1-3-5eae78700da8@oss.qualcomm.com> <7fa30af8-884f-4302-ba88-92720bc741eb@oss.qualcomm.com>
In-Reply-To: <7fa30af8-884f-4302-ba88-92720bc741eb@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:41:27 +0200
X-Gm-Features: AUfX_mwyy8vbRP2ppfU0TptxSlY_11gMT9nEpxnw4n4-8o8SBZmnuQ4ns9XB6wo
Message-ID: <CAFEp6-3Zd9Rg0h3v5FGT_RoJiXg8qYNbyCmdx-tO16p8nyBuZQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: qcom-cci: Fix CCI clock rate enforcement
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 8NUmxBEwU_XeTc4AzB8RCFXSIVesL6Ow
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f9334 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0suC49so9GQ0SDQiWU8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2NiBTYWx0ZWRfX6qkNvS96UHI8
 FMnYfEOQ9maa64sdeVH2Eu/zUpB1nPvLBVKRZhobSVukwP4yJ0he7liXydQOUf+kC1IwPgx9P9N
 B+olKePwBfM9fQa6B67NPUpL6RMD0ME=
X-Proofpoint-GUID: 8NUmxBEwU_XeTc4AzB8RCFXSIVesL6Ow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2NiBTYWx0ZWRfX1v+YNvIk/vQ1
 llD+xvjHUpMdJgdnxWWzUHbYHURgjNq0RfEwbeJ0Y/SI0Ryai+GSbE5yDechQzHeUlxo25D1J5E
 Tf3esOi6nteJCHUzuXls2+bfmTuFrN/b4OKZJhqRQvhxa/5QFx0NWw4tAjJRizqRorxG0mLTuob
 jqeagZj9e5v2lpGf7VsJFoPC0PHRzldTJOXKnsFhvAawVgbDuAsrLQbOYRaMDvLUfXQcNPV6VZB
 oGhxdvMYj8Th9r+9MPHr1cGS0WTeW66j5wddZ0FBchlW9PXC5N3eTCpfky06EmGXKmLISpnWLUB
 onbA05u/zkCZE5otyKhx1HKqp923Ne/ffCHqu5/mGXVDSazy57OalCi62cE0XNehYHHfKwRR5mj
 il3jp7f2lfwK4K1nQPYjpvRKG3mdXAsLhBUP+pU1lfTlAkj1Tt5K2r52hcsEV45YmbKwlhmEy9O
 7L1WLSBZ3gKqDCwJ8pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210166

Hi Konrad,

On Tue, Jul 21, 2026 at 5:07=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/21/26 4:58 PM, Loic Poulain wrote:
> > The hw_params timing values (thigh, tlow, etc.) are in CCI clock ticks
> > and were calibrated for a specific clock rate per hardware variant. If
> > the clock is running at a different rate the I2C timings will be wrong,
> > potentially violating the I2C specification.
> >
> > Rather than just warning about a mismatch, actively set the clock to th=
e
> > expected rate at probe time. Warn if the rate could not be applied so t=
he
> > user is informed that timings may be incorrect.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/i2c/busses/i2c-qcom-cci.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c=
-qcom-cci.c
> > index 5f74edde8558382e63e2c3d0fbe19489f325e8ce..e001c0d565cebd386fd67b1=
d9d532360b29c67d0 100644
> > --- a/drivers/i2c/busses/i2c-qcom-cci.c
> > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > @@ -519,6 +519,7 @@ static int cci_probe(struct platform_device *pdev)
> >       struct device *dev =3D &pdev->dev;
> >       struct device_node *child;
> >       struct resource *r;
> > +     struct clk *cci_clk;
> >       struct cci *cci;
> >       int ret, i;
> >       u32 val;
> > @@ -587,6 +588,15 @@ static int cci_probe(struct platform_device *pdev)
> >               return dev_err_probe(dev, -EINVAL, "not enough clocks in =
DT\n");
> >       cci->nclocks =3D ret;
> >
> > +     cci_clk =3D devm_clk_get(dev, "cci");
> > +     if (IS_ERR(cci_clk))
> > +             return dev_err_probe(dev, PTR_ERR(cci_clk), "failed to ge=
t CCI clock\n");
> > +
> > +     clk_set_rate(cci_clk, cci->data->cci_clk_rate);
> > +     if (clk_get_rate(cci_clk) !=3D cci->data->cci_clk_rate)
> > +             dev_warn(dev, "CCI clock is not at expected %lu Hz\n",
> > +                      cci->data->cci_clk_rate);
>
> This needs to go through OPP.
>
> Feel free to take over and refresh:
>
> https://lore.kernel.org/linux-arm-msm/20250904-topic-cci_updates-v1-0-d38=
559692703@oss.qualcomm.com/

Sorry for missing your series earlier. I still think we need this
series to restore the expected clock rate information in the driver
and enforce it at probe time, right now the timing tables are
calibrated for a specific frequency and the driver has no way to
verify or correct what it gets.

Then, I'm not against an OPP-based approach in principle, though I
think it should be built on top of proper foundations, we would need
to rework the driver so that the mode selection (standard/fast/fast+)
drives the clock rate selection, which in turn selects the appropriate
timing table.

Regards,
Loic
