Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2934A48423C
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790001226; cv=pass; b=L/vrHRX6Kx55YXYnacpjUSEu6EwIWYQuR2yV0mFAS8UwTRjN0T2mYyOkDd4F0O370NukkE2UZCOpNO3qwn5544vC4v4VpCFeMWyeB/mmi0TgSFL/W8YRO9j8QxE1LlAhKWWmszcwOjcYiS7DG18TtInih/uWEpfgGQIqL85FE7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790001226; c=relaxed/simple;
	bh=E7JHempOoUCSYf/9xUmI8va2uJakicZppH2wJWczR3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7QLRXXZt1wzvJ72u3KUNREW9rzxL6Sxopu7VZjRECpD9Hqx1uGbNLXZsagfIYbbg9gyOIJVZgT7GQWgEzXkj5Dc1FbZLdv1YFRT8VVimok0U9ryz3FmH3iG9+8ydxzeP5t2KaGfdwPp7Nmdi63DKCa9vWHg/nlhnwoHDuxuNQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCHPwwRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZDW1eS/; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCHPwwRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZDW1eS/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGfBC100542
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UajCiuu3zKkr8y3fzShjkyeSWKdl9qrmasKBAqFtM/4=; b=XCHPwwRsHvCetjwt
	Mz4BCA0rIHDYQZwOB9/UlCEk4Sb3l5L/PQ5E9rEJWg828oBEKPxaW0C2qb1Z9wNG
	N4lsju8ExbQ7Ju+JUOR/6tI4kWF49ppbJ01slQyTFQyXeoaEkBM+1UCOcqsCO2jo
	PwgWtvlfOv/ABZo4NCl6UTZYTjFBqlniSeBh1vXcuUP7no/1YBDbtyWUAfRuNI2H
	LgpDcfLWPjMonxxsPt2bGQTigWQ/5eEcyr+zsXBV//DluWjLz9sg7I2Ciy4fdUDY
	hVN6K2Feg4XRBRPc8gAWg5U5n7q4sMtFEguWLZb3GV4ZaQ43Z9iipT/ir8Gax4kZ
	iZmnDg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq79b4jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 14:33:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso2275875a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790001224; cv=none;
        d=google.com; s=arc-20260327;
        b=NDNygz/FWaZvn5SK6tlXhkzNbNKFalJ/gURm7v8HgLNxYq0l5mWcbKxGyEXE7kzxEK
         Bg9hC08NtEIPXWUjZhAx7AOMJmUZ2bIUVUQm6mim6tLB6Dvq+hszpvxDQ6QfyzMNGWmq
         UVjIX24fL0Lb7Y9+aOPmAV3KOl1XvCDkTXt5Lxj4MQib5LBvlmcQs1NyKetjXiB6s/VZ
         RzsGjhysZCbsTUQWP1IQxwP8Ia3tsVXC2NPXcz1ewHxxNeQqwW9Hkq9TEZYHzytARCZc
         9nFnr/o/IwwN6MdK/y3ZpdqjIcafEDb7aBTxdLSGOndLI9DHub+aXjZw4qFhzTj/zULM
         zAFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UajCiuu3zKkr8y3fzShjkyeSWKdl9qrmasKBAqFtM/4=;
        fh=TvUzLGAdGV52kccJ6WIGHjTnqlC4fWU8m9wHBGNQq/o=;
        b=PVk9LxfZyVvD1gt3sMG78hpl6PfUXg3g9Fq6BXSlPTOaunUu0+Kvufl4P9AEcZViLN
         qFmjAlXbYgQQvV57tvxDxGVyl/hZQU6L6/j4UbOViB4AhGLeLcDRCxPKkgimDKXyFh7x
         yjPkqNu4sxtDV31rmfBrhVIrEVKV/MSjBCsyilTlYVHmL5tmXLI+AAtD5j0j70ce+5XO
         GkHjSGkreYnoKCejTVF2zplzXTTlxs2wWqcHc7G+/tqG1jwM7FOp4Jfay/D11XGRjE5S
         QjLfWkFljqkYHk1QymWhaIgKTFMFnCoDQAgmuv8r5CaiiIOJJqHtZIB2jD0vXXugsXjz
         FxgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790001224; x=1790606024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UajCiuu3zKkr8y3fzShjkyeSWKdl9qrmasKBAqFtM/4=;
        b=BZDW1eS/IU7SmG6cCd4gKHeZvQKpHh+LmcF+u23pMY7KZ+VS2LXEHrEZmHMG+sj61L
         Kub8AfZznfGHCu/HUha8KIgre9oPJup9vjHUa9Lom+2gRX7ocDXHupHTWq3woOv+wZMX
         x/ozyNRVM6R3jlph6e7E9IECiXRGtFCZeyAiwGT/F/vCw3PfoW4OywIYlWlajaIk0iUN
         LYNIPnjAUwIEJNjbG0LWST1biQkeh+IcbRFNR5OO0JurwPM8oi5Xv3Mw9vSwLG7PcgEY
         31yRHdHOAAmnPVduKdbDZ/GIz1Ayr9cN6O4kjFVd0nh5pAq8f2QtMqa1Btg9DlIpLvCN
         KAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790001224; x=1790606024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UajCiuu3zKkr8y3fzShjkyeSWKdl9qrmasKBAqFtM/4=;
        b=Qze8SXG6DAOS/N4eoUpqyq8ow8PX9+bShhi5K4AzMVJQkPaTYcX23eHrxSUAY+Fiiq
         U+e3yvojyJNle7FvR1yoGO3T1hzcA6+n5w7FnWmZnFo/KhhoNQwU2eZWd+MD6s+CNptk
         /UybNrocLC0vUI+rCee8ILENsQpNIcahehU/A9KSfdYVhoAvwbGrCCCE00geEa1RnRVE
         RzPgKDYtoWCkkGJtFdYL05vcX5SAOeu/QWfkOr4icHe/zoZK/3JPQon1gfW0KmWeuv6P
         7OhhgoFkQo+5hXUO40bGNqfaMhDo+vZVxClBPsoMtWltxsCT7vo/K6jOiQgive0N1GR9
         4EaQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3K3psT+SLidmBwjk0AnBonTBokmFAhciLmG0XY81N2Xf1n1JmvD7gwJmzIkLYqaCo6oxes0SHI4BQ6KQL@vger.kernel.org
