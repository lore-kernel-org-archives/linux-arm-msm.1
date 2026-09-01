Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DBA305667
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 10:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258658; cv=pass; b=KEkjKwYfpLhzqh6Us5V80SgD5kyXZN8j2HPy4MLbZ266diZk3YIhVVUys9qFIXoLrERI9xXwgT+Ue3a1nPGBkaRX+kJuu9JsmGC+Uv10MMI3HyXDGcz2c4YZ6XHrw0IQnPiz7dsm2znxQe/zx/goCfgJlbvL5KjSYb9F3QiyYOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258658; c=relaxed/simple;
	bh=lWFns13aUQVRLJ9/uaF4B2fLPnX4BZA6Ycqj2XWx6wY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/H8RuwORvav1CBjKah5w8GJ3YYfsYhLGKbLUBFc2b14FB+l3ZdCtwgqKAFe35qvxwF1Jl1axH8IfXFnX7yLhzIDSgKYQd/j/RMe7QygjUB+e68pY0GJEqDWhSnZdnlETZ4/U7q6gfM2Jc4k6+aNqX6M8kDfX1HQQuM+onzwpzQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L24pVZ/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JtHS8hE/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L24pVZ/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JtHS8hE/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJlT01713281
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 10:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=; b=L24pVZ/ZqR3UqxGK
	/67Ss2CEWxRkdLC3ayiyFTGUoXWpcWN4OwFx0jrQtRXWn1FW9W5QfwLgb8KTD0k9
	VXA3inANCmxJRdNG1TdFzjqDC2lkfvvladRHjVG4IrE+z65E9aAnsEQTGw71IFRt
	Cth5Kl1JLNSIKsmyJW5tOWNTFgYA2eaAG7rmiTDyTpYah40uhNhRnI9nNlIapDXx
	tgGkDMaYbMwGfILTDIdpdgjsacyyIgftl8+InQ7uxVvbYahckUBUSTutJog97nUF
	ICuTYp4BAjDzqlVCXHjSMsyWarzJJVoGX2cpKxi1M91rxA81h4lNdrgCFXIrEQUf
	kNHixg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxa1eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 10:30:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so6526992a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258654; cv=none;
        d=google.com; s=arc-20260327;
        b=gLREw4i8pfWHbqhab6kIvP1q++nBS4efra+V3MYm7VnGP46ufUEuzfd+BHsVaYy9WL
         wvDO5H7+qmsiKuFN6FDdr8tN2bn1pHOguMDzusmrzli5yygU0lOrOAGjxtSuyOyhmaLu
         8dnITpxIyjW4BEww3Ozj5rQRakIpnoV3XcHjM7KQVxP4sZJwYH+scDRFKLcXPlD5gkZh
         EtZaj6E8m8SIx0LepE9mlG5DVglTiVg3OwFY+r7urvhiW1GxG5Oov/JKzfD21XtDOA9S
         MJTxbYPGqFJnHYx9kXwHHVQ3x/MZozTKhhWEJCM/v07QLk76a8DbUwhZuGvvAPlkNzgQ
         kVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        fh=CdSTosTGFe11LTbcnyeZckb9gMplEmkKAqmkWfBtjug=;
        b=imwYbrv8ZV9txWVV3Pu15DQOsSBbAsJBadJvY7dfpvQOlKxNdB8HhhGDCzjxXVMw7M
         b51T120IByZ0ldVeRulO6H5OYhAL9d93Uc1a/uxzJ+XGw6OClap5STQerdaqGy7Q0FiZ
         Q4+vpybc1VAmMZwA0RNHEpL7dTbf60+xxao3lk4RBa6v8xyimuIEdW5Pz8sMVhtDcwHy
         NmiX11zZhNi3B2gXKdUzkeNIZOdALEDGDOGiMvqKFW087sudB1s/iesVu5L39zbVOA67
         KiGzOEMCRqC5yAQlzH4BbNPNZQHWuzmg3Txqc8nvOZwrUcdbATAbamsLQqOWe4gdE2l8
         95fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258654; x=1788863454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=JtHS8hE/3pslv6128ea48f3WQ7Nd3FiXSsXDYcy2WqnqUxjK651VYiOeQE594/us8P
         Ml1OLIOZFFYiyFcLs6IlwIT1PFYj7I2C3UsgiqswWOMRlC06ANUSbNwgEllz45OQa2c7
         LW+xlRuFZVwmuL6GaoDNzqINWpugScm8Wx4tZ5H7M/UhyCwRu7ezC7pdDWsbHZkG5Iq5
         IN72FW5bBT95B2cpYGMKm5QStpb8bg38SUU1SL6KpmFmt5sFFNlwdMoyCyKpBSSNGPYx
         JhaL8D9K3Qv5JGhAqep2BaX3Ba0GK50ijiFF9w2bcQ6zj+tRlr1Man7b0nE/hwyMxj0+
         wubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258654; x=1788863454;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sowwmpfHMA8ttuNbDz0xs7pKP45hjGOLuw27e0GDTnM=;
        b=PVncYk8EEoaA6VLme09wNQ6/zw+DxrD2OMnIhM9id2egeCmuLqpk2R6c4hWvcFqxIT
         sYiYYchOpxl70ITmTCpeCePuu8XaC9BHL3J0o6WJ91lJU+JcO/Ru+THWmkz+QUo28q9y
         6NiULRzIlG948ayQCJBX8kOmP/ovOKPMqOAVKeBJOOYbCMzWDE234vanIPyaTeRHP8TT
         cMsAXW+90+XmgDt4YENidavOsSvP3hGR6qXW5CbU84eVpeORV6W6qrak4YK67ThrPTfy
         +xdzW0SQorvhY33E/g5BlQwG52NFuVhOOyVZUHMmJGTx6XxFoCT+ifh8CwDKVOyjM8FS
         iX3w==
