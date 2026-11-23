Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795428041;
	b=KlwmQaUJrUzC2fKHeQNhFxy1ACPZzdmRp8pToQmwbDq0GUtRDoIQoI7eh4o0b3lBjzZn
	 CLvQ/WoIXEUGP7GTK+z1/Frs9yczThcsVEuEmUMZ+acBKf56eNmJJxK0iiL8UBiMMhW+c
	 9Q++SsjiRsFXPE4b3FomIkjyjjtcSmpt6OMOzQ1hvZ+5zQvarUPE3GSDv3pcHvatHslGv
	 gcauV9X2bKaw/RMXqb2vATWHHws6gcvhnEmTpqIWoKl352RnGvFm52uUJVk/iTsDaDyDf
	 kYQC6CidkVbxvXRF9G8aKU6apV0zqDexMNBc415Y4Z7UHDRIyBAMxy6R8bZe/0j7wNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=;
	b=2VjiOX9BRZmG8oyS6/E9UZMMf5liG5oiZUNMUticbsPsxrSVp8rUs9JMNWpbalWzaiaA
	 uKnkQad7S5LpcEqXNkUv3tnxe/WEugi5zxYTyTUoC9z+kRHGmHAyJ5LE0xmgq2OBZYWbJ
	 GZYqWLAzxPhHaghJR50OIZQYmoxMS/POGyIr/MXL4mO6rjV6mNfwDg72lYIG5McC6flMb
	 ac4+CbDHhNEJyAAFwSJfLa5CHsYnjuCiSmuFWpj9Ym68ggXFjXN8vm2OwbIg7aPXGNxnz
	 lLDREpIfNXmisPaGrHNdknSXmLjYPfK5f9wGr0hJ8jkt1z1j0Fxr+S6g/tBbjAvSKmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kv5McAV/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0WkWz+Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD416606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:00:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD416606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kv5McAV/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O0WkWz+Y
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G2mN2786330
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=; b=kv5McAV/tcgk8vns
	ujIF6Ey3OYnlyEhO6ujDThMVEJ216Fr7tAHU0K6ebx7fYyDEtZYsOB61ucuO2FoT
	QrfYN9ffPDqZ0ptp0HZhfuI+Tn7poJnRzHT/uNbpUm5CXGn0/R+IKK/ISPkLHiSp
	4/vTmrHOd0qIAGJz0OpepIzE/gtjwaH7hskdbHHNM8xhI5IjD6+kNMtU1N+xLb/T
	rYlHgGkG1aTBgBh1qcqmGrVzB7HZvxFA1Sbb1uFtGEh7Q2MnVbYMphiemyZ/Wg8H
	e0hkIQh8unYOgfr1y00vmrm11cAublKQ/sILiEvjxasUaPiKPQ4GxGN7Py+8EEx8
	1mxvIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd0uc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:00:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94961511b61so531387485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:00:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795428039; cv=none;
        d=google.com; s=arc-20260327;
        b=aAefBn1Gxlv2UwZNaI+Npol42EFXpeqpb98OhJDAknaETkP8bP25VV0bJkVKQ7sbU7
         83+aMrJvu0HraDk2OAvmeyW5PAkr/75l/XS2QAO/cZR1LRXAHMx4La8YdAMyh4F2eGNY
         gxLa/0kNDqGU6N9D4hODsBJK0fpdGwaDS/9ftlxlSgBrN3hFObqVhEkcNomH1KWUkc+X
         IU2kdIpEQc979e4UxIk/xBsATvoSeRV9MXDyIPsnATc3P+apPfSMaCgK66+aTA3pfTz3
         NnF3LyTGiWGRxR3V7H7BNDoae9lqltb+/MgioENC10URKRxTjK12agrNvUXtBJDJE0Rw
         u06g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=;
        fh=je9runG5yDCUUKG86wUc4oG9KEvUg2F8VxLVfXeukYs=;
        b=k4WO5XXDyGrG2Gtd+vy+hIPFI69daJaHczUuAelw96sYUbaawGls1vsaiAmSgJWFky
         2+Gcb1IXbvgqmMRVZSfZU07pIpiVjFIgP0iBNa6b/QhrMqYpHIM7vw+n/xmmU7S5V5jy
         OYuEiHPT/MW+y2kjoM+W9BuUf2SirXej1qRw+cnggzJyDVF2+aqjfT74XDR94B4xms3J
         AQPYrRkGe71nPnH0z7vHip4mkIp8EaHZfa9YeLHs8yqqBr6gAPnB0cPVW+TJjlIcChAo
         3WUsIUAlZmw20VJ5nOnu1raFY+kqDO8IWQ08joA5eQHbWrBl0Zzb1aRTaGxonPwctHvq
         5Uxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795428039; x=1796032839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=;
        b=O0WkWz+Yks1VDze9p8B8XEPeS9mdQLqigGOaS7FBq4tfUFm96H8gAX+PuhHpt1YZOQ
         z/hmavpl80xCIrCwaihWfPMIr9ExohdAqhHvY94gkRqAQbNXv4vIQ3KMfiWDxKfHq0/I
         2eLyECgp5lLqlXaWlvJRzdOI5o6UXdjMGan24lUFn3ku+0tMHquhD5C2zJfwTxgXurab
         4rLuKSTSoT7Ezl2rH6aeQ5LMhz8kx/bRM691EKvlqRpLmxCzc+mij/jVG8qhq+nkiLiT
         MgtqURwBDHB7rV/ZwYFLQO9tw0jXW9eN792QJ2p3rO+InE4qh2VaEs2GelNpcgD5xxYQ
         YT1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428039; x=1796032839;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jr8A//rozd10PocUjHV0Ir84Uu2K16rDwphNfby+snU=;
        b=KuWSKptIiKw2hOoelRf/Aygal6zPf/r7QV8JYqA9oBgSYFYJXdFSQN6hFUShajbOjV
         mbZ/R7uYh1XVhmKmdmUKBEInq6tcwNzu+4RFnSEUy9uYdwpPOAlTcuQeS8z0bQTGP+yn
         Obi8tH25wfmGoFA7HA+orwWLbaXAHsRqicdLImpJjniSTJqbI/uLjqjkyw6qF0HHx1/1
         oyluJrhyrBbzEQbkQCrZo5l0gJYU1duCwj/0cisHvkiO52GZmZwTMzrYRM6YPtgUZ6wy
         fImlokqDQLkN66jNS3S58HMIkW5YXSxCAdQnUwIm6j66owLMHwcbIBJOimnx1nhljxiI
         81eQ==
