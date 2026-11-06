Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793993324;
	b=QU0jAZm94iXTKmavhIRR3fFOs1GxFp9VGaLo7uBgNtDsXhxdRAQC0GI8Zb/I0i/IujI/
	 FVDmxR/DDDOU99IRaYO8sLcrcpjZM87kJ7asF3abrZ26N2x86lV6BpKOG+MkKHV4GjhvX
	 s847sTGECFVVUmLXSRcq0Z862Rf/Pu9R9DAAfksOk7HRHKQfBUpJbP211tqEgX9DHGqVH
	 ISEwLX5hddIiSWM41JRbnjq/qm4XnMonw72jyuF3PdvOpDcvBrGET7EaJTVbJirVMYT/L
	 dScvs2xPXcFxlblLwyVV1GXJlrtYFy+yTl7u+l+UhWFCXe/b0siaUY+N6p/ZYHg2f8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993324;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=;
	b=R3nOvNBbi1Vj6WdyR2QBUL+nn8E9ESV2ErD+TipnaALyD1wGmNOSMr3OgwZxYZRDjNtk
	 9eJIEl5CcL+CKlvnDUx7HjuYd0SA6fSq7r3rVjni/1S3gcuTkdhRh8bUbH4hp859x54Qx
	 TOdU5ksUYd5pJ1V6NMtGOBcbI8HFkhfQwB5shv8JiQFV6Swwoa/U8QgP8I7lI5JFu60Ky
	 W5Msz1YYb3BAMQ9HQjw8hX2y7yU4fj7tMsDDNja1U5V292BiJhzWk18IHKoBDg0oUIPQP
	 VdLq1CcR5XDivx3r8NGXEUmL0JBvVJXzdPJnbi/ZX/XFeSXGO3SgE+3cuVVSu8ZLzBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kcVTlkY1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFddPfG1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E5606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 19:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8E5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kcVTlkY1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CFddPfG1
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JL7Fr3254083
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 19:28:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=; b=kc
	VTlkY1xd3z3BoetGvpZ4gUcASg6DoYN/uisq9AloTvAgCBoeKlBAsfSIqDEoypCp
	hg0w51FC0Yq0JxsNVez262dvaxDQoFeapCbrSfGg8oXV0+MhUGrTIUJDMNP0OuNn
	mEC9MqOuwBn7J/nXTRPcsocpxbCkqyoJ/XV6mkR/pL9l2jSSHqDeXCSdfa5SA2t5
	QiWJr6liD/mowHNlvTb2I70Y1Dd1OatzpZE16N4+Crq7V6IirC6QWe5268cYb9oO
	mSZcDbtp6xJK4VsNN/Go6yIJVA2ZLRuEzkcs+Wp1z7pya9a9SybTpzB1xVThOtdI
	beJQ8IFFa3vIucu/YC6g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyqr12a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 19:28:41 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-85c6a056128so865892a34.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 11:28:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793993321; cv=none;
        d=google.com; s=arc-20260327;
        b=nVB1DJpRrxjYFsUJRHWajaHOKDEb3K51V/53AAHDV6c65+p5vFiH4GAp7YncJuPfi2
         IoQmCZgPeJJKQkD3KXS5VqgNbnYP+vyNuP2eTZednDYj+RjPGwUhAym56ISsL7XNCsqm
         wOfI7RyruaL2KjGq8k3vgpbKULk7yScEz1zw29puAZniuo6bUdbmQ9fSthiN8EpOJqYj
         ZoNg96xGvKOxDMO4qHeaObu+xu19+lsMU+du3OBPNW+gxgf5cvlzsu4Ex1XHl/MGo26p
         WCbNEoa3OmOohnimv/yZCoSuM2N/kYAh95PUdZyc6zyGgsEMZFl9RVd3L+A3G3MRS+do
         FlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=;
        fh=g/Ppeur/ONklDk56OT5CM0GQ8AbiecjvtWnjtOxoy5s=;
        b=Cl0iDR0QLL36YnyCHvVx0/c1aeyuq6DBTjbJA/gBHD8nqsnrxHL6r9IPMaxqXhJEpM
         Xx/hFT13YhFhGFsl1zgLfUdET+pAguzGZB4KctE8QAciMRypMgW7rGmLSIJm9FRQNtyT
         v5EF2XByqUQXqbxrY1r/7uh90dXjTqu1MFqzFk6hqh30mmmYph0cyS/fyCa6FlLoPZXo
         8tnzTVoZEh5r/ZNbcRB0pTS7qe67CVubfVycTH8c/13X/2BCaqVl6BeDKhwh00MGjcS2
         oK2I76uxb0s+pTo/EYDQ3sI8rRdws2X6H+nGoAsVfeCFvedl0kbq6GGtKed9zXWJBRNi
         lhFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793993321; x=1794598121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=;
        b=CFddPfG1VOLewoiRfzsDqnOumQCnND2ELvXXQph9vR0tRBBvKk/aCXNuak8VCvXwTk
         iCptNnkNiL2o5XwOo7rxd1xJR/CnIm4co0ELFHt8ejzs1ZiQw6RqUGxJZiSX9NKUtsbr
         3o7sH/K1f1y4cTStMzXEhK48QGGdxQl46N6XdDep6x0P/tbNcL0mEW2Hj8BEdqqj8fwy
         oCqrDdHw97lSMcLx5f7eeZjQD+2IqF2hpF0612T83kbmPV3ia+v/Cv3E90Qr6R8Nh6GW
         VVHeMA8fxEJvB1+XMizoRhrhBpfUW3bhn3wiYIPLHKHwXoGZM++qsZHnrCjyN0nvvT8R
         Z0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993321; x=1794598121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eBPjMwVd0jaBoQmrGoNaoqquijK1PZ3EZwzevr9JqQ0=;
        b=prgSgGaMsYMfE3NMuoxttHU30o+CU9nkYFMpjDsxJ9rOjJzRJ5eIACz4CyMCv4rYQ/
         MUT1cCJmzN8QPR8vsWOsNZK6jk22WfPJGpR7BDT/TlImtaS4bQzFn6BflSw5f2PbcYNC
         dl1nboGFyjlaDwSG/TWLe17vMhI0421e8BxBrox651TumFVtD+RKf2WfPczAPG7qajtz
         U3LzyanQo6R46FE9EATK1t+cRl6PZM+WrjVziou9crxb6KLj+UbsvGBVcYCsdNd/G6ym
         fSlulQ5RTkJFTRJ2GRh2PPoRA1tH9ePPqwc3caOBQtlgEdedyugTn0D7oaETGmtvNN+j
         WgGg==
