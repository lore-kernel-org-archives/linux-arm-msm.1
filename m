Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794998457;
	b=cZfhWdGVGSLDpFYwPuguZi7X5JPfCUC8s1zuwCy5EM9uY+6j1Zb2ObyFqrR6vvWCC0gE
	 BmI51229UvfHEmHjPhjzjbywbCYiZWaThEhwVlZjW+2lez044EpxzCNC1RveDqJaFv8g6
	 /qOeetCWGelibzG6/2H2dbSdObuamCrjcBaQFeMIhcpOoNi+nFlS2AOvE3aavbnAW1M3+
	 Jad1jvMIOt+XUQKvDwDjV11VxybU6bX7UUq/0uYIv7za+SIXrb6gRt5DBkgx8l4eqje8f
	 ByTzEzkdspMghDcubPexPulwU5wDiycEvjoKRebYxur5ZESq4TgDxnqDx/TjdAJfngw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794998457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
	b=XHodrs1zyaHSQcWiGSAoBq/LE8oXBha2mCAq0vOhXBn5T90wKsGAMSJ9TzYh/ifCRO7n
	 MVc4pGe1L71PhgUYxfo/2jGdyd6QiE6iFDwEFloKQK2CyA4eEjxBLVja8tTR1Q+UTsUVA
	 BONip+QTZmbRvrpVCsTm5NsCkYE9I/JcHXaWGBABMo2UFNCbq8pfGaEJUVTrjnHa8KAZq
	 4wJdkVs9yWAxKWH+cqVWx9qniWSrqKv8mkJJTIMNOBs3DZeqZw7NW/8vynhUzoOzV8PXo
	 XGBDf8qSupzbgvhRaFBbx05nywqoI0Kts5MhbjqBYzAHOhooIIuWpLBozlCjzvHW0QA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="j/ybjMYZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQCYAh+2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74598606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74598606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j/ybjMYZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WQCYAh+2
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kEsJ2398841
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=; b=j/ybjMYZre/ILIML
	M7NzlJXQ6554KatR3DUAICoHEr9nyzyi3yWKwug8MrN5O5zwBpwdn48YBC5GC0RR
	hY6pFXHBgwmF3lpxeoJG0e0BxeTV+PZX2s6baNmOe9aIpEjVZ9QDvAzFKGKSqW8s
	5e2J3q0wcdvrOT2nxRpuc2a13x/0AfL1umSpHZTPV0D3EsTqqddvDi1JBuQg85ES
	BnlIvM/R+R6fS/enzDvRzjyNxbq0hdsWLxNUXum8JumSMtXYivf/H+EyuwRyXGWy
	J+S31BFYPDgWRW3NNXGH3a6bKtVNAGBLo8iEnwCWvSZkR6F4b253396Bl0qfUZmM
	s4kpWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv92ma7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:40:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94967c6d4f4so101674985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 02:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794998455; cv=none;
        d=google.com; s=arc-20260327;
        b=q/ldUj19qahVtnR9vhUyh+sdP9X9q88ln4ClJUAw/zcly38spWF4rP0cfxE7/7xY7b
         8hX1o+6lZasAfs2mx1HuIY5skkALID3oSbHAZJ3vulz4yY02HbrEBYd1cFLcvFB9QlqA
         dLmk56wjzqLUEASQbfpmypp2aOD2D8mBiMSi5WkDqc7FtbBpeydJpkzAb4QCHObLV3Vv
         Naj64PVqOyB5oQA5mbkuZU4HudJVY/ATW4A2hO2oRG3G7XjUf6NYGqanGC//p3fU5v08
         ejQKLdH/QYj+buMyiujJw0hcNoOsEdxSBeUiFsVMPLGMss05crNjHrDi4QHJv8sYKVTH
         Cu/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
        fh=zdJ3eGF5AePiLBjh4dGPwY+O+e3OwLTwi1TdItHrBSI=;
        b=lIzSgslp1E97WujRK2TBiI+i2Eokl5u+SBL93CvTYEyCh5qlHtpYQM64yYRlc5lvHw
         mRttz23/ICjmplYPEeKVw05QUsle9PandEJcsSWRe8X8wW8rmv44L4C/vVmuB1uwCiob
         YVhkQn6PyJ/O2wbffffzSpHXpF0G0iUItN/uwXQTIdPMc5yscwTkE9ZqYB94F/wb3y5C
         YMPK8ul9DSULC4zd4h6IRsJvtt5gCJ0/rhgZERGkY2+3h0w+dXW3wxRC6TEfYPoqSctZ
         sjpM3tZNG3Fzp6egfzlaSsf8PRqYPnNrbwO1AazRYWMuuC2r+chUdPGUgIjX1Z50kejq
         fgRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794998455; x=1795603255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
        b=WQCYAh+23jYojllq7BztjvZ34DdImr9pLISubpEnlP9F+je2A5ly6uHRl2npMFzI2T
         q0Lu3SR3m7gkp4Jorkytf3/hs25LpnQ1jdhOALGImPbZf3zrYHy7Uu4KK/AhVXYnRiz1
         7PAStqvfJJPC7/oSsHVBNSIpxXT9cjNDpzKQuA3JGMrB3E9/S4bUOSu5L9wFj8G0xnNU
         AjJshY8xYnXB85q/IoX2DSyLQOHsxpLSJssKjZtklEs4mObr4ROWwQzqG4X0AYtGDz31
         aGxkzMENLC+gngU6GZHqplM+nGPbfUMIK+oYSMw4Z8zg+s2T/qC9lh4K9Tv6nIp6YB5X
         vX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794998455; x=1795603255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CHdy8G/VmSlmnltk7VvbR0Z9AZlUAUVMzK00aWXmoUU=;
        b=ceaoUQvEtvLptFJMG/NQd9n5eEqZSZQEjx1t1ErhU6+W1TVuMmf+lItq+34uwkrffJ
         qwT1EdrTMT9LP+AFzVjGkosTumySHIoWjqKiUkvfgeR33bP/fBchbXta7+sXTHkKZBAH
         z2VdVksQuEw6quj5vfxug2aprz0yZeMpOwrWAgGSuBGEKl3lx1RzxvrQZMrb/7hovnAL
         78776V9mmAzOgxRQ+fV76pUFfLw4dF5jS0n6f30QQWXb1DVqqNLBXUJX3sXzwAOKc/+Y
         DQl7qCq8qaFieZhzAE0AeuQPccJt9J/v7Ch/hfAX5MCW9JMR5vQZG992wSJGB+EhOpKp
         z0aw==
