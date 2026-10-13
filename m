Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F603AF667
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791879687; cv=pass; b=DhGj8zgwdS7/Fsi2agQrrH7UhuM8GIYBO9m4mQrGgNec8Lh4fwBPVyxX46c8HI+OjpTTtNsobJLl4pP7BmXKdMG5mGt5CKwBPZqGxiVTg5IP+vlqUR5iglI4UoeR4Me/K5Oh8Uv8TaxyxHrbR7rBGb8M0TJvKgACv5kp2gOBfMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791879687; c=relaxed/simple;
	bh=Nx1SjMixwkrle4y3U7Ab2IqOkuOdHGj1UhkIxBeqQFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hRaW7p387ba+QYZSg47qqzvGBz8nhWkTDwduvOoLa76UFjPbvxtfxTPPgLQg8+tgGLg+1CoMBV1esr+Rb4hcsiLu7qZU232iTsadnQKDOeFJtX2bAnt6IjhLbalxPUQulPsgeKM6fOH8r4MZU07nLpprVulG+ZY129wdb5ZUQK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJqhhety; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEGmre6K; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJqhhety";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEGmre6K"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8GQLL3054805
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c1PNbxNjxl3yMAPLNBXy8s1I6w1mnoqka0xQAK1gKCs=; b=gJqhhety9WqLgbhm
	DPZ5pkN9ePz0IasGDvLN7xivT0wGbJVPY+JcPy2W+WhjY6zWN1Y82ADafcAjCuY2
	uy+EmvSLU8BAXl80MLS6loNmUnCXQKBlwf5rmZqMLRY671j5TEst+YtQP1qwS5i8
	qMyWyGBSQYjbNAXm/3oiCiwy1de+ZlqjGl94XHIsP+D6vRQ2zx7x4xK6AcUUMwDe
	I7Vq0MP1HwbxcvmHy3j+s0yLAH22SXe/i83KaozBfk4zRsayTDgqveZZaHDoT5JS
	r2WD8zvrfv40NUSUjhYOvDRuRfIb1ilb0eUgJzF2z4vWXg3zOgkxViHFc3YewnLa
	+2l1FQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeu8dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:21:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cbacbb996so441461885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:21:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791879685; cv=none;
        d=google.com; s=arc-20260327;
        b=ftGFyifmSgIRIf0G5jmU/Dvh23OatKtbs4tvHym/8UqQYHWXL5T/fJxwLEgRqEAgRh
         B31GVwUooREAmKu26sTQfN64pdb91u5RDz0D0rH42F0VfYluMChracC6+0RX3bu0Y7Br
         TO0ghkGcAai2zER9KCKlXHVDzFaz8X1Rfr3+E6/ex7eukjIlC8XMbWlN7pR3P4qyR4ai
         oy0jZs40CSp3ztuIYc62a1lYAEgRaqAe7SM/jIbGwrpNLuWrsegH9UoSQIkyi/neyjUs
         AmpuuFX7+u1RSVTUyVRW7v9GhmFFrbDZi/4Hr3m7cOC0HlqhmdN+8H6ktBoXHp5UQDV/
         GHPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c1PNbxNjxl3yMAPLNBXy8s1I6w1mnoqka0xQAK1gKCs=;
        fh=NJtln2Xu/QNX7spzzl3ClSIrPVNnCWX7kmefNnPkORg=;
        b=i+iAArgdiRzB+/zh4jxavax9xS4gKdAp9978xcsCPpoFx41zWjqea51CKBZeawNB3l
         H8ELewASmrqM1bcmDCg5wXjEUep5cU8NH2d8d7tWfWx/pAPnF76To8EDJ7mD0K0ewEz9
         bBsSM4vjvemLbvGCnL/nsO1wMWS4GpmOgjPQ1HojKqYNa5STRXx9bgEJ42v1vAzXab9C
         R8kSzrh85r/qvtp+iEZyseVJGFL0rvLIMZguZVCYe16hpWKUA8f0pwSSWlns5B2ttXhs
         pxsXBeCfzE51U3jaAciNuwwwC9F1kLORjK5Y6X49zeYCtIrWHm4Ve44/PxfrAK7rva4V
         7ODA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791879685; x=1792484485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c1PNbxNjxl3yMAPLNBXy8s1I6w1mnoqka0xQAK1gKCs=;
        b=QEGmre6K1AkI91UXE6JocG1heQf9zW2nTZQwD+IpmzfKyp6JRwNKqJawK91ah+6B3M
         lY5Np1965Pp+Ck6Ew0dwMGZqz/KKJd1959W2C89UFGebmlELS8y5bUmNVgpQaQDZt+u6
         E2Xl1qPgPs3hWw/fSt4rVa+Kq0ZmeZEoljWq/t34ctPGPHXtvuGAfI42uZEPJOx9FSC8
         pGMOkjYFZ1SxuVcl9h5LW5RvXKc6Kf4xUmCCk1Rv5ef4/wkDcIsJMcqa7ai70/HHbTSg
         2gKWT7vMVNqu0S9RSzWihqVBAUii/PPFeo/gkZ9FpbhpcgtkQni5ojhoS4C+C5Xi8TmE
         Yp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791879685; x=1792484485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1PNbxNjxl3yMAPLNBXy8s1I6w1mnoqka0xQAK1gKCs=;
        b=aHMCujiqVtNjwtSbgz+hbG6vjz1loT9RM6J78XmJn3S1Q0UH5X/kghW8BLhFNAl1x7
         pmreVzGHi7TKCXfdGZBdrbvKSRboUgAJ7qZACCgBiHFMf5Uj3N7uKxRvg0RQ/bp9hvUs
         a7efnjutsiVxUTRIVdlh7XUFAN6xct0c2pCWNRUU8pXypEDkDd4NZFM6Zxe609UVBktq
         1O3Tm2k/Zd+zRvMqOIDYaScdiijoPydrWjPEruCRSVYuEowBYZBxvR6Uifl/EItxXphR
         xzJU3jOX48U1Ssgqu3Mgh9O9qNMlqWSCgH7JnRQmIK5V+AKpAQEbxsqBsv8QFdQVWegh
         2rlw==
