Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793808705;
	b=aiyhGEnuVJG6UxhiCgR+ChHvcSG6PS9xOQJ+BznKhIqVZl/AKTWAzQQQZ08hqCF74BWg
	 slS0oIiei8LQMktcYZosxqJmn1cNsM4F0CIXj7YvGMxvWaGKeCZsqxpujflFqAU6fURQN
	 UYdjvJrPrT/8XhT/O7mdedsbzjsjAcYJL3aFRpg5RUmQHVvIp7XsaWhRgcd8ErmaLKGx/
	 o2LfEdGZJ0YTUyEI6Sjno9vfNQi4NkEWA97DwJuuGLVSM8/LdCZMRRjwsITgK3JmFCQ0r
	 eao21fFFCMU29YNLYFLq8wMvFvao7cgAVNjdUZHu64x/idRjTaQjoqp/61RcKGA+KKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
	b=iIsixbRXotl1zhgu25bgL43xA1tq5Mhhafft6ZiweySjVR9kNljhrYFkTfrmWwSbRnST
	 dZC0xhw7vsZoG8E6Az9AsT3aLbvxlAkDhd5nP+XM2qXJY16BSr3cEsZRisF9yv++4tJO9
	 B+nk0rlBRMg5ZrJk14yoIxuJsT0soFi3/NhmHoBR+/7h30YqzszYiCG//ZqEz18AUvsX7
	 q3PIses2ADyRiuhgY7bA6KIE+WadDVWy6G4EwwHILsATZ47PsCxNbRrYG3rdnZ7AXy3Sm
	 XV9mgFsyb+7Ft6QE3zN0EKZ+3hC2J3CTOBPtZz17FovyjsbdhFcbM1ei0U5jdEfvUOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HL3zDrgn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=El2IqZXW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D7E606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 16:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D7E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HL3zDrgn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=El2IqZXW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjFmB1692637
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 16:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=; b=HL3zDrgnV5oO631M
	Ro3PaT8ie6EQfwqRoHQijSgOKcFDtH4tbxZgzZrLgfk3JSj4kg6r56uj6bnDRrrt
	ScyF0vqH9OisHcxgvpJae0MgpBXydaQLio0ZJVG9j3/TlNXrGtskrkqlmSW+2ZWo
	xU0TdvyezwBVy7vz0pI70oZlvKNb9IC48femR6o7Dqp5cNKgJh905dqPo1w1jdCi
	WDmne/ATT7DGWZMvChAmzLZWil6FP/bqc4iMtzaeY7K30odHjDYn9qZ/etBbN9Ja
	jqK4oYFVlMganJK7VG/lFM6J4I9nVp++FG3byp+UjzBmz/u8Ss3gjnKEAxKIZrTJ
	Koozgw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br0esd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:11:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so277185585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:11:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793808703; cv=none;
        d=google.com; s=arc-20260327;
        b=ppVVSNt9OySENZAgev+5uA/p5XWib1e4SLrDcPNXfpPIYFd84vhWqYgUwYrXZVKdyX
         mXiaWPf8cH/CIzBCnsRXtOk+Sy75+lobmvwx1txwDKGBQtMr4x78aAQ2zsqijYraupcz
         PijtDdNv9EzzvlsTSrqHPnYD/VjXXrvqRAG7Irt7MKCF3zAkFSALmeCATpRPtPdO0Jxn
         TzWKrA0gJhUXnKqkl1ZznLcrUb3nagbywN/+Ak9Aps23d1sWAsVWHI5QqNEJy9Bzo6P1
         2RJhundS+RspgzFuTFlyZtoMyhzSSeUIbYRU30PhTWy8KGcxtnsGABLfQDbFpS+WkjEd
         jIYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        fh=IcY+K5bH344OHi1X3WxiFBvs9qrMo0PxZqfonGkog8M=;
        b=HKyQVmzR6J1vHxT2y9cfv/IyjqOcmxrnTIZaS350yTUW/jub3h6LKyMzWpxZo2uRwK
         1awrKMV6AODCnvtOUsIHqj6AJ0oXSOCWVUZabZbcmdHURhvzyBTZ19PzdNRX9+xjRDY9
         xJpZBo6q0RPg6PaA3EfE8U0B6y/IqIUg/dA2If8WHhp82/GNsHXno68t0LjaBHPvUj4j
         f8NzCnbN9QiGcoQTJQCwyrCvkXoHZyXkW8tOJYIwGJYpVADmHgmOMbgj51sljBJ3JRoy
         0ejNtbvkWVagLcEU6YUalTD23DnoEBEpTa2T85l9AHK5/7U+b2V0Q0aPT8h/HiGOQWEy
         kbbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793808703; x=1794413503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        b=El2IqZXWqkDNC57tidc/K9SGVrfNUsSastdQjvvHqzAaDZRkiyFrAuM/vMIVkTVg+L
         N+iMkAyBUdQ06Itekfz50jEiN2ymXWirP1+05uhuz2Noy5oMOlITxv6gF8NipJ7/010p
         x2uuO1FtQY09ULWm75TENf1JvyJ0Oy0BY8VMzLaHhSwFlY54SIAOMRBzwcNLaaRyoAY+
         T1K9YmEZgQGcaFw4GkFfyOLagtW4i2UvUoItKuXt9F6FUiquX/rzJIPWkSEDN9mRSUNz
         JAhMQSOgwiHhAkSIrVUIa6NkJGSK33AiFXMEyOZYHL+j0vdwo16VgtjOZN16c8sHHvoE
         AJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793808703; x=1794413503;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5QB6POg8HfhMxcRuf7nl0o7R4RuPToIyjSP8q7zFzGY=;
        b=OxBxfMsx2LTYS4DxzG26DD1JeTiSKw/0O26x8PV7sbPn4HuKFbfWTHdxgGlGEuT1D5
         m5rmyBpPkPJhLvG/PovRRT9OMR9bVoX0+BKfjtRmqi3KJF/qhA6qt7W3CxdP+mE2bw/g
         /WZMBiNaA4tsVhucK7muKHAvObHlpLyakSU3rlGuHaJ0vJ5iyxM9Xj/6NxTWMgvbgVV6
         ZhuhHQa7WSxnJdToKm+gZlm9N8PeM1PtOhLXWmsNTP3/IgkRGw56GUadhz3b3YqN2c7G
         BuDVS+4lrsReZZZdbyqVeuJ7SO+MVYlMaKMvBw2mWawLXj5xKuEhVvxnmgw+jMFfgDvx
         3SEA==
