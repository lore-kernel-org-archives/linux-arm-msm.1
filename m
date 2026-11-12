Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794490145;
	b=YQkoOPMA81PWWCuesncEUTC0H+RFv3LBW5BgXg7CYevMhiO3P80D8KZj1m5i6MadQi1U
	 l6J3SiGDN5beE/q3UIM9RyMtjZfKC6L79RDZMmVlWnDHDzdZNMNMJkwybOqc6pvsujDRn
	 jmltbAunpCAAlJ1JHkCVSJEjwXLiOlu0btloRTAkLgUja6z7Q7Gf/O+toV/e8F1I+yf36
	 ejAgTL8QGZS8/AXBWhk62Cctx/p0DtqLMieKntswoSt4WkEGksR857y4hErpU63dIMESG
	 2i+1OFbKSSH45Iq5umbUx4hV1fBbZvpNZrYcCXheYcT1SbT6ECRLvj0s3oo5ei3KhvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=;
	b=t/gpOdGZIiUpLK9l+4I8oQ8S0BLk7jZRCwiLpZA2o4N0G9att9vOQxdOORW8KshH7Ma3
	 GXljpIJfM556BIgEoKekzUOrpuVsoVHl/lfx9WiRu+b860cCAzDlKJf/a0mBfSXkPMZZ6
	 oBnzs8SZhtCHeaXOfiGkjc46I109jhfaEvlsHVN/CGesZ7ccb0CvnONtac+OJBmaH++A5
	 pMoU2n8BLMlHTTLlbqTLDmlHoq0EvNEi/CLC3sSRj3X6YfKewCZdowL04svaAZcKUgD5o
	 tQuGiTZRXJnZAcLDwmVbuuDZJIci3C+x4XaZ2NBwBJ/lr3VYyBipDiUpQjjNXjZIc4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHKb5eDi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C0bQsvZc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3911A606A33B
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:29:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3911A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHKb5eDi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C0bQsvZc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACB735Y3893195
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=; b=aHKb5eDiJpJBZRFN
	dRbClG27Ae9U79uxSNr929uJvTBsePeZmwMFP3+eDEXVhbw4wfjnyg1JPybA8N3G
	+qmEq+oY953GmpmWM8i/ru2g6aexJeAFwthKXyWr1FNvfS8mD2cM+QSA4YByU9yC
	fAgJHz3YO/43bTF7pM74x9pKJSJGocSqZ+6Grq6M+tO45wV9GAaP6kALoHFrKjGc
	RQRkQAv5mtOJYmxjtaiTu68Jg+5S7rfBPCbK2iPM9I/QzFFkLMqTldmoAfr577yP
	gWO3W/JiqEAGig25TIPQaU9lp6XMR0r0BRmJAd5bh2vlj52oUhR/X/JY1Vw9Dj+5
	0pxj2Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1rvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:29:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecd7e10ca7so1047368e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794490142; cv=none;
        d=google.com; s=arc-20260327;
        b=hn3wzXDwgAsRCQjHqmpT/eRsNOUZOCs3DpcnYZzOamYFJAbY1LWG/63IO5TOBPbGuI
         SwsZdn0mju0Ehcbmr3fNmfsKzarLvdD2iVxWkYkz4vHbeQ+hQeu15khc9fExcNKoS0I0
         4E0c1Pv+7ogAq1fN4tQpMiNtgKwQlvzYs42L3EGcJ9Foi5zonWe3DhahkkZWH1LWbOQm
         PlIxtd58FN19r5H+4mMoByiIBAzibfSdlxJ0RiFvcGEz9EJyHGT500Os3y5gnAWiXfF0
         aRwTpH7pd9Dp5cwesV5k66dQxtnSwEzH5gosMXn9RIYyBlStJw0mvsxAEYQ0yjD00Qj7
         Embg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=;
        fh=Rid0tZPZO8xo/68q6/34oUaVJg43S6uHEhIgjBwdt+A=;
        b=fxhYtTg+YkAg4hiwwI8e9DfuukshmoNc2SkLwoSd/q5UhDq2FcQTnqBJQ4A7cOZioK
         36N3N9tuHOel2pCG+AsuVyAZD1Y4uO6qg5wWxHPl+Ou+M6T7eDo8RnypZZeIA3yy70RI
         c4Feno4tr6cCUhhW5zhSs647R8QHGvu2Xq72+WxFGEsJrFjrjT2eG9ZMfg+edCxf5npi
         dY6tU58uztCxm/dLcLD6CdCdFQX0DC1qvk85kZwS/SGX7Wwf257ojjit3Wh82a9alEOI
         OEcJvTZTyQ7vEdbox1rX6idnzHOGR20VGnWRNBHMAW9yxWdl+3or+bKD/8yqy2UX4fgn
         18mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794490142; x=1795094942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=;
        b=C0bQsvZcLSG3G+FUDQMbBHnANZDfLe6x7EFQosPHhfJoEwGw+dCy0doUj76ujJCuN7
         qFP2YT0rIqESS7uHX4EIvDrKpM38V5KYPalkz3KRxuQ5rpmREUoLO/KxNFyQl4qs5nFp
         FT5XTwxct1D/AyoyVX0Z9Oi8liXbFA7wMQ4CikjphnsJPKgMpwuZ3Zg0Ro+Dw3SiCT0Q
         YHhBZv5mJhu+jmNd/ygNKwNoYmnMm0HiySlbWd4OCeTnzPANdeHhEe9pDqBLfOWAvzCo
         v4R4fyAJAC6ZF2CmL1twKgXoZFgabVtsVRLt3GLd4LFFd2H+78oK8ZXW5jXr1Cst4brA
         ViPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490142; x=1795094942;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3Q7qE6C41WE2EwR7PBZ31iNaUmwvqxyBhTAIBDkPGg=;
        b=gAX2DQJPfgh/qyNlwgkrz5z8Nt2A+F0MQgYZmSdyZYhQ0EEAerKvyKt9uJy1fXRZNY
         UgeDc7u8T7iaS4BG0kKpjqNPzDhnIppJ2SqPiQc5+tq7HNuStlWUhBsMZFeeW7xaq/At
         CvmjF2RsJjTtJDfVHYfYYMqo8HtWm1KAQ4pXRYQov/rOWdJ333muFqv3YRqFqgKwhnTJ
         nBMONGMVkKjhJ6bYp8iLFDYv0QBwz1s0CwdhG8F2gFXoMWf7zqznmL07pVru09sdB5X1
         y/t0b3pRV6I1vCXH8GcbdfI67non5gfpfJR9ZqQJbZQ5Sp+hHDoScmurMqlUAin09Coa
         4fTA==
