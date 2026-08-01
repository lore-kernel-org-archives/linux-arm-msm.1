Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38913911C1
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 07:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785568479; cv=pass; b=Q8lOLCFn4DV0YbHEcfaz6ilgfeuWjaF7ew24KoIVtk46mLmr+xQYzaJxeDnNN38ISKC9Zi3CljXnQoPboqAivR/g+TnatsZNM3tKwsdc1Aju7JBvjmf46Ej5VFFt1EB8JEDD15yo5o4A+13Vdtqv8cY8KZF4YxFHefywUhEJ3hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785568479; c=relaxed/simple;
	bh=FoLnMNkzqeKpMuu+hR8xzZnVrJXqZEd8JbxRn61bVqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lsg5/zKQ5nZ83ZmqzPuLk5p4BsxFfb2J9yQTf+mgOModMqQl6AGJAYOdu93yzKXlUrhBTzf3lP9ml+gqdeVD7Q6tk04EevEQNWi5sq80ncuXc+F0G2TMhSUDtmxZSXIuFTnMMDy1ZBJWPN+oy19f4DCfibpMSnZQO5fgjm8jY30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfrLuIye; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8mOnCB7; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfrLuIye";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8mOnCB7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6713C3mf2944348
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 07:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jCXBcH2ut5gRN32kpD6L5RV/tPGzXmadbsvQBUEN3Po=; b=ZfrLuIye48OTH9t3
	JbymXtlSu1ZjOXHJwQebgIL4sm1U4EhVhQsLkxMd2TwVyx6renYV/5Yd8I/N9Ef/
	5Cg3RvLnWAM0JeqhPVglJFJNuDlNp04Zz2MOGmF0AFz/HeiSJZIvE//3UIw7EQjF
	SBb1kNECZeOoijJKlzxWYHcBwOlahfuD0LcZfihsr+r0cCk4jv5Ix4w5EP9IaW6C
	LQJtHBDA0gbZBobunZm91EseQGseJRF4KS/CDQsMjN/NR09MunfV7ODzCtgVsl1O
	uXKDOlbj2CosJN6id4Sgl3RpOsRk1HUoS5vHyyl9jGWr3s8IyV9sQmbtVsQJkgQH
	ljGjqQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8pg0dwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 07:14:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ac0a54110so184077085a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 00:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785568476; cv=none;
        d=google.com; s=arc-20260327;
        b=TbTd7TONOd+wDA4dtqQJ4HBZ0clFV2rKFVFq/t2Vw9Yihh7AzhGZGTN/yeFuXm1DQU
         HxPtxoktWmYC6bYEzVn5ax+Tf1vsb4fISQ3HF4yFIq4rh62CW8CUAYVFfNw12jYokutl
         aV1Q6DnK6Ot6U2AzSA60QRMcRK1W+XBYFxTQZPk81/zAsbKykE6cLIzYH0Nz8QoMgnb9
         H6Brwycuy9eXR5/oQGaFtw67MowxZ2L846B8UYD4mSEd8V+xoC85xpCNkPKGkOq9TIhK
         RY4ciOdR7F1fxHeEc6A7orz9GvcKAilEWBnHFre1XHgame5r5EL7KW2oeDRllAIgy2Od
         qiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jCXBcH2ut5gRN32kpD6L5RV/tPGzXmadbsvQBUEN3Po=;
        fh=I/H/xeqC9zeAUEs+QFVig2NjBYxajtnQ76VAEy6exI8=;
        b=im2UDGANUx0vSq1jNJk0Qrpq97TmaFbmU+WOZ9cBJJOp97g7Jv40DYRuaWfBKUAye1
         OWPZQgh0Qrg+PVdm3GVSpPtGjJt4zNOKwXxk1ZDHWIO61vuPkZqPWwyhbHs4vmhjSNTo
         plyVZEYRbBweX86uBYb4osTZZaPzdeeIe1JAdYrSQZ0kkQKEyrI1E4z8YRjnGDrdF6WP
         jTbh6Iq/3dYKSrkHhzFwZaDarKqLTD5M1UcphR1Q3Rj0eUoXiU7dBYe8+N88L74SHXrn
         LSN4368+QL7CuZ9b8exFL9ETpqaFRt//+xcZN1m9yuS2juvfmci6dYzt7bz7MNMH6q9u
         On7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785568476; x=1786173276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jCXBcH2ut5gRN32kpD6L5RV/tPGzXmadbsvQBUEN3Po=;
        b=W8mOnCB7FE7p1RxNsZq+ovfEHI1lJkwR6Lfn6M6jKdr6qAavJ26hvpDg/NThVZG9Uc
         Vs4VyRc5+1RU9OwgZ/1g1Cuuj1VHXZsE0S9G5W0xeP6lNYmjsehBEDU/+6BywOr7QuFx
         EyXXxwVpMZf8GpA0fmdPfHY2zYHxc51JmI/iYN1IQA1Ic70/WkbvEJjwL5L60V/VCaCh
         RmGObZGYBcxYOPnJBGjeSXPW3fATeqt23J9oqi7kMcpkIH68txKfk0EpWwF2XDx/uVKF
         MtJEDdW3D3B/XuvQBZsF9ACBag0TEveearcoil5TlBr7wkbNGaSpnTmSrZxAjnn6zi3f
         5c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785568476; x=1786173276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCXBcH2ut5gRN32kpD6L5RV/tPGzXmadbsvQBUEN3Po=;
        b=Se7j5tad7L6Jkeb4twUWLC5gfQmehZbH20JhNx+qLs6XDZ5ZMn/8oAwyPmSaUx8Ck+
         PHIFMwXr+6e9Qe6hpZRNveJVb2RbjJ/zkB593//STUSpqFqIjF/u/9mdSviVUGpXoHQh
         LdkR/QlkRYEOiErVYzyf/WIx8EdPVL/TH5K1273zkm5Fnl7+S08lrFP/UQpCePjw6gcO
         CohmVNF9+jRuERZUPPbC2dIYR8eQKVmmXwJ11Nlo4PmNL1Ai0W697HXn0clAaIhVA4Pl
         4Vhyk8t6lp6qi3N/9zIMTovc/cRbsO7IXhdeSQMOpW0zysvcTJUywsocMfLEv/9cs9sU
         n/Gg==
