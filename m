Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792567223;
	b=sQvsjsHgY/rcJ7EnZkh0lO7RPjnxpxs7ny3a5rSEK8bhJKoHmx9R+128xDVoZI8EjIZ3
	 aZIPs+6ETImuoz7iM8DbX76eA17DRtOTBdETqwccjUcSnlV0RwJc4ZKGHNgobktIXFNww
	 aE+y1pugsWBHU9yweFWupf9cjs9eZSb5JFo/OuYGP0Nswj/0YjVeSntf0qlX579FkQ/lh
	 F3bTPHnDPlzkdtQy45Fyjoa1sVQ2mTQKK6jFAI33miiTVxfaL9x6Xx8oUYEYW0jtf/+IT
	 eRup5RBnaFwFk3n4r2KFKZINS/snEq97QNZE8hcGj9HAtM8ZBbD/W5wnRounwLvo2fQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792567223;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
	b=qMrr0o5M3k/nK3rj6jkIdmAupsIR/e1CSK5z4FQ5uOsRIzDc7H+cOI+suMlVeVzeACp7
	 vqvs6GTr1bcz+I1wz7zA3ZbUww26Dm3E2GslZwtAoji5Zl33S4C9aPjH8vETV6FpvJDGH
	 /D5Ty8h1XHxsLa6rdrzs82YkG5QX9V5WHmVcM/TxYQb3VRcoMyME3joGAkpnW/wM5FYAb
	 2thcGjUbhbbmHIWhoQ3K5EVeqJn9gAoyDxbSL1se0uLArep33V01H4cBbMKwCUJC4lYf3
	 yVC9T9ob1oRqh1GvbC0lswV2S6VJQZeovsJFSqeSMrvcotolApfj0UGPqICAL8m3XKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGTqGpQT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI6HWg1A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECDC606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DECDC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hGTqGpQT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eI6HWg1A
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j0aG756335
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=; b=hGTqGpQTnyw3Y/zm
	HjoYc5lye/Mu900AVh1RHHDLmp1qkre8mvTF4kXSMbvJRu3/K+FO3PwEeamjsCqL
	hcHK9qyyCJPtnQo1ZHphKccJW+rpkYRztarOXRmsE1NH7v6wJszC+1WzC8QKmrkx
	0KUTGEMiYAWUFDk1QxYmNf8supa3K39VcUZAplUI0IGRgQcyW63/h2sjsjt5Q9ot
	zOZ+DeCrpqbpmnph33ykoRUC0TEKFgOw+CEx6JTpw9zWOwEO7Y2IWHu+K0mwZLWV
	+XtuY9LFnOM8A3qKEumUO76tSg0mPIH9DtSAVGXecsLznVLygzUJjYGRDfnvgIig
	PT9SQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4tg33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:20:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so48973085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792567221; cv=none;
        d=google.com; s=arc-20260327;
        b=XIXmwnm3LZ9dRfhmITZE5U2wKEwLPJuG6Zfg0tRhtpsN8SROvmGG8WJ/waTHFXf8RW
         xaWpi0FRF/vMolB/gmCc9RccCOMJDuT4Vs8VJ8atAqN7SJ01ar2+l8O++wJxQbD3yKoJ
         fKF/FPI8Q3rZZWkaTuDWjLDQ7gCKbuYxa4XvFkvMqX7B+v56h54E5SIALm3K3LFcX0gV
         VHJiEaxrl+jdsoxMCrghRhIalLkLBuWRtlKjZsUvJBd7Z+ZK6pu9gtLae1Ph41nUYV7x
         pUn5SRq9fR2m/NienC0sP8aP5ElSQNxgFRJ6ivrr7pIt2gzvl/aDzNLO5QAaCQ3X+/cb
         A8SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
        fh=nP0VVgR9NJf9xI/2jf9Izkx0yUf0Qvc52ro7P5I13o8=;
        b=FIlmnRjDhswAzul4V3nRJ5c4KmHecMcypGOImZQvdIdY/+LchGwmEGMmPEHW2s8+nW
         v63cjaDKpABRXhxJ8yWCCOb21FMwV671gVlEMOmEvaoCm18KotZYtjHIFwJdzQDx61SY
         lcsk4E4+KDUfUPfuCIbmf5QvuDbunxVMN+uOx2xr3bxs6uYJ+yrhDy+w584pQT3NX7U/
         tq1rHSnmLU8z1y0HqlMCJCZxoy8JnzyVZPjTFfKztQ5ndkOjJKWaoT5uCmpbHK8EjqKX
         8QgAu6InV2FNewuA7WT+KqmyJZl8qfHsSGSPNo9qzHNwuTpIw2Mba2CyThuhTSEkyXMA
         L6HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792567221; x=1793172021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
        b=eI6HWg1AmnRQa9/t7EIYa9FGcaUYXuj2QoMymB4mB0PpTRjbOo/PeY1viyijmkcGMQ
         BtADHNWFC8OZyHpubyUlRs0wg0hKv1y8XyDPfMhZ+p8KYg2bS/L5iciYST417kP7xX5f
         rGYcp2ZaVnXnBY0lcjqWEY04e8IVTcTVt/MllZ1LxkiLHwRsX2xuWnsXlMYIjcluJvF9
         LzYElWzOQWEPWB+Ry8CrY5wTMZtuHlUO7IBUcJbJLf2pFqGhUn0aQsV53VLIKQ6LoHnO
         Oqmfjz/i8NsWlUFVPDPpZlrzRvmwVc+s33lEl3V0mi5W2+JAQqz6oB/JLKQL1I0OXvEd
         FYYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792567221; x=1793172021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vyw8xlAE2+V3gWsuPQfIkm8MHQNj4BK+dYXwJch3hNE=;
        b=gpfERBDdihq+HzNEpqkm0Urwt6uFfyMe+K4y1TwizkKJuChf6UXZJxBdHAQB2tpCPR
         txaFOMP5HWtLAgGeFejEt7mOMzdnepeQecCv4ZpScRQQMLCDSAyDAVmRBjMe27XFkTNt
         O9a+mfFI8lMAx33kpgarnvJcaKUERuhXzRoUwOR7AEePYrGh3vaqGIxKuBAswzUMhKzM
         I3lZNunnmOZd5vyytu0WlNMQmOM2+E52edBsDbZPUXexI0N60c6RGSuF8avohA8TgPud
         seMGWq+dBRqmNhsgdvEycQrVjzdwVyPPARveg0rSkQVNm2qp9u7zmw5/z/MeZtnrA44f
         O7Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwqIO68q8SCNZjOTKvJGILNs22jwphFBbdIsXQVHk825pJ2VTZR8TyfqNWbfh+wRbV34Kh8Ina0/EMk/nXf@vger.kernel.org
