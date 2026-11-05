Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793888480;
	b=m3M4Vj/qiiPXUiMgG7et69WMyGi8zII9gUPtm80irkkIGMICMUwBOkJ24goff0t7UAyF
	 sah1PUyMeLkN7I0jWy928FMIPCbsO1YbXkQwvkj5WnzDcTPVrEM23neH8j8a6NIyHX4+E
	 Q/rlBF+dECajI8yIbe63DQVc69od6++sUMqNd/zIIEJQo1dobQNQDmuPeml9sm6cK37xs
	 Li+ryeBdC1U8fPH1O7vBi11Y7gD3XI2497/siDZkmMzI6w8/EoRL5F7+sNPruTiUQJpnP
	 EkAY+9fI55S+9WOpwmi+LsVzcbR2SRWjo1NL6Gmsip9ZAKISgMiF7pT2tRh55R6hTJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793888480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
	b=d+HwooheFTEYT1pyZdZmLQdUA/DKAtmhEYjkVQhaT/8V7tISvWNBP7sb5wsrxVtBaaJI
	 HbjFXUzLZL/2vF/e+wdAfIYk5RSKvCALu95pLHWZ02dZL2hf4MFSCLZQNPv2/BljuFMEW
	 Gwo9wFCkt3tQ69/LaxDETF92HSbk6J/nyK+mJte4v5zGqMGdiDWRFfIIc/L+bRozrw94W
	 xdQm07FIQWTzT6ZCpS9QHcpjq/Z5suoqMR+uEV5Pv61CnRkElIRFMJAIAVv//8oUGQiQE
	 Q/cfdUffIS8Qa+rDGPxhGc9VQD0U635nSC/Ve5pAEuMFZJrc9OnJvapvc1Ng4Z3wxxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z2e/SkPu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcM7wiul;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF418606A33E
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 14:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF418606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2e/SkPu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcM7wiul
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3YhY3194146
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 14:21:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=; b=Z2e/SkPu7L2GS05A
	KEF0QoXLTF+tskem44qdFmcQ4m8hGZkbW8eEEabv+0D7LqbedqdXz3z8sBZUJyUh
	l0lO+fl9YewoW+UTadB2HXu0ccd+1uksr7cmPbQzkGSxPh03Cc0x3XAIlsYV3I5+
	Z1rnYjGeJ+O7KubJcNEYQo1TpQhOv+dXdaXi9uxR2lrXfZJxZKw2nt49lvwzJ7XF
	95U43Ak5fWDo385xXMLNTGpKUhJHcBvaZBvDjpc1nuU0Hn1Zb/TbEMldk2uSWI06
	tedjRzvDTuv2rAxCjaSCn2HAWbq+qXD15Djbq6x4ae07C9y0N7mlEv4jcXVAhbUF
	1+/RNw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdrucf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 14:21:19 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ea2c058e67so2458016b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 06:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793888478; cv=none;
        d=google.com; s=arc-20260327;
        b=e2A2H2lgcjA3ekNe79aVYrmDsakWGpniSsr0+vZf7wBV6oFXvwx/jCAQGdHGkZ69Ht
         EzX/72FX3v7D3/EkjVKLnTkvtynszkx8KpIV/+3liqztqxqpH/CRir0BZ5jAQlW7HdUP
         qCwNjTejGKMEz3uta/ovEx0wUY5OuT4dv7dNOgtQuFAXdK3EAaWH0g1NOdxjpDtAqG5K
         5x0JxqyqkmbPLXXQcUNrLcAPnpMhneZ5N6GJSv7pdJrwriitl5LucNZsT8rDuSOV/mrr
         SJQtKm5SiPA6hkdfFhhAxk3RZh6vbc/U8Tg0S5LyUrfhWLyir+jvBLv8Wnw9+j5JNcDE
         yUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
        fh=XhK6W3U82qUo7pyXzyXv+/UjbmrjuNjgK9h10yWqwuc=;
        b=DJ3KuJQAezWKQmkfGEgMSiIoVtVndtDtsTwmjob16kLHsDTZQOaqCqFnY/1Ir86wty
         SarrUUMyPdF/3SrLJS4maSkP0NbjzbT1h/voPhrOaZKUzuDuSIZECOY/SLaIPop5gSSV
         QDjWgpkxckya9kMBupmvV8oL49scDgfuxRrfYgugef88q1nd1TpmJOARAmKmoJOOEPi/
         RAPPKoNRjIlVjy3HWp/9BV8vhh8tDDTG4vozoxfQPGI4m354HYK63aa2sZMdtrMVq2J1
         7BJRkiq1N6zyvrc/0j636Hpfq0uGg1rAZccfPWf565f4nyPcLqKpqxSPeelanK9oKMJX
         4u2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793888478; x=1794493278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
        b=BcM7wiulN2onL9Stej9lG3ShSmTXjIwEr4GbzZqK+vYk7ePAcOxfGc4tcXXz+EaW2S
         E0aduvygQ7VJ3apN7cyNCiMF9Ui+DSOqd72mrSXF420SSoVw7bem715gtN3uvwM+EZ9S
         0DzskTdefL5B+nrY0DrwLmYtWbqzVaK5IGkXswPhgGQ8OWMG0Xp5rHuLfrwvbNrw0Ic9
         zwwcbS94iSYB6Sis4lJxarOELI8mD6pLqQJskh/hJIh58tmG9K8qgH5zhTO+BD6vMioB
         Ei/D0RdPAE7YlRiO/4n92tFLdnTz9zlHLgqmzRB5Q1lwwN6R0nFmMUAkfVkVj1000iMT
         GZ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793888478; x=1794493278;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tl99t14ijDAMsHd9YgT56P7aQig4N3vNDi//2gyq4XE=;
        b=vwa6xfn1hgGNvw+TMOSCkWnfmAWibcEjFWywp5m00cl+MapSL3KHSFFsG9yYHxMHMb
         MwAM4QecXfNG0u5CFbeEWWROUDPX5L4DJg2uILpdWoOzpMphK4cnwxbmhplBN6yZwy+c
         wtSnpm5PgrYjwUe7+RZ6Tlb219sg7yiu1YhYSKfdjFCZ4AziLGw1cdG5S/yrlaCQKNSB
         CfRgWeKjsLO5G9skcGYTfU9ZCQLipGfNvMjFN+qib0RfEbGvzVCZ74egNzVoYBge9cBq
         JxKbM5v8sXHVNv+htqZMVR8GRE4tumMT3M5Q4vtRakj0lG1sHCAq53AbxPjzn8toJs9Z
         penw==
