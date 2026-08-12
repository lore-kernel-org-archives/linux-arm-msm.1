Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2648544780B
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 13:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542665; cv=pass; b=hDoqTzJCNEWyVe+qxv5xn7jvG9puVJxD6eZA5lmhwO2CqmIbh+PGdzi4CYWp+7SDYqHbMzPtWC/c07CHcVNidD9btarJM0DkdMVe6J5VMxwYMrELLdWXUOZGno/7C0upeCFghlT5k1uuCOxytPqeYXLVQPCh7zWI3ozX8zji3Us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542665; c=relaxed/simple;
	bh=hOWhDc6Fqp7yVb+hb/ELo5AQ6mHpP50RQtdPn6I3HFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkXFw7siy6YLNsEkmmj6n/1ihaQm0dwe1YxZwSigkSBbhMF2bvRBtTZs/9pXmwQKKVaIK4DZ5a8CBvLGOmyeT4tu/AVuB8sNNtlFqueDKkH6KEoc+AuKLpKBznYod0aD2drM721uIBJMslS1jb1WFfXagkV95ILBRlj4cyrn+VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmvzAV/z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zoyn60cu; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmvzAV/z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zoyn60cu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbdHj3641675
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 13:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdaZ6sdPXiAoVOIokOjzAD5jN5cH1HtUETlaWKI67X0=; b=VmvzAV/zdNb39Nu4
	ACKmZ7WgdeZxyr7zKWUr39PM7rY1CHc778fkmaJFbleyaQW/549Kurtkky+8i2oi
	irHpy9zLbPRjp4xGAo0O3BeJPaDzxpqRFVfCpJglrLUKHTDgRPMCZdtm0qKwu8P0
	DgKxdIMy6gWlUPt8IQ/JwRMJDWYtNDmR6Pggjd9Wp0XFPDzF5cshLolsoJSdoQCb
	QmLs2nzpMXrnRHJfvC7pey6WGHSgb8KSmfpY4PEr7HdAcb1o1wN8w5f+RY4NsuF3
	P85nCVXlYUjbx4sw4b6I84chDfkFkSuJhioqfX9DjUV/PCTfH4MKaylc5JffV+GX
	+VLxBQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0p3d10ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 13:51:02 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ef8249f73fso17809126d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 06:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786542662; cv=none;
        d=google.com; s=arc-20260327;
        b=G4kr9zcbQQkYF+/0PCWFt/crjsVAyAeW+a7TmHE8lIj2nixXXhxE4gjWxCgGTxDtbn
         PsROmshRFRydPiNBwLPkBKoGn0yHBpu5ztB2WuL3+5scDnr1qqHGRhh5c+AxmztE5ogV
         ciSXwhmMBChKa2rwVm9GQVopRCTerI0ik+oTwNH1sPoo+OvoApGy8KVfItRK2rtsezoY
         uau4y2/fXiEiQCMbCQikz9w3MhyOYPX0El0ouR3qRLwjqGfAclemfsGqEbkUmZXmRYbh
         7sF7VcaZnPlnjH9Fm6YFo/1xFzfMmEKoFZIjqQ/7/X583G1Vrk83GB7186T2qkAkoGBa
         VyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qdaZ6sdPXiAoVOIokOjzAD5jN5cH1HtUETlaWKI67X0=;
        fh=K0dtkMbW7hWYAJBWmZ4Z+LkKegdYbFlg52u+gOlL6ag=;
        b=jPycZ0zv2G5SYxQH4IbTbiDXSWSN5roBcpZZ90jmyi9EQp8hOibaw1wcUNORBkZYFG
         RS1lG72n2VpjQvkNicQpugYEH6zPKDRDHfQzX7EtF4UVW7/d910OTOH7g1PzEYbWz/He
         74hR1Bv9tq8GBXBhrTvEQMAp+tcQyMEZeKp4QPUn4lFqUxjrNDtjvmjcFDJ/ZNI5/c4h
         VJ1miTjQs/ROk62hwWgWtNsW4RQxytlQyKAKI/bB/hA2UOs+dmdB528KcJroRP7pkiIS
         TLmFMhzXypHrDENaS/w13M91SQAENbHdZS3OK6ed/LjL56hIGx9IYu2X0CCitF7QrsZ3
         Oahg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786542662; x=1787147462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qdaZ6sdPXiAoVOIokOjzAD5jN5cH1HtUETlaWKI67X0=;
        b=Zoyn60cuxd3Y+S2glqlcx0ebPmiTYKyY30X3gXeBM2KjGoZ/Et3dzYIKQLuRvrw5Hl
         MfxxApDEf64FmWE0hNFWm/oL6bb9CtJkkezmqW7SB885TsblXKfgqTUyAGZVWkJgP8vV
         r9mfEXF8rkKQ4r8iI7D7IJXHEv1tN9ZUxlBcet4u3fnV1kDlIqca2gNBniLAOSnljwSW
         hCT1HH+5PClnw1b/jgEUVP2lx6F8dLTzMVJNdq7Lxipk84VLu3KeTuhSuzeYeD0FmBqX
         Bxo1l3hi/bPBt9fT/UyGC85t5PB7NaNyut6/scxrVQtxh1kSbZtnpewaY1cHBIciX1Cv
         hdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542662; x=1787147462;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qdaZ6sdPXiAoVOIokOjzAD5jN5cH1HtUETlaWKI67X0=;
        b=sGkavxZCYlXQSiq7YNZmeOZDlt6wjzZ3jfGREJke5ISmqC5MJfrhc8BsXB1EcuaL3o
         EtYN746dYvAJudrN0CxbnEmccsX7qN/fWdjrFMSEoLh0eh/mwSpnb3SEr2QnzdS11Ry7
         1VbLpuV85In5h5S+Dohbw8wcipmVRpP9hg18sdrfxtxMi0Ek1156U/B5t+jIYwCnhLkh
         P+rC5fo5TqQOhb1PPeONApIB1BrR77G1r5ThJCz7HDIsXHuo/VPT0pxzwtpEWP2tycTS
         KrZtzVegjpCkId0VHbZ3dKu7rYYEceZrrZlmGhjkyWE5c2F0mxgw0xeUzI1G6iedhdta
         MRIA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+L64SwqefO2zx/65JefHdM4rjy3CkN0bR5vC2FJCM9vVurZJUoIwPwvGtCH2Nz5ZSpT8OOdYpfazqIgtY@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4uCnXsIi9NMuPQTvA0Yw9e8nA5lNjqBa0emyawpeGL+4nFrc+
	3wRVVmtLXqLIfWa3YEEYpUmIky81Eq25qiy4f8HHRW6GQK0wQFxJnoHVIGDbxM6djuy2ZO6elem
	K+7PB5E+GsuJNk91SBRTsZQ5MzPiYPhjf6jHb94Rn81E3W6V6XJxUFW72Inux7dQWke9GWqis+1
	JtZSaHs2QKLXCWsFoABQ49+zap2SD6UacewERAb3Sdxhw=
