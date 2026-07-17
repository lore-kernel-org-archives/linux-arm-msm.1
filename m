Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647B442A166
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299516; cv=pass; b=o2OuY3aW1NCd3amUJ4+Hq+SC3DuylbnoMHjjPWpgKD/dtY1hJDWm52HqzEgfr0wxt+GBcsnGcfBhFk3ZAHSl1qWhw07xoJDX2PDy0EvcgFGXa/5uJxhl69M7pKfZheNhbG3/YiEoaWD8bPx9Q0SNGThvybnVq+2uM8ndulc+0Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299516; c=relaxed/simple;
	bh=FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n6sIXdN94ALJejmUFKt+SjgmkMdDeAWCuwPDUYOOzW8aUmbOqKMWQHwKzoqTbf2vHv+jTjMAb3+9JbAigfuyEWokqGghCLMxqPPfF83nRkf2pDAEcbrN0NEnQgygRDWCpgLOmV+k55qrVkpicj/l8FidNRKVJMKsE0wXrewjaf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgURRFqr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D68BI3dv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgURRFqr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D68BI3dv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7d1Y1809121
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=; b=LgURRFqrlyVMT+rN
	DOONXjUOuinpRQGIpUDcZfiDuF0qiWwRCHIJMhp4rmAHIIm+LPtl/yHwWBfv0OGv
	4ubsLPL/cMwo4MeQny3CEs/OfKd6V3c3H8dHjWXXTAJSK4w3v5oNLS6B1T0AjjRH
	hehaqU+4YcUg2NEh4TD2fLrzEItb9woYQ2O4cRddbgFJRhioqfE1WBY5buPNd0KC
	s24Vppribf8S2/UxeDXp8C4EwtkL6jfglBPs8yhrwysfm0wgJFYOT/CtR3+h6iv/
	XzOo9yOHLMjkkdIOKotPJfbrlMKPc/N0aZJAb44l8ptFUuxXIEjQPxPu9Kxw4d7B
	jmgf/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8m7gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 14:45:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so354048385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:45:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784299514; cv=none;
        d=google.com; s=arc-20260327;
        b=QzibLBnrMQ1OP7glc9xaXoUKD+j4VpTq58C5z7E7o9W8UWJi4yfZMNPKRel8dbp72t
         +srurOnKAJhxR32iOro8KOu+lOC174W/qC6svFQHSOf0oMiJZEkVFQsIpETtC5bvRNId
         KLPmHnBGTVsFQxIaAQO1rH8ZsCJ/xO+fqpLnrmTSpjGAzPTZFkhFLc+HBwb0B1RyrtzC
         87krqur+cwz52XWKQkOS+LaaJiwnrU2sghVl2804vruXqYytzYeH27+80GzVMQnifaEc
         nrMNTn61z9w6vd3cy8RV/mQsdCGwMDgq4CWkCi3dR7encbGJkDQXfFXn+nHA5DXW9OJw
         H35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=;
        fh=mlhTbofqh2O9Rmz9bsTGk3IWdoU7672XtRUf9TuJEGc=;
        b=BUWbEXPyhW6s5flj2A2Fv5ZBUuGGy9MDjgUlnq0EgaUm8KaZWOfiRFWXPc7ZsTTQ42
         C/xGA/PzYJp9DpEqAggrZQujVvJTa8mYpn3Zido24ksWvLgl2/uDdeBbmGlMlZyHxX1V
         YHGaZpeWhrZBDVSGJyFf4uLUo11ogFJ9dkc5nF8T/NSawOKg2zvOq0pPOOWsXpZWUoLf
         ye73EF3HtQ45WTKZ0c5EXLDJdSSG4CV2olZNymJFJ+qZ5MmLFrNStQwwkG9cYCnEd2LQ
         r980rG1qmyojqGWatpulmkSrak2ykcCxzHgNbhduYv6omOt2Qoz7536TcdxHzamDZSU0
         tY1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784299514; x=1784904314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=;
        b=D68BI3dvWRmdAIR65e0X57xipBxSsWd3Hv4hH7Bof1XPMbWMtpV+ZYyptldiIWUX8y
         L+z2NQhVRwPPdiSzGenL0eSf+FGDN96uO06Rf5ZilDVGyxE09AYa5mWjPRytTByLnu58
         GlIXSk5DzFjA+tFtTjA1Hk7OVPRR0m1RqZBYXkadKTvHAu+Yedxozn/EtAAJyv4X4Pst
         Zga66iXSBuGTxAfAktmnF/1Ssb3oMJ8/bq7Gvz5TVJQV1HIYy32GL1R5TvQc4Cddi/DM
         Xb90bmlJoc8Rh4hz2kdO5MoilXFf/WkA9jYM+Mo193bWXV6Ar5gbyyhKfpbUFJ+hH56k
         9PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299514; x=1784904314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNzsOpMvx2fOI919kTiNEIxpFwaZQjVvzDd/rPsGLQc=;
        b=WXAJTt+QLxkNqSuwcjpU5Qh7zQjQEbAYgGC3VQMIjchSTpUA0USU7vsolVQI2vK5YS
         PGG1dAbLGqaeOJgS76sU+mMsUDGRKZ7YmZIx5UQDzu8J66AmAQFWTtWhSU47OgFF0m5s
         fdF4WKsfryHx/xCzQkAKI5KumEkUQSBEwNhnt8DCyDcticdW/fCCoPDS6YKyA5VGXSO8
         dobN91vS4zkYCEdwy3Z7vNlWGdaEIcFQo4Zd1O+r1S6/SIXxbbYoEtohmBoeTzzeuS3f
         uBtEFozOO4bNes9YDwrlN+i7F/KkTxTj7Z0knen560v4mTqPk+BosWK/6Rumd45KfYMR
         TS0A==