X-Gm-Message-State: AFq9FYJKeYuKis3Qh6Mlm8gjtnNsvAYWUAEats4JkpY4zMBjR5y3Rv0C
	YXg1ZW3SbGxFCtEBuFQBXCGKRkOKe+2FDH2hpwZj+iDwR80QAkn9pxYPsXom3O8dTDP88z2/CcA
	ifil+ZtlMIv/W/Ke5zj80lyliROVUwIua2M6WYYmEek8Io4+7Kfwi1LQlEWOVFqiV9ZAqNysnAc
	tWaE55q4ScXvo8BXlSySSPhtp2Tny7sT60o9NKH2zWB2k=
X-Gm-Gg: AYBFou2QGFr89Zd7+K9yV6EWcTweaT/R9ZFhZDS6HloN6OUWNliABMbZfqqsc0RWY6x
	LnQf517Gx5AlY94G0kYAnoRysg5IMR3Kq4pSUSmq5vvuFNPC/6ddd7ZiY54pb9NWvBTgIem/f3q
	wPadr5PsSDemDlKah74WXIQmWr3ATtemFs7IYZ5/2wMut3bzFIeK7oq6UsoX6hqd02F2wIq+0lk
	/b2Ts1zCuxcJXpBJcZ3bC3Ev63BnVmubVijc7PstnSDOaveD33ZFfNMYPbsmuE9pXUJm2aRt14=
X-Received: by 2002:a05:620a:4010:b0:93f:3576:d428 with SMTP id af79cd13be357-93f57f65fedmr280273885a.22.1792567220758;
        Wed, 21 Oct 2026 00:20:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4010:b0:93f:3576:d428 with SMTP id
 af79cd13be357-93f57f65fedmr280271585a.22.1792567220118; Wed, 21 Oct 2026
 00:20:20 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020193946.51478-1-birk.skyum@pm.me> <20261020193946.51478-2-birk.skyum@pm.me>
