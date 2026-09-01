Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7EB434407
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 15:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276965; cv=pass; b=G3uAkFGpFp4k9dLB0oHbjcYiUjZAONe5TRmaCiaZgD6ximXb+/nfqlNpOEnH61Hk05KYaZGfupRJ72T+y5iuHZLv08Q1Hq4Q3Z5k7Anlx5UesdmROVrS72f78Tyv11IvKRDg1R2rDaM9yeNI1H8d7lxaoJk71c/0kIcnJzGjmfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276965; c=relaxed/simple;
	bh=c2tUgg4wBDmD4/wcjlpaTarOSXX4ze+3IyNN+IvUeMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l1O+2IclTtTiPpL8nUk/m9QSF0Q1oXI4+JP+noiJ+B4C4S9R2fld7TGZ5tjMpHpVMcGVs17wn9nQzhuSBnmkkWrTU03wLevB7B/kuARujhPpFi+Db1I3QfU5TzRyDVt8+f2kpHxEs70Jc+Gb5HmCodtgedoQj26CLOLagr4GWaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1Z/ZsVc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zy0Gpp+r; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1Z/ZsVc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zy0Gpp+r"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YMP3495538
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 15:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=; b=o1Z/ZsVc8EwHXYoL
	N/X3jHclM9iGocpfX0fLEQm7rWjghERgVeEDRL2JdObPCQonTMvGo2VJNqRfmXz1
	zVmx0uD54G8lm6Kpbmlp26Ddp8whLa2aOM4/zdOUtSTw5GgDhdIMkXXCGajKUYe3
	YLp1WWYJOjx2XHEireOVzIBvS89PF/VIVXg3i7Ek3edaqx/BrGTxSnfuAABglWbn
	T9HxxiOv661pkDs9rfa55PMvrk4kljk258zvuHsylr8MDLwCw1JR+XT+L7oNQG7O
	JLNCR/EanM3qciuNT928O1/MN1b9RQZKyOegz59DaqtBhZhVUtVMdUCC7nEO836d
	x/2NmA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdy9ngr95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 15:36:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so1563396a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788276963; cv=none;
        d=google.com; s=arc-20260327;
        b=Dg/8xOj5heRpS4fxcg+Rjj+7MXgtFp5ViNDyMl7zhWa7DQRdUECIqcq5F2YWAJJe9o
         n6HnjE+Kd3RAZgJZcESA+g1eV9o8AQarUwhzP2BKvSgr/fhaFIOI7z0hJQIE0xhgsQ8y
         nAjR0VQHU9vMPiXzfQqsfzzAjwgyEbpeZvrGhcayamP4E5wOJeklJp04Mp2GG5p9l4Uu
         GrFVcouz1B8kXajnGF1uj1i17Dpcy+IFVPPO6+ats5LDZ56vstYgicNjDodkSA3BD81x
         8TnGhwt3pquSpO342T99LReE9c82SUZ5LAdwBkUp9CIUdZND3zHB4DHCDa1ikgU1oeTJ
         f6vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        fh=+vgm3jv7j0DcmkNtUC5NaoXdQdk9iGpgDvfI7eLvVs4=;
        b=byKXQ2D6aQpu2kETEctzUPthdEAni0xAqF3hMy9IaSD5k14iVzajs8XLqh411UId6Q
         lEYdEgiqwbmK035I1QUe7hOM9CFPoZFjMYqi0BmuK7HuBMjrMHX+6ZaiEn1BaIN8bS/0
         tcoll0UNBmX9yIJHkw5/40gPi44dCtwIxnXgtKQm8UMDkYWJe2fB7/RhsVOGDeVyaSOr
         oOau3+nwK6m+DdyUhhn6HAcK0tM12Ml8Cmvltth8lr0jkcUIWJj59Ks+8PzzqGnmi95E
         pEEV5ZczNr1H9WSAvK69IvJIQ/bKjB2AgPmAUc4p842ciPnlSCklYDTMZvcbGnPYrRHX
         r60g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788276963; x=1788881763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=Zy0Gpp+r4x7Ao+n22LT2+fxV2ToWveFfT//WUr6up15GO7qyDc1a/sRXMhSpZBnHrq
         sBEVhSHYPs7Pn/SQG1XCwMugL7cKD6m0BufJj/r0BlmgqLrOLuQsCI1EkUp6xx8jr+y8
         2Dj/yCA+52M/G4fr97LA8h9enyNPtKhGXQTHki6SosD5tOQytoIOTu5P0eoapavBJyjd
         2HH/aIWOiO9CrTw6+AGMWG70z1WodxtC0/bX6k1TpcH+GTg93HJrM1EheGUEROr76BAO
         ttcHwqxFVs9dkEq6ZKU54DgkWU4LTKE4Nbh53OHvrYGYiMMW7fp2kUXUxfh4ywojbqO2
         6Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276963; x=1788881763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4u/g4Jdpz5fo7H42LeN3bQZ/ypc7+I4ptu77t3pGsP0=;
        b=eC/f2mSczWgbCTuuMxuFvVi0bcVYliUzbMgeJpph0J0HDZpdhMZg+vy5w8dL1mEoiJ
         h8oWUdwzM1VqAxFGqOGZes0/cPxinQaXy2TfeYTXsUDwXUEZzU1baOaU0UlMtB/A9SRC
         lS6O0xCfrr5ZnXy43ozcShTu0+HjK+Vlw4BsGMu3EkjkK4TUfZ6vi25Ly/G/AXOJtNaY
         hXhlNAO8nQym5d5sx8Jw18uG8UyUJBNgmZhxSLR4+SIPpN7PZXFtDcEkIoDoevq70zAK
         toIMcRY+Dg3rzEibYuxvulLy0k2W5N5EkC0/Bj8U2nY3Q6QeYva4mFGJXAelsB3ezJoX
         blxg==