X-Forwarded-Encrypted: i=1; AKwUvBxMcjaP5UyWpgiiICSEtrRI9SN3xgw8T/smpNlbof67dyKPceK3iFnAnYO6iZlbRQfzWhe/xBC1INDLg3Io@vger.kernel.org
X-Gm-Message-State: AFuF++kcMSHRq5mJ15ZiooKU/GmQnKunLNYokkAgs70BDMhDoyROX1uP
	bnlEem6qcj4jeSZRA1FGcwMd1oURWLpEJ1zrXQZ9XzOj4Sg1eXkig4hrLHt52kR2MGpt9qnTPPy
	pmMsY6kdYPm87qJhBn1mJhCH+qwS1dtdZhmtsRWJcCWWIJEuQITm+F/g8IULDgfmZ2e6wNuR5HN
	bKclmzuJnhFW4c//ig0+5R9F0X9+dpREC+TYntcFjOTaU=
X-Gm-Gg: AYBFou0O7uYEfctbCppMOIiTnkxJylPlyDdM+Cvh3XU5udIi9Xr19JYTWMBgqUGPxir
	MbU/Db5vOoSvGOp4/8sD0GgFebkYrSu0X9FhXVFSD7I5twXQeVmwjBUx2LQ79PySqT23dBIP5bL
	/1wIz1Hb/7tGEruZMbA7Mqc5CIkHyAFQ3WJAWfrrnwY+SVv/7NzyWEW76JOw==
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id 98e67ed59e1d1-396d0ed8eb2mr48338156a91.9.1788258654310;
        Tue, 01 Sep 2026 03:30:54 -0700 (PDT)
X-Received: by 2002:a17:90b:388d:b0:38f:5869:387b with SMTP id
 98e67ed59e1d1-396d0ed8eb2mr48338075a91.9.1788258653663; Tue, 01 Sep 2026
 03:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <CAPx+jO9QE_KG8BbfnMLTebDpGDj7OSpPDtgc9uTBGZCDJeLu_w@mail.gmail.com>
 <CAMRc=Mezpj4A7o00C9hhs97kdA5Q+FZKTLRbDM+fR8qr0xCCqw@mail.gmail.com>
 <20260827125906.GJ770273@google.com> <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
