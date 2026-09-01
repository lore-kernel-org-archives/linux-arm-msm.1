Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C89748097B
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280283; cv=pass; b=PVNxKXtCDH+pA5i6/EaNLHuqqDsc6YcRRDROm6jVIvfvQU6qVggB14SK7iSusurfseHp1tSZbuRry9UCrOQMnvRUxAl80YRmZ84lnQac4u7qHG1zNIB4fPUysOBHBWhW7J/MOIZ5dTvB+40yUKQq35vFke2XbQBAP/aDWltV5OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280283; c=relaxed/simple;
	bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYDOAqguqwUYcYwOfldOKdUDYSXU68yISfZHfg9ogQBnsZpSuLhIFV1c7kp93U9t5+Edwp5B6nz18UqLjM7bdx61tJ1U8Ni5FBB4Y85YgRvjoKD7J3fF0fi6cJSrjANzhqvpt7+8RJ6WsvG5GitaLjRv5kGpjinwfHOP9CB3t4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C24xkZOB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cCeVWJqJ; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C24xkZOB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cCeVWJqJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YV12145854
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 16:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=; b=C24xkZOBMHghNCgp
	nyLxCOhToHipUH1POz509VZqjpVdRE55bwYNcA+stjyTmewceb/Ue8tJ2MHHFet4
	NSQoaOEZiufK0e0j+eUt3MG7B5U72niCsVrQdUaffrj/G2S47sSZPm+9nh4iR72C
	Kc9hhK+GvWXvpmuY+dfHffN56dLMkW67DRnMx3/wRPws4mZexqIMXD1tfh45j+G1
	kFg//DMHpAdwnr8y1RADR4UFNcfsg5T+cJibI2rrT49f1opI3DnFSkn++bMs3mhv
	8CqDT9Mmurfa/d+f2WbsjcbHXOc1VK4pA0IVSVt8BuCSs5wAiIWlRDaT2F2bVVVr
	XGWg/w==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8uv4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 16:31:21 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66e509682ccso74773d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 09:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280280; cv=none;
        d=google.com; s=arc-20260327;
        b=qJw6Qchqokc7k6c/iKXV4OA9se3fPG4vwMoYVjSf4PWXOyy7p8QGnZt1hL27fD30vh
         u7lVE2yvY9deC1HsSC0+t6/W87XN/K3MfwHTZyZHhI8j+TnSGl3t7cZ8HiGitx3ByXHJ
         qx8mR5NvrGoiu27ByuBmJCDDhUX2Q9xs/1okevSsEtG8DCRBs/pFykVw+ZqroidkpmcQ
         otkA5B+0+8xgHdZdFVpZuOlgED8pbRDuPMSH2FSOiwZ4jDUEGBKcGqBVaj9fqiMwjepv
         szC0d9oVlmLmlT50/8RudHNETAFjczGStID76z+dAcF6kQB8iKeFd07v37hY4mJaegLZ
         ryZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        fh=cO1/qOkzMWn4phSL0EnBYUlQFsrGm9BytEMvxx5evYQ=;
        b=YYQR4LjHhPkjmDasyQezWTTnJ+F8/9Law3TtT1Ekzo4sV6lUuYC5NlrkH2rszhg3y6
         qtUcy++ejrX5K55yjm8sojLexOCgbb43cpQO0bymFqysP98FboWR86XmKdrjAeU8pJyf
         qGHKSzcuQzZyF3FF+J0iIs+a7+iz/iXu7kCr9WvaQ3/mpAzPLiQhyQu+53nreE67lhG0
         a5wPJnWQFPS+xzF/3jEcLROXKdP4p7jw2YwKz+28+1vZgG/1QXPU+bJcJYB/y/OnBqAt
         x7Wvz7VrZxtegvCCjSzxzy02i6wzFgFyDej4DnKTEUStWETJCInoN+w/BlcEH8n0Rusu
         hMag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788280280; x=1788885080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        b=cCeVWJqJ3TOh6BkJXvLb2exe5SI+1/q6N7yVGwukBTE9080ojXauK+VeLnMeQISI7z
         weYWuYkFMeRqMUXIjrEEYfVBeEbZg/SYs+knL2xDyRCfjmEPGQ4zgDd1jjzqUpFoIt8h
         ehTgZ2udZGIkTcDmBt2Bqu/+Z/BHl9nTXG8lvr98Rp8iTB/OOg93YoVFKFgNU6JD4KJX
         4/vOHVuPNaq3VTsF/dJRxQJf2nhSc1w+Qef1tqHjUkgO89NOY9YDCPNWdvTi/jirJZhU
         8o1pViX4kybaQYcnHzFxnY8w/Hrvfh11EZs/z7ZprRvT5xlrUPIKt5NEp+dG3EOkVLxc
         Ihow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280280; x=1788885080;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XW9CfwEeNR2HxevHoBsTeDR+70qKBEmNFf0UXTkk2bU=;
        b=HZJO/OHp+GCOFeKLMT5qFS5OcS6SATWj+TRxTmV3ciEoMgaKXbpcyjp/XVDy1ZJVjj
         o10SUec+CxriOC1z2rYpM0/ykTKZKibTtscAnxc6k6wDHPjqPVA371x7GdfHbyrbSovd
         //XUYmNU27dJx4boIGAgYB41KsblWIG4JNLEa+DY5dDA1UfUYx+ndEpjyE4nexYKfgFF
         OrEYNOT6tvZ3dkq6M8JLFEzC+UdDnfp5l5V7A0NPDsTkHCZuBtrhfwnLFZNg5Vcx1S5t
         LJ6A1RgvP2Sfw4X4GxCYHqLAPAImvjV0WqhMEB60GonDjb1QIRFmk2nnZ6wYCJpnIS6d
         CrpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxI4b2Q+uFOe9X1VU81Se3bkW4KvckY3i19BxlB2/NtaCUvMmOirdNbOIwbEuS0nBdH8YCABnvL9lnBnnIw@vger.kernel.org
