Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795515722;
	b=EEeBDYzK/Efd/Mmt8E4p2Dob3vWFysbR034RrgIzf2Ww0b/vygSVHXpjA2ZblZ61yGyv
	 pxidDLxVxVgXVd3c/edx79Vwg6+qR6CJ7F0cMJmFpEZW2z5C1GsEomr2wnGmiq4utKURO
	 KxiK0eLcKgTdA8iJ1O/cPqOZ+HwefB3/dIEsikN7B8gEDjqjTHRCYrzXZk1al7x/sMcoS
	 YlUJ0GSmmI67/epmzKeWc9UPoM6u8+vLe1u5LpTcwGDvovich4YBrwelTcVR6QPAARyJx
	 p+rGR8nWV/hDxz3MbN/DPDYpYxRnJikyILnSb95G8yCSUXZ3PRwveEe3evsFHTyv20g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515722;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
	b=P4+Wh14RB7jIWXXiDe2YiSRTI/k+gGacbcgBzxfY+9jvTR7SFfgLJElww7dxeJ0gU2jK
	 25wnm2gUqE40eSgq/IS1pjqlbIFt0ROdFS9xuMumIRpecr9UGLsjLfVnfU5z3CjSllFrx
	 gGVNdGyJlwydla6hUK98U/jJz6o1xIUIY13huUzTEZRS6DH1l8WdB55XFnRevEfPMXGdo
	 5yY6Ywu1ai0uJvriEaQJOYs6TvZ0YdMjPt3qhtive4Fm6cM/sRDJc5yWF5otpms+t/wmi
	 h7SzWjj4cMtl4If6stMYkeRzXieuJSVwvq+KrAw1UNnWbf/j7V9Q/rcDOqMjm3SaAQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Maeno0M7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arXcqM4P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF0606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FCF0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Maeno0M7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=arXcqM4P
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8bYxA4129097
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=; b=Maeno0M7egfWc/gw
	YJfKWrbbwE0V0jXsr/jkC/8aUibpWhpQV2aMDJxgLrFUmzmfwQJQLLrCzHiIzBFK
	OutSQg0eNIlM8+1E3WoC4zNXv0xCDpqXiGtJV8WBZPxm7pq5j+gYVBGkBVRH2Pya
	pHyS6TD8fyoIvoRMXE583yh3cbG7Y6hxySkKD7x7+DRnIfU+PhzCq6eNkK3hwMnp
	CSIyRU+3O7aEswruaGLX/T9GjHKCT26p7sqpxRYwjdmGt4VE537MGUgZgii+rWwJ
	kc+6gSG5rGYKu9rkwdntxNd9Dtlypd4pEOwnuw2VAErv2EQG/S+96DX2dF2i1Md7
	D/qv/A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt26gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 10:22:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949dc497896so248500685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 02:22:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795515719; cv=none;
        d=google.com; s=arc-20260327;
        b=ah+dqptqYmwmHltqB/Dt9Z16HXi3CbiebD7uPCMl2PXi9DG8oxtmyrr+6RPedJdcTo
         7LH5iyAa2v2YFlRyekIXq5GP0dC3+uKCCJjaBEBKrN9bMydaWbuanmFx/mN7/Xb8gfXq
         K2yL37O5oQRkt2mFAGsTeWToKKgtrgpdvZVwme/Pox2zA+L/2m+1X2KQrK6RaYwHdePI
         YMd660O0NsJsXnZJXSN8RXdacMboPt6yikb0/r9I9vYDD5pjTi8v7H/YIgY/xzZX5mUk
         0U45SD8xCahrUc352Eicw0+euKpgfQ+g7lz6S4DEuL+cDOVT8WuNurDe7WvWQnBPFuCV
         OfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
        fh=jTwxHJbcjoVf9R6S4Ggj/MEU4LyOuHYpdrkrQ0/5RFw=;
        b=ZtCqCSu6u0x1GINZzdmh3etCyT9YxUbWqT5TUrf9hxtP9mvRYhHDmcLPRCtDM961hb
         50j85Kh858ycK71zBoUoS7aHjkfJIxhqbI7InslZc21WlcppwdOC1/xTQ5iz8sXsR0z7
         PQRr7jkP4WhW1p1989Q6zlJNzanN885sd1v/XFPScDAUNAEH34orjTf/jUjDT3fP/d4D
         UWD6uyFyqWDpWK1cZlriiODwXOFutmGDVagPqc80eO9o9RtPfa3MfpQi5CLyAN9KvOt3
         UljZtHH2RcuUIoNQoHH+YtaqFHpKl3awVTzcecWDI41DkSAaK4ASBj+u0W+g61J7yGg1
         jRnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795515719; x=1796120519; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
        b=arXcqM4PtvqJMToAas3UnkQL5ZycL7YiJRLd0pJfixRD7XK8Upevc8m1QNug/s/qC1
         qYqMUg9eFJJT6PkCDWIfn1XZP0t6A2O9pWVoW9Z1u0gW2fQhTXkI+QZ4w/H3dSmPOtSl
         Cr4IfRhDvTY697j/bGQG5GZrsMT2WO1C4c2ZrJ1GsLtc+4HlLY8TYyEtUPrtfW065jOA
         UynBNduUScoPHAo+AWH7riu6MmZEd/Yk2SewAI9V82rqvHuA5R06DLHKP5WllgM3FxOM
         iWnvWSMPc13WGIo1YzzyjGrF2lOAO4PGVWK5Sug5QJsHYAZ6v+kbN0k6U7imv1kaMb9Q
         U8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795515719; x=1796120519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rnfFR39jOljSCKlXU0eh7YNFyxUldaQ73vrFAVXf6mc=;
        b=w5QH87+vtyceSHys7zUGP0TQ8JLVa3ZQ+kETR9yHlRc8XZObkUwB8XsNRtzayKhl1q
         fwU69/epXRtRNP5mjWDL93Nuk+qLnYJsYxZ++FjxbOGpcm7vqrTRgM1lLQJ0f+2MNTAJ
         RD9rIjrUPBGpcGpqmkyft/41g4vEoXat8a9eT4cl3jkwkKlceJVrlrSLKa68nUMRzCkN
         mM1ojUzU6E85m/4mUajJbfYdvY48SNfs3110gcF09/Er8JgPldC2r5pdmm+7qckUGzGM
         AEBKMGnmzLdFWAbzSC5RHe95yu8akNz8sBB/aB1ED8VjHZ6TsBG9VNP4giXQ97pSRu9R
         Qu+A==