In-Reply-To: <CAMRc=MduBgkP4K3yabbDbZicWyb9WWqmF=yUqo+WHocE6hpiLQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 12:30:42 +0200
X-Gm-Features: AcwNN1UeB9u2F8V9KZ-ekpacU9KYz87Vz22k3R4eoK1r51ZtRDyRbVXuvUd2fmo
Message-ID: <CAPx+jO8XTr-C6gPRWA2t4TVCTdRQ8oquhrfv7vMmC1oV_DpcZA@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: gkC-j5ZVdrvpV1OR_oOX8YPdIkRrEmV5
X-Proofpoint-ORIG-GUID: gkC-j5ZVdrvpV1OR_oOX8YPdIkRrEmV5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfXxfG/vVtIsgUl
 nTg0mvJ96TVILZnZsQAVbf2fVNnUec7ycSQ7J9vXsDlF9zXdn6JWLBk6GfatJrw6Afb0VFDHSXT
 x7mdfS0MBKacnx0O9UgTTg8nmX4Ep1s=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96a95f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vprddorpQwRN7yjes_cA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfXzbQEmypNcpGd
 t7mNaX/E/XDD4/zrAU9Tr1ykzH43scgMI0NjGLuuOleAn/mWy6kCNm06Jm551+Hi4VmLXLNjN1t
 Eo7rgfxYDEYt1lt80K7UIzAOzm+re15cMHNmXqrNMjZHouOCaHKaMwgRR/QkTo+wkKRchEeDRS4
 XMYH0jes4K+PSxG00gn2QgCKDFFsTjp68PcKaINbM8pSv/5U09/F5psOZimMbci31Y4D23B9Pn8
 iZShl2+x6LG+sgBiRCLxpRqq96BCAgpin5LGAMCMf6L6LyfB+nWPKiB3wIniQkN3exf8XXppa0n
 r2qUhMEVRLtc3BmIav+yzhKOKN3hGgrXEhGsjQtHr0zoAx0OFMruPeNt4TgPlL/gET0+Xoh7im3
 2NIbyUOAXB9no2BIawmMm0GxI1gi2s64aaS+QGXs9B4BeZn0xfi2LryM58Y+yu/JulgLFAx5m39
 i7oIjNYRcbjVYi3Tk4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010091

On Tue, Sep 1, 2026 at 10:12=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 27 Aug 2026 14:59:06 +0200, Lee Jones <lee@kernel.org> said:
> > On Wed, 26 Aug 2026, Bartosz Golaszewski wrote:
> >
> >> On Fri, 21 Aug 2026 14:59:49 +0200, Ulf Hansson
> >> <ulf.hansson@oss.qualcomm.com> said:
> >> > On Mon, Aug 3, 2026 at 11:45=E2=80=AFAM Shivendra Pratap
> >> > <shivendra.pratap@oss.qualcomm.com> wrote:
> >> >>
> >> >> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> >> >> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> >> >> directly to the same PSCI node "arm,psci-1.0". Additional consumers=
, if
> >> >> introduced, would also need to bind in the same way, leading to sev=
eral
> >> >> drivers attached to a single device node.
> >> >>
> >> >> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and regist=
ers
> >> >> PSCI child cells. As the first user, register cpuidle-psci-domain a=
s a
> >> >> child cell.
> >> >
> >> > I don't think PSCI should be modeled as an MFD device with childrens=
.
> >> >
> >> > Instead, this looks rather like a better fit for the auxiliary
> >> > bus/driver. Please consider using that instead.
> >> >
> >>
> >> Hi Uffe!
> >>
> >> Since I was the one to suggest MFD - would you mind providing more arg=
uments
> >> in favor of your preferred option?
> >>
> >> My reasoning for MFD was that it is indeed a device that provides mult=
iple
> >> functionalities, of which cpuidle is not really he main one even thoug=
h it's
> >> currently the only driver binding to this node.
> >>
> >> In any case, we'd need a "core" driver binding to the psci node and wi=
th
> >> multiple auxiliary devices with their own drivers, we'd end up reimple=
menting
> >> MFD.
> >
> > Ulf could be correct.
> >
> > MFD is usually reserved for real devices, whereas the aux is a little
> > more loose.  Please consider it as an option.
> >
>
> My point is: if you start registering auxiliary devices from a "core" pla=
tform
> driver based on real child OF nodes then you're basically re-implementing=
 MFD.
>
> At that point you're better off just using the existing MFD infrastructur=
e.

I think it's as Lee said. MFD is for real devices, while auxiliary is
more suited to split up functionality using multiple drivers.

Kind regards
Uffe
