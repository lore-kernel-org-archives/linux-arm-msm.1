Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DC13B813C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789035482; cv=pass; b=JFOZkTl7xrPsIMK9mW2gAniGMtBfd7z7FGUKE9cGPtO0PNTC0a1S2wQDWLRoP+BsrN0V3YhIhOIEP28Thxt6zmWXDm0m7Qt+tH/ozZDzgqMF5qJac9guMxv8mQWqBgiGXSnYJSRz5vTkYhvUtcReH6aeAnNixMc12R+qddcbCeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789035482; c=relaxed/simple;
	bh=xJtlT+brubTDzcwB1LsQU2wH8jfhem1ycRIpQIZsMuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lf9fc/FBel3M1lNKrgAqGvVaIe1Cjy77J68oDtuVQrdKWWEtSTNd7gEbjiW6kbr1DyC1ZzU+Z8jtkhzj1wVXnlXD8g3wOCmAsnupvqzP2wNoYK3rO9+8M1Jb04Yd9fd/uW2WYdb735OhNl6U2+dUOfSNOBDrB2kP+nswzhdOKCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PGKqZv6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYG7PFlR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PGKqZv6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYG7PFlR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q7DC4136935
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 10:17:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=; b=PGKqZv6uqTxJsb4V
	yz/56PwDXoYI/+DTCIsMR3DS/Z1r3noojO+XzGn4dFF++mrEALLWcGYqgjyWe3WJ
	ZHYBaIZghgOs2KV0ThF9P+XHnCRbNDHS5d/9EFsz6fhbSRUpiEfy/fBUN9IdRTOA
	TW0teNVSH7BgXWyi7J4XQvW/RwS0u1vLSONrNTUqUcRTkuyenE4y8wVAhp7D12bc
	YYaBUeeCvKRDcdXwi9yU0Sf8UBVOV/8PTrIKBN9qSXquo7+Dyvmf6QsOlNPpf2Yq
	nah7yoUwbbBLZawcshuQMNKa5GbnhltI41cGg8CkvKkDjBxyHIp1j6SDVwjDSzKP
	JBStIg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcydua29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 10:17:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so11222909a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 03:17:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789035478; cv=none;
        d=google.com; s=arc-20260327;
        b=e/25jVj8rSz3ow28S1V269pOqn4UGVDePj7Y2eRDsN9ci7IGI0vLCnbeKvSzp2oOjg
         FDM99mwWIJUfXXG7zTexn43Si7Rr07xhy8k+pzX8l3I62jaXI6N718oHFBNsY5gzIns6
         FkUORjteVh462PNbNh3aoWycVph1jJZ7gfkd5hKZUFQudzq2pJJv7iNk3j7/xXkUIQqm
         U4B1Mhfrgv6I96VIesCiVdQBDFY9uIKo9zd6eqv2kMzgmy1PcA53BucpwD3KcgdlaFUI
         jeCOH30cO4XOtzsr0nf4oO5xvgwhzhiHLRH5Qqnf+IRYdcKGNbKjLfeTtUDpoJJOzUCR
         L3vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=;
        fh=L0iXYDJdI9HfkRA6GAl/F7mqAVN/8anj83Ru032mxkg=;
        b=ZVEsD8CtgEt8K3o8VKn9jvsfABStFXPJauzY+y40SVf9yc1mptMbUOOcHj84o0XlyV
         dLfSqIhatqKaLu9P2u2C8P9J2EzkA5RchkA37rIcut43KiyxZIP2qk4Lagjs4AhXQkjJ
         qHA6gMmvQS4Pf8PCHHLBcteCEEyjPQm13gRFEczni+TNda7zNwcBLgQS+pWbMAnqt0Ar
         NpjCsF8r7zQIrjaH8OgHY9GvIahrfy5meBy+RC7F7e2IBycM4AjJZER1YQG3bi7WZ8oD
         74oe5s5ZXXiwnOjPQN5Axs7QwjKzXl+DGNTXU14uz44YK58bRQdlqaoPT4P900QvSuYj
         dCiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789035478; x=1789640278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=;
        b=YYG7PFlRv/m7RtW/2T+N2DJNrZXsXtWKhFJOa1UdQ68pEJDuw2oDtyLTbu+wQWJqvJ
         ++i1ue1XoDSxWUvDyBIiYzS/frVNffrU9P9onZSrRwyVo6A3rY3Urmmj5kvDmf/X8W6i
         ektBJtxE8Zl+w6+R9Xsixdh5tvaKkvwfpmLOiEQHgVvxBsQnb/4j+iaQtMAQeP21m+HQ
         dZOmFs+ZhrWX0Rep3xscs+Worxc536G8Qt4fkbY/VeIxwx/6MmOr1WFKjnVDiHZnaj+P
         ibWw/LjhdjXtk1z5Uq5qcaG+NMejXFHerT5KsK26vYHQ8H1gRZZ7f7tnR4YQw6y4QfJ9
         N9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789035478; x=1789640278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5o0LQq2H5NyuqhWcIAsOhclTasLhXE6zFp16BztH0tM=;
        b=URPAbzZqQlwMH8UvvPY+UYcsw2EW6qO6BLa8Xm9nILG+opqrP67UFaedRUPFFGrHDO
         Ow71Ri7Ao1304+qggCSpHIIoBd5tihB2Kskgd4bwr2vCCx0oMRBcgUncU8FblT9ppaJf
         YkB9P5qDsdo7wIo3khoxl3yBUosFlyZ5kr1tauHQzLd6JlJ5XMHJAZt7r8AmvELAudxg
         5VVCUKiZrzGF2guczt/EShq2Bh85XkIUgukTvVj0xO8hQDtjNp/e0Ldm4N+8z1wHZAVw
         oo38IQgnLzAYLVEs1loBmPTNbztpI2/7BxGQ01enbq2YCMbktbSLKuupMe9BEJfqSS04
         4wBA==
