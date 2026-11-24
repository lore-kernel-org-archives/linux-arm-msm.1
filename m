Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515874;
	b=SLR88twFlzVjGdJawbeASVOxjwnGLI6jQ6Ey525Qe8+O7UgFEQOC5smcET3PovgQIWdb
	 Gztno5rGp8nOr4KX8qC7ohS8iTNaFThaBrYLfatyJpVUu6ZUesI2f33MtqOtE+7KGXnBx
	 JFy0K9SojKuFwKBLI2SR5g41Po2Mi6dxzl+3s5GUQhqLFFRxJKp3+2nOsCOm2M5Or9y0/
	 TwwL5fxjD1IsIs90z5iAdMhZYYLTYUfT0ClpxoQ4WUllFtjj9ThYyWmNMFaRwDplU04aa
	 K5jZr9EJCfyeIXVvVSbetbwH9PPLn7pfv2kbKe66oCT+lrsmlpt8GErhChMqRa8guPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
	b=Ww/az+/m7n4uakP3mQVmlMTvuPEWDF8yv3VzhnwJODykncocK6b/bgWJoTsU0PZayHVS
	 XMiOls95ht6h4ZpDFgOSKn1XVxNbGenhiQIhX+U96kV1mcMYeegsMm/r0bZMk6IOM2YU1
	 a1YaD7mxTz0h9FKHdwF4TYfLiPZPmQM857IKU2xVdS6lHNILhIrbYg02cjJzduy1qSpiy
	 8blbQRwqPu6wyH5+zHW1PU4vZiPU+dTud4M61rJDhdE2k43yAP4yWxKOsCSZ9nR94j1CV
	 NyXicUGGowWXJte/69DszQs6rmzakn2jxN2uU/JjRKdAxbJQfC2AW3tCQbbckiNs7hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlQNV63f;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWRg03f8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE482606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE482606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JlQNV63f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dWRg03f8
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8brkf647033
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=; b=JlQNV63fdfAmkA8E
	F74W/xAOlDgHp/fXni1zNZ9kSE9bKMJUMAVa1mKsgWOerX/Rf73cTIytq5bRMV6u
	+RE5DGG8ECKvWdHxKgmaKSO+S7zfj5j+q1BJ/DlZvijs1wBgqjqb09j2Hc9xG5rz
	eMaBCsd3qkra8xaLYl+HH8njcuutB90ALhds7Dr1rxViwWFIAW4z6FcYdxSdvexu
	Hc1J1YN6A/FUO159bpI4ocJmrlzopHygRxQnjKLL1/Ur2CbF6WWm0DSgBtoNz1gr
	Ggw27QQxHfwsIOSrN1mhDBDOqziHc9geyivC8p5jPxgDlvakZ96omlQqX2mQNKeo
	XhF3Kw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd26vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:24:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495dd0f07eso785002585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:24:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515871; cv=none;
        d=google.com; s=arc-20260327;
        b=C7Ac0nLHx6X6a703xK0HyTSCU/btGpgH7LvBhAJwSM3WCYmf/S21Hea9kg3LLnYLh+
         KUSnmEpKFAg6gPz/nAMkc5B/ctPHdR/pI+Bom8ZG4J59RBwlpNrThhyMYZovUeRj8d4F
         KWmLca7CMzy/vgPEfjdQsgvSoiHplf24+bJwRbB2d4RVktqQ7yOIPMoxoTDMAacMKM5j
         jat0JVpZK4Vk+x15Sw/jGHla+Q2ILFr7Gmh8ed8EkQxdIGnzkG3NoJ+fcc+VCws0x2Vr
         4ea2IBLMWQLWAeZw1XBFNqyH1TnI44AiXMcTtSGJeiTC8plpOh8EPJcBTvLUpUcQeh3i
         yrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
        fh=PLj0CMKn9rNyQAjQSjqBZSK6+v/TQhR2xNG7cEuWVGY=;
        b=jo3wx0s4zbhMNWJlV32UVvYrMEHnF2UzcCJgE7x0qEynCXBXXKEEfGD2HDYPVDLXUp
         cmj9axf6nP43KxoidYDAXZzcwC1q6HfZEwEVruycRX8QwYGJ7vJVAvIgztVpUIzRbYHT
         7olnxkJTNxYrFmKka97V0YHTEbiWL+Pcd0zTDqvCJ93B8uKaDRpEltegWVVTNe2A2IK7
         093OxrZfloTaqT+D9wMu+2vxF+eIxta3x6QC/GqouCXelOaszPebfaINGUpY1NV+Yip1
         umDwbtmCNi8/V9jqmKng7hNdmE1nMWVOb1CMf+opw/t4W09XFKpgN+wGea1cmdre5qPT
         VaHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515871; x=1796120671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
        b=dWRg03f8NYLEtm9ndWiVJUGw5aMmyB81mILbdhpEKqXYWH/sIe26mdmzkbHKfFrZSe
         EkNqz5KQ9dLvdrSWJDcHmU+oCsvvg1pDUWpB1VcfpHGQKfVPthLHS7c40igkEGcRHWHA
         437CBmgCikH5SzIxseSUKnF9UarrgFzBWu+9M4oPc6bBGryNmMWne9GlC2bN2xeSvbTP
         F6IHawI93sRF2M3Osj5r4jwrs371jOFZRkLd8kLGZobMRUkJNA/gRN1CqoVax+GhMOJ2
         ClTvVeEXfka9+ha/FwbUusNxSleQKxUMz1YPm0T5QHf/uWsDvzFHQZaWcE0+lAtuqNys
         aygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515871; x=1796120671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClS6pm1LZaKPA9FkBrJWRasWTYa5BTH/hWmVQCiWBTc=;
        b=N68zk1p4u8g8U1JLfkPRn4Iy0SIdf1N26JZssAL4xSYLIFXomq08yCrIRplFk5ib+w
         jTG498SOu1O3mL6m6Q4DJst+8TdR8RZppDPWI+qSyr9YNOgUCJ6p/SOI2f9Whtr2rzmK
         FaJF/p9iJvX2uqcMOE+Bp9o68OGO4JmAP1C21Do9bV4zMJpTPlikWMe1tUvl5+8I3ZZB
         O3cO/RG7zkbfy/0oSNELSzfk7KuQLIjHGk0M/gYYRyA3dl6KH9sFqN/NtE2Jv6OT14yg
         0MoUrS/73KplpsUPicQcv1cr6CrETDWWSIRsc/Ugl2V2vcTQVGp2wB3SmrdDxogtnF6Q
         UlDw==
