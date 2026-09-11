Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980663ACA77
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789121783; cv=pass; b=dFuRAi9u0Ki+tVS02Nk2jXFjctEzQDDSlnVna7oPlBe3V+WuJi+Q+b/mFeL4XDHKz86o5GrMvx7lrYKT2lA3sn++ZX5r4+hI16roex+AgKR8/3fQTveE8ZXSTbwVmfHDM7Ti1Hbl2A2YpgsXMxJDpMg4TmbnwvDVIS6hIy3L924=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789121783; c=relaxed/simple;
	bh=sTM5l7/mcpTgFtlO+bTq27FtaZVY8D3bMeRpxINvEgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEow/Bvekh+ikMOtu9hlHBm7HtuJ6pJ68NNPbSZcSFTcWLqOfRIgebqbQ/O5gK7shO/PeAS5OIXTFWXl6EIvdVnPexJVRglWh+LQl6Tfzweud5U3j8/F5hbVi29+2Dzl/cAXiSZ+WHUTo4cQFKefzC9uB7VsQqkrswvA13PhmmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrR4J3e8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QTysus5B; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrR4J3e8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QTysus5B"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B9mXZm3292279
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=; b=PrR4J3e8x+OtDO1O
	JurWKSGR7mZQMxGkxFWrpX+utMAc1QQmmECC+J99ANcXMVPnpxGQqXEVk78ieeLF
	bxhyraqi/484Ui80ebM9twYlZamO5izrF5AYuLp8+KAX2jecaajL9u6H6H1eISCO
	v932yIZLlL4JlVLgDLqgzvpPfw5EYDItlo0FNKWU5r2eqec0HiKlQpI3O2nnncM4
	qUwBxfMZZSDWthrnGgMgYc7K7xaWcBsBZURlATzRDj2dBWIwJc4LWfERpaQg/V15
	C/4QPszSa9Vrx6kK/UPefSCK/uJR5vDyst8JwV86MsQvZBGuljEO4GqtcEY9DMmf
	GGck6w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbg3ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:16:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso17650665ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 03:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789121773; cv=none;
        d=google.com; s=arc-20260327;
        b=Kvf4IbM8JfvCJrghrf5KL8r2fZHCN25rcsWmlEtLo0Wz56qrkSIEOGeFUxujLYCGpB
         olo/I9n59aiPJz86NrBhDOlBRRMz6Ojl2ZnNleeXdJfvnyzF8sqmtDTE+RLJrfMkw4Tv
         ptYS+bXVVpWGe+5TPbbAN2f5aUVlOeEbaEPpTJDYVu+uZ8qVJkYr4YLWrvkwXgCa10pa
         yiDLZzvdZ41R1ATV6tDS4B2lLGw4qgJaKgwtJKuqarcOB/0v8wVCC2vunWXR3MEBnt4H
         kGha8AEMGgIv+ianBfZN/pDfkxpYYlfs/WOn3Lba+JiGGQ5X2RxJmyNsjjzQZQIL+0nO
         hNnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=;
        fh=x5UhkquatLWQFhCpVv2Em9MO0XT+VexrRVdm/BfYaK8=;
        b=gS3/g/HvuKJaTIzmSJHYcNQf9/EM4huG3cNznMiQDA7C6OEd3FCD4SfI/dZw5Kl9LM
         8gV2BDHjN9tfw/Gfb+7wXtWkyGBavCrJ1h+stXKThdUU1H1kpZWXPkQzl2+MMF/iciX+
         Joi8JO1tmHt2JQd6MLw0rbX9OUr6j/dp9WNqoZbVBIy23jFVF4O11by6g0cbRkXPxMiW
         8ZnGcUxGY22/dxNglLQLAlcohb0jaf7xFd8z0XRQXduRlrjOTTyKoUif9Muiy2VxYs4u
         L8c4yeVCTnmPmlBDgRRGpmql+F8r0d930epK+1Jr4B8PCwMFLaDESONKew9WUV5grfVG
         n48w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789121773; x=1789726573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=;
        b=QTysus5BIfdvN/xf+iZzwakSsQxEVCMTjFZ6uGr8a0oaV4Z6huFi3T+Qi3TOxqRuCf
         nR9wtlZDKNe8jwU/1t61V53B8CUZzniUma1gewwdRJSTqGpKUinF1CWzp31BbTvkM7Mn
         jFQZUnu82uds/rntrqwW4ks6uFbPnOVUfGCP76C2e56MLsX+tsQUTylIwDAI6D4U/dGD
         tJF/D5LQ3RD/iaRNQLuklpvwjtKwc1+0iz//4R8j5X8E+PXMDe2t2HXbXk7BuM+r1krz
         T69d+gvZLDFkVKEPrxhGPEg3/HMvOqFMNxK7pYTiQ8EkqnGdhQNGpmniDOVZ1EUWtNW7
         8dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789121773; x=1789726573;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O+OJapG3xvg4UDzpEuXgFJ8O+WhYav0LSOmiv7Ij/KE=;
        b=Y3KfNAP4qD18Wd6fltoId1f40He7OWNOf0yHye0rFP9t9668MWB6lc2Z4WJnzicN5k
         gon5XSjmwuNX1N861ETbGs4gSvEy3IElbQcgmh8U/RBqGBkpJAvDd/QaiYHaLx+weGhs
         KHu3J8Evvyb2Uve876sEHhfSvGpZ1lPFAJfkRe+r0uRUBQnM9AuQZprjKqXgKC24//sJ
         NrTKJK1pPJoOdFyAFayHdO5lo6QnI0qw6naYhtEdQ9Q1L12UkgUL0sISUEKqA51XUBDn
         cbhIUEhdNBopLOfQNYwEYlmsLJTexYo6AoK/khbcksskOq7LZQcBw2+eTN9LG6VsxBtp
         EXbw==
