Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA80945C6FD
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142705; cv=pass; b=E47rQAskVM4teKversFa845XdPmeHsd6C2XuOFuVfhp8XrVP1Jj7SZrQQDk1Qr6IwS8bfJrNgyUSJPYSxpneg6OesXYXoWjy0v2k6am9UwVDHewuBzktbZ0eag2CGI4K5i1+DMf7vCuVT/7az1slqeLsCMrO0f3cdhzwUBrpzds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142705; c=relaxed/simple;
	bh=cZ0g1QHy33tqktTNojuGxJHnpB/JfMGacXKXYC6XWjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtgfmqbIMvYBS8i5uejYWFtS4URUXSSiEtbqU9IY1ZZuwnfGRJYCTDbkwEQXmxAA2x/YWzaJyLtctVzxiVnp8sLhRp+e7A3VBsUnPKkOUrFOyo+bHg0qXPdjcm+jUlK0OvbOwz9ycc5iD6GE3PDvmPoC8mG5kyUgcCQv8mk/kdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnQoSHIN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNBlMVH/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnQoSHIN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNBlMVH/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lp052312958
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FKP0tJkam5kj2GJAsnG13d60zYJ4DWwGMGMYlZXLSHw=; b=SnQoSHINw964US21
	OVW2Sy0HL7V50xhigmfopOh401MJBi1vKG3DCffiZ2LD7R6Db35S2kQXo1otQp2o
	9hB5f2WYeY3BxSMEa5TwHY9up79W832vaVyccyROngTWNmrY1XPQkPjSXkXtgcKW
	2+J6nrO0D5uMZocIeA3lKLkW/GPnf17PAZZQMsF4MfTzPsJ8RMeSsZZWmFeO0a7o
	ETjN/PfavaWb6MRs1hurHRgoowXZ1ACZuvbghDvWx4fUjl6+Sui+z4y4xzowuyRy
	oxNqBrZtb9VYRS9NiwtBbhNeiqIyQ7SsYRLLhWzTkJFHFcqqz67rt190vxbfBPzs
	t+QmAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa31ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 09:25:02 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ca9b53afaso1713724285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 02:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792142702; cv=none;
        d=google.com; s=arc-20260327;
        b=V6sobBpWkXYQS9CDPYKsEH+N3NExoqBoJTTzIX/3NSbT2KrQXbI7M5QfbLDuy5DTDn
         ecchZl9CoRgqvH8TFSQlstVK3ZJN8KwxTyYipUwcR8BGKJ3rYmbc1MT2iQeAkZeEw+nS
         jUYMBJPpMjNDlJEM/UoCnbDRHL7lfxrbyqyDg5FTm1IxMKT64v6y+FbsAuVh6YcmALJ7
         a8C7N7NoTpgmzthY5lBXlS0dU67IVkxpLLIApmwfx4bD0QoArINx+QXvzdn4i8k4sb0/
         WEfro9LWWVPZFADBKx0BiYlfI6GDIk5400uKRz33zEVwmv9eNlHJTQJ1W9zshlxm65uo
         aljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKP0tJkam5kj2GJAsnG13d60zYJ4DWwGMGMYlZXLSHw=;
        fh=jp00vO05JatgpaMUQOCDyuPfk1VaOpnomXULW51mLv4=;
        b=kZkwze+191eQh70EaxtqjanZGKo90QNfiTjABmyqFzNdsmKJaMvfrP2Wg2hu/UmBkM
         2Ug26/sUwWig+Rz89A2sTOXjNY0qHZ3In3/m3iWJjg7P917M8eg3WCIGsy+f7y6sz6HX
         4TadMScWAW7T2ggwFjBsVw7wPVLNuFwIo0e8YQP4wO/cP4UY1jbXZ5FYfdiIc3XHTich
         A7S0OWQyifhlZi17DVkCvD7FSEVNIDYtpqoxdQtynhtusvgdr3eFYdwuV4Nhh8nelFNU
         fsvR8EdDmCAwgVnWFuiCvXYxw8dMxXp1G7fUvs7rIsUBQIC6Cb0E8HY4kPjIw7lf9x75
         ZfMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142702; x=1792747502; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKP0tJkam5kj2GJAsnG13d60zYJ4DWwGMGMYlZXLSHw=;
        b=bNBlMVH/J4wpVGjBxTxTPdzZkxsNXB0tSRDyRK3+85VSkWCPGnMQtZ2Ajos+bop6WC
         FFZ9zNozUzRhWHB8QmfgWFsh+76uLnDshjvkMEwCN6oIFSvOyL/7XC7/v1b+wJunUp9P
         1LwxXr8jCwCKxA/IFI9s0fnn432HkHGYJJ5B/F1/YdvlqyHVBAtvaodUFbIczpvkA2gU
         tgh079k6P8h7Wog7XoAy6wwUOmhgA5XcZ98w2VGJh4KAy9wMeWyDmn13ZiUZEZtaMWV3
         q3POlaLx+of75IaH8A87LdjM8RIeewSHoB621Vm9TD5+37EsGoSQWp7WSDNu5eJIg5Dy
         tqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142702; x=1792747502;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKP0tJkam5kj2GJAsnG13d60zYJ4DWwGMGMYlZXLSHw=;
        b=hjkbm7gAon1owrfxQwK1UDZ3msxwvxD/d8HKFe5SJTjbGUutiJbcAG42OQUp+Se6gy
         Is0pnoXPAqPUa/1UAMLruNzrlo4qSKf5VJMdd86MSNzlTE2U0SLdyEyGMetMGkT3ayi9
         SPiWpbY4Ndxk1rpqcNC0Q0m4SODC9L7iqwsvvLoQ1FQughsZmC/KdDDtyfPedukR/42w
         IsDpfFKtms5imGuRA7Rdemtei/vgM+OHgYVG+bMYJNaCxzPCm4o+G0xjUb1tYju2E7dM
         JooQc+4d3F3DvXYFreKehd9Biuv17qlhCxsytsLZNO+mjH16kMmxyNwiP5wNtkbbyzTd
         +rmw==
