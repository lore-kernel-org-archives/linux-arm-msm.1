Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793780293;
	b=oQhoBRCkD4LJsuCRo4Zj/0ZeALnftCyEdxdQmkd1BJFW4tHu1QRUSs/H0rFHdPEuYbd0
	 t8JYxzNThCG/xe+B3mP9ywCBbzsoO5btmQ6t7PdZ0lwFV8Fcq0tagF395E8KbayFRVJ6/
	 o/ysRczuQcr/OvHyprtDl2/tXINgVfBYoELE4nRDImPmz8KFQe2ct33Yabhira64nGXU3
	 Ch7KXWz7fuv8dyN060BeTdXgoUDqzLPTBHpCNca1gKPgiwPEG1ymIxYqM8UjQ66qH0GF6
	 yL++KYxa63QjWVXf4S3YFibPxiF1SqLn9Mr5Dbq7zXAPldaP4xeu8DWmo5pFUGX9BsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
	b=Hhp0xo6dpofo7HyU56EaMJrmij3WVeI+oHsldK5gSnBV42HuYOPml81RlMYL+ITmQ8ta
	 4JawCcn/D7HW4VFliIK9bj/5PeD7K01MPe0yc0btP1b9GLVkS3vFrQxad2cx9yeAdplEx
	 vZoWFiRSVR6rVLXJivmpnrnCl2spRHhaRcqDN3rAJnGtGC0mXW0+nD+9cSl3JJN/3pCAs
	 q1kiau2cI+Mj72MJc+bcaSegQKqVQvkav8vSDO05ZtYObjMxQaYXSLYdqmk1t/2pnIIXu
	 +Btb/rMtfM9TWQIfmxNT8sB6NlkA3fXPhMV2p0608WtuAzWaxC86PjxeMldCKamBwqA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5u3hIUd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BhKbR0mE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC57F606A328
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 08:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC57F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5u3hIUd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BhKbR0mE
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A47JkP0838262
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 08:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=; b=n5u3hIUdh9tyMmgH
	EBPfvo35b0YoB8wAK5FR8KfCGDl/1s6Waa+0+99NNkvFaWCNxYp2v+DSfZMjZsF4
	2wIg61Gcd/vmtuotHs7DLyxJI2dVLetHtsY9rNBVBqfZ3JsHRwnDsgSvdSrGF8Z5
	slBxw2XaXu0VHco37of47Zg6KRpP+SQuZpNtklRuV8qrJwW+ctwXBpcj1MYJE2js
	RlLygiZGofsJd7Wt88P7Z6RkZVEACtSQ5NpNWN25/kPMliC5aWdeJdGayFVLjX4K
	1BgjxVOlMrCEwkCnMnD0FjrSa9yNSZJCcTxrj5qPwkYqFPhDuexmW7UycmfU60DQ
	OgpSLA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mttxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:18:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-943e8ff02d0so52135885a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 00:18:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793780290; cv=none;
        d=google.com; s=arc-20260327;
        b=qBbll21COF2sBBQRua73bMezH1/RFz/C9AGLtTqO6EPicM8c4SNnLLkptkV6NXjyWi
         xXuV7Q5Tp3Tly9onrxTnPoDe6l8FgZJ1S7nAPonksfPkbsGcm7uCfJV5x9Y/RU3+lWkk
         grPC/u/kdbw0SX7CULK8lUwRw1JbGAfubkzQ8AEXyHqziWIdfL8S5OArZydddOsyu7nc
         AfWkVaIfHLDL10sZ6/A565mQULCX5c8N307RLZBL68bl1DkFP4MMbLG9sPBvWy7t7yhk
         BNfvujfZ/BdXTHOZvB2NxPQfi7DhgWPcBAMvbJNpyFdj387xWsBUJBSw2D4IefWWSjj/
         ncow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
        fh=bIcNId5aP2xj515uxXUezJBNa+WJOXfXwy7wbS6krqk=;
        b=feYK5HaXtRUbJlo3jvLoU+tdI8u9y8DlmQ8o31hJlhYRQYpQvA60isR1l3GxeAaq3M
         EgTEyFSKri85pdzdNjDjNBWnGDg1joW/Rs0Rdm4Dec06qRGw+tuGIIRdJrKPMgEhzbsh
         BPlCEmRGpPO9dfZv2NQFFuXby3AlK1Olm/dE5NJEWaipVDBWfFqOC6qUgXOT1SFI4efu
         UPmTR0mS2op9YOxbhn6koiwICUgUZVZLDi7IaMTf5pXNo1NaVleat/Ds1KftzfoFArre
         K+3HT7BeQwRiunN7rvXoUL0ZoZLGXWAmGMAIZChctthU+Ifcoff+Nc4YLi6t57JVaFxJ
         hWgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793780290; x=1794385090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
        b=BhKbR0mE4y8j3ie6Rt/Rf8T/h62PcswhCh+4CSzAIgiftoUlC35oc1auCIJXww0nvV
         OTNMafJB2seIX/eXDNW8/eylYRixBnSREMe8JOaFXSSBg4uZcnc2+HJ9Z/uhb910FsoW
         nWu6rWbWiAxs4yblVWKirif4d1113Falhw/vHckZgqWs/mTbVdm7DklRhlMgkA4p4NZU
         q5T/kK/kukt219DAmoJB1ulVBAG2jV3r18pQ7FlxKzMv5rnOvC6i7ZlsrYfqMkv/vbF4
         C6cl1oursdXPbAMKXBhKLTg3RbAhdDIViaUB/PZ1mAT9IBP9uKwh5Oobby/TvcvbI28y
         dCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780290; x=1794385090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcpTRbS+6Rmc8RSu++ryGV/dw8x2YB6xEvPhEGDt16w=;
        b=CYCIn9uEuEyH8BjQZ3n8Qs/Z64R8zLG8bEw7A5U0320Yqa3fD+QHBRyUmDP9tTC3qP
         9wC9ylN6A4+r7gYrPj6XfAbfFux1qb9ukYrVIYhOww217fi2L0xfYvAp6Tld1FALabsc
         LS0C8IW0vPQKwF9Vmc4/r56FQhkRRzz08BMHrTxtfJy9BJ7zHh9OsZm/z9EGyIqU70am
         KToUztOhYu071hdtX6kBzkgMlfdxEHigVyasMDDljpeyixjA24b8sU2/EhLD6fQkpbrR
         cs3qvs29T6l08UwEjpRStQ2LsnK/Y4R9CTKpelfr3MhcagZ8DbzpK8c+6ET/ovlZAA9v
         JJ7A==
