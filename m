Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794484794;
	b=KV6C4yFNb8k3UTi1hu+KUDJqEk84wnOntrES1PBFcpjHo58RFHiOAdqbzAXNBcunN4SI
	 bGaAJZGt/ZOZyA/nOr7fzsxsbSV0bm2pRSCCSoVo7Olk0xLAvtR5/XkcHTFkH3j88Tm+T
	 t8U8peIsiYYLQ3r1w10dJmyPIWT0uookdjKu2e3QdY+ubaZGuDYB7hdIxIjpzLKh5OMKK
	 i5OmBhyQWqs1pEhiPYFVfhen87QUdAdnRobu28sAMuruKZmhKMx6LB9sxXVen4wmdOZyt
	 5fG5R7oWyeWZLhLtCDR1XxjvSnN5NkJWkXdjV5RiydaNz0L5FkTF9PcaLw3re8pEIPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZR6uEupV3b8QdmVl/kBFL9B59flqS8UblZlb2kXnBgc=;
	b=RwLBkQ8GB7QqQDYFo7J+VyRY1gOYDQYjSU7Vq8N9LNAVH+qREmFdxtUb1p2RzmLh7CwT
	 z5vjcvVjZBrLugqVSa0SW6FxBbNrBLGUS4CU7puyNbYFEWF8B8CpXc1ZsjMdR1E9SVH7/
	 KzWQgemddZAeaJvufXysHjbAkiRlO40VHO0ZMfQiNWFbIeG64yghUDh7nSaNBRIiOj7Y+
	 Pp+mtZUEviP2mZY84aqSa2+k3i02cBLb56TWMuGSXrpnOTqZGEuS+YBDzgsBmV8TFcPXq
	 Q+JM/vFmKscEw5Hq0iDfVPLrnzlJWtg7p2FEVDyhpeYC81xBykpT+Fkba1OtHLi5nIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Odek9yIx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drrfBw5V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1F3606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE1F3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Odek9yIx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drrfBw5V
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC8s1YF4149474
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZR6uEupV3b8QdmVl/kBFL9B59flqS8UblZlb2kXnBgc=; b=Odek9yIxy2RQwzEJ
	ShuYPAxPgB7O7ey45gGAkbeykB2677X//cT4Ih6YUaCDlpecCZmYQA+xXbM6WBHE
	SsACw6Zd09s/8R5YviUMlrf+fy4kCkzEiHADo6/FE1e1T5e5dsrHwGHmHyFY0+Lv
	+N18vgPWUdy0aiOwtM8gGKcospPvMGIwvU8zOvnztsL0x8IFW+ePNH1w2zPOUOq/
	cMN/riIJ/+HwZxzp0heE3brsoWbjURCPNpc77rMAjSUvPXgNtAYcHKfcXchmpK0j
	pbr1Wz5sBEdCPB7RHVsRu5powGIPuZSAUPrWmqEYBv8AHXc/4Egdo3+wcep+NVSa
	GBMm+g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc639m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 11:59:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so4262462a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 03:59:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794484792; cv=none;
        d=google.com; s=arc-20260327;
        b=j1TKjnQxxmf8vgPymHzrrL/6gUYFpSaxt8zKnkFJp6qlpPQ05qRiSzuMTLqmqrsYEu
         cocPM8Xoxkwzv+JMY71fQxR1f6HZad7btNIRDS/BSTG/mqO0KVMri1TJNH0carGyztJE
         l7fUT/BmxJiW6DUb3qNlMRUx/0pYTlnF0qTwFlJbVNGGJ9IBpoQGM2sgPCu41yFpChWW
         W4wqmyxCj5evkGvoTiTSbuDrgeijbn3i9tKhitXomhcAUzqnLkvkHhFNCvGQsRQaiErN
         k18OT4a2iUWnKS/bMy1z/7HXvu7xlzAmIC8WwvXIZUdOqcb6fEi7MuEBX7qMUlSzmiLl
         NAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZR6uEupV3b8QdmVl/kBFL9B59flqS8UblZlb2kXnBgc=;
        fh=mlsHwVdF8TJbVaj8TJ65jnPbFz1frMeHiCI0QUIaz/Y=;
        b=qbmpXJsbWpkO4QArlLXTba7yuHilLyNvVhOofaXd6afKEw24EWzoKHtygwFGxxWPnW
         W5hUSqnsX/ahSizbTo//saElYrZCOTL6+SF9TTgx5orjaFC5gO1S8LqZfqHY20Xqfrnd
         8en6pNVbXh0DnohhjB65lAHz7gAV4s7IKcGAli7p4F3Rwzh6J2L9a2DyY1T5S2kyii2v
         pU03zI+g7uWYt3BBN+oOO1hJaJ0tv4d/rdTT3st6Dpc+nNQ99xlX6wITTup+BbDn/Y3U
         K19zaJXWC5vE5Vcs2MP+Gjlj1FqNp1XHGvuuoKojpLXj1oeue9v1jfONMBCgQqlm1duQ
         i8TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794484792; x=1795089592; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZR6uEupV3b8QdmVl/kBFL9B59flqS8UblZlb2kXnBgc=;
        b=drrfBw5VhXgSUxmeQBsuifFk8gVMmGGMBij0Pwgdfjq/Z3snOvgX61IDvQtnhk53Vp
         UYN8bhjxF3KV0J0xyM0IvIl1dBYF31aHN83OgEsDCN3hEnB52Iic/7eeSe3MKGFgKyUK
         kU7voNQvxz4QIrDRaHYMHADADuF51r2h2sE0rJl8cOHE8Xh74KNY6LrXYGxoUOehAOzJ
         JzWJ7PgxuEVSN0HhRWxQb5JlgLei+pWfFHe4Fa4X5vuR7BJkH24XJhmMVE21d81Gl6SP
         JXdC9RRe7lqndam+cR0cDEfkOIxpE18C7fdsTEy9XCyO+1OxjThKfVSoTuFrNhSmCE55
         VoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794484792; x=1795089592;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR6uEupV3b8QdmVl/kBFL9B59flqS8UblZlb2kXnBgc=;
        b=mGUJpwizp36n57lhY8m2Me+lwzEzq/VAiNrv1gf2bNgXc3GSUts0r/M3d6uSUYTrbR
         19atgSsOekho+JhGFA0G0IMC8mkYAXj6ZA3eJ02zkGiYLKKpde5OO/QXI6ZWWJ14sM8S
         ccXjcTUg8RqYQp0RNiB0ki4HOGxcmTZ/wac4AkZeQSTAnYx+zjI5A0n8u0kK1RA9Wwap
         /YmpFkzd0kyHk6h0L9HQdvXff3QwuuDS8gDPb5dkrt0wDsEfU2eft/sCoD3VgJp+XDTh
         5eLpDKV6p70ifsjwuS41BPN4hUcJPh8oM06mBQGecVxx48O2ow+f25zisM6XgCD3vbcV
         jBGA==
