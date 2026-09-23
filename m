Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE87394EBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 15:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175835; cv=pass; b=gWuxa5V5siSM54VEKQJ24fsTzsXvwwZjXp1+nQ8jXVSCLpfiOYnInkdNbcSJZbUi04i1YwwipfUd0E+tIY4/cVHN8055MSDJEi+aqh+FI5MokQO07NXP8e3/hpdjIWtpskRi3WkQz3AOo27Xc1YzxaEJutWhqYp0NY0DeK5sRus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175835; c=relaxed/simple;
	bh=QI54wB1ZRIPwwHHM35cUuk4h5p328r5xKjYJPlaPtMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4WpXZ6+PWtvEN9tHez+TGtQweyGe7IYHY5v3iGbPsQhAOfGY9XB6p/THYUMp634VdIYKRRb55ELlHLZ+0lH8D7kN9KhhbjEWG9dK1Ep/eJXxnjcR4NKjBHDrs5WiUsuc00vpr1/pG3aQOwTQnL7ZeJpPQkr1L0GvP2gh9Zofzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEl3D4b/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBF7HmFL; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEl3D4b/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBF7HmFL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbVXt2443367
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 15:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=; b=DEl3D4b/MaQwai3J
	Rc+Ru+AqBDlYi16WsBv2QLOrZss1Lb1ZCPQaal+Sle+OwKskQ+snUYVyT+yNJ01A
	F0EN9a3fIwy+dh6RNxn0j0O97M3Ghajsv9xbNbmZIefIpu6tVOh518WaktBrsTao
	6oeuHsh2TUYpTtNu8TvZJ06p0huj0qVwZHVOIFqNXV2mYmroJ2YVyYD+mNDEY2PI
	WEpk+pNxxufNYo7Oc+PmbtPBI5IaQRShwKSfQVexsbeZpIm5nyFeain6juIhH9OA
	hY3neNnzwcAqrav+o2rbpDeQqiwC+IhDhfPEydTnYmOV0kgpTGZ/E/Bxmx4bY0uz
	XWNVLg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7hf08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 15:03:51 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e768af628so820558241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 08:03:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175830; cv=none;
        d=google.com; s=arc-20260327;
        b=eNsM38tdaUJVJvDmmOQW8pUcinn80aama+bC2hy9nlhknyZ5DU2F45+mDw4sHBnzwb
         dgAzZrZIlpLAVJusexU0AzLjY/coUWOLFjlreEoRHD2HvAS1+0UzvJi1Uutby1jnNbcR
         SDH0L3eViTHiRnNEf8s/8OA8LsmOZ5FIMafMKyNXICSHKAR9zuNat54gPUaPvBKVhTsn
         Wgar5QTrjYcjwAnRIBE+iAhFcJ3aJ0tToeGPv/2RyJIQqfERJxK33+Q/P6KmlsmGfiYU
         vMON3tbvQibMbg2GyalYJUQbFu29KcFXEya7IsnvS8XeY44Xho7sl7U1Y8tfc/4ZLBmW
         JDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        fh=3/tdzkwb//MBRs+bNWFk1CpaQXtNJntQbLKavQBgwU8=;
        b=A/V0nW87QyeULtlqy4s0wzAJFjxecwTkfD+28obU1QfX8DpU1ezb6VZ43Te5DQ6Ose
         C9+fZmxTUoEqSQyWI4P0fcX9QR+VZ7RvbDc8krB08f0t93QT9IQhyz2eCyncbyQY1dm7
         8bmHgnwvyFP/I6EJMOLIHvnV9/uCbUmAQZ/NM8f261Pi3/z3UMWBUvmX20bnwD//sCS+
         TSjyvCW5IdcPibjn7dIAfdJQflwPg89wyLW5aow/NbJCoB8Eg2T6WCP1QGXf4d/TEp8p
         QqGrQfXViXtsv0I4aCbHiBcw11FNMgd6mkdgjcq+Vz7bPKKu+CGS7Y0oHvf5DvyUEF0m
         J5ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790175830; x=1790780630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        b=YBF7HmFLoLt9wb9ovBAKGcbCe1sK6Inl2TvkMT4HFvH0FlMwe2g1WS9m1uwoJNUQpb
         BBobsGcKl1RF/WfZ34wdXzeIeE6pRDuzRXDaR2+dlGLbCzRCw2DO3ZycN547W59IrJ9I
         qknpHmnruLWrbs940qIT5sdcwnBywQ03JcoC28s0+j55ExG748/KhMBQ6QwetK6pZK/a
         TAt3JIS2u99z1vhqh9yZrPyFz+j5oHU9qilf5BqI0A+IFbeh0iz8oSjf/SwT/BEBmkJS
         RTHvcu4xLf+B9TSp0/MYSlgnXsI/VtI2ZaLSY9ZRpbR8CnEYuttp9oC1oj/hfCC8q7Kk
         z64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175830; x=1790780630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PeU2gEC3LoYHxgoHpBg+aDS+BEleaPfi9f+JiK36Js=;
        b=O3xnUTAxm0miYlIw8ShZOzDhHf4G1GsQvRCE0/ZX826q3mAU2LqxHxMSEDvw69zLZq
         qNPaD0YKTRsIhaGoH2sg/vZ0Sje82TCchFuu3EdUr383FDOI7ADVBVb1DPjRyflVyQmN
         B4wvD7pBOSeBrvv/3guJA/rjlriN42fRHzEmIiTtOYcrSYsL8PrunuaJcsntXl8yziVr
         Pbe+DwoyE5fT5pL0AbXCJuxOr0ZwTlRFHg7bf0rcGgv2aYncBpFFS5LInkJmUKeN4idV
         BqBNnpDLm8/tx7EhIEV8W7P7c8sdtD8NGz9+jJdtfi/sAC+xbkfnRXoxmZWwSM9ANF1Y
         Q9dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzh/cJ2TUYz6NGT2bcHGBIcrZVfX67FFeR3ubrHrXpA8LtCBnjhgKqNQdxXUiVPkJ1LOp7PZrp/jqJ3try9@vger.kernel.org
