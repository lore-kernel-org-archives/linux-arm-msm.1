Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792675622;
	b=wBuyz/JZsxaBtcsaOnqGmHWezTsdeTpT2wP1cTv7ArzKI/B2GtddHagsP9rCvssD6uTH
	 aM/TP0xlTKmmGglCeZ4THoGkh4iLDGB7tAXDY5RsTCoj5LNDecgoYM7K9SbGe1FWgoJWo
	 MsvJbb9SOQGVJLqFTl01vXzWJCZvagJ64Roum9YjwvnVM+90VEesgPQqpwoPCXZEzZmQR
	 uLP42NHBOT8ymmdDzDB/iETuahdbRcFT4SvMHQEPvrEAxop2F/a7FTnZPRjxoXEvyRd1o
	 v4QDzZIxBM7cPwmf3om+t6pag/RRVMRMX0zi3osGWjK7CL35T5DJvC7MQkz0NnwgfuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675622;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
	b=t8RUjsaLqYTfVoPE27CYCwluut0zsfeCr00bhYJvT8F/3HtHL2U8C9ny8G6UJyYn9rGp
	 QrBUCGWtCpSUk/Fm9/+DMLxTUWpYBrrpYyz6FsNXsrz5TEZj80Miy2MBeJKLSG5J/nXk9
	 e/tqtDqix588jUKlrpVuiVvJrxSvKoT/yvqFomXwPYtfoYEK8HqlG/BAp0IrJp594gQYp
	 DDZQL7czqPclZVCo5O342zVfI/uk8l1vQwccL/YpjdXqWzvezJNM8LjrWGNZlWow7FSpb
	 n9378iJSgshwOwXVKVopQQ53KuXOrUeh1v3K8yisocN+4kPW7ycvY6aqXD46Fknd9CQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e0XK+CzR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cd8Bs7kp;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D267B606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D267B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e0XK+CzR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cd8Bs7kp
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xxdu1962207
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=; b=e0XK+CzR+w5dGiD+
	JLK5GhSH9gEEMnUrcdYTBve4Su/QQG6SCAN8Jug2OIxpNqE3iRM6fH0RDnlM+ZRt
	Oggc1GiRGXO/lxF4SDGO7WTxKcAmqxwEBgKJKD7drycDGuvjqeBnjUF4nq4vfbae
	LnDMUqX0Nuw2BnoXaB4p5tbP385AYmPmiXDFTssc/OnJO4iMLsQtue+W1SQoPTSP
	W03UBc1G62vkqlb0RjlmZ6UISZNXKwlTyzo0rJ2a8MfXhtT/7ZJMYWHgClwY8WnJ
	MAeMd1og4dJYQJ6GLwmzQ04BDpRA6AkLCtCcay740UFOClG3kI+BfbADg/BbjetC
	wSnyRQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aknnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:27:00 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4fb73e868aaso2472587b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792675620; cv=none;
        d=google.com; s=arc-20260327;
        b=hNV5NVG2Az6f6Pjz1BVWK1kLaMrb+MSPO2Acbhs/TnRUwozxu5CIVWLgD5HLIJ/cR3
         VGub0rhX4LiUcDBXj2OKTw8YtNXfYg9tH9Gtri1pxNJ4j6xdcKPiPmUCCnm7Iu1kTo67
         eU/oOtmBo4Qgmg9M3IweqtAdoQJKC/qWtMlqSGQA0kSWpIpzPSGgmCUGsLZQe+VmDaT+
         4LrqIlk224Djw/BbO3DWaRR++GNpTSpfbYNy0iOp+yWz8smFOBlXjSH5uw2sWRXWph3B
         wvsz3Ao20NfhZ1Lp/BWaxf2NuUpyzrJcVLD57v134/ZGnYQnCoqDUzf3y/9bqobs4Ro4
         APSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
        fh=F4MSgXvzLAG10B+9mn9cn62dov3GjW9S+p7z+KgPbZo=;
        b=OCch9Bv5Y77C/3lG6aYDGi5XYaqf+pEK4SbBAsbDIRdeEg8NhCezsjN7JC7nIYBfnV
         CWeYWG4kUryBgcKOMNOu8C8YurJlfzgvMswB5g79Lk824x6cBtor1qnpaf1mlb5UIlCY
         SsLWM6LNa/OCrJpL3aK/7aIT9cLWNThKlwe0S5FURvjJ5L6SO6edrivDnoLM+S39zGJy
         ZYsmKnmiq67AM1ECrAvKb/A1qAGMEs5gkbiF3jQLftqgTaFBaAExMQC6KHqr2Rb1fYJd
         DOQYaqC/tMiTOXhNijLNNgurC933jdP2PMIlUx+OFQKdeT/65AvYQN5XgHFc3z1fddE+
         9LhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675620; x=1793280420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
        b=cd8Bs7kptfEBPAeSdhJnCBWKk+TgqNJP0L+9BZojSBPsREJKht+YOFgpo6bWDtCH0K
         46GakeEAeeieY8GHoMH9E/ms32opi2OOl7bJkAyIMwxHpGVKeHqnxie2pT5yoR+itXQn
         xwxchSqJ4H5kjq0Tr/8MNIbZndqNlJBIyPTqKxU1okQlJY9PXvvwJVS1dUg3DRc1vzLS
         9qR2zwordUjpan4aQJ37KJ7ingMY/xW6odj8at2zbnFhxDRuJIoXPGKcNHL8cr613uWa
         4Azhtzka+6IwFuKB5sAcFtihTzZIoeLM9jYb+R8WE2+pugfm/Tpyp4p4YYeoqbc0/NdH
         ZU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675620; x=1793280420;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jkdBGMrXl2ogSNgP+aCYhlNxyIfloe8YrYNUTMrUXHk=;
        b=dRHES5v01lExF4PoI7yWuTSaqghm+9Bn5Rdj44Hp49iK+kUnGzFxoLMfW6RDuhOYWc
         9KlaZE20kOCbyn/TvdVe8cgWplIi322RHzVn+JwF9rHcZf1iMbvCcS8Tg4m0qbVxoYI0
         0AZDrvtWob8aNug/dkyxqXZXxJJOlXR0xTfUVyw96XUf7kJPwZ42cRzie7L0Wi/qpxAI
         g9dQFAI4KyKlqFxOtbPZ4kf9ohuIg/HHYBw+UBvuQCz60pEkWZ2p/BLbd0KxmsaBjquo
         petCQSwNS6qjFR9fiTn9/w7xWzOxhzjfp1roXAtH7+sZ7cWLgQfgb6aXKGvT4G2RDTbI
         lH0Q==
