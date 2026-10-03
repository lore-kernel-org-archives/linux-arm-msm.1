Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A053AD503
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791025875; cv=pass; b=cvScbV0Er87Xft7T0iCEr0fEVhSS7hmArNYv+fX0Y6dgmu8pgA8UP4FmZ8yotJPRwwNz8quWmTv/XU7Gi0fpX4YvVOhJzVyd6dFPPUrbEhXS+JtCq3x0FuyeL1Sqm8zAD0zBqlu9JJBF9eDOcY04tZoUM1dXmzTA+iGCZISZA44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791025875; c=relaxed/simple;
	bh=QSTsi0xJf3W1mpjWc0B8G2aXS3mqDz2jPj3tOwKmY1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZeFZRpumgkRzQ38yVzj/Cl8k8lnyMlw6CQdzIYkgy/kirCCZsnFfQ703gx/SeO9cF3FJ1gOzm2qTM1FirEVKdLDcMV3Gfmh4BSy6mgafE2gWEP8YlXp3iYs1oQH31HVt5GtRHLEgVqBQ+nyPiISVqsNB3s12GGKWFoJ/4ahAJyE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2oyxHBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ez6pS71k; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2oyxHBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ez6pS71k"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 693AtmvL3463667
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 11:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=; b=V2oyxHBBB1jvM5Ow
	crcDF4evfefwb0OIznLHLFoXGMh8i8tfuPMFKahTZkdWR7PrsX6H09frhmcdLwLX
	6FyrQaMvTJ0KxitESHH90u60fJA9QnMRhB5gQp18KmMPPriZaT21Dr1MObotAKcT
	VIGDngQ5BrHBgmQVBEZhOFJcFntKAn5nupT2bRkQpF8ax31aW9/FhpAvcjRSDhw4
	tUY7FWyVu19KLcvjcrA/3Pe2Q06+UDZs3sB2wbeXL/mNxxvcDFLw2qynBj35j3mb
	rcYtBdXHH2h6ozG9pubUOJ7ejMv9STp07C2ITM9nR5hztFbge7lMqRaGtUTiQLqz
	Sy2YNw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08gkdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 11:11:13 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c99f26dc74so212935e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 04:11:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791025873; cv=none;
        d=google.com; s=arc-20260327;
        b=nvoRmQ/BpmP4F1WR+00pXTCmYGSJEQrbjc2WQvlsFq3JpLK4Xkcyj9MyQ7Trh2a/+B
         w6KHD7HyRpjI1si9jWiRtWv+XDPVVv5rNMQpLYSoChBRIS75UOqw+Izoft/nJyTqmPVY
         fm+R07d7/iNJjuO3XUM+vTQPR+6JPyAJKlz2lkesqw0ovD5xil6+I+U6rpWw9tG4a0kh
         BzAk0HmB2gX1rVqa6DmR8sfeT/YciK1SukRNlk7ek1xS+mRJpp/APABwoREvBPHpJ0WX
         oUSfBaYtKjG/3mWhaJB0cqYPdMCP8V14cPrf2f6qg+X8jnY8IIWgqYFFPfFosQw6DsQn
         D/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        fh=AzGTRIGQ1s+sKVmWd/1lqiHYUvdv1DW+SaC3TGSTCms=;
        b=QdqiPPETTr16vbdLaa8oTYhH67zEey3hC0aS1bTkz6+fAKROeXKdlwhCLCIt2sS/Qb
         kuxkvvVL6mEjIqCmhyaydVWIMvheh2NS+yYsPoOxD47zdAWpXEGlUAjnU1N0f/jTKgnb
         RSILjCw1ABtKUJ51JAZpNNKb2q4toCl5RUe8xOLkTYYkjV552potndp/wneTzGKunFpH
         CjCbyuT7jQ38uqFhxM15xOWzqAU+9S1loXxKjiIqmv8WhVWmjlIhn/2jYipt3wpLQmhh
         Qr2XYtHB8Sp7uGvKQTKJNOC3hxnvAEoTPl9jXQiv7AbN/2PELY3NrUNVH0yp4iasJSuC
         85Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791025873; x=1791630673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        b=ez6pS71k7225yfO5SQ5SIyeXqnSI3ya+9mGeI0QVId4tIHRvmUrWmUUGptxbB8smOD
         PeetxH96f6CI0DdvX7sXYqex2hy3dQaHLDYHJVAklrQ8iQyTBbwn+IRtnscs1j9drPWt
         vlMkD/F1ewDkSNmzbiPK7dgEaShnxVIAPjjhozlY0R29IOhOMPiwHntU6nPBYN2KyxWg
         Qp7N/li4CFsT+4ZEPmmkJD+kbQSeF/AKZsSk/JiLX2Vjbl9LyN9bZrc2Nk6OQDNGXtDH
         R5pXF77jFVHCCcWOWH76EVn//N0aKU+8A6AkMvMxmNljjg1LVOwZbPFaM8jtcMXZRw2e
         7t2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791025873; x=1791630673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UE2uEuYVLje6l25RVb+6f3Yk+oZ8JPiWMgc+3V3C9oI=;
        b=wJhEF8zp2h5ZXq9cGtPE4mD2PzPEybvsrk4rH+HJghywdgj31z947505A1NXWw8aAy
         ids4qVilpkDXxy9/krJJFOWhqW+PL+rNf0j4QGlsiJy2dAKQoXU5BF65+sGV+drTbo8b
         6kfxXTxOrWAajl1GclBbBN60tZaNhP30P0kIaYRuPQmEx6xkj1KSj85/f8DACYEkZDws
         CAyOabhQ2bwpKd3PtXOydZLxh+fj5A+CiWY7A/66fcE167ATmopXW6B25xhhUJ859MnW
         l9lZQJBdrYcZU3x3LmRxICXPHcRyGoJ2WXCMgQqygFpBZSF7MH53JOZ0v7s22u13ATqG
         45yQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9L3FMj4GC7U0fNF6BerNNQ2z7rxsuGpqm9FO9+bL3u8N3lPsFswXzQjAo5wPXa9pzwPHjIO3EC0uMNcUV@vger.kernel.org
