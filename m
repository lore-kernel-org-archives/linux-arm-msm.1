Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F633ACA7E
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788273108; cv=pass; b=hfK6bYoVWiisGCLwf4CBENSFvb3wzta3zHe2AKnGjI7fbngGwstDJGPxWydlhYJHCc4iPrIR1D8CKjKePZQiteTCkHvnZagePEvcucOHIyG/3eI3YDT8QhHpnvnCUrQ9BkruJ2MXxn3ywIRdfSClN8NTTylXVXQqNbjh37UxJdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788273108; c=relaxed/simple;
	bh=CL+Fm//7PJAuTWNWRctOu0wP9tKrbcMfws3PNuylb8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfc3bzTneFTaauyWQOyNMIj1gfAmDkowUoqJt2wmFHSdkrZgmb42jOWnMBN761QmZHBShM4bSX19kf8oiVwvr36ppAVrFaZyYBgMBb8IlMGx9OE+CqozceXDGCe+ueoSRuT5f+O3pdJRZKlvdKL+ScDlcBruwvszm9971CgdNEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TWKV/Sbg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHUJpS+J; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TWKV/Sbg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHUJpS+J"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9qDs2219209
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 14:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=; b=TWKV/SbgV9p0gmBq
	Ix/czCMtVc6C+fPEUJMX/wN5rmWOaY2sWrV8k3FCPsPVdBHPZds82x79UGxpCqCp
	/pVpjTMlX8ruOOfAB4pzE0il1Minieoe88KD9Sw4VJi1bgOh+zoS/6IfzDz5g8KM
	J4padN2WR4QivG/XXxD+bL//mbXyEPOzB4v81QzF5er6+cvoinwDYAqvjPEBlKjb
	fjX5HcnJIoAASFUUS/1g6Hq2e6QJhqKeo3LNE8Ut9OkR3ueWUadOU0OQD4ljSMCK
	j2mGoFWfUxYrnESW4/FvIxt6z6yf87rCmLVgMvOg92INvotvppxD5od8KkAFNDZv
	mmzjXw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxb2da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 14:31:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1123779b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 07:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273104; cv=none;
        d=google.com; s=arc-20260327;
        b=oJtghMy71SRMF3XWOVI7goNfftuGtfj5Ft7oAxIqjjXZrScKE//eThZgPh9XscY0x6
         TgW6DsytAXPChzhWbU/5m1ra064OIg4WEZj2ziUtaFMMbSczPegZ1v4W2i16aKFdet7J
         /ZY0GjlIb9k1Y9ZmY5D/lkGpSAciEZG65VTcBsSLuBTWFdGGQ1nf1VfN6+5X1044J3pC
         k56LHsxf/ZtLopo2oIJGB17q+/k0S5jM6KBV5ZdKhrim//m9v+MOguxOrN2lY/p9QVpR
         WXX9A3Sqx3JadhRrqOYzfA3ni/39N4ELhrhRFUU3o+xwvSNg+yW0wfxzKsnDBn4VWzWN
         LVwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        fh=Qqt28mhp7LifqFfKxYeXIOEwrbpyqML7jKSlJ84amiI=;
        b=XmXBPU5jq8K9MlRPxyFf9C/QPAGth1ldc6v6kMzUT+oE1yDc2gmbfOrQGwGU+6qOUY
         mjxhXOd3TNgo0VzxkW81yq8KuEQ17KOHkdVDSSnaGb6DcML+hDNl1++wFWCeu1yivkO3
         VQkNbqzhQqNeC7919yqTTa7o5fbFd1bflY57uChRyYhNvvH1c0F8dd5PcVQrek0MMQXp
         aRovsL/f4j8w6qIWZwVifJcs4IA3LazuBdIoRXabWlqnotxUMgWMiZB0OET/FXDmhQc6
         lQfmw8vxz+/yMc4uRdsjJAmsBMkA4RSzs8RFYL8jmmcXf++L+EloJb2tNUjmzfn8RouH
         3o+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788273104; x=1788877904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        b=MHUJpS+JNG++WoSWrEusvWGQMqlLb+1WmCAkp+miG6kasuPoeE49mS8n7EzTVE2WUl
         s95CVfOFKfNjrElcCawac1ADbMDyc8E32+S0feYuZoYFvsar7b1F4KT8ixYVsoGrEzSh
         6VHSl0jYgm+3WW8E9FjvQFb2czYam8VpCI3nQLMCkz5xAqEgDHkFpfuIQph89MTzBSC5
         E/cfUPjZuZkHiZUfZdXQrFo9OD56US+ILdg8evX8Enajd9ij5XyZLZM/Bs91xmFiG62B
         UJANEaiKgCk3ahQGG3i6rxwj5D+ewO0pdoTwlIGI+54ea5lCe/vO+BTCaZeyBW+Lo2Do
         FSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273104; x=1788877904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        b=pdHW94ZUYfr+C7Tzhxwl2zhqfv64rPIUbaDnq79pBy9SggXUS97OuqffW7jy2hNkQx
         84pQMrxAo6qXBTh/KeyfXcZn6ad7D6TThN0nOhNpiK+w4lb3LB6TJtN2RaHGgfpDciXa
         d8p38vUy+8iHgP7GbD//DDqpG+ScO4+YoSwR3nllAbyhr7PSJvgMztxUIPb9kvTcVbx+
         lI5GpX/RhqZMgS3KBrvyIJgAyzMvAaUlKILehJ+kV4MDfbo8JhItlY7vJjGG4AervZzC
         NiLRs+cQWrulSfwznxGIvlPramVooZF2RaqAQimwf1/GxhAPFcBv2VsPCpYL9B2SirCD
         dM2g==
