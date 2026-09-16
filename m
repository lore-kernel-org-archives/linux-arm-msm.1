Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC86E4908B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550157; cv=pass; b=XxaBpEJOqq8jEcJKQuG3U/qcz9p25LXxlsGW1IT1mYX49VsbyKj2lhXXsnYIFlQ2ex7mPjvZ1qGtqOLMXydV3pa65yWZ8rmB0yKwjuhzfxrO1AG7TNo4N7cMJMdfGQszXLYUjxTOHHgH4eS8xYgbKtRmcXGXg6aagMnVzQ0C1v0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550157; c=relaxed/simple;
	bh=eUKhNcWpU2ARzdkZDtwBSmH3wpzbtiCR0j9k5GGyr8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UqBwOXdd3ids420bqePY73Of7hA4G159UkloLzRKwojpRGiLy1UQLSekyehNoKNABlJjEk3EE+KDNvgnO0F6n7tGwnC0UDHhFMYxV2hi0ufauzdLHySUIC+98i8NRIdOvdMk+37MiahSIZYiQQDBSSOFBv17xa0wKR3Odw9SBj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zvc8Bs5i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GP9Hg8Tn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zvc8Bs5i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GP9Hg8Tn"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G930352822773
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USktFg+8SniSggZb7tvnYYwJ4/8bjyzpvcoyUOBNeTY=; b=Zvc8Bs5ipRjbNbxZ
	GXqUEMb4SfYTUx56DvNHUA2kzqVDMtdmZ0CrBI0Rz1gYI4yKPPDv+77dYySl4Svb
	LipDZpsaI4jTBVMdF/j+M4R/USG8O0yvN6/nIhUjJeabRdeMtPO5F0IKUc4Lv4lm
	QJ2q2uGXOiY/e08ax/VH/cc4+b3Fwmqj7+f/dNuVYIQm2ewF2zS9UGN+S+ZsQTZP
	7xPa7wuEyEXY6cRGnvfFY2bji9Ct3b/qv+S9kUIV/fkymi8sGjVaJ3VGocZ5UesJ
	8KydK1JPZNM7FV8+8GnIJHh4jTUit1CWkqFRuG2UN/9hsqhqfoGAExitP44mIVj3
	486qLQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfj137-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:15:35 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-86e8abd7136so61477317b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789550135; cv=none;
        d=google.com; s=arc-20260327;
        b=VY4jxmppdOKujnDsCh5NvVUGWJIOj7lC1KxvW0/mPdJjIWNuvi0ySWJNdvJPeOd5mF
         1n5m9ah8tUWZPSN9jL4kKSMJ8q+AFQmPx0rZ4QHFL5sPR0h/k6HdxHCgaNeZo+yrZbJT
         qQQnRDDpJohoRGZty69RCU1syN+wBSSzGz9ZqG36EK830uOoAtm9kxeHdGQm8yCol7VE
         8nVnEwqpMmRY5aa0EVDaDFn/ka2T9rhI2e6Z/WW7yKTchJ/3nCSLZq+6TDsu7kEmhjpP
         FEvoPl8RullohAnfnCUpjpRZ6jrTtH/MPRRaclRTgQjPHVeeOweNuoI+MjUqzV9ApZeL
         kzmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=USktFg+8SniSggZb7tvnYYwJ4/8bjyzpvcoyUOBNeTY=;
        fh=PxV/9g2ZQ5xJlM4wXANISALprqAaHW+PfNu4Q1vteEI=;
        b=lNCORNuaWRa0iOr7btcr1rSJ2LppwU7Fu3iOBDk/OxNhb9VHQZPn70UMppbdDMP/Tp
         nFCSWm9TFHjnDliA7H2nbGIRrsm/NwoxHYrXMWDtiDvMdvK9GiFTAjd4n8LoYz4eIkwd
         vO+aC19QoxODZxb/tqpgQd/hfLCg9pda7aWVuEZ7VWeQssOoKhpbH2DuK25/qQkeGxjG
         00mMVl5xB9XUWv30JtymbXpOUSG1pd7YZ1chwM4Z1Jqao6bvnur4EBIhubWZx6cIcgGg
         SD/pqj7Po8mCQzwopv0k+CoCs/cTqiZfQy0bgrne9x+MJ1u4mhYldn0DdStpzcWxyw/O
         PShA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789550135; x=1790154935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=USktFg+8SniSggZb7tvnYYwJ4/8bjyzpvcoyUOBNeTY=;
        b=GP9Hg8TnCWqXcDzkdRS2o1tEs/HcqghREiQCAzF3S+vgrkAPfOABtFpSk9WqZVw2or
         /nyX2gTcjmR6ZCdDEQ9b24YcZeDRt6qFj1SRXUaJwSMWYE82BRviOW0RCtQ3y7L98be3
         uirh4zrUWhlYccoK3o5mYvUpsNqkv50pTHPw7EN1Zcs+jXl6MqaPGyq3l97/aX5h4/Cm
         R1wJF71gcc1jyQnQBHKcVjLqvbnjWanjdFFnPSuQYvH6wkWtF+kjHxF47r9IrF/Qlm2b
         NQF+j0IkxH4rymGJXXK/PHLL05fWhtwfQnblF+1b17O8HInaKZxQ62LPxh0F6uDTuBEY
         YQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550135; x=1790154935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USktFg+8SniSggZb7tvnYYwJ4/8bjyzpvcoyUOBNeTY=;
        b=HeTz8lfr7aorKuQHqQDaH6yTe73otGeapj6mL1Wr/1gggzueYs8gNKRaOcyd67FVxw
         7j+Nmo3Zf8MRkgQzIAoS3phT8xGWr/Tdp/ml6y6A/P1meVocVZvuk0cTMSmTGY1blEjY
         VlyZysy5C0Wfu/678JOtLvjXclBo+hnfd6CJNJv8lE8+fcfrCt7RehB+sUo+4Dn3wsnk
         QvZVHxe4R41VqIzNFnwYhyjMcS9T5TSorN69dhpy6bLsoKGhk2MecsLGH/Uct49l/wIF
         ZeNDgLAj7bA/w/b6Q1gxTYiq1iJKxIZuVkXFbwLnJfp68q46ykhL56H0kdSwbZHMXz4S
         vE/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkmJa8QtKpn5SDt0rkb1Q8urpOd9Qo2af9FB1yopyztNdmsrNUI4biFWAUS8dLLuSjcZHMWYeBNjFQubZ2@vger.kernel.org