X-Forwarded-Encrypted: i=1; AKwUvBwzx2XfZSZSZtKF52TVjTcWii+mQb6Nh9AXSPy5k1S4qp/0XwGXgtHt75T+UNOANHbrRVtpVFU/gkqfM/pR@vger.kernel.org
X-Gm-Message-State: APuU4Z8vlMrRhfi2EblLPvt+aX1TJ+zvCwPnArt8YnBB8DSuPMciKwro
	S5mk79g//yHa0Qa1KuajQPyWCsmoxvMTR+Db10qAQ12KdSWm+yVAoUxxV1KRaNowmPWQmSW4v0n
	nypZtcYBZBDpPtkdIM1EgKW5JfVG4PphhgIkU3rqhmU7ILtp6lmXX+I8cqzTOJmWL4EBM+QONdJ
	hU77h73T14tZWxZDlUTzJmQ9ipE1UYgK/my/vr5ORXHzQ=
X-Gm-Gg: AYBFou2LsADxcOaW1JBiAKPn/hhG05KzcjMToVkk1QmWPPaPUYiSJ2MKDTvTI7LcrNk
	o4wHPxkO2acNU88LH55eKmnojgzaPovAWi8Y/sukpRF/+UFj5u+1jjUKHTsVJ6bHHcwkfIFIJrW
	4fO3Ndz4ufq3EacGJBJOiBw0rIHali8SVLKBqh8cy3O4cSopLMLbGloTg41LyInwejr+enpE8kR
	nBWGI2VHL31OSAeqvdGOkZce/V5TE2srUVAk98DNobC8HFmTljBa3+o75b1NSb9Fbtoj+SRLEk=
