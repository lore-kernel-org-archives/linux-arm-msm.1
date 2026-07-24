Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02CD44780F
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905628; cv=pass; b=k8gJ/Tq1LSueK5PxdYgQeOvpNXs/25a9KPX2MHBm6lNGuIIWNsFVLmW3LGZF/pgbVLv9XeqL8+8zCDPealgrv8DKM7PbL/2I7VvaHZue4ixH/SlCqYEQynpasvSFdOXnfrfteHHGmzJ/HzlV03D356MwHAKcAFYW59Ujc+FszE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905628; c=relaxed/simple;
	bh=TqF3wLHIA1jAdZt0Tltgjjcw3xRF7uJIwJwkCK9UGR8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L48uGBMiR6MT0h/mzfAXTFBryrPqYSOKEEp1O6AjGrSWw/Ytb5KXzI6WttswatPMnSo0SXc3tdcbxYwEqzTHxb5q4Cz24rT6KZw7Y03yzKU1A6Orm8IEDRQPMZxAcVVAml0w6wtQDSp1kUo2khlQXuaiZt2O7Rn9a/nRDS+lUk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMNYH8YK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JxpEU75B; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMNYH8YK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JxpEU75B"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb6lf151447
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=; b=CMNYH8YKsP0vLnKa
	kg5kejSOcOGDDykg6w4NaAMhIZjMwg5Hvpg2qVVAeGFA6SXIkFXHAI/V9jYZZTSy
	RttEgtp4bwm6aE9p1KGLNE0/MB+O/oivlVfzYqqXeDZ/TYz39Fv1fPEUWjQMmKmB
	ZOhZL4fM89UgzYGiONz5xZQQ8LEp9cpVqsU7E9WNOiG8/iFseatouKgfxZnlVqh6
	rWFhOjCyVDJkJyyzui4Pk9uGykx+T9GFLHJOTV+t4bciz5za3v7JZndxoHiqDk4w
	c6pEZ4xZYfHEQPLIJ2zTQeesRUAuDTSkH8JP6vyj4qfAeEMOO27lPxff5lNMPRVs
	QuKvrQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck8gn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:07:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e8004d60eso84893385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905624; cv=none;
        d=google.com; s=arc-20260327;
        b=mCOvkkiwzVHXprkexOGkoL0jU3qPwcZ+jlxMw9E8w7M7KtZnhLXn1fvFRdbv8KQBra
         H14NvwiciEeDheFsCaP0OAeMqNVCPMexqPdFtTFSUyIxJd7bnWE3ogMNYnIHXeCZEAgJ
         BfPeMmsS79VkQcsgzSb1pz0xkDs3SxLbox3HmdJPkSiykxHPF9E2ea9cgxED2zexheB5
         hdT5nOHsldLG5VIo6E/ODYupy8280Y3yuedgyt1WNj2dpx7a8zgUcwYliGSrlVC5asnL
         XsCpV2cAd8ZmqfZ98cprGN6F2/pdPF+DkgiO/t7xaa5UiSEj7WDPK5gWtgf/+9wolH7D
         /b+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        fh=9UdH/r9x0AT/v0aiYUQK//C+eItvKJRcsluIbVCTLJo=;
        b=JpbVEXIWIG+lN0A+V+1PQj+0BG3+0ysg3vjAP9DdsmAb5TdjjChjuryq5t0N7eCdgK
         O0cZcT5NdpHsdrAphcrBfzCMP7oPSc6ASuyY/FYVQWBQjExx6PBmIy6GXvPXyg5pshdM
         DZN/cBWWuCBTZYegjb/HSzcASLvsXXHg0MAWbROZzAYu6OT1Z7OKAhd+Cztu9xbJffoW
         fqq3lWsVGljPrtT3owYHyY8xlIqzVUUwydu5jSpzl86BC5i4APojLgfX1sWKAL6I6uL/
         x2M+wnpPZ4Hy8DHhiSOZaYjx0tSF7KCVgLNJm5GcnNgG+dwTXqapkcDnmISp7MUQDej/
         ks/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905624; x=1785510424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=JxpEU75BJcGFAaPUZ+/wUj6q4yHKXfY+srcPSOK3Ckb61ZNhg6GD4cHqefnm8+C3Wt
         AVBnMScCSDWTsDiCqZMgzmpzO2IabglLt7S/4izdAo5QNYmo9lPP1qNYTCB55nktSkpl
         PEOlnhRQm1E8t7VhCgg+OcAs9P12PJnGc+LQ2Ax9H9a7BprU6n14k6UuyLWBc/4P7QzC
         segY1AS+4t+ZAlWyPN3TzL4REiGQ1GNX+QqC/pAhZt1w2cnLBldPjfG/OpjZty9TMOvj
         yRx7jll5WINMV755kkXIlQwftSOHHiV31VdJA1WxamHS6Bl1+dIMApug/WLStHu2Lc+c
         VJ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905624; x=1785510424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=LvsVYY+rdFs4jLeY+B2FFv4k6xeoAa38OpAPz6wLjmGYXqOpA/JN/bz+3hfjcQMxhg
         Yq5/t0C3tS7ifpPdBcUkxRvg04TsdP1U0r+YsmTmX98umpxUoOTGQNy43o5d5KjNRr74
         Fuu6id3Clonifso8B/usmiFrx/o0iMafyRRQwdDxG+Er2F7WHBn3dSu/DK5oKhsHQRA2
         j38z0Yhvdx+3VPoniPiheykqTKRpV/jWhT9N+bLtMVWjIHZ9ZnGLfU5jdQWB9T/6nJpI
         z8nm/iszooGrYtrFi0Q7ziNxVmrXoNL0zVvngHVpjgWTr7N3NC6t879LUa/Z7d2f2TKM
         ykMg==
