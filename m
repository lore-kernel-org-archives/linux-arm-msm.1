Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490669;
	b=rbtcc19RzVwRJtEIVv8fxEaS952LK7dNkfLkbZLcOieDNrSGHejfuRN0PAbg6jAB5eIR
	 PJyExWMD3qd+AyVYP6mLFCIfB71FUWzg48dYccax7INyFeXdStvVSb1+/1Vr7iGhBg954
	 k1LO+mQT7aHS5lWrrOTnhgNMtM29J1J7GJL3UOtBoMjQeS0zvSMwhv/z6hFk2MZvkRN8/
	 NlB1Pc+ziAr9iwpqI7lprGWths0DlFkEBR1j408vLq/TUNwADK3BEs+LpN9qy7nzvTQlh
	 VCBpPEEFWMJWKKarCDY+nyMFIXQwPcM/npeqOlWl5TiSf7nEIEaMdDWqDP0SR75jpkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490669;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=;
	b=OD+wVlrqXLjUYp0xdlzyKqdVCpRFZDyy6GbF/BLPzUwP9TfhTm8dSG9rfzLpmjSJuURC
	 qsfGk73Pw/wPOPQoOY60ouaZYZKBwJUsalKMIwut/uPsHQ2MfUvvRG/gGmspprbzNcoSh
	 zMoW7RNo38xodxSo8sCiOCFjXeEHLCE6rt0UFGWQEkFDxTBpnJLZk0CyWvUfWi+FdP0Ux
	 F6/9Fp4X8C+bUNQKZ/4oRYGIJAMGv7W0QD222k+n8OCBMC/vj+iBJEH67GMeUq3O3QElK
	 JbZDz8VBBOOS9bEBthJrPSQyejp90MzzNuDrsEo8zj2UOWN0za6QtH/QrXxn775MKWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7q2Vm5V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3x4dn8Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC14606A33D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC14606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E7q2Vm5V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3x4dn8Q
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9AKtj4092474
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=; b=E7q2Vm5VMYhyrtGf
	CFZs/Mgktw8daQ8HJgkgi1ceLDf7u/ZpiMhYlgLnj6fXMEd31O+B0aNzHtRSY7XW
	LrkrTogp0Q38BwCZmhA+889+IXMAaSsza0ne9qFuFGvBu0doQPsTAmk7WXlGAE5S
	2/lGW4DG5j6q/TU44bTw/iWUaJlPdY2Wt+m/F/vfYpOXBcA42Vjvl+E7UoJfZJpX
	3tBf0wxxHpNg7jwHPqIZMC7rNGarSNmmGowxZ/JeRHJ/JNvOiton9HIDbxybwxQZ
	RYsNH803LpC8MFpCWWMF5JkARN6u5Sco0vRXKgI9WlU/ZsBRnQ37mP85WC1TKNGO
	wPehzw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8k1h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:37:47 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so583928241.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:37:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490667; cv=none;
        d=google.com; s=arc-20260327;
        b=bWFmf+2pIj6gLqm5PQgLH22QElkoRRwFyVdTVE6AXQ7o22mNGc9WPBAJgZnE1tw5cm
         iFrlYtGC+UrHq+XMkQj0vWjIzORdc29xVZsoTAASVU2BG7L2/ERj+P9KyWCwTNkMBOr7
         xbOgiXR+X244ACNpi3cwsY+lq5pcNDYwv7Xos4TdqE7Cl2vPXwjGmidAQGmBK4AKk4D7
         xmLXDmytLynnQy2wXgk5H/P86D1TO8l5cccbnxD12l7GVXa0DR25pnh+9LTXMCuXhnTF
         SzIw4BOKP4Hde1R+nLER6BW66mZ1QFp8c+oa3i7BYQt1lkXnwBCzsbxi7jSnMBkf9uNb
         A4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=;
        fh=YMvPgFuUw622V219e7COk39wB/JRIwVwAqqv2nxm/1c=;
        b=b/i7LJq+LRrsBR/Nzp/yZ+Gn8G1AKQysEIK276eMRlI8ak9/Ke9s8HJy7pQ0fCA3KR
         gScaVkX7z/UJ5Fl9B4FAe6ENOhd3U30J7f4L/eRJd6vxuPLEvs13L/fpsA8CFvJ1+W0n
         UoBc85FYwuQ/1rxdO+xG8gX1VBWS+FiqwMxsVma8xwBjx5Z/J0k4UjhyqtEA2ibECjV3
         AZmlv0q8VcHmUXZ+jRkjBlgQlYmS91muYRi6oJDgL9vbVpL/7M9kICLuVanHjr14XJq+
         CtXC7g2QE1uos7DVsf/09T0dQw9uJ+5y/qVGkqKzMwBy3qxzq2MZO80zkP1eYf9DjP6C
         Tujg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490667; x=1795095467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=;
        b=Y3x4dn8Qflmv28qZrW5v1HJNOxNDv/hT8nBk19iJy1ow0swtZcnbedeH/skjttX4Pl
         AXp6XaHgP7dX+C+zpLn5/zKLHDYr9eiUWTdCFkrEVvKlzpsAGh8pru2WFpKVmCOUu0Wz
         BAE9R9rF2eJvRq46c7LAPNz9MSMPn15WZi5QwzxzFEk5J/M46f+SYrqPYReyTlbEsQdR
         6xP2h5O+hLpNDrOqw4DTd4cIDk4XHUFpCveY9/TMkF7+jkhkSMFEYjaSWXVdoLNfZXNn
         LK0/+oBk8/fgdgHQe0kUiGPkTKURxBdqQFQTC/M8q2iFT4wXFZvHTi1L4q1kpmLd1r3c
         ymRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490667; x=1795095467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVcgSKEoiJgg+H1FyrIcVXoKCvo2YcTYdwMzq7YEsS8=;
        b=2JXSp5UMV22cIZ0NkR2N2lj70rMxUHMN/8yAdVl2QOyoKF8AnpqgzO/ik2bnSBU5dZ
         iI6EIWdbAaTq8HzSRRDTGcx8ZBZNxIG9q0kC+aGimwp8U2BoqeXXa225LI7ATf9nMxZ8
         cplxvvc2CwnEiJsDQ10hegxwcoj+z1yRzeKSGTCis2PAGrQ5mWZmvAhiRDt6TFaQ9UqI
         1AUSJcKhHFXMhFlTRTD0uPmg9o0QFZMGWw3mQQCo2L0LjNqsKqEHRZt4CnR3271xiTyU
         qE2wPTaXYHfiHOReEqPh3IoSxebU2KBk15XHDlYoTmO416HhPeBk50r1Qv9HwYshYgwm
         08Zw==
