Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31C33D75A6
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 02:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786674683; cv=none; b=fB+MbqVbJWW7rML/mVPbt0ZR3rGmcih60CTzHmWIyj1K5Ki9peqR16AADdQwyA/Xz5y+Kx4E3pAUFiC/W6AUI8x6/lI0C8B9r8AUDToHG4EE2fPm2N6ezklwpHLd3lSp449yCMwFqGuWfxIBRvOO+yRaa+8sL+d2ddIYW/JHZIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786674683; c=relaxed/simple;
	bh=HhWOBTKzXiXMl1fDzrQr7sosuadRo4H8j0vnv3wmWcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTfOonhLwkZiKuglkUrYY4rz/RpDP8gRIYnpuSkKcRCsswQoy4DFqQhL5uYLyDpCUZVaUOGoNUkGl/GpVKsrercelVOFfrpZd/Y0hn7C44enoXcZy11lAa3RhS6eDL8f9QXXV8xhMnRhMJE+sUp5FjYCHbgLnWoVpacHITC7qMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cb5uATci; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NwhycD4D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cb5uATci";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NwhycD4D"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E192le1319161
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 02:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OF1Hc5Uoa6cnyFrVjXhCW/ubLN+IGaBWjiwYGQl3IWU=; b=Cb5uATciTI3Q/NUp
	J2oUnd5E7hLpWVxMHGFTS0sVVFZKy8HS8eNbaGXFFNQNhNNpaZxSLKX8q25AOLWx
	IOkj7cF9wD0w8AfZ8HDeGYFlw7rjBXVwdyo1Ozi0qtZlixnorMCyZaHuqKbf9fZn
	1/TAuWmnMJ3dURKwJq5yka2YrAVUtWVngzt8fES2mhh9CBLkJU/fdjUPNDlsYbAg
	wqummnWO2L/JP3GBUKtyNJZf7+wSfmOGuodMviHF76Wh6xWYuTBPhQ+dGAdBF/AO
	HoD8enmJohJYMlZT2uIp3ui+4wpiEh8MNarCnf0OZ6+3LWKeF5T1DhrULRTCzjFJ
	4AH3tQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2nhvjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 02:31:21 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc5faecf01so11294095ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 19:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786674680; x=1787279480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OF1Hc5Uoa6cnyFrVjXhCW/ubLN+IGaBWjiwYGQl3IWU=;
        b=NwhycD4D9E2QNyMknZzWR0BBFjHxU6zZlUb0p6vcyRGbmjysNU2G8p/He9m2UKszDh
         Li08BU9go9Kq/zRbegS85Ly3f4T+mxwYD66FUADZiWSuM8XWZUR8srffleMP5hdaWdIU
         S0hHAOy7Ru4kCbEKz7Si947NRyjMkyEiT6g4rUpfQGziwJR9QpWaskAcRmdjLENAmNRm
         1lUXIbw19g34jib1r50AHGsjONt9cAapIJ+desLl4oIAlno1F/anxfnDoX0C6BHSTCDe
         5PToBHqI28e7mn6M56t0u8fdxNAWwZuWsAyAGp+LPqULA8EUeLRazh3bsDpK2VLpWoMd
         YbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786674680; x=1787279480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OF1Hc5Uoa6cnyFrVjXhCW/ubLN+IGaBWjiwYGQl3IWU=;
        b=Bvm3lkmebdrH6uWbwTGb8CsXoXEeTW6diz1b7kcCkK/dw/wZXVlLPLBlNfbfDmesZA
         mxa2YT9gBB30pzuNZFb1GUIeuQTy2SCLhWkd0qe5y4pLu8GNAVuOFTz/h+hTLqDTlQZp
         pTx8H+gt8/og8XISUWMxIPeCvcPWx7C9CEDdtEZs9HsHZKUgOMZ5nQDbUvYBof5opV+K
         HReNg07uVyNB66GWMlE/EL2E3qZQEghxi4zCBRGIE7QNbEPrcXfin2kZ5EWI7biun0/k
         Anlm4Cv18vVw8pSj6kiEzTdVdhdk5P45t2se6lzehn3I7QMDR0fJx62Q87BR45LBQnOX
         4pAg==
X-Gm-Message-State: AOJu0Yy3NE9+oNlnbgwEg+oqTJA1pePiV/Y9GErMC5ylsxs/V4T4hXKc
	sNT7hN+BnRiYpsFD57ctzL+aJOcHz1dS0k2n1GTnKRAJWqaql4lqFHraqC2QV1eFZXPe2xwDjtS
	mhjKX5NWEdpXA1RqWBPqhhJ4TeE+mjwUKD77JkP0tNaytbgSeocIaXF2lM/2WzOS2TOJE