X-Gm-Message-State: AFuF++ls6XqAuBHPGcfIXq7D1JHBBBNI9v5wiAYX1phY6k1MCdPlehy9
	JjR2Mwl13cxya11hmZMcpzxgIm/134gKL0EHS+ag1jtnvqDSdqWLvjk1vMXDaBCLZHp6Gcld+wn
	+2EVeamFvRJpgqdR1puq/M6bDK83rQeZYG9vqpN6ZqZ3i6NzIpmTFKxbewEqbG7Vo2C9VtTPSXh
	+wYKi4Lt/ffACUdrPa9MJ+nLWPKUqNgLT0z1CCnkb88CY=
X-Gm-Gg: AYBFou0NXr19oURTSXs4FtIxw4LUc+0B+ICP+CnquFLIE09+bgme85yddq3iX8AaiHG
	Mxz19DABb+yF9HNd8AzISYSAboKxQ+QScRdNOJz0ZWkruoRnKG6eAgIRCUf82HmX05yWYvhUFrU
	O5/jA+H+dcW2gjv1xTU3d5UVN3lQv8G8ebDUSWoEZo4cb9o3Kykm4afdxSLg==
X-Received: by 2002:a05:6a20:d70f:b0:3dd:85a8:cacc with SMTP id adf61e73a8af0-3dd8c47d05fmr18470890637.35.1790001223690;
        Mon, 21 Sep 2026 07:33:43 -0700 (PDT)
X-Received: by 2002:a05:6a20:d70f:b0:3dd:85a8:cacc with SMTP id
 adf61e73a8af0-3dd8c47d05fmr18470839637.35.1790001223087; Mon, 21 Sep 2026
 07:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-pmdomain-idle-state-name-fallback-v1-1-e4242c409a0b@oss.qualcomm.com>