X-Forwarded-Encrypted: i=1; AL+hErHVqUgYjEMSZdEOhusmWzWlobi09EB+WSLU2Uodm9D1cMhyT/ambqa2x++E6qpB+ZQd2VZoXho9DGFtxn0r@vger.kernel.org
X-Gm-Message-State: APuU4Z+C8cAC9gnuz8kKY9vZL4YY1QdOvaRvZZcQ4LsI3BZPH0lFynnt
	yaEy1bYcKyFbccYbCTTb24gmgxqj49FUYhaWiglI6afCOGSaw51xMKS0hZPVyMXkHAE84RO3re3
	s5vHe4/8AgEowAtK0BFqurxGNpol50azi0MdCLdoBV2E73nFYb9o7ILhkzyE/xFEc3NUlCJgTyM
	1iYNJUy8M4cuXDYuxMgwnuD0JsM/6EkPH7c2kw7I/T8w8=
X-Gm-Gg: AYBFou2IufIw+I6mtLglv4Dqx8OAIfY7eXtIHaKUnteZd4WyFBOO4uJ8itvQ9I3AMUy
	cu0K5TABLr9R6jtZkV3LhWs1pwlvyPdRu/kCMT4ikhk3MyAiKGdBR0fm149LaAafWnlySJ3Devx
	9/rb96uzoOOYfF2g9LArJ4MHuLFoVL8Adr20MyuilOebc4raAIm9rE8+lt8Q==
X-Received: by 2002:a05:6102:3911:b0:7c3:6466:3155 with SMTP id ada2fe7eead31-7d5061cb5bbmr1984729137.33.1794490666694;
        Thu, 12 Nov 2026 05:37:46 -0800 (PST)
X-Received: by 2002:a05:6102:3911:b0:7c3:6466:3155 with SMTP id
 ada2fe7eead31-7d5061cb5bbmr1984719137.33.1794490666279; Thu, 12 Nov 2026
 05:37:46 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-genpd-boot-performance-floor-v1-0-a765dc83e6d7@oss.qualcomm.com>
 <20261013-genpd-boot-performance-floor-v1-3-a765dc83e6d7@oss.qualcomm.com>
In-Reply-To: <20261013-genpd-boot-performance-floor-v1-3-a765dc83e6d7@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:37:34 +0100
X-Gm-Features: AclHuK_D3_dNomlWbL20p3tVMOhfrYVgRQMwsyI6NGH-uAbOYwZihTFEQR8CH4E
Message-ID: <CAPx+jO8buJH7eBFdzd146F=aUJifSDiksM2FV37fCjK7kOb8AQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] pmdomain: qcom: rpmhpd: Let genpd enforce the boot
 performance floor
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX83OQ2LhsqNH+
 nIPlJ8VTNUob7DNwFf5NaHP4XRqi8msIdFlmKnzoXInp7cyfFBpshaU6A38Rmqa2JJnaI3XPGcn
 gaYarGYAD2l3GHJiRMFsrq5NnLAECHs=
