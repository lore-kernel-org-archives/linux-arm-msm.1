Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6DB41D12A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575885; cv=pass; b=VkcbyuGlQrkwfTdjlqxrOOHdROSD6M4i7OeiHu2UFM5UOvvUQt5sfV7Ygb2Lgg7254DDi94o0YEB+Ow6nyLRuoUFek9KLgPUWWuACgvtFRa7DO0OmvEgSZ+VaNNOtBnDKbKS5aGphwk1VTf5COtGAbL+D4MgDlevlNLuv4SRAEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575885; c=relaxed/simple;
	bh=MRCp/iw8wE2B9w30TdaLisJTUJfIFsAcvC9jhXMTH70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeSeMPkjH/kM2Zwl38jpteYq6ktuiYkpUtHC2O00IDtK79bG5jVUsR7LQum2zHYH0lr7cLdYaKlYP7f52HIboqfPMqJ5LsHRLJKb02G5VXQZ0OuVmB9tR18SVlTBXZRTGGkTrb5XwRf9foy7zwhTRnO07zELLuBaCXgLhoetFcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbtCRADG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXLAlzpM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbtCRADG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXLAlzpM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMVOl3869947
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zdlhyPB+0T9tyTIZYrYtjWEWS6fILmDEM3adz7/rjA=; b=ZbtCRADGk5fWNcjF
	r5g3aQCfTYrmynGbGVs6oM9x6mxS89DP8F8cfdoq3Lkxns+P0ABYkw4D98M/Prix
	k7Lf9ETOKuMGxrgbCVIuoPU27kB+7FRo6TpiUboY3PMAugNVoWYSsBCHubAPq2Jl
	9H1gbmGgvpYsh84rRNwOchp1TDurybn6JveQEP0zQB33GbAxvv3PN186zM06du5L
	TdGiFpY1swdTbWq6E7L6LXjt6+vdNLZi10bQE7qgbMRrAKLO8Cm8Gk3Th0UaS5Xr
	QFzqHgUwzSGrTBXpnaZt/6cB5jowYhQHZakyWUlmgMZAnmZ0w/vG1pxVg3MoNIij
	VgK1Kg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpjqwp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:51:23 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-80ee3cb097eso133881467b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:51:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787575882; cv=none;
        d=google.com; s=arc-20260327;
        b=Y28cIBj6TMnoiwd/nv4LDreMFE0eVKqh06L8/M3Wwo4el+4Ys8x12bL0B9ARMZww24
         SJVK1NwCc9uEdEI0IVrJpWUWxU4hUpWYlbkWpsYYGA1B9aa8fS52qt7WUTUz9NGWVzsT
         qiKMA6njTkHGvW7mQTLLEIsY7GdWLa539nb88hkpcm2Q4E+ffBcnoBv9jTAjjUm8ZgPC
         VVkDtEFJv/iHRdfXRAMfdgEfPsl4H+vNlfvsByxryQM9A1LeWnIIt20Mjzb9VYK/q9co
         jKgLcdIHjoEYrR1iaTNFrXmFx8oSudJlJRMc/QhOrZhd/S/GSSnmVxwjOMcZtsk6xbai
         nDLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7zdlhyPB+0T9tyTIZYrYtjWEWS6fILmDEM3adz7/rjA=;
        fh=g4MPQ2fGy6cATqN7fmIEIie19qQjGXIjjt/OyXPba0E=;
        b=KOJTUR2itJzksQEaDNANgEvX0qM6P3kfLZJrrIOwmD9NRGbKIqCP3k+cOxgxciUfyn
         gsvMF63EbmKqH0i5DcmQfWeK9xg75p56Wd8sToB44buwGtdez2TWkbc+gFOSp5rrE4Nf
         T5pPIdUzBpK1N2yGc0VGEhZ8BVa5wf/GPgFt6XqbP0Px4foOux3+KtPpb4W8PS7x5AO+
         tUN+FFYHbc9jTucZcbGty50/AKuNvRmiqraJGsgGA9HWy3nrdeRNx7bOAmJVBcjrbUpn
         n2v+y6DcJdmAnwmWiUHmkmWcZLy/XaYFBoXfKqslVjGouEiyOtvBVixuiwkQ7qzxo+g3
         /Qhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787575882; x=1788180682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7zdlhyPB+0T9tyTIZYrYtjWEWS6fILmDEM3adz7/rjA=;
        b=YXLAlzpMazegEIk2dUJvelkf9/526o+Y9iJprJVEBOBAqXBd/v+37mccD0HGkvp4mx
         EtfMZYb6OcOOq68OMDx+ghFYCpaChglJAJl+vDoNUkdPztn67BMb/bP301DPiPv7a52Z
         XPvRrPk/O+OmwcYW99RvlQ41fFouHPW7Wk4wKhvZ0e2GSWDi6ZjpQqLsR7G2/KUgpdcz
         H5DovF54yJSWDMbpBeZVUT4w4HOJWMGtbSSAq58qQbB9JhNsu2eUtAnSCqNqc6AqwFH1
         6Y3Q1zTBKzjJQ1QAcqO/kJw2LAOzuSh2DRGrYrRQ8O76mRnMG0zsXmUBe+0gVDq5UvOU
         t4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575882; x=1788180682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7zdlhyPB+0T9tyTIZYrYtjWEWS6fILmDEM3adz7/rjA=;
        b=OjtQPXcDMYJyAjwSOM7FLNP2rf3VIFNZPdDipYkwzVpf5jH+aNxvs9XwxSwXfAHd6S
         Fi1HH2V4jX2a4ZRnISbDLc8+xDKMCny5hgWyXTAxq4gg6N7skHrLkOZQF2yQulbu2wfj
         3lmXxBbCTn2eQumHANBMZ+BRkLj0EKAEHn9kSdY5FPAdsG94AXMdipDPWSZeYQ+Q/HzO
         10uGvrLZWINCl4pYYFm/QGU8xx8tORJP+JoE0gQ+5f2ZFKZGNs/23+lD+PXUbURqvZzW
         nw7MvgZQZT2EofX6jzq9TPZ0Oa3boeIGWGMKVWOGcfCzedhvwZ8FvPc3mlzfVEUM7T2o
         VJ/w==
