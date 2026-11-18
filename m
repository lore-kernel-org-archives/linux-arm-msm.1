Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991278;
	b=BFFih1WbEyJAap6CdDnnx926KNEPLRBUSw5wlvJeCRtg3vZ7VbZsVUrlyG3XtPIK4OE7
	 zJxnxlQZs6eaYwhqMqSlsRnqwH2PE4s2y95Gvkd8LFlTvDHOh0iLCzoHJA1vAubkM7L2f
	 H5RQxzfBVHYAbslUpF14l4BDZcy+UbStX/383PSg6DL996+Um8gteQZyKCWe3tX7qJ6+2
	 kP+/XZ6+cBOKeUIjH44ILnjQvtYMP8kCmbhy8WGLY5f5GGKlSmtVjVJdV/6utAWOIYOKg
	 O9uaqZDdIDhbDbegXpsOI0Fc5iQcOU5fMduLeCjSg2zeEXkOT1t0bhx1AeDN0/yCe+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=;
	b=WbFhXLnZ3oRFfeT3Pv/aOzZ/uSdfhku+pGaFHW3eS1p9EF9D11veVY1StMpGPmVp+YZ9
	 l/aQT4bIKoLRwwgIZ6KzIiYuu3XdeGERn+5CjgqaPX36xyHfVYlN7ZlNhtKw/13uZwjFO
	 ULF4gwkUtFhQAynJ67jIZXLZlfY7otl5G4WJfUKQIsFEL8LMwVAGIG8KVEs7X6AWEdGGO
	 mR6UQm8FyE1Foxa1FDAKbkppy8ku0HjlUuINTvXhxb5M7jfTb1zQFB0UfXcr0s5dhtdwj
	 Z6YVoDuofJs4GA6gnh6jU9NHp++/SgjLkgUy1V/a9CwbZSKzNuzGL8acws7RumQpsgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4PGe8a2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JTQfpQO7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677F7606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 677F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K4PGe8a2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JTQfpQO7
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8HvFi1959809
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=; b=K4PGe8a2AJQ3QwHF
	PBw7MyaL2sGuePg+lipgm2fMFlFt7jULjJKMwU8Til/FsUoeZrCDA0GFNg+SnOH2
	wWwVhP1xd/5rGYL5C3Ar9pD/DNhvCKBI8yyiOftLBMrmDdKfN9P7whRMs+9pLOk0
	xOLt9of5pttOFQMZcUcNv8IbmfRqIckyijt8jc+Odw9FNIB34jLSbeH7kyqgrkN5
	gNmwCPyeQSDz+xuBR2BM6pGNJtU06SKJ43Y9QMAljuWZnEk77DaVz99gWahhR7N7
	dIcLxUR20EQ2Esz3fMBKOArKPXXcThRDUbPZKHCfe+XJyTuC272UgAGJj3WQ839n
	9l2eLw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9j3bu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 08:41:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496ff065bcso111488385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 00:41:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794991275; cv=none;
        d=google.com; s=arc-20260327;
        b=pe0o/fEtNln93kfwuMaP30+PTQBcNCDVBAHWxZwrUcGCO8msDm1kK4S1Rga2dYDsh+
         1EBviFW8GmO3acns9EwnPjVEK8GdPqLIwSUAhOnYXKTzjTNxEpuGNeWNpHUWVZWsfzz3
         JBUwId2kbHEvXwMd/UXoBRIEmd4JfZjCTbHqK52uzjbOmt4/Gmudlv48X69auoPerRE4
         MwF4Vi1/O+cXny3o/DH7HyI28ENXAT5tvaHdu5368pFh2h+d/TtnZMcEjeE9qgcXqIEw
         OYuDSZg3JBN4EAbtKyL83nFIk9WhQpCLwW36YxF0HbBATxbo5ZdJcqtLgpduUV+/V7Fk
         DjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=;
        fh=SxQ5MzWK97eeRdbba0DPAlFt2B1tPnC/4L0VA2IiSIw=;
        b=LV/QMAmkJJO8uLetbFhS3ELOBsFdQlPDETvwlVCF/OfM771yBMy0MINrOh8vErd31H
         P/rGNIjol9RbYQArW82AIOhbW15OkpVqVY2bqOecl8YHAIfDftNRdS4af7y8jVHoqGWZ
         2Thl7hvdcJKCafN6U+y5X/ER+6KNRtlY/sveRCIlb15nnXcZJho1Y7KskYItL+jZa9Ja
         iyBrTKO46Mp7UM7gUVtSkYfy0r4Q9MwfmUFZEMdkGLqTgCBBb46qXx1eSoRnZKy+pM+o
         bWTVEUVn+6g3RkdTxyLfgKD4LAAmPE7gmND3cSgFFHGSMU1eE6OS4AdcyaN6l9PIhm1c
         yTgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794991275; x=1795596075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=;
        b=JTQfpQO7R4gnZbSQjo7ie7+mdEVx29ORltUVi3pPh8vjpUPdUr7CM7Z392KkVaaV1j
         WWPYyoF1CpYuYiCoyiLMx5Pf4+YrmdvefLhZD/O6TO0yLyWLi/NVeVDv030fzw2lsMZr
         BupZU/s7YeMA5fFmNaZMN0e6Izo/xnNjyZ3Mtsvo0QTokaI80RLMvQk5nfdM+3EZjADj
         szViYEfD8Q8s7bKCdI1qFhvMmuhwrNhDwTMFGqoyEERINR4N6It7Im01pjiIVVGfwu6J
         X3ahup6WIwCj9qEANflhlNZLXQXu6TqYgWhMgHEF3yvEoFSN5zw8eWjXu2mRX5nH7iit
         YEWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991275; x=1795596075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2PDR1sXzJEhRPZlouhM1X3aDoO+EiW7HNR5Yn4/7x3I=;
        b=OYSD9PT+otzf3kOe8+2/wSrF/rTHsO0GoBZ71NvEt+YGKK3/KJZ6ysQP2904enEGqE
         XipRRFjf4f5wD580BY4uXsoNKidpv9kDH/0TOtCpvzjqPVvo6iM5Yb4m7tvGSHXbC/3Q
         5RSMqIRG0barW/9VL2lEAHxHuCzrvY9H/Nb8j2abr9F9/GqIVSX2d9QaVg6H3T3yZoyy
         si0CiXPE054kqgxsk39RU+q9h0A27lZritXbtDTQOxqJrcBhKGO4iz0aATIuDiVPC9t5
         Yodmv5Le9lH5D5YunF/TnubbhbK8ehKayCfjjH3MdgRQTdwpacnJzqf/OQnYAdYNdF2f
         /+3w==