X-Forwarded-Encrypted: i=1; AL+hErGC/Ii5WkYQvmaRORmsef5I8tJHtlWUzpxB9ZaO3V6IY1zCOY4+oDEkXLmwgjQXcyXn03HMfAaxUuGY2HCW@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zsk0SSmzxGHDWjDU9trDPwr6wmIndg3uzyq+RS/aPcKjo9rrq
	mkNGaCYb6wrxmVFJsJTavK8qelfP1E4/kvKSBDMNRIiQbGoien6+zaBgonHGlvB2a4houLeTh50
	uxQZFmHpqenhqOCAREgc58yJhmerPEAOXuflqEmGgpr5nhii7l5TK3GI0Md6ZQM2mttHDGh5f10
	Pq76S8dreCVh429PV3TmGd58b0RMbDJ0BlSMhUHNIv4fQ=
X-Gm-Gg: AYBFou00Diub39zIgO4kQiuMyMkTwqUubOFxAIGFlCGlyVxp1dcCJSrI0odMPsGl2Fu
	MUAeSKi5ggt1gUOnjImtVH3YRzdXkefNIaCz37Uz3JYg27IHHNQFo4VRk0NTI81b0xO7koKnpjZ
	dp3NMwYKbFwAKVG4AFnsj7y6nFCcKjKVgArEAyWBDGmjboeey5sBrafy83iQ==
X-Received: by 2002:a05:6a20:938a:b0:3e2:8513:a1a with SMTP id adf61e73a8af0-3f2fd595d81mr5860997637.15.1794484791713;
        Thu, 12 Nov 2026 03:59:51 -0800 (PST)
X-Received: by 2002:a05:6a20:938a:b0:3e2:8513:a1a with SMTP id
 adf61e73a8af0-3f2fd595d81mr5860973637.15.1794484791221; Thu, 12 Nov 2026
 03:59:51 -0800 (PST)
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
 <20261013-genpd-boot-performance-floor-v1-1-a765dc83e6d7@oss.qualcomm.com>
