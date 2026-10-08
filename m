Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279AD3C09E7
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 06:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440132; cv=pass; b=KXxTbkG7p38HRf7n6Eazox8LdpWUH0j1pDyz+shEfnGtSBaqIZq+iqemkYUP8YvNrO39GGfkGqG41SHXTU+SJ72J2toN7/uo7JBNRPtkF6pzoMqVDqs63mYJK1KONnvGNj/53GkkvxfFPMRA70W7s4bIImMXnyYCjnV0ahgnX7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440132; c=relaxed/simple;
	bh=e3MUK5mLoJWucj7GyFl4ivsM4yVN/NwLBo+kC/yeKZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4pmeYvUXS/PnthKIeTHE2Je950y2+d8TkVFdNoKW9QF2qKQ6jDWkQY+WLG5x2sNBGf2Ge4nLfM+67aliAtB/Ug0ZXrrezwEVt4anLlpprvEYIeGwuY7VWALY8yizUBTIZxZ+CEyRCaruCOK6OzJfYbor20lqhVqMhQrm5q2IDI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INS536GR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D/lLZUOe; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INS536GR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D/lLZUOe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984CE1Z2147113
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 06:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQPAWZepEqBkyCXjjaXrcNi/jWE54i2O+AUc1+MHBYY=; b=INS536GRqXgAyLEv
	LXBkqnEE6CLJX5tPvxB/ATYuK87GnsHHOm42VV/lFWu1MectcBvxMG7qlQx+uq/r
	Rgrx8MJJdy3yZkb9LuEgUPblFU28n+BpMQiFObFIG0NWNb80v8wfUW18Uh5sCPl7
	PEt3rQBll2kWsCuqyIXQHBn/jrqFqxGuQliMfhQkgUQlf2lkcMg4UKAPZUOQjJB1
	WAKJLI83F7Ko7gHA2OwwSO82iQU/F/kWQF4XZlXhwrPY1pRaTHj5osCgOqHInTgq
	iao0ZXO1hn+3l6Cj04JvpJOfjH/Voq05l+C1UJEav7/NHP7J0rbedfyfFJzF1xUc
	nuNerA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe81cc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 06:15:29 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-675b7770f79so6792905d50.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 23:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791440129; cv=none;
        d=google.com; s=arc-20260327;
        b=RKzN28PcY/URnwkIqgMPDylWBCUzgPHt/137jmGYcTxeC/FJ+XVAW7Yqb8WMZj3fo1
         jZx4pIlvO+1AB6yfTEMX8+3uJXJ+gonZYThnQOYHFqpH414WhDkB7a8rAM1I88GDr6VR
         SxAjgWBDSZDm+S2Ob5qDuMZJub2Zl9AGop3MW15PnSB0qRmIUxG5y2lAixeQ0kLlSzCR
         Q+FANondYmm1SbRbfZoYGW3mqpKlBzJJpmocyRKFRGjZ9tf7ZErA8rYA+CtV4qYIiuh6
         20Qcvg9UXI3a+tboBg2v84heYm0q9k2kRji76rxaZgj3/y616MmsaStgbQ6jCAAPYDcC
         Hvwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xQPAWZepEqBkyCXjjaXrcNi/jWE54i2O+AUc1+MHBYY=;
        fh=ezZUDwzVN+f46La9loNve8qltYOq+IoW1NPKOiApCss=;
        b=Woxq3JLcMbTh7qIQH4QYHqeo93x1EFN3jxP0nkga12/sbRHy1SSbLJk6SQSWYqk6tU
         FMjidfrVYindGaQcLj1LdQy/efTtQA9/6SdEI1o37wrcEd4figiLvW4TGWDh2t9oSjR8
         0IWS9E9cXMfvORXIzatzvV9lhLptsJkiMTJyNXqZILOsSDgLITGUhJPHhz2m/QeP3ExF
         x4NpDjo9I3ERTBA2SWHi4ZLHTUsK4n9V9DdqYuT25V1Sr33xuOyZf9aUzWYy17zlzBg4
         YKQiTNP9WoE29L9fQDfIddSwSgmnk77+n0Uu9U3wi4ih6dybe816vAtAfDkQCjmlKr+O
         3Alw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791440129; x=1792044929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQPAWZepEqBkyCXjjaXrcNi/jWE54i2O+AUc1+MHBYY=;
        b=D/lLZUOevFKlcjx08fFQ8+NL5ccAFOWL9W29VGUnykiCgmjlu7iJj8ZLYrBawUA+KA
         vbZ4plaa5x9691q/9+ykJhItqDMHHRQMgI0SyMkgcuDbZVbCQUXxa7G7PA25dZW3rXzS
         DxvXljd2J1MTLHZpVLkYWd37Z1lwS6Me1KBgYq2t5wx1UifqgYcQYDMxx0xnIXUvnXyV
         E04mHreDhkWeUf4uKMndAgiVJdcJPu1M2BGZi88L/kGeUmsvZ+QVhwNE5Tf9gcheNNSx
         XTi57cS+nOLFX4dky8wTyx/vIyoKlQn6UGFY+AC1ZMaYp8sw1CtWDP+W0nv+2pW/uExU
         /Uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440129; x=1792044929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQPAWZepEqBkyCXjjaXrcNi/jWE54i2O+AUc1+MHBYY=;
        b=hO5DqgTcd0eemfoAJ3bHSOH9WwZZLic1w8320lzzuso8uokpBwNSmvAxHP6ozj691v
         IEb61EmPR2Ii89wh8eCHpYwf6p4OJKfvXBb3zGiMd1hQmwq/nsnbO/sCfPeg1lnHKH6U
         jghLWNt+ZMC7O372fyogADqd6Z9hScbyc6h6vJmW6whFhGTdRLQAL+DRT2Erf0wse+Df
         hkkt3T2PaJTZWuXPzxhUhF/CwSX1ziA6ESmRbZ+Pk1ZGBW+Zugg75sgz/nrAi1sEBVS9
         QtBBdWSAJxH9RdUTHnYzOZhzXkX0fB9qd0v2Dlnm2805G8s4MDbaaQwcCo68y+FagQ9p
         5zkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZFnWkXLHFrFXqpBanUDA8q2hA45Wcjk/OlCA2k6H6aIVz8YxB47ZDOjCDg0TyzP3LwYPPGgy4cf1udS4h@vger.kernel.org