X-Forwarded-Encrypted: i=1; AHgh+RqfAEB6D0gYYw4qciUTy5FomN4CAwEX4UIXQBix24+kD1L1+aCOlJazaON33FHsGt1XqVIikQv0ZLmQQuEg@vger.kernel.org
X-Gm-Message-State: AOJu0YwVukVSTzoXjVf+yQnMEy6aLuP0yFTK0l884de5B5KuLu6Dd7+a
	tIq+Tt4wTwJpryf6r0+sJTq20VKR1ZT+pZpSLuPftZW4g6q15R05uQMWX0b2PuwtEJqzY+WpHTA
	mR31CvQq4yFT5a4aCrzAJ2M/5sOEA+mSX957ppCLlBdSNKVfBujj/bo8FDM+ksVrzF0E7rhLZtk
	xFMlGtTnAIESzbXs2KWZHZ/03lt7Z/NkjmFdYjkAgNwYo=
X-Gm-Gg: AR+sD11kWqr7p1HEjvQ/wIY/YjCJLQEWkeUTaA3EJ0PlvgQ46bnvXbUwYgV25FlzBGe
	FP/cx8rPb4kbiY6GoecCUSJmCkHvB2yLDA0MKq4RBmWkLEMleu76JoaNHoqUfAPKe/jQMbB5IKj
	FndY6mw+8cgGYqA3GhohfM3e6lKdzezy09nta13/lKgbifRl4RlUon+Kat6w==
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id af79cd13be357-93103a65117mr772234385a.92.1784905623942;
        Fri, 24 Jul 2026 08:07:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id
 af79cd13be357-93103a65117mr772229085a.92.1784905623517; Fri, 24 Jul 2026
 08:07:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:06:51 +0200
X-Gm-Features: AUfX_mxUpEE-_djVPIMU7ZvWbbzhCFmItK3_9wrfK5-RcRFUSwGHiGhMmnFjL0c
Message-ID: <CAPx+jO9=HWwr4jGoCcWAM6fKTTrg3TphgPiNX+4yvfnyEZa_pg@mail.gmail.com>
Subject: Re: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org,
        driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, netdev@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX9Y4s6aHb6geq
 hIwnwX32ag8j0UWXQ+WHt1AdnPygFtySlz3LtmQkKUn/KPSXlggLQOqY/uOYvjkGrzOFWaasuqF
 qi/j+xmbfZAVt5OQVWQES/2vODNzcZwuIYgQMt5VGqvDz3GnIpGrGQz8wXA8m9IL5v2opq3YBWN
 OVT6zCxIJz7bosw9flB6jW+0cN/xSqy1PM5MdMEgPVcL4TRAQ0yYRGXXDeqxWkwokoFZWLoIVZL
 Ms2mh20YTU0Kxcw+IWZBVO1cUdOHHhcQUH4opJj8ps8yGDBVUFKFSUvt1GzJTFrK/K77YhWrmBc
 /C6ecpoDQYA4li7+SQnNPcuHgRLDo3qCRoD4jePyztK7z1aCC2/UmLVK/70K64bR+SFvfN8JAm0
 6i4K1U5NzoFAJ9IPItv3G1L3txBJbvGhYxaFl6J9l3YpTxDp97dSZTFikPt59PwHxL6bRTTFLll
 jC3WxHTTr/j+l4z4LzQ==
X-Proofpoint-GUID: c_1JgrBWZnhbGR00ImixlyiRdmNmlW9-
X-Proofpoint-ORIG-GUID: c_1JgrBWZnhbGR00ImixlyiRdmNmlW9-
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a637f98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX7hDdw0oBbBhp
 Bz7MDANeLltrME+XLsrqhVGnbK9rAhTk7aFTvmN465vO1ngD+h+wLXJ2uMBCOCuSCAxRtMMzPec
 nGPj7lRazmdEgZ7ePtuDyRFD6eS3aGY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240136

On Mon, Jul 20, 2026 at 11:25=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a226fbae4213926e1395c413160c950..c147eaf048ba2b79a744ec870=
29420981581e48e 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       platform_device_set_of_node(pd_pdev, np);
> +                       platform_device_set_fwnode(pd_pdev, of_fwnode_han=
dle(np));
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
