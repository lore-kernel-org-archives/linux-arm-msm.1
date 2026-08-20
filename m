Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF89A3B776A
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787212414; cv=pass; b=TpsPt7Y7pSG2whd5POmo+GJykCQpY2mCvkvb8N7FVZYVWxkhC6gRoA0GNRT2tRsnwqiZdsm0BDwUcHsimiAfOtA3mb4m9SdHYxT1nPiBo4QzouX9LKZZAsvxZ1OZBu7mppzcI91/kOpEi2ogacDJggDPTZkTPgXNKL1EhOTJeS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787212414; c=relaxed/simple;
	bh=VizCQBMinCKZIQeApvAF6NKWz5JoYNftX3ZAIOL7fhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WHN1UhWYBmUEOmleqF0L8kF+VkeeelxvrhH5WXG/Xmp4sp4IqJzcgy8s6LTAbnhCJBbrrG2SaUMo43aTAsGmXhm2POKbCc/JMXEE4/iSgwp5LTYITmt1T8ByLE+dhMScGZeYzOhMIolsdb1ywmXrr9X7MCNfllk0wcluI+o/0FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZZOokSdG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXKD6r9J; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZZOokSdG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXKD6r9J"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K6Y0es1457562
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFbnnm4raDpYfoL8OuEtYJHYVYy0rI+rPAw5Nwnr2Z4=; b=ZZOokSdGz9PXRdKd
	DzK0rlxpdP7idjxiUtsLZtjzuKZ2kILyIjaLuZX8I0iRtL+EiKlRUJQX+/4er8Ez
	V52yzVYo3BimJ9BIpdl+J1VnJqczrDR18n0StWuaeGsyjCQT3NIaQItz5/gHyIP/
	T6aN80BZzup5BDqDRF+QolqZAiwwtglXjzGggUxen0r/MSPAx38gHSjBCRsdLzkA
	4FBxjHMUerzn+mG4SdDjfaY7A4iNTt0Gaez0m0uuL9SynDWbuHrCUgl1KhWZMxPr
	iSN0SFW8UHaAW6njiIxrSHIOv1sxQsnhZJKEI1taW1vz+4xx6etM/aqlXjgr/rBZ
	CYGPSQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es4br75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:53:31 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8461ade272bso25182017b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 00:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787212411; cv=none;
        d=google.com; s=arc-20260327;
        b=MpFWrJcKItYwFK9JuOe5+EmYTZYmObhaOqJAfWYLZnS3xPOmftJMCZLRpu3yMAvewX
         xDYXSnKGDaYG8T56qDj/fbtCCueJhEBc+AihQQV0nYip14KRnXxbXdAWcHONwC/IgWnQ
         EBS6y6LF2HxbrFTq0XV+1iixAUhOBuNjA7AvpLXGn6DNS47EPrUbpk4wTwMSGr1Ig57V
         UzPc/6sfOUfau/qdW3e0gnjVOmduDUIUfCYzyCe9d0bDZGOgvRnE3xXkOXGLqort+6YV
         cHAqcVjvUR7TG0pnEO4TYZuWyYPhThGBFjxbQha3EURFG/LxFi2kI9qOd8dLGe9NEza9
         yf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cFbnnm4raDpYfoL8OuEtYJHYVYy0rI+rPAw5Nwnr2Z4=;
        fh=+6NpQoJncbWd2YyqsMTadmyIxECqefhl11gAOpOmSk8=;
        b=JKYqAA9qsV2Wl8EtQqWa3PI9oSwJWzLgn4ympHD1KetyCLgLsQFz2XYYtzOUaRK97B
         KxwRELTgg2fc2rrdIC/P38XaVfQXqQ78Ew0nk5aTKDVfnZ3+dqqqSujQbBDMyvuvnvN8
         50S26h339bDhzR4b7KHdhYBy6aJwlSSNV6tnBJhMoI0VCvtxCt5n8rkMONx1pYk6brGf
         z28YO14meTykNbNKlFU8J3NwTEYBgM5BVjE3Qg6mPxQrJFnLs3VI1cveDgsquASaBuor
         sg3CUdYYQtcKvmrQJk4RPcbSoxRSQQqT/Xu58AGbs9BWt9qH+eX/0xfoIYnbY10U9o1I
         gWCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787212411; x=1787817211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cFbnnm4raDpYfoL8OuEtYJHYVYy0rI+rPAw5Nwnr2Z4=;
        b=hXKD6r9Jjlb5/sxsx99K2oXI0pbit68PBjwuyGGPXomwpVYBt3MbntY/F/T5gLFwSk
         kvUsZ4begdSwD1FN7J5pN5utiRYNedr/xacx7Su9mVZJXy1+EN9cUu+Srj/+jiDqMnPB
         5RRTaENXJ1HHJT3LlsZ/7JLaIotaPLPPvTPSa2gNMCmRv0A7RSeDWFdMapNdw0pm7zjo
         GYdFA4eyMDPh/H4d3PpY0kORu0JBSWQJqBUGMUDaI7sBHEA5sbVvjJTMa9BZHyOEVE1U
         6RKeLj1/eGlnyqZ9G3n50qOXIuUyHt1Cl6p7yukgGm53DSDTKAqu9CqZJRKzUzX6Jpua
         qm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787212411; x=1787817211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFbnnm4raDpYfoL8OuEtYJHYVYy0rI+rPAw5Nwnr2Z4=;
        b=a/s54EPQ1p8LwVJfBE96/66Z8TJVBU8RTSRbNFvWGWmGXfQsSkTMy2Lq/ifk9NkVBr
         07NNib2hvb/QYZ1Cn5FHboCFpYvzQZ1vQyMCokD3Tw2iO1caPmSzh8fnXfjJfH1n1dWD
         FmkD2u0mKDiu0vC4MnsxUI6SUP15fkFx9XHut7zB4c27qxwHPH7Bd9W+mcUxVKcQyWQb
         d5Al066Vwl5z3Z5c68l/wJ5mggKGV73QdpIDd07nyOq/WSXnMtQtDbXMdaVlAF9w+OSR
         6Nixdvo48LF+N67WwfSokz74zFJNNV90vgNh9kZKoqDb9u4T5VFmk69eSX4GrssddQJd
         QZ3g==