X-Forwarded-Encrypted: i=1; AKwUvBzNP5APsg1LZ5MMwzKFFM9MZI2byJcY2ub+p9glSzXblI7zEnqUj5tJpsHZPTAeBFdMagU8zkErvBSEOZ30@vger.kernel.org
X-Gm-Message-State: APuU4Z/tXkSmoNz1UAo/loDXIqLp4h/TESueYvfHey0cekKy3lnubWE0
	qhCZtQ9KZ8nw5Lt40d77g3Y50tc1k5IxuIH89qL+Um4+OWZ9OXjdFZgXqlcBj6LKhU0qMUza92X
	1P5CEPDxHdYdvrXAni1A82qeDzSXrhVi782Q4xVhTDxMWSmYhRm6eXAaKAz+goGzQPGuUAXq4Wa
	pSR9H54qG+Rr3MD6NtAC5ATUZcoUu7fk/T5x+TO2J3O9Q1Zvbx/uodjlWC
X-Gm-Gg: AYBFou0JV9m6FUbxOi6jhPTkoCgQas1dqvrvJ6my5uOcsz+r6kkEaGskpKYRJNmEa8+
	h9c9PplaO6Z04b/jKrurV51Q34VYbwzxNpfespKxDGgiIpO9eFs6u+L1dajWDIO++McSl0wO0hn
	MuX9zNzSvYHOldVa/cNKxExIYbf5iLn9RA4EUJd73QGFZJWUvoia+RN3GQFK0Kh5VPwyj8/EaY4
	8GY5kEd50XrTFiIPGsikR+dCv8/67LVwA9Z2cJ6TVLC+ByascAG1abE6xpjFJDFJ7CQoVlZX2E=
X-Received: by 2002:a05:620a:6406:b0:93e:7944:b874 with SMTP id af79cd13be357-944216ebf09mr2346221385a.33.1793780289952;
        Wed, 04 Nov 2026 00:18:09 -0800 (PST)
