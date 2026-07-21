Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600343546EE
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622314; cv=none; b=dbUcSTd6zwx6OIX6pJ8NUUJxqW/T7AZwaJIuMLhswLSgALrmXwMGkJCeQkTnKDxFQh07Nqd8VoYox5MFn4Gd/Hv9yKXZNSVhh4aQMFJCckLPIu3RaF98YW3qHc7pj63wlw/33s5Zpp5Mtq8rgCxyjysjJosiRM5GioNDScDBAZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622314; c=relaxed/simple;
	bh=zfTn2Kc9WqhfDc14tF4xKypbGNJXvuqTxtRlcOWMzUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pbWKsljvpunY9JPmd+jc8JIWlRoWuVHIa46pNbtNbvmZzHAumYR2CLNhKBIj6dMzcJoaKmxk0kQaeiXK52rosXlmrjuDJ6l/sdsQkx7EiAoJ+oCH5rE3saR9FwpCtZ/26t/lLO+MrnuS3K+RuyUhisuS8I+/xvHfbwCJXXbNZ8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCrU7rNE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu99pYuy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCrU7rNE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu99pYuy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6J1e6045338
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZOpXARkKmNj
	6Eb4RGQZtpa8uRlFLKJu52rmjCAOrvGE=; b=gCrU7rNESdBaziZfASg/j/KEnMQ
	sdlPBSIT5NYy8W/vsKm1PIHRQOoaN1kZx+0mOp3sFJgxqa9gnVQ0+LjRX/x8uzcN
	C4ZwgcgIDNI1+mIUyfLz+6J/yhejv6Elal4j7p/vmpumcaIPWtLNfXMI+Vm7QjOd
	4DeNvwp5dVK98Axqbt91dTcWJcT3r/slntjW+4llujsAcm4OQphLHGyvD7/T13Gp
	EDs4bp8O4wcyswzyNF7j7ifD03hESYOfCokjbvfLYXdz4w9+sD7iVhu4HBkqmVOW
	vXI6NoEScJ2l4LZPJBUggIzVUavw7yWejaIGwva49mQJ6bKPhHA455WGdRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5u6nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:25:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0ab07320so157855791cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784622312; x=1785227112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOpXARkKmNj6Eb4RGQZtpa8uRlFLKJu52rmjCAOrvGE=;
        b=Gu99pYuyEsMxBehhb3NWGlTOGLEssUTWN2AbHLBOyw5gGLLi0UMeDILYydFfMaueLO
         h5dTcW3gTkiUZWIMNO0kKkwL+rMzN9Rx2MrHvQKh6jLdKYBAQjxBjGGxqOjDCDjswkh3
         T5FcBRMYQJuQJOtI3EC3WhGGBmCLCQ+jnT9bXLqeBn6cvDGSReYDES9iatbghd1kSH6A
         vN21pzUTCgA+Md0PjdilJgpfJKbkt3nfOB8sf8sWsnAqb20Xtb1qb5gVkjF7B8BsEI+O
         HhdxjRtA3dINOoeKGSmqsvS2fxLT9k/SUKGY0Tp+dk9NJJgP8kkvLTlG+2APXJfGJ0Uq
         6P3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784622312; x=1785227112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOpXARkKmNj6Eb4RGQZtpa8uRlFLKJu52rmjCAOrvGE=;
        b=ZEgM95V0dko4PXG51p+iYgxwV5UXia385m1Fu3YUxeEhP/ludD+Y59vRSebXeR6fNm
         QZqmzPIZHj1ogNv/8XBjmAwFHsmVSXAsiBYarJqqAdexr2a+m03OK5yTfAwqwu4BSqpQ
         sGjYrfHcXCAtHLyNfjv/GNhr0kKhXqM6AmkiyM5oag3SSAsI2c5oVN3biN3STAVaxKgF
         Thwc5rxjtT+bJgcRHZ9DZu4locvwb/6NVT6Ulxc4psFw4K3qyFAWo6hco0vnSYdolS/0
         5eblpe82EysYGeMPUSWj9ptLB31HjnSpVIZCRSqVOOlTNYsD1ErW27WGOPUf5PsAFIqB
         VIAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rowa2rO8jF6vFHhQslnOidh6vgOLPJWbHgzUUMwRAAi66dSKA3G/eYe/HlDVyclUs1Tqoa0IBJ4GSEjMVGY@vger.kernel.org
X-Gm-Message-State: AOJu0YzG9N6ECEyWshwhsfECag2qBHiIPxPb5AjgIQzJWKbBHb6n66BL
	tIA1W592FaaMIMxzwJDz4ABCfHd7T2Wny1GH+E00dJQci3edyO/TiULDXBX+78uO0llHeuB7a7P
	YYgfabZ3poX2HiCKpZ7Q790HkZT5WmrXBnnERm02pA8w3Qh/htPtlFIIJB8w9XA2XrlRj