X-Forwarded-Encrypted: i=1; AL+hErEthjcH25keK7Y0KAXPtY7ky4kvxIUReoCiwyEBpxU0+4RYh/83tpCssoNxLSHLZ53ookZMQvTBKUPX9Jf4@vger.kernel.org
X-Gm-Message-State: APuU4Z+WUUpYPGGDnTPrEDkAXhUi5VN1wo9FzFxjUl52WXXR5gCUp1l1
	WBb/hDGL0xweyKBV8MOVEPvU+DUD0yWCB9PcMJ+KAYqYR0uXU5H7SIqan6adjxLJdCXHqvp4KlO
	lr/l8sJsOwno6dGAplxM3BC2T1iYdByFTk19JLZZjBi0Wpna2uZOtMktzsZj9TX7wExrifJ2vNv
	hXSOE/HrXrrAjclDCQ889oUZkfrFtbO9gvedqqvjdZXqs=
X-Gm-Gg: AYBFou2XFKRZyTW3NNnqMb85rbknITZ23gC84tAKAgJzHduGMB521rhMccPplSsllN6
	/3zTe+u5DxuKKkql0wIbAGq1128uvAirhurA8/bh/9WG7JtFefJmXi7pL5p2gHI5JaVzBMQPeUP
	pQFfERc8qKCC5aPl9Jdz1MU/Mx6J3K0eNuJ21J+EnuQWtigukc8lLiS7iIHvzQw6GwL+gCR4MA+
	PgT5pgZsnhPodTx1/9+U1wCy2nWc58NLXKs6bnYEviGbOT5epbgqXIjjxksoRuQ8XEHgc7mP+Vj
X-Received: by 2002:a05:620a:6f0d:b0:949:7792:1106 with SMTP id af79cd13be357-949994af00fmr330545585a.1.1794991275499;
        Wed, 18 Nov 2026 00:41:15 -0800 (PST)
