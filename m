Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FD046AEF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582140; cv=pass; b=qDQ//dwYu7XpfDOrqddcMtlPmRdoxV7VlGFBtGnYF/1fBMSTN/XQm7imYLGD+XX6Fg32bKVz116GmMvRbu9tAijuErZV47xrY7nBOfWYOG+cOuGf2MOTXFBQNAvmJx3g23d9/JtuUxRZlV72x7ECPvYGZvnUv+JK7G6uGqgVh/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582140; c=relaxed/simple;
	bh=UuW35MBetpwb1g3X+//n/9JYo+liVtpSrqvfGQ3Z07I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Akra85KwtpKk4Ke5tXP/di4ckuBCF3KFWJo4sKfXPnpgnIKVXRKtsPl2CEFdRRykPIHWfLQNMLm/mZbfuVhZ0pBSZhFfDwBGcMKziBIq96hxDVT9DjVSwwnqQui/oM+RgCriKHEj5S6xehBe+Bko269iHGbiECp5bcxiX0V1KG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0peEhYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b/uhY1fd; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0peEhYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b/uhY1fd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S6dKBP446544
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=; b=G0peEhYk0QmYK2Ue
	5puv6C7j3KK7DGvW/TydgqUiMt0lZ8pg3e8dmIyTZnv0YiVCBcV0t40EqChxrXyL
	O7l7uMrtS3whu7raqcVGxBKiqmGI6qsAyAh59nwLifAiLirSoNE/hQzv3zhFIIdO
	Du+vXbgcXKTBSmaFjM3yMAi6JzbWQGnpffOhRTLYJ1lWBMSPsgXR2oMJWoZRDBeA
	R6DyChEL141+gwRtR4T+r6TP4oKbU59UkK1X1j+C6XUU0N1VA0GY6IeE0q4TIbVQ
	KphuqqOHkBrgWEkMtcci/UMnxMG9PDpDQ68ieiGxs7TxfM7emOo3wOPSym4xRM3w
	FSKvLg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mr8b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 07:55:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c7d1c402dso73606985a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790582136; cv=none;
        d=google.com; s=arc-20260327;
        b=QfAosEi7Q+JiJrUEHFhpbpkhU4kq1qucsnQ+/zCNwtNdYb+ECzX6aPdxwKFyxcbg8J
         67rDHg0qjlJ+mAzXEqfUelLt6NvGjdd4m6FmLWjDmiRQveHino9BgAvLbd5mkZzxfFmj
         mhmuDT98mJctGIu/LzAlZrpobR51WNUzurP3LAB1h1p8GZUR6V0Dv4GV80SyHUcof/+d
         cm9SqT6gg3vcwuX2O999uTVd640JRWmyNnIRpYw2xIGKXhlXrDP4mXs0W/kMq6N4Hz6h
         Nsb2VmB/25UPkF6rBRnOjC/C7TtHlYd5eJfJeucaomZ5T5ERZT4vIBSLlTO/hY4hd35i
         Q2lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=;
        fh=PxmB0oEiPR/0IKb35R0T9Au4/CK+iN9VRrTp9wirmC8=;
        b=hFTViDiZm0dUybs4KrF/JzR/e5lO5a73ty5bRnod/tokflvV4d6tKlgWiEzYDp/EXr
         2Fzf74Fw3xgFsJCN3EHKCdyZMlaV3UwvlDg1KiYT9+KihPWPhFwvh4+OyQTPtw64bM+F
         cfVGn68DyIOuWMXN4uWugcVaBuqxSSI/ACBgYnq8oH1UKXRxJsyMrSiigl3hRSIJDlo3
         NPXo6hp14TaKt9jVVV+PdttZJBjB+BQSlpg6/inlA57NHlfTunii4n5OZvZQVssbtkcV
         PjrzRwBM94vMHdv2GWfF9cIa3JKZkYBJlJQQXBrAdrAIfSQHiifDCi3fZtr7wu9EO7TH
         ldQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582136; x=1791186936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=;
        b=b/uhY1fd2nKnFVrwPMWldzMmENf82vQ1t0Leufi1lAL1tkEdvzSCTZHC9I16t3tpcZ
         zvQapNevGBsH4QmgQCANizqPYKAQR8JCCgRJlV1KuucH/rckznjanAPblHA62+CMcZnw
         kx+L+VXUoVfXEpp6skYh27bVVHTTxa0nbI53ZVl3Fa3ZLlzLraPggDKlMs/zV1NRuqoS
         LL+64QCu40BBvPw9xxvEjWnwD5OdAfp5M6TaJq20OnpWWPRWF5oBLGjw1+e4xtLwa9LU
         ImGmVNYIodM3i/5X2YpwABneW9McfHT1GSE3Hj7aNjA1NU3ftrxdgyK/ch/2MtYshKPH
         TUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582136; x=1791186936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTNiXfyvPaAwMHsslS5POvu5n35IM7ktoXHv5WJO9sE=;
        b=EKoQx2C/v7sarByfzLP24ccCS1igdCNJ6nxwF+ffA8jQ7CtRcQEDi4xJ2KFVJ9jlaG
         9XUz4PZjPqjFDWMUAKdY8vgjIPqFiNOo9P81r2RB6HvrXhITkLVE1DwwjsFwsEPi6NX3
         SBxHQzwJT+Da/KTysoy+g9z7jp/4kBSSG+EbNHaqhnYMWQUbKu3OaWhivg+cxEci27Cv
         EVvpDIDkmEDp5U/R3p1totvkd3PzqgNprqakp50topcWcda6UIGVOLlYYOTq5DLP6yRc
         1OFCHrC3azmU+LUWoSOnYyFgLgT2JS3h58+gP3qE3l09vrhEwaElc+7kK8cpKeJBMSpC
         JmNw==