X-Gm-Message-State: AFuF++kdXSeTwis3kjabf+wjoqNdObqScPOmvWe1kJYWjePYnutY/uVf
	Jy5Uw/fkHJ+3BEzs/+eH0CXX/dCFVQg+c+PiM6dmOWjNG/P8fhNdW9fguIVWWhoRXKWzdErnJvO
	f7wS0zXuAVXr9PztSSvC1DjZIa5KyVryq4rmPP432yhwpIoozpQ19P6ZJmdeHIJCq5uulSAjfaQ
	GNc0uF178BwVXsFzk7r64Y76EGxq++d1bV/aLRjUYp5r0=
X-Gm-Gg: AYBFou1p8/lu5D5hhdF7e/m8SDg7SGInfnpjLY6h+o7BzbuOOlcs3fxGog6b2iiM9Ko
	n2quFjD36aqF0OS/KsOXw0B7GSlr/QW0GtbZb2724m8HqfMHX3OPyLYYBS2QlR3NE8WSMdcrMGY
	sZP3mPXDdJ+98NF/imirbME9Ot7AhvM5WHu3bxUD+yLvS0b6qijy73lqcpfg==
X-Received: by 2002:a53:b111:0:b0:66c:ba49:1316 with SMTP id 956f58d0204a3-66f87458761mr2635208d50.10.1788280280245;
        Tue, 01 Sep 2026 09:31:20 -0700 (PDT)
X-Received: by 2002:a53:b111:0:b0:66c:ba49:1316 with SMTP id
 956f58d0204a3-66f87458761mr2635174d50.10.1788280279650; Tue, 01 Sep 2026
 09:31:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com> <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com> <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
 <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