X-Received: by 2002:a05:620a:6406:b0:93e:7944:b874 with SMTP id
 af79cd13be357-944216ebf09mr2346218085a.33.1793780289422; Wed, 04 Nov 2026
 00:18:09 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <aa7b58df-a7df-4d33-b2a5-9cc760dd9ed5@linaro.org> <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
In-Reply-To: <tencent_C589954C94BAFF49A7B030C93F367DE1620A@qq.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:17:58 +0100
X-Gm-Features: AclHuK9lnpn5o-AYyo6W8Av-ZNEtQ8ukw8wc-Ki9Jr4kBT3RqAwz6_m1hfJuGpI
Message-ID: <CAFEp6-3iLYqvYqCrdf0ruQvuV_PKkpe+zdqFS6X78bEXroXF=w@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>
Cc: linux-media@vger.kernel.org, bryan.odonoghue@linaro.org,
        vladimir.zapolskiy@linaro.org, mchehab@kernel.org,
        manivannan.sadhasivam@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: hpuF-csrZmZAQLX-PbR_y8J9hoykFRx-
X-Proofpoint-ORIG-GUID: hpuF-csrZmZAQLX-PbR_y8J9hoykFRx-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX9hRnqmeGaN0w
 XGRXjUGL/nPwwLiDbyL8FFUYAmgh3TLWdcI9rMZLzKdHEeGqgSne5PJFpvW2AkRIWrE9UDlFsP7
 26hZ8IjIrdkRU80SjGFjT5DJtcAmXPYXIh+i+9OcXugTzgmcttwWtiMQgQ+05JvocaTPvC2df0g
 GgoCkrJRwqJK2a0Fe/bx0eqFHehcMvUvc4tiRhZIKa3LB9fX0f2jXrcwNTj8kD8t2JlYlJxjVOG
 UGPY82KPZs0Y3ZuJVzQUIXtsoPzUJggvVggAqJdX5Sawx4LRBjm8r5ywR+GiKmjRw1LEuqMhv6k
 7GrA1ge62aLGTVwXBUVLPjZN0EaVLY+hz/1BP/UHbpYcXePsYMVhvEWr5GwFN5N3IX0ToH79cLq
 Z+aEmBj1AlWr6VHUFbOf5nakU1sArPU1K427Z2GjqNK+qXX6mrN8xtzY/r3k9qq3X25kK+OnQRW
 /ouNXo1cJunEy4uY/iQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX4QHoENBOJt/9
 QcPeiN6xdivE5bODEPUNhlYH8djpgZlRbXEMZR9xMNvf7E/R89igxUeTrRQ6lrDdVHlBv8/HEX6
 u6/ObF9T06YwAOocoUdqf4/iXJKOUBQ=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aeaea42 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=dZbOZ2KzAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=JbTdJk7eOsX8aTkAOlIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040032

On Wed, Nov 4, 2026 at 2:11=E2=80=AFAM Shuai Liu <847807867@qq.com> wrote:
>
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
>
> With CONFIG_VIDEO_QCOM_CAMSS=3Dy and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
>
>   camss-csiphy.c:(.text+0x51d): undefined reference to
>   `phy_mipi_dphy_get_default_config_for_hsclk'
>
> Select GENERIC_PHY_MIPI_DPHY and drop the explicit "select GENERIC_PHY",
> which is redundant as GENERIC_PHY_MIPI_DPHY selects GENERIC_PHY
> transitively (drivers/phy/Kconfig). This matches the other MIPI D-PHY
> consumers such as rkisp1, mali-c55 and sun6i-mipi-csi2.
>
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices=
")
> Signed-off-by: Shuai Liu <847807867@qq.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Please do not submit a new revision solely to update tags when there
are no other changes.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
> Changes in v3:
>  - collect Reviewed-by tag
>
> Changes in v2:
>  - drop the redundant "select GENERIC_PHY", as suggested by Loic
>    Poulain; GENERIC_PHY_MIPI_DPHY selects it transitively
> ---
>  drivers/media/platform/qcom/camss/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c942c9..e0cef2cdd0a1 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -7,5 +7,5 @@ config VIDEO_QCOM_CAMSS
>         select VIDEO_V4L2_SUBDEV_API
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
> -       select GENERIC_PHY
> +       select GENERIC_PHY_MIPI_DPHY
>         imply PHY_QCOM_MIPI_CSI2
> --
> 2.43.0
>
