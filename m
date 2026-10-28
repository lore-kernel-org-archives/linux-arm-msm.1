Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170874;
	b=EizUZae40kAqmHeFDmX95dKB67fkWq5q/875cKtbWVQvIKr4+aPpytct9sH4/2jV4I66
	 o6aKNzevW4Khms0hiFuBl/n5QKHQ/myD8CUEoohFps8jpEv/HRwbr6boQFqLkeJp4TIJy
	 EONhCXobH+ebJhJp7Kl+ouma2VxuwC1Qwbz2dylTOfm6uAeNIx/OXediN5EBft4gLhGDn
	 Rn6IJtAwRewEDFuG05omMbcJ9UbYB+CenIa7Z+pitqhb8nFOk1wuAVk2j22dkGv1SQPYJ
	 KBmd/ytP8uza8id2Qua91453xGR1buMznHJYUGerJBxm+ooZOXhQKGMd6ESR7n1Tw9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9FRLt4KkgBqQmPMg3ZZXr2HUI1ClBesmUd+I8ZCER5Y=;
	b=1oKKNRRjet0igt/O0lkVfuuE5xq8hTTitQy++H2hkdYKDXlz9A5UaHl/WkNR8/jCdPOD
	 V8AYJBhoV4jvhYNvqGsimlVm33k5w2aDSRjQNT5HaAkBuwtk7DO8e74Hi+YIt4NOFabTt
	 p70465dKef1V8cPOTmehFS/i7NgGqGzP8JzkPLisO/j3jDmoOAtmt3p3kX0heF7gQTyJz
	 9TmkbVGq4X/YBB5/X7KHCzuK3vi8A+uZbBcUrIvisuYzskR2sIXddfwQRvuBNG5xIgaSx
	 3Ff/APD74dLsccAbwxH6phbIRsmJjGCwYKI89ocm6UWYLmIY5cAhDgcqzG+FfNw2yew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMCCRajk;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFKCs+4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F2E606A31E
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79F2E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMCCRajk;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFKCs+4
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4Q9Be2753510
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:01:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9FRLt4KkgBqQmPMg3ZZXr2HU
	I1ClBesmUd+I8ZCER5Y=; b=bMCCRajk2UoRkhg8aXgnGRd+nW6cHI7/NdezcXN1
	i/3hIm8UScGeG672kUThb3GHCLW89tQUVl3CzzVlev56VQWRDqn6gnahOn6wgV2O
	iUS1OJbejQ5ubyD1SVEGNUiiP7zrcZq2r+r8cTOv540LGfu9FXHSlv8kaGaKqG8h
	5XPrHsznLMKr6BuTqbtEEc4EDFpTxAeEX16GcI8tEa9bfd6HlNZpOvWQuaFc3/5r
	Ivt9b6Vgmj5wHvZvvj3743i5v/8sW6H5xqKbeFuz68zlut9T8kK4+0ARcLUHhsJw
	qACxliQO+65d7cu8oALQPbCvmgz5QvbN/vKNEDWgRpL/EA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy712xqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:01:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so951860b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 00:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793170867; x=1793775667; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9FRLt4KkgBqQmPMg3ZZXr2HUI1ClBesmUd+I8ZCER5Y=;
        b=dpFKCs+4taeJuOLFx3tM1RPWZSrtvL2wq8/ILE2FliNJDKR4rnkAQ6/BYJVcnS/4Hr
         jNNJ8hJwGx5+ggQdODJGbX2NWHM6IhzcMb3kvLv7p/g+9wul9pfAL/df2cHQvj+zJsva
         np8vyK5CCOI/BfSaYC4ojRMn5SByAYJesVjzOrLGFIyKJXh7tpSDNTrUU6dXiOH++9DD
         2wkMuKwKecxwuSf0n+rwCRfA6Oo/PQlcumhi5HdIQTeWaNWQ2KMEGHyNTmuhMSgweKUf
         2WPWp//FL1BZSCL1fcbJ9AI5SsZaXN+txkkiMaxAWWoFxnDubRUDh9iufm4UHtJVWGFq
         GoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793170867; x=1793775667;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FRLt4KkgBqQmPMg3ZZXr2HUI1ClBesmUd+I8ZCER5Y=;
        b=Jc/r8NcyIy8DaAGylfAnosThKLBQkcsTC6Z10xzXSUtjq1w/3O2WpdEBusvr/6F/Sz
         kDUO+HRdoxij5mZ3/1NUsMFqRqlu647LE8wHdzan6QTpq0sKFp6x4IINEahkNKDwGbOX
         UxdK64YvhUtE5vRLX+JrbgpaaNh4AQ8w5CaBa2i5n4lCqgS8Gv6myUBPA3Uz/oMnzNpw
         nNKT1reSp1CtOlWMaXrWkHk0lZM8KksuCt2xJGsUyl1+Z1tUEAQrfwKp2xKpexE3MkKl
         j846Xqpu+4meNpvz3ZXDBp3lDcQhuvuNuVnXQsXh8QULG4tKEfc0WWvqEYL5AZlA6M3S
         eQWA==
