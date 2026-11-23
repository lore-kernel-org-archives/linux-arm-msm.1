Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427330;
	b=uU5D5pn/hq10XXsuzh/8XoPvHkN+eHf/VxWnKiBMSr5KXxOgUsGZuXbbcmCYcDBUgnSF
	 tzDgpQr4RzzXpIGkdPi6d76W8HvhNyq29L4bHA61FTraXEPfb7qnr7AiS0xrwc6g4maJW
	 fbpaBPQse+RYm7QCwtKgXXSUSGGbJuxQ91WWEM7jDC2MWPQe7W2CmH6HRsaBzU91lEtWs
	 STeFwo9iUst/y9DfYrCnkS1ojohoAxzBaoJ8J0MVm+uP23Aq9MVJMydNDCASnClKI2TsX
	 aGOjHMB2dk0PDBxCXXaXJOcPiaHPdbyyiXgleVzs+fJGjIQwIQguY7EdqID2FC4jQog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427330;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=;
	b=Qh9xuyTqEcQAfqGrWMGtXNLmVuQdGV5PlqrykouyBmRmOlncJWjAB7yW3pYl6WmHxShl
	 0ipAHJRUYyWpx2OkPqq/ftiOgW/sH9B+sgCnWNpm2jP05kso51SNp0aOroMwu3ySfGPqV
	 FYkPxcnc0cd7Zu3Ybq6dDqfZ+8LtazQzclTbYuDBaIiKcs4sY0BAFtQjZbdKuVpae+zlp
	 MQf9vl7OVlCznEtdY2XuYZEwoBb627kPSUGc24J34BJ3hnL5InTMiOm0qWcwcdWMhFvyq
	 35wnww+IaIEMoo8M4aamK08vY7SblJityNkbx5iig8OyLGpXlPcVO8+FCstQGr++vYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dh7pfmJo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="jt3P/s5+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1DF606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A1DF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dh7pfmJo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jt3P/s5+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G2oG1428506
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=; b=Dh7pfmJon2xOpRRY
	vHTpijLFN315/Zgm/NzwdAffjKE+xNzkTIQpinui/FQDJhDuIjgO03oxpWPr71xp
	9ixtOAFplQklbD39vx4b0M/b4+DjhJGkmmYfRqHF5jQj1sdAPQjd+0N/EjqBEjgh
	P+xrPQDrMJfKxLJb0bQzziU8BP42IyhO3aIfCWn1PROL1Lq0KRkoXP1nHYHBmuWc
	3cc2GHIhWBwj/A90G4Bsl0lidJtyckfxAd4OSmHm4ME9luR+HUj9bOqCmT2MT0IB
	dVresgt8XXRlRsFn8rH0OB1LJyOkDKbVRxGa/vkek2Tw64QQrde17lMdxop4wS15
	XXOXYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyh0skh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:48:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94961ed97d6so555524185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 01:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795427328; cv=none;
        d=google.com; s=arc-20260327;
        b=R67ij5fPBD9ZiPSJQTYRIeOGVgLSTIouL70snhPOVOXzYwwEbbqvUtwCGsZM8yLZ5c
         UEyCaKhbbrHXKHPOPUbbHD0yppHWkYqMHJBnLYctUjifaBz97LnQYEsSiLw8+1KMuZ8L
         w0RuAwcpxjMre+lFlsaU0bIOleVsQDFtZl/bAJk3xDAv+0UPAEzsXA6ee+A8VhYZjexA
         XYajS3yl9ClSdwJ4a9lBfTuJcW3tQbtLtp1A1xmLMlrYtnqrf1mU/1XKd2FW3UaKQCA0
         kQOfxdt5TgZt9VjHZ/ycnwo6agC2GDx47ljoVnhytzxQx3Xhwh4VS+bVORtd7i8t33OT
         0eZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=;
        fh=raOmplxHDUZv9ISVSYSBKv3bkkTDLDqtKYYPj9Ux2Eo=;
        b=dgPGYXW7E/+YtmwsiL0/I6KEUdPGPr/HgevV9hCjCiKmdgb1ILVKsAwxieVGXGClx7
         wd0EGhJKpH8v6w99d7zfZ3uF70ZjgS7o2q2S1xfNhTKKhsotGjPn/aarhSoEGjL8cRBR
         8aYTwlLi7Ky6SJ3gcH9YekOFuWmLqORtBWqZC5q99U21tR6lHR3rPj9pLTW1ayE7Y8kS
         BrY2MFYSQmyI/bJwVEEKgPjnT56xbHk0n5v/wyf3N0QH6w/TyJvo8tSAyFNsABjUP32Y
         ouXQcRjg9Y4kk0OENgsDzCEaV26fJeecu2gQKq3aN7gvgucEilHKUfK7c2oPsS5InoJZ
         iCfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795427328; x=1796032128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=;
        b=jt3P/s5+ENlIviR2wx0cOsaiGSRXhRKSBl8V6cPWqi2ZG3oro8DuunPd3Sn+rCFX17
         zMfVgfUhDcQwjYv67hLX8TIi8QSAS7q16MgErLwLwN4/vpVDQURoPL6kotPlQu77s7hD
         mIzg8Yo6IFeiWl+PBc3ADTbeWDSL8sFshbFzYRsxO/GBPG+uTm5zc5jr7Uh/hZDpJM15
         kxDlKi9dYJekquYh0NAZ/3eFIbI2dPK0BbmuPa2osW8BjBOJnayw/MPIxWmY4uE1gsiS
         XZReAQ25OiTQEEaZAOIE6qMYS545ii5sEe/bl/168NoEa8g8bfmno+aKs35KSxhEoipZ
         jOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427328; x=1796032128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1JevmmXLG4619WCF/dLdRj9+CIwlIBAaa4fGnyEuVbk=;
        b=oxsbli5aMD4MFRsf5g0yBzm+J1hJ7KzBgj6ebzoKO0Twem5/dFbgkmmkTkvJ6a4elT
         1JUr980W3hfYWJUYj08DuYRCAVc/xyFrN0J8q3ymRrSA0V9JvsQe2+pRLT068WAFFcl9
         XbiIie72j4EP4KAvqzsGU7UsEiFPLHUdpQbzEMW6kLdtkIo2llF3PUCpwFatuDpog8zW
         5Gnv5pfze9JUvkzjlG0RSIs4JHQ8AFJrkpNnUnRkRv1Pk4FVxSj41vJUYjvrjF1J7cwp
         DMWFz2E4NAwC9gdqrUvMA5GrSK5sho5KDmcD19wkbbTEX/a94zWHp1SLzXHlOZGOP5+j
         yqNg==
