Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795203617;
	b=0yEcJHHIFPkZ0XxiO3RW1Jj2oQGJCMaDnsfXm1ktwaSc5500j0UK8l1ROKcpbm0PZ0Gx
	 0waehxibW+rDDrDLrFqVEwCsqY4Uveb8kWFFfHQZawsvVGgwPdOhuxVrHLxmftRO5XUb8
	 Y/IkACN2COCCMfJQm+3X8vdDZhmDjMdEbopWzV9WhSFXhE5WMnLZXesvEFtNyKh6r7x0x
	 O6kz0Rw9Zw+YMh/uD7xKuvXZBa70uFKd+fF8mBHZqQPYNWIFM0imwCO4ja/wXRold8O4W
	 tQhEwdjLuWXG9htKSX+btwn9axXphrSuYx+o5CV6tiK9aMQnXzf9Z4v9YEl7Etyg6ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203617;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=;
	b=sXRVRc7SJtJ0ECMMVPHangb8fvOeaqgVFRAqe6IxugJUGSAOnB0he+hJu0HEVZHVlP/v
	 UIPt+sIl/ciTWzaOmORNwaUkhTwP3qyUupQpyYcdnsszxbfh28wFdlj9H2FAWvLTfG2+n
	 ezANov6MOx0vyUyYPmSdFQB5Zw5+I2Q5WIZNVbfNqoYHgHTMyXAdm9q5XDo/DFkApxEke
	 4l0xelM41o3ifUBV1oHCoSbGkf1YNus/LZompat6TeTBW62j8AlyDy253gU1LfOYFxQly
	 ietcKJ/fDhEFHWz+FvwIa8DIwXEsgoyzijetP5NmuO3sd1YOmvPmhQuKLLfhg83xutw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=du5WvwWo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a/kcW239";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964ED606A6FA
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 964ED606A6FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=du5WvwWo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a/kcW239
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEfi6p2947046
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=; b=du5WvwWop2S3bP1j
	SYaOk2PagB62K4/CU42/NaDawhoS2QDQ0NY9tUZZjAWiUDJOzFDhBwZEHQvvuiXS
	WIJlZNODqaNVHny/TbZLeentVOxg9GM4yJC8Wg3iXyJY6trB/EjjTsiVswEwYhSr
	8+wcrvPUK2cVIVO8i3vy7ILmi2u/8cLcagrsqJ1bj5V1hKzS7PqUU9CDWW2HOkV+
	Y+fZCRQQxkqWL538s7rZHgJKzoppIBhkk7r8vY3tS3Bv/hC8p//lIbr8tbehscGi
	bUBfRr7x4QlgRVYnZVFrBZG4n2rZcGuXUAkCOTmlpP5x6I0kuAmgjaiiaEeP17Un
	HvlxAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjjbjks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:40:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55d2f5f1e1dso19469531cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:40:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795203607; cv=none;
        d=google.com; s=arc-20260327;
        b=jawwB5loPzhPIMB8FoTueirIP/keu2CVGP9uCeDWzcUHZwYMt/gCM+pxYmg+Pspyjn
         fZ2voK4TgOS6A0wQ9kHddfAPNqRKWtXjuf+jnGyXNgOjbMJvYbgy8NMFlsO2PTDXNjB6
         r6GX6NMCP4Wz6qQbR4ERS8vvTOTyppcD2Rmua4/rUeoAbbD7uCpNs2mHMDBIy2IymAo9
         V4gF8rQinQ3CFYeMBe6NGq9I2o3plAxxUtDAyx8nZ3N1buD8Ow5IWAHf19b0r7EUiHy8
         XVz0LpYDrpRuvI7B+fKDDsMLkH4yNa/7wDC9WPRMCuUxN3crCtiJEv3MEMRYfOHnG16M
         Vt0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=;
        fh=D9BBEXtFzRsrRunq3izZpQv7UC/VjhMXKB09Pu5dm6g=;
        b=PPD0VI+121UQaqQZIsnTEemL794SCfHT6V9okIhwhNt19xe7GJJje0zhU+gDdT+cVK
         nSEIOvcA/pH0Iqs+EL0DQ7OkIYi9EWcCLavI4IE0DjTtofyZGGWZiJs+VSPIjMwLNfMn
         Azdiyo1n5rbBAcioXAiNHAzXOKdIEDcSnTm1eAfqrq+I4SMpFw+ZoAjsspKO1y8uT8nA
         lvsUH4DgPYML+dvUcXPq/UY/BxwPzZr3H/3EH8pTmMjYY5iOaK7OW9cJ24pA7fFsyykX
         70MossQBlZUqhIjXj0o3RKFq+UlyB0vhH9cVhq5jSKRlzb4JPWK4Tr+GzBez8uOYt8LD
         BKZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203607; x=1795808407; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=;
        b=a/kcW239Pj2ePZmq1YuGMKFdFM+6aJUP+ZEEBt68U91c4CPP3lyE/2UlJB0Rg3SMoE
         GCyDT7GusKUWYrReJCelcFTRz1bSwXD7OtO375ugho4xiQ4qkvscKdrO4UYaTKwvnfiV
         RO3pGKEX7uzEN9SywUqUyJHRqzBGuOuozwRzEdfUgw2e3WyPYTEHKyrKB0T44txwW8ux
         3Uae99wJYrCJpcne6T5xjcY5yMKR+qR8EMeb+xrF/i20+E4SvZ8QGJH4MbUa4f8iaDND
         IHDKInUSS7MCxVHmNedOlNLgCHa9lMjPbLQTwPFaWNNVn87n9+1pM9ayeKcEQ4Ye5qMt
         p9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203607; x=1795808407;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmW5wfZ21hF8GGaMVRawM0uRcl6HRdJUn3oKuV3HqOs=;
        b=W3oahybNjjpH/0FPQIiYGWO3Mm239sRliP7zd8l80vjnWt3zA/PUSSWxiqRElufv5m
         Vi6zWdHe+i3eTaSWTUEIXp2B0efNFGH7RHh0zNKPehbq4OrOhjjfJRiSUZHUuaSiyQx3
         Q7w5/SYX8vODiCIYKFhzlcIDVM4C5YgKVBqrFOAjLgChbRBukP+KLJ+ado4eLUHTRS9A
         gw+v2/y3MaiB7mcZ+w6H/ZU/5AmWYvPKNpTtUsqDeg6olkTPeDXk/Mpoi8WQ5Tq00z6X
         Om5D8jsM/fPCXidkjfQNkEx88tW/RBlEUopU9F6W671I0zE9y1pJfxtlk1ab8XbyycqX
         zQEw==
