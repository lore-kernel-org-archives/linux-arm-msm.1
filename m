Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033762;
	b=G+BDLJuOzmdCkQ4LkpdIVouOBUEsgMbsjyItj975PFXl4WJ/KqnOqsgc2XmyRzj8wSIQ
	 a9jE/WxHjlTllmNvWyU5gSTuggG25OxwYY28NLlsFzLKSOfVUGU6n/rYiEXMDnBALbUBE
	 q8gXn5Ji/qgbNOCpxe5Jo5UNY9KBzyYZR1BDjmCemiPV7hoNZpuVRiq1WqoDRY/k1x5zr
	 BxRmKfTJnFpwLzPQQzyuelm6HRSLFarnTq8d/alMP8+VskFWnGbv91eCC1ecocEeW+Le1
	 szAuv4DWKgEfnQgKlE/d+ak8AoNcGLGdblFGtQyGqaUojp/Qj7v9+dsc6hSdG5OG4PA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
	b=Uh6pDEhfr/kxd1n1gSen5iGCWKGc4f3yEnGGy2IAxvO3CIivYpC8lj5mt79OD25Eqa6+
	 MmsF1BZoZt0HHwEA9zJmBtV0mGPIilsldHggbaGZZUtFSnb+UMbSvDuGql3MagsBMhLZg
	 tR8FnSFvGm5VTGoBwN8TPwlxGOi72Mumhu304OLYYHby04JAObNeem2XcZByLx65SjmDD
	 Wcoy0EvmBG8aSptE1sAroMF5OZcw6vEvVQp/pa0kPVjBxXN+v1SmIGp0ADDdmKaNrCIdY
	 lXLePyqHVFd0X2gFacRNHFbHBCz40/jZQaWaaaXE7QwaxiADDh3HUNSRH8Up//OgbfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpI+AOGN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8458eaM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216F1606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 216F1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpI+AOGN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8458eaM
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJM4ud2732945
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=; b=NpI+AOGNxh4W2ZLD
	HOhzwaT1akLSDIlW3XEsOdjWcgZtMs+ZQzFqVnH0kSism2DrVDPNt7XuhBGa+yBB
	myuAJpnzgpSpvTzVy8zYvhSq2YgsSiiDChItUZvNSWsfkLu3MVtL1jqQuNgSm98N
	5gGsos+cgu+iBbme89DgppbYmsFNawnBS5rWhodvpB3Cl8W/splxREx2A098UykM
	TIirVzER2HS/GCATtoB1oCp2t4ZQHIVGIw/XE2aAW078PdOaQN3OdYh+9KqAU45n
	O7MItB4FTn+ge8u103d/CxOxw3jawwp3ZzYggt+dXCyBeyAcb2fobnZlG7L9rfix
	nxAFqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3b8v1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 20:29:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9495dd0f07eso298326785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:29:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033760; cv=none;
        d=google.com; s=arc-20260327;
        b=VtD1n0Y78MtMvHhmNy8LkP76Long/rgJWvu/7P6esZ3ij6bVzcJQBuWdA03LeKrtaX
         4ncyZ5qUqiBwRV5LMKoZIQ8yOJ7yqreP+WR03AdMPEHUG+FCDEpfd8Bt7DUrySli42wB
         wS6s7hUYwArAHyOsIsKb5ojglKcvhdwNmNhgrrmToZ6YdPSfsV+xftAataBK79HBJqDJ
         gic68EuXSDCubKFtFM/Ju6L+wE9duTd3BQcQYBHsGOO7h82haSaBiKy83Ql7l0zmfRI0
         rCycJv4e0jHSQHD6chlSE0GqvUiLJiEZsWhH49B1/bE7c1DA5fsIOrkzH8YPdZKC+wUe
         kxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        fh=XoILzI5WrPR/NSXZCAGPb3N5awNZLrwU6Vf5ZFIgDT8=;
        b=OMp3+FJy0fP4TOKn6uXneevbkWrsxRRDo0gveyOBmfzQTEyNFVj53sAdRoMT76MuR4
         9lFvaKW4mHIxKDdt6zT8k2ztPlJ7BXwoBjdNtAcO563+HN2j1ycBJvZ30sVzLNlig1Ni
         Kj6j/X0Y766PkdctpvPK0BXYWUir6vqQ5YDUREQ0DuE266EcQMrIGElHz9PXORYHHBul
         o6kxAms98AFvV5cUgJevp2cnnBzLeBDgWGHUuR2HUDTMYx0d5/iDbQihCOMcSVO4emdv
         s0EScS0J9uAJQvOmmXT6SoUxxDdZhYnxFq56qUedhkHSKbv0eMpgqwlNXZsRQi6zz+9w
         7C3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033760; x=1795638560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        b=i8458eaME8qijPCjB8rMf3haEX5zO9kXHS2/pFcOdj/qJUYKCYc5B9KV99f44W/C96
         +0p0AWaxAtC8eDMiTkCizw/nSkm75K2oOon8wbFwd6l9/DCkZ+g2aSgk6mFHYGARxnEa
         mJmcFw+UEgtDrw4WsFiKjDkacswXaRK5AbWvZERemiPFkkZWvZU0FzK7Rd6wzoj248Sc
         5h+3gfU8rJtBMWn/XY/Hu9HC0GY0Shu3uYIb7ZtO5Bf15djfvE0ihD0CJkXGzCLJY1x8
         +TcAT/64QQ6P50aVokCbS4YfSX89l0l8CacDW+V3boG78bztZ5GJwTnEhXs9xeu41748
         Pz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033760; x=1795638560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        b=J26Tuy+Fvd2NkSvfJrpzCPrTXBPgGM3npDKF6rYuA8Iznq4kYAlFp3fYG72WB9piBD
         R7CZHt+4kq0m29yzu5tDwr8hpUt4cFGgzRogGSOFo7icpI7QFLk74vAkFRQmiS52saVT
         A14MqoGakw4TPiIlocSpX2vNEUomkARPZEVXb3ulCKBQf5L2xrEgC8ijo0T4jRM5R4Ok
         4kgAnVshmS/d5YK8Y7WCVMTjnaYCsFJREa/ct54ESe8DE8oJf4AB1KtAXTALW5TOdVmA
         EROV2R6m/Zx9UV9LlOe8tiw1xbwjqv5ofaMU8Wj8plaC5IxSaajgnedhkUicczfW71UB
         lS4w==