X-Forwarded-Encrypted: i=1; AL+hErEDTxbwanyt0VEWgNth62lOKNaqLtdRUiKZrD2DJyJhTgXEcacbh21lYOKxZ4CjwsUWF+kTGxvWPRpwH8XU@vger.kernel.org
X-Gm-Message-State: APuU4Z+724tig33QwW+4piKp6IK8R1cNu7zROqAwpx1lvfknCSp0gjr9
	IobOYoqvGHcyNBpmL20V7o3IQkCMuoRL7LIZ7/ToVfeALFIcmzQZ3CUNHbvMJMpl/OLsXI65xsZ
	6pPBLtz0nM1LpgVX6a1Gqm4/5HCvuilrfY+INHMTz90Z8Dp5FmmXuPF5lip8/jHVIpMzb7RwOkq
	vaBrbVwrJQwJrg00BMH9VAuc77Bs8h6pw3jaC72xlRBOU=
X-Gm-Gg: AZFdTZdEDUElOUwEJjssFhJKofTbqQ6IePN8sNsWbe4oBeprYa2brsMDBSTJdY+zM6B
	NMXFZ070h9F28MKQK7lWe/tOtn4Vo5H3XAqxpE+GVbc9PJO99o2RSB5sTcersB3f6xj8mNKt1Cg
	jJgBtvK8LwEQdfVwbzVS9YrWLc/gM6Hc1zACkq4B2/87c9jpioc6MJf9Ho8ndiAi7Uv4hveuIlH
	8yg5WqIT9nhfNHcQx6hggQegTMwXefjzh90ee0QLoVV7BAvKCMQ00xBxj6N13V27yWO1k83ymWy