X-Forwarded-Encrypted: i=1; AL+hErHZWPLhodBDQiQ4Zz9r4JglcCmynjytsNrDvKskIcuHiOUuT1Mk6x/GBarKZZyUiK+oxVEQsVf2gO49BdGT@vger.kernel.org
X-Gm-Message-State: APuU4Z8X0tjuo4BPrnbxNTwrc3AWnK050DU/D2OAufPXPbRImXSoobEV
	jrW0AvHy9pBYOgeMcUx/8Bz9yi0EITsRmTJOkHYwyBWfOZAMS3dI87BHnEw9svofKGI7NNxMu32
	SFni1ru+Zz2ATcH8pOHiBR2eEql/oymhSlPZqP4dHV9KTb1bwbYHjuY8VjesTCh38e8ehHcsxDx
	ICFvxbcSxhrPT0SeioTd5/aurC4P8MvJn9r2uh3Ko7BE4=
X-Gm-Gg: AYBFou04F6RXafJ53t60MpPxW4XBhr1pXop2v/mJJQHHFfl54008xqUTD17HaoKSH/k
	xM1ZVT/1S0YGgMGLO1+AmqHHQ+ok9Sb55yRSMdWWPhwsE0mb/7dy+wPBNS8doYSGAK5DslRUA3T
	ODh5eYFKmyzDs69hj/Jj1vhjyKrNLwYaH1BS6+2X6AuiJLAnwiNgjII/mzbJwzybh0dbSZLqB3O
	tM5JE10AR6By4oZczJv30hBkCwdd+VzjYvLDF1SVpBwL9dHAioJI4DsLUyM/QUs/R/VWaYnRBOW
X-Received: by 2002:a05:620a:838a:b0:93e:78b7:fa4e with SMTP id af79cd13be357-949995d052cmr388638085a.37.1794998455511;
        Wed, 18 Nov 2026 02:40:55 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-949995d052cmr388635585a.37.1794998455024; Wed, 18 Nov 2026
 02:40:55 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109110352.1621-1-xing1989093@163.com> <CAFEp6-1TrCaeP8DtHvUFnPYQw5+B=gRa2=ogjqCC+fKy9AXbKw@mail.gmail.com>
 <20261118092814.2275-1-xing1989093@163.com>