X-Forwarded-Encrypted: i=1; AKwUvBx8c/nVrC+2BfzGL4jKaeHBe1C8GWUQwQucGDySHMX01p+900NFxp7DoyJc+PxujtjyUslv/fzwnf9bzC97@vger.kernel.org
X-Gm-Message-State: APuU4Z9gRrJAIP86vV32rVm7eJScS1D2aCF7Lc6d3Vad9/Dh5j+PQjj4
	sBybgeW7GE+TnjzSGongloogKoKv32KTIKfiOOpK6Zvrw3WCPKhR14ZOrj39zPMiUMzV492orq9
	28i+wLkgGlX4VTlojxmZLIzdE/9HXOjhwHFemrvpB6Xq4hHsWAH8fbEFIMUT9Uh4iByXuducmEg
	IOtaK524W5U4McKMZD9h5GdQRP0aRIOqhlKwcG8RBB8uk=
X-Gm-Gg: AYBFou0lIXT35y4WH2NPg32FAsVh1EMssfEfSupIHSO3UkbdP6QGyT0mK11e2wGYlfX
	DDfgTSICQQ8emCX2gEMSq2486PSilS11CRoB0lSDdQGj33gGjA493hjQvZVcYo/f8IoN8Rb83mc
	VSlT8nxCW0/b/3iL75eEMwzu3QPJTiLER3eD0WiuNDjY/mqHZV9/+VFEqwlcUZAvC2COrNRmbLt
	9R+tOL55ZK47xjllRCi2XAR9XqBw6Ws5rLPG5K6WAyRY3z6lwIrb6iYI1aDx8NyH/98j5IGLKJX
	kEapFY1Tw715qB06fkciBapb2i7o
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id af79cd13be357-94421695deamr2551186985a.35.1793808702931;
        Wed, 04 Nov 2026 08:11:42 -0800 (PST)
X-Received: by 2002:a05:620a:8809:b0:93f:34c9:924d with SMTP id
 af79cd13be357-94421695deamr2551182085a.35.1793808702357; Wed, 04 Nov 2026
 08:11:42 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org> <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org> <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