X-Forwarded-Encrypted: i=1; AKwUvByqogciggLorJPVIthx2+uB4joehJTe/tZV5VkYMYNL+ii7rvaQabBgxsjSMUgawJIR7odjOLWKrna+xtlf@vger.kernel.org
X-Gm-Message-State: AFq9FYI4Uq1QLB/OwnY8SvTUL1dLDyaEltqvxwcjsvmm6gSpxKqPoODf
	j7HoRTAZzyQhqR/dWKFix4TohiZCk7FCJeWGlwHc+c617kIGwTeLqBjiz/jUpoQyVpTEp5kGgpS
	qfD+FYSo9jMAf/TYWgUDlt6ePpVkx/iFSJtH6oTjE0t6j+MTAQTlJsn1lzyzIY2ErY7J0EjD4h/
	2YxdeUtxA/MZhtxJtxDOFjCBhPwAUxDRqrP+8UZZJ4Tdk=
X-Gm-Gg: AYBFou3u2E/uFigcZc/Eo+8v9+F58sVpgmhj5oOqY33twIi9nIRiVxHB2iaeZOwYPD1
	ncaw/6DpuXym6n38clWCoEEtYagQ4zNFwhA6YitLYxMoCA9bvtIbBZeKjtMvcGhCkuh43CW3pWH
	iWeY4DaQEipH4b/NneyfoRrLn03/0N3eLXNPaYljllpf99DmWl0FXUnLe6r+/YtbcbG23FsPqDD
	/fgv0YfMCD4zAA5bkmhydoX0TV/YCw9+VB6oCugJeKBigdF7+aWXiskbpnuenH5klAKPBQ28HLo
X-Received: by 2002:a05:620a:27cb:b0:93e:dcb4:c73e with SMTP id af79cd13be357-93edcb4cd6emr2647968385a.5.1792142701948;
        Fri, 16 Oct 2026 02:25:01 -0700 (PDT)
X-Received: by 2002:a05:620a:27cb:b0:93e:dcb4:c73e with SMTP id
 af79cd13be357-93edcb4cd6emr2647964685a.5.1792142701369; Fri, 16 Oct 2026
 02:25:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com> <20261015-x1e-cphy-rfc-v1-1-1f3fa9af940a@gmail.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-1-1f3fa9af940a@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:24:49 +0200
X-Gm-Features: AclHuK8qYB9tixXQ7z206A9ZSBusHJPBuW_pxlm9dxF7pbKhpd-u_hOovixXQ8E
Message-ID: <CAFEp6-3N1gBZzQ7peHZ5gPt58dv_Xb4SVwoacQuij_Of1ObE+w@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] phy: Add MIPI C-PHY mode and configuration options
To: geocausa@gmail.com
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX+auwgjLeItWZ
 JuEC1/8/ur5MuW/p+nVREJMQgZ3gSW4AaCNMyLhnz3qc5dULuLLRsJU6cfECHiB6iQ4tXYMswaQ
 4yh0cFHx2yS23ixb0p3lSWv1Y5qgfeA=