X-Forwarded-Encrypted: i=1; AHgh+RpfHoIfVWHuYzCDrPiDzMXwA2ZW9OFIPo3kicCWYDclYt/nch+PqzaIXw2mto3zie+x7qijbTouIHFJtrf0@vger.kernel.org
X-Gm-Message-State: AFuF++nFPx9qFGvy+mHCrENPV8lgkJyth4xbQlkupc+CjZBzd57PI9/X
	Dye1RZ378fiVV6Zr4Bv4t66SeXjVPNHbeVn1x1vciYGkvSN+a9rnu7ecDuBXvoJ8gofst2O9Nkj
	bEx0Zmqsnk03WncXfv3h1T5IHUErbRhAeQCozD/LA0SvNFMNpqgSlffJUCaXc150GAowwd3eVkk
	g+fbE5aAlz2XP9ddDWZShDBaFCWPRifskEFhanl4Qzp+s=
X-Gm-Gg: AR+sD13JeDywp2JPlVlDX2saIQNxNhnyEfQtyWTd6l8vf7FR6MKKwnScSmqcNeZbELL
	KJeJbMeqd/93NhMhpLIQZmUg/yTqH19ZLvdG7dchZNsDQbS5ROfxcGRMryU1CSw8vPzmc5hhoZu
	HuzvDzpksiVZRWiLeKVwU9/hHmeFdGKnvYRtCpiLc4mtD371I9OaKoTd4=
