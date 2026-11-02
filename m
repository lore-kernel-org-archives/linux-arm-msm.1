Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632308;
	b=QgfOKA4aN+Nhiazd6lFneuj0ZeyCOz7emjBp9XZMnqLGsT02zKflFsYQHpKVMkPyx19r
	 EBnOik8/45fQ63p6qHD2d6moKOyU1hhuPVcyUSCEw3Rnt39qUP6m7G0nVoCreMszCQssn
	 LIuhPgD+iHDVBFDWnRV6zuUqkDf8snPBAXy6PvSmk0rg4fbrfN3s4g2NQy6AQd20Hepaj
	 PZ3/fPL13QLkhXIljPDQkdAseRoxId6Y/xVbS6KTD8o+zUm71v0E6eoCerjYxcHG96r8y
	 sCEK4NvuRINwl/LoGJHVgop6vLq0XJ/b+zRhGJjoLrZNnU1nsYeK2GTMezqS9XIUFfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632308;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
	b=D8NIeJb5eZxE/NKiGJ7KI0efZxAWS2AYEpI03Y58O/HHLN8MEGV6NsCMgyWtsCz2nKjO
	 NZTlzuZFAjAr5kLT4EOCdIPjFAYNvnGPLSY/c8Y8aIaBGW05JL+spSvA3RQHHUHceK38H
	 +vuko6OpZLL+lRtBIktFul3ZGOZgiJNiwwD1geASNi4Bb5HouuvCMfFgA3J9ZjKG+ZpK9
	 ALqXC+mH6H/4v/TgVD1t1Csmcw1MiNqdKTsJ/aDZNS6Ngdpofm8HD1NAfIkJP+PFa0fj2
	 /R4q4aPy3JImennExQqCzqdWHEB3cEwTWlfxzky0jgye7P/UuHeWNQk5j2joh+1OF0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dwFuqd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5tz2SZb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364DE60771C1
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 364DE60771C1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6dwFuqd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f5tz2SZb
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRSb477096
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=; b=M6dwFuqd9d494bUi
	H9y0+N1KdAZwQ74tCIuEUwEMahov437QC9EqU7wTKU/QwdiQ+3Z7TkApbElZEHlG
	PqXN9H81hwsVeqW16djt8c0JxrUJu1RKW9ndMpwhPp+5yB1Ccr8kz9rlKRXG/tS3
	8N5Sc+10GuUx9D9AFBjJdlMqWwzQfCrSpYZn0iYKFUEIiBSV5NLKyCK0hxgGqjpz
	3axscshDeKjYnjTSZdPMUBbhBJqUn8i0k7t06HsdwJjYmFyXoPl43YXPAGeahRVN
	MzeE7I0PV9NVhgJWlOQN2waHEbvDJ7CqB4VcE3KDdoLGfJ/Ol3zFHC91cbg8H3ok
	3MfBFw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19qwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:11:47 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-54213290993so2111929b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632306; cv=none;
        d=google.com; s=arc-20260327;
        b=eYsFXwehV+TZ7y/jl1CSoUzJ98Ku2mmEJ1CVUJtoHKE9LYG23IY7bk63DkRRGDnDzV
         9Rlbajs69EOT0NepmYE2IPCKyfmMccx+Zf6bY75UolrhyKr5rraCfMns4JsjT67yHgSq
         kaq0HdpSRaxHugu97kUx1I34yrtF7maJ3XMr1mMT5eE30++HlSrOC/ZzS3ZiG8RL9GQ0
         7D4hty1m4D3eq0+j4IVwr2LyKebkn4rFmvZa+lfUm9DJ1eP36nPulm6E9uZHY1lS3jJk
         +LrOGvB3vdxYA/uF0Of7V94hmDox05HoL3+fpkFWoeEAp3/MXTLogaL2gQ7JRKm5Q/Tv
         La6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
        fh=HLij/Bu9LVWRjdpDIBIFtdetUIC40uF18ctcWgSOzFY=;
        b=GcvvB49MR1jUQ19iQt6A8QuZSLuSU5t393JOcCRw4z/2XtT4dked/5IWRhBpWhY51q
         3JM23VR7UFgvta4oKLP/HaGgLL/de5OElMvlooPBzoMCeW7DD3JPjC0jKwuvM3t6ujUw
         hLOdlRRHDRf1imxeqfUEcT3yk6fvrSycBfrMU0FMCAulLBSow4f6n6In3aJ43vfUmaUC
         gFKIhXkZKC83i0eqW/M99094YpPekPaJUjZZtEISVZRShyXSPFm+nYu80ltSkODpspVC
         9f2fW79EqHJDGPYfD+kSRAOfg3uDprBYBlxt5LMbNR7tXlDby3LJ/fL4ajjtGcnGZbes
         FSiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632306; x=1794237106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
        b=f5tz2SZbfZsf5aOnK+6T+MqtX0I589kIhL7nsLxs+QXxVf2bDnjcRCvbEw4KE16D7K
         A+27/6+3BmbnHflQAGyWxTuCqGRGBZl44MRge6rq/iWBF6jPHjN+BPAbGFw1qRbSeHYm
         1/39qwpAPAZp7XDfCMbRG+B9Yzp1IDS8jyJHSXhGLfTyAG+pDE1Tqv3WieceewluPwAq
         ODX54nE2vigoTtrwG5V6EYIj2Q92y2yp2rgmh7agR6GKZrlFHvEI0aQ47XcfoOmc010a
         4jgmlr1LB/nVQ3rEhR9snWtak7dk5xdN5Nu9HkQzvp718Pc5lJaGOTGg1/s+Cq0uBmoq
         Hblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632306; x=1794237106;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cL6n+zQdSC5QgGSMPNoZjthmbWPaQneBwBTcwN44VQ=;
        b=mtp6xh0QrYTN3VpynDEdaeFOPUH5JuZjNQ7ynA2WB89p5ZzZDbkbbmjnjA7rr3j/ny
         H+ihhAwVohVmZcmaU/37asxFk5uW8lNSeyuUENo32n42BjkCH/G14IndLYVPojSCiB8T
         7NAj1HIkYdoU+FC6IYAug4E5s9T/1Frl33c5yiqugJKmroJ/hZD/q0SYiP2fyYRobphN
         rJ2heSxQE2eTKTfgqPchV1TxKY70fSLBqspt3y3Us/uZWXiY4v3CQ4+oDV4GZnloWrUJ
         psybgd6jURGWUNa41gnOd+uW1olvJEEo7HWyuwU3V1yIEaSIZtlneYIqSFlT59SVlWzl
         /Kwg==