X-Forwarded-Encrypted: i=1; AL+hErG8EKh47zS0sYtFwfCFguf0rUc6kswIXqyjpCkzuyjOVELsr4w8PyqUD+akjceki+BR8TvVOSjxQTM1dNrl@vger.kernel.org
X-Gm-Message-State: APuU4Z8i/7mz/Z7afOohEWJcoj4WnpQKbbMFdSVBFb13Lg8Iq8v8qOnQ
	mpXzHG4hQqZbRbWsI+bXdK0uO4jOcusyEP7mt8MneRBBo+w/tN3qOjpeIfJJcrOsSCC8v0HWjDc
	8wdScERvIBqjw7bcy7Sd/gh5sLiT8i0BqazyGcfCH/aDH0t1JOf/bHtXk58iopHlrvoO42RqAHD
	EX5uyjeFthotCdYuAKe9yBdqWoDq4iyWf8jTwz4oAzWPc=
X-Gm-Gg: AZFdTZeLH+LsIwPvxlvtesBf61nNdXsZYNeU3pqIaLu3aZ/hES+nu2WRXX6VlUEaRG4
	fq+j2pxLknOlXnqKnZeAAaca5d4HIbBCVcqHJOe53/SAuqrJlu/ndebOIVI4dKPD9Qr4A1Cl4I6
	KiCpPKthCiKBqCmSsQuTMERMmj69MflaFnZg7NY86UQ1h0B58oJ2E0OAcE74qqZI/JIc7FQcqX+
	9okDq3uhbNTSTNP1K5ZX2svXCXI3JleO0hFIOX5p4FFqeIaCW5ZHu+bSSiPVoXvohUxPOPNqMY=
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr2412736685a.17.1795515719394;
        Tue, 24 Nov 2026 02:21:59 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id
 af79cd13be357-949ba9b8ee1mr2412733485a.17.1795515718861; Tue, 24 Nov 2026
 02:21:58 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com> <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