X-Forwarded-Encrypted: i=1; AL+hErFdJq4gx+v7WcHn+0tvcBdFwN9w9a+nVMSHDiHS+4Yk7zwp5eJYhC8bMoz/HbclySioWSCuNOCjwk9pL7tj@vger.kernel.org
X-Gm-Message-State: APuU4Z/HtiKrXiZdExRz+O2YQYLIoHiu3QmPa+6kXfzkI5c+CliRFhnH
	YN1hVsylIsiTNka75iwBTNZgLJOTOyphqJ8DW+hQpn42rAjoMAswqeDbveTeFhRQyd1gE9ai0lq
	+SjuBBaDkZu3owRNoBHeQGdAylcNxqUMtlkOzB63c2zjujIEsjyEbEkTmQBBucUdDbE2R2yxHqd
	sQaFcm23E72JKlQFmrr437x3IrRtucUnEnr43CkJNn5sc=
X-Gm-Gg: AYBFou33+eei5hhXB9HhIIv8vtPPcK1RCYTsdJlWZZHHK1LJ3w5tuN6O1xpce+D3M4Y
	OzkeDui7L4VCES5V3rsmz+2IdGJCTxxiBWzMZgLRQSm3KYx5C9j6H3A0AJerwIgjo7fn3mkbPBC
	kq6u+grXHleTT0M5Fi8S77pSqrwkXY6spvfMNF1oJEbHgObuPjUbTWjtFxDV983iQ4z+uPCgnbT
	A0wx5xJlBpI0mRmhmiqHfF4XhYxUbmqHClCmseOsrDukbHYAQHKSXOFFUlzCu8Ve2cXHUrKpSM=
X-Received: by 2002:a05:620a:a194:10b0:949:9f1e:d8b with SMTP id af79cd13be357-9499f1e0ed8mr341707085a.16.1795033760289;
        Wed, 18 Nov 2026 12:29:20 -0800 (PST)
X-Received: by 2002:a05:620a:a194:10b0:949:9f1e:d8b with SMTP id
 af79cd13be357-9499f1e0ed8mr341702985a.16.1795033759630; Wed, 18 Nov 2026
 12:29:19 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:29:08 +0100