X-Gm-Message-State: AFuF++n13l1KWmwYeYzLHLVUXOF3/GinyEotXx9GZhS+gxIxpOP7nXuj
	Ih0RVkopBEpXT7Jo/pHP0vFHnLj+b2sqIyp9euYQgud57x1fhSnAdaBmp5dKq9XTYyKRWUMg9W/
	KSNcsphEmGgd89fSIImVznTpN/B4UkAICzG5ITzp7WwAeRAb+P8LanCa7GvMKCWvy/MUxtKPY7d
	RdTsGOHYGGZDysTI3Hu5bW00HSc4H3cF0bZFcNSrDMHn0=
X-Gm-Gg: AYBFou2Nw7OdJvsFGREoE5nnhobTih7RXzMb1JNssBOLWXMQc4k9rcGh1wx7FGqLz3c
	qJd7VxZIRUrKDuH5G7PoSrxEZSOUGR6pTJFJbZArxha9CnDc5clMBubgvqMrvVfQ2jyvQIMFf2X
	JfO+taco/sH9SFBke+k8FN2Q1VPfkpwRaOYbvOtpz4ar74/4/KilY9i91eCQ==
X-Received: by 2002:a05:6102:5488:b0:7a5:e455:182f with SMTP id ada2fe7eead31-7ac1cfb78f8mr2788535137.26.1790175830189;
        Wed, 23 Sep 2026 08:03:50 -0700 (PDT)
X-Received: by 2002:a05:6102:5488:b0:7a5:e455:182f with SMTP id
 ada2fe7eead31-7ac1cfb78f8mr2788466137.26.1790175829576; Wed, 23 Sep 2026
 08:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-qrtr-multi-ep-v2-0-27dd80d841a0@oss.qualcomm.com>
 <20260921-qrtr-multi-ep-v2-2-27dd80d841a0@oss.qualcomm.com>
 <a16d507e-17f7-4074-8817-4b8da3a71c3b@oss.qualcomm.com> <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