X-Forwarded-Encrypted: i=1; AHgh+Rp0x8R7RSItJq14v8Fqf7eXYoxtEOhyLMJh4LyRE5DpB/aNlP8sP8CyQVrSH8GGs3gVninOTR75eW81ug1b@vger.kernel.org
X-Gm-Message-State: AFuF++nRkqa+gEKjlHaxuBW6OngGLWI6d8Gm4ujA00K4w0g1wX7BiGIP
	DHB+9vgVeWsQ8K6te6zIB0OPCqNPb87zaaRH85ASUo275E7mgwwLQ4aZQHUalqsiaVfpb9OtZVU
	hEVG/1o2WDhZtx89GhExSSXpsqdf5VPNu22f2vRr1akEQx1dTTmof5dqdWZ+ks6qbPKekmylyc1
	9jLdnPp754i/Rp4k7OR/MMrALm5jNa0RX5a8qygRFckZo=
X-Gm-Gg: AR+sD12jFRSxkJ8E8Mgn6xAzH5Va4pH5jLn/cg3Lr+oVh9BSJoEmm6ovCoVwStyUkYQ
	g/NKjjZfNnS4kA5ydMblNvtuvS7Ry+cgt8Lg7IdR9zgzS/knPJrPYr/Ik0xCYXa7mcA9ewQLzqg
	BASdmcykfQMMfTd4YP18Fr00vfyzXki0oqc35lrk4MTpyuY/494wDQQlM=
X-Received: by 2002:a05:690c:c61a:b0:809:fd83:a88b with SMTP id 00721157ae682-849f090e374mr78995087b3.3.1787575882074;
        Mon, 24 Aug 2026 05:51:22 -0700 (PDT)
X-Received: by 2002:a05:690c:c61a:b0:809:fd83:a88b with SMTP id
 00721157ae682-849f090e374mr78994937b3.3.1787575881693; Mon, 24 Aug 2026
 05:51:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821050323.7-1-bbnpreetsingh@gmail.com>
In-Reply-To: <20260821050323.7-1-bbnpreetsingh@gmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:51:10 +0200
X-Gm-Features: AcwNN1V4PshiiKIUyDSTIxOQsIORugsRoWhfH2-7v0PaoIo7LMNZJgUIXGC6GXs
Message-ID: <CAGgiveVhaDdh994HP42=kFEvt5=111QdW5Xzi0CWCe=kat5tQw@mail.gmail.com>
Subject: Re: [PATCH v2] tee: qcomtee: fix kernel-doc warnings
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwOCBTYWx0ZWRfX133t7/txjNGi
 g5sjsA5XNXwPGV85KClQEoc6F+IFIt1FUzq+34hAAl4nOieEdYX4nXrJ/bSxZKtfbRMEE3q1G21
 gFHVKfHRO5ywkv+uUGdjKotcLvLIwx0577Sr1nub8GYakVJgZqs2IcbvBwd6V6abmMvhus95uMv
 SyN13CuENj/0guDVx6wQJaRzZA4D+DEVnbf7fWAQx8H0X40qzzOLEW6/CrgSIE/21BCpekgwx7E
 UhZUzElBElJVSefGB3Tov2/rq5biTNPSTEU9O3xPLClnecYS3KvbzI+pM1+AQrWQky4gOw63YyT
 TFkID37hiLvlt7ym78kH7nJnM7o6XlBlnWd5BiPk01dhCOw71TBWE5woavaMHyanPLh/FVy2Ozz
 F30mwlg9SBUdL47xcYABbOundHsS5xRu1ytfHPY6VlLCaqsvNzzHRHlN8jS3H0isQyGshBH3DkX
 Ti5WI95AvAaUryRqv8Q==