X-Forwarded-Encrypted: i=1; AHgh+RqQtYN/ahptLh+w7+VDwQ54tfnFAOFZJOrBdq3SoiYAwwkLNiImD2Vj0mM4TamLm/BnxSj7EPdP/wStVZpn@vger.kernel.org
X-Gm-Message-State: AOJu0YyAIGkBKFOoRJ4QMVEfrUlU+oyF+TaWxW1FQZoT+PUhNi8PZXLK
	K2v/unsU0Pc7jgwe9Hz3MygiwRlODj+p4eSYxnTASYzS9bA8TicNs8a2IR0vnn6ig/OXdpEkP58
	YBEiuNAox44biyDw7emRZ0cWIhddQa9mb3R0+zsZXZC6305AdYN0xpEoK6nj3/IIXyueN6sDAzb
	wxYRmg+4Xp2KuInZul3eqotXwnBba57/WNfRIrHgvF3wK5hxrP4Yo=
X-Gm-Gg: AR+sD12atdtuhBINBI4b2TmmzZiT8Y2/PVd8JPS2oIovd90Y7q5xgqxnS7iR9CiiWew
	TRSnhiM9Q/lwUiTqrAGcvr5ZHJs/EGAjL+FFL160JPqL1sNhRloE17qSfhi4QDSZ9E5OuZbN2SU
	6BkhsNckpFfJes0DffOJhNSsbIKvfA80KdjRde3rhLMgTt0CIG+51U7z1+WhsFwMfsVBh8gfheh
	D8PFYlbXdPqAPwF6pqyKk0NFag0LH4v9pJ87WiyerJ2nMeYbtqoNYQENOlNJdSy92BymbDM3tA=
X-Received: by 2002:a05:620a:3183:b0:92e:e632:1471 with SMTP id af79cd13be357-934a0acf023mr475634785a.44.1785568476019;
        Sat, 01 Aug 2026 00:14:36 -0700 (PDT)
X-Received: by 2002:a05:620a:3183:b0:92e:e632:1471 with SMTP id
 af79cd13be357-934a0acf023mr475633185a.44.1785568475607; Sat, 01 Aug 2026
 00:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com>
 <20260729-cci-clk-fix-v3-5-f3c731d1596e@oss.qualcomm.com> <am0Li7jT2BQAI54k@zenone.zhora.eu>
