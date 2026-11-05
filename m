Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793875454;
	b=x8xgacNchX7/hDGTb0ROTKJRt/3nWgcrCRUdnQTh3VJvjinyjuUbTDo+Yj1/KBiU+XcJ
	 JiRrHVYepHVMIGRoDv5Fx9TmHal1UZy3e7xsGg/3Q7KFIzOjw+QCnmUcNKabIyqrgKaWi
	 VepewBf2DESqKDxTL/jWu292ZjFVaOcUhw/dQyz0+6q7Sv2Z/5RKul7db5Q9IVCDwRbxS
	 XM/LfDQhAqnr6fRo70Fvv9uogye/8bzY6OlQfK5Jf6oD58yu2zrEfEfUfKSOGOvtPEkkW
	 85BCn0Zr6/nEjtUl/HlZYo15ipVT/uj+HeKwuRRRZeC5lRBZ8MEst4pBuep82ACGxDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=;
	b=CNF/hMnjizEGMpXsTRMjuvCyfMem4xrFmA2vSRVcknxKG+CvgUtX6IJFkhpXL/SWU/+d
	 cSXkTR3S3X0c8JdOIeYHueFRlL6dzr5yRtMZnytUNW92vKimuHhTeOXbiGDsUlw/NdnJr
	 4Wi22Eb2p4bkCKZGHO+4gqUYRIlA+Z1MRLL0Q+fAX/QVGgA06uT886gXWf6vU2H0wHaix
	 y3Z7vPv62ODcXWP/wpJdhfGCJf168kU9kQRbcUPh0lyVy7Ley0f03oDT83sMVgRirL8k5
	 ORIN6ON03uObuihuMPp3u9sKbS703HUmBP/QpmfdrkMRdnhBbtztQ0e/6ulXn2fUtUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPGeVb7B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gG1PvT2i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEBB606D820
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DEBB606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iPGeVb7B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gG1PvT2i
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AhvDD1582934
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 10:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=; b=iPGeVb7BdAkbKkml
	kucWy2KtJOwJtWPRILOKbGgMeGzqd7HZsNS7MqkLvb2XsSsEh5l6QFeHhUO1H2qo
	DCqD41pSkVqlIdMB/ugOpvmTaC73582Qlc+J8uDncjYQrFnlibWZ8vYtZAixYRGJ
	ckEr+dBbOO+R8H30dJr7socVsuVNfG/+C33m/+OapZ+5P9NWsFO1SXrb6zyWliQw
	iXPyFoJxtpL7TKgpSV5Cq1dG454acXFP/Or7Un3hgN169Gaez6j4gZmKmskQo2uC
	ZahDH46LOf7UtvzGMFfG8pwTr2Ib3qzv10GHAdm4dpocvfUSFoKyVE4bYGnVr5Bb
	WOAygA==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraar01d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:44:12 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67bdee091feso2306403d50.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:44:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793875452; cv=none;
        d=google.com; s=arc-20260327;
        b=WfhfXclW/FHBbbnJFzFsni9u3NKsyrAzgGyMH4dNLBFTj39hwh7aePW6CGVbNO0ZZ9
         ClF7bi4UmeX73UETOmQjLP1vf3UurKCwjX5mnoG/j1PfCSdUXHOEekf42GP9IO5oGlk7
         MHyNNGSaRr1V665Cs/OyVxhmS4sF+G8jCq8kr41T9OLa3f/pUN/kxP/LQhCUbd66QMwZ
         NpNL7+8OXdAeb4S3eDIurl70+U39RrxQeoDVI0HWC/eLGlhjwgApBwEoGW1hx/lBg7TU
         RyikEQ1aJxL80XqTzvunrXeCc1ZlwyZOz/uwPKd1hQmGEeF0vjqnXGvJbFTNSoVLb1Rg
         pkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=;
        fh=6KdE8Zp+XtW8mgf3mWHf4XAPziAsFYYHhY4gxSYyQRI=;
        b=cx47xYRZa+DxwDzeAT+tdNYaOYnrLbwkaRLmVhx7iLkXkChtptAb3ZmIuCP3ymJzvg
         HmgezG3d9PYIidys6BoL36Nxvii8xgn1Q/3KDpyLtQe1j/0g365ro9VLs8vYjGPKKFuv
         lhPv8s7R6Spii8Tiz+XtCN02MIEntkxDefKE9sNof2ohd1ORvO5R8lyKo2oto75S1QOj
         HD+H19Dt3IpnUBGFJcUpWOyEG0aMbpNuEtGZ+wukrEoVAcgZuLpmcx9wj8wnUouGwfd0
         6qUfwW4sNaQoKMo6Pg6LloA8lyFWMrJ8o08xhFgq8NbZKZ2W8fdQjxZAukC+x1ldoQ91
         JBzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793875452; x=1794480252; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=;
        b=gG1PvT2ituBZDAgVvKFjCqgSy4ef3Qck55pb9CBqcFUjmGh/m+Bav2UnfWCtlNu0uj
         NfnsQ8q4rQRQ2jjhCR4pZJ7GYhc0HJo4ccGz5lKNMCbscMZNUU7BvPH6/nQfTmMkLPgp
         ijhkFrmmfXy+5SNElFq82x/04W7whFmcq5J1Awk4IhpK46gMuM0WeOJnt7LLCFfBSJud
         zuFTeHrKtZKhMrzuhcyS8g9qaKVoxMVcqI5SXO/1tpKhsKVZfmZI1eg/T0OI0cd8695a
         GMoFiY1vDScmGV2wnpBY2JkIdolmyYmSVyGm4HC77Ca1R7GH3F2svavKRuASj+K6M+W+
         ahug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793875452; x=1794480252;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xf5/vbep3X8hdJmcdG1lebyy2JgNR/ibl1SZ4lYtaMg=;
        b=urubq8MkWnxSatKgnqydRrp7b36DFVoH1G8i1NiqDqCtqcuASJvufY+Cb/vvN0EFrg
         zi8cNh+E0CgQ9Buivs8IAJywlQcINkdnyBumLdGcQvLH8OGi3ltMOpHeqRtPXdFfHNDI
         kIy1o93pzcn/2lFRp/RB6LXPhb953IYf+3m0KZ1riPk2gsJZYAtc81HJAwlWuEyumri6
         ovEqef6ZQBr8ToJC6VWXCiUl3MDN4abkDQ8u5teffc17MM80CZGrzTShoO7UtKeXquam
         LwdO5M6hX+GX0fzh/a4pXvJS9Mh4z6kVt0L5oAXAcaS755jWgwHIlJYzDy0ug3GT2XNW
         jZdg==