In-Reply-To: <20260914-pmdomain-idle-state-name-fallback-v1-1-e4242c409a0b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 16:33:31 +0200
X-Gm-Features: AcwNN1W_UJfHVjVR0oSQdsskNOV92N_jUt6A6zCRPYhZu23fhBxykd6yXGRbgA8
Message-ID: <CAPx+jO9qYJfR+mAN1=5rWMWWrp9STZS4HB3ArGfKadhS0D4V1w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: core: Fall back to node name for idle states
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab14048 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=c7lPhTKDuvdyFyChvsEA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX5TM200sZ0JoE
 6Jr06aOo1g1G3DzFZhHgab/3hoeSqHFHfq4rBvChw34g6P2gWbHB8rHcxMv9cHT8Ajtqrowh60W
 5z70PoT+SyWJPqWKPGONuobUdmyVN5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxMSBTYWx0ZWRfX3z6DdIcBEiZR
 O4u/JPnfjvIg+Bqqa4Vp3HmTWWNbhH08TAwySqQ4Zu4OCbe3NQ+A8gbSw2T51AF9a1aze8idyhV
 5+slLiPTOhU3DVQM5UEpwdwBvLjpv+wzzlKe6a0BXvgRswQKHq0hHsxzpCr8L+EZOrPZewKlUpz
 9BEeUzXHgzf490D4RQRMYLdHm9yUB1yo+zdixxiSw0CAQotbcBJi+nhfOob8ODiR6NswRLus2EJ
 G9e1fCeoHUyW4+DSqSdG4X6uEQCfd8JHpitXVKZeTyrt1RO+uokod1/3b8A9C0jMxyOyBxyeNlL
 KF+Dsa+o+cpe4Ms3t40iNFpbQnsmp5q5jJZ8L9sFaVbcWWmZCwGOCTQ8mRs0jzbXmbeaTkhwg9Z
 L0OArWdiCTlCPuFnj98QAjIYKbA3rWZhwaSsmRtXTX8Tu9CS5a2h/i3rRko8+Z3I9sK382/9yK6
 x/4yTD+/8ydSPpB3YEA==
X-Proofpoint-ORIG-GUID: WMYFSpkUsL-_v-z2zYEmLBEFq2rXB6lD
X-Proofpoint-GUID: WMYFSpkUsL-_v-z2zYEmLBEFq2rXB6lD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210211

On Mon, Sep 14, 2026 at 8:54=E2=80=AFAM Maulik Shah
<maulik.shah@oss.qualcomm.com> wrote:
>
> The dt_idle_states uses idle-state-name when available and when missing
> falls back to the node name. Do the same for domain-idle-states.
>
> This lets pmdomain idle_states_desc debugfs show a name even when
> idle-state-name is omitted.
>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/pmdomain/core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 052ec478dfcc..d0bcb4897477 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -3583,7 +3583,10 @@ static int genpd_parse_state(struct genpd_power_st=
ate *genpd_state,
>         if (!err)
>                 genpd_state->residency_ns =3D 1000LL * residency;
>
> -       of_property_read_string(state_node, "idle-state-name", &genpd_sta=
te->name);
> +       err =3D of_property_read_string(state_node, "idle-state-name",
> +                                     &genpd_state->name);
> +       if (err)
> +               genpd_state->name =3D state_node->name;
>
>         genpd_state->power_on_latency_ns =3D 1000LL * exit_latency;
>         genpd_state->power_off_latency_ns =3D 1000LL * entry_latency;
> @@ -4006,7 +4009,7 @@ static int idle_states_desc_show(struct seq_file *s=
, void *data)
>                 snprintf(state_name, ARRAY_SIZE(state_name), "S%-5d", i);
>                 seq_printf(s, "%-6s %-12llu %-14llu %s\n",
>                            state_name, latency, residency,
> -                          state->name ?: "N/A");
> +                          state->name);

As pointed out by Sashiko, state->name may still be NULL in some
cases, so I decided to keep this as is.

>         }
>
>         genpd_unlock(genpd);
>
> ---
> base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
> change-id: 20260914-pmdomain-idle-state-name-fallback-3bb5db520a30
>
> Best regards,
> --
> Maulik Shah <maulik.shah@oss.qualcomm.com>
>

With the minor amendment above, applied for next, thanks!

Kind regards
Uffe
