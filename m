Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B114FB9AC
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676215; cv=pass; b=nht9m+RcEpgWGrgUCk7/u0ioSIFoOvsdKHAQECdC8mX0lt4m6gPGXSxoxtJ5ku5MqfYT4Rdf4SinX/opPh8HzV5q0X/tjoLKaDrNI4FKdot2UeubeVPXFNhhqUuxWvmjSg+jbaupMhdEvtHGpbk8c3glz7kIaTMdBMVqNXFGKF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676215; c=relaxed/simple;
	bh=428tXCbvtfrk+2zlh0uwJkqz4i0sMFragXvVb9rwGLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WpuUy5I9IzRP9xzURkW6TJDAu3zI8489Zl9cc562GdZB17G+0ti0rOr7x8mLuSqmHCWPDPAd5XKlup8HTKOTSxbVjX2SgYJ08AVMP8aBRChQgMqGRxzzFDeL7S7BAJwbDTlcPetYsS37hkJu6m8ND4FahTXObY6Bfq0sLo9qGyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WRRIX5+w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XXIQ3xzp; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WRRIX5+w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XXIQ3xzp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T8XRZR1004680
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=; b=WRRIX5+wX7JM4mWz
	/tShCvtr9UJWqMeykDUccHF6LMsQpbqWmaVY12gZj/uEzZtP2j0opy2dRARb7xGA
	Fo0ktIRt7YSHn/D6MjrZon8SnLkUJ/AstmOal1R+1+OeTNTCCi39evHFEkl9CbK2
	4RdnU9cMBMhmjqNzUbe6n+yIpNLNhSJI3W0kRAxxbRH+iz2r6nI3Dcv0g0yodmZl
	inAmX/2fOHsCv27Y6V99QtXHabEaF3WKabjsWsDpn9N8OwfTOjudVGJkjsTN3uU5
	uiRikW+Z07x6qwiRk7WFxz9pCZujAdfqgjMWkvpwaWloN5YdoVVAIT6cR/1rVYyO
	uFXdBg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4rbrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:03:25 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a183a0e93so872600785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676205; cv=none;
        d=google.com; s=arc-20260327;
        b=Fvk8sHgpthyLsdyHmaQj0jxFqsyNelsaajID6VuviFnd5bHNa52oy8NpEZbQAnSuXx
         /CP4SOEcdmYYT3rxT9zDViPeiyvBzwbY+IKk87NsZQx8Z9o/Hiol3onp8QC4X0BgdylH
         8bnGxOy1CbKPsD65PEuS3kU+qlT+7uTmqrSQbiGqkFzPcasQOAWRTbti4rEd/Tmcwr1w
         4LWpyZsw9zDvnXZob/0dz/G/OAiJQhG1buzDfIRX0aptVv8FCZdmCebIPGD8vJtU4f2c
         1vXElLRzrGPc2gYwI/wfnFYnKxCkUoQ8X9GyBCdkq9F44qHZu7bG65EWoyLx8Rai/q4k
         J9vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=;
        fh=jah0cxJGsglTvLnbIVKkW4h76WmhWW2XRa2pe+dVBEY=;
        b=SiXM8+9sTh4rvt5a8xPigL5Uv20IzfiIenMkEZu0CvT5zgzueRqlvRQURFInQbLjmd
         rfEYeOpDw+560RCZ9+m0y5+865sfXSFzwFU5eSVqzo19l0M7MrY7LWgGdvgre4xNiz5x
         APx6b0C7UP7liQ1UY+9M8mRtaPG5DC6RXb6CarK1VpTa0zhNs8fYTb0+mp5SVY+xaZlt
         z1m0LgcEQqKiX3Qy+oGufZojNXhC9FAtqM0VEblharRmqkilCcOnY2RRaJiwLvpVfGeE
         XN88ZN3qOWtg7kDBTSYHkB6FH2NxtRVK6+LoOWM3FZBRZkpe7EhEu1xPtwdogBzjDZgV
         cflw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790676205; x=1791281005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=;
        b=XXIQ3xzpCLCifScGQY/i4EzKS9Xo0Ff9FyJuZohg0ayu/OjBmSjYA5G4VfM+l73Mkp
         Ufs+X/5p5Y59t711G29B/dnfCa5CFuSJekUtgvaMlZNUQG6LCwwe6V8UUR6gmYY5shaN
         m2TaEX7AR60fi0MbAcNkmuy3VBg+FEbwNKgVJO70MgsoODXYaVG6WjRqS7TpOMAEjYO4
         vkxvxEQjpmcYY53Wht+Kwn8VtdIGofQHLQwN4SlilvazUIKRSFZxU42Rzt9DlcgyvMFv
         gsenduSDHM6m9l2tuv46S6gww+8DWSkLVHx/qluFpsi0ERL+V+VYtquA0R0iAnCFM3Fy
         bALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676205; x=1791281005;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NmhBYMIxyetX32o034YORWUFSNbgOUrruLgW7i9+vds=;
        b=fErtZlyRaaGLZRFcnUOGiBjsCaVR8XOGJl3Hwr2GZbaYNMyZdYBpo40rfedJOET7Ls
         Nu962YUjV41ZyLjidTCHPkWN72r0RR4aojDSJqlPfsLdjNcLRc/m4mv7n4M767AFLCxx
         JjzxLQ+vUfHt/OZNxSneBAw1IX0vNkZqx52dnAZbW2zkrd10HB9eBxYk/E9Ykq2zNXBq
         QvwRzuIoyKFD2rRBxvWEn11eIyZ10BBcmeaK/wsVKCLMFl/nfe9G9ga/5j0ymwpXazxe
         VxSVtSSEknvGV3r8QapKGLgxSriqkgEC026R3rIpaL4HNhH83wKzeDUFwgCaLx0wmXqy
         hEhw==