X-Forwarded-Encrypted: i=1; AKwUvBzpQgctgRi8gKQ7b0I8TI0GbkI0P/MD0x1TSh210h4eq5DvJJn80crPS4Knw7JlS3sNngz7zy/7CJZ53rf4@vger.kernel.org
X-Gm-Message-State: AFuF++lD7lxWlibgizA0xjj8pge7RmAWMqONoKGEix8Sqt1c1hsgMAUG
	oqg3Lxy7WmgbZNMZ/XW1yY7rnFAJOBKE4spJzR7e0MEs9bVLBH06krjo/fCmAEi+++1fchljBYW
	wqvSRUY/6OhZr1vaAYkUMYkozjLlr0pZyulqEOcs/EQoCCCGCaTIMQc/5TByxnHZsFi2oE4LHIU
	/+fJQunevw3KZU4p8PegS5egYP8Sg1SzYg4cicKGT3/x0=
X-Gm-Gg: AYBFou3/maXQpPwm7UaRHNeLe/EYKwOI9tJTz00cf9jYbpsTFLlfuv+5r5m8KMhgjJq
	UUzqPMqvVhKNHtQFuKAIKFpeIudnHTEHzQfqJn3Hu68Qa2MTTi13TbubTd6KelOjCSPJMZX9a9u
	kphFwfZh+J3n2J48Gnb4wj9s63qEQDhLms1KkoDmdnoGBme8y8OoIfXOtqNg==
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39d70ae1a5emr10579636a91.13.1789035478532;
        Thu, 10 Sep 2026 03:17:58 -0700 (PDT)