X-Proofpoint-ORIG-GUID: kwot9MoD-GsfpO95QjY8gAGFK-28V7pl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX+s/qxGPGF0N0
 DAdlYqjACsbJ0kqEYLujnUYItoNM64fOZakxWaR7gyC3ZbFiTGzyfXOU2Vt7ZnJPhuZf3ukJWJO
 IUGUDMbXQ+bammmUyfScRR52LMgPT9fiq52kIs29kh7vO5yahTHGSf+Hmrj2Jp2S8k4KcNdpwky
 GZ30wgzIIjiiKh+sxEjjvK+3HOVNs9rALmDx4Iv2IQHRPCLh77ESJJhvWpv0tNX49SZapWj1yi6
 yGcyuAP6D/O/MNKvEUqcOApwcXR/rrmkVZNsCZLX+MvwBKPHla0U5Fq6ndrUN0eUGZ2HEBBnFUM
 LMMLTYbXK91Ex8oRjJmi1lKcJojchRocMK2DTPxMp3plUcAfAiOLNTgqkJa+bzgF1n8XcMLNhix
 6J2lbI47X52jk+FbA/ytM04/hOFFPvyHjFNxqxNXjSs5o3nRxm4/TXPK+OSduBDLaxnjPPdFk82
 NFB/V/H4mugA5Pm6cGQ==
X-Proofpoint-GUID: kwot9MoD-GsfpO95QjY8gAGFK-28V7pl
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1ed6e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=veGBgP7MCKqIqI38Ms8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160037

On Fri, Oct 16, 2026 at 12:20=E2=80=AFAM George Neacsu via B4 Relay
<devnull+geocausa.gmail.com@kernel.org> wrote:
>
> From: George Neacsu <geocausa@gmail.com>
>
> The generic PHY framework has a mode and configuration options for MIPI
> D-PHY but none for C-PHY, so a CSI-2 receiver has no way to ask a PHY
> that does both for C-PHY. Add PHY_MODE_MIPI_CPHY and struct
> phy_configure_opts_mipi_cphy. The options are the two values a receiver
> knows: the symbol rate on each trio and the number of trios.
>
> The first user is the Qualcomm CSI2 PHY, whose X1E80100 instances carry
> the C-PHY front camera of the Surface Pro 11.
>
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
> ---
>  include/linux/phy/phy-mipi-cphy.h | 27 +++++++++++++++++++++++++++
>  include/linux/phy/phy.h           |  5 +++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/include/linux/phy/phy-mipi-cphy.h b/include/linux/phy/phy-mi=
pi-cphy.h
> new file mode 100644
> index 000000000..e3f0a8257
> --- /dev/null
> +++ b/include/linux/phy/phy-mipi-cphy.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __PHY_MIPI_CPHY_H_
> +#define __PHY_MIPI_CPHY_H_
> +
> +/**
> + * struct phy_configure_opts_mipi_cphy - MIPI C-PHY configuration set
> + *
> + * This structure is used to represent the configuration state of a
> + * MIPI C-PHY phy.
> + */
> +struct phy_configure_opts_mipi_cphy {
> +       /**
> +        * @symbol_rate:
> +        *
> +        * Symbol rate on each trio, in symbols per second.
> +        */
> +       unsigned long           symbol_rate;
> +
> +       /**
> +        * @lanes:
> +        *
> +        * Number of active trios.
> +        */
> +       unsigned char           lanes;

So, wouldn't 'trios' be a more accurate and specific name for this variable=
?

> +
> +#endif /* __PHY_MIPI_CPHY_H_ */
> diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
> index c480d6cb4..f12337834 100644
> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -19,6 +19,7 @@
>  #include <linux/phy/phy-dp.h>
>  #include <linux/phy/phy-hdmi.h>
>  #include <linux/phy/phy-lvds.h>
> +#include <linux/phy/phy-mipi-cphy.h>
>  #include <linux/phy/phy-mipi-dphy.h>
>  #include <linux/phy/phy-thunderbolt.h>
>
> @@ -42,6 +43,7 @@ enum phy_mode {
>         PHY_MODE_PCIE,
>         PHY_MODE_ETHERNET,
>         PHY_MODE_MIPI_DPHY,
> +       PHY_MODE_MIPI_CPHY,
>         PHY_MODE_SATA,
>         PHY_MODE_LVDS,
>         PHY_MODE_DP,
> @@ -69,6 +71,8 @@ union phy_notify {
>   *
>   * @mipi_dphy: Configuration set applicable for phys supporting
>   *             the MIPI_DPHY phy mode.
> + * @mipi_cphy: Configuration set applicable for phys supporting
> + *             the MIPI_CPHY phy mode.
>   * @dp:                Configuration set applicable for phys supporting
>   *             the DisplayPort protocol.
>   * @lvds:      Configuration set applicable for phys supporting
> @@ -78,6 +82,7 @@ union phy_notify {
>   */
>  union phy_configure_opts {
>         struct phy_configure_opts_mipi_dphy     mipi_dphy;
> +       struct phy_configure_opts_mipi_cphy     mipi_cphy;
>         struct phy_configure_opts_dp            dp;
>         struct phy_configure_opts_lvds          lvds;
>         struct phy_configure_opts_hdmi          hdmi;
>
> --
> 2.53.0
>
>