X-Forwarded-Encrypted: i=1; AKwUvBzYZkcz16GnE7Q/h5GVNGOVPZ/LPngdmCpbaj+PssuMBdqeqo3ib9KJGEDbNN18lQEwmJZ6rhPcHXmnR8tF@vger.kernel.org
X-Gm-Message-State: AFq9FYKjjUFztWRabJ4npDVU8L1HPjh1taYBRJeQr4kjdg+r2oqxFWzG
	ZfNmk5mTC/Q/Jp+AszL0ERLQd8xjdqNh2ED09vvnJaE6exJRvCwWHSkjobza0lgAmcX6yQBPOtD
	+rv0wQ0QpLfZOx/9BFJd1htAlmxmXEFeao6V2ro+WzDp9GuB6Ppt6uPRcZOHeeOxzVhVZszXMBA
	T2/KeCZkByJVDurkQjFeQZsAFBnxyDgSF5v+4w2QomVIKQ+H2FnlfhNg==
X-Gm-Gg: AYBFou3JHR/UzI4t4cKcosWAVPVeRboHGDTBJubsws6PwezFW3slXLGakKwrMr5Avd1
	jCHX6AWU5XSKW5+opYlKufkOZ9UluXvh603uClHrthzXJeDArmBMoQv1hp9qZrDyCRqD+0KVUC0
	53cq+9T/8qV5NxwhVvwn0uzgktHqZF7uoK/+wZMAALfvl1qEQxdem7xlisq6vNVdpSylbsvLtKX
	r2Q8IzbftIjgJLquqjzMeRRZG7H7z1Wrs9TcBaCyszMgjmkAT5l6A28FivSNHJoH8kqNnjWn85L
	FTuNKOH13J2Tg8uv07mK+fy4/4Dw
X-Received: by 2002:a05:620a:6e87:20b0:93e:c5eb:2230 with SMTP id af79cd13be357-93ec5eb2796mr1173391385a.33.1791879684439;
        Tue, 13 Oct 2026 01:21:24 -0700 (PDT)
X-Received: by 2002:a05:620a:6e87:20b0:93e:c5eb:2230 with SMTP id
 af79cd13be357-93ec5eb2796mr1173389185a.33.1791879683843; Tue, 13 Oct 2026
 01:21:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
 <20261004-cci-imp-v1-3-227d12cb4829@oss.qualcomm.com> <717d9cb2-d7e5-423b-9d0e-fad307385474@oss.qualcomm.com>
In-Reply-To: <717d9cb2-d7e5-423b-9d0e-fad307385474@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:21:12 +0200
X-Gm-Features: AclHuK8BcryeFwF7_mfVGnZ02cWvL43_LCZ_Rm7JvQqSScTUu5Q5fBxBQFd8Gt0
Message-ID: <CAFEp6-20=Hkb9ZsubULMg9YYVzEc11Y37g90Gu1mxpvOwqJB9g@mail.gmail.com>
Subject: Re: [PATCH 3/5] i2c: qcom-cci: Detect capabilities from
 CCI_HW_VERSION at runtime
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iNNmiqmw8J3AIoYFLdX1XZqx_yuULOoU
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6acdea05 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=GZDsnYW4LkaCH1OrQOQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzMyBTYWx0ZWRfX/P5uw/pI/fUx
 8P5yL3cyV8n8M2UMXXgnP++r8q7dxPHXYTMdHWg85lEXCBErNnuf5Tp7ZshMvE5ODxbEw6dgBUR
 tK/bArQVwouCzfFsm9wthGhHUmYvvjM=