X-Forwarded-Encrypted: i=1; AL+hErGURowacXqX0AdJ1YBU3o4Y3VNJCOk+/dDLMeckKtt0P3NhvXXNiL7xcMfl4IlEKVf3wAwx9J5jGhcMZaJt@vger.kernel.org
X-Gm-Message-State: APuU4Z9M5NMxu3sWOAJ+0WuIWZS02yYTsZM+2WR2kZUHyY9jThk+8S2z
	Q3R9/JDCsmu+Bbjt+y8Hiowz+RG5NN4jfAecrEtsmkYRS2yUnikBWxpvUt4JtyXJX3STQF1R0Z0
	tlQuClcxjPYNlm+uuHfMIbL2MOsvJiGjqW6XHnjZV/EHV82v6y0LpFcbgE0Ot8gNfjih0gOm5+N
	/qNsqovBQpqYecASUggY3kHKtouMhbG5f/WqxKACcMsvM=
X-Gm-Gg: AZFdTZej9EV5+zI0ZjRGU1xMQLhuON2RROOJgoYT0P6hxddWalsEHHrvRMESuVhfNxR
	zMI9w6amnUCt13cWCHjfWq0HMhXuGUWw4PF4f/y1ieYj8PfgPtS464aWiqu8o5X75u49UTg6wNC
	MPtKumfg1sNrHFKhEOVL5r3qKKR4wODkMGWRqmT74aLTVsfRLp9o48+0dIqlA6J+P3OAlLtODwQ
	WZjmQY5uqRHmx+jST9khzde4SVeYMnGNSoagCqoquz1GzbszTl6XopDIECQNR9USszdvmzCB6Tn
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id af79cd13be357-949ba7cbc42mr1886236485a.12.1795428038977;
        Mon, 23 Nov 2026 02:00:38 -0800 (PST)