X-Forwarded-Encrypted: i=1; AL+hErF5dwJy5Rgu9v5+8EpTx0q5zSrGj0gLr9sVKXQ+9UgOEQSrReJFAkKsTY01i2U8dLl0seW+bqUqYKFbOkRl@vger.kernel.org
X-Gm-Message-State: APuU4Z+5oVoDdXlklgcJcufPxB/6JbO07in9zXwadqIJkLx+0Fhwv1lT
	Mws2V1zgYUTWfSL5a3FNj5UnS0Vukh2ToXK8v4f3YbRun7IXTuluIFD3Oy4jI3RNhQG4sYgDSmE
	535YddCLhSq0sYmtLCSlsdC5kqyivLC0pTnnDKlOT2BYwUpXvcXjGFdqx6iK6U2s2PG4EtZT3MZ
	R5Eanl38+Ym+SVBSQXSuuUTeKd2nkHkNGJ/xqqpNIhj40=
X-Gm-Gg: AYBFou1AZ33rXnB78xChUeeVVmV2/5k4stIhHnJ56wr3bZu1RBnI+JAf9A/dOwK4vS4
	VMATuyXgVscGLjxpQOJFcoRDMiu3HHcFqB3lTHt71ThQWIMsYOa0f3Io28T4am5GbPy/Adc9xuv
	Soiv4XRGrPqUdqtYJ6fn/KN8cCh3Ut/oiDj2w3sc9u6iDAaJqX5PE5gezK+1qPBdv8MvE6RuPh3
	SR92d9+OgJeIndifZ+aguTiBGKrv+kfzE3SFvF4RCCyukY55Qw82I6y0R/LZulxUvwmTQseIf86