X-Forwarded-Encrypted: i=1; AKwUvBzrWfrtk1liAkIeisCCokeRkISBp+KqXlvPHPEs6RkdFqQV0CxSg6CxfGNYmyg9Pm9stM3lzE1s64tKEDPE@vger.kernel.org
X-Gm-Message-State: AFuF++m8vv01RD2ExL1qORfrdtkkA5EfxksM1oPiFLM+JX5GnDfhJ6/e
	NS1G4IHw8Nl/2DzAKJl9nK9qEKW4AYcNqjs7vjed9ZD6JgbFBtGHb46i9IDEdJnIpInPIEdka3g
	Z+icHxiauiR/WlpsO+s3H70PHlZmtHmop3dBDxWHyMpkqnpKhhuh5y55gcsrqKFQJDDeCBtufjZ
	/9reGF2a15P7yN/FFaL2PV03vFpQLhCdqIjUSWefKMNaM=
X-Gm-Gg: AYBFou0M6IwLXX3Ej7prD1ObQ4cxOTdr6AuryEKkKDOE9e7yvpoQHaYQUzzta7NdQXT
	Y21MZ7unT7bL0gjLiTgcErWxhsXl5vD5QWjucLyUleMUD+0G4i7eklpAVEhlQfmN6OY41d+JlsP
	SEiKxtU7TS4nwds23R0U4x4I7ferVDKA2rWEnDwZwWnjjg6+MVrssxS3DRcPm5M+TbfudjYaixR
	pspSwcTMJ24U3cN9VUmPgxfIzwsKQtnFvMuf6enclZfqb9JgDXiMTNAPWMwkjv25OOoBOlJ+J97
X-Received: by 2002:a05:620a:1724:b0:93c:2110:14e1 with SMTP id af79cd13be357-93c43cd61a7mr2588125585a.42.1790676204596;
        Tue, 29 Sep 2026 03:03:24 -0700 (PDT)
X-Received: by 2002:a05:620a:1724:b0:93c:2110:14e1 with SMTP id
 af79cd13be357-93c43cd61a7mr2588119585a.42.1790676204086; Tue, 29 Sep 2026
 03:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-bt-wcn-clk-enable-v1-0-30bee88c4de4@oss.qualcomm.com> <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
In-Reply-To: <20260925-bt-wcn-clk-enable-v1-1-30bee88c4de4@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:03:13 +0200
X-Gm-Features: AclHuK8hrus5ifIhd0kBrHEFVRgKNmcLi6GGy2VwQ0rTLUBWrWRbn9i9ZtKBjZc
Message-ID: <CAFEp6-1J_nnD1OY=GBET19p9+j28n9LFmt5CgoiyWr7FVSmOFQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Bluetooth: hci_qca: Add WCN clock management for
 pwrseq-based power path
To: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_mohamull@quicinc.com, quic_hbandi@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfXwSLLXh9yoc8h
 Pjsx+qNn6d0qghsDXggFrDTjiYKlHYrNCFon/gAVZzm2/gcovurrQQrxTn4w/l7dJrAalfKFk1e
 ATo0hcQOcImeUlfrTFZPk/FQTtzf0Qw=