X-Forwarded-Encrypted: i=1; AKwUvByCOhZE4D5LJOxquEa80wtBjcxaSbAH9xoOin+x2i7JchSb5elL/Jw+Y8baiCJm5WEdXj/5+oLV+yQMdMgK@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/OUK/FkOs5GTTiY5x3QjEsAY2fWW7CzO+c3RLs7aRn0IqwbJM
	byrtZ4LQsd1VTA5bsTwhc6oeyEywr071MzJ7CwkGBnUsQ22rUykIb/aG4C6wwYDCVCGVmCZs3S6
	IGPN7hrQd4jgSzhqW96Sp1uX60K0hjxghvz3nztmOhthM/wGtzlWb7aVqNRSQj9sJ60kjU4SMGb
	F0m1hNS8m+hGib4GLYsoY6+9US1L1pNLMoc1dgu2ifwoM=
X-Gm-Gg: AYBFou0iW4uu07u7edqVw+O9Mo5bOGVwrG+lPHU2Frd2T9B8z4Gb9U7IUc6458hhTcR
	1MFENsJpDAp09zmwZ1XJY8dKytpzwx38Dut0n9wIu2rEtcuBdIuzOE6AKkIKhqJ+/Ypl7jpTp0T
	FXco1esE9JMz903CvAtCAI04eOclCdo0C+zR0B9YYzsoynaWu+/hFEzx8hTjKtq+3TQsYLRM5vr
	Ixj6dhqcRShhgiirKVgNLxOYi/+VnInDtdaHyFtmHjjfRxv3nzQ89h3/xICZ8gD0tQ3pqWrNmM=
X-Received: by 2002:a05:6808:508b:b0:53e:42e4:47c with SMTP id 5614622812f47-5535a28a8ebmr3850181b6e.34.1792675620252;
        Thu, 22 Oct 2026 06:27:00 -0700 (PDT)
X-Received: by 2002:a05:6808:508b:b0:53e:42e4:47c with SMTP id
 5614622812f47-5535a28a8ebmr3850158b6e.34.1792675619795; Thu, 22 Oct 2026
 06:26:59 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022071418.26895-1-bjsaikiran@gmail.com> <20261022071418.26895-2-bjsaikiran@gmail.com>