X-Forwarded-Encrypted: i=1; AKwUvBzXw4vknQr/b45kXohadIv/Qi7ngHmQWjMaciUFFzxiLh0Il9W89LAB3ZW9MrAikJHJr2Bl9gt7v1Mnczts@vger.kernel.org
X-Gm-Message-State: AFq9FYKe5nLJbwi5lNg9M0QHP6FqVXDL7flZKaf4VdATPCVgSbR8Qjry
	ThbIbgbGPexosXcoOvCeC+wbIrs4ZVJkN6mQ3y0OJRRw8YAG76KHBEQQozTi+NhCgEmWcRxtxMZ
	x++wcPepRw/P2js9fABdoCx2UhhY0/mA1reVfQPImHFZkIJrxIBX6BMeaXSo3+qNGmk9c
X-Gm-Gg: AYBFou2sSr7f8GFPPEbzTJ8iIoQAhmiHydbLGBVs1Ej/DD5RT86EYlb4sQvTku8nS9U
	xyc2bg8Tj9n6mwkI/mJ4osPocw3d/1rdk5voag5+97X4V0yC9qs5lh1h5116crqwK8mkdCgZv2v
	+kSahrYFB1bGa28RexzaPBOKWc9vZrlwipAWqn3mZAxUowxdbwtAzblQOuxRkxuEu4e30h/YfLW
	kOEb8hogmRsOVaqRYnFvgej0mZ9PVbtQz7XtJ+2Zpv0arP5KT+HRhMxb8kZRP/UlTvUOIy9I+ct
	A95DfMVP39Ek/GQvMxcv+KGoktMZKZdYJqTXlyeOuHrLtJ4+ZXgqXwj6RqwY8T8YjOq7ZPjQG9t
	+gFjNpfF+zFKMFK9Xae8cWxxgr48HRsuN5IA17JdsoJ7sNV3hL1PyJGSvavGTMvYrOrf/E/375l
	AQvAKuR4tPiIXLBHA=
X-Received: by 2002:a05:6a00:997:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8a6e80b67edmr1121110b3a.39.1793170867376;
        Wed, 28 Oct 2026 00:01:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:997:b0:8a5:7006:1ecf with SMTP id d2e1a72fcca58-8a6e80b67edmr1121090b3a.39.1793170866899;
        Wed, 28 Oct 2026 00:01:06 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662ba00sm759515b3a.23.2026.10.28.00.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:01:06 -0700 (PDT)
Date: Wed, 28 Oct 2026 15:01:01 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 3/4] gpio: shared-proxy: Drive the default value when
 no votes are cast
