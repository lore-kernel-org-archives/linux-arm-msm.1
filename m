Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163626;
	b=uU7lTcqKx13+jDscIXgMbJsqD80rkCzgrlOoePQVCMJsUQxwBjA9/H5xwAvtwL1znRyF
	 rqqr4gTl9uU7fLlVELteQPJ2E45IFf9ORI7L/XAxO7upiQrr/D/5dw/WU91X6EGs8Src7
	 8E9A3bii5+6d6CkR73jhPvBqba8GvdZdXpryf1dyltPYI3g/GIqtTBPnzbVVLrqETD3rP
	 pg/l30EaXxmupsTX+OmfZmjwnA0tTBwo6BoflxKxWE1lrV/a9wVXGqJ4Rmz6OUBEKVrO1
	 BM3NbiDdI9DrNx/yY2e2ZDMYh/xSZ54XogFnDELb22zhMJKE0mhD4hGWi9A564r0jkQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
	b=5s15T0gWEdvyDglqNbNlAyLL39QUBDSOlxkbJczwLBJST34sW/BOjWsE4vU4ysEkfDUo
	 rbIM0a18DLY6jUZcsFtYb9SrvTUGFoxgxBIrAW8dl/rHwRcUZfOYWHu9S2SoLfqFjO7Id
	 HFrtqJ0g4RzF35dNTJgjlF5IffZIpkj6kZxGNQX1wQeXmvcz0gvu4JyXiSw5lC1hG1QpY
	 kB0GYXkXLU9+Ejwg+73PVZPSQcI4ETHvqVAhwNb3L3Ub2UBxKbRL3mO6jqPcrbo42dowq
	 0vRpUvzh6Aa5SpcYy3h6SKla3UPVtfjHINHvJKWo0iXbsbOdmpdsVy3IjPT45fJsorg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JISZ+Ax8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3ZHQgzu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D868C606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D868C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JISZ+Ax8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3ZHQgzu
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK8Kh0g737253
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=; b=JISZ+Ax8oTuX7jaO
	v0PaB+7NbZiya6gB5uQvYINZN5FssYtBKhpEbi0BUM9KPoluq5jgWfvN9SIHp+jq
	7fLnoanD4NNLCVslmdodnWDRhq8cB6IjYHkr5B/b3cnYTcpDCRkQwK+e1PonF9Cy
	WoatW7ZS25rbBhhZzh4GY/83XpnQVcFuEIPzyQvirMZPPqh5ldxOnm32ozzP2RB/
	AFxh6t8XfrTjAxPUjy/LLN9bsvq+zVXWDphJUSaos9EQyz4VHdNQmbaz23+uMz7V
	Wch5mHjM890nPFuLdko7cg/hrKF2AIRYD+WPPBCW2WxnTgaUGRzCPPC4mH3kREAN
	4SL74A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyjpny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:33:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so183039685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:33:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163624; cv=none;
        d=google.com; s=arc-20260327;
        b=bcYaca2Uo4qKUDS/dT/lJdjLjMYxUxUvFnsrmFj80S7rt+EJit2MOpa01mrOKAgDft
         GaJt4cjLXVcO/DPVPuJpyNzqfZ7oatWlV+bIeZmL0MeUQyy6oxjTXYKdzkOGr+n86ym/
         RrngqHNyNfrVseZGrYg0tKriVoMilW5FKTptyB0Dbxm/okAB991C7YuX1rE2nmCMhR07
         dMtEeICcga+oDphHIf05dY0+qr8KMybsF+8tLP2e/bAUmczzp3QMjpz+pQkgfjZAdXOW
         dUIYBTgk8yqbS5X/6H05IkA5kTvuywyLlYx/vBaYzsfOQHy4WgMoiGKK9JOw4Ll4LKAz
         AAIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        fh=WkCgGMbhNVx0V7FQxtTBZ5Eo/52R3NEdvzNR7vmGihk=;
        b=LFNLeCuF6uR4YT35jk3UDsuWBVh7jVxfNroiCjXItE9VZhXWWfmGxRS1h0StgTr4os
         joLmv2nUPHlKW27kD8FTx/QY8Wd6WcIF28vyn12E3oSRB3q+JiZOXGOUjBtP+3+WQG8V
         zos+TRJVh8m8Ir9giACK67h6w1+s7lGvV5IZoaiB4iaA4MCFptosS7u1BG9KKWN/MI1v
         Jp7tE4qREg+TW9fxaUbpjG2yMaOxR2mexsTheEkIT1UK5DdN0z6SO928fVDs6asSEgFX
         qiI/gIklq6Z/cd81PUzdAzIshdD4oDi/LUCmaBDczoYXr9f/5TyOuYPXwdZ6ztXlu8Kk
         ngnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163624; x=1795768424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        b=M3ZHQgzujRMWIHTKPVbFJmTfDHRJfZvi+BVqLtasy9xzVgPMdTGmflTim46GNAlZ5D
         SZG3pXNzhKsMt3i9Ft9W7Ok4HhcgTD1MjEK8HwBCOq+iMCYdPaKyp68RCckh68+/dqdR
         +RHYzCJlYBUoW7q1sF0HX7JrMNXWNQOd3Zlaebx833I1ZxMQjwiAyj5UZdjIy3Muk6Em
         bYAHQ35SJldSf0tspS2qMtP2AQ33RABWPWv3x8H7vGBxFNM8YAMHfFWi1bq3Qb7rUTkK
         ft2SDTvkhAvQugCdS03wNKz99MYWAwXjQaIe/db6t9xxW+WxDFr5ysbtqF34RTseuyqn
         N6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163624; x=1795768424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        b=gyBardAjVaf7u/b1oZlFzDragiHcIA0/M59AlNh+9b1BdBsPmIbb1mrwEN9P+ECasK
         PfknnuQbUv9nEl9cv8aAEs7sLoqEmdpqAkwbUkpHF8CosPZmOq5sgecrhLjX5FxuOkyJ
         aLg5z0ONDGwZXAn+2KTykDCM1ATy0dG1b8MCfx+Q48zsUurdT//ncRNFZUD5rK2v11oP
         uO6gNKTpwF1egH1FJ/PN7On9r4wTuzizcEPMJJT63Ju621EnSKz6nZOkCdYPObS2uFVM
         7CD0UiqBwZeQ9ocji3yPI4vM/50j/aErMPIeD9U/gvBZfSge1wwYQfEWVsaNucYAMalY
         jKLw==