X-Proofpoint-GUID: 1btdghPZNWr0fZeOUae61RnT8QwtvWM9
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abb8ced cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=k-oZKQUuCPdrsXQy0KMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1btdghPZNWr0fZeOUae61RnT8QwtvWM9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzOSBTYWx0ZWRfXysKm0jOdtUWZ
 Nc8qybZ2TW+iaw5dGGPVD9yIRz2NUcF3df4HHjKv2hse409inHJ7KZM8GkcglLEegEFlUTmXKGe
 9IEmF4FpHoz5TCrT9CDWd7u4kCXx2LtsKG9Lt+kpxKHeQ0Zo2Tnzh1VrMIv5rXEAQiuE4O0aXDx
 hBEe4cBVdLMrOusI7JQwoQuQXQAVitscCZPs9mmS1OQ3Hhiz0EmDx7iwt16V5F03h4PMOsQamSd
 e/8vWDY0nsuNDSlpkBJ7qVA8Q8WHXxcEugTpVK4NZGDFnawVYMLqkBs+0JZHvsH89WaiBx9f9wu
 MY7XtFBLF6AwCBQb3iC/MQqAneRVxqxPN1qakKqS19WB0sirEd89DXO5hkAncHzgoNqpxox+UUI
 RHCNSUT2YcNET6Pf6EkCBHAu2YdbpMm/IBJnESh+kRxJnEqLr3z2qd7aaxHZDXns9P6nDF6DciQ
 25FSsKgkZ6H6hHbAPYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290039

On Fri, Sep 25, 2026 at 8:21=E2=80=AFAM Yepuri Siddu
<yepuri.siddu@oss.qualcomm.com> wrote:
>
> RPMCC previously kept WCN clocks enabled via proxy votes, so the pwrseq
> power path in hci_qca did not need to explicitly manage the clock.
> With proxy vote removal, each consumer must explicitly enable and disable
> its required clocks.
>
> Extend the pwrseq-based power path to acquire and manage an optional
> WCN clock. In qca_serdev_probe(), acquire the clock using
> devm_clk_get_optional(). In qca_regulator_enable(), enable the clock
> after a successful pwrseq_enable() with proper rollback on failure.
> In qca_power_off(), disable the clock before pwrseq_disable().
>
> Targets that do not define a clock in DTS are unaffected since
> devm_clk_get_optional() returns NULL and all clock operations are
> guarded accordingly.
>
> Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7089e9b639b2..489a059e519a 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2265,6 +2265,8 @@ static void qca_power_off(struct hci_uart *hu)
>         }
>
>         if (power && power->pwrseq) {
> +               if (qcadev->susclk)
> +                       clk_disable_unprepare(qcadev->susclk);
>                 pwrseq_disable(power->pwrseq);
>                 set_bit(QCA_BT_OFF, &qca->flags);
>                 return;
> @@ -2324,8 +2326,17 @@ static int qca_regulator_enable(struct qca_serdev =
*qcadev)
>         struct qca_power *power =3D qcadev->bt_power;
>         int ret;
>
> -       if (power->pwrseq)
> -               return pwrseq_enable(power->pwrseq);
> +       if (power->pwrseq) {
> +               ret =3D pwrseq_enable(power->pwrseq);
> +               if (ret)
> +                       return ret;
> +               if (qcadev->susclk) {
> +                       ret =3D clk_prepare_enable(qcadev->susclk);

Why is susclk guarded by the pwrseq? They seem unrelated to me.

> +                       if (ret)
> +                               pwrseq_disable(power->pwrseq);
> +               }
> +               return ret;
> +       }
>
>         /* Already enabled */
>         if (power->vregs_on)
> @@ -2472,8 +2483,14 @@ static int qca_serdev_probe(struct serdev_device *=
serdev)
>                          */
>                         if (IS_ERR(qcadev->bt_power->pwrseq))
>                                 qcadev->bt_power->pwrseq =3D NULL;
> -                       else
> +                       else {
> +                               qcadev->susclk =3D devm_clk_get_optional(=
&serdev->dev, NULL);
> +                               if (IS_ERR(qcadev->susclk)) {
> +                                       dev_err(&serdev->dev, "failed to =
acquire clk\n");
> +                                       return PTR_ERR(qcadev->susclk);
> +                               }
>                                 break;
> +                       }
>                 }
>
>                 qcadev->bt_power->dev =3D &serdev->dev;
>
> --
> 2.34.1
>
>