X-Forwarded-Encrypted: i=1; AKwUvBzcV1LNhqEaG7IHP5IEv7uvg4sZLtMt2z9k3ttiCPYrZte4c71P+OEWj72YZDU76/wRyVhh3dCzhVo0iUW+@vger.kernel.org
X-Gm-Message-State: AFuF++mzn7F/bML4WRF8tmcjNSZXoY61r0z3gHQtoUIVYfdGpTO8AX1q
	7kD/tyFtw5HQWtZLGolK0GuWhJFXPf00IgNyNpp+WUzKjKBq88W3M9WJwMamfan/ClZE7/kK/h5
	LUkKYOtzGuZAbSCRwtNfaeBaKD0AXl5zTl8VLPrCHoXult/GepG+rrt67aOBLikY/QPUTRFW4FC
	Z9s7+BqKZHTdo06O2JESWbK97Q2xi/xROFzv0hz+eXgbU=
X-Gm-Gg: AYBFou0nj/KxrnLOzJttF4As92yqVi3Ej5ajNx7JVBzE3elHS5+uUmp94ko8ocYq4QQ
	LOVd818WdcGoJKheJbQ/xVr1Ojtvhx4xND/xTDjSyRmySLivlP7gq8VHpRsvPr8N4Nwt0wydDln
	wdP2t60z7Gwl8blOS5WtAZ6vIZXpS+3NMtrz21iKgCzjPTgPE8oHvORKH8Ow==
X-Received: by 2002:a17:902:db03:b0:2db:55d6:349d with SMTP id d9443c01a7336-2dd2a45818amr67010715ad.21.1789121772788;
        Fri, 11 Sep 2026 03:16:12 -0700 (PDT)
X-Received: by 2002:a17:902:db03:b0:2db:55d6:349d with SMTP id
 d9443c01a7336-2dd2a45818amr67010175ad.21.1789121772237; Fri, 11 Sep 2026
 03:16:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
 <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com> <02b29827-3ca3-414b-9377-972f3d46eb03@gmail.com>
 <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
In-Reply-To: <CAPx+jO8Cf_NGJ6h30+cd-arAJGQL=V1HayRZqaTrM-xg9eUhpg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:16:00 +0200
X-Gm-Features: AcwNN1VXOL5T2wS1gBfHMSChb8upujLEO_jTsEBDjEO09CtMln6UezixLgCoqhc
Message-ID: <CAPx+jO-ZP_09poe0rHm+h4QQZBbHJisCdQGa6kA67sQAkU-BfA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM
 domain to do power on