X-Forwarded-Encrypted: i=1; AKwUvBzE8hhm/6MTitp84LRhhBz12jWgDkg0RwQ/C6hSUxYRCPvvET11prmhqosOigWXZ2OzZTWXaY62TxR1C3k9@vger.kernel.org
X-Gm-Message-State: APuU4Z8b8A99oiehANlQ+rYP67AHDk5FWqPN1zY/Wsav9uDJvW1DFgOf
	pig6KJzLcZ343W3uHgKZwOaG3wc0g3AogTvrE/Z1LXYFrKzYfaybb5Nu1TJn8FMoE9vOgdZGMi4
	6Ank8mfYn6F5utlYQxEZD4OBG05Yrml1eT0p2zDKXVY05oM+XUPNAIrbNXj54T1+WnAlyrfadYn
	31O3n6iyggJIJ/wqX8eU1Bl4luN50HlYsxMGoJ3EgzL0E=
X-Gm-Gg: AYBFou3iEvckhALWpikTg5cNITaMtgUcm5FgGzxq3QkpOSTo42OWmz/IecWFNCkVb9t
	4LlEQ9JEHRQdYsrnr/bMwHhcmjc/z7ysyki0tTyQ0F1bnyLsXIthYUp+0RdVIxPV2ngXDwqYk5i
	8OEu25PQQz08NyFZ8/RSJgcaAGmy9FdvMQMoPIViIYi08DaqHyD407WYqCRBW1j4fDYZbDvtOAz
	MY0AakKkQr2i893WpLncQ==