X-Received: by 2002:a05:690c:e3eb:b0:7ef:9fd9:db07 with SMTP id 00721157ae682-84709aa04a4mr17040607b3.12.1787212411206;
        Thu, 20 Aug 2026 00:53:31 -0700 (PDT)
X-Received: by 2002:a05:690c:e3eb:b0:7ef:9fd9:db07 with SMTP id
 00721157ae682-84709aa04a4mr17040497b3.12.1787212410850; Thu, 20 Aug 2026
 00:53:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9f11db59-5245-4bd5-afbb-485500d37675@oss.qualcomm.com> <CAO8wpHw-J_A8bDL1MPnhXtVKSR1O4HCXbox1-eq2of5GU2wYKg@mail.gmail.com>
In-Reply-To: <CAO8wpHw-J_A8bDL1MPnhXtVKSR1O4HCXbox1-eq2of5GU2wYKg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 09:53:19 +0200
X-Gm-Features: AcwNN1WsQ0YZ2JNZ1554gZN_8x9NVrq_O0lG8VkVS503IOlCZjsrxm2QL5Gk708
Message-ID: <CAGgiveXZWSHDsKj1s3dHAhsBAOHgn_Pm_YrwM=u6SwwYUQGTPA@mail.gmail.com>
Subject: Re: Re: [PATCH] tee: qcomtee: fix kernel-doc warnings
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        sumit.garg@kernel.org, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: s-_5Uynb5ejnpkp0lyJ53vIDzkjvzI3-
X-Authority-Analysis: v=2.4 cv=PZXPQChd c=1 sm=1 tr=0 ts=6a86b27b cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=tO4S_OtGMeP9oHhStmEA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1NiBTYWx0ZWRfX6NTaQQ9cYSl+
 jEvuYGqanFUv0vcvbBj8n1DZBDVBxnuL1SDGa3Mn/GteSPJGap0qUkfKiYsTFfiAHmthT9+GF20
 I0O30c7VcKA8kCFdjTcQHIQ51bJrK7k=
X-Proofpoint-GUID: s-_5Uynb5ejnpkp0lyJ53vIDzkjvzI3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1NiBTYWx0ZWRfX928US4vjNly1
 Vnw1ADLlaZmacITIgulWS2srHBbPY9wGLuPRZOgnF6LfZNQfSxoetaUgHCpTqTlQ/wYYdNq7ljH
 yqG8tK13p5Pl2jxi754eT/pAH8DVcO64wztqxWFTBHQW4DMnM0y/xxYKt7KnW/UXQFE0GS17jPG
 1c52G9/CwoR7T0W7BqlfXDD4RqH3tP0SvKamVziwbN6ZAbxw5l8zkeanofRG/epFCmZlyV+8LVO
 PluSIF85OxM/vP93dk3wVAZuG3tSkWkIPzFLPNZfTkrvw7bMOXT5lNWO4NPjHy94qOZVMRkv43y
 60DNeCpr3qfEPeqehj6eNbAreLDaqLodsSydwFAB0AMojWAFr4nqGJhlG3JkfBUeLqnC1UGSkTM
 jf4KB92gEbvb1yFee4gSmf4PPQRdtPbM3G8nXXTJRBF/Fc9eSuCfOk9lYoJkOBRepcW14S2c1Gg
 n1wKqDrQ9theAWUXTIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200056

Hi Babanpreet,

Thanks for the ping.

