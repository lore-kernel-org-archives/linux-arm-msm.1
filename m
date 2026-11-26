Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706161;
	b=E6IHpwOcAblpn7XwH+0XCDICsonH1FYeSQ8E2slWO8ziSrG3QdcH9jBGVkI5S/i25h03
	 fwnOwj8myjwYiSEuRxKK7OyRDs5tyXbIk/1UF1OiF+EJVNpZj5LOnVktqO6i07voZEw2V
	 Q4026t18lD/+b1Oi2oQfq/R/dLi98PGw+GgxFFKoWcsKolDaBMnDdHm6peKslOQnV8O60
	 dtjMXwmXJXGjA2TPIFBsY+lOn8KNkFWLQ/Nky1+Wxa8VcIWN85ANQ2wZ7KnPm+X1R5RKZ
	 KCz5ogoiS9M5Xz9UCrulJeyPxPT3M3MXnCaQMlLQJvGyKdcwc/U2HVCudzlm3x9bl6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=;
	b=cgj0ES0DHf5sOvWYUZ//gxCLgjEBz8gYbr30G/x53J6erWF/A3tnD+yP9FedAeS3MBx9
	 OnMmWwjJyErOtA0TMEw5FC8RffmwpcrZsjDCvENTc7pUTG6zjfzNmYms/F9jdL+Yz18DM
	 e0JZ9/39UrKnhehTpyAAS22L/a3xoy7W0X/GgXLRbLajf3iTUhNreozHSrxCT3AOwmNqc
	 +cvc8dAzSsseSGaL8ZbF4ZXVXi3PLv+o572tMcKWh8rsMxjfVcmazyf1Nv/5ZSMzni7Up
	 J4LnkZ8FP44lwlCv3RJXlZDbYOBtV826Vv2iloKmSQzre6mb108C5xdW0nfLlxRtxJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H+kL3J7w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IOI8eNEm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22D4606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A22D4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H+kL3J7w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IOI8eNEm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEV7co3171069
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=; b=H+kL3J7w5gYVbLZD
	d220/PD1TLVwgLLVljYN6oBRagsyhFVz4HaQwyDYb4RbilqNjrD2KZCMPRKWVXF3
	CQdAQEA7g2sFXs0UIJ+KTZWqGmCiWzbTbR8KYClsSwAz6fEkFK+pDswVaJ03CgXK
	Zb89+lp5V72pLnHznxTYuh9+TX6EBz4/lyivrltiWBZSM/39I2hbNg+UtF7rLu6C
	99UB5IEKOZ7uADeabWShsGdEOcCMHDVxaIj5jiLmy/rQbHTkbuGqmBYNE3Qs8mop
	lQyOTA+vezpjljQiOmIMVJpNuZfa6KVMh86uQ6kGPCpYKo0sDKJNJU0sAzQqwVGX
	mUa4GA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfbf89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:15:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949b0d322fbso993882185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:15:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795706159; cv=none;
        d=google.com; s=arc-20260327;
        b=bg57hNm+n9Emebj+hjYnBCKURvQyU02rxrMPEXM/gkpuCuBIkCJkk04WKhYboEHoRv
         DXQH1bIvefe3l1iTAWC2BBqew636gFX4CwsrSFkl5fNk9IpR/0LCcCLbAOzvjHs5+mhN
         yT7oWMULhhje4yLbohl+Fl7vJ9z0fy9F0Krg0WR8PA0vFqrOjNwMeU3vDx87YoV9f12Y
         W7CZzX8ZDUVEvJmWFV78fkk7STRNllgDxfb9HZziQ8HWk5O9UOByojI6XxikX1W0tmjF
         S/tRcyAKlZmAF95Oek0JrmQ+PCVnQL6LvUtuCLj+JfBRkjDoBltvvosRW3vIka0wiqzY
         SNIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=;
        fh=0YsnjyDCG4Qjqy+17/WAV1y1P2fVdFdMdCDshiFqD8I=;
        b=qhOag7UVqEdzYQ7QwjabY+VaoSnnWLTmHZWy0Wcdqcgvn+AWj8ejHtiNFtNQQ/e++X
         amvThd0cPkT+/XRlt4UWp/ImXfB9jaO+tSBXSQR4zR798JDkej+uRVxlicSKeAj78wWI
         2O+nY5s99G0wlYPpKrSukF6BxT/8hQzDwmvvi3vsEJep3NnRxkyuznpRF+QykMe8RwJM
         wA5n0SJKbuRFDAMshiqxgZdJcAEp1lcoBAQhY01xqYH2VDBOIB5nk0wLfdTQVCPmbBlx
         1kB40QKQzdzS7KkuS95cWs0gTDS4rjX7kCmmAQipeH2ZAK/dq/QEsEjg/U+5w7MQcq6Z
         P56Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706159; x=1796310959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=;
        b=IOI8eNEm1p/IXRc2DbBWxAUBBGMjJIQF+8RQoO1a6T3Yz5VnO+KyTh5F3VGpGMlc1C
         0Ja/btkrzMNZB5kdapZyFzBFlHsR7wA0ZABJuU4uYtpASl3qzs4qmUdLL/8+YnZLMA+P
         B803FCj4z3sNRS1yEjKiRCEKAG+ZZdxwXn63ytuu9bC7XBf9xpj8LqIVkYLLfvo5L3sY
         oYX9ZhH9Mq1iO2/7MX3MmFVD82V3geCdHRKqAJ+NL6IyRuAmfU3zh7uXSIeQjBY16kjC
         0sSWzHie+pzHiT11IjDK0rg/d0GZCJwg4BI3X9VvJaZ7lbxW0zptJsdc6X5AtlzWVl51
         BUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706159; x=1796310959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUJp0Nzq/FvKa12XTB23VAkzEX8Y0glzmuaSKGpkPHk=;
        b=kmYGvmZ5gvwPZG+2ONb5kzZDzLqTCRR5db9M/Cy2Sl0/Q/UGhcsGntxMcBsjmMzOA3
         PDu1XElQlVVQgVSe+vbXTWcsP28aS/bYHTRUPLeetwdxeJcXfNLToxuDTvrpzTflvq7T
         EMviBJh5XR7Y5mY5SUYMK/7u11lzTIen3Rl5uxqmi0+uAD2AEbbPYTrpaFmRgR0B+lpp
         I/FTAOswHqIj51RVDNQ9mcVzeutVcYrqu2u6u1472g9LF670LvFt4uH8ABrHQC9XcJLs
         +N567fc7Lf2ecmoZ9Oad91vg1woWN4g6ro2rT7TdiJZB96/GfMOiyjF+Y0MWXt635CGL
         oAmw==
