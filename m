Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741A13D3305
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411855; cv=pass; b=Y0quJ6kLOojlAYDM1savED03dSIXL0C4I3q9M5misi34/prQ8Po6FZFSyVwOEcWxUtl3bIXA5ZLYEaz7EqquItP8f8zpan2mngsONXro3y85U1qWDmW6kJllEAmLfvaO58QX9+WsX2f6Y9u/uyAODX7khp2ZLQ5qMDP9bBiQAFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411855; c=relaxed/simple;
	bh=ev2/weVx6xMlQgDmYd5TevoZcOHWWng3/NPgGYBbmDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IU4wsa7Fz0NTwtjctdiv9yvTIagg27uF199r44tJS54pZTX6adYd2Bphb+PaxUCpxw4L8oMUpZ9KUUdPYmVJYdqHZQAXz19YNJEGk+h4UoFkbHYsAUqO3Klb5h7isVi4Vr8O83+NBQ/a08OcqZNe16VSHZLuDAB+VQPkqQucymA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XITbllBC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LXKs+WF0; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XITbllBC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LXKs+WF0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UB8EpV825720
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFdmZs+lWs/CU3aJZjtaSyzVJfvoHSuYdAqR75AXrhg=; b=XITbllBC/1NxFjvl
	Ty+GQ0YtrzxeN1b2qsd7RLaaJeycUAbGDH4NeE2R6P1ncbHsOonDM5G/5ntIkDC5
	0R5N2HHwYnV0hoq7A869wY5u/btDckkZhVyq2PmelyyVEmi6iJKAn6tpiEAD0GfA
	dP5CVHIE+010lrQ0G6cmq0oPC44pNn0O5bHLk8tjM856SvIUSP3gaKh0AGyYT3lB
	5MM1NAs9g/ZnaIu7bE4uniHazCkYKpup1qESvr0TJPqs0sVO48nm9YJ50q+nhAmH
	EG7VyMELyQRuIdx/qKR2kuLauCVswlPk4douxRuTai3BT4XUb+Fda1+pKJJsRTIF
	iERbLQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5fpr442-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:44:12 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ea75996387so37122116d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785411852; cv=none;
        d=google.com; s=arc-20260327;
        b=gakX2QfyEcwCwb+TfJCKqHlBOKWt7G2BnTflx35Yic36of+aXiGR/SxCDKviMzkXUH
         y/94UZ7BR+8oR1UEcGhS0FcXOqvmLUyacz/qcIB3k2nMYTzSMAp7GhuAi6FLiPwApOAH
         ZPp5Z1Jxc7HFk7m79yM6pQuBAgnLU7hw+tsOgDo06m91slpPoIyWWf4+AWXOVarL2lDx
         99epfH4FIecYktL93ANcl4Fr1Qbx2fl73degpWRHKoWFXwxLmvkVnODLBvYQxRBl4o0r
         u1s8R84UE6SpZXNxNClvteL5ix7trd9XYLUqDzU4goLLJe6/8GOzjXkpRtAByWntIbaa
         Vz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZFdmZs+lWs/CU3aJZjtaSyzVJfvoHSuYdAqR75AXrhg=;
        fh=LsjaBO52IkChpoS8XJsPLrZ35UvenYJ7wkbjrBwzgkQ=;
        b=r34h09r/u6KprlDkxS0XNvKq0KZ5Ref5lVIUIs/8OLPb4J3Q3HD1PcY08zXRpCpxmr
         rMha3UeTyx9sDHKAMiSSYtQEyQ/5qmAW3n4pN6UZXuSaris1v/fLqdbyj3sr10h1QJJ1
         PtNkJOVa6SmW5o3VmBe4Zsq+HfeYIZlSXS5b/VdVjrWPX2bKbWRfdf0PyPtBu0JjApjm
         ks7Qve9IuP3vvjWv79EeGMzsNTI7jZ9CRX8rJaBcQp8RdrxknpIcekakcOH/3wSgBa4j
         UhjVbq0oobKFuRJZ5DmjRg6lYm0EgwqnZbpV0LvMQVhzgps8cgf4p6pNtmB8S6bu/MoA
         5nzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785411852; x=1786016652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZFdmZs+lWs/CU3aJZjtaSyzVJfvoHSuYdAqR75AXrhg=;
        b=LXKs+WF0BAfH8Ok1l7lwvjE5bYWxTqfGh5TPwVhNlRj0msq6hWKjER1ot3XN0TIq+0
         gbX5ZnTR271EeDeL3cmFYKGwGBVftKGXt4aZKbRaP1X2Ncy0yCBAm5qX3xdPnAIrkc0t
         x5RMnUdD4GakG5llXLt0N8d+2PzMPHaMWo/GT+nav9Lpwl/tJwUTsF1FmA9p6oHmpHUI
         tjWmkoWHC+a3iV2eZoCuwPuyxdLedmTt+ABNUxlD45S62IYvHcnA+p71BMxXOwBeoqf1
         rIkfTvJ1DwwsqrpMq47fo0Fqam4mMWoTnxy65MvqJ4VBm2/ETYHFXkQr3einiT1YTQO/
         1zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785411852; x=1786016652;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFdmZs+lWs/CU3aJZjtaSyzVJfvoHSuYdAqR75AXrhg=;
        b=FJUGwtIzvlYIyudrrpRE1hAFSgFAQu4KT+Qn5Q9Ya4BA6we2VWls+/gnf4AiyIQzXX
         ISak+mbmMtVaN4Kdu9VtK5kcr4xG7OwmXewCVkr8zp3M/faqGaa+LSXsklda8px1MbMd
         DeXCnisRoYlgvTQmAjTicOgESVlJHK93u0b5XgTAg6tRIGznoO5i5vHgFnJ39kTmXV5W
         /TMtVYra4ZeYTF7EONNQh8pqECp9rdlOPCe0oucK+t85TwS+tgVIgp8EvnIdgdiQNuBF
         KjU8Hj5b5YO9K5zbu2Zzu2xM5wjbN7K7YRCN2T+RwjBxh1WFkw0WW+YzWKTb9ukgTKWT
         0bSA==