X-Received: by 2002:a17:90b:558c:b0:38e:57a3:f218 with SMTP id
 98e67ed59e1d1-39d70ae1a5emr10579584a91.13.1789035478102; Thu, 10 Sep 2026
 03:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
 <20260824-enable-ice-clock-scaling-v12-3-09271f583dc6@oss.qualcomm.com>
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-3-09271f583dc6@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 12:17:46 +0200
X-Gm-Features: AcwNN1VvsxYSlSneh1UTJxLDFcgkCYVDC7Rwi96BfcNazOVn_vX8zy2Sk9dMolo
Message-ID: <CAPx+jO_Ltc6Q+VdUgOs81azTiM5Vx12GH1z+CXt6NW=M601THQ@mail.gmail.com>
Subject: Re: [PATCH v12 3/6] mmc: sdhci-msm: Set ICE clk to TURBO at sdhci ICE init
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=IfsSymqa c=1 sm=1 tr=0 ts=6aa283d7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=i-sMpDq2_rzAXM5hadQA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: CmGvdH0nHhhKECIRzUZhoa1wIWZHJdio
X-Proofpoint-ORIG-GUID: CmGvdH0nHhhKECIRzUZhoa1wIWZHJdio
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDExOSBTYWx0ZWRfX2FJxDnF+lhj+
 HjU7YCTq/pP4X9A9mdDIhq7xV9xTR7jcwCX4JYv7LPwRje2eSqJ8sDDBZEodDqafPkLS3IQQjMm
 D3sghX0OXkT36IbhSLJOwWCsB2A2Ayg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDExOSBTYWx0ZWRfX5qUaPToKXjmt
 2iMhgYB7f/tqsu5LFUzDH+59lCRHxLyLMB80+rllBNJufIiFcvQ5MlysB1/g+hJD614N2vzmyJj
 NXloLLw0K4WBIhR8cFFdKGDf/v16uqYir8pFUEu6RxTR+8OzHtKrICuTJrBRvpGJTnVHOYcC3zm
 lkYCDqpry/RyjCgWfxAM/1hhRH48SI1etFqWgVhRC6zWo4FA+pHPYgmUVRhw741emtGoNCYshcc
 edaSEOLe1B9hwlagU1BEQM1qsrur6mg577wtS8BT9n3i1IdoonUclHllY5SbdQDNRguwSXK2bE5
 aWx3S9EUI9eV81jci3Ii+0csQNqEZRscHvWSZjzWcl8X31pD/aw5S4DUsAei/avReEUG1TVreaX
 +xzhATdX0kON7J6Xu/CFvwLHBUO9DSL81hzG2eukbbW48sYc/pkfh2ghUO2kDwZ9VtAmOSW6WZQ
 4i5HHwAZGFJaPy+zRdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100119

On Sun, Aug 23, 2026 at 9:48=E2=80=AFPM Abhinaba Rakshit
<abhinaba.rakshit@oss.qualcomm.com> wrote:
>
> MMC controller lacks a clock scaling mechanism, unlike the UFS
> controller. By default, the MMC controller is set to TURBO mode
> during probe, but the ICE clock remains at XO frequency,
> leading to read/write performance degradation on eMMC.
>
> To address this, set the ICE clock to TURBO during sdhci_msm_ice_init
> to align it with the controller clock. This ensures consistent
> performance and avoids mismatches between the controller
> and ICE clock frequencies.
>
> For platforms where ICE is represented as a separate device,
> use the OPP framework to vote for TURBO mode, maintaining
> proper voltage and power domain constraints.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

This looks good to me!

Although I have a question - should we never drop the vote? Like at
suspend and runtime suspend, at least?

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-msm.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 0882ce74e0c9bdddd98341a67b97bcef74078e0c..1b4c276dce34d76dcbe75117d=
e37e09ea2002633 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1902,6 +1902,16 @@ static void sdhci_msm_set_clock(struct sdhci_host =
*host, unsigned int clock)
>
>  static const struct blk_crypto_ll_ops sdhci_msm_crypto_ops; /* forward d=
ecl */
>
> +static int sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host,
> +                                  unsigned long target_freq,
> +                                  bool round_ceil)
> +{
> +       if (msm_host->mmc->caps2 & MMC_CAP2_CRYPTO)
> +               return qcom_ice_scale_clk(msm_host->ice, target_freq, rou=
nd_ceil);
> +
> +       return 0;
> +}
> +
>  static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>                               struct cqhci_host *cq_host)
>  {
> @@ -1959,6 +1969,11 @@ static int sdhci_msm_ice_init(struct sdhci_msm_hos=
t *msm_host,
>         }
>
>         mmc->caps2 |=3D MMC_CAP2_CRYPTO;
> +
> +       err =3D sdhci_msm_ice_scale_clk(msm_host, ULONG_MAX, false);
> +       if (err && err !=3D -EOPNOTSUPP)
> +               dev_warn(dev, "Unable to boost ICE clock to TURBO\n");
> +
>         return 0;
>  }
>
> @@ -2149,6 +2164,13 @@ sdhci_msm_ice_suspend(struct sdhci_msm_host *msm_h=
ost)
>  {
>         return 0;
>  }
> +
> +static inline int
> +sdhci_msm_ice_scale_clk(struct sdhci_msm_host *msm_host, unsigned long t=
arget_freq,
> +                       bool round_ceil)
> +{
> +       return 0;
> +}
>  #endif /* !CONFIG_MMC_CRYPTO */
>
>  /***********************************************************************=
******\
>
> --
> 2.34.1
>
