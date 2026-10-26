Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793029435;
	b=ANtR3HSjsyPvALrgW0nZZevmwBZkX+WjfSwgiJRiuhyMrG3ffXSK+Pc3xdvCQIjx9ZLP
	 MQc+3PQkkvRd0gH4FGfUi2Urr4gqpQk/lvyYTiu1+AndRHzyX2dw4HpjPI5WUq94Qcn7B
	 5jsYRnz9ZQAWLa5/ldjs2tfFApKgQ3bda1wBvsoFH8Jbuk6EM5MYrZLUD2uJMp5mrBOeZ
	 7OvpVbX9V8bWnlp8TxJg/jd8BzWtl3sR3QHYXjvnOZ+4HEgNmmFJbMtQM74tw2v9RV9hF
	 nHsbwJeKtCD+qKLpx76nZzW7lbQQxpBHBH4DKaYsbDS7jh+VwrgxPghWXhTrbkLLnNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
	b=Dvg+0XuKA5TH9RuunronkgJHk/PwpGv0FvHWtnE/LFO7GiUUpnKTVw53TYz4c32Vrdqd
	 5FO/QXM8ynm7RQRd7nBIdeSFET4xxSjncOB3NtON5b1t2CLPDNDXV1zZnphfypiSh92+q
	 aIeNQLOWRLDv22jWKWI7R88BTpvCvMmIyh37Q9Yl3atosBtgMjY7KoO0oAkcGs7S88bJL
	 B7Wewi1czBy6evaATOvWz19HRVy6haIkSSKzJ5GzY6ZQAiN1Tm3Gur2hsufQccHuSMFQp
	 W+meU1rS1tJaX8KpHuBOadU2I1vebpkwaa+lg8/6fXAkP6P51rsCYiMNUzs0f/2BHvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IkEjWRiy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1Nzp8Me;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA0C606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FA0C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IkEjWRiy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P1Nzp8Me
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvtQq3567352
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=; b=IkEjWRiyOlxCruq0
	JSnKKu+BpfsO2rKdWcRskAEPFbSQG3Q4Mp5lY6t9F9TEes45H0uJuGoPlYwO3buv
	09SFvIlRflSdiV8tut4gJSuRe8B/scZ+nZH6o2KrOAdn09mEoWvFkLx7Spod6Gms
	UVlnZjwZ2XwtiQgTazE1DWWnWOl3jcEM7jTwdcD3ukhHC7pVkBGk6Pf7uQCwSiw0
	1Et66oHUd4Qj+wCwFVGpyYjn+2hGcvXDAZxqB6pMuqI+iRuYOhp4oNp6OX5RpuTd
	IVI4EiLkFswG/1xOHPpzl1l6tCfGXP7ZsuHrrlitGe4Zc3uEGPXRKMoWwfaVplL4
	3uJjeA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj56y1583-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 15:43:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb6391e89so658367285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 08:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793029433; cv=none;
        d=google.com; s=arc-20260327;
        b=OMjE9tzqbUUWRZ9UkB/8pG1Ik884R6EZUd/TliG7nQqk3JgpCYgl+VweSupBw94QaO
         tXIckUpbJKCbJTNKNGTXDQDrEH1VpcGl42TsReApxM80Ad9VoMpEUXx5AEMdqXxq8h57
         aKagNmHpd7hiYZg6uR4RL8kmvShlnxBxp20IMgC4/TWHbpSAkHyzlmUH75JJ679xUmgV
         QiV+LN+ofx0vV2XMfoEw9jezrtJV2nqM/YsPAY0DUgD4bBBfmkWrW5XHHthpLT9Zp2qh
         PnjjB2ctqUddOvmnRAXFR8c6DnbjXa/yiBmbdv1a5oGdGK9S7O8UPkAs3sBO7zle1yy0
         uxQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
        fh=8jNu7fxcRcXFXI4Tc7L1UAblElW/mfvlOre4f2r1nq8=;
        b=kmByzbXbVDjrzCEqfQ7Ft6iv1JO9qfuj5wiD9HBoTsGdebHI+oPS5z4UUUk9tWCA7z
         cAlZzhQED/Y9zuojaLhGnqgVotwxHMYeWFPfEFDAhEa0VlosHoOcw6PJDH4VgJGme9kN
         W/sY/bSEwJZZgx7ZgcuVohDljeJXwZqFGuCqHmjrLmOH6D5qDWcjowM0bEumSnrjGVZJ
         WanFmIhDd00ieJLs8yENXzJbj244c+MwA/2HteuVw8qWHLChkMtdHRMEXe8zAi+o67lr
         t0bwB/PhcEnd6TrU81Hg8r76lnFYmJ5bcveugKPz/3uNd61Whz5lm6cSF2YXB8VgwCLO
         FJNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793029433; x=1793634233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
        b=P1Nzp8MeGAdx21NwGAprqYSK0aq+SWJdeVTC47JQ+VTeUEqyFfKZoiQyD716MDw8QK
         1MUHvc9KAoOApT01YmPmvCbBeX6/YbeV0GCPyIXRsCmj+MQPeGHw1fthg0xnUn+vRpdz
         bFag+H2WcnAZc8/rgbSpyxcKUWYS2bzfeUrYZ1d1rFC2BNtQL72SC8SbWaQH69765zZ1
         Jn4ou5i15heaQbpYXNsgM//SYo6ZJQzdlUyma9PHgiZtdZnOB2pcmNpSHue6NzNAfnfp
         Kb7huSMkjJh2qbzVxIP9KNmkN4UUl0EootHvCeFwRJ4t5O8QxR+u0kceMlBI7Sx4ENUM
         AiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793029433; x=1793634233;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VAayBo4wWky6fLPwDPFk8Yl4i591bmPBQpuVqEWBml8=;
        b=Rik4pOoqGbnGYtG7BJG1f1RztEJVVFETbaPyiXFw4If149WTodbDlNKhpxTHQo9IBp
         3rCXhr5No+Ng59vlk9Y/WIX3dsGAvh2tMFRfdn82FyQOnm8ItnW1izeKVg83LCgdLZRk
         8CeUm0N69uYQ8OTxf+z+lM+7meFv/vrb1Y/YBtUCgurOWe1YoAXuBEkuKmUByqZE7Oqg
         7OYbys4JgI9qcVCN4GY3rx/D9mEtwVgaXoXx0cZTddERBJmQvQUGs0R2uf034t1+Iowr
         XjWo4NMKRHNXBdPkhUi22NLW0LNb6o5brngGkBz0B4wsnBiweF3Vg+c3Yjupqye3OyJf
         5Hdg==