X-Forwarded-Encrypted: i=1; AKwUvBy125qKiDB6TAY41TpPyU2hWrLjORvTCmKpUUI0v0CZXLkAcpWWf31Dn5MMoYmk7CmQFwhK7oh0RAT2cDao@vger.kernel.org
X-Gm-Message-State: AFuF++krQQ9Kc+w4LGAGiBXOrT+MzoUfXAFL/tX/elVGEsfpDXyM2SsM
	Yp2AG7r8d8WIS9a1MrW8doy6zq5e8CQCl904KspnWCY77HI8QrHAG9iWituhaNh8xesNcCZAFnS
	yo+c0gxual6z/3p9stLODNGihkI1+3AXIuX3DEca/lc+YNM7CdQXSZ+ZRm2xUVPSBnnZcmgNIDU
	51nIZTnoje7EhuTDUeyqtIao0qXT2hvo+eI2GzTR1/VmQ=
X-Gm-Gg: AYBFou04JBwiokkGn/A5QABCOay7RM5yeptKEhHVC2PZMI0/Um3T+9BkjITYRjRNtq4
	oF5Zb0xBMQ8C6nKYMhbb1ODiZjFjxLSfgXHs5oHPbAjYVJuLORI0d1Do7Kx7kNnivxdrnX2lwol
	W7faWjgId1YbYd6JbmD3hCn5u5b4gHAJoXyJg4gIGDk+v69NQ3CY9rcVutsA==
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-396d0e7255bmr53079252a91.8.1788276963074;
        Tue, 01 Sep 2026 08:36:03 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8c:b0:38f:efed:5448 with SMTP id
 98e67ed59e1d1-396d0e7255bmr53079149a91.8.1788276962567; Tue, 01 Sep 2026
 08:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com> <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
In-Reply-To: <178822856270.1835959.15842744749902984423.b4-ty@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:35:50 +0200
X-Gm-Features: AcwNN1XR_ENRcLXIDuE31pwfkZ-t4Y_ZQM0rZSm5dxDSS2r51n9kmCfdHTv7uZI
Message-ID: <CAPx+jO9ijNO7R=oOXs+yd-LaNaVAPwF1Rhh-xVGr-s1K1Fuw6w@mail.gmail.com>
Subject: Re: (subset) [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfXwI3IZb33kMlT
 9x9WAXIc5rbQq5Z35sZzYC8SBU806n72Hh+gUp5qkSTdpqnR9JEKckI5J3ilRSuEGLClL4Qp8XM
 381Bw2N16QuKaySCnuejF5pIdb98H1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzNyBTYWx0ZWRfX1Ca3v8/9qpgA
 +Daw6aED8d1YfByYfp/Zjka7B1AMnajvLcNml8BCqT2V1+LBgYfg8FfrfroAYX1UKx5EmLHOkvR
 57h51JsZdSPAjoeRx4nkCXikMDq/LKpO9ZJIXJWZH74lueCflmDE151mEIPRxjyscfWFTBSkCvG
 gQJ6O3jnZN58HoVt5Dufy48YkMbLL3t6xnqTA/J846US679wH8F5qR30vh8uxBvmeFa30+cRMNl
 8i1ZFEIQDxxCM9yztYPt6VA7ah21+7SrDmjgX27IyLJUUQRM+Bjxuw/0NNvQpzkPVf8rNzN3Cyr
 59WyF5vfYneieVDvncf6GMva6kwwhkCZ2+PHpdnp36zvukLt1tvjlBAafLBQ98j3I5P98592ehq
 0rVGcy+rkLFBphm+C4uvV8PB3pUlJA7Fwa2WJ+L3yJEouF0UHYoXOuBdIUbhiWI2GoonPPtYK5q
 a3L+KjbZktq2UqISB+A==
X-Authority-Analysis: v=2.4 cv=e/02j6p/ c=1 sm=1 tr=0 ts=6a96f0e3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=elWi3GNyyhLokhY1Yp8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: FYFhol6X_RuKwMD57vj9kWwg3NXuus3p
X-Proofpoint-GUID: FYFhol6X_RuKwMD57vj9kWwg3NXuus3p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010137

On Tue, Sep 1, 2026 at 4:09=E2=80=AFAM Bjorn Andersson <andersson@kernel.or=
g> wrote:
>
>
> On Thu, 27 Aug 2026 23:21:03 +0530, Hardeep Sharma wrote:
> > This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> > IDP reference board.
> >
> > Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings =
up
> > the essential SoC infrastructure required to boot to a serial console:
> >
> >   - Global Clock Controller (GCC) and RPMh clock controller
> >   - RPMh power domains
> >   - Interconnect (NoC) provider
> >   - TLMM pin controller
> >   - PDC interrupt controller and SCM firmware interface
> >   - Devicetree for the SoC and the Kuno IDP board
> >
> > [...]
>
> Applied, thanks!
>
> [04/15] dt-bindings: clock: qcom,rpmhcc: Add Kuno RPMh clock controller
>         commit: e304e8919043712191462224ce9d40bb5f5a6bc1
> [05/15] clk: qcom: clk-rpmh: Add support for Kuno RPMh clocks
>         commit: 12918d595ac96b819b9c3ba0df4c6a4bf50c43a9
> [11/15] clk: qcom: Add Global Clock Controller driver for Kuno
>         commit: 7db06b5f624b583fa2206f98de8437819acada9b
>
> Best regards,
> --
> Bjorn Andersson <andersson@kernel.org>

Bjorn, looks like patch1 is ready for you to pick as well.

Kind regards
Uffe