X-Received: by 2002:a05:620a:6401:b0:93f:2571:c317 with SMTP id af79cd13be357-949b36030b2mr1965841685a.28.1795427327847;
        Mon, 23 Nov 2026 01:48:47 -0800 (PST)
X-Received: by 2002:a05:620a:6401:b0:93f:2571:c317 with SMTP id
 af79cd13be357-949b36030b2mr1965839385a.28.1795427327358; Mon, 23 Nov 2026
 01:48:47 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-2-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-2-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:48:35 +0100
X-Gm-Features: Aa3M54rkzVTTRdh6ivJaEKFjqvBZJ_pr635KpMrUDXoymBe5MH_JvdQ7RT0gKOo
Message-ID: <CAFEp6-1tFxSKQfFrxAobNfv269J6toEdX86MVMJxczW3NhWJmQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] media: qcom: camss: csid-gen2: fix RDI enable bit manipulation
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=NM1AaE6g c=1 sm=1 tr=0 ts=6b040c00 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=suyyOr9kuGJANmfVb54A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOCBTYWx0ZWRfXxxqs4h0Q10Ad
 YRcyBGuLzqPOrkuUI5wDpQ/gm9MAeca29+Z67zdd3s0hfShMeOr+Id3EcTraRWfdLVh6+FeO2a1
 SarWVIOiTJS0oTwFfIY0xemDwF0P7j4=
X-Proofpoint-ORIG-GUID: Pq1puK1YyuTnL5hZm0Fx4MAc5WWZazB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOCBTYWx0ZWRfX0slHePL0Esfl
 kGN0OJPB54l9dki6RiHVpK3aZugibnryrbJ//nlx9YNQsHMM5+hpH4FR+4HLkJubac4zmkMw0qv
 VaJ33/IkK3ICz/FTnJcV0+RepGlEK7Oz8Ok5vjNKaenojHVoC903Mif59wZCWuIjAqDFPYv4Hf3
 TBq+CX9VSkpX9gfUoiTTaCFdCTbVtNNWorjmeJRcZH7IIoKuZhkw5RiU0bypitYIWvhhIli2SOb
 EZ/foIZdusyymCoxJ2vB894Ovr3hlNND7RcZhHKunSuVoG48pgymVAfWJooEOm1Qng1TLZLjfsZ
 k4x8T9yjGoKa1mmo/DGvaE2mPJxsr3nlK3gQkO8YwcJC7IJlW3g7fT8OIalCIoGTgYSexItDbzD
 3xUVAwMzCl9DV7D6m8jnnUcXo8xJ+Wf4KXam5JaUlldet8aBwUXaHfed6Tm7X3OzdIl5kgtD8UW
 jVCRTnC6flgj+mOf5Gg==
X-Proofpoint-GUID: Pq1puK1YyuTnL5hZm0Fx4MAc5WWZazB-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230038

On Sun, Nov 22, 2026 at 2:35=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> In __csid_configure_rdi_stream(), shifting the u8 parameter `enable`
> (promoted to signed int) left by RDI_CFG0_ENABLE (31) shifts into the
> sign bit, and bitwise ORing never explicitly clears the enable bit when
> `enable` is zero.
>
> Use BIT(RDI_CFG0_ENABLE) to explicitly set or clear the bit depending
> on `enable`, matching camss-csid-680.c.
>
> Fixes: 729fc005c8e2 ("media: qcom: camss: Split testgen, RDI and RX for C=
SID 170")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f..804c8fe 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -318,7 +318,10 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel_relaxed(val, csid->base + CSID_RDI_CTRL(port));
>
>         val =3D readl_relaxed(csid->base + CSID_RDI_CFG0(port));
> -       val |=3D  enable << RDI_CFG0_ENABLE;

So, why not also making the enable parameter a bool.

> +       if (enable)
> +               val |=3D BIT(RDI_CFG0_ENABLE);
> +       else
> +               val &=3D ~BIT(RDI_CFG0_ENABLE);
>         writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
>
> --
> 2.56.0
>
>