In-Reply-To: <20261118092814.2275-1-xing1989093@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:40:42 +0100
X-Gm-Features: AclHuK-FT1CuXYUdW7m-nWwmIULm18l1osWT533MIe5VVPgbaeB-OtNzu3MF4w0
Message-ID: <CAFEp6-1pJd_==NodGfp1X=P=wsxbBowezg07DJpJfd6GtB_=pw@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add per-device ACPI reset
To: Hongxing Xu <xing1989093@163.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MiBTYWx0ZWRfX5uV2yl1vlQu8
 4JEVQ4fhUYDVQ9YUbuQlp/j48e5wo6oYWi/CPLwp3t7UUftKuc6bMbfOoUG/15XcgT3Goh/qFm1
 v38SEyfXAJl4ObzvdCmMxg2IJ0tTm+Z+LxeKMqVMQ9IjddBHa6sLalVWMAFqahDMJHGak39e33i
 nPY3v6yT76fP7SKLeZ5W1s/7iRGWHzA1tTrHGKQReZfdPOiy7Y9Un+8YqcKfqNXREoVvDIXDNcH
 fx7QYDOAG7n0MP8mbb4QNM8fk3L9kYrySoa9leCviJAab3AvR509J1YPRkZfMkJCeEWaPOxxcE+
 u0gwsCFq8Fajpj1baRJLp4bwDgKJm0iz6W9Y4SHTI5B8tcLAoRfoOsHMAa/Gq9h5mV6pKPiRUSF
 QH5xhn/YrBZwgqyMaOfewC5jppo4DOLbsYryAGpTWBGhQUzgJ+ZhV5GRQosJfCY8Fk4xp3yrrxJ
 +CNpBAw+6Jco88rDIFg==
X-Proofpoint-GUID: ZIszKDksAjYXKL6vQCGA4M5v8i0eZWmJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MiBTYWx0ZWRfXxejLOBKv2Rii
 L5xrE3RFLT/G8v8D+sFNUTLqtLW8+g2PR+U5HwuZxZIHEbSGybbyOMCyPmlodSrPQb+z9RinRHq
 WTPbNnowhszC9G0ehRVtnyWWe0yCdII=
X-Authority-Analysis: v=2.4 cv=LuQHWXdc c=1 sm=1 tr=0 ts=6afd80b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Byx-y9mGAAAA:8 a=9cDAomjR_99duVTWh8cA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZIszKDksAjYXKL6vQCGA4M5v8i0eZWmJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180042

On Wed, Nov 18, 2026 at 10:29=E2=80=AFAM Hongxing Xu <xing1989093@163.com> =
wrote:
>
> Hi Loic,
>
> Thanks for the review. Let me check that I read your two points correctly=
:
>
>   - The reset method should not live in mhi_pci_dev_info, because whether=
 an
>     ACPI method exists depends on the host the device is plugged into, no=
t on
>     the device itself.
>   - The driver should instead walk a list of methods and take the first o=
ne
>     that is present, from the most generic to the most platform specific.
>
> I agree with the first point, and with the idea of a list. But I would li=
ke
> to suggest the opposite order: platform specific first.
>
> The two entries are not two ways of doing the same thing, they are two
> different kinds of reset, and the spec keeps them apart on purpose:
>
>   - _RST under a device scope is a function level reset. It must affect o=
nly
>     that device, and it must leave the device visible on the bus, so OSPM=
 does
>     not re-enumerate it.
>   - MRST, referenced through _PRR, is a platform level reset. It power cy=
cles
>     the device, so the device comes back as if it had been removed and
>     re-inserted.
>
> The spec says a device should use _PRR when its platform reset cannot sat=
isfy
> the function level and bus requirements, and that a device may expose bot=
h.
> That is exactly the situation here.
>
> On our current board, both are present. The function level _RST succeeds,=
 so a
> generic-first walk stops there. But it only drives the link reset signals=
; it
> never removes power from the module, so the part is not really reset. The=
re
> is nothing on the host side that can tell the difference afterwards, so t=
he
> walk never reaches MRST. A method that exists but does not do the job is
> worse than no method, because it hides the failure.
>
> So: would you be OK with trying the platform specific entry first? That i=
s
> my suggestion, but if you prefer to keep generic-first I would rather hea=
r
> your reasoning now than write v2 the wrong way.

Yes, from specific to generic method sounds good.

Regards,
Loic