X-Received: by 2002:a05:620a:4606:b0:93f:22af:cce7 with SMTP id
 af79cd13be357-949ba7cbc42mr1886232285a.12.1795428038540; Mon, 23 Nov 2026
 02:00:38 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-4-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-4-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:00:27 +0100
X-Gm-Features: Aa3M54rclSH4qaC8LgLmCmft5IbT2-6SZQ8jqP_AAqtP32lwf4u3PIYObJ-foec
Message-ID: <CAFEp6-2e1nU_wC-s+3O8Wu8G3x=oda=EhFOX8zVAYwmCeHSkzA@mail.gmail.com>
Subject: Re: [PATCH 4/5] media: qcom: camss: vfe: destroy mutexes after
 unregistering entities
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: zGLWqoxdkAKcWAi2lnuSq68X2s-NUPY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfXwazX2enKaYuj
 E9nZ3+9M7/PMX4qEFTd9yXv606E8QiFEivY6ct6rlG8NwOlRz/9FpjuHBjvgoAENltuPc1dvXf8
 sP5jXtdK8BQHjQ/XICoYHtrKIRM/kkvkX6PLVlY5VVdiqrcJYzuCqYOc/vAWeHx6rxs68vJR7as
 qBQ8nUt6HszXcNywjsx5n4UjASKZuKCko1/bzYtS4u5NE6fzLuqgQ+1UOykrQK5960npYO7BD9G
 qZp2ipaDHcB1J+wa8T+pLMCSW4Fz+ygig6sF8jTu6vE7R27EVCufevDxlVwSNol4VqaDh0u6Uiw
 vYjEwI/fn6JFo/aMN95ifDyx1yJ6Tfdz4SYYRk1Wml/B5tJKEknaKqql4OUYZqH0LBi7nsa+Orq
 KCqd5JlB3tUbKBC/jHnbfivV+8MbAgG1exM62NlEQE92Yxd80UndIVUSM2q4v99sNexLXRocv94
 cAWdUxrYtLdu2ewYiIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX7sqbdHaH+M8r
 enzp4P6QaJqYjLVpfPerVX8CiseiNapTmK7Fzok071XuELhp2XBGIT2cKz6DzrJ9BITLp7PQorA
 3/4hekCn1uiCVYD9HYVOar8x92cDlLU=
X-Proofpoint-GUID: zGLWqoxdkAKcWAi2lnuSq68X2s-NUPY2
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b040ec8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=tC7aEmQbD_rfEHlaJSEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230039

On Sun, Nov 22, 2026 at 2:36=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> msm_vfe_unregister_entities() destroys vfe->power_lock and
> vfe->stream_lock before unregistering the VFE video devices and V4L2
> subdevices. Active userspace handles or concurrent teardown callbacks
> can still acquire these mutexes until the entities are unregistered.
>
> Destroy power_lock and stream_lock after all VFE entities have been
> unregistered and cleaned up.
>
> Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index ad09593..fe6b7ef 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -2168,9 +2168,6 @@ void msm_vfe_unregister_entities(struct vfe_device =
*vfe)
>  {
>         int i;
>
> -       mutex_destroy(&vfe->power_lock);
> -       mutex_destroy(&vfe->stream_lock);
> -
>         for (i =3D 0; i < vfe->res->line_num; i++) {
>                 struct v4l2_subdev *sd =3D &vfe->line[i].subdev;
>                 struct camss_video *video_out =3D &vfe->line[i].video_out=
;
> @@ -2179,6 +2176,9 @@ void msm_vfe_unregister_entities(struct vfe_device =
*vfe)
>                 v4l2_device_unregister_subdev(sd);
>                 media_entity_cleanup(&sd->entity);
>         }
> +
> +       mutex_destroy(&vfe->power_lock);
> +       mutex_destroy(&vfe->stream_lock);
>  }
>
>  bool vfe_is_lite(struct vfe_device *vfe)
>
> --
> 2.56.0
>
>