On Tue, Aug 18, 2026 at 5:38=E2=80=AFAM Babanpreet Singh
<bbnpreetsingh@gmail.com> wrote:
>
> Hi Jens,
>
> Gentle ping. Amirreza reviewed this a couple of weeks back =E2=80=94 is t=
here
> anything you need from me before it can be picked up?
>
> Thanks,
> Babanpreet
>
> On Mon, Aug 03, 2026 08:49 PM, Amirreza Zarrabi <amirreza.zarrabi@oss.qua=
lcomm.com> wrote:
>>
>> Hi Babanpreet,
>>
>> Thanks.
>>
>> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
>>
>> Amir
>>
>> On 8/2/2026 10:39 AM, Babanpreet Singh wrote:
>> > Fix kernel-doc issues present since the driver was added in commit
>> > d6e290837e50 ("tee: add Qualcomm TEE driver"):
>> >
>> > - async_release() documents its second parameter as @msg, but the
>> >   parameter is named async_msg (msg is a local variable);
>> > - struct qcomtee_msg_object_invoke documents member @ctx, but the
>> >   member is named cxt;
>> > - enum qcomtee_arg_type leaves QCOMTEE_ARG_TYPE_NR undescribed.
>> >
>> > The cxt spelling is part of the QTEE message format and is used
>> > throughout the driver; struct qcomtee_msg_callback in the same header
>> > already documents it as @cxt, so the comment is corrected rather than
>> > the member.
>> >
>> > No functional changes.
>> >
>> > Assisted-by: Claude:claude-opus-5 [kernel-doc]
>> > Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>

Since this is a fix, please add a proper fixes tag.

Thanks,
Jens

>> > ---
>> >  drivers/tee/qcomtee/async.c          | 4 ++--
>> >  drivers/tee/qcomtee/qcomtee_msg.h    | 2 +-
>> >  drivers/tee/qcomtee/qcomtee_object.h | 1 +
>> >  3 files changed, 4 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/drivers/tee/qcomtee/async.c b/drivers/tee/qcomtee/async.c
>> > index 31bff4309e672..5849e51612033 100644
>> > --- a/drivers/tee/qcomtee/async.c
>> > +++ b/drivers/tee/qcomtee/async.c
>> > @@ -97,10 +97,10 @@ static void qcomtee_get_async_buffer(struct qcomte=
e_object_invoke_ctx *oic,
>> >  /**
>> >   * async_release() - Process QTEE async release requests.
>> >   * @oic: context used for the current invocation.
>> > - * @msg: async message for object release.
>> > + * @async_msg: async message for object release.
>> >   * @size: size of the async buffer available.
>> >   *
>> > - * Return: Size of the outbound buffer used when processing @msg.
>> > + * Return: Size of the outbound buffer used when processing @async_ms=
g.
>> >   */
>> >  static size_t async_release(struct qcomtee_object_invoke_ctx *oic,
>> >                           struct qcomtee_async_msg_hdr *async_msg,
>> > diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/q=
comtee_msg.h
>> > index 878f70178a5b6..5d7b21fdd3688 100644
>> > --- a/drivers/tee/qcomtee/qcomtee_msg.h
>> > +++ b/drivers/tee/qcomtee/qcomtee_msg.h
>> > @@ -112,7 +112,7 @@ union qcomtee_msg_arg {
>> >
>> >  /**
>> >   * struct qcomtee_msg_object_invoke - Direct object invocation messag=
e.
>> > - * @ctx: object ID hosted in QTEE.
>> > + * @cxt: object ID hosted in QTEE.
>> >   * @op: operation for the object.
>> >   * @counts: number of different types of arguments in @args.
>> >   * @args: array of arguments.
>> > diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomte=
e/qcomtee_object.h
>> > index 8b4401ecad48c..d5de02dcef3b9 100644
>> > --- a/drivers/tee/qcomtee/qcomtee_object.h
>> > +++ b/drivers/tee/qcomtee/qcomtee_object.h
>> > @@ -74,6 +74,7 @@ enum qcomtee_object_type {
>> >   * @QCOMTEE_ARG_TYPE_OO: output object (OO).
>> >   * @QCOMTEE_ARG_TYPE_IB: input buffer (IB).
>> >   * @QCOMTEE_ARG_TYPE_IO: input object (IO).
>> > + * @QCOMTEE_ARG_TYPE_NR: number of argument types.
>> >   *
>> >   * Use the invalid type to specify the end of the argument array.
>> >   */
>>