X-Gm-Message-State: AFq9FYLMOyBshLPvM49kH6sOr0Z9d3CsG/lI9WbDmSJWwuX1Lkzq0EyH
	fr1G6dAukWmONi3JNgWLGO7v0f5c1oExhgrA+I7IdzUEJXsVV1iC4fYWrVZG/4oOpe6rEI9V0ko
	uU5e5UY/7vMOeVCotYq08r816cfnX+337o1k6OwBvBoJbE8VvLJhhYKlFeDSeshIosRwAtXfqhS
	AesdtLtvsE/T86rUacXg9dS0O5YgWd+N9vwaFFbwOcBqU=
X-Gm-Gg: AYBFou2cRTko+YDUrncgNJ8elNBbUtXOx+qeicBJiwPDe9mJT7DDD1W/f7bnR5W8BGk
	SAyXd1qxgy7Kk+YkkLqW9i7pRerivGHqnhRokemzTiYycGjfzPt2WWm+l4eCHFbFDm5dYjDRoow
	fbW6sE/nLedpLE/ZhS9chyZjdJC2goBosNn3JWMunWY1n9hvvQtqLsDDA=
X-Received: by 2002:a05:690e:dc6:b0:673:1df3:86b2 with SMTP id 956f58d0204a3-6790a355225mr2466158d50.66.1791440129070;
        Wed, 07 Oct 2026 23:15:29 -0700 (PDT)
X-Received: by 2002:a05:690e:dc6:b0:673:1df3:86b2 with SMTP id
 956f58d0204a3-6790a355225mr2466145d50.66.1791440128574; Wed, 07 Oct 2026
 23:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 08:15:15 +0200
X-Gm-Features: AclHuK82G-aF0C4QrmEtOvpam9RmR-zAfqfbN8QwUZKZhMnDhKts1Wbg9cYmunk
Message-ID: <CAGgiveXJXXaRNyfq6Gxk4moOHqM-vBuptugn5bHK5x9EeeGSQA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/8] tee: optee: add RPMI backend support on RISC-V
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfX07jxS23wGzU+
 l1fWHmTUglpps7o0MQssiI4oxaJS0AFR6LjBKeVaWRNYbzHR2EcDWEFKM7HBAqMzSMQ3gnPrfhC
 XRxVr5i7sgptkdAt03imju4EhQmoevIQPg2JZmVPJ0vsnQnYPGOTxcwm8RTEg9JzNGr0gODkB5s
 GyRkoQGlBRahq2XCwIWRBJq6NGbGD3Tr14IpQW1I6nI46ePFWlO1w55/j1959IyObC0m8Yy7CJm
 eSlh4WbH0iIBC+4amWXre25IIVrziUe10XaQgBv7/rTaxh3wXasfdruxe95YMnbKFMkYKe3CkFc
 n3kuD2pN2YUDS45iThkX2uPd/bIF1CNYHpEMjSqT5rWpOKcyROHDtilFbFKp2w+F1u7j/59I4yP
 b0aFc10HCdZXUjITMs61o2jZVnjKHXCZ+15Yk6Zrp85KTrf4Il/trq8uwadJiazWYP6VGBbVECL
 +D5n4Gz1wUYHDFx09cQ==