X-Gm-Message-State: AFuF++kwAY6S0V/sqaJDkyC2jgklvFEm9wod5JxAzIXS9LhLDyirEJ/e
	trBSkRgLCURpTknEWEVy6g9wYJ0enwN0H16QfuWXHkMcgoC0VMva0vdWI9Kwf209IVBlUoEeAk0
	OwRP9AWLVrkEsgyuo1sECX/yfHM7ZfSNZq6lagXFoEUXW4e0wUinr/e5+jAAn4JNzjJUexeA51b
	H25PkaSxezZClwwMRzqzVrLKnbD1Z6e3q/Iiubmzwc3DgtvBqEc1w9Yg==
X-Gm-Gg: AYBFou27Vs5QMQ1+kDQX2V45/Muu1EUxxaeMQ2qy99SsGuD6h82tI8R3ZNypYCWjn/B
	INQYWcPPlgxPg72oyyTKpke4lD4IPylZsXFKr1nH+KDZTX+OHtARVRuW0h2RUPQVa6K5vTyGKuV
	GcZxLGiQPvvpYlgY0ZMR30KvTAk9thmIbqRODFsiDDbS6T3fJzXOxT5OE=
X-Received: by 2002:a05:690c:385:b0:873:5bb2:6c1a with SMTP id 00721157ae682-89226db1a37mr4902887b3.68.1789550135184;
        Wed, 16 Sep 2026 02:15:35 -0700 (PDT)
X-Received: by 2002:a05:690c:385:b0:873:5bb2:6c1a with SMTP id
 00721157ae682-89226db1a37mr4902807b3.68.1789550134775; Wed, 16 Sep 2026
 02:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c21803b3f2ea1522bb930dc1dcab79c2627f2234.1781620559.git.u.kleine-koenig@baylibre.com>
 <6971c4b5-d091-4fe2-b843-60da8b32d48b@oss.qualcomm.com>