In-Reply-To: <8ed398ba-2ebe-488a-a213-8ca7ecbe861d@app.fastmail.com>
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:03:38 +0100
X-Gm-Features: AcwNN1Ug9EBugFkjb8PX3BJuksaN57IKAVy35yQBrKwT5dMg_Iz0UHaPN9Wobrw
Message-ID: <CANyhwx0hZJC6xXaSC2g4GFgUOp5n_KN4tdXksW+s8Mk_+7xEAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] net: qrtr: Assign unique node id for MHI endpoints
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ZYy7QOis_wUWoHVwTUCMQZMX6_HnDXAc
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab3ea57 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=astPFzNtX3-rckHXrNEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX2vtJb3708t7K
 JjM1C6cGp9brO+vhPeUJCb7x6EH5lSb4Uj2ZOdLXTi7FmWfkNjftUQnPKvNl9cZZoUKJLMLdQYV
 HcjIr4su4NKIjS8i2fBLMjYdMMJX/B2mxX4Z3CL6NgdQbHZm6zxgyp9uyehVLAjsNwvVXG136fP
 B1pD1YpjMCWXT2JpSbCqUW57j07ryw5MlS2eLFmFq8iFjp3hmbmDVz0ow1Wr9QMnUG/qu6u9Kd6
 XNtOI0qiX2f5VJ0VOO5ZV6+aB4Z2X0XdpGkG/wx7elpZzf1nYrTQyDKll4HHwM7R7j8b9FdXyk6
 19BhiPzoZLZrYGJWdypg0CmwWcN2hmEVPM5qP7u7uKYMaPywg6VniHJXMIqf4WONy8lllOt7iyZ
 /3ZNzrCuayp3nKauogFBI4s41EBy/Wv19lbUSGEFP9E6fc2ghPfmTdW8Qmh72t2MqVhPGNHm1H2
 D8tYyhxtuwVa39Xt71Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OSBTYWx0ZWRfX0Z31Xc4wTj40
 JrMLcW3wUr+QuNCPoW3dtQ0QOhopavKPNlBMYIe5VztFmrFJ2H8q5hQb6Rq6e+Y6Itpk0Oi+nbq
 G6wpZ/klgXYnq7jUcZElva0AeOX7wo0=
X-Proofpoint-GUID: ZYy7QOis_wUWoHVwTUCMQZMX6_HnDXAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230059

On Tue, Sep 22, 2026 at 6:24=E2=80=AFPM Juha-Matti Tilli
<juha-matti.tilli@iki.fi> wrote:
>
> On Tue, Sep 22, 2026, at 20:14, Youssef Samir wrote:
> > On 9/21/2026 12:23 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > +
> > > +/* The offset is chosen carefully to not collide with the node ids a=
llocated by
> > > + * the remote nodes. All the remote nodes use node ids in range 0 to=
 0xffff.
> > This assumption does not hold up for QRTR V1 headers where the node ids=
 are 32bit.
> > QAIC devices use BHI_SERIALNUM as the node ID, and it is definitely lar=
ger than
> > 0xFFFF.> + */
>
> Does that mean we have to go back to my endpoint id patchset?  It's an
> option, but a quite complex one.
I'm not sure. Last time I tested the endpoint ID series was its v5 and it w=
as
functionally acceptable, and other than switching to sendmsg(2) instead of
send(2) and sendto(2), it did not require much changing on the user-space
side. But as you mentioned, it was/is complex compared to this one.
>
> However, what is the likelihood that serial number would clash with
> these host node id values? Maybe just adjusting the comment could be
> acceptable.
The chance of collision is slim, but still not impossible.
I think a solution would be to treat qrtr_host_node_id(idx) as the
preferred id, not
the one that will actually be assigned to the node. And before
assigning the nid,
we check it against the radix tree, and if it exists, we try to probe
the next available
id (so an IDA). This will also require exposing the nid to the user in
sysfs (i.e. /sys/bus/mhi/devices/mhix/mhix_IPCR/nid).

Thanks,
Youssef