X-Received: by 2002:a05:6808:3195:b0:531:3bcd:41a with SMTP id 5614622812f47-5640de0fcb5mr14781271b6e.59.1793888478243;
        Thu, 05 Nov 2026 06:21:18 -0800 (PST)
X-Received: by 2002:a05:6808:3195:b0:531:3bcd:41a with SMTP id
 5614622812f47-5640de0fcb5mr14781235b6e.59.1793888477697; Thu, 05 Nov 2026
 06:21:17 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-qcom-bam-dmux-vmid-ext-v5-0-5c7903385b4b@oss.qualcomm.com>
 <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
In-Reply-To: <20261105-qcom-bam-dmux-vmid-ext-v5-2-5c7903385b4b@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 15:21:05 +0100
X-Gm-Features: AclHuK9os0BZqz_kwvxPBwRIVDtXjvDQwiPkF7CAbQf8APB_kH8Yh96-royZqOI
Message-ID: <CAFEp6-3rt8yvTd-mMA6y5SqmzmF0zvrvO_Dc_w7G3QSv7oZWng@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec90df cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=0Mq51QQeXCmcnqE6Af0A:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: DNML3N91Nsl1puivK3MQjJCLBNuE7hGi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NyBTYWx0ZWRfX4ZhgsUSdVf2Y
 YqtqSSURoTkkHYPNaJsko72twlQmcLBcqJVu26OM5kJ/n4+QRCag4ZIa1/Qg+onHqR+9FJKiqtF
 0rKGx90X7fOBblcFV8U4vyR36H23VVc=
X-Proofpoint-GUID: DNML3N91Nsl1puivK3MQjJCLBNuE7hGi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NyBTYWx0ZWRfXylKE4s+1vsbj
 M8+avigASpOBNo80TGFL2VKbaeT0s9NmYVHj8H0x2xti/fvnuQaBO5orA3RnAwtaX11DQE0ETjQ
 Fp4KmXUtqKRFG1IUGStBwS7D0buiH+SSnq2IvDy3ymtjINL1QBCKaEC5abyTqdTXPNO1nShC1EP
 NPHckUdhonBxbYMLum1nrLKt70cUBFc2VqbHntGxA9ntRt8d1Jff02jqhx0S0USMc0qHFBXrqSz
 ltfnLzjvOGRiLh7uJge/OLbp2TIwxlVFdLC02ryVK5nnHPWOEO3BQ/aOaizK9bh8Nqf7Awb7W8o
 w7qQfOMN0kJOZCi+NjBKs0lpIdzAxUWMqlQbPlwZYecQe5wqRv4k+eFpoYJTjLmaLgUOBlaU3ta
 pEhyFpdb41lH5Zb86ByJSM0U6rZdTOFD/MR27xSZnBV+TotI3X+1OoAS1Oc7aKtDmjrjjYhbtwz
 61dBag+M3Asoce7GgkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050057