X-Forwarded-Encrypted: i=1; AHgh+Rqdh/PBIGOtsJCzXyj6eImdsoCg5PU980h5zR/NoPyx54c+PJjTv3x/Q4bQ7tKo6OwCgRr6K54JKw0Yl65p@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUjxqvV4dK8OebFhM+0tAtKMGLKLcrANTlB4RODZD8Hy8Th6G
	eOlf5T3HBaidhmhjAOfvrFDpTqDUNZho9QTm/Bt1UQyLr4XmY1CqI0lpF4ERYPI/y8ndLdU8Pjc
	ZkpzASzSks+Lp1axhz1851sKmw+sBWiIfzcWLIQ5JogDn2VSNNZe9Fmu34khNLyi9/zSoM/ln2u
	ciWXB0d8tHLXYktpMBblGWnfeKuftRPUykD+YSt+k5wjA=
X-Gm-Gg: AR+sD10N0wEYoxRHBQ2vCheaDgI6+8nyxbK5PzA7qa0yONGIUiZbmaYTUdyDEs+eScB
	nSdMJ9qu9D3FTcLk9f7W0cfuQJIl3tZzUIGeYSFHw9eysxeUtgWzaMA9fO5Uu1BVDV8H75a7KCG
	Ir0vP6p/PVmqTek2x5czcL/VvEsNDzaeEKvTIkNC6OfTNTLzaCzE3LCQ593FyBvjhjnOcmmW5us
	1W6f5vyl9F5i+z3mBKr9K3oXaJBCRKNMYU7tc98tmfolUGjD7ccOd0TGcobE+1uogFsBbfsNpY=
X-Received: by 2002:ad4:5d6a:0:b0:8ea:184f:c15b with SMTP id 6a1803df08f44-908346f08b9mr18112966d6.14.1785411851744;
        Thu, 30 Jul 2026 04:44:11 -0700 (PDT)
X-Received: by 2002:ad4:5d6a:0:b0:8ea:184f:c15b with SMTP id
 6a1803df08f44-908346f08b9mr18112746d6.14.1785411851237; Thu, 30 Jul 2026
 04:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-1-e70ad4fa39ce@oss.qualcomm.com> <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com>