In-Reply-To: <68bf8d15-8ebe-4d19-8f77-f49ca0cb5488@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 11:21:48 +0100
X-Gm-Features: Aa3M54qBladabWaKAiUVgu7mNQ_hH4u1R6Ts0EudGSzaq5ubVgXuNh7aq7E1tyM
Message-ID: <CAFEp6-3U+X3gE_AMqn5G0MFFsdqxRGHV+u04iiBJ0RLA_Sb8Mg@mail.gmail.com>
Subject: Re: [PATCH 0/6] media: qcom: camss: Report the hardware SOF timestamp
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX6wv/gmGN2mYz
 C+sga4UVUD2PFCurfKrrBSmROgTBBZEkZE69HlnJxT1tHyfbVBaUIwu3odeqaawJUd58gZRGm4K
 1WhNfCjepoXZahC1UPNyO+cAKUwZRRw=
X-Proofpoint-GUID: Wu80lKv3Feu4GEvgvvxPVMd_pl7vwfok
X-Proofpoint-ORIG-GUID: Wu80lKv3Feu4GEvgvvxPVMd_pl7vwfok
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b056548 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NSeZ0p6lN-NMaJu6_AAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MCBTYWx0ZWRfX0ZnHzLNktDvB
 +PvjUkzOYkVZ3Td1UJUvsH3XmmwEf1IrR6Y+754rs+6xUUg0JCIsxPxdkATKIisVffcLBSJ4gqX
 t37EN5Jlz/k42nI7UJuW8Ki25HNMm4yNlx8CH225TiGzHCdNJIbokcgf3ABi/jWdRu/rA3laQLt
 AMY0y0I2B2QOWqMLg1w47sCQCTV1/djJDHQZQF3rXTvYyCqPMzaKh2Z1v6wowgOubCr2CQGhTNP
 6rmY+/z2YRdoriR/CiIrIz33xPE0NvTn/5M/EiyLfE4HQjS6OsX116eD7gM/0oVGr4umqGGOTmG
 VBA6C+lVMWKiA62Lp7shBVVUkteTwat2KyHAZMtBw4IojVGnRl/qRS1RxK2U5057411JNiMVwlq
 viWwPfCqHQqxp92njMruN7cqgvvAXvzFh4hOZzM9DlgFyJlBje/Qoy6MFsa8Qv8l4aT6KWoeV47
 dG5RMtItBpXKrpId3qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240040

On Tue, Nov 24, 2026 at 10:59=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 23/11/2026 17:16, Loic Poulain wrote:
> > The CAMSS CSID latches the ARM architected counter on every start of
> > frame. This series exposes that time to userspace, both through the
> > V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.
> >
> > Until now both were taken when the interrupt was handled, or worse, whe=
n
> > the frame had finished being written out to memory, which is about a
> > frame period late. The hardware value is free of interrupt latency and
> > is directly comparable with CLOCK_MONOTONIC, so it can be correlated
> > with other timestamped data such as IMU samples.
> >
> > Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
> > having the core take it. Patch 2 passes the SOF time down to the common
> > CSID event helper and adds the counter to CLOCK_MONOTONIC conversion.
> > Patches 3 to 5 read the registers on csid-340 and csid-gen2. Patch 6
> > uses the same time to stamp the captured buffers.
> >
> > Patches 4 and 5 are picked from the timestamp support Bryan shared
> > earlier, with patch 5 adapted to use the conversion helper added in
> > patch 2 rather than its own.
> >
> > Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> > Bryan O'Donoghue (2):
> >        media: camss: Define timestamp registers for csid-gen2
> >        media: camss: csid-gen2: Report the hardware SOF timestamp
> >
> > Loic Poulain (4):
> >        media: v4l2-event: Allow drivers to provide the event timestamp
> >        media: qcom: camss: csid: Pass the SOF time to csid_sof_event()
> >        media: qcom: camss: csid-340: Report the hardware SOF timestamp
> >        media: qcom: camss: Timestamp buffers at start of frame
> So I was offlining this change and kind of left it at comments I
> received to make the type of timestamp selectable on a per-buffer basis.
>
> IDK if that's really required for a first pass but, its where my own
> reviews were left at that time.

I can imagine this being useful in some scenarios, but today the
timestamp source is configured per queue, and there is no userspace
API to select or switch between timestamp source flags AFIK. So I
would consider support for that to be out of scope for this series.

>
> ---
> bod