X-Forwarded-Encrypted: i=1; AL+hErEYtRTnuEzHrOOsQKGUizobs5pv2UcdNji1Ce4udMorTMUVW8LfpxcqwLEUYgejbvOboy0YwVKaVTYtGB22@vger.kernel.org
X-Gm-Message-State: APuU4Z9PDXWspf3zpmt9gsx1eljpqy/a8rHVLWEhNaBFVMCoWmU6NZZx
	2U08xhnRsh3u5sMJB/x1U5We6h/WQ3cw1JV0uRKxf+qWf0AOu4PRKjP0vjDHabFxo/sLDTZQw+K
	rpJgTh/D6tkox3l5NwrPj7EmQhPYpoGw7BOxkeX92cR30iWpCA4zJ/6u3jPKcbxOH++AdRGaEh8
	lAImjpq6ice4mIek9n8md+iPMQZeqqsouvnpxLdQz1Wtc=
X-Gm-Gg: AZFdTZe14IN3CLq6lf2vxUp3zT5u9GbATXQaUoooFXAoLh4NV210a4lFTp1fmGK4qR3
	0sJUZBUM+f9vWQ8J9yp9rwdRULA1sdwLCaYO4oN+hczM2I+XxiWEDYpJEWgs3VyDOh60UaOg34k
	owYja0Y+Krhnd5m9HmJGKxSky1TR0MZdTNB5SDq5cVSZF2OrkkbWnuG+IoZWIDpNMWI8UrMDIRw
	kWTihhXs/RAP2lL1kNuCVLglVh9TWJcqa5MU6YQsPzJSm1Dtprm97WB9k4g0O6WnMc5lDKJnk4=
X-Received: by 2002:a05:620a:1332:b0:949:402b:f1b3 with SMTP id af79cd13be357-949bab3e8f5mr2104745685a.70.1795515871171;
        Tue, 24 Nov 2026 02:24:31 -0800 (PST)
X-Received: by 2002:a05:620a:1332:b0:949:402b:f1b3 with SMTP id
 af79cd13be357-949bab3e8f5mr2104744685a.70.1795515870730; Tue, 24 Nov 2026
 02:24:30 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org> <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