X-Gm-Gg: AfdE7clo67O7nmeCV8myjkJrgDFroqbl9YwS7obco/6d/4jTnq/eq0qqLonk/j5UaBh
	9Bv8FupzzdnGVuBmmEZZksgY8Mh09NRyUzXZgUIx1HaRKWs5U9cL4e1StSQFuwkQJTyONNFEZ9O
	xKHK7nhR/CN4oe2D8mBusp5jLiSLbdOSVtwf9eE4+0OfU14FFgUDPBJGZqP+jByXAhyz7yNi8cz
	8jZ7MvI2H83kLgv3Gn/6Sv4/97I51TYl30zHRVUCDt1u0MbrG+Sd9jrQ/IJAAo69/QUhfUvyQer
	mFG+XpN9m1UjGxC6rNe4Kn81dz68OZi+7wYdpe+faO87fo6TwsK4jUmJYp6U05JR3DziZVKI4kE
	/7GBA8OHwoGTBC55QSh2fkuTsgXyG
X-Received: by 2002:ac8:5d13:0:b0:51c:bb79:a52d with SMTP id d75a77b69052e-5213aa6d813mr166970881cf.14.1784622311573;
        Tue, 21 Jul 2026 01:25:11 -0700 (PDT)
X-Received: by 2002:ac8:5d13:0:b0:51c:bb79:a52d with SMTP id d75a77b69052e-5213aa6d813mr166970631cf.14.1784622310894;
        Tue, 21 Jul 2026 01:25:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm39901054f8f.21.2026.07.21.01.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:25:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        demiobenour@gmail.com, Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, brgl@kernel.org
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
Date: Tue, 21 Jul 2026 10:24:58 +0200
Message-ID: <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <alnlaCXmoLRAlr96@gondor.apana.org.au>
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com> <alnlaCXmoLRAlr96@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX86tWmvVNhcXI
 C2kebnIXG/aYwClrqnrqUfbr0VZPRjbSvSlWtrdJDkFg8U9QZ/7Gy0aDQKr9Fi0EWK6nofF6AZy
 5LX1rdltS5VZ+smc+Ac40Z0166LJ6Bp7JqMxM8em3IqqXNvW90BTn7X7/VgWkYsRFpVLUUv3Ea3
 Fac3XIIzODXGpjG7trkVSej76enj/wnm2OGtKFtjj55JXS8UheXuRnxRQlWG+TGtukqxU2GDvAC
 Ft/L5024m7WaXn7lgwJPSe8vWKHrSI9JxJXbrCwqkMVD/S/cO93k90MmkxSHGZLxKpoVfXUxdBk
 Q8GomWTkJda3qoXW+ymwWEdWlXz8VDA3EaAY5aUqWzXhahgGYCO/nrajJewfiCpwqAIjpjgAqvE
 PmtLYeEu5AnEprxEWgkRWPBw6erMzGIMeFIBR0adYa+lwDrD7dwKJyhhlozedH2LLLpDHquBZ9R
 1PZ40zeZP52KE6Ej8Vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NyBTYWx0ZWRfX2zN1Nd7HiKGU
 EkzkYkIHs5FVuFHEwDZPMPAqyU2db5lVTMzsoXH689K/rDbdmwoxEPp642faS4X8wgSMK+nDfyJ
 SzDsvnEgh8CMSTVEXK7Jwk+kESrv7Kk=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5f2ce8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=SHEdVmtcqMJQtNp9YQoA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Nc-IW77dLgeCYqs2RQLpS4O_fbLdyhR-
X-Proofpoint-ORIG-GUID: Nc-IW77dLgeCYqs2RQLpS4O_fbLdyhR-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210087

On Fri, Jul 17, 2026 at 06:18:48PM +1000, Herbert Xu wrote:
> On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 Relay wrote:
> > From: Demi Marie Obenour <demiobenour@gmail.com>
> >
> > This driver is harmful:
> >
> > - It is much slower than the CPU [1] [2].
> > - It Has a history of bugs [2] [3].
> > - It does not have exclusive access to the hardware [4], causing races
> >   with the secure world.
> > - It register its implementations with too low a cra_priority for them
> >   to be actually used [5].
> >
> > Therefore, disable it to ensure that nobody builds it into kernels they
> > intend to ship.
> >
> > In the future, the driver will be used for processing restricted media
> > content.  However, the kernel does not currently support this.  Since
> > the driver will have future uses, allow building it if COMPILE_TEST is
> > enabled.
> >
> > [1]: https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
> > [2]: https://lore.kernel.org/r/20250615031807.GA81869@sol/
> > [3]: https://lore.kernel.org/r/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com/
> > [4]: https://lore.kernel.org/r/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com/
> > [5]: https://lore.kernel.org/r/20260524204537.GB110177@quark/
> >
> > Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
> > Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> > ---
> > Changes in v2:
> > - Add Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
> > - Add Cc: stable@vger.kernel.org
> > - Link to v1: https://lore.kernel.org/r/20260712-qce-broken-v1-1-85e2bff17871@gmail.com
> > ---
> >  arch/arm/configs/multi_v7_defconfig | 1 -
> >  arch/arm64/configs/defconfig        | 1 -
> >  drivers/crypto/Kconfig              | 6 +++++-
> >  3 files changed, 5 insertions(+), 3 deletions(-)
>
> Patch applied.  Thanks.

Hi Herbert,

I'd like to ask you to back this patch out. Admittedly I should have NAKed this
under the v1 thread but I thought the discussion we had under the Shikra series
and the subsequent patch making myself the maintainer of this driver (note: Demi
did not Cc me on this nor the Qcom mailing list at linux-arm-msm) as well as the
pending series[1] fixing the QCE issues was enough to imply we should not mark
it as broken. Please consider applying [1] if the fixes in v6 are correct.

Bartosz

[1] https://lore.kernel.org/all/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com/