X-Forwarded-Encrypted: i=1; AKwUvBwVFaEQmFxvoOJfp0fUO3sDZHWGS6L7mmkVxiESEGWg+VxmIzreHtCY+xGIkIT9a7t3D3VQKTnX5ipKZ57J@vger.kernel.org
X-Gm-Message-State: AFq9FYIACTtpVLNr8nGdc2iXzA/kA5RTFyoounssRHrUxsBZ5bOitK4v
	cJmqClPgHFHbaAf1DrmwlX5q+0u9VyhCLUKsgM0UPPXbHvechEnVC3tbCrL7jZRPf2mVNBIBJdw
	UgqayQv3WLnWmisJfhnoCJ8OMXVjkaROpNM64+lPHVMzp2uq5p1M1p+exnkRdmz7dQkNa0+VLjT
	lSh2Q+owx8vgIzNyKEQ8e7XaN1semN6BCjtk3Oo+xpBtU=
X-Gm-Gg: AYBFou1ql5ak27vgeSc8Ml9aj1BnYxs1fBtcdvI2vgFu0zhMTv1G054hvf81zKukgxc
	5AJFTsSY6UH7OAYTQdHO0dedTgW7npBlF8HF6tMpuLA7D0xIb78TWdpBBWFXB68TEKzu44K57Jl
	fLvy6oMceSmIPX/lnXCh/dtHpeCLjm+3um9h2Tf8vPT/r6KQAqdqsCVrL8eXfG8JcQllnYB4biR
	U2nsPpjdaxgDCBMe4Eiai3BzUf6vIMm8D9TEqw4jB09j/Oxt7o4pqtKp/tUJ32sD3v2z0ol+x8=
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr6752277b6e.14.1793632306494;
        Mon, 02 Nov 2026 07:11:46 -0800 (PST)
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id
 5614622812f47-5640deea502mr6752253b6e.14.1793632306115; Mon, 02 Nov 2026
 07:11:46 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-5-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-5-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:11:33 +0100