In-Reply-To: <20261013-genpd-boot-performance-floor-v1-1-a765dc83e6d7@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 12:59:39 +0100
X-Gm-Features: AclHuK_O5nFvGtE_KeD3RvWxSqq8Y9bCLDqrXk6wDOSNp9OUWlbNX9mKOhOCpr0
Message-ID: <CAPx+jO8bFnK9omp7GyCYqfSP=8c0ihQeF8Us2TwDCz6ieVjJRg@mail.gmail.com>
Subject: Re: [PATCH 1/4] pmdomain: core: Support a boot performance floor
 until sync_state
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: lm-wM_aFB72ZKFbIHJRS88hljmb6vC0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX/RxPuFZIaOFZ
 sCvumOsW4G49KDCQeiy8x9E3+kzgc3mq/n5xb9aAFxXP55vF7l0mLKrrbbNeuCOufsJe6pvhxa9
 mMvlmNJddHrWphjpXkl7EV4yUUqcJS1QU05cISFDJnzh+i6HVpbmQD8gLMRZSIfOV/eaK2GHcJ9
 HlJQpweoAz+hARf0OCV2l6VTtbcT3Q0djJDqdXWSzZvKg53ug5IHyvoj3e/xC2O5W2Fxe5nkH/p
 Mhtjr6rshA4FAzOcFNgAsUIIBzlpdZp2It5ktrao0phEtwkdfOu910nAfOT49MELmF0CMDtAPdT
 IISjWSR17//Ua6ISopowr6CimdikBIbHA5Ezm24lcKBO1JGvAshCuz2G1elkBHBjImNgFb+RnUA
 8eyPDOGSUqBCjKzHInqM4Pbpuzra8yyaVakRNxde4Z6Rvam96L3VzyfGF+iHUrM4aB27w76ckME
 I/dQhPKcQBTyPcE9NZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NyBTYWx0ZWRfX2M2HsY4eNxAZ
 zCatAQ6a2bkLKn9WtjRpiLG0tOkvUaNP03BfjGb0ogGxhgro2aP+qaazdMwRm5DOql6uv0XGeW8
 UbBLMe84lTJTDulgTds8vSS0lQEa4oY=
X-Proofpoint-GUID: lm-wM_aFB72ZKFbIHJRS88hljmb6vC0Y
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5aa38 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=IuyjCjZgo-2BtYxH3yoA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120047

On Tue, Oct 13, 2026 at 2:49=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Some providers retain conservative performance votes until their
> sync_state() callbacks run to accommodate hardware configured by
> firmware. Enforcing this policy inside the provider hides the floor
> from genpd when aggregating performance requirements towards parents.

Perhaps elaborate a bit more what this means for the performance
states for the parents.

>
> Add a provider-specified boot_performance_state for domains using
> GENPD_FLAG_POWER_UNKNOWN. Clamp the effective domain vote without
> changing individual consumer requests, and reaggregate those requests
> when sync_state releases the floor. Zero imposes no additional floor.

Why do we need to hook this up to GENPD_FLAG_POWER_UNKNOWN?