In-Reply-To: <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 11:24:20 +0100
X-Gm-Features: Aa3M54rGNgMhHGcSZuOu0EdTZ3ZT3TJojUqx1IDZ1tGmv0rflDqz2I231sb358Q
Message-ID: <CAFEp6-1pEL-wcz9omWoyqGAF55LShkUDbBxED2h565-ytZLxqQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b0565e0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=LjlbsC0lBQcJaY6aMbIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX46iySGX3C4c7
 rvok4G9x4V9xd6drXc2a9VolZqvS3EpJWXWlg+XPQktrbMDeFF8mjlGo/j5EESeFMzZ9Y1ubvox
 pwrsZBOjOAmYP7trXUzdQH7IxQF3Ki3NFlH4F1sn9JgWduCrmHmEOqCNWbrRa1blgkZAa3oCiiz
 +dbYRQ1kVCMCvRM4pfKmGdkG8r/k0r4b5nb88i83CpusBmRIBoh0jRFlJNcGdv3/MObmskGPRox
 eZAMcOR9DxvjcwFt7Ogpq9LLPu8bHh3ZLXmx/vGLYCYIYvXvTNjGlgt+6IRUO3gt+t9/1VFARj+
 yB09BfhZ2NkRY9tvza8LI194wh4cGckAy2d1vqkal2S5q00L1cOwWEtxHz3+9PCCKSP/cdOMVDD
 G+JpSyOU7G8btE3PxhQBqNE7AgXRCeA7T7e/2+/PYxSpTEdwcAiPnRvtCyExqApypU4FR2whINz
 RxDfzB7GZFsHs1HW7vw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfXwKY4ni/kcd6L
 K+VZ6j9KN0To86yGQ4Iygd4ExkyEmT/pppvS6gZvza8OJ5CO3m+FTB0rbPXejUgRFUDBOQPNBP4
 XEqZwx0c6hmcSWI/MGsKOe2DZO098Yk=
X-Proofpoint-ORIG-GUID: zzLBPlPXBlZyIR09tIdWOthUSaEmQ9h3
X-Proofpoint-GUID: zzLBPlPXBlZyIR09tIdWOthUSaEmQ9h3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Tue, Nov 24, 2026 at 11:21=E2=80=AFAM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> On Tue, Nov 24, 2026 at 10:59=E2=80=AFAM Bryan O'Donoghue
> <bryan.odonoghue@linaro.org> wrote:
> >
> > On 23/11/2026 17:16, Loic Poulain wrote:
> > > The CAMSS CSID latches the ARM architected counter on every start of
> > > frame. This series exposes that time to userspace, both through the
> > > V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> > >
> > > Until now both were taken when the interrupt was handled, or worse, w=
hen
> > > the frame had finished being written out to memory, which is about a
> > > frame period late. The hardware value is free of interrupt latency an=
d
> > > is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> > > with other timestamped data such as IMU samples.
> > >
> > > Patch 1 lets a driver fill in the timestamp of a V4L2 event instead o=
f
> > > having the core take it. Patch 2 passes the SOF time down to the comm=
on
> > > CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> > > Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> > > uses the same time to stamp the captured buffers.
> > >
> > > Patches 4 and 5 are picked from the timestamp support Bryan shared
> > > earlier, with patch 5 adapted to use the conversion helper added in
> > > patch 2 rather than its own.
> > >
> > > Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> > > Bryan O'Donoghue (2):
> > >        media: camss: Define timestamp registers for csid-gen2
> > >        media: camss: csid-gen2: Report the hardware SOF timestamp
> > >
> > > Loic Poulain (4):
> > >        media: v4l2-event: Allow drivers to provide the event timestam=
p
> > >        media: qcom: camss: csid: Pass the SOF time to csid_sof_event(=
)
> > >        media: qcom: camss: csid-340: Report the hardware SOF timestam=
p
> > >        media: qcom: camss: Timestamp buffers at start of frame
> > So I was offlining this change and kind of left it at comments I
> > received to make the type of timestamp selectable on a per-buffer basis=
.
> >
> > IDK if that's really required for a first pass but, its where my own
> > reviews were left at that time.
>
> I can imagine this being useful in some scenarios, but today the
> timestamp source is configured per queue, and there is no userspace
> API to select or switch between timestamp source flags AFIK. So I
> would consider support for that to be out of scope for this series.

Ah, and that makes me think we may want to tag our timestamp as SOE now.

Regards,
Loic

>
> >
> > ---
> > bod