X-Forwarded-Encrypted: i=1; AKwUvBy9mirmQfy+2np2AjXdv9x+mMrUWJDWinPl0LhVKJSjokBg0rsuppjENWtIqmcLie4tNdV7TTz6Pm/KC+Mc@vger.kernel.org
X-Gm-Message-State: AFuF++lyLq02eWRw+AjMTZsm30g6EYiKatzJJxS159yj+8v4hASQj3pf
	hFuiHamic+Lz3pnBu2BTiuCPqpzfOMLkeN4qe5ylgjd5E2ObuUVlUmK6PoRzTxZiilCyd+V5IAE
	LRYDlBXsBNlfndB3LPY61k6y4IVYbK3pmik26QaIA7vCtVxEJbGHRS8dwbtsimccfIsRkP0mrUQ
	Zy/lX5WxJMRD3HJPyUx66aTPS8PyY0WLl2umxnIEfXr4c=
X-Gm-Gg: AYBFou0iNutNH86oPJWES4Xg9flKgAccVrwLwIz/eySZrPGjHAU/fetwFi7Bh2K3XaP
	Fn6mzNUfzfxeAUmAaOURU8Cs9dmUUMB218qfapZ3MzSKB8cobqGLDJ39T1meiEi5cOAmII19FJi
	gPxttnqg9JVgAcLONKReqTNwBet8Xj7avZfwkw43Ue66HTVYgxf+iQYEPjP0qWWYmGBLTgNlf36
	1L1Ik7HFRDvRXXRvrTkbajd2SkMF8IJNgApXGeSxGCCYqSddmKkrTA0T9dTffVOZbc1tX7wj8Y=
X-Received: by 2002:a05:620a:8810:b0:939:c303:c54a with SMTP id af79cd13be357-93c43c9db58mr1958676385a.31.1790582135655;
        Mon, 28 Sep 2026 00:55:35 -0700 (PDT)
X-Received: by 2002:a05:620a:8810:b0:939:c303:c54a with SMTP id
 af79cd13be357-93c43c9db58mr1958674285a.31.1790582135196; Mon, 28 Sep 2026
 00:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928064336.272659-1-hitesh@ebytelogic.com> <20260928064336.272659-4-hitesh@ebytelogic.com>