X-Proofpoint-GUID: F6JTswveEs26HGEnrL1Q5cHOqyTtVSu8
X-Proofpoint-ORIG-GUID: F6JTswveEs26HGEnrL1Q5cHOqyTtVSu8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNCBTYWx0ZWRfXyYIIiuAM3pTi
 fMb3x4VqHszKOHuuG9WqBy5y4gmVOj6YDr6aIUbFKMwbLK5fB4Z6wg0aDyKyBYcJA8ytynwzzcc
 PCtVemsuLXXx0jq01X4bGP2HqLvB3N8=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac73501 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=etr3aXc5xdJg75Mw1ecA:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080024

Hi Amir,

On Tue, Oct 6, 2026 at 2:39=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> This series adds an RPMI backend to the OP-TEE driver for RISC-V.
> It builds on the separately posted RPMI TEE transport series [1],
> which provides service discovery, synchronous calls, memory parcels
> and asynchronous signals.
>
> This revision is effectively a full rewrite of the original RFC.
> The generic RPMI transport has been separated from the OP-TEE backend,
> and the backend has been reworked around the service bus and a new
> OP-TEE control ABI.
>
> Unlike v1, the OP-TEE backend no longer manages SBI MPXY mailbox
> channels or implements RPMI TEE service-group operations directly.
> It binds to the OP-TEE service UUID on the RPMI TEE bus and uses the
> transport's public operations. No additional OP-TEE device-tree node
> is required.
>
> The backend reuses the common OP-TEE session, shared-memory, argument
> cache, call queue and RPC infrastructure. Shared memory is represented
> by RPMI parcel IDs and nonces. Yielding calls pass command and RPC
> buffer ranges within a parcel and resume suspended execution using
> an opaque token returned by OP-TEE.
>
> The OP-TEE control ABI uses fixed-width little-endian messages carried
> in TEE_CALL payloads rather than reproducing FF-A's register-based
> message layout. Asynchronous notifications use an allocated TEE-to-REE
> signal as a bottom-half doorbell, while ordinary logical notifications
> continue through the common RPC path.
>
> Matching OP-TEE OS support for this ABI has not yet been implemented.
> This remains an RFC for review of the backend integration and the
> Linux-to-OP-TEE protocol.
>
> [1] RPMI TEE transport dependency:
> https://lore.kernel.org/op-tee/20260928-riscv-rpmi-tee-abi-v1-0-04908b81d=
885@oss.qualcomm.com/
>
> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> ---
> Changes in v2:
> - Effectively rewrite the backend around the separately posted RPMI
>   TEE transport and a new OP-TEE control ABI.
> - Remove backend-owned per-hart mailbox channels and the OP-TEE-specific
>   device-tree binding.
> - Replace the register-like control payload with fixed-width messages,
>   explicit command/RPC buffer ranges and opaque resume tokens.
> - Add a parcel-reference parameter layout carrying the parcel ID,
>   nonce, and 64-bit offset and size without changing parameter size.
> - Make argument-offset support part of the baseline ABI and retain
>   the common shared argument cache.
> - Use a transport-allocated signal for asynchronous bottom-half
>   notifications.
> - Link to v1: https://lore.kernel.org/r/20260912-rpmi-tee-service-grp-dev=
-v1-0-1d1d35c2a859@oss.qualcomm.com
>
> ---
> Amirreza Zarrabi (8):
>       tee: optee: allow RPMI transport builds on RISC-V
>       tee: optee: define the RPMI control and parcel-reference ABI
>       tee: optee: add RPMI shared-memory and parameter support
>       tee: optee: add RPMI dynamic shared-memory pool
>       tee: optee: add RPMI RPC handling
>       tee: optee: execute yielding RPMI calls
>       tee: optee: bind RPMI services and negotiate backend capabilities
>       tee: optee: support RPMI asynchronous notification doorbells
>
>  drivers/tee/Kconfig               |    3 +-
>  drivers/tee/optee/Kconfig         |    3 +-
>  drivers/tee/optee/Makefile        |    1 +
>  drivers/tee/optee/call.c          |    2 +
>  drivers/tee/optee/core.c          |   10 +-
>  drivers/tee/optee/optee_msg.h     |   38 +-
>  drivers/tee/optee/optee_private.h |   54 +-
>  drivers/tee/optee/optee_rpmi.h    |  234 ++++++++
>  drivers/tee/optee/rpmi_abi.c      | 1059 +++++++++++++++++++++++++++++++=
++++++
>  9 files changed, 1389 insertions(+), 15 deletions(-)

The rpmi changes in the optee driver harmonize quite well with the
rest of the driver, but there are two things I'd like fixed:
- avoid <linux/cleanup.h> macros. They are distracting.
- use rc for the trivial int ERRNO values.

I would be great with a QEMU-based end-to-end prototype to demonstrate
that the ABI works.

More comments to come in the individual patches.

Cheers,
Jens