X-Forwarded-Encrypted: i=1; AL+hErFi7tm9QoUtldL6toPPghBYmz1obxaobzrKODWTGPkdDVG9yrQhKWPgBhmSJx1XLwNgJOMJNiem25SDdaCc@vger.kernel.org
X-Gm-Message-State: APuU4Z8+awIdaY7Lq6B3x4hpGhPspA7GPST6rDMZhFj3vhmUP01lxstA
	CPKwGiz0ZLA7UV/SuCqCrakAprL1pwZnHb/PTIiAV5TfA3ygdIhFG/KB7nWO5cNiNcd4PGrSFuL
	q3nkFiYjUdVzdz4x3Tof0vJlRu3Gq6vJyOSPUGLOsHlvn/RasSJhdFdqHZhnMMffo2BlFt0UpHL
	bUnqtyP33Eb6PxWJtgLflU7xlqLRtU1C2xCXdjoFqAPwI=
X-Gm-Gg: AYBFou3JAY3rQILp5WjRaFZJLf8juAhXiIvfDCYEV6XJ+qHAg1AsjhdSrjIWl9++S6Y
	qm1iyrAhPF2MF8vMeV4oqXsD9BpKW/76LCmL+NirouEregtdVNIGiBN5f8mVPYKLHLJZXYn6J1Z
	woZuUMQCt86622GFW+zqCmnuGcyi2FZ+nOxn8/L8eJhLUpur4qqMR1YNC34Q==
X-Received: by 2002:a05:6122:e153:b0:5ea:d649:d1bc with SMTP id 71dfb90a1353d-5ee1c4862bemr2162810e0c.18.1794490142293;
        Thu, 12 Nov 2026 05:29:02 -0800 (PST)
X-Received: by 2002:a05:6122:e153:b0:5ea:d649:d1bc with SMTP id
 71dfb90a1353d-5ee1c4862bemr2162804e0c.18.1794490141804; Thu, 12 Nov 2026
 05:29:01 -0800 (PST)
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
 <20261013-genpd-boot-performance-floor-v1-2-a765dc83e6d7@oss.qualcomm.com>
In-Reply-To: <20261013-genpd-boot-performance-floor-v1-2-a765dc83e6d7@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:28:49 +0100
X-Gm-Features: AclHuK_Jzud3kBQ84L6hP3FUx4DNmy2hVYEuv1wt_UfgwdBavzJj52wOLQfTyB0
Message-ID: <CAPx+jO8krEjuMvgCP5Hy1V=oV+13dRj0WQkGCjUpN1cQn5XwNw@mail.gmail.com>
Subject: Re: [PATCH 2/4] pmdomain: core: Prepare boot performance floors
 before system suspend
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: d4VPUUMkqPEVcA1haPdRijG4jNq_jtu_
X-Proofpoint-GUID: d4VPUUMkqPEVcA1haPdRijG4jNq_jtu_
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5bf1f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=CEUtmdPz_awSc1UMDkkA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfX4WYXPGusYWYe
 5BnfhkRty2/egOTOsKgBtPOMvykDg0YZ8ZVc4wGEKPTQhDEmTbMr/uK4tKXQC5BhfqZxQm4tvtd
 jHCOLkX6W/wnAQe4TDj9guKFv0ImCuA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfXyv+9W9euL+b+
 rY8NWr9O74ChUii607/tSwtylWK+x3n05J6xZZOMaUWA6HGw/T/R+7tczA/2uU6+JfjsO0T/EEf
 22fZm9khqdn43RRItnkQzggDfRWxrLq8v8b4bebJNXpo8vLSTzCeLpUVWKdxYPo+u11u2bgphdq
 kSuX9hnswaXWW0J1U3iQ5Ce3yB53LNDDOlwBEvBOZaV9wi6/5uPoapSggIOOqX/HsAMzIR+Tb4G
 LrOYUKq0oSNCsn1lDOxI9NammoaiIvoPVZFDhP1c/P34rwESy6WnVMjJrxxjF+0WUe1TW3o2axO
 xG/XY5hDNRIwIONSEu2jvbaIJTUHFrYHAR32fKa9oUlXx/05bA/IHd1IDk+NNlVikIyIlwa9yE4
 0tWsJy2boFdniULMN67fP5eHlynn3kW+YgxGQfdTFKLZpoCFoScQ1mcYfkuqGxNBUyMRIlkfje9
 GG8CDvki7eBSklU8cKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120053