In-Reply-To: <20260928064336.272659-4-hitesh@ebytelogic.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 09:55:24 +0200
X-Gm-Features: AclHuK_oGCJSjSnsJjbXR3zmNY9Fqnx0g8gO4MkrHkFwsN1N6iEzDouVu-By03U
Message-ID: <CAFEp6-0F-0E2OAQXVbW5fk5bPyBJH-sxWax2vDUouCCe6RQzeg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: qcom: camss: vfe: Fix VFE reset while
 another line is streaming
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        ravi@ebytelogic.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: WF_shMis1YqpSyoBcpAs4OgvUl-FJ1qa
X-Proofpoint-GUID: WF_shMis1YqpSyoBcpAs4OgvUl-FJ1qa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfXyxUkrxK+E+1g
 L8Ub3N6m7cL5Pw09b39rCBOn4uRwOtTiAJefSrlBXrU1cnBeROiJJusiwqF545li9sWKw2jIpjn
 Up3yAKnvZH3pTheYJMlScqaslG4zzUMvezrFdv/wF1JHP6ySR2+rEsE3yCOwZa1QINXX9Gg9J9H
 jG+vFY6Nl9y/Cyd/b9rQA8CQpb1V6Ev8YN75bgYelBTru/huu8h7vRPk/uidaIOqoivHPsv6Tfw
 tLMgzS1QvmWq0+7VqHByNZ/Fhr4LrDiRqnuTueO5oPhNsdsUWYxC7Nw8YZhQSebXrj0IRnpqwxf
 bkbagDVJEq4TEPKeCqQziD/Wkm/EGzOZnIsDLV71Xot1sUo1mGCkImjKfsQMnOycVIUz1I7VI9W
 zSAKto8Q/KS+q3JcmJxxOYQsxf6s7BaF+cG2eZQIy0f9v46zo1xzK2wgzvhyv2O+ZO7kVbEPhh0
 CMQzsLPb/2xKYnz6g8w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX45U7vCATgdWX
 BgWKoIOlkS+rs8EnCHsQxXlR+g4228XZnywdkbSJqCfZzGBx8ex/a+MR56OKJ6AU+D/2R1QNwOG
 z7tiDaHKAvIQG2Zesf/iwYOQYByRsmU=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6aba1d78 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=ZovgdgjKAAAA:8 a=lF_edr8HrfaS-bhVEKgA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280031

On Mon, Sep 28, 2026 at 8:43=E2=80=AFAM Hitesh Patel <hitesh@ebytelogic.com=
> wrote:
>
> vfe_disable_output() stops the write masters of the line being
> disabled and then resets the whole VFE. The reset is not limited to
> that line.
>
> When two lines of one VFE stream at the same time, which is the case
> whenever a CSID demultiplexes several virtual channels to different
> RDIs, stopping the first line resets the VFE underneath the second
> line. The second line's write master configuration is wiped, the
> buffers it had in flight are never completed, and the VFE is left in
> a state in which the next global reset is not acknowledged. Stopping
> or restarting the second line then fails with:
>
>   VFE reset timeout
>
> Only reset the VFE when the line being disabled is the last one
> streaming, which vfe->stream_count already tracks. Stopping the
> line's write masters is enough to quiesce that line on its own. With
> a single line streaming, the reset happens exactly as before.
>
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version =
Titan 170")
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index c14d97a131..3442dacc80 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -814,6 +814,7 @@ static int vfe_disable_output(struct vfe_line *line)
>         struct vfe_output *output =3D &line->output;
>         unsigned long flags;
>         unsigned int i;
> +       bool last;
>
>         spin_lock_irqsave(&vfe->output_lock, flags);
>         for (i =3D 0; i < output->wm_num; i++)
> @@ -821,6 +822,13 @@ static int vfe_disable_output(struct vfe_line *line)
>         output->gen2.active_num =3D 0;
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>
> +       mutex_lock(&vfe->stream_lock);
> +       last =3D vfe->stream_count =3D=3D 1;
> +       mutex_unlock(&vfe->stream_lock);
> +
> +       if (!last)
> +               return 0;

Instead I would move the vfe_reset() into vfe_disable().

> +
>         return vfe_reset(vfe);
>  }
>
> --
> 2.43.0
>