X-Received: by 2002:ac8:5d8a:0:b0:535:a5fb:644f with SMTP id d75a77b69052e-55d76aa0553mr74159321cf.73.1795203607272;
        Fri, 20 Nov 2026 11:40:07 -0800 (PST)
X-Received: by 2002:ac8:5d8a:0:b0:535:a5fb:644f with SMTP id
 d75a77b69052e-55d76aa0553mr74158831cf.73.1795203606771; Fri, 20 Nov 2026
 11:40:06 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795196107.git.jesse.casco@gmail.com> <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
In-Reply-To: <9e5bee0dbc1c116672ba0020013ef0a346385c29.1795196107.git.jesse.casco@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:39:55 +0100
X-Gm-Features: AclHuK9H4NiVw0s83_MGvorjTXUReMbufB4EI0w2slEzgxUMX-65t974d7or_cc
Message-ID: <CAFEp6-3cQXygekbk0wG8AcxqkW8NgbqHq80SjvPF5XnWhXMRyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: qcom: camss: Map each CSID to the VFE it feeds
To: Jesse Casco <jesse.casco@gmail.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FJaOVOos c=1 sm=1 tr=0 ts=6b00a218 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8 a=U2zpuFalLylhPs5xVukA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OCBTYWx0ZWRfXwjV9/t/Ch2hX
 8BZ3blo2ktI35g5Q/4uCvfHuJVZvj7ztIybMLiGuG/IrMSjsLPlN90i1JODCrbMUzq7Iy/DSBui
 HHrvmns6QTf3AwpnlX5s7Afa0tBBcos=
X-Proofpoint-ORIG-GUID: 9RyUjiNdP4EaIBAMjzKUkbs8z2-1HA7h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OCBTYWx0ZWRfX+MV8cCh48q4i
 iiyxLW7qyJ6/lXUdUlRrLvUHJa/Kg4KEZUuMgKOS4x8RTi2pvU4amNBVUolsNEov4lFRbmge/6n
 9oqIWOjCt/o+rCjP+/zMUk3u5tFD+/gJOr3dbzQlPSZ/du5Mpz/HoaE5CQIY7T1lb7VOo6C81hS
 iZrsLnsESDD5YnuxPtjUO0QL8bNtsckWFFW00a55q0rmTxQqBodAPhSlmNyxmzmXqW9b720ho1o
 TD87M2MQ/DPBVyQecdzN83GvGCmYNa2DsL5TNuaCnuOTtlSrrFxxexb+RoNDM/QVqI9+11JcLMf
 rTJ53sZJsLw65wme5n9gnJOG+jV7NsQ3z+bkkwNVOfHm+HriVZwkET9m/zkmA6E28AcQx3raL3k
 DQuWmi6YK+kyHiRHg0AJKhaUAUGblxKKu1Za/0kPMP/F9ONlMN7fQiAXP4fMK9wQ34UR9LJhHSD
 tc5P8qiOMgPhZsvlW/A==
X-Proofpoint-GUID: 9RyUjiNdP4EaIBAMjzKUkbs8z2-1HA7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200078

Hi Jesse,

On Fri, Nov 20, 2026 at 6:40=E2=80=AFPM Jesse Casco <jesse.casco@gmail.com>=
 wrote:
>
> CAMSS assumes that CSID n feeds VFE n: csid_set_power() powers the VFE
> with the CSID's index through parent_dev_ops, camss_buf_done() is passed
> a CSID index and completes the buffer on the VFE of that index, and
> camss_reg_update() is passed a VFE index and updates the CSID of that
> index.
>
> That holds as long as a SoC has the same number of full CSIDs and full
> VFEs, with the lite blocks after them. X1E80100 has three full CSIDs but
> only two full VFEs:
>
>   CSID:  0, 1, 2, LITE0 (3), LITE1 (4)
>   VFE:   0, 1, LITE0 (2), LITE1 (3)
>
> so CSID2 powers VFE_LITE0, CSID_LITE0 powers VFE_LITE1, and CSID_LITE1
> fails to stream with "Failed to power up pipeline: -22" because there is
> no VFE 4.
>
> Look the VFE up instead: a full CSID feeds the full VFE with the same
> index, and the n-th lite CSID feeds the n-th lite VFE. CSID2 has no VFE.
> This gives the same mapping as before on every other SoC.