X-Received: by 2002:a05:6830:903:b0:82f:5733:ffbd with SMTP id 46e09a7af769-85f1cd6c102mr4535836a34.1.1793993321197;
        Fri, 06 Nov 2026 11:28:41 -0800 (PST)
X-Received: by 2002:a05:6830:903:b0:82f:5733:ffbd with SMTP id
 46e09a7af769-85f1cd6c102mr4535793a34.1.1793993320712; Fri, 06 Nov 2026
 11:28:40 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com> <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com> <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
 <CACSVV03Nz=das+fneMqx9UE1Vzps55=_An-DtmufRTxdhv2idw@mail.gmail.com> <8f3c80b4b518835e2d8b3da62e84572338657f68.camel@collabora.com>
In-Reply-To: <8f3c80b4b518835e2d8b3da62e84572338657f68.camel@collabora.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 11:28:29 -0800
X-Gm-Features: AclHuK9Qgc9clmR_7H8t98hdINV7q2dwzavw_NQzbOJlTXbTdCINtEAArvoby-Q
Message-ID: <CACSVV02KqnDzMQd776fvXBErHLzJPptzWBSnXtEoxXNsUW6TnA@mail.gmail.com>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: KGGA9SPz17j7RjR4EF-Dm5Pks8i5Wn-N
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6aee2a6a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=TpzBZJKYoUEfyNYX0y4A:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3NyBTYWx0ZWRfX5VzvCHAMJG3H
 rGtR3x9d4/kNXbtZndU8y8hey09fUdfnEa0W+sb2ZbjfRKtctaScub9p92c9ueyMTIBlXYPCkeI
 TwjHJTkyOiSYU73dL2aTXVP+Pinx8pE=
X-Proofpoint-GUID: KGGA9SPz17j7RjR4EF-Dm5Pks8i5Wn-N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3NyBTYWx0ZWRfX/7z9TaeKms9P
 sYfh6VXiaVcxaB0mWV8ouQYRwuFku85EsgF6riqn2B9oQmQBtCK+tDMKIaYBMbmzoBOFVV9hKl1
 VxeE5Hpx5BcWKSNGu4//FUOqcLBYeE7l+mXEU5QCl/FPMtieqh1FUbC7jlyUnsrUbxfFuhtxRNA
 9zdcXT4ZJZNNqhitDC0F88UX1Gi6U+oPdMyGSBpjKYjO1JoQuNbLHRj+C7NS9DfRqRma6MJB4Uh
 koL5z3s0vfxTOG1rhDO38o9JyhPY0+5pGVpZRhTCpJR2k0zGIPxweVZbyk6S3GBKLQudxmD11Pu
 2Ee4wliXjEWCKunQUPYJ4wQ7OwXJW2GGys64QY40BvToV+UG0760jyhn0xBdB0belvyXuN3gUf5
 +4Wdl506qMhtCNcdKeFoLhQUChXTpW9mqWJOOKGHN6SbzU2embp98kOQiWNXFQ0k5DKqf88lsbp
 HcfctHePzYLTa6TdNIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060077