In-Reply-To: <20261020193946.51478-2-birk.skyum@pm.me>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:20:08 +0200
X-Gm-Features: AclHuK9V7aVQiTOHc0vqWeOOfVJ0Ma-H2IE8l1YY-5LJtcIK6v0ZsdlpKcyDMMM
Message-ID: <CAFEp6-3s9ER_V_B89W5f5PVkRnLrgSwnUwE+tmftbUGB-1_BdA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: qcom-cci: Reset the controller when it resumes
To: Birk Skyum <birk.skyum@pm.me>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>, Mark Brown <broonie@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: oWQqGDEw4Qwi2xCnmKTGJLCCSyxPktHF
X-Proofpoint-GUID: oWQqGDEw4Qwi2xCnmKTGJLCCSyxPktHF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyOSBTYWx0ZWRfX2psprMkfKY4z
 GQA1D93HOPdl0A1/bJCcVE1wPoG6ENPdSLiZ4azaLSk+Rsn7LD9GTGw6ywQrLEDxhC9dpugAe+D
 HIJGwNjbnVG+yXNruURRQvrSe0frhqg=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad867b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=o4kKvnnIlv_pODaOlxoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyOSBTYWx0ZWRfX8j+bb3YKwYBf
 UuEXK0XL7CH1OUyigW/DwldwImeQjUkbxCQd2UL8OVIfDUdh5NKwPHKHwUVLQQaz3p+GhtuCXmX
 PmgT7mbn5hQzcBVpmRSQpOma7KXJZ+5OHNMES7O010Vypxph66GHa1E6jP6S+Spwuwpo34tYh1m
 kPopwboXGYYbcNpNa2Qaessf2YcO6/fN0xMwBdEUNorJK7wSlkPr/bAjLYdCFh+jk3kpugo4ZrT
 R/5INUrMyDs7kqZMU0hJa1exbYcS+Ea6p3oMf22gpTm6C6otvKATQGiOBWLVy08x/x+yRvNxhHN
 Ch83fvmRe2eigHgz5S6bK+DXHEFZMwibY8rwxRrb1UXXuPo/DlXQKQ3y9JJ+Z94iSh6HYVpfWqb
 sdaawb4R61VE2et3X9EntlbkEtcNVamSczDRHUal3SGuEyIDLpOZO6dkDR8RqDJXNxy0D976P0D
 5QFBqPl+hgaU9VXmLng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210029

On Tue, Oct 20, 2026 at 9:40=E2=80=AFPM Birk Skyum <birk.skyum@pm.me> wrote=
:
>
> A CCI master can stop starting transfers after a target on its bus was
> powered down and up again while the controller kept its clocks running.
> The next transfer's queue then stays on its first command, neither
> CCI_IRQ_STATUS_0 nor the queue's report status changes, and
> cci_run_queue() times out after 100 ms ("master 1 queue 0 timeout").
> Only the controller reset in that error path, or the controller's power
> domain collapsing while it is runtime suspended, brings it back.
>
> On the Lenovo Yoga Slim 7x (X1E80100) the OV02C10 front camera is
> powered down whenever it stops streaming, and the unpowered sensor
> holds SCL and SDA low: both read low at the TLMM pins with the internal
> pull-ups enabled. The queue registers at the timeout show the stuck
> first command (CUR_CMD 0x08010339, a write of 03 01 08) with the bus
> timing registers intact and no error or halt interrupt before it.
>
> cci_resume_runtime() only programs the interrupt mask and the bus timing
> again, so a controller that was runtime suspended without its power
> domain collapsing keeps the stuck state. With the camera's TITAN_TOP
> GDSC held on and the controller suspended between camera starts, 3 of
> 40 starts failed this way; with a reset on resume, 0 of 40.
>
> Reset the controller on every runtime resume, as the timeout path does.
>
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 76a5ded..51ce174 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -651,7 +651,20 @@ static int __maybe_unused cci_resume_runtime(struct =
device *dev)
>         if (ret)
>                 return ret;
>
> -       return cci_init(cci);
> +       /*
> +        * A master can stop starting transfers after a target was powere=
d
> +        * down and up again while the controller ran, and keeps that sta=
te
> +        * over a runtime suspend unless the power domain collapsed. Rese=
t
> +        * the controller, with the interrupt mask set first so that the
> +        * reset-done interrupt also arrives after a power collapse.
> +        */
> +       ret =3D cci_init(cci);
> +       if (!ret)
> +               ret =3D cci_reset(cci);

If we don't know the state, it's probably better to just
unconditionally cci_reset().

> +       if (ret)
> +               cci_disable_clocks(cci);
> +
> +       return ret;
>  }
>
>  static const struct dev_pm_ops qcom_cci_pm =3D {
> --
> 2.53.0
>
>