In-Reply-To: <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 17:11:31 +0100
X-Gm-Features: AclHuK9u3BNMbXNzSA7AiOa-yyai5dEWKspQKV0NGjgXsr23U39BsLgUr6rq0Ow
Message-ID: <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfX7kMAx3xMipW+
 GWBwlU09P46OdFUI44+5sWtRMDV+mWs17Ezxgwu0i+CVY3Sqk1P76zaWx0CY3/fK7mKAaeI76ph
 0ha6adZGu8T0wZRqOqVuww78B0bzx15dOMIXb4TFcamF3mu8BNedDN3UQ71dHNrB8Ytc6MANpA6
 3ma+7GSetKE9S3o9DWGX+7v4MR1bNWu4IVS3TVitumtW6K2LmkfNTCbnb/t/2sdOM/Xz7+Y0/og
 2KXzTcfjY0gYDqBDzYkectpE7Cl24DMtfS2cYBB3hf4zzqxWpbtmzWBS+US0RIKw2S+4AZ7ZRof
 BR7b+7qXzWpFCr+gSspZUI8QhHE2wYtsYjgeI7o6qzb9TRjHIkPxAJhlHdx8XuFso0x5xJ1TLLq
 Gr7hfW1wlk0+kG563o3uvJ7gUKCanqUCGjoz7MqvkRQy+ADnafoktEwJaoCUOS9jtiG5YcdSJCt
 yu9cAQzG7OfdkA5V0dw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NCBTYWx0ZWRfX7EOFdQmTFR3Y
 qq+iBPgp78qH6Z7RYwnTCeGkl4oO6rh16QNqCoNpcdyl995n9GmyT7UMR/aM1qq1MElrOql6b+d
 OQSWWNl+HBWCgmaRITpy40LD4RNJ9vI=
X-Proofpoint-GUID: phWyKnLcEETFxY1j53ujEUnfIVirEgZD
X-Proofpoint-ORIG-GUID: phWyKnLcEETFxY1j53ujEUnfIVirEgZD
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aeb5940 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=rMQDtz2esI8IZeRrkTcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040064

Hi Bryan, Hangxiang,

On Tue, Nov 3, 2026 at 6:29=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On 11/2/2026 8:58 PM, Bryan O'Donoghue wrote:
> > On 30/10/2026 15:25, Hangxiang Ma wrote:
> >>> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
> >>>> +static const struct camss_subdev_resources csid_res_hawi[] =3D {
> >>>> +    /* CSID0 */
> >>>> +    {
> >>>> +        .clock =3D { "csid", "csid_csiphy_rx" },
> >>>> +        .clock_rate =3D { { 480000000 },
> >>>> +                { 480000000 } },
> >>>> +        .reg =3D { "csid0" },
> >>>> +        .interrupt =3D { "csid0" },
> >>>> +        .csid =3D {
> >>>> +            .parent_dev_ops =3D &vfe_parent_dev_ops,
> >>>> +            .hw_ops =3D &csid_ops_1190,
> >>>> +            .formats =3D &csid_formats_gen2
> >>>> +        }
> >>>
> >>> This looks strange, why is there only one clock rate ?
> >>>
> >>> ---
> >>> bod
> >> Hi Bryan, the current CAMSS CSID code always selects the first
> >> frequency listed for each clock in the CAMSS resource table.
> >>
> >> In camss-csid.c:
> >>
> >> [...]
> >> } else if (clock->nfreqs) {
> >>          clk_set_rate(clock->clk, clock->freq[0]);
> >> }
> >> [...]
> >>
> >> For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three
> >> clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly,
> >> 200MHz and 300 MHz is not sufficient for the sensor's output pixel
> >> rate, so we need to use the highest rate, 480 MHz, to meet the
> >> bandwidth requirement. Thanks a lot.
> >>
> >> ---
> >> Best Regards,
> >> Hangxiang
> >
> > We have a series from Antans to address this though.
> >
> > We should list the clocks the SoC supports not constrain that list for
> > one specific sensor on a test-case.
> >
> > ---
> > bod
>
> Good to know that Antans has a series addressing this. I agree that we
> should list all the clock rates supported by the SoC rather than
> constraining them for a specific sensor.
>
> One additional concern: if the clock selection logic still always picks
> freq[0], listing a lower rate first could leave CAMSS unable to work
> properly with sensors that need higher bandwidth.
>
> Could you please share the link to the series? I'll rebase the next
> revision on top of it.

I don't think Atanas' series targets the CSID clocks, only the VFE
clocks. Ideally, we should make similar changes for the CSID clocks as
well, but for now they are not being considered here.

Perhaps add a few comments documenting the supported rates and use a
single rate for the time being. Once the CSID clock changes land, we
should be able to revisit and adapt this accordingly?

Regards,
Loic