X-Forwarded-Encrypted: i=1; AL+hErE1tgSTBVAjOb66Gv882abLVeQ6qOV9gxvNGya9ShYmhViPjC0B3EnBXFbdzCHQBh37tfeuZlXMrJFbFJWV@vger.kernel.org
X-Gm-Message-State: APuU4Z+7tFRWGf0T/Ji9YYuwp5uIaZsqTK/KYc6OOr1ZfGnTeiSLUBAs
	kV41KnX5UDjkd9pwP1f6dUs5jZsX2meNPgKgatp0JXhrTR7rBln9Kv6+LY/0FDQ/SdTo1l/Pr0n
	7Rfzs5jEFw53AT5vU35Y/kNQWSND74C05zxXCHKHqynnP9D+07HohGR/uIxWPCxF/Oh2npEKGwg
	46S7Fj/9MxQRvAwoRwLG+XjK/DD7U6qf1aek0ET85r6z0=
X-Gm-Gg: AYBFou2zFu7XSsk9cTe7QBnc95E5Z9ltKM60IRQHVL20BYfdkOIgsr66wVaLfEd7xLb
	TGnqSfY0V8Iq39AXiXCD5RKk322FhuwzbEv1FGlCGNuBqaZwxQustmQYBI7wfxNNhk5QxBWjmoE
	cwD0tXFd/QjvB8pq0a/BNhEEBXHrqPalo+MEpMKwESJVTzdwn5eNCcrl3chmPa9bFYQaPrZdoPM
	rjcp5ytY4N7YcTzrruoGTRA7vDB0a2KDMvAaqj9F5/VmpL3Mp8xJXx25bXg+c/Q1AOufYr8j8w9
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr378076285a.30.1795163624119;
        Fri, 20 Nov 2026 00:33:44 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id
 af79cd13be357-949ba9c31bbmr378072885a.30.1795163623658; Fri, 20 Nov 2026
 00:33:43 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com> <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:33:27 +0100
X-Gm-Features: AclHuK_13YVfgPHe00rWHz3MmtX2ZPWjOWt7HTHyfWW_D-cw5T1GuCsPWKT8z54
Message-ID: <CAFEp6-2wAR7SSMP68g25px2-5NA9ppRoWP-R1RtBALnDGi_6Sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX7QxqX/HHv50i
 01t4Ch1L2cMR6Yl1lnlUqzMnds21VR2+jlrqMSXzwmi8rqeqXG6mUy7olg8OHQEUCN0/QUEPbfK
 SzrZycBkRQxpKgeE3BwY0Y6+LZtcdqg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXzRkMFRJtbwam
 14WsABHrFQqjYiZJY3iT92YkvSY/qLPxOIgKluEAK5Y/0fftG4nN2AX8nOqdZyFx7k5La3ulAKc
 Fk/Q0GLFyQdZFMZRjBUD6+FleZm6laSMvUr0GZ5Lll0t8sQq8CpsiZb13v4zm0OrldoK1rUM6d/
 DXoZGAi1UftEUn0uawWlO97oNzV0xRiSYZ1CTqE6HVyxZJpzJ2e2cjBmWroXIx6EaMtN0M93HBy
 so3aJug28zpUc5icc9PDRb508PQOryaP0b/D8wyg5fFoctmUnL1YPjCe54g7VLVH6dJWaMVdGr/
 46SY0UvrEXo+Inplp4iqd0m1i1kNEFPlcDjtrZbCQWvO5oHpLxu5tKx7XCSAq1nLwa2PUAYeCFM
 7HpSkcYLsiBRprK10Bsu5Dm5X43prHwf1JAyerj05u9Z9859M9SW6mvYSdAy+Ch+Yp8dpKtbLCE
 YWH85s4V5uKBXA07r4Q==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b0005e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-ORIG-GUID: DPxafeaVpwJ2aGVgHeOctGL2RutFVjIs
X-Proofpoint-GUID: DPxafeaVpwJ2aGVgHeOctGL2RutFVjIs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200033

On Fri, Nov 20, 2026 at 9:05=E2=80=AFAM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,
> which outlives the driver, so a DT with another type gets "type
> mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;
> every in-tree qcom,wcnss-wlan node is level high (msm8974 since the
> previous patch).
>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>         int ret;
>
> -       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -                         IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +                         "wcn36xx_tx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc tx irq\n");
>                 goto out_err;
>         }
>
> -       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGG=
ER_HIGH,
> +       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>                           "wcn36xx_rx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc rx irq\n");
>
> --
> 2.43.0
>
>