X-Forwarded-Encrypted: i=1; AKwUvBxmleuN4jICNtyMT0qD+NncoIbu7Rcs6hQH+r3suyC0l2SZ1VDEHBV+GHQdJnnO3W0XqQQRhvO+Iph2JRb/@vger.kernel.org
X-Gm-Message-State: AFq9FYKjL29hDAle2dL9KtXuhBAjYf5H259E7IZSwks+fyT0KtYhUOYk
	+k6hnylnR6rICBVd74ifVpbT9mwdzLEM8XKacPe8B+Rr20dsUD1aqMLVx/IVRPF41lYr1nlfyB/
	qABcYpX8BqITV1YiHan+gQpTsjZh7h3t8Lp4lRqN14pUbgN8HbeQgFzxMlrVxOt9pY6St4IFXUW
	RQTn6MJGINtb3v5Yp4EJ/CqRvT6ym7Z8SWtblPmNSBdqs=
X-Gm-Gg: AYBFou1SPOx/WIjNrBRJjKBG0srj70A+05CoE7JHQWxzvwcfuwnwYT7MOR/JBpQHNRW
	PIifWduEBuXGx4Dwvw5KFffCP9cE/KhzLlCnPgPwF0kD27ZgUArOcmTKXBZtqFvyAsCCb+l/ZXD
	u85KeqQEPCf/pAnGejetEdWZmFch+2rl9cMKeBb6hy9qiG//6Vcgd0anhQ4RNxaEhIRyG6/b/vN
	zptFHArsf1fz9LIFoWp1jS0R/XbDdO1jhBo9gkMRdYmJbAKxT7l7XAMR6+UZuiHn9qyLU5YjhwN
X-Received: by 2002:a05:620a:2849:b0:93b:d79a:c45f with SMTP id af79cd13be357-940ef980fcdmr1135328785a.55.1793029433377;
        Mon, 26 Oct 2026 08:43:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2849:b0:93b:d79a:c45f with SMTP id
 af79cd13be357-940ef980fcdmr1135312885a.55.1793029431821; Mon, 26 Oct 2026
 08:43:51 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
 <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com> <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org>
In-Reply-To: <c9d017f7-f072-4533-8b2c-a87ed67a8712@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:43:40 +0100
X-Gm-Features: AclHuK-WG-4gcISyaPUABijXSKs-Maj7Gjbye3YNiujrTyxXvxIZ6qWwMAmUkV4
Message-ID: <CAFEp6-2NoJEfH7cT1jwtHaeQW-__A7OeCJ2rY_j4f_65wHQM5A@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2MiBTYWx0ZWRfX/HBPfdt4yvWi
 hzgINDZ7Of4FfXUfvx9/dTFOUFeg7g1WXqC7UcuDiz6FT08Pj6o6MP6DtncuVx9P+lOyk2yuth0
 Rrd1bDu5Y4foWKzWg66y6DwOTP+Dt1E=