In-Reply-To: <am0Li7jT2BQAI54k@zenone.zhora.eu>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 1 Aug 2026 09:14:23 +0200
X-Gm-Features: AUfX_mxGbl0pCWu0ANaqcPtaK03nU8RQ-p3Hmw3seBTi2N1Vo3Ep2CGZoMCqQ0w
Message-ID: <CAFEp6-3d6POaAnAb6kPxenKxb-68AnGNr7oWz0MU==hppMeUcA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] i2c: qcom-cci: Enforce the required CCI clock rate
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org, konradybcio@kernel.org,
        stephan.gerhold@linaro.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BAULx7_IQ4WEB8H7HaAY-V_rIoSb_nhq
X-Proofpoint-ORIG-GUID: BAULx7_IQ4WEB8H7HaAY-V_rIoSb_nhq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDA1MCBTYWx0ZWRfX1TcgsVxjJD1r
 fCLc+/jsBGxJj0Y8Ia6Kec5H4zZV9YetRJLw680ogwj68p4ye80dstgOgxVzfpypyWe/EIrrp/D
 sLhzuf+IakDNpqepAcdPOJzXFCtvp5A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDA1MCBTYWx0ZWRfX9t3Qsuj8i/R4
 CjO9e2kviTXJJN2BXUehOjaK+dazHqSsG4OM7+z4tZWz8jCgK+ZLoulsVBJhAVlz7uoZMsOpeGs
 9Nvit5JGpc7p4MBMcEM4NJzAGB5KMsJuNg6wRkYXUDrwHAbUtxi88gHB/onc6cPD7NzfdWUJFIC
 6oVByoeVsKnNf9EmKIOSIp0IOKOt/7HaTGKjNURc2drK7eKTnptbbSC0wfvZQ6imm2WuLE9fL0g
 Y5ZMoAJbmnDHYzWtG0owbY06mz2GoqaSuXh+S9YZef5QClaxUX6xpbIu8XAb4sgGYW6xCqN7+Dk
 A2TvzVljkVscvGCOggLE0WtgtkwpqAxl8cns8zI5OC/2gq/qr7u75Y1lytDqMr6Skd5IB6QZOMM
 5dCixCMbCM9ehby5WfbxcstMFTwnKgTrc3pHB/FkdN4NQDaX1N1a2mIgulwH7nkOzVZQEPhYQrl
 OgDndCySq7mD8M6cAow==
X-Authority-Analysis: v=2.4 cv=U4Oiy+ru c=1 sm=1 tr=0 ts=6a6d9cdd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=g9bKSjx6ID7T_xEQ07YA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010050

On Fri, Jul 31, 2026 at 10:55=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>
> Hi Loic,
>
> ...
>
> > @@ -588,6 +646,10 @@ static int __maybe_unused cci_resume_runtime(struc=
t device *dev)
> >       struct cci *cci =3D dev_get_drvdata(dev);
> >       int ret;
> >
> > +     ret =3D cci_set_core_rate(cci, cci_get_required_rate(cci));
> > +     if (ret)
> > +             return ret;
> > +
> >       ret =3D cci_enable_clocks(cci);
> >       if (ret)
> >               return ret;
> > @@ -694,6 +756,19 @@ static int cci_probe(struct platform_device *pdev)
> >               return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
> >                                    "failed to get CCI clock\n");
> >
> > +     ret =3D devm_pm_opp_set_clkname(dev, "cci");
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to set CCI OPP clk=
\n");
>
> what if CONFIG_PM_OPP is not configured in?

In that case we will 'gracefully' fail the probe as the operation will
return -EOPNOTSUPP. Actually, this mirrors spi-qup and spi-qcom-qspi.
On a qcom arm64 build, several always-present symbols pull it in.
That said, it could be better to make the dependency explicit rather
than rely on transitive selects and add select PM_OPP to the qcom-cci
Kconfig entry?



>
> Thanks,
> Andi
>
> > +
> > +     /* OPP table is optional */
> > +     ret =3D devm_pm_opp_of_add_table(dev);
> > +     if (ret && ret !=3D -ENODEV)
> > +             return dev_err_probe(dev, ret, "failed to add OPP table\n=
");