>
> Apply the floor before runtime power-on even without a preceding
> performance request. Do not skip an unchanged consumer request if the
> boot performance floor has yet to be applied.
>
> Report sync-time performance errors and continue the normal power-off
> attempt. Leave the provider sync callbacks and existing performance
> error handling in place, without introducing retries or a new recovery
> policy.
>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/pmdomain/core.c   | 45 ++++++++++++++++++++++++++++++++++++++++-=
----
>  include/linux/pm_domain.h |  6 ++++++
>  2 files changed, 46 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 964e44c2f78f..6f2b406ce049 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -512,6 +512,10 @@ static int _genpd_set_performance_state(struct gener=
ic_pm_domain *genpd,
>         struct gpd_link *link =3D NULL;
>         int ret;
>
> +       /* Keep consumer votes intact; clamp only the effective domain vo=
te. */
> +       if (genpd_is_power_unknown(genpd) && genpd->stay_on)
> +               state =3D max(state, genpd->boot_performance_state);
> +
>         if (state =3D=3D genpd->performance_state)
>                 return 0;
>
> @@ -555,6 +559,12 @@ static int _genpd_set_performance_state(struct gener=
ic_pm_domain *genpd,
>         return ret;
>  }
>
> +static bool genpd_needs_boot_performance_state(struct generic_pm_domain =
*genpd)
> +{
> +       return genpd_is_power_unknown(genpd) && genpd->stay_on &&
> +               genpd->performance_state < genpd->boot_performance_state;
> +}
> +
>  static int genpd_set_performance_state(struct device *dev, unsigned int =
state)
>  {
>         struct generic_pm_domain *genpd =3D dev_to_genpd(dev);
> @@ -563,7 +573,7 @@ static int genpd_set_performance_state(struct device =
*dev, unsigned int state)
>         int ret;
>
>         prev_state =3D gpd_data->performance_state;
> -       if (prev_state =3D=3D state)
> +       if (prev_state =3D=3D state && !genpd_needs_boot_performance_stat=
e(genpd))
>                 return 0;
>
>         gpd_data->performance_state =3D state;
> @@ -1180,6 +1190,14 @@ static int genpd_power_on(struct generic_pm_domain=
 *genpd, struct device *dev,
>                 }
>         }
>
> +       /* A consumer may enable a domain without first requesting an OPP=
. */
> +       if (genpd_needs_boot_performance_state(genpd)) {
> +               ret =3D _genpd_set_performance_state(genpd,
> +                                                genpd->performance_state=
, depth);
> +               if (ret)
> +                       goto err;
> +       }
> +
>         ret =3D _genpd_power_on(genpd, true);
>         if (ret)
>                 goto err;
> @@ -3794,6 +3812,25 @@ int of_genpd_parse_idle_states(struct device_node =
*dn,
>  }
>  EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
>
> +/* Called with the domain lock held. */
> +static void genpd_sync_boot_state(struct generic_pm_domain *genpd)
> +{
> +       unsigned int state;
> +       int ret;
> +
> +       genpd->stay_on =3D false;
> +       if (genpd_is_power_unknown(genpd) && genpd->boot_performance_stat=
e) {
> +               /* Reaggregate real votes, excluding the boot performance=
 floor. */
> +               state =3D _genpd_reeval_performance_state(genpd, 0);
> +               ret =3D _genpd_set_performance_state(genpd, state, 0);
> +               if (ret)
> +                       pr_err("%s: Failed to sync boot performance state=
: %d\n",
> +                              genpd->name, ret);
> +       }
> +
> +       genpd_power_off(genpd, false, 0);
> +}
> +
>  /**
>   * of_genpd_sync_state() - A common sync_state function for genpd provid=
ers
>   * @np: The device node the genpd provider is associated with.
> @@ -3813,8 +3850,7 @@ void of_genpd_sync_state(struct device_node *np)
>         list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
>                 if (genpd->provider =3D=3D of_fwnode_handle(np)) {
>                         genpd_lock(genpd);
> -                       genpd->stay_on =3D false;
> -                       genpd_power_off(genpd, false, 0);
> +                       genpd_sync_boot_state(genpd);
>                         genpd_unlock(genpd);
>                 }
>         }
> @@ -3841,8 +3877,7 @@ static void genpd_provider_sync_state(struct device=
 *dev)
>
>         case GENPD_SYNC_STATE_SIMPLE:
>                 genpd_lock(genpd);
> -               genpd->stay_on =3D false;
> -               genpd_power_off(genpd, false, 0);
> +               genpd_sync_boot_state(genpd);
>                 genpd_unlock(genpd);
>                 break;
>
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 14e0e346c610..5927d9485054 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -129,6 +129,11 @@ struct dev_pm_domain_list {
>   *                             powered on during boot, genpd will preven=
t it
>   *                             from being powered off until the ->sync_s=
tate
>   *                             callback is invoked for it.
> + *                             Providers may also set boot_performance_s=
tate
> + *                             before pm_genpd_init() to specify a perfo=
rmance
> + *                             floor until sync_state. This must be a va=
lid
> + *                             provider performance level, not a corner =
index.

What's a "corner index"?

> + *                             Zero disables the boot performance floor.
>   */
>  #define GENPD_FLAG_PM_CLK       (1U << 0)
>  #define GENPD_FLAG_IRQ_SAFE     (1U << 1)
> @@ -221,6 +226,7 @@ struct generic_pm_domain {
>         unsigned int suspended_count;   /* System suspend device counter =
*/
>         unsigned int prepared_count;    /* Suspend counter of prepared de=
vices */
>         unsigned int performance_state; /* Aggregated max performance sta=
te */
> +       unsigned int boot_performance_state; /* Provider-specified boot f=
loor */
>         cpumask_var_t cpus;             /* A cpumask of the attached CPUs=
 */
>         bool synced_poweroff;           /* A consumer needs a synced powe=
roff */
>         bool stay_on;                   /* Stay powered-on during boot. *=
/
>
> --
> 2.54.0
>

Kind regards
Uffe