In-Reply-To: <20261022071418.26895-2-bjsaikiran@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:26:46 +0200
X-Gm-Features: AclHuK8flPST7fFs4KH2917QipXg6lzf73ICNib5r7yG-3sF-q7lhsX38NFcO_w
Message-ID: <CAFEp6-3iqL_a1c0u0tXhtZBZ+k__=KjQX7y2-0djf9qbBzS+Mw@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] i2c: qcom-cci: Select pinctrl states during
 runtime PM
To: Saikiran <bjsaikiran@gmail.com>
Cc: rfoss@kernel.org, andi.shyti@kernel.org, sakari.ailus@linux.intel.com,
        hansg@kernel.org, bod@kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, jishnu.prakash@oss.qualcomm.com,
        birk.skyum@pm.me, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXxUhwsNQV/eC/
 bqpIq3KgjUTyFzAINVW9huQwndDZLehpnfXqf1SGSEVTKRd2BvkOFmU6apmZhmhMe1j719RKv6J
 MH7WQwSVdrzjkTTSawhtmlaU8Zk0rcX3sZSTEr/0C4oRQ5eWmPtnZzwuBznIEOjr/bYjRltCjfG
 DnzbRrzQlvfFA4KIqj7YpHNW3XMIo1J1HHbAf/6iKP17Zwa9f2NsXwsIq9u57XlmFgAFuIMZA6y
 y2BTCTYsWmzQa2fCNgSmbTmMLrmLBJ1GU00gPWXUTiWh80UUfPyWa/6P3sXAptmigDUsVjZcu/h
 sIKokz2FvYHojvWFV2sTmY0gDUqItFcrodz8ougmAYia5VuETVjXnULECBmEe4GsEqnTWFFlxfv
 aSvpJNT20ttr8KOqb5uK4IYk46F+dgCgPl4/zaSzKsv979+XvkIASZPfVw5CBmcJjTJFBsNZjNC
 hfvQDfkqwGiNfjpd+xg==
X-Proofpoint-GUID: i4DQZrzSRp_mWZrmln1KYSNNjpZg7RTx
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada0f25 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8 a=i_vyvEnQizJGaKJi4PUA:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: i4DQZrzSRp_mWZrmln1KYSNNjpZg7RTx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX8G6cD68d4ujd
 y6bN46iO8vcqANQfB8tbvrnbU5EJF9sXUs8ToWGWD06Aurew/+vjvqXTGp9XU7Msxp3XIH+3vr9
 wJtiksbJgoKgUQrTdaSpOejLo3ZGKnY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220053

On Thu, Oct 22, 2026 at 9:14=E2=80=AFAM Saikiran <bjsaikiran@gmail.com> wro=
te:
>
> The CCI runtime PM callbacks only gate the controller clocks, leaving the
> bus pins in their default state while the controller is suspended. On the
> Lenovo Yoga Slim 7x, this can back-power the camera sensor through SDA an=
d
> SCL after its supplies have been disabled, contributing to brownouts on
> subsequent power cycles.
>
> Select the sleep pinctrl state before disabling the clocks so that the
> configured pull-downs can take effect. Restore the default state before
> enabling the clocks on resume, and return to the sleep state if enabling
> the clocks fails.
>
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 873e901a23d7..fba5f664eeaa 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/pm_runtime.h>
>
>  #define CCI_HW_VERSION                         0x0
> @@ -474,6 +475,11 @@ static void cci_disable_clocks(struct cci *cci)
>  static int __maybe_unused cci_suspend_runtime(struct device *dev)
>  {
>         struct cci *cci =3D dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret =3D pinctrl_pm_select_sleep_state(dev);
> +       if (ret)
> +               return ret;

You should perform the do/undo symmetrically in suspend/resume, so it
would probably be better to move the pinctrl handling to the end of
the suspend function after clock disabling.

>
>         cci_disable_clocks(cci);
>         return 0;
> @@ -484,10 +490,16 @@ static int __maybe_unused cci_resume_runtime(struct=
 device *dev)
>         struct cci *cci =3D dev_get_drvdata(dev);
>         int ret;
>
> -       ret =3D cci_enable_clocks(cci);
> +       ret =3D pinctrl_pm_select_default_state(dev);
>         if (ret)
>                 return ret;
>
> +       ret =3D cci_enable_clocks(cci);
> +       if (ret) {
> +               pinctrl_pm_select_sleep_state(dev);
> +               return ret;
> +       }
> +
>         cci_init(cci);
>         return 0;
>  }
> --
> 2.56.0
>