X-Forwarded-Encrypted: i=1; AL+hErFHmx2GdE9jp6D8a8useqb6R8kKhrdyF3Yae17I36lB3IEJSKHiGeOaR2WZ2GGab448WDAHcXftIvBkwtkq@vger.kernel.org
X-Gm-Message-State: APuU4Z+yby4KDx1YUtTtaiOC4cSUBxdEWBPoAVKGsuWgDUp9UsOXgneq
	LoqpUP6P1aqAK14+l6jEPFcKmLLmtGMNId/9LBbpuA5mQ3KgsmsNvPA6/i0LT0i31/M0MiF6emg
	QNU9rQcyb3XahNhvSfWu9UyuLsR/Ee41GKxUK39Ialhc6gSR2xPsMjzXooeVIZbEA452rV9PBzr
	i8HD9U0yYDswljFtjAEhglDKjYlzkbCnI6ssZS5b1sGOc=
X-Gm-Gg: AZFdTZe02XNBf+tCfiLPYk7ENjizcm4ZupK/u00f8vMsizQCFNbKjOun+DfLQsIVecI
	hS9ld2tSY8d1figuXJRY2vWdFP68zLZnAQM6CFEu6wSN6ndXHMA17gdXJL5/8fCNa+X0bsvSBjo
	lzY1QVLtYXbtjoS7x+X+chfFeZy/68HuJTPETbNnm/WncIKQnS/jEjefBI+qdO/EHvbNwyJkbZP
	rZGicLdWleJUgxS085zGjT7BiC04jW3pWyCIy3UOE42K4KOw5s0tgvZ3GUfqpw5yeDgwCbJtQ0V
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id af79cd13be357-949ba80fa24mr3406475785a.11.1795706158588;
        Thu, 26 Nov 2026 07:15:58 -0800 (PST)
X-Received: by 2002:a05:620a:2b4d:b0:93e:b0c3:388d with SMTP id
 af79cd13be357-949ba80fa24mr3406470485a.11.1795706158051; Thu, 26 Nov 2026
 07:15:58 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
 <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com> <9b858d24-f783-44e5-a7e6-85b59e054f37@oss.qualcomm.com>
 <6ddbed80-bda4-44c4-b0a4-be2e87b278b1@oss.qualcomm.com>