Message-ID: <auGdrYC_mZeJft0q@QCOM-aGQu4IUr3Y>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
 <20261017043605.1503563-4-shengchao.guo@oss.qualcomm.com>
 <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McoAYKHojJCT6yeTvsMLKDTisD3V42VH5ebRapuG-UGBg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfX2srJ0PGbi7h+
 VRub2Rc6Tr2KjMT6oVDx7kH9/wCQ3zJb8a4DoB9+9tYV70ri4duYHCi/pmFc7zz7ILFMjZflW6j
 yZQD7VXaqRwZHe7OOw+kDvr+xpjK7sKCfV9jJ0TNZs5JSndGHcaqwpCj1aTrrXLHRo6LfxA3ABq
 SW7+85LoLyYSudK2tG/mUU2Hg6v5A/btxUfBqK6VDsGXo6RZMYHvEtvkG9CBZxek6aEfGJ8ZJNg
 bD025n4UxaOllRrWIAwd5fAIy6K+XOol+oPgcd5pwe90DCTB7hFAR0tlOG2eoe9vrJQtWLtKEP/
 FfASsVB3G+EoGNJNF6xgzlodOfWDHfy75nb/NJxQUQPuL2pZzbEDpk1/z/Jy2kyJqObSYyucmlT
 Pc+HV0XZvqtf7Upm5L5QVV0WJlz1leGO88tOtiqfWmB3kwlQLX3oPYEnDALY9WrJtrT0Bkv5G16
 O1bpMx16IOV+uwdxUHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfXyGgJzUtIkMPd
 gFgKVhOZ6n5jSPKLepC/3xXC09ya80Ifi6bX/bl270PPFZ7bluVGORsaYH0EwwS7VNjqRYS7Tbv
 v+1xXkMmruGOz8NXI1ByCUVuwMFWQck=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae19db4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-atq8JDSDYGcsakhjvoA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: v3wjNK7DgHbKCxE_nm64ie_GQ2ocSS9n
X-Proofpoint-ORIG-GUID: v3wjNK7DgHbKCxE_nm64ie_GQ2ocSS9n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280027

On Tue, Oct 20, 2026 at 09:17:00AM -0400, Bartosz Golaszewski wrote:
> On Sat, 17 Oct 2026 06:36:04 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > A consumer that requests a shared line with GPIOD_ASIS never calls
> > direction_output(), so def_val keeps its initial value of 0. If the
> > line was left high, for instance by the bootloader, a later
> > gpiod_set_value(0) from that consumer matches def_val and the proxy
> > treats it as withdrawing a vote it never cast. It returns success
> > without writing the hardware, and the line stays high.
> >
> > The consumer has no way to tell. Its request to drive the line low is
> > silently ignored until it first votes for high and then withdraws
> > that vote.
> >
> > When the requested value is the default and no votes are
> > outstanding, write it to the hardware instead of returning early.
> > For lines configured via direction_output() this is a redundant
> > write of the value the line already has. With votes outstanding the
> > request remains a no-op, as the line must stay at the voted value.
> >
> 
> Wouldn't this only matter for a line requested as-is? We could avoid the
> redundant write if we only did it for such lines instead of for all
> unconditionally.

It also matters for a line configured via direction_output(), after
patch 2. When a proxy releases the line and restoring the default value
fails, gpio_shared_proxy_free() still drops its vote. The line is then
at the non-default value with votecnt == 0, so "no votes outstanding"
no longer implies "line is at the default" either way. The unconditional
write lets any remaining user that sets the default bring the line back.
Gating it on as-is lines would leave it stuck there.

The proxy also has no direct notion of as-is; it would need a flag in
gpio_shared_desc tracking whether def_val has ever been written to the
hardware, set and cleared in the init paths of direction_output() and
direction_input().

The write itself is cheap and rare: it only happens when a proxy that
hasn't voted sets the default while no votes are outstanding.

If you still prefer the gating, I can do that in v5 and keep the
free-failure case recoverable some other way. Otherwise I'll add the
reasoning above to the commit message.

Shawn