X-Authority-Analysis: v=2.4 cv=eMeGH3p1 c=1 sm=1 tr=0 ts=6adf753a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XjOppi-FBbEB9_Q7RKoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2MiBTYWx0ZWRfX1+XG2cB5lJQX
 sClTgLyTVaROX1slgVLgup5iTw/fD2kiV7YesQi7QPVKrPDagIeFO42ww9PdyFClFEPXQQHloJW
 tBHfJdMkrD8nbW95Mb9MmArxDXHtEGOxtlRqViHypEqFVKRs6M1Yvq3/iiso394dH1/Ks/bQ53S
 a8ddbghn8kvnek6M8lJ0X5D0uAUIMtV3QFXbPEcvFTPXyqTgdtQQ1bLB8hrMKdWupi6hURbSujQ
 ckmo0uL6BLZkXZbGg/PzacKzYPQImOYXGqfjTGp+CxoMAp5drktA5+TWLz/kGcBGTYcnwfXo6ne
 iJe8oWjtnSIEhtn2L0QZA+cifgcA2GNnEXr0qFi4vIZIP1QCz6SVfjwwM8LkkwUZ14AACiprMXa
 EKiHEcPCVAI/EywGLwJIIhD9ujEJE/GaDWJAju16IedKZXJMJnAGU0R3hy4JdEoc2VVNSPQpvP6
 UEdsvXahQoWEKXzjWEw==
X-Proofpoint-GUID: 4XK2MJ3ftP7NE7kYNDucYvlFvuXkAPQO
X-Proofpoint-ORIG-GUID: 4XK2MJ3ftP7NE7kYNDucYvlFvuXkAPQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260062

On Mon, Oct 26, 2026 at 4:24=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 26/10/2026 15:03, Loic Poulain wrote:
> > On Mon, Oct 26, 2026 at 2:37=E2=80=AFPM Atanas Filipov
> > <atanas.filipov@oss.qualcomm.com> wrote:
> >>
> >> The VFE fails to power on when the pixel rate exceeds the highest rate
> >> listed for any of its clocks. The rate tables of the VFE clocks are
> >> independent and need not have the same number of levels, so a clock
> >> with a lower top rate than the VFE core clock, such as the SC7280
> >> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> >> still supports.
> >>
> >> Clamp each clock to its highest listed rate instead, and warn that the
> >> pixel rate exceeds it when the clock lists more than one rate. Take th=
e
> >> clamp into account when another line powers on an already running VFE,
> >> so that a clock running at its highest rate does not reject the
> >> request.
> >
> > Again, we retrieve the pixel clock to derive the required VFE **core**
> > clock rate. If the VFE cannot sustain that rate, failing here seems
> > like the correct and sane behavior.
> >
> > What I don't agree with is applying the same logic to other clock
> > domains, such as AXI/CAMNOC clocks. Their frequency is not directly
> > tied to the pixel clock, but rather to the aggregated bandwidth
> > requirements of all active clients and data paths. As such, deriving
> > their rate from the pixel clock requirement feels inaccurate and, in
> > my opinion, is an abuse of the existing logic.
>
> camnoc_axi and camnoc_rt_axi are matched by vfe_match_clock_names()
> today and have been for a long time so excluding them would be a
> behaviour change.

Yes, and we're adding one more in this series (AREG), so I saw this
patch as a good opportunity to raise the issue and complain ;-)

>
> Perhaps warranted but that would be a different patch for different reaso=
ns.
>
> Upstream:
> return (!strcmp(clock->name, vfe_name) ||
>                 !strcmp(clock->name, vfe_lite_name) ||
>                 !strcmp(clock->name, "vfe_lite") ||
>                 !strcmp(clock->name, "camnoc_axi") ||
>                 !strcmp(clock->name, "camnoc_rt_axi"));
>
> Also - RDI path computes
> pixel_clock * bpp / 64, which is a bandwidth estimate, not a pixel rate.

Yes, although the PIX path clock requirement will likely always win here.

>
> > So I think the implementation should either handle or delegate to
> > separate functions depending on the clock type:
> > - Set the VFE core clock based on the pixel clock requirements
> > (typically vfe_clk_rate >=3D pixel_rate).
> > - For all other clocks (like camnoc_axi), and until we have proper
> > aggregation or voting support, a simpler and safer approach would be
> > to select the highest available frequency.
>
> That's a bigger change - this patch only changes the top of the table.
> Setting to the max clock by default would burn power for no reason IMO.

Fair enough, it's already an improvement.

>
> On the core clock though I think you're right; if the sensor exceeds
> what vfeX can do then failing is the correct thing to do.
>
> @Atanas could you keep -EINVAL for the VFE core clock and clamp only for
> the rest.
>
> cheers.
>
> ---
> bod