Can you also check there is no possible link in the media graph
between LITE and FULL CSID/VFE blocks,

>
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 46 ++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 7d9622097..8020b675c 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4629,11 +4629,39 @@ static int camss_read_version(struct camss *camss=
)
>         return 0;
>  }
>
> +/*
> + * Return the index of the VFE fed by CSID @csid_id, or -EINVAL if it fe=
eds
> + * none. A full CSID feeds the full VFE with the same index and the n-th=
 lite
> + * CSID feeds the n-th lite VFE. The two only differ when a SoC has more=
 full
> + * CSIDs than full VFEs, as X1E80100 does (three full CSIDs, two full VF=
Es).
> + */
> +static int camss_csid_to_vfe(struct camss *camss, int csid_id)
> +{
> +       const struct camss_resources *res =3D camss->res;
> +       int i, n =3D 0;
> +
> +       if (!res->csid_res[csid_id].csid.is_lite) {
> +               if (csid_id < res->vfe_num && !res->vfe_res[csid_id].vfe.=
is_lite)
> +                       return csid_id;
> +               return -EINVAL;
> +       }
> +
> +       for (i =3D 0; i < csid_id; i++)
> +               n +=3D res->csid_res[i].csid.is_lite;
> +
> +       for (i =3D 0; i < res->vfe_num; i++)
> +               if (res->vfe_res[i].vfe.is_lite && n-- =3D=3D 0)
> +                       return i;
> +
> +       return -EINVAL;
> +}
> +
>  static int vfe_parent_dev_ops_get(struct camss *camss, int id)
>  {
>         int ret =3D -EINVAL;
>
> -       if (id < camss->res->vfe_num) {
> +       id =3D camss_csid_to_vfe(camss, id);
> +       if (id >=3D 0 && id < camss->res->vfe_num) {
>                 struct vfe_device *vfe =3D &camss->vfe[id];
>
>                 ret =3D vfe_get(vfe);
> @@ -4644,7 +4672,8 @@ static int vfe_parent_dev_ops_get(struct camss *cam=
ss, int id)
>
>  static int vfe_parent_dev_ops_put(struct camss *camss, int id)
>  {
> -       if (id < camss->res->vfe_num) {
> +       id =3D camss_csid_to_vfe(camss, id);
> +       if (id >=3D 0 && id < camss->res->vfe_num) {
>                 struct vfe_device *vfe =3D &camss->vfe[id];
>
>                 vfe_put(vfe);
> @@ -5043,11 +5072,16 @@ static int camss_link_entities(struct camss *cams=
s)
>  void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool =
is_clear)
>  {
>         struct csid_device *csid;
> +       int i;
>
> -       if (hw_id < camss->res->csid_num) {
> -               csid =3D &camss->csid[hw_id];
> +       /* hw_id is a VFE index; update the CSID that feeds that VFE */
> +       for (i =3D 0; i < camss->res->csid_num; i++) {
> +               if (camss_csid_to_vfe(camss, i) !=3D hw_id)
> +                       continue;
>
> +               csid =3D &camss->csid[i];
>                 csid->res->hw_ops->reg_update(csid, port_id, is_clear);
> +               return;
>         }
>  }
>
> @@ -5055,7 +5089,9 @@ void camss_buf_done(struct camss *camss, int hw_id,=
 int port_id)
>  {
>         struct vfe_device *vfe;
>
> -       if (hw_id < camss->res->vfe_num) {
> +       /* hw_id is a CSID index; complete the buffer on the VFE it feeds=
 */
> +       hw_id =3D camss_csid_to_vfe(camss, hw_id);
> +       if (hw_id >=3D 0 && hw_id < camss->res->vfe_num) {
>                 vfe =3D &camss->vfe[hw_id];
>
>                 vfe->res->hw_ops->vfe_buf_done(vfe, port_id);
> --
> 2.56.1
>