X-Forwarded-Encrypted: i=1; AHgh+RrtMXHJnSqxo+YxdxuxAXinK4RSv/x9apB3VlvNyNsIboxKRUmrcZb9UKl9fyFN67ouoooVk+ZDN3oHzt6W@vger.kernel.org
X-Gm-Message-State: AFuF++nO/H4pKe5W8n/6zhjAyiRn2ZeVksdmEXQzodwLDShpDkM4ujyK
	H+wzKYktgpEdue/z8rXdsMmPdkFnrFhpHPfFM5I1uY/dpzBrSJhMTEKQppTLEN2Lbjp9+hXyXX4
	U4kqxfZW+Ac0Kt4gOUnob7BEUZYIdnNRBcU+u9OizVjxuLXfw6ENOr301EvR0AZlrRfp4pZBS5C
	pbghxoVVafvfi97eVH3AGh64g5PyuSNTl448jGm3NkEfM=
X-Gm-Gg: AR+sD11CwRfYe4WW941GFWT2TB0xKdMjRVfbOaOZXlVpGSGcr7SwQBh6orB1IdPk9m6
	qaK6FgfVU/WcIFxgR6r5X99A/Q0G6CXJpvKUbJ1ilCU1maqcawwHt9h3U5e/fdQbT1gsb0zmESj
	Z42jZLPAIRwMd2AoV9fOWylfbru4dOgSZoRhBmuTDo0XtjJ7ti5xpUhMY1ow==
X-Received: by 2002:a05:6a00:420f:b0:854:b3d3:8631 with SMTP id d2e1a72fcca58-85bcacec88dmr5179006b3a.12.1788273104262;
        Tue, 01 Sep 2026 07:31:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:420f:b0:854:b3d3:8631 with SMTP id
 d2e1a72fcca58-85bcacec88dmr5178917b3a.12.1788273103642; Tue, 01 Sep 2026
 07:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-1-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-1-091697dbeb02@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:31:32 +0200
X-Gm-Features: AcwNN1WwQtMTDpu5tktdI1Fc85e8Ltr3tWd5G78kHHK2UXE66ekj0IR3sGBbeCc
Message-ID: <CAPx+jO8HQj4PtBScf-w+nQz-9xe+7QxZLMtp=J=sFSwEHVLL_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: iudSEhf7NEKdGlmtqK-zwvQ8Ro4zK8dj
X-Proofpoint-ORIG-GUID: iudSEhf7NEKdGlmtqK-zwvQ8Ro4zK8dj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyOSBTYWx0ZWRfX7LyMHwssQiXz
 3KPnx4v0S08zYXsaaGMxbd11h0KHQcDSjMuvIIfn3nyukACZRsjCJSNNYg3XIzgXh4C67j3Zf6O
 0j9Im8GE6TV/prIleCvKEKy/qQDfxeM=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96e1d1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=iiyz0f3IVUh47B4zfGIA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyOSBTYWx0ZWRfXx2X0754gEDac
 sTYEVdKIcAluNocHfqJGK4pw13nBBimJKcN3DlVtpDVDjPtlyRXi6i4I9cEVVj2/Q478ww/m68P
 xoYCG5nd3VmXdeNCUfj9WOT23P9CGJcHyXFR921vC02etHeBTeB+bPKMrqRAoIAc2qcUymx3DvE
 LPs9VMrcnl1ANPD69Op4RR0nSml1XoCWy2Gm/oJ8404LouNRWaoQu9K7AdFU/WcmFeqCDezbOJ1
 mOdE6wGsJOBwVwPHkSqWDImhyMPFtFPxUM4c/pEUqAwfj/cDm9IyPls/XydH1daZT7WyYsHEHPC
 7rlzknmP1BEm771p+h7qYFrrg8mVYSdUvIrhLHyCnY2S6+mSO5SyU8L3LmBmGokJYuFWV9PI16y
 gTjT303NJyqORLBub3/nzHWFTdek563x+TxI52N8GEXuVZay3e52ZFLpdx+VmrP/1WCKXrjNFUT
 IvEJq/jc8aHiUghPc4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010129

On Thu, Aug 27, 2026 at 7:59=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.
>
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
>
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

This is already in v7.2. Please rebase your series.

Kind regards
Uffe

> ---
>  drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/a=
rm/scmi_perf_domain.c
> index 3693423459c9..e390f902a444 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd,=
 unsigned int state)
>                 return 0;
>
>         if (!state)
> -               return -EINVAL;
> +               return 0;
>
>         ret =3D pd->perf_ops->level_set(pd->ph, pd->domain_id, state, fal=
se);
>         if (ret)
>
> --
> 2.34.1
>