In-Reply-To: <e50e3859-0343-4795-a564-757ac58f6cbe@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 13:44:00 +0200
X-Gm-Features: AUfX_mwxQD17-_pwcBQOZzIjdUKawWJPVhjgc8TmItAVXQo-3ebnuMZ032ZLb6Q
Message-ID: <CAFEp6-157JZogPG6vHLUjYiAJ-fwWcVX_xSMTUY=1R6+kat25w@mail.gmail.com>
Subject: Re: [PATCH v5 1/5] media: qcom: camss: Add V4L2 meta format for CAMSS
 ISP parameters
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ErfiaycA c=1 sm=1 tr=0 ts=6a6b390c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=vIisSAodvos0t_4omlkA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4OCBTYWx0ZWRfXx1YZNZ6LFgoh
 1iDrQAlRkAx9cunS6QBAt2WXSns9mUdbNpYmyYmDteRLsFEMTgI6gFRWBiRSid946WoS4C8xGou
 PcQVXpOBrsEBDe2T+A0OCdHdcVM3mvPt/o2WED0gzXu2gn/RCEcX2ldmkopUsmHuJjzOdOUd4r2
 JYPK+2F4xTekqhEJIRupBcB2NI1hvDSCdJGF+STEHrg/bkn9t2+zeh3r5RCX9rQ64lNtJdiWEAo
 2MnvXkd9ai4y0M2zvz4uS5WHHuPL89WQYQuRiAG8Qdvin52hH68ocwuYbbBKk5KBsL55bhw9AFH
 OBBojmSERN9NCzonS5X8JjShc5+ZB8bL/Na+feyByXC3zfOWteF+KAlJTIU8J7PB/ypbj7t3XRb
 wpOWoxl7nrtGTZJoRq0Z5r+xFofPCQ9dfpfSq5xTP8n93y7sZcNa5MnKIWy84ATSdXzDTt7AFM/
 wTEsr781d0OoNoyuCMg==
X-Proofpoint-GUID: sAcrG-mwBLJDK2ILuqwIbfIjt3OOsS3c
X-Proofpoint-ORIG-GUID: sAcrG-mwBLJDK2ILuqwIbfIjt3OOsS3c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4OCBTYWx0ZWRfX86WFbmvRot/o
 AWhm3WZ7i1ixK4uxGCbNBcqA6zrVUEv6d+2Ypq4XczAuN+PDld6GceZHaNTlLSf/i69Gr7oMzhw
 bItlboF3GTwT9RK3gz7y2eBThCTrAyk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300088

On Wed, Jul 29, 2026 at 8:28=E2=80=AFPM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
> Hi Loic,
>
> On 7/24/2026 3:42 PM, Loic Poulain wrote:
> > Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> > Qualcomm CAMSS ISP parameter buffer. This format is used by the params
> > video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> > ISP tuning data such as white balance, color correction and chroma
> > enhancement settings.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
> >  include/uapi/linux/videodev2.h       | 3 +++
> >  2 files changed, 4 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index 98512ea4cc5b9d725e1851af2ed38df85bb4fa8c..7b6e9a9a514f037190d55d5=
9409dd6cc97522943 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >       case V4L2_META_FMT_C3ISP_STATS:         descr =3D "Amlogic C3 ISP=
 Statistics"; break;
> >       case V4L2_META_FMT_MALI_C55_PARAMS:     descr =3D "ARM Mali-C55 I=
SP Parameters"; break;
> >       case V4L2_META_FMT_MALI_C55_STATS:      descr =3D "ARM Mali-C55 I=
SP 3A Statistics"; break;
> > +     case V4L2_META_FMT_QCOM_ISP_PARAMS:     descr =3D "Qualcomm CAMSS=
 ISP Parameters"; break;
> >       case V4L2_PIX_FMT_NV12_8L128:   descr =3D "NV12 (8x128 Linear)"; =
break;
> >       case V4L2_PIX_FMT_NV12M_8L128:  descr =3D "NV12M (8x128 Linear)";=
 break;
> >       case V4L2_PIX_FMT_NV12_10BE_8L128:      descr =3D "10-bit NV12 (8=
x128 Linear, BE)"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index add08188f06890182a5c399a223c1ab0a546cae1..011026194a20cde22a374e6=
fb2570cbc6bced230 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -888,6 +888,9 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_MALI_C55_PARAMS        v4l2_fourcc('C', '5', '5'=
, 'P') /* ARM Mali-C55 Parameters */
> >  #define V4L2_META_FMT_MALI_C55_STATS v4l2_fourcc('C', '5', '5', 'S') /=
* ARM Mali-C55 3A Statistics */
> >
> > +/* Vendor specific - used for Qualcomm CAMSS offline ISP */
>
> It seems that this is generic format for ISP parameters, can we update th=
e comment and remove offline. The proposal:
> /* Vendor specific - used for Qualcomm CAMSS ISP */

Sure.
Loic