X-Gm-Message-State: AFq9FYJByCWFdzX8xsvlgDtg0teMuZ01TDr2bTlARJqwbu8CnAJmdkhE
	xkbSixIwQwQbydWlXsSlFCAe3hcII+YGWFz5OtHLfJokDXhpLCGmlUkTQdJH2vUAPEZAqUOM92z
	i3Y9zO9sGSjXsORXnRQqz8Ppkf+2gYoe3YMIhcaJF/K4kwTL93C3X9pcOrQIKBkE0qsnpA/gAz+
	I07wpKuMkiDPQxEsmF9sm7cOuov+uAg54Boe1WVV7Wues=
X-Gm-Gg: AYBFou184LekfxNi383CUbMUmAovOvsXmIrpn1LbbcTAmzDHyssa3vDKzvGJzczv+Ph
	CfNGnbxi1t4tGuxGjFfT41+etnRKz5VxkPD30PS8xJL3qgou36bZrtYb/Z/JYd6Gs2Yu2wc3SGN
	4O8he9fC8BuCUq/nf1piNiI6f/Fr3GQs6h5fTU1qXRyw6Qs7O5XKw4h9SErV4EV/tO5NHUVeY7M
	Op6Ki0DH2GJieVB5w==
X-Received: by 2002:a05:6122:2106:b0:5d4:f492:bdf4 with SMTP id 71dfb90a1353d-5dab3357fa0mr1691059e0c.21.1791025872941;
        Sat, 03 Oct 2026 04:11:12 -0700 (PDT)
X-Received: by 2002:a05:6122:2106:b0:5d4:f492:bdf4 with SMTP id
 71dfb90a1353d-5dab3357fa0mr1691051e0c.21.1791025872550; Sat, 03 Oct 2026
 04:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
 <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com> <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
In-Reply-To: <fbc988c9-d701-4479-96d0-f18d92063f31@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 3 Oct 2026 19:11:01 +0800
X-Gm-Features: AclHuK9kb58p-lhxZ0JM2phaLs-oK0O_r3eZlqRT_1LCVxXx_9IYV-_oLUsV2-s
Message-ID: <CACbMrhrB0k27wBDgADSbhD8Cjyx_-xBvgCOXcwXMxmxxuEhBGA@mail.gmail.com>
Subject: Re: [PATCH v18 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: nzJeEW_7KAYuC9q7RnhvwCm69hZCpaQW
X-Proofpoint-GUID: nzJeEW_7KAYuC9q7RnhvwCm69hZCpaQW
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac0e2d1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=kQtmRZuExVT1y5CfGhAA:9
 a=QEXdDO2ut3YA:10 a=1SaFWpeTM14A:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX2vzz8Cf2HPTA
 GRX3PaAfTJpPaRhgWcildQorinZ583zUZCwFuIoyOxY074P1w+oav0KrqLOm6rKu0lYwuEXs4H0
 ULITcu817SqS15euB1k0SC02RrhhuyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDA0NCBTYWx0ZWRfX4V52Daq8nBb+
 dm+IVKr1MfKsfZGtTFFm9BJZLHzIUX5wx/WxhA3/GB5wT8YdI8aaDq++psjAAkS8DXDEsvJf5dT
 Jx15hZaxDDmR4dUEwxn0eg2izEFrM5/V8yyPUhuQpxN7PWe4vbWJgfZgzVhXGED5dvGMFeBXPSq
 BF5HbWu/XRgyGHE2/hmKVvIjOhofsoJhoSp5NLAyGN5xpox1Uhe1QkiikywcN7eqBPd8D6cxBGv
 2XrQWcxhc2HbK/ATFO/I5Q3vTt5QZfF4Qqz2dsrX1KBkbift0acfDTpNfdX/7GCQ4d0xLtmRkwp
 /elMOiWyujgZFhDoCATJV2g6lJo/FZJYAr7/uo++IRLj8z4+65xBOgCzIt6C1l6PWTXjiyNZg47
 wmC9MX42XbZpr+eStgv+KbM6155f99nKLQRiF+6ymKUNu44KVCxKOzixad9YDUZjPMQmGD9O9B1
 QqZaN8rZV+0ZFpVN2EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-03_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030044

Ack

Best Regards,
Hangxiang

On Sat, Oct 3, 2026 at 5:09=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 03/10/2026 10:02, Hangxiang Ma wrote:
> > +                     .hw_ops =3D &csiphy_ops_3ph_1_0,
>
> There's no reason to continue to use the internal CSIPHY hack.
>
> ---
> bod
