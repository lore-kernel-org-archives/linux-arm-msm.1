Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8443C1D73
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788506261; cv=pass; b=HejyvKKzdPvYQVQUQS0SG5jTmgo5UTJhhSyXXrYuMWMrO1ZWOAHoIJi1Jw9BLS55vFKpp0eZTpQp2pEUrJyqTNRQ1Xe6gtRjPOr1JWSVY4ICdgyWhFZtVsWmHVJfkVz2m4pTSDfnWfnM8ocig+6SVxjWrwkk6It160e8pzxHDHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788506261; c=relaxed/simple;
	bh=J8dsPnAWdboF1yFvJDLhBeE5gRfGXjP3682VM1Iqx2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QfYOFFVcb5y2bu94WJxnsQrttYPpAu5cIhUfaQBWltdM+/afKsrZWo2YnZPCUXhO+g6tHHWPkcJj7hhMV8KqXSEonrDU4PFzzPtiiAAIfM0nvhMMiyFsdCg5j4O6lbCCLZQ0pbR4zqqoHKd/Ale+FRfJzMbvfSO5llKDLkxOqpQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OI8FT8Wh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBU6TwfX; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OI8FT8Wh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBU6TwfX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68462JY42064742
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 07:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=; b=OI8FT8WhAfwVk+ZZ
	8T5wxyqpe708tolnXc/VTkesfR67qqX1vGQ9RxJyEyTCl2T5XFfW8RIeogaCL5Zt
	4E/omkikXWrxxm+RLQRXjGY0OlJQ2lKWJX0g7LtAZgVjohNaB92hYZsfdUHcte/P
	SBndiqT6076Ry6JMFdRQyA+2Yf7A2Xx9N0ugFAnnXxcUTJ91+wZlVx8as/ZggFZl
	TmagoMORfsZZj+pAc6bU0p25PSM7HrrM0tq/Hyx/iBXiNcsc5oY0K9+La/nYnu39
	XHaTGr8kOkiuMF9F3RftxWTB2ENwvtQAqCyEA0/kgNGd5Ouwb+M10AzzU4CyC56j
	k3HbZQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp2hb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 07:17:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso973499a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 00:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788506259; cv=none;
        d=google.com; s=arc-20260327;
        b=rWmJxsj9qQ45XuSBD2CUCvuzOmiDTmdPhKgx1QntCbDog/DtHNn4UwUS53QuYgFCgE
         NaVqpPRc/g/Oz+7ecJ4KVJMlo1dc7bTPclYFDac+0Axc5pZbyIiVWY+VdkzIkgaI3YdJ
         /9/++6TXNaarQtDxG8GhHlHa7kpWVXuuq0sR/M1jlUJgwfC4ES/6UpyDnGkKT03suO02
         A/vMxIsFJor7Bo4wDu5BbVpyUevrQfQ0EhANiWCv1zOfa3dXVWDsqHw1LJCo7TFz812C
         Lcpl5ReNb4KbJb7a56wtMqFOLSAbOY5nSi26O/H+qHV+eadJL4IZnXILYxprLqZ2XUP/
         fZnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        fh=CMQLuM/F3YP58Vt6hph+kQjR8rgZC1c3Puzu3IIeszo=;
        b=Fz72tG9tF7HzKyhefOIF64qdfkz9kvdPeta0CmuWbsv6516Yp/m3OrnjVAMiEDhcVj
         q/fgd3GHUOrGcZJjZD+l/avlBnkBpraAMMxHGNOccET72Z5ltMrqK96TRtD81kB65595
         2q5Rmy/6PhVyy+cA2CdhAFizTpE/fNh4i98A8FJaSCyM5RGq4KFGgfURK7J05t+W1lEL
         jhs0CrFSmzOHbH8GOkXZ/2Htx33tmIaQ+iwX4bzfzNBpO1Jml1XKJ2wKpfE5sCt505PR
         TNAJKdV5pmOA2PNutRoBAywuTgk9d3/Ujh66CtM2+CvnIMT3OCZty9Czci6EF8EykktN
         buXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788506259; x=1789111059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=RBU6TwfXHXEf0ViP1/vW8nLVlhvd5ncNWxGvYvaloSHaaUQ86p7AbM/HkFV/cIe/Zp
         5CdCAc3IfDHvXFvj/T21hFdpkDDCjUIdL7nQXguS19kokTgxZuSdKKvHZTb4fAMPGRab
         4fRF9COHX8Q0l2UY2N52d4YJGPbJ42csIOFT0mKCFDMGD4pfX6m+3vuQJT2tzZCZiv4j
         /Av5uJgUmvJ5fppY4W12hTJYkYovF5tmOY6MmG+LWDO320zwJqOOP3vtZVNZ40Eu5S0b
         NYCiibzxZGT/2l7QxyTus6R//8GqL7/8K/NAEcp9vcNi8bMbdo4gcAs/1XXpdHkKUDEb
         GcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788506259; x=1789111059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LB6s0B651lSSZ12Sdfk1hENNUEaAaUZ9od/XOsIo4uY=;
        b=R8CuCuvrRUONLFXi+zepjXwsmSYLycx8IogbzQ/FBY82/Zv+h+jXBcOz92GQDr2CEA
         90oROI7OLbSbWN0v9qNOtTtXAR6ljCnSzDZUSGdcq07aC72M1Hsk8Xuql4d6hfluz6r5
         fX2bKIVhaGsMgTsDFzot+6cwCQ8UXKC2XEWrlx/Xoj++Hr6ixR6Wdr2hBh6XKlAFhKR5
         bxAXdZBfNV9AODzOSRMAmkYwyty1J7gfjz/CMVmPUEdGv4xz6BxNEsqLJBNJiYXOb6I0
         I0AGyy8EPDbx6N8i+CwvmkVHCMWiMuXPF6dNusizVnnEmtQIFGI9feAnbWDLngVVcU4d
         l7ow==