X-Proofpoint-ORIG-GUID: iNNmiqmw8J3AIoYFLdX1XZqx_yuULOoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzMyBTYWx0ZWRfX2LtUGuMDEijw
 6nusTaSrOmlCjg6YmmnCktdk/grjmRQLOO+3FJ+7HS/VzQlcaL+ereDoDI38bRDxZImTOBVs3+v
 HkmDxBMKYW8RY+Z4/nnf51MTY+D0idimqQv6EwyiDb6gJxEkpBiv45AEqGY1c+JNls7IYtWY2bB
 gu9uah5+YyIVvFC05XpVX76zeBtI9kaCY9eQJ9qsvTApuVyfhCHBcy6/6MMaJHzaXrZpgks+JX+
 FRkLcb/jeQ9hx/rX9SOzvi7gVjAWxEZFS7O2ggSftKyPhR87YMi10OlVxDEjxSqpzdVGNI0J/YF
 mSln5GDaBOSTU9l9D4Wha9AJUxIREHfyx2HvmdMmDjQogtfiAvwO0H5BVccqsut7ehWM72byzMg
 laC7SHGW3dVvN2Y8ikHQTZkvN44/H7PMf4ELGOucueAw2Il9Z1M0tB9RumF7MpeFecV5g76GUYS
 WeSQ9WKcxvX5eqQeDZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130033

On Mon, Oct 12, 2026 at 3:58=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 10/4/26 9:09 PM, Loic Poulain wrote:
> > In theory, every SoC integrating a CCI revision that differs from
> > an existing one should introduce a dedicated compatible string.
>
> [...]
>
> > diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c=
-qcom-cci.c
> > index 099da0069251681cc52e351fb656bd73e78a96c9..c0b39d419e296454a083d38=
ce302940875b8ad2b 100644
> > --- a/drivers/i2c/busses/i2c-qcom-cci.c
> > +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> > @@ -14,6 +14,10 @@
> >  #include <linux/pm_opp.h>
> >
> >  #define CCI_HW_VERSION                               0x0
> > +#define CCI_HW_VERSION_MAJOR(val)            (((val) >> 28) & 0xf)
> > +#define CCI_HW_VERSION_MINOR(val)            (((val) >> 16) & 0xfff)
> > +#define CCI_HW_VERSION_STEP(val)             ((val) & 0xffff)
>
> GENMASK/FIELD_GET(), please
>
> [...]
>
> >  static const struct of_device_id cci_dt_match[] =3D {
> > -     { .compatible =3D "qcom,msm8226-cci", .data =3D &cci_v1_data},
> > -     { .compatible =3D "qcom,msm8953-cci", .data =3D &cci_v2_data},
> > -     { .compatible =3D "qcom,msm8974-cci", .data =3D &cci_v1_5_data},
> > -     { .compatible =3D "qcom,msm8996-cci", .data =3D &cci_v2_data},
> > +     { .compatible =3D "qcom,msm8226-cci", .data =3D (void *)1 },
> > +     { .compatible =3D "qcom,msm8953-cci", .data =3D (void *)NUM_MASTE=
RS },
> > +     { .compatible =3D "qcom,msm8974-cci", .data =3D (void *)NUM_MASTE=
RS },
> > +     { .compatible =3D "qcom,msm8996-cci", .data =3D (void *)NUM_MASTE=
RS },
> >
> >
> >       /*
> >        * Legacy compatibles kept for backwards compatibility.
> >        * Do not add any new ones unless they introduce a new config
> >        */
> > -     { .compatible =3D "qcom,msm8916-cci", .data =3D &cci_v1_data},
> > -     { .compatible =3D "qcom,sdm845-cci", .data =3D &cci_v2_data},
> > -     { .compatible =3D "qcom,sm8250-cci", .data =3D &cci_v2_data},
> > -     { .compatible =3D "qcom,sm8450-cci", .data =3D &cci_v2_data},
> > +     { .compatible =3D "qcom,msm8916-cci", .data =3D (void *)1 },
> > +     { .compatible =3D "qcom,sdm845-cci", .data =3D (void *)NUM_MASTER=
S },
> > +     { .compatible =3D "qcom,sm8250-cci", .data =3D (void *)NUM_MASTER=
S },
> > +     { .compatible =3D "qcom,sm8450-cci", .data =3D (void *)NUM_MASTER=
S },
>
> This looks a little sloppy - can we infer the number of masters at
> runtime somehow?

Yes, we can either add a small msm8916-specific condition in the probe
path, or derive the number of masters dynamically from the number of
master subnodes present in the Device Tree.

Regards,
Loic