X-Forwarded-Encrypted: i=1; AHgh+RqNWhRNhdsF6HPvFLX+c48HLWUROLCeceH/w+GSVpqppyrS0txLokYNEDkOb+FE+xfW9uDZITBw1jSmnT4Z@vger.kernel.org
X-Gm-Message-State: AOJu0YxiPfg1W8pgbDg6zPLEujn5vKQ9GuWxEaGVJfyZA6yVgx4RXfGv
	LmxDOQSG42D3qw0PFO90UJj34pypkV5rs+r03jMfuwBQsWXTjAcT7Li915Y4bWdROJA/Zs+C76g
	fqRcvp+nvPPTLm0dlsKfNTsjBq6GyM/YGsT6XcPnZ8wbtLDdNvC8AHES3tiOFD+OJDGla/r9jqO
	mIaDQCZQg5xW0Ozs8WOQ9QSfycDlRc3bKOzq/G2uJYtAs=
X-Gm-Gg: AfdE7cnGO9jayvdpNStnIXSpFBbNF/bkYsfjMw0WjkXauhHzbMQwf86lsIFUnv4asCf
	Uf5jadQm6xPvg2BLekwZVSDG4LYneWje5CkX6iWT8LkTdKfUUE0qSQUY8NMCfjBSWo2FX0XWIDr
	Wm/eHaXseUBi6LADxDp8ty5NoCaoplSW1dWwrwaPeV526+cbbCCV2mmWsonZoXGhKMkwl7LgIfH
	MVADo+E3MABAMOlAHmUu/+MYLigVXLBAQYlrX+x8RV/KzlRDgoME6VnCdv88LzOgI4Lf0cplhbI
X-Received: by 2002:a05:620a:6914:b0:927:efb0:3ad1 with SMTP id af79cd13be357-930b4929a49mr284920285a.26.1784299513640;
        Fri, 17 Jul 2026 07:45:13 -0700 (PDT)
X-Received: by 2002:a05:620a:6914:b0:927:efb0:3ad1 with SMTP id
 af79cd13be357-930b4929a49mr284915985a.26.1784299513132; Fri, 17 Jul 2026
 07:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
 <20260716-monza-wireless-v4-3-9b02e6f549d7@oss.qualcomm.com> <CAMRc=Md8mLgYRsLd-KhwVV8X9AcYbHf--RB_pf0xFBP_P_DvCQ@mail.gmail.com>