X-Forwarded-Encrypted: i=1; AKwUvBzBNvKVSImIvkoEtDP5lSoLtE4IYtoI3TyWOSkyE2NjBTkmREwSxrgnI6NcAQ4RS19Sa8dAMR67ot/XN1xw@vger.kernel.org
X-Gm-Message-State: AFuF++n2L6TUStvmn3E1UtrZx+JgjUZNWgv6pkmiTqz2T3OGkaOpScu6
	afwvbt+sJjlRm5nYf+9uu3W2/6zseMNLMoI6YTMV2luQHl9wDPsZXZX30j1rq47zK97OscLKfcw
	rn8YS1fjdIEv1kuZQT7qWl2uI/njXgNIn1s6n1sYwMwCFlkQc4ApYohSrMrqXLO0NLQpx9i4tTA
	XzGpRogI91Yk9uh1DjaJQVPBxetXcJ8L+Ppqi0dxuHNWg=
X-Gm-Gg: AYBFou0c1gBi/9cgLw6F2U9XT6/Y9nzlqd0hfKvuY/EueYqu7DXJtXA419FSkVLmioH
	gXpiF03+D+WretXqjCiNqn5AKX5hukxCX+2zyIqVGmOUMSBqawFMvbTTYj4ATTGk9NOotfBKXyA
	aK5iPc/RNAIstanWhA4e1bWhzB26fJfMJf10r0vtk8pxECpEbRCuBih3ihQQ==
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id adf61e73a8af0-3da39878551mr5927938637.0.1788506258732;
        Fri, 04 Sep 2026 00:17:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7290:b0:3cd:9f99:3381 with SMTP id
 adf61e73a8af0-3da39878551mr5927876637.0.1788506258295; Fri, 04 Sep 2026
 00:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260903160401.GV2133376@google.com>
In-Reply-To: <20260903160401.GV2133376@google.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 09:17:25 +0200
X-Gm-Features: AcwNN1XLgC_UnHcC1VgAAx4Zjez2ZZ2qUdiBHVeX_BYEXGU9Ghy4hb4yt4Luazs
Message-ID: <CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_eHt++A@mail.gmail.com>
Subject: Re: [PATCH v24 00/12] Implement PSCI reboot mode driver for PSCI resets
To: Lee Jones <lee@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: dIPhBW1Ut5mH3W0o3UD_uU54FDjcQQ6p
X-Proofpoint-GUID: dIPhBW1Ut5mH3W0o3UD_uU54FDjcQQ6p
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9a7093 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=RfyTg-q-OfOJAL476ygA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfX8AVxIbUSygkV
 oIlAmmOuNZhNK0oKgMLySs3tvwAbgVPLjXdPsTP5ZlnEPuQmk8Kryhi6zB1AhTg2E9nWUj3XNfB
 FArQ0aRAZfxCOFkvNAtcg2ViKdE8r6QmmM2c/P7tTcT+RBlcNbHicbZwGTtsN+0V/ZQpDjam8e/
 fXzjzKyTTVx527LxISHwI0wsqdgr8PblpaaD2BTZrbsRGJnUnzPFM8sgj5wX11GFJ+K08pJdKYq
 FGxwlpFyDjyiXN7uvK62vFDSy0aPHNM0eRI8HsKzI56Xq0rGOA+z3ehSRd+nrmdkJd2t3jW28Jz
 tetqW11PQkYIZTdIn1qbiaLG3g/a2eiry8JxlsahRx322yXtP6oWnw4+2O40+snXc9CjrW5kfNJ
 EFoxtlosB+wgaSN+Ue2seX3TJpcmd4ogCyePXsla0y0C4rfoPo0NOcMPT+igxxmG/beWIaLHrnR
 7llrMEQMbZDPP6EOiog==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2NiBTYWx0ZWRfXy1oTutm76s5s
 OiXvxcHZ4yia5QxO+I0QUFj3sqpw7aBmTYZLI4tZnCO+FpxpyqxZPbv/lQ/M3ldg8GS+Tgti0lJ
 BvTG8hz5Y/6m24aol7dGI1zCOvAgPxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040066

On Thu, Sep 3, 2026 at 6:04=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>
> > Userspace should be able to initiate device reboots using the various
> > PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> > patch series introduces psci-reboot-mode driver that will induce
> > command-based resets to psci driver for executing the device reset.
>
> The more I read through this submission, the more convinced I get that
> it does not belong in MFD.  This is a potentially nice "architectural
> workaround" if it a) didn't break some of MFD's fundamental "real
> devices only" rules, of which cpuidle and reboot-mode certainly are not
> and b) didn't require a massive expansion of what the MFD core is
> designed to do.  I am more that a little uncomfortable with the 150
> lines being added to MFD core support this workaround.
>
> My best suggestion so far would be to base these changes inside
> drivers/firmware/psci and use the aux bus to communicate with the
> various components.

We had some off list discussions about this as well and it seems like
we are in agreement. What you are suggesting makes perfect sense to
me.

Kind regards
Uffe