To: Dhruva G <goledhruva@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 8-v-w7fzrfcsTcSJShj0hKT9IGsNAns6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0MiBTYWx0ZWRfXyJOvQLNIYWF7
 QKy6nYK3E+VvG44T8WmsJ2DUh60bWiNIPMUnUDNfQ55WYkHI0gAkuB7OUF8ZjbX1uCQQTjjF68o
 3bNkySJrR3waJwRKzxMlNkIyYO10oTWcWZSUNotwUzC5bZIueyGbIwnQ+qlSvaELOo44ar9Aoyz
 /cepj+4bWA3MMJEDW+CRJf3ifA6VVyK14ze+y6qH9kL2RG4ZNNM6zUIoH6EqshcV2VEZFRUhbU1
 0iHSL0OemB93kO2fdI5Bgnje88iOYk7zkleTa+eSEK38LJDJ53u71X/zxMbrm91RHM3aRb1WfVi
 i4xq9YdrWPG13O1bcoaArsYie/Tt4lBLSWaUKX+zS2wLK32xUT4NO4b6auPj9fuXbj5cXYPspAH
 pU6svZLEdo44I3VJxtOU3qMAb70iStG8Ne8R+EBqZlYXD4CsV5fwOImu0/oHVVl2cRp/MJz9sEB
 DUxAYdJVH9gwArouG5g==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa3d4ed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=u8BtVuMVLpZXKRMe:21 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=42KKylR2Cj7GAKIKN3YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0MiBTYWx0ZWRfX5sNkuRqweXR9
 Bg/5n5JwUM16Bek39jiSSdUg82utK7O/0TASW0MqKe+zs6w8cSn4gR5DeD5S6inLcNwjtXgkvaV
 ChtoOvqyOkjzPODTAnzIIJN2O1AboYc=
X-Proofpoint-ORIG-GUID: 8-v-w7fzrfcsTcSJShj0hKT9IGsNAns6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110142

On Fri, Sep 11, 2026 at 11:06=E2=80=AFAM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Thu, Sep 10, 2026 at 8:31=E2=80=AFPM Dhruva G <goledhruva@gmail.com> w=
rote:
> >
> > On 07-09-2026 16:46, Ulf Hansson wrote:
> > > A driver for a non-CPU device that is attached to a CPU PM domain (th=
e
> > > genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently =
not
> > > able to power on the PM domain. More precisely, to power on a CPU PM =
domain
> > > one of its corresponding CPUs needs to be woken up if they are idle.
> > >
> > > The current support for a non-CPU device is that its driver can only
> > > prevent an already powered on CPU PM domain from being powered off. T=
his
> > > leads to problems for a driver while probing its device or when it ne=
eds to
> > > call pm_runtime_get_sync() to turn on the power for it. From the driv=
er
> > > point of view it looks like it all works fine, but when accessing the
> > > device it may end up with various errors as the device may not be ful=
ly
> > > powered on.
> > >
> > > To fix the behavior for these types of devices, let's adjust the beha=
viour
> > > in genpd_power_on() to wake up an idle CPU that belongs to it, in cas=
es
> > > when it's needed.
> > >
> > > Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNr=
sZVYO=3D38R2cLV8nw@mail.gmail.com/
> > > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > > Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> > > Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> > > ---
> > >
> > > Changes in v3:
> > >       - Moved to atomic polling, pointed out by Dhruva.
> >
> > Thanks, but even in v3 we still have potential issues.
> > It does not fully address the consequences of polling for five seconds =
in that context,
> > nor the parent-lock nesting issue.
>
> Well, I assume we will not be polling for 5s, as it would be an error
> and it means that we fail to wake up the CPU. But, I get your point,
> 5s is really an unnecessary long timeout.
>
> Ideally the timeout should map towards the deepest domain idle state's
> entry+exit-latency-us, but rather than looking at what is actually
> available for the PM domain(s) in question, I think it's easier (and
> good enough) if we just pick a common value. Usually these values are
> in the range of a couple milliseconds and in some cases up to
> ~15-20ms. I suggest we decrease the timeout to 300ms and see how that
> plays out.
>
> Also note that, at this point I don't know of any use cases similar to
> what you describe, where the device in question is in an irqsafe child
> domain. Hence the polling would not be done in an atomic context at
> all, so we should be safe. Anyway, if this doesn't work we would
> simply have to limit the support to non irqsafe child domains.
>
> In regards to the parent-lock nesting issue. I don't think it's a
> problem as genpd_wakeup_cpu() is not being called recursively, but let
> me double check this to be sure.

Confirmed, I could not trigger any lockdep problems with my tests.

If you are fine with the above suggestion for the timeout, I am
thinking of amending the patch when applying to avoid posting a new
version of the series. Please let me know.

[...]

Kind regards
Uffe