X-Received: by 2002:a05:620a:6f0d:b0:949:7792:1106 with SMTP id
 af79cd13be357-949994af00fmr330542285a.1.1794991274828; Wed, 18 Nov 2026
 00:41:14 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-camss_fixes-v1-1-93e5b59e8757@oss.qualcomm.com>
In-Reply-To: <20261118-camss_fixes-v1-1-93e5b59e8757@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:41:03 +0100
X-Gm-Features: AclHuK-asv4S0C-28UwXcCzwq9HUorGHrcOVKgqFhPzimzBIbD84VylDeLZBO7o
Message-ID: <CAFEp6-3N-iRjKXnQsG4mPGgafRQd5ZE-Kucf70dXye4Qr5OAYg@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: Skip disabled PHY API devices
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=QenzLcbv c=1 sm=1 tr=0 ts=6afd64ac cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=Lk1wFp84Q21arWboEzQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2CV7OIL9eZna43fb-8RynrJM-H9Ou-K3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNCBTYWx0ZWRfX+sRlSuMhEPaM
 oPXLMa1C57qFjGg1q175A/OMAorFBWoHnM7NLRaTepbjmSYmddskL6hltUmfgW8ffNU1d8YZD0t
 +YIH+/RMEE6b6QbiLIp08CqZFlECT3WE/XIbLZTi90Ya3NgqHoawMwRn993B1XeMF4SiIfhwHns
 f37aPxfsC8k48nSUvSkJW6GeZQ6TBdv5P5exf4poi5726hOzgKSd4EFmqGiaJfVx9Bsh3PRYfe+
 DW3GXeJ613iFpgF2R0o4X8gpPXedRG8F17jYdzsHPR2n4r9DMACOKARpTnxCA13FY4+vSg46UxN
 AhlNv+ohDEmEOBrYY9McLQA8zUL+7A7beb87LYN1LjAuTh8XHRvuke/9NfisPN+qUdHiCRDUGjR
 +6H+7Kd0n5J/bS4lHYFzPRV17pe6URG8+tOtEJapHz9zLAVzRx1oFfAlkm87nd73NDBQ7FdusJC
 D4NO/xyb5plQDOiF6rA==
X-Proofpoint-GUID: 2CV7OIL9eZna43fb-8RynrJM-H9Ou-K3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNCBTYWx0ZWRfXwWl9+ztFFoyf
 FccupQKUFNekzhtX/YpdkVqUZh2elgu8bAhTBdK+iVjmtek42qQ6MwT6uXQOWxnvBdf0BTVXfrC
 TLIH+p5dCNy7LZE0N0emM/kjOuG/ujM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180034

On Wed, Nov 18, 2026 at 7:36=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> PHY API based CAMSS topologies describe CSIPHY as a standalone DT device.
> The old availability check only looked at the CAMSS endpoint node, not th=
e
> CSIPHY device node. Since DT normally disables devices with status on the
> device node, a disabled CSIPHY could still be walked through and its sens=
or
> path registered.
>
> Check the CSIPHY device node before walking through it.
>
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices=
")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..ddb47c3ee271d2202228b089c=
3179d134b5836ab 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4745,9 +4745,6 @@ static int camss_parse_ports(struct camss *camss)
>         fwnode_graph_for_each_endpoint_scoped(fwnode, ep) {
>                 struct camss_async_subdev *csd;
>
> -               if (!fwnode_device_is_available(ep))
> -                       continue;
> -
>                 if (camss->legacy_phy) {
>                         csd =3D v4l2_async_nf_add_fwnode_remote(&camss->n=
otifier, ep,
>                                                               typeof(*csd=
));
> @@ -4763,6 +4760,11 @@ static int camss_parse_ports(struct camss *camss)
>                         if (!phy_node)
>                                 continue;
>
> +                       if (!fwnode_device_is_available(phy_node)) {
> +                               fwnode_handle_put(phy_node);
> +                               continue;
> +                       }
> +
>                         phy_in =3D fwnode_graph_get_endpoint_by_id(phy_no=
de, 0, 0, 0);
>                         fwnode_handle_put(phy_node);
>                         if (!phy_in)
>
> ---
> base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
> change-id: 20261117-camss_fixes-4f15a35a9f18
>
> Best regards,
> --
> Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>