On Tue, Oct 13, 2026 at 2:49=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> A system suspend can occur before a provider has received sync_state().
> If a domain has not been used through runtime PM, its boot performance
> floor may not have been applied when genpd_sync_power_on() enables it
> during resume-noirq.

Would you mind elaborating a bit more why this is a problem for the
platforms in question?

>
> Prepare boot performance floors from genpd_prepare(), where performance
> callbacks may sleep. Walk the parent hierarchy even when the device's
> own domain has no boot floor: a parent without direct consumers would
> otherwise miss preparation entirely. Take parent locks in the existing
> child-to-parent order and propagate preparation failures to the PM core.

Question, if doing this in genpd_prepare() how would that protect us
from changes happening later on during system suspend, when a consumer
driver decides to update the performance state vote for its device?

In regards to system suspend, even if the sync state has not happened
yet, we are doing a power off of the genpd. I assume this is okay,
while still keeping the current genpd->performance_state or maybe it
isn't?

If there is no problem with that above, maybe it's easier to continue
to let the genpd provider (through its ->power_on() callback) manage
the restoring of the genpd->performance_state itself? In that case, we
don't need to care about the genpd->boot_performance_state, as it
should be indirectly applied anyway, right?

>
> Also retain boot power protection in genpd_sync_power_off() for domains
> with a boot performance floor. This prevents the system-sleep path from
> withdrawing their power vote while boot protection remains active.

I don't get this, sorry. What is "boot power protection"?

>
> Keep performance programming out of resume-noirq. Domains with their
> floor already satisfied do not need another performance update, and
> no floor is imposed after sync_state() releases boot protection.

Please rephrase this. I don't understand what "releases boot protection" me=
ans.

>
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Kind regards
Uffe

> ---
>  drivers/pmdomain/core.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 6f2b406ce049..4ff55175d899 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -1538,7 +1538,9 @@ static void genpd_sync_power_off(struct generic_pm_=
domain *genpd, bool use_lock,
>  {
>         struct gpd_link *link;
>
> -       if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd)=
)
> +       if (!genpd_status_on_unlocked(genpd) || genpd_is_always_on(genpd)=
 ||
> +           (genpd_is_power_unknown(genpd) && genpd->stay_on &&
> +            genpd->boot_performance_state))
>                 return;
>
>         if (genpd->suspended_count !=3D genpd->device_count
> @@ -1623,6 +1625,31 @@ static void genpd_sync_power_on(struct generic_pm_=
domain *genpd, bool use_lock,
>         genpd->status =3D GENPD_STATE_ON;
>  }
>
> +/* Called with the domain lock held, before entering noirq. */
> +static int genpd_prepare_boot_performance(struct generic_pm_domain *genp=
d,
> +                                        unsigned int depth)
> +{
> +       struct gpd_link *link;
> +       int ret;
> +
> +       /* Parents may need a boot floor even when this domain does not. =
*/
> +       list_for_each_entry(link, &genpd->child_links, child_node) {
> +               struct generic_pm_domain *parent =3D link->parent;
> +
> +               genpd_lock_nested(parent, depth + 1);
> +               ret =3D genpd_prepare_boot_performance(parent, depth + 1)=
;
> +               genpd_unlock(parent);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (genpd_needs_boot_performance_state(genpd))
> +               return _genpd_set_performance_state(genpd,
> +                                                  genpd->performance_sta=
te, depth);
> +
> +       return 0;
> +}
> +
>  /**
>   * genpd_prepare - Start power transition of a device in a PM domain.
>   * @dev: Device to start the transition of.
> @@ -1644,6 +1671,12 @@ static int genpd_prepare(struct device *dev)
>                 return -EINVAL;
>
>         genpd_lock(genpd);
> +       /* Performance callbacks may sleep; prepare the hierarchy before =
noirq. */
> +       ret =3D genpd_prepare_boot_performance(genpd, 0);
> +       if (ret) {
> +               genpd_unlock(genpd);
> +               return ret;
> +       }
>         genpd->prepared_count++;
>         genpd_unlock(genpd);
>
>
> --
> 2.54.0
>