On Thu, Nov 5, 2026 at 11:42=E2=80=AFAM Vishnu Santhosh
<vishnu.santhosh@oss.qualcomm.com> wrote:
>
> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> domain with restricted access to system memory. BAM-DMUX DMA mappings
> and BAM descriptor FIFOs must therefore be constrained to a designated
> memory region that can be shared with the modem. Accesses outside that
> region can trigger an XPU violation.
>
> When qcom,vmid is present, require a restricted DMA pool and assign the
> entire pool to both the local and remote execution environments before
> requesting the DMA channels.
>
> This ensures that BAM-DMUX mappings are within the assigned region. When
> the BAM DMA controller references the same pool, its descriptor FIFOs
> are covered by the assignment as well.
>
> Track the assigned execution environments explicitly and reclaim the
> pool for the local environment after DMA channels and mappings are
> released during remove or probe error cleanup. Skip the reclaim and
> leave the pool assigned if the remote side still holds its power vote,
> since it may still access the pool.
>
> Fail probing when restricted DMA pool support is unavailable, when the
> VMID property is malformed, when memory-region is missing, or when the
> restricted DMA pool is not attached to the device.
>
> Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  drivers/net/wwan/Kconfig         |   1 +
>  drivers/net/wwan/qcom_bam_dmux.c | 108 +++++++++++++++++++++++++++++++++=
+++++-
>  2 files changed, 107 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wwan/Kconfig b/drivers/net/wwan/Kconfig
> index 958dbc7347fa84ee869439bf8b503037faab8bef..1b133c5623161526969814018=
7ca3141dfe48dbf 100644
> --- a/drivers/net/wwan/Kconfig
> +++ b/drivers/net/wwan/Kconfig
> @@ -65,6 +65,7 @@ config MHI_WWAN_MBIM
>  config QCOM_BAM_DMUX
>         tristate "Qualcomm BAM-DMUX WWAN network driver"
>         depends on (DMA_ENGINE && PM && QCOM_SMEM_STATE) || COMPILE_TEST
> +       select QCOM_SCM
>         help
>           The BAM Data Multiplexer provides access to the network data ch=
annels
>           of modems integrated into many older Qualcomm SoCs, e.g. Qualco=
mm
> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam=
_dmux.c
> index cc6ace8d64371eb8d00c638a39b234ee540b83c9..0e7ad62f8b4e059264e89837f=
296ee13c0c31c9b 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -9,14 +9,17 @@
>  #include <linux/completion.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/if_arp.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/netdevice.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/qcom/smem_state.h>
>  #include <linux/spinlock.h>
> +#include <linux/swiotlb.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  #include <net/pkt_sched.h>
> @@ -75,6 +78,9 @@ struct bam_dmux {
>         struct completion pc_ack_completion;
>
>         struct dma_chan *rx, *tx;
> +       phys_addr_t dma_pool_base;
> +       size_t dma_pool_size;
> +       u64 dma_pool_perms;
>         struct bam_dmux_skb_dma rx_skbs[BAM_DMUX_NUM_SKB];
>         struct bam_dmux_skb_dma tx_skbs[BAM_DMUX_NUM_SKB];
>         spinlock_t tx_lock; /* Protect tx_skbs, tx_next_skb */
> @@ -762,6 +768,90 @@ static int __maybe_unused bam_dmux_runtime_resume(st=
ruct device *dev)
>         return 0;
>  }
>
> +static int bam_dmux_assign_dma_pool(struct bam_dmux *dmux)
> +{
> +       struct device *dev =3D dmux->dev;
> +       struct device_node *rmem_np;
> +       struct reserved_mem *rmem;
> +       struct qcom_scm_vmperm dst[2];
> +       u64 src =3D BIT_ULL(QCOM_SCM_VMID_HLOS);
> +       u32 vmid;
> +       int ret;
> +
> +       if (!of_property_present(dev->of_node, "qcom,vmid"))
> +               return 0;
> +
> +       ret =3D of_property_read_u32(dev->of_node, "qcom,vmid", &vmid);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to read qcom,vmid\=
n");
> +       if (vmid =3D=3D QCOM_SCM_VMID_HLOS || vmid >=3D BITS_PER_TYPE(u64=
))
> +               return dev_err_probe(dev, -EINVAL, "Invalid qcom,vmid %u\=
n", vmid);
> +
> +       if (!IS_ENABLED(CONFIG_DMA_RESTRICTED_POOL))
> +               return dev_err_probe(dev, -EOPNOTSUPP,
> +                                    "qcom,vmid requires DMA_RESTRICTED_P=
OOL\n");
> +
> +       rmem_np =3D of_parse_phandle(dev->of_node, "memory-region", 0);
> +       if (!rmem_np)
> +               return dev_err_probe(dev, -EINVAL,
> +                                            "qcom,vmid requires memory-r=
egion\n");
> +
> +       rmem =3D of_reserved_mem_lookup(rmem_np);
> +       of_node_put(rmem_np);
> +       if (!rmem)
> +               return dev_err_probe(dev, -EINVAL,
> +                                            "Failed to look up restricte=
d DMA pool\n");
> +
> +       if (!is_swiotlb_for_alloc(dev))
> +               return dev_err_probe(dev, -EINVAL,
> +                                    "Restricted DMA pool not attached\n"=
);
> +
> +       if (!qcom_scm_is_available())
> +               return -EPROBE_DEFER;
> +
> +       dst[0].vmid =3D QCOM_SCM_VMID_HLOS;
> +       dst[0].perm =3D QCOM_SCM_PERM_RW;
> +       dst[1].vmid =3D vmid;
> +       dst[1].perm =3D QCOM_SCM_PERM_RW;
> +
> +       ret =3D qcom_scm_assign_mem(rmem->base, rmem->size, &src, dst,
> +                                 ARRAY_SIZE(dst));
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "SCM assign restricted DMA pool fail=
ed\n");
> +
> +       dmux->dma_pool_base =3D rmem->base;
> +       dmux->dma_pool_size =3D rmem->size;
> +       /* Track the destination VMIDs explicitly for the reclaim operati=
on. */
> +       dmux->dma_pool_perms =3D BIT_ULL(QCOM_SCM_VMID_HLOS) | BIT_ULL(vm=
id);
> +
> +       return 0;
> +}
> +
> +static void bam_dmux_reclaim_dma_pool(struct bam_dmux *dmux)
> +{
> +       struct qcom_scm_vmperm hlos =3D {
> +               .vmid =3D QCOM_SCM_VMID_HLOS,
> +               .perm =3D QCOM_SCM_PERM_RW,
> +       };
> +       u64 src =3D dmux->dma_pool_perms;
> +       int ret;
> +
> +       if (!dmux->dma_pool_perms)
> +               return;
> +
> +       ret =3D qcom_scm_assign_mem(dmux->dma_pool_base, dmux->dma_pool_s=
ize, &src,
> +                                 &hlos, 1);
> +       if (ret) {
> +               dev_err(dmux->dev, "SCM reclaim restricted DMA pool faile=
d: %d\n", ret);
> +               return;
> +       }
> +
> +       dmux->dma_pool_perms =3D 0;
> +}
> +
> +static void bam_dmux_remove(struct platform_device *pdev);
> +
>  static int bam_dmux_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -796,6 +886,10 @@ static int bam_dmux_probe(struct platform_device *pd=
ev)
>                                      "Failed to get pc-ack state\n");
>         dmux->pc_ack_mask =3D BIT(bit);
>
> +       ret =3D bam_dmux_assign_dma_pool(dmux);
> +       if (ret)
> +               return ret;
> +
>         init_waitqueue_head(&dmux->pc_wait);
>         init_completion(&dmux->pc_ack_completion);
>         complete_all(&dmux->pc_ack_completion);
> @@ -829,8 +923,11 @@ static int bam_dmux_probe(struct platform_device *pd=
ev)
>
>         ret =3D irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LE=
VEL,
>                                     &dmux->pc_state);
> -       if (ret)
> -               goto err_disable_pm;
> +       if (ret) {
> +               /* The PC IRQ may already have powered up the RX path */
> +               bam_dmux_remove(pdev);

it's still unclear in the comment and commit message why we can't go
with err_disable_pm?

> +               return ret;
> +       }
>
>         /* Check if remote finished initialization before us */
>         if (dmux->pc_state) {
> @@ -845,6 +942,7 @@ static int bam_dmux_probe(struct platform_device *pde=
v)
>  err_disable_pm:
>         pm_runtime_disable(dev);
>         pm_runtime_dont_use_autosuspend(dev);
> +       bam_dmux_reclaim_dma_pool(dmux);
>         return ret;
>  }
>
> @@ -879,6 +977,12 @@ static void bam_dmux_remove(struct platform_device *=
pdev)
>         disable_irq(dmux->pc_irq);
>         bam_dmux_power_off(dmux);
>         bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
> +
> +       /* The remote side may still access the pool if it holds its powe=
r vote */
> +       if (!dmux->pc_state)
> +               bam_dmux_reclaim_dma_pool(dmux);
> +       else if (dmux->dma_pool_perms)
> +               dev_warn(dev, "Leaving restricted DMA pool assigned to re=
mote\n");
>  }
>
>  static const struct dev_pm_ops bam_dmux_pm_ops =3D {
>
> --
> 2.34.1
>