X-Proofpoint-GUID: hdirbtoK0n8qttXX83BGfUThSIsbL4gZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwOCBTYWx0ZWRfX7gcwgRaMz8vj
 CKlV0bUlOEI5kfq7d68U5pwN6rozQQLKrG9wfv+k5G34MXLovX5CcU9uexxnrsf+7UcRvibsJCx
 Dm7XIFBmJjU5hSNCmjvotMAbRe/vLso=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c3e4b cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=QUIpP33jrTxAYBKIOcMA:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: hdirbtoK0n8qttXX83BGfUThSIsbL4gZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240108

Hi,

On Fri, Aug 21, 2026 at 7:03=E2=80=AFAM Babanpreet Singh
<bbnpreetsingh@gmail.com> wrote:
>
> Fix kernel-doc issues present since the driver was added in commit
> d6e290837e50 ("tee: add Qualcomm TEE driver"):
>
> - async_release() documents its second parameter as @msg, but the
>   parameter is named async_msg (msg is a local variable);
> - struct qcomtee_msg_object_invoke documents member @ctx, but the
>   member is named cxt;
> - enum qcomtee_arg_type leaves QCOMTEE_ARG_TYPE_NR undescribed.
>
> The cxt spelling is part of the QTEE message format and is used
> throughout the driver; struct qcomtee_msg_callback in the same header
> already documents it as @cxt, so the comment is corrected rather than
> the member.
>
> No functional changes.
>
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-5 [kernel-doc]
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
> ---
> v2:
> - add the Fixes tag Jens asked for; no code changes
> - pick up Amirreza's Reviewed-by
>
> v1: https://lore.kernel.org/all/20260802003956.7-1-bbnpreetsingh@gmail.co=
m/
>
>  drivers/tee/qcomtee/async.c          | 4 ++--
>  drivers/tee/qcomtee/qcomtee_msg.h    | 2 +-
>  drivers/tee/qcomtee/qcomtee_object.h | 1 +
>  3 files changed, 4 insertions(+), 3 deletions(-)

Looks good. I'm picking this up.

Cheers,
Jens

>
> diff --git a/drivers/tee/qcomtee/async.c b/drivers/tee/qcomtee/async.c
> index 31bff4309e672..5849e51612033 100644
> --- a/drivers/tee/qcomtee/async.c
> +++ b/drivers/tee/qcomtee/async.c
> @@ -97,10 +97,10 @@ static void qcomtee_get_async_buffer(struct qcomtee_o=
bject_invoke_ctx *oic,
>  /**
>   * async_release() - Process QTEE async release requests.
>   * @oic: context used for the current invocation.
> - * @msg: async message for object release.
> + * @async_msg: async message for object release.
>   * @size: size of the async buffer available.
>   *
> - * Return: Size of the outbound buffer used when processing @msg.
> + * Return: Size of the outbound buffer used when processing @async_msg.
>   */
>  static size_t async_release(struct qcomtee_object_invoke_ctx *oic,
>                             struct qcomtee_async_msg_hdr *async_msg,
> diff --git a/drivers/tee/qcomtee/qcomtee_msg.h b/drivers/tee/qcomtee/qcom=
tee_msg.h
> index 878f70178a5b6..5d7b21fdd3688 100644
> --- a/drivers/tee/qcomtee/qcomtee_msg.h
> +++ b/drivers/tee/qcomtee/qcomtee_msg.h
> @@ -112,7 +112,7 @@ union qcomtee_msg_arg {
>
>  /**
>   * struct qcomtee_msg_object_invoke - Direct object invocation message.
> - * @ctx: object ID hosted in QTEE.
> + * @cxt: object ID hosted in QTEE.
>   * @op: operation for the object.
>   * @counts: number of different types of arguments in @args.
>   * @args: array of arguments.
> diff --git a/drivers/tee/qcomtee/qcomtee_object.h b/drivers/tee/qcomtee/q=
comtee_object.h
> index 8b4401ecad48c..d5de02dcef3b9 100644
> --- a/drivers/tee/qcomtee/qcomtee_object.h
> +++ b/drivers/tee/qcomtee/qcomtee_object.h
> @@ -74,6 +74,7 @@ enum qcomtee_object_type {
>   * @QCOMTEE_ARG_TYPE_OO: output object (OO).
>   * @QCOMTEE_ARG_TYPE_IB: input buffer (IB).
>   * @QCOMTEE_ARG_TYPE_IO: input object (IO).
> + * @QCOMTEE_ARG_TYPE_NR: number of argument types.
>   *
>   * Use the invalid type to specify the end of the argument array.
>   */
>
> base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
> --
> 2.43.0
>