In-Reply-To: <CAMRc=Md8mLgYRsLd-KhwVV8X9AcYbHf--RB_pf0xFBP_P_DvCQ@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:45:00 +0200
X-Gm-Features: AUfX_mxmtgHrdkc082wiMIxBxijXxJxzFJEhJ2gZz60O6dCpV0Wr6tzd5_cVl7k
Message-ID: <CAFEp6-2pbYXFTuozcg51+dQ_mKin05o-GqThyJLBjquFs91RQg@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] power: sequencing: Add pwrseq_is_controllable() API
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 4yqydIXJvLDdUm-WSEtaLJTmIQrapZ8W
X-Proofpoint-ORIG-GUID: 4yqydIXJvLDdUm-WSEtaLJTmIQrapZ8W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX1HWq66oXg/jg
 pZKRDD0/W7mcgAxQarq3TGIyibRFMk7Y7eBX8jQzBWFVdwIWCALUhURNDDtJ3WzQwT90b4ucHNc
 SX+id+yaVxzlajbXiugonl3CyTpX97M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1MCBTYWx0ZWRfX4uTthcmCZ7cI
 FRqBTn1rU6aaYeUM2KOp9STfoKQQTjq+cZw0PTp21w6o2yGio9iRV9rh8WWVw75p2/pgZkrHt1k
 gnQajt/9HY1O75ZlvAkBjljM03vpEspIWKM4WBApBrTN8hB+6QFO5vXPdrbVHABDDG9fj3j0wem
 dO0UGjLQ6IyADotQ793UP1K8XBFDK4RrnPgF8Fs+YiyAszjA0rRhVws7KJwdJrTM3hzAKmOC/QE
 rl3wKxCKHx5J6fIS/iodYsQ11X/TU3lRjgC3CbWd4gXr16FQatT4zQXt4mXMe75oZFQZMqk8h4/
 o3K54gZ6Wp/HtR3lAJh5MIlIAO2wHBUAy4dqzYivTgtL2V0sx5L1sTIAj9m7UwRDzfqpCUPCr+4
 JjmISf0doi4eQNBWJMTN5I/QtrymdqVN6UoBIJJcP6icSs9pSMaVq/ZdrtOMVBIxqVZcjg1ZDeH
 GFNBkY4IGOK7FjZJItQ==
X-Authority-Analysis: v=2.4 cv=TL11jVla c=1 sm=1 tr=0 ts=6a5a3ffa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LMDkYzAWLNq1XrXRUzQA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170150

Hi Bartosz,

On Fri, Jul 17, 2026 at 11:29=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Thu, 16 Jul 2026 18:18:20 +0200, Loic Poulain
> <loic.poulain@oss.qualcomm.com> said:
> > On some boards a power sequencing target has no host-controllable enabl=
e
> > for its function, for instance when the enable line is not wired up to =
a
> > GPIO and is hardwired to an always-on level. The pcie-m2 "uart" target =
is
> > one such example: when the M.2 connector does not route the W_DISABLE2#
> > signal to a host GPIO, its enable/disable are no-ops and the consumer
> > cannot gate the Bluetooth function at all or exclusively.
> >
> > Add a generic pwrseq_is_controllable() helper. It reports whether the
> > target's final unit provides a host-controllable dedicated power actuat=
or.
> > The target can implement a new optional is_controllable() callback,
> > reporting whether that actuator is effective on this target (for exampl=
e
> > depending on GPIO presence). If the target does not provide the callbac=
k,
> > it is assumed to be controllable.
> >
> > Note this only describes the target's own enable actuator. It does not
> > imply that a power-off reaches an electrical OFF state, since a target =
may
> > have multiple consumers. It also does not mean that power is uncontroll=
ed
> > for the target's dependencies: those may still be gated on their own. A=
nd
> > it does not restrict consumers from calling pwrseq_power_off() either,
> > which remains valid to drop this consumer's vote on the (possibly share=
d)
> > resources and dependencies of the target.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
>
> Thanks, this looks good to me now. This series is a bit all over the plac=
e,
> what is the merge strategy?

Since the entire series ultimately depends/touch on the pwrseq topic,
the simplest approach may be to take it all through your pwrseq
branch, with the possible exception of the DTS patches (through
Bjorn)?

Regards,
Loic