X-Gm-Gg: AR+sD112Ea83/9dhXcCA1pgG5rjuOVQ9aNqSSx98w7KGRBoB19QJn2sTH8J0qKv672p
	uI20i+OcpdA+YZLpXV18WwiQaCLvjtf9EBxVI4zeLDXPoc7L5KDDzJqcY3KF5a+xg5gAp/x1CU9
	1v/roIdGu10AXSNu6zsI9wAc/kxNnWzi7jaHlNUNxmKqVyMyEhz8ODX1mcN5FXaF2aYm5eHrUbv
	JmkGOe8QYmEr34786bQ1EShJ+wJLgx8jRSoOs5rQwgu67j5CgzvPdegbDWEa4pdyOVVmjmrx2H4
	OQVQoD5bmsFTr/J25mEGvSFjqwmiR+KcX3Kq82DjbV9UC481fIMjkBCAF4vADez1TQMTAKSJw2B
	NqKt0pa9gQB0SsS3U7qnUL/PQy7VWHO4bkxKrnOe660s5r65OS/oUSbOG/T64rym1Ux8c7g8=
X-Received: by 2002:a17:903:1850:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d3b0801491mr31372845ad.2.1786674680305;
        Thu, 13 Aug 2026 19:31:20 -0700 (PDT)
X-Received: by 2002:a17:903:1850:b0:2d0:cc92:f7a3 with SMTP id d9443c01a7336-2d3b0801491mr31372055ad.2.1786674679694;
        Thu, 13 Aug 2026 19:31:19 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7a4521sm3575675ad.19.2026.08.13.19.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 19:31:19 -0700 (PDT)
Message-ID: <c37708f3-5043-4ad5-944e-64ceedeecad6@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 10:31:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP
 UFS PHY compatible for Maili
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, vkoul@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260814004725.1368027-1-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260814004725.1368027-1-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ApXeGu9P c=1 sm=1 tr=0 ts=6a7e7df9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=F2GsAIeIfKtvr_1J208A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: vMVGdxgnVFeIVpwxmcFUUbgooyDAQWl5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDAxOSBTYWx0ZWRfX2MlH7theV9qQ
 hfxoF3TLXjk6v0V/xII9WlV62jfWsn9b6NH6CDui9mg/xuS+w3MIGaveoy4U1nBeO7NUXDQR19W
 gHUSkc9APnDS40W9FIyGyf2xTpfTjAM=
X-Proofpoint-GUID: vMVGdxgnVFeIVpwxmcFUUbgooyDAQWl5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDAxOSBTYWx0ZWRfX4WRvTCUVzzuz
 PbcuTt//PR7D76mmITXcGbY7OEALdxK3uNnzGVoFxcw1Br3jXUMlUFJTpkcc4YZ3vhl/ABOHSzR
 TST6BzusmDv9651EDY2N7dD7Nj3AYxkMXxDBN+Gx3x4cDRHRHSNQ16jOHPdubyrAM/FJ//ja6B8
 0LVbGG3BcnLdTihZJdfuGVwClCmFTfryQbh5oTZGxpuRIhZ929jAcULUccHu/sh49oX6td3G3Cv
 DV6SOttYygbJgp15yg55XvCrYPBzSKCxo7opWa09Ctb8nuo+b4YMtfprbTdg39SNRgcRv/Yqqu2
 9oaWtIxRCcggG0foYjkJQ8SLvZscuQHnCVjKGZ3OV/fGQZS3WtqNFvVwIJBjBGb+Ln9gUMVIgNA
 +3T/H612wbwE5VWR6idtwDRjOeapQlshX8vi5S90bq8EpkIa0Hc1mMFhfoSLBMnKFsPrw7spkOy
 653k1/WnuyaA8+FwEkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140019



On 8/14/2026 8:47 AM, Nitin Rawat wrote:
> Document the QMP UFS PHY compatible for Qualcomm Maili to support
> physical layer functionality for UFS found on the SoC. Use fallback to
> indicate the compatibility of the QMP UFS PHY on the Maili with that on
> the Hawi.
> 
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

incorrect DCO chain, the last SoB should be same as the one who
send the patch.

Thanks,
Jingyi

>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index 7e83cb3238ec..d94503fc26e7 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -16,6 +16,10 @@ description:
>   properties:
>     compatible:
>       oneOf:
> +      - items:
> +          - enum:
> +              - qcom,maili-qmp-ufs-phy
> +          - const: qcom,hawi-qmp-ufs-phy
>         - items:
>             - enum:
>                 - qcom,qcs8300-qmp-ufs-phy
> --
> 2.34.1
> 