In-Reply-To: <6ddbed80-bda4-44c4-b0a4-be2e87b278b1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:15:47 +0100
X-Gm-Features: Aa3M54qFufD8dXHGK7qI0JqWErH0MOAaLSJpzFfpWvcnCETN-pln6qRyNROnHVQ
Message-ID: <CAFEp6-07goPSX=fEOmQziXTvSoSt7-FebXAtB9xfavTXB6-Ryg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
To: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 7alGa4_clGKJzIZSorIZGR7jGyn12fRO
X-Proofpoint-GUID: 7alGa4_clGKJzIZSorIZGR7jGyn12fRO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfXy6/qrkt7e7Tc
 QQWZjyCOldErfjvj1Fzr05zjBCMYikMCmPOXzmvQjHMI+KyyxUoOd3xBLIVpk0vHkW9qqYI2uCQ
 0RaG4xsnFP/oZ9ItTZVhsjKKt/ofe2Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1OSBTYWx0ZWRfXxVAwihbaNxES
 uvLu8C6hfPx9pv2HAu0fQv4PtPsR6ZitcueVBIB2TPq1YLNbq/z8Ek7iAjyARSigsMmlRXjAwZ4
 HCQnN8BK2noJDwbHEydu7s6kHF2PLFwMB6X79fIHxC9F/elHhdQKj8egzb9SYY6qQXZ/c1ZvfEt
 iQhi+PAFG3meOhxR53Bt+JfXLoySfluBAzA3mPijbFu5fUHWRGottcBJ2rRYMtghad0Xoa3k5ha
 Ax1MgA/8NtBTxoOR5o1bgADxVC/59QAF5fLfTD4audqAgedIO1AKv45qTxOlg5MCKywf9/lNDaY
 FxKHJbrvbZ/ctqjilfbHk5JxPDwliTYfaRgc0QSN03OQ+5E3uZLK6efxXQO0ARbrUKXNGHRXQJ0
 EvpeNgIYtD4YGuhgMUc693Xcpxkwk3p5FHyAoxghEFkUiYqep9gZ+2lWpRWwKs5w/dVlaOpgYBR
 nUpumEH9Xp4btkOnJug==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b084d2f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=BYyRJpiNYB29a2R02p4A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260059

On Thu, Nov 26, 2026 at 8:52=E2=80=AFAM Gjorgji Rosikopulos (Consultant)
<gjorgji.rosikopulos@oss.qualcomm.com> wrote:
>
>
>
> On 11/26/2026 9:00 AM, Gjorgji Rosikopulos (Consultant) wrote:
> > Hi Loic,
> >
> > Apart from hw timestamp propagation some other comments.
> >
> > On 11/25/2026 12:19 PM, Loic Poulain wrote:
> >> The timestamp reported to userspace for a V4L2 event is taken when the
> >> event is queued, which for an event signalling a hardware occurrence i=
s
> >> only as good as the latency between the two. A CSI decoder able to lat=
ch
> >> the start-of-frame against the system counter knows that time to withi=
n a
> >> few microseconds, whereas the interrupt handler that gets to queue the
> >> event can be hundreds of microseconds late and is not consistent about
> >> it.
> >>
> >> Take the timestamp from the event when the driver filled it in, fallin=
g
> >> back to the current time when the field is cleared. Drivers have had n=
o
> >> reason to set it so far, and every in-tree caller either uses a
> >> designated initialiser or memsets the event, so the field reads as zer=
o
> >> everywhere today.
> >>
> >> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
> >>  include/media/v4l2-event.h           |  9 ++++++++-
> >>  2 files changed, 26 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2=
-core/v4l2-event.c
> >> index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d=
691ffd7853d9af714a 100644
> >> --- a/drivers/media/v4l2-core/v4l2-event.c
> >> +++ b/drivers/media/v4l2-core/v4l2-event.c
> >> @@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh =
*fh,
> >>      wake_up_all(&fh->wait);
> >>  }
> >>
> >> +/*
> >> + * Hardware able to timestamp the event itself reports that time in t=
he event,
> >> + * which is more accurate than the moment the driver gets to queue it=
. Fall
> >> + * back to the current time for the drivers that leave the field clea=
red.
> >> + */
> >> +static u64 v4l2_event_ts(const struct v4l2_event *ev)
> >> +{
> >> +    struct timespec64 ts =3D {
> >> +            .tv_sec =3D ev->timestamp.tv_sec,
> >> +            .tv_nsec =3D ev->timestamp.tv_nsec,
> >> +    };
> >> +    u64 ns =3D timespec64_to_ns(&ts);
> >> +
> >> +    return ns ? ns : ktime_get_ns();
> >> +}
> >> +
> >>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_ev=
ent *ev)
> >>  {
> >>      struct v4l2_fh *fh;
> >> @@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, c=
onst struct v4l2_event *ev)
> >>      if (vdev =3D=3D NULL)
> >>              return;
> >>
> >> -    ts =3D ktime_get_ns();
> >> +    ts =3D v4l2_event_ts(ev);
> >
> > The documentation states that:
> >
> > "In order to queue events to video device, drivers should call:
> >
> > v4l2_event_queue (vdev, ev)
> >
> > The driver=E2=80=99s only responsibility is to fill in the type and the=
 data fields.