X-Forwarded-Encrypted: i=1; AKwUvBy9OmEnA/sBDvsvOrw+h1VVZ3EN4JHhc/iRXiTnydJndFVmI6fKccW0lIjry20qcOmsU7gQffX9h+c5G9T6@vger.kernel.org
X-Gm-Message-State: APuU4Z8znG5C3Ae7uJI0+uBnfKvq2iK21PYlr4FFVpRJonKjyn0MG4zg
	eJrIdaMwtPJ/2Pg0pf1C3zxAb4ZcN0SbplQGk7cAsDbINk13pcjL2KEvXsBxuEnrf0suM4i7pJy
	rICVDnNPB6hgZXlgTyHF49ig9bK1D7icupVWR/oAcEdStFgDvsyfzE29R+JgopZVLmn9ZzlXjYc
	n/hc3VmgLKSCMwZRSUc1Br4BQxEBQfujDQD/ba4KERB4pLztsv9Ea8GA==
X-Gm-Gg: AYBFou2B+6NjDFu600OUA9OQbZVVMUWm9uFMOmy+NRvnDczdOtyI4rrTaAvJ0upk8+0
	Q02qKtdwBHUCkxPYG3bBffhLbsA6obqmkW9NtRJbVArg8tjkO2eUgRvwO7ag2Z9I50aP82Bwh91
	KL+Y6mhIgN7k2b5HQ0UlzN2DrSO4CLUTtPR2vRjOa1g6iWh+F9DvILXIXNHlX2Ar3aEn1RoVZZJ
	QjZWGSXjVws0PzKksgx6+rz5DaGLDyHjU5j0Tpi