In-Reply-To: <b7fd71fa-703d-4508-824d-a9816a1e7494@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 22:01:06 +0530
X-Gm-Features: AcwNN1Uh9bB4S11ithQu0Q4MNVjip4sbUP9vJMJ7eTGO8R3TYdzVDu8Xors9K5s
Message-ID: <CAC-tS8DO4Eph+obOU5jxwfX99gZ5Jat0PpD+CcpobJip9rGW2Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96fdd9 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=oDxv99porRbPmQQDQpgA:9
 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0NSBTYWx0ZWRfX2Rqo/NmHvIi6
 fvvDq2e+XxMx11fW07qQhQl4hUoMyAd+TYE37VU7ncaBzCIy4E2O3lgPp3PGA3XXReypIvKOL1i
 s3mQ44pi+p2ZG66wMnaeNfHQXxT1HvBwZ/TSpGSfF/d0A/Xcl64HsyFLClZ9/qd8GBA2Uy/NR4+
 OfpzqoSYpKcfe7eVPjQF0fEJEmjc9TXUmwWigITtNyP0CGp5Tu2+5b9GsT0He2KcLsuqgUbfeHQ
 53pMLQdr6tAb+Tg6sDiIHk2h87gQKzfbamzIMdJsRS1br1269Uuu8zbj9L36JA1ab9TnT6lWp/T
 bIGU6FLv160ux/Il89oDCDsmtqgSMFsSALn2wIsz25JcYodfQlJ2S8AmpcQp2c0pHJHItwkbzlV
 8jDVJxx0S8jhRqVji/plmqTY8JtgQqAyz9XXHmdC0G65t3j5Pl439HiIZBP9u986B7T/ryBO8Yo
 xgGMlW7+Y/x56ktm6kw==
X-Proofpoint-ORIG-GUID: k3Lzw23M1aaGXhzI7fQaOzurKZIezVNm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0NSBTYWx0ZWRfX19o7jcD9iDGA
 K/lOU7oxidTnXXahgbScZ979gBqDDodQTEP9vnpi3Tqp+TaNoQD2ClRE42jQsDrw9k5z3GBvE/A
 L9dCTK6W1nbSa0FDITVOnmvWdwtly3I=
X-Proofpoint-GUID: k3Lzw23M1aaGXhzI7fQaOzurKZIezVNm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010145

On Tue, Sep 1, 2026 at 8:26=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> On 01/09/2026 16:46, Harendra Gautam wrote:
> >>>> The DT binding filename and compatible string do not match (qcom,qai=
f-cpu.yaml vs qcom,shikra-qaif-cpu).
> >>>> Usually DT binding filenames are aligned with the compatible string =
for clarity.
> >>>> Is there a reason for the naming mismatch?
> >>> The filename reflects the controller; the compatible is
> >>> variant-specific. This follows the same convention as
> >>> qcom,lpass-cpu.yaml.
> >>>>
> >>
> >> There is no compatible for controller and the only top-level compatibl=
e
> >> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
> >>
> >> And I already asked about this in v1. Why does this have to be repeate=
d
> >> at v3?
> > The QAIF hardware IP is the same across platforms, only the board
> > integration details differ. The binding is meant to describe the IP
> > generically, with board-specific compatibles like qcom,shikra-qaif-cpu
>
> The binding does not describe the IP generically, because bindings are
> not generic.
>
> > used to distinguish variants. I had qcom,qaif-cpu as the generic
> > compatible in v2 but removed it in v3 as I was not clear about the
> > guideline. Could you please suggest the right approach for the
> > compatible and filename in this case?
>
> Same comment, literally as v1.
>
> Filename should match compatible, as in this case since it is single
> compatible, filename should be equal to the compatible. So first you
> determine what is your compatible and then you copy paste that string
> into the filename and $id path.
Understood. Thanks for feedback, The filename should be
qcom,shikra-qaif-cpu.yaml and the $id path should be updated to match.
I will fix this in the next version.
-Harendra
>
> Best regards,
> Krzysztof