On Fri, Nov 6, 2026 at 11:09=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le jeudi 05 novembre 2026 =C3=A0 12:52 -0800, Rob Clark a =C3=A9crit :
> > On Thu, Nov 5, 2026 at 12:35=E2=80=AFPM Nicolas Dufresne
> > <nicolas.dufresne@collabora.com> wrote:
> > >
> > > Le jeudi 05 novembre 2026 =C3=A0 13:35 +0100, Robert Mader a =C3=A9cr=
it :
> > > > On 04.11.26 23:11, Rob Clark wrote:
> > > > > On Wed, Nov 4, 2026 at 11:00=E2=80=AFAM Robert Mader <robert.made=
r@collabora.com> wrote:
> > > > > > Nice, very happy to see the series!
> > > > > >
> > > > > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > > > > The comment describing the QC10C buffer layout calls it a com=
pressed
> > > > > > > P010. It is not:
> > > > > > If I'm not mistaken the display engine / the DRM side (includin=
g Mesa)
> > > > > > describes it as P010+QCOM_COMPRESSED as well, and so does my pe=
nding
> > > > > > Gstreamer MR [1] . So if we can't pretend that QC10C =3D=3D
> > > > > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, =
wire that
> > > > > > up everywhere etc. OTOH if we want to keep the DRM side as is, =
then the
> > > > > > comment should reflect that, IMO.
> > > > > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and =
P010
> > > > > as distinct formats, both with and without UBWC.  I'm not sure if=
 the
> > > > > same is true on video side but P010+UBWC was never exposed, or if=
 it
> > > > > truely only supports linear P010 and UBWC TP10.
> > > >
> > > > Oh, do I understand you correctly that the P010+UBWC implementation=
 is
> > > > not compatible with QC10C, meaning on the GPU side (Mesa and displa=
y) we
> > > > don't yet have any support for QC10C exposed to userspace? If that'=
s so
> > > > then we don't have a choice but to introduce DRM_FORMAT_TP10 I gues=
s?
> > > >
> > > > On the plus side - this would allow us to make the format single pl=
ane,
> > > > matching what we get on the V4L2 side.
> > >
> > > Since its single plane, we should aim for a variation of
> > > DRM_FORMAT_YUV420_10BIT. Similar to YUV420_10BIT, there is no obvious=
 linear
> > > single plane packing for that, it would only be there to support the
> > > compression. Or maybe this one is abstract enough to be used anyway?
> >
> > Oh, sorry, maybe I was a bit misleading/unclear.   TP10 is still a
> > semi-planar format with a Y and UV plane.  But each of those planes
> > combines UBWC metadata and pixel data.
> >
> > Within each plane, the pixel part of the data combines 3 samples in
> > 32b (compared to P010 which is a single sample per 16b.  So not quite
> > the same thing as DRM_FORMAT_YUV420_10BIT.
>
> I believe DRM_FORMAT_YUV420_10BIT is defined as fully packed, no padding =
indeed,
> but I'm not sure if it actually matters considering there is no linear
> representation of these. What really matter is that its a single stride/o=
ffset
> format, which TP10 is not. I would not mind to see another pair for forma=
t, but
> I just wanted to emphasis about the number of expected strides.

For at least some gens of AMD you don't even get to specify the
stride.  It is a function of the image dimensions.  Not sure if that
is true in other places too.

So far, for compressed formats, the stride used at the API level has
been the stride of color data, and the compression flag/meta is a
function of that.

BR,
-R

> Nicolas
>
> >
> > BR,
> > -R
> >
> > > Nicolas
> > >
> > > >
> > > > >
> > > > > BR,
> > > > > -R
> > > > >
> > > > > > Best regards,
> > > > > >
> > > > > > Robert
> > > > > >
> > > > > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_r=
equests/8195
> > > > > >
> > > > > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > > > > 10-bit samples in each 32-bit word, which is what the stride =
computed
> > > > > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > > > > >
> > > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcom=
m.com>
> > > > > > > ---
> > > > > > >    drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b=
/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(str=
uct iris_inst *inst)
> > > > > > >
> > > > > > >    /*
> > > > > > >     * QC10C:
> > > > > > > - * UBWC-compressed format for P010.
> > > > > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples=
 packed in 32 bits.
> > > > > > >     * Contains 4 planes in the following order -
> > > > > > >     * (A) Y_Meta_Plane
> > > > > > >     * (B) Y_UBWC_Plane
> > > > > > >