X-Received: by 2002:a05:690e:4145:b0:67c:a2c:8240 with SMTP id 956f58d0204a3-67c0a2c8545mr466490d50.78.1793875451497;
        Thu, 05 Nov 2026 02:44:11 -0800 (PST)
X-Received: by 2002:a05:690e:4145:b0:67c:a2c:8240 with SMTP id
 956f58d0204a3-67c0a2c8545mr466481d50.78.1793875451076; Thu, 05 Nov 2026
 02:44:11 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009-fix-tee-max-keys-v1-1-1462d96bf438@oss.qualcomm.com> <atYDodGDc3z6Qv4f@sumit-xelite>
In-Reply-To: <atYDodGDc3z6Qv4f@sumit-xelite>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:43:59 +0100
X-Gm-Features: AclHuK82I7GOQ461EBrvJUf4LJ_kffL5_IxDC54rT4pmONT0rZ70Os06qoD-B9o
Message-ID: <CAGgiveW5pqputgg6EcOCEGEVcBhyjrPUZ_8WKD656tWnw9sMcg@mail.gmail.com>
Subject: Re: [PATCH] tee: optee: allocate a bitmap for all valid notification keys
To: Sumit Garg <sumit.garg@kernel.org>
Cc: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Jens Wiklander <jenswi@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX4wzUcqM0lZEm
 8Vwq0GPGJmFb9NHz+oVUhGcQQ8OhZ4ylO0QaatuPAZtm8HWz07oANxTCTFchRS/uUBzEJcFVB85
 ofTbm4szAe9f+hfZpFy6XYQUI+ynNNc=
X-Proofpoint-ORIG-GUID: 5NQd2vk06JmvQgljBri59h6YIE4bDj5b
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec5dfc cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VaSOubSYdYwWsDXPSwkA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0MiBTYWx0ZWRfX1q0tfnU69AsI
 VpAqUCyTDLYIndpTN5DQHcuD3sd3+xhl8IrlKeUZxAupg4djZNunvjlTvzks29bPBekS93TAXHN
 obIBYN0URQKGmxQZ2DxU6KEcWXzrEmjj/KmTttvjUDXRij3tV8XRV5bD++Xhy9GXOOj4eVrdpar
 4DdKi1FEQjz7v5EKGnBCswQz/jANbZnytH5V1x9Twe8kJewTL4m3jGlWQV9GGPBkqv5GE/mhla9
 6qauYkxLZYPrmNuYVC0qjWF3G0i8CAsR5Gt52+ddvfCgkMfmeg47gxwO/iXItbV+cHj6FusvfuF
 xYdVx5EHeEI6N0jSrlORiDbKVBmLSxVF7XOICxR6R26x4W7x/BYwqdKWWk0WBvUiHQ3WlhdRofA
 p/fCjTeI5oxDGxXbFPC/NhCyOYLoOQuxcedvKghRK11/el5cMo+sUh47zmRL5ygaTnk2gu6gpmy
 /4ZaGPBLVnlIaAMUULA==
X-Proofpoint-GUID: 5NQd2vk06JmvQgljBri59h6YIE4bDj5b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050042

Hi,

On Mon, Oct 19, 2026 at 1:48=E2=80=AFPM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Fri, 09 Oct 2026 at 20:19:48 -0700, Amirreza Zarrabi wrote:
> >Notification keys are checked against an inclusive maximum, but
> >optee_notif_init() passes that maximum to bitmap_zalloc() as the number =
of
> >bits. The bitmap is therefore one bit short. When the maximum key is a
> >multiple of BITS_PER_LONG, accessing that key reads or writes beyond the
> >allocated bitmap. Word rounding masks the problem.
> >
> >Allocate max_key + 1 bits so that the highest valid key has storage.
> >
> >Fixes: 787c80cc7b22 ("optee: separate notification functions")
> >Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >---
> > drivers/tee/optee/notif.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

I'm picking this up.

Cheers,
Jens