X-Gm-Gg: AR+sD10op/s5Ln6s6JxHefLRyKMiqaGmgcXp/+0WXHjLbb+u8G3pz9PB5NGefsbfHl8
	vJHCJBYhrKoaP/VP7/K8OB4rupWe0lyl1BZquFNgr8EPsMwMLzDLh1PHz4dZxmUP91UeJv8hY0Z
	HDK4fitWBA/lk+3m/1p1sdFM1yfFEeoBrkH9T9oY9iT3NUYj1Pj/Gx1irKL5HcSyenG8OVGy83/
	VfZnCThU8MUdVr/jORN+Iajn/dBIN+0So4OMwHPvLrjut6TyqCFBU1lFpAppzZ/88OxOgGRv9Gu
X-Received: by 2002:a05:620a:648b:b0:923:8612:f15 with SMTP id af79cd13be357-936b3ad916cmr450085885a.18.1786542662262;
        Wed, 12 Aug 2026 06:51:02 -0700 (PDT)
X-Received: by 2002:a05:620a:648b:b0:923:8612:f15 with SMTP id
 af79cd13be357-936b3ad916cmr450082885a.18.1786542661921; Wed, 12 Aug 2026
 06:51:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812094425.3515179-1-lgs201920130244@gmail.com>
In-Reply-To: <20260812094425.3515179-1-lgs201920130244@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 15:50:50 +0200
X-Gm-Features: AUfX_mx6BU4whCh4J6zK1bhvqjl7XdzdnNX_zuruD8pdUd_6rsfBiSjTp64h08o
Message-ID: <CAFEp6-177whXgFj1uViqg1Gv=68GkqzG_gYqEbV1kX-9UXkSHw@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-cci: fix autosuspend cleanup
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Wolfram Sang <wsa@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 6WdLMUvotmmGHzVHlDBXkiWGiAy9v6kj
X-Proofpoint-GUID: 6WdLMUvotmmGHzVHlDBXkiWGiAy9v6kj
X-Authority-Analysis: v=2.4 cv=UfNhjqSN c=1 sm=1 tr=0 ts=6a7c7a46 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XDTyClmYPJ3ucqjADi8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfX8E2jPsR3vH2h
 ULmRhHB9/ZzKs4oEAcyTJdzs+xsleyXH5FqoORxI4JYqCZ/NLUBb06x7qUZspFgYpZu4NDjKf07
 hOTGr2+936bEgOWIZANSLcEVZw7hWvi/vOebU2TfLlq7VoCmtlfPeppMOHbLbcyhhuGbD4HfcSC
 oQ4bj3nORlp37MXV30uexvP/7pxSDPFUTMaYdKGGHh2j+Ygjss6r5Zmx1Egg6MaZ0uwkNMuICDf
 Tx1DSJk44DTuFFxT16jzZ8SsdT135jwp4vWHmHhBl4ayRbCvC9cXW7xiVjUkljGp8fH/vBJjt3R
 4bDWKVI3ut6s/aLiWaNjytx6WvpjAdkvm6xTQi7pLAkgkOlZw7F2BYuAkd6CuXA4zhrJP7EWqFs
 mBGV4PYUpmCHpSRwpcgHRaxNL9CekcddNojozeAIYZ9IgX0wcwKtNl6/wALWMXMiRucAxLQ9MBs
 8GFH8AFsqTJojTgIdIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfX1P/f8Tfg6rue
 xGRx24sCut9pIfWgJejxbyTvCIPg7KxkII5GyepcIMjRaEkGLt73CjfF0v0/XiIp7Zl8vW1Ryba
 hZsddOj9k4Ij7RzQZCfSy/WRgtwbjxg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120112

