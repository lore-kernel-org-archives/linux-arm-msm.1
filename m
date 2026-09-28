Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C84D4891
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603872; cv=pass; b=KM9KachPV5jWPrXLOAAmu6hNTctXIcjdtuV/ghm3XpFqBTwDMj00a8YAwTjdtob0D67zR1H3e6LfRqDFKdwZw+CrCrMGVWbJkEFc9eZgRrNHGALf5Ni3ncSE4mnUeK2YdcHLM/EEk5bPr6E6str+TBxIPw9eMOmifMMq/jf9uTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603872; c=relaxed/simple;
	bh=N0apPBi5a5rdeR6XkE9u3uUSLlm4uI9nB9Kynheh+l0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HWRXaRn4IQNCTTuZ0yd4fbEnrKMh8Pf2iKV3TsFo0HQ9VX1Mh+l+iTrbD5GsX7ylrhqGG6GCHgPxL05LZoOAruPe63/pxpVmszSCNU3tqqoWEiEe0Abw4V6FTY47Hm81wMgb6MgzJxKXhSO7ysfA/FLOyFgPm/9ixyc/EVUL9m4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4tRZgHZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gZm+5Tke; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4tRZgHZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gZm+5Tke"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBA40t1433647
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 13:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=; b=Z4tRZgHZskb8ptT5
	TWLgXlXd5ZEfOMXoSIMOXv3xiSCfmZPrN/BXEN2Jx/EI7xgxsl/mhtg23qiOqhBr
	lotZeIr931hrlSEd5cQ/+wfndIUB7MMIEPhy0N4qQaoL3vx0QDP3gKzGCBMkjA4K
	qZEViEARpzKBw/bZJdJ6k6fM60UXmpX36/eFY3dIVjAN/AFSwPSLBAOzinZyFOZG
	8mAxM8Svcg16uWsn2JDQlVfu7pS1jD7EKG1O73xL6IcpK9DHPvN80Fj2n8ZkDcIH
	gzgCPX/52m/fh2UgSttxIDJ4qB8q8S1LQf9euuiVEAdLjZcrqYl5RVZOicTCxXKu
	X1l8WA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s1thb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 13:57:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8688139460bso2385344b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 06:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790603868; cv=none;
        d=google.com; s=arc-20260327;
        b=iwyrykXlpjAOFQVI/lAx8Xj3kLLm5up+vqysqNZ1oyhkVyXFxAYyRXRrfBoQumsG1Q
         4tV3gJWDyikiCkucVmgh2MnZ/XG8xCcwcxh+2ZVMi/ruwBl+zH59yRnspJEkNqhjT9op
         Y9XYgGgjBJFxqiK6WiX+cngkZPbHsTWdsv6WCJ9RZ0Mm6rpDFHSQRxiRicvbZCtM1H5f
         yihBGjpQPeii73bkN4LAJN0gbWow00scx/cJbfnP99y74wlZolluk7ZmCyBK1P0+r1sK
         OypuMCBGI3zeNhPr9XbOg7ga1d8l+VVWtDQSB/Pe7/doff12wD39GY/pd/007+sM0pU7
         kxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        fh=Op3TdRVAokldd9/XtyOIogxLnytdIB7fJdDqAyTKw6w=;
        b=PZu+61V43XTBbRcwgR7/S3SwuY7m6JQ6bNPdPxc6JfrlKR9xa54XfvKyPAQEUB7dKk
         yNBxFvDS/f827kFhK6NOO3huMDupFLqjDpii1o5G7yQXLKC0JZtqVBevHnWOCVdAjDRV
         NGgei06kj4kwp4lBLFkhR1dpGOMLjaY5dP9WaPiW2bebUM+49E+JxGQMFw8JF95mM1su
         7t/TQEromxo0APX3cH7AB66fC7Cn8IjsZufbwSusVnCSBxdIBxhfhcqNry9i9JlTC95A
         tP5zEElAtqZMJJO8ZUNTYG0mMRvgJjc45phUyk939sVJRke8ttMPcV4ikh2gHhImaya/
         aECw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790603868; x=1791208668; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=gZm+5TkeNiuNCWoMFmByiGuXPWyeZfYVqr2uIkJNz73oKjT5kMP3a1/PLCH20oeLe0
         xcvk9SuiHU33LZ55Fbzpfxo1NFE/GBDg/vuoWelGhue22jmQ8AZDU0QRjzBVyuk62/HK
         pohM2L7obX8b66ghXXB9PSYRPQlEfxawvn88RDeEYywCxhFFV4rkCqwxuRdiC8P5I24e
         wA+SBuii5pGi4MhJHWIoXYSph59G0Q0iayJbv5z+vVNVBDBVkY21N9yu1IDSzYOFOi1j
         XrXt2aO9RGNzSTW5/ek7Wg9xq+o+xZaDAI6G3NrmZIDngCZvK9zlDMcXh3IiziXH73n2
         ybxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603868; x=1791208668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KNeJ1ZSGtxogqYjubG/I2m2j0TylLASWTRkIlPxaG/Y=;
        b=b7X/F2b3Od8xELsqKA0Ta3T+xc/gHpwUK2bdnCy9wVmh82t9OJAdD159VBZYM6pcXc
         Cj8feFIAIingDUh4+tlFFp3DbjKnMj+CBy7XcRKtfabdpUWXoPTPeBzwZ8gszsELTTyd
         u66xwRJfRs0hW8kVWsSyl2S34KtqsxP6YzUXAgk6eDv7eMCCoN1SKMAdmJEj2y2criei
         alYgo/WcvWLnulKXBQQjcQdar+Z6IzgOQgze+GjPdTjuS6dRONWb2Pudu0vxb5Dydrdt
         a/gOwKuC8/dld12pCmfPNQTPc59eLGm7+PEymdqNlttPvy3ccyq9xs7llgLjBYnJo2Zk
         uHug==