X-Gm-Features: AclHuK9h2JSkbUMAvyoRdkyclLVmAHb1v_zmAVf8DqDK0h8jHaRxmYbby2gpM9c
Message-ID: <CAFEp6-1ojA_ceOvaJtvc6Ze5DKPJtbX0mYxMcEj6W9JNb33gXA@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] media: qcom: camss: csid-680: Enable RDI SOF tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: XhyaXeildwBUZchiLuw3jisWce2VZBPJ
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8a833 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Lk1wFp84Q21arWboEzQA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: XhyaXeildwBUZchiLuw3jisWce2VZBPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX9aIOlyl1e3o/
 xFLqj6fH91kbzZYQU+pAJyqL9mqjv3EBw3kdImTnskPczAfTy8fExJmkaA5cNy1yOhp5mJHYvy6
 vrw/+btzgIi3uSO3PzIqteE4EJD612MUpnWNiyGLvhyJs1UbORtWB75SOW42nRbX11fRuMrPir2
 rM+CULR6grOIvDZ2SgYnd9AT1jnkyu+4+uT7cbDjU/gzZ2mzt5OMPndyN1F/EvekFNgjflzqevy
 ahJr5yOg/kzsHiVInAmXCq4c+a/vgGpKnjJxh8C4oTnLy2f86lrOwfqNl4N3N+6jGjLgOfPQtU2
 NczFbi9qSBlwjdr6dqvEA662WiK1IWTUZDRI63Ql/ihA2wfHybynu+UJCz9VYmOUlKITnjpJZr1
 mHPSspzZXg3yQqvGYDI2ItB7gwnJvUxivTG8B06m7Rolh4lylenWFM8glHjW9/kA/KnJZ9ANA6Z
 fh3azo7pC6rOoRBRlQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX4T+OXmZX82gg
 2TurpHoBwY7rWv6knGXxS6luvtMrBHQMU+hg0Mh6KCxTNs3WYisUIX7PyIUw4f1bBTYAr+8o1mb
 qmcUabQ7r5OKm2/AahgOgy/K72JGCDw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Similarly to the sm8650 we can quite easily switch on V4L2_EVENT_FRAME_SY=
NC
> for x1e/x2e which uses csid-680.
>
> Do so now.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c | 18 ++++++++++++++++=
++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb947..452640e72f6d5 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -296,6 +296,20 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val;
> +
> +       val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +
> +       if (enable)
> +               val |=3D CSID_CSI2_RDIN_INFO_INPUT_SOF;
> +       else
> +               val &=3D ~CSID_CSI2_RDIN_INFO_INPUT_SOF;
> +
> +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         int i;
> @@ -307,6 +321,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>         }
> @@ -395,6 +410,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                 if (val)
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> +               if (val & CSID_CSI2_RDIN_INFO_INPUT_SOF)
> +                       csid_sof_event(csid, i);
> +
>                 if (val & CSID_CSI2_RDIN_RUP_DONE)
>                         csid_rup_complete(csid, i);
>
>
> --
> 2.56.0
>