On Wed, Aug 12, 2026 at 11:46=E2=80=AFAM Guangshuo Li <lgs201920130244@gmai=
l.com> wrote:
>
> cci_probe() calls pm_runtime_use_autosuspend(), but the remove path
> does not call the matching pm_runtime_dont_use_autosuspend() before
> disabling runtime PM.
>
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without undoing the autosuspend setting during
> teardown, this reference is not dropped and usage_count remains
> unbalanced.
>
> Use devm_pm_runtime_set_active_enabled() to manage the runtime PM
> state. Its managed cleanup disables autosuspend and runtime PM and
> restores the suspended state on probe failure and driver removal.
> Remove the now redundant manual runtime PM cleanup.
>
> This issue was found by manual code inspection.
>
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index bdeda3979c48..25b6e4e9e3fa 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -595,9 +595,11 @@ static int cci_probe(struct platform_device *pdev)
>                 goto disable_clocks;
>
>         pm_runtime_set_autosuspend_delay(dev, MSEC_PER_SEC);
> +       ret =3D devm_pm_runtime_set_active_enabled(dev);
> +       if (ret)
> +               goto disable_clocks;
> +
>         pm_runtime_use_autosuspend(dev);
> -       pm_runtime_set_active(dev);
> -       pm_runtime_enable(dev);
>
>         for (i =3D 0; i < cci->data->num_masters; i++) {
>                 if (!cci->master[i].cci)
> @@ -613,8 +615,6 @@ static int cci_probe(struct platform_device *pdev)
>         return 0;
>
>  error_i2c:
> -       pm_runtime_disable(dev);
> -       pm_runtime_dont_use_autosuspend(dev);
>
>         for (--i ; i >=3D 0; i--) {
>                 if (cci->master[i].cci) {
> @@ -640,9 +640,6 @@ static void cci_remove(struct platform_device *pdev)
>                         cci_halt(cci, i);
>                 }
>         }
> -
> -       pm_runtime_disable(&pdev->dev);
> -       pm_runtime_set_suspended(&pdev->dev);
>  }
>
>  static const struct cci_data cci_v1_data =3D {
> --
> 2.43.0
>