X-Proofpoint-GUID: P4t2siMoDv6r6HA5g9G2LQ0myKWVtAcc
X-Proofpoint-ORIG-GUID: P4t2siMoDv6r6HA5g9G2LQ0myKWVtAcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXw/8ZnYu9N6Uu
 Vbs7M3pG1k/A7pLIPaBWrWyllitw8mFJOCSLqgVBAnR405AVwRIU/uI4tH3TUULj/mhoRs2AR6B
 NiewSnoZRVCV6WcdTuuUneg7DVIj1qIMGjE0VyKHq55B5x9uf5SBnu1A/JzINhUYmI+eIPGKoUU
 kSusb854/Q2yNijmNBQbQzB7DHvPUQAwpz2pA1vs9b185F42pHYMErRVvNCeC88ZkbR8PBTgA5t
 2TN9IROK47eqaIEEJ7QmRsHmTipK2so3Euq8OGt32byB4kRsxHIAhbN7l2fOxnbJtCYiUV/IY4w
 D3tbWnqHjx1yNlwMcH9E0c+wVNRsPBJRe2mfnBOtPe2h64/IZ6k2NiEzzj1vcZWcs0P1eWDqxIf
 MSGxiyUQAPcbJV3GPTtW7Zr28hcTe6+bCyZLfLfUTl8TOO2Zz6paXaf9QKA1tugqWyqf9JS9EfZ
 /+dqQEAyVu/eJH9K4iQ==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5c12c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=jAT_WBN3s0Bi42_mw-kA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054

On Tue, Oct 13, 2026 at 2:49=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> RPMh power domains are registered as powered off without knowing their
> initial hardware state. Until the provider's sync_state() callback runs,
> rpmhpd_aggregate_corner() replaces requests with the highest supported
> corner, leaving genpd unaware of this boot performance constraint.
>
> Set GENPD_FLAG_POWER_UNKNOWN and provide the highest mapped performance
> level as boot_performance_state. Reject an empty mapping before indexing
> its last entry. Let genpd enforce the floor and retain consumer-enabled
> domains while boot protection is active, instead of clamping corners
> inside the provider.
>
> Retain state_synced for the hardware-specific sleep-vote policy. Include
> the supplied corner in sleep votes for active-only domains until the
> provider's sync_state() callback releases that protection. This also
> applies when translating an enabled peer's vote. Keep the existing sync
> callback to reconcile votes for domains left software-OFF by genpd.

Hmm, perhaps we should start by just enabling GENPD_FLAG_POWER_UNKNOWN
- and making that as a preparation patch, placed first in the series?
Would that not be a more cautious approach, taking it step by step?

Kind regards
Uffe

>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhp=
d.c
> index fa8fed5bd3e5..1488f31bcdda 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -40,7 +40,7 @@
>   * @res_name:          Resource name used for cmd-db lookup
>   * @addr:              Resource address as looped up using resource name=
 from
>   *                     cmd-db
> - * @state_synced:      Indicator that sync_state has been invoked for th=
e rpmhpd resource
> + * @state_synced:      Whether boot protection of sleep votes has been r=
eleased
>   */
>  struct rpmhpd {
>         struct device   *dev;
> @@ -982,7 +982,7 @@ static void to_active_sleep(struct rpmhpd *pd, unsign=
ed int corner,
>  {
>         *active =3D corner;
>
> -       if (pd->active_only)
> +       if (pd->active_only && pd->state_synced)
>                 *sleep =3D 0;
>         else
>                 *sleep =3D *active;
> @@ -1006,13 +1006,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *=
pd, unsigned int corner)
>         unsigned int peer_active_corner =3D 0, peer_sleep_corner =3D 0;
>         unsigned int peer_enabled_corner;
>
> -       if (pd->state_synced) {
> -               to_active_sleep(pd, corner, &this_active_corner, &this_sl=
eep_corner);
> -       } else {
> -               /* Clamp to highest corner if sync_state hasn't happened =
*/
> -               this_active_corner =3D pd->level_count - 1;
> -               this_sleep_corner =3D pd->level_count - 1;
> -       }
> +       to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corn=
er);
>
>         if (peer && peer->enabled) {
>                 peer_enabled_corner =3D max(peer->corner, peer->enable_co=
rner);
> @@ -1210,10 +1204,15 @@ static int rpmhpd_probe(struct platform_device *p=
dev)
>                 ret =3D rpmhpd_update_level_mapping(rpmhpds[i]);
>                 if (ret)
>                         return ret;
> +               if (!rpmhpds[i]->level_count)
> +                       return -EINVAL;
>
>                 rpmhpds[i]->pd.power_off =3D rpmhpd_power_off;
>                 rpmhpds[i]->pd.power_on =3D rpmhpd_power_on;
>                 rpmhpds[i]->pd.set_performance_state =3D rpmhpd_set_perfo=
rmance_state;
> +               rpmhpds[i]->pd.flags |=3D GENPD_FLAG_POWER_UNKNOWN;
> +               rpmhpds[i]->pd.boot_performance_state =3D
> +                       rpmhpds[i]->level[rpmhpds[i]->level_count - 1];
>                 pm_genpd_init(&rpmhpds[i]->pd, NULL, true);
>
>                 data->domains[i] =3D &rpmhpds[i]->pd;
>
> --
> 2.54.0
>