X-Forwarded-Encrypted: i=1; AKwUvBxNm6H4tPnBwD7OGoB9JrjR8yf5F+e4SwFu9j6gU5yMfHnKHCMmH5bZwGEuMWnxPiFK4CJ66dRvSBS95JNU@vger.kernel.org
X-Gm-Message-State: AFq9FYIuZhgCT+ICDLI5GrkEIduZGDx1NLZGsRiKsRRssfyfIk2lYHwN
	g3lcOpUXSgjZmR8Q/AWHrYnLqlHZJPgr3d1dYMAzqP83rTq2BvgICazoVjgdGyB9VSsm6uqg+Z2
	EyE/VrdxeKWi1hFICLlAv+8/k/iUTNvXsVgiXWXqOxseEPPw+9DDtTFMCGBE6PwcEkfHbU+1qaa
	JJgGcjj2GZosWx0vVrjiMKTFOE1lEtQoVs9vq/dBL6ZNo=
X-Gm-Gg: AYBFou0O7f/AE8SiMXPraTqmto+G9QgFe4K/YGFh3Y4mwLF18FJojF2rkeaegRqMCkY
	ZR5ALjy26jHhkvpb219Drn9kHDLH3NRc7awvHhieM9M2s7RFp71qK9aQ2Jd3St4LHhoeaOMz0DB
	dU2AsYftae4nggVOsh0Co/KRpMHxbEj2o2bW/YUY+LCxvINEqEKe0Iws5eUQ==
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-881c8819a45mr4006734b3a.23.1790603868143;
        Mon, 28 Sep 2026 06:57:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:950f:b0:881:c881:96e8 with SMTP id
 d2e1a72fcca58-881c8819a45mr4006707b3a.23.1790603867726; Mon, 28 Sep 2026
 06:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
In-Reply-To: <20260921-msm8952-initial-support-v3-4-b96fd3fe298b@mainlining.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 15:57:35 +0200
X-Gm-Features: AclHuK-nE9h16BssbY-0V-0Lcqrz78yNjoqqCVRnCD5BWpC1wzqbo2Hd-T05VXY
Message-ID: <CAPx+jO9Vj=42dHEwLzTHe1b+nrvip+ibVv4iPquxwJKbFAkm=A@mail.gmail.com>
Subject: Re: [PATCH v3 04/19] dt-bindings: power: rpmpd: Add MSM8952 power domains
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX9wntkFfhzK8p
 Nm0ttIoCWM8G2FUG/j9Bw6av6ELAMsYeMCybPfOXnwq6UwFHqLfdAcyU8417KY0NxG1vMvbQApZ
 pUJcYfKFS1h0eFfeUu89YZ0FCOEG3/uj9CvmC37GTo6BmJadkC8anMId6qToBuPUML7+R7hHV2a
 xJNNiZYRhjjqK4ebHJK1e7zGYMm5KDD+331d6+SUiuG0w9yiY1kEccS3lmjv+VzbOLYaUVsX5QB
 yw8ECDKpoTZ3byLviDPljiiXYDlwV2GBW+nSYNlHIuOR6Ks/FKznFh8DvS1l8a/IufkMvuVaMBx
 kFPEA+94HrD+wb81unWnGGXr9DpIaOb1vT5fWakKKeMgli8xkMjDj/nJT+GcIc8Fv2UaIKr4h3u
 eV8FoZkYBViN+qxUVKkump1WB2WTkHS6XCoEEkXzVopmFMKduA70A6p9jUjDo1l06/Cjg3j6J+x
 QKEPZBxHy4/15fqbRoQ==
X-Proofpoint-ORIG-GUID: HDoGwtNUmiFeDwmlQdCK1vMtiLo4wxhY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1NSBTYWx0ZWRfX9MxZpOCYyCq/
 2V+CrRaHrGJgUwJFSxDpSGUabQyhCmfOdeQgtpN3xEJ7uh6S3p0JubxdjXcEAVw1eV/ejcfuDUo
 +hOU3nDwyqf0CT2YNH+973cYXqtyldM=
X-Proofpoint-GUID: HDoGwtNUmiFeDwmlQdCK1vMtiLo4wxhY
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba725c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=OuZLqq7tAAAA:8
 a=xo1k5ONJVskqAlz3UKAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280055

On Mon, Sep 21, 2026 at 8:19=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:
>
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>
> Document the compatible for the rpmpd found on MSM8952.
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Do=
cumentation/devicetree/bindings/power/qcom,rpmpd.yaml
> index a70bfacbc5d1..8ee1c25a7c9d 100644
> --- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> +++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
> @@ -76,6 +76,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,msm8937-rpmpd
> +              - qcom,msm8952-rpmpd
>            - const: qcom,msm8917-rpmpd
>        - items:
>            - enum:
>
> --
> 2.55.0
>
>