In-Reply-To: <6971c4b5-d091-4fe2-b843-60da8b32d48b@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:15:24 +0200
X-Gm-Features: AcwNN1V0NqIJsL73RdN3OTwvvhD8xwl5xJI8ynUXzUOj0tI1Mn5j1g_pzOzGjfw
Message-ID: <CAGgiveVKnWZCGMy4WrHn3szmC5HuYzf6kSb5-0wvOdVntBPJGw@mail.gmail.com>
Subject: Re: [PATCH v1] tee: qcomtee: Drop unused assignment of
 platform_device_id driver data
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa5e37 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8
 a=FvL8mTaZ2_32tAcSk_IA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOSBTYWx0ZWRfX2wtmrlq+k5xt
 9+soqUIbVdM7x8PY7gm2S7Dg2xkZhzVFksSMgLnZyyrtGIph4ju4WBfdrDSJv4XrWlOvVd7Lmbh
 ugzMqRuy5sSLLyyFLmDsnBX4z4YRlkPqeetKItlbFaITXrhPo9oLxKwIwhlP5/DZ+VL5oUaY2/v
 tMWF4ZmdplG+QnlaOWRcS+MsYZcGBVl/pD+xjs2xWeg8to1bL40zNpIA8F/e6e7tGu2Af9tvlSf
 jWzsexuKcRQWqfFzJ/TKwBUTHdzq68l9YFre3JrwiVPu9hAxMJhoheVxxnwuSSydqVRe9iAD93L
 O/+JFFlTxJs+X0BWLqwLSxUUl6GXt9Ogl0koPd0lCfkW4eRQAL7XyWQ7FnFWns/Q/Gt8j2SPQjs
 OMhvy8JHaTw2VL+KcIVUF/UxspgnN0bnI7yCNeE0oaSyBm4dEEDU8zfJ9i+Vza3fknfyR5v3CwX
 9qk0mDaXWCn6phhNXFA==
X-Proofpoint-GUID: BaUBQYF4SU72u-tYZDJMv6a-3NduGiWT
X-Proofpoint-ORIG-GUID: BaUBQYF4SU72u-tYZDJMv6a-3NduGiWT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOSBTYWx0ZWRfX+rvZy9FGq4D4
 a6/mK+GI5ZYXN1az+dQ7M8VmAq2vl693ZsEQigSBJQqbl52EBW7lxeYP+LM/1Lq5lbMpMB33XTo
 cK3lt0r2D4gIT2b5bpha0qt9bi2vwwM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160119

Hi,

On Fri, Sep 11, 2026 at 9:36=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 6/17/2026 12:38 AM, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> > The driver explicitly sets the .driver_data member of struct
> > platform_device_id to zero without relying on that value. Drop this
> > unused assignment.
> >
> > While touching this array unify spacing and usage of commas and use
> > a named initializer for .name for improved readability.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
> > ---
> > Hello,
> >
> > while this is a cleanup that can stand on its own, it is also a
> > preparation for a change to struct platform_device_id that requires tha=
t
> > .driver_data isn't assigned by a list initializer.
> >
> > Best regards
> > Uwe
> >
> >  drivers/tee/qcomtee/call.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > index 0efc5646242a..4a597eeaf174 100644
> > --- a/drivers/tee/qcomtee/call.c
> > +++ b/drivers/tee/qcomtee/call.c
> > @@ -798,7 +798,12 @@ static void qcomtee_remove(struct platform_device =
*pdev)
> >       kfree(qcomtee);
> >  }
> >
> > -static const struct platform_device_id qcomtee_ids[] =3D { { "qcomtee"=
, 0 }, {} };
> > +static const struct platform_device_id qcomtee_ids[] =3D {
> > +     {
> > +             .name =3D "qcomtee",
> > +     },
> > +     { }
> > +};
> >  MODULE_DEVICE_TABLE(platform, qcomtee_ids);
> >
>
> Looks good to me, thanks.
>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

I'm picking this up.

Thanks,
Jens