X-Gm-Features: AclHuK8JJhcd52hfVRf5gMzyZMF7wsPFyMwkvy_HKeVTiizUypnXwZQFHaYWU2k
Message-ID: <CAFEp6-1OnG4B_D59fW4WJeTOXAs-Jm-0Qg+yqwzM3j6tvya7ug@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: wcn36xx: Stop waiting on a dead firmware during remove
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Q_SDUFjoHQTiVR4je3us8Xnc0qtXwmd-
X-Proofpoint-GUID: Q_SDUFjoHQTiVR4je3us8Xnc0qtXwmd-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfXzlRFRtiN5+kC
 zKX9SFffUNvYuXCjUPRuf9rtg0z96LyWzW/E98+7U5gYCHqfWvcR/BGzRZszDdPpu7Ss3ptG2LM
 rkvhtZCTNbYyACxJwlHkDW2RrPcFdxo=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afe0aa0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8
 a=fXm7JzJIL1tcRaoap_oA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX7BiBL8WaQZUV
 5sFVOhD7ZC0bYK6DZg4f4OopoQZeXt2KBXO5hRXs/zH1rKNy5KI99QV2EgLgPjykTp7ImskAHYh
 DobEwReByeqQHieWPsoATjIrWcUxlC4dXJw/HmJ/v2IsspG98WP1PDsK4vavLS2xXM48Rd/649q
 SConWBH3WGn/hHiQMGDtMrXuPwzNp8Md6BaXlY2jwrLBTxL8E47xLe8v3PnJikZGaBinckHERhN
 6Nx4VhVLjZODxF/Qv8MXgrLPfI6mN4z7W3okIt8hRZuoTjsvEiqaHWOLs4NS1sXRK4FuZV+lpPf
 lcuhbOlQK0VUGKne61mDWAOYIZ1PGN3pXt3N9hqGzDQssp5TC5/SUuCkDIAuM0f3H856nZNV22g
 pRenrzZkQy1DD8Rt31cUVS6LC1kTYygfr5H3SsmRMt0hhuNkOllHn4xhonb31iDEwM4qeQfK+ws
 efozHEE9Z+IjcEI7QhQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On Wed, Nov 18, 2026 at 3:58=E2=80=AFPM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> After a WCNSS crash, remove sends ~16 HAL commands nobody can answer,
> each waiting HAL_MSG_TIMEOUT: recovery took 160 s on msm8974. Once one
> times out during remove, fail the rest at once; recovery now takes ~20 s.
>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/main.c    | 1 +
>  drivers/net/wireless/ath/wcn36xx/smd.c     | 8 ++++++++
>  drivers/net/wireless/ath/wcn36xx/wcn36xx.h | 4 ++++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wirele=
ss/ath/wcn36xx/main.c
> index ad8a4bd910..77a1029108 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1651,6 +1651,7 @@ static void wcn36xx_remove(struct platform_device *=
pdev)
>
>         release_firmware(wcn->nv);
>
> +       WRITE_ONCE(wcn->removing, true);
>         ieee80211_unregister_hw(hw);
>
>         qcom_smem_state_put(wcn->tx_enable_state);
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireles=
s/ath/wcn36xx/smd.c
> index c0b4773458..d07ea967ac 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> @@ -427,6 +427,12 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx =
*wcn, size_t len)
>                 (struct wcn36xx_hal_msg_header *)wcn->hal_buf;
>         u16 req_type =3D hdr->msg_type;
>
> +       /* After a WCNSS crash every teardown command would wait the full
> +        * timeout; one is enough to know nobody will answer.
> +        */
> +       if (wcn->fw_dead)

It's not clear from the commit message why you need two variables
here, why not simply testing  wcn->removing.

> +               return -ETIME;
> +
>         wcn36xx_dbg_dump(WCN36XX_DBG_SMD_DUMP, "HAL >>> ", wcn->hal_buf, =
len);
>
>         init_completion(&wcn->hal_rsp_compl);
> @@ -440,6 +446,8 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx *=
wcn, size_t len)
>                 msecs_to_jiffies(HAL_MSG_TIMEOUT)) <=3D 0) {
>                 wcn36xx_err("Timeout! No SMD response to req %d in %dms\n=
",
>                             req_type, HAL_MSG_TIMEOUT);
> +               if (READ_ONCE(wcn->removing))
> +                       wcn->fw_dead =3D true;
>                 ret =3D -ETIME;
>                 goto out;
>         }
> diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wir=
eless/ath/wcn36xx/wcn36xx.h
> index 8c43f67bd7..9e5f3918ca 100644
> --- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> +++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> @@ -276,6 +276,10 @@ struct wcn36xx {
>         spinlock_t      dxe_lock;
>         bool                    queues_stopped;
>
> +       /* Set in remove; a HAL timeout then means the firmware is gone. =
*/
> +       bool                    removing;
> +       bool                    fw_dead;
> +
>         /* Memory pools */
>         struct wcn36xx_dxe_mem_pool mgmt_mem_pool;
>         struct wcn36xx_dxe_mem_pool data_mem_pool;
>
> --
> 2.43.0
>
>