> > The other fields will be filled in by V4L2. All other fields are filled=
 from the v4l2. "
> >
> > So here we are changing the driver-api. I am sure that there are driver=
s
> > which does not set initialize the whole event struct. This will introdu=
ce new bugs with
> > some uninitiated data send to userspace as timestamp.

No, at least none have uninitialized value, this is mentioned in the
commit message, so this should not break anything.

> My opinion is that similar to frame_sequence (which is different from eve=
nt.sequence)
> to add frame_timestamp in the frame_sync data field. Whether that is mono=
tonic timestamp
> or specific camera hw based timestamp is yet to be specified and decided.

Yes, but we're not changing that here. The reported timestamp remains
a monotonic system timestamp.

Linux provides a hardware abstraction layer, and in this case we're
reporting a SOF event, which is fundamentally a hardware/bus event. If
a driver can provide a more accurate monotonic timestamp for that
event than the generic framework helper, I believe the API should
allow it.

The goal is simply to give userspace a timestamp that more accurately
reflects when the event actually occurred. If that level of accuracy
is not required, there would be little value in providing event
timestamps at all, as userspace could just read the event and obtain
the current monotonic time itself.

Accurate timestamps allow downstream elements of the video pipeline to
make better decisions. For example, they provide a more precise
inter-frame interval and effective frame rate, and enable derived
measurements such as object velocity or motion estimation to be
computed more accurately.

That said, I understand this point is somewhat controversial. Since it
is not a hard dependency, I can drop this patch from the series. We'll
still apply the timestamp to the frame itself.

Regards,
Loic

>
> >
> > ~Gjorgji
> >
> >>
> >>      spin_lock_irqsave(&vdev->fh_lock, flags);
> >>
> >> @@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
> >>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event =
*ev)
> >>  {
> >>      unsigned long flags;
> >> -    u64 ts =3D ktime_get_ns();
> >> +    u64 ts =3D v4l2_event_ts(ev);
> >>
> >>      spin_lock_irqsave(&fh->vdev->fh_lock, flags);
> >>      __v4l2_event_queue_fh(fh, ev, ts);
> >> diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
> >> index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c603=
44e5ea73a698352134 100644
> >> --- a/include/media/v4l2-event.h
> >> +++ b/include/media/v4l2-event.h
> >> @@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct=
 v4l2_event *event,
> >>   * .. note::
> >>   *    The driver's only responsibility is to fill in the type and the=
 data
> >>   *    fields. The other fields will be filled in by V4L2.
> >> + *
> >> + *    Drivers whose hardware timestamps the event more accurately tha=
n the
> >> + *    moment the driver gets to handle it may also fill in the timest=
amp
> >> + *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero,=
 so such
> >> + *    drivers must zero-initialize the whole &struct v4l2_event.
> >>   */
> >>  void v4l2_event_queue(struct video_device *vdev, const struct v4l2_ev=
ent *ev);
> >>
> >> @@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, c=
onst struct v4l2_event *ev);
> >>   *
> >>   * .. note::
> >>   *    The driver's only responsibility is to fill in the type and the=
 data
> >> - *    fields. The other fields will be filled in by V4L2.
> >> + *    fields. The other fields will be filled in by V4L2. As for
> >> + *    v4l2_event_queue(), a non-zero timestamp field is taken as the
> >> + *    CLOCK_MONOTONIC time of the event.
> >>   */
> >>  void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event =
*ev);
> >>
> >>
> >
>
