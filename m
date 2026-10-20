Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484932;
	b=mhbyV+4CRVix6i9mdZS1KJsMfbheEde6S3O/qzJlbK6TNQ+s6Hr+2KIfDKc+4lufLGZh
	 C1HZdWiSnGTPGHKN1l54HJkfX5Z17dOkJJ3ARp3xDFXk5jl0gj6ulmYss2zaW+wamk89o
	 pQIQqgV00HU1JOwnVxMR/1gCs43V2r69irELD4tcUIQ+hanLkuVAuo/7HA1/FNvMlVbRp
	 unNkxpkdg5WT44f9LwVESW6M/owsPguT3E9xm/2vNRkhf/CM/pYJ71nj62Wy21Dsly/0F
	 jVLsGec+wxJtShzpzVZjgjmPvAFepBQ8dnOZpttGUjj+YGHZxTdqiFDDg/lMKyUNgKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
	b=DlZ9tZa68eM/pTQWh7KNcdedQtG+tfGtP2/u+4n54YmI/RrFaa7cpoSujgEbx61eGoV/
	 RIk4gJSZdJfAfTEXZj2lR99kkiBsmK9T1usPWCZoCrxR9x4pqVnhw8nbVL6PuLca0t2mf
	 x52yP4Xx9fttKi0Frfx2VtwDZHs/KIXJ5bS3fk0YJokJKdmyRwWfxFQS1cSBLeaiYvhW+
	 +rJfjPKet9trbZLelZY80yILHaHhguFiinsrnFETTA6oH8DIZRf8gXD34dUOA37l4ujt3
	 RqIpZZkuG6P1jmtTXRKJHefJYuIQyaQGAYfem66cPrgOuwtvFhvK5v5GiA0C6G+3dRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkG+4lf9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPPcrtSB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562FB606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 562FB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lkG+4lf9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fPPcrtSB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K80xiS185928
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=; b=lkG+4lf97J9M1Jcm
	9rFwU/pY9ta+CZlYP8cdyba734bZluqzXOKHaZVvMjFY9cNTZ3g4N4J27pHDTpDJ
	KGp+pK7du9X4blUs5u0KiwWxGdv7n9oiFYG2JUWfieciXhVlJ4wEcOEYQqdMouSp
	0o53zwQVoZlr7Row84twP9dKTQyPZB5+g8fo3XkXfT0nNo8p5JYcOE0QVSXNDOjQ
	Ez7AKlSmZqHxcwIYaw6PFHkN+N4Cnpkb2xpGwuQaBrJ+aZXToBjFPGTMPQF4vRvg
	fb31HTx8bv9LEbhZTWI54XpwEas+L3AEVhEVazZ3XAjf2qpvt2+KJOXToRmyos3q
	rGgzvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsmg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:28:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e629c7b16so59940585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792484931; x=1793089731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
        b=fPPcrtSB17V9olGUvvqwdz7mqYYl/1jUJZdqPUQVSN5IXo8QmecFstCzxB02aj5NNF
         T6oHPDLhHvlrXG3hcAZRNX2RBvVPiggS4iorD+HwH+j/mif1P9oxRPJN8XUeeu82pmEY
         1isest0EXYGauS7MnGnrazG1P4rUT6Trhr9mBwKKksiPOiQEcSx2g7Db4uKIX0IcHrdV
         ySR4sEE+dX5WAKullsUtuzJy+yEUkYA2nH32Ou88N3kbhMY5O4Wtnx5Aab2tWp5G+1Yy
         NXtdqh/tGehq5Q+xKXqxS130pnm/83V7TvYDsu/EgRR2GousuXZ8DcnxxXnpVRUQwoyB
         k9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484931; x=1793089731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KGfAPHpsq6W/DX/k0Byx8PTAqkC3r1OP0csMJzXqDnw=;
        b=voSIrRrjh1tg+M2N1aKdNOCdQ8kjKJqjQhE6gu64e/oVOuI7BZA73WaEbIQedVibpF
         ZFwTbXACk+D4P6+6B9clO7Dn7R24Pq8KZ1h1w4afCcHUrtcGTvPMoaq0RbUbuyF7pG5i
         IbP54VazYfOlyP4rD/G9GzVGL/by9DMz4k5AkG6MfmT/U1yOwdderpAz/DhD6mS7dJCx
         WoVHvWXAIIK/B4ughDVDrgfTVVQxxNPQKFDuoj3OGbCjIo07ubi4BSFqqp+9dsunwQze
         wNUX6JGh2i7bWffSVdPLo3avvfJsrH30kPvD7r7QLJsCAH23VmyL1095q6nj+bzDbQwp
         2pAQ==
X-Forwarded-Encrypted: i=1; AKwUvByEMxVtcn7/ZdvD8UZLr2OvOIzaLcaMEE8yJpknLXHYH8Ptzf/oksuferhcJ5vOWsFuuv6o/MmGARpyPilk@vger.kernel.org
X-Gm-Message-State: AFq9FYImdMCQ5Lij0u+Aoe0omQEr+UwitvYYDFFPCosaezyEPUtH33/l
	bIEpi1peZNfP0UBlgc9UE89WhJTl3SjPJ2LJnS/y1pwvvzBKHzMkMh2XdSMrGrRjz5JX/QNi6Km
	hMYx3EygEF2SVH0jYA5djJb5aHlFyKbd0XGgh2xMnpNWhnWYGIwkL1FgDusbd35ws1jJf
X-Gm-Gg: AYBFou05ljobZ43BoVu4dWFWNUQLufcOgsJdxmnoUX+MLd++mJKLevO1sWqk+BcQPT8
	alsLRzSUxmq8nj26jZO7zq8W3n/ZmNkpszDwadddOeBIu6h7EvfiZX5ZTjMAUitWra0xW8kk2AU
	7KFMc319iTv5QyvbXo+ThpgbfJMO+tTr2w8n9q8FgePJoDpTpEQwomZixpSbsO+YLx5FlxiyiMR
	tFEoKdOekNYAeAWaCcuZyfIEnClhK8diabOhKFu2BYOwEbWdoFe+j2TGStKkms2poXfj7VniSCZ
	kH4oe8kjafeKgWkhS6j0A41/Z0ZfyqPo8uh0DNGYvsQCHfiWbSXCvHHUaBJleSw5cuT0p/qSLu6
	nC8uyTYEEjjmr5ai4o0U6AA==
X-Received: by 2002:a05:620a:3190:b0:92e:6485:f640 with SMTP id af79cd13be357-93f29d216eemr1869317485a.4.1792484930887;
        Tue, 20 Oct 2026 01:28:50 -0700 (PDT)
X-Received: by 2002:a05:620a:3190:b0:92e:6485:f640 with SMTP id af79cd13be357-93f29d216eemr1869313585a.4.1792484930511;
        Tue, 20 Oct 2026 01:28:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b0f75sm5026181a12.13.2026.10.20.01.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:28:49 -0700 (PDT)
Message-ID: <ec5ae206-beda-42d5-b152-91c457218374@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:28:44 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: Xilin Wu <sophon@radxa.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tyWYZQld8n5u2G2JIWb6BTHEswVXK1cD
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad72643 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6_vhy4Ov9suG7DV3KvwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: tyWYZQld8n5u2G2JIWb6BTHEswVXK1cD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX4nHy3NxUg5jW
 71DMGFZ9my9U1aZnW+UAu7/y3NEGhdaoORlhbCNjMZQKA/6TfqfPzm5/ePvWO62aIjA60gaTBN9
 mlTId6jRTOmNrLD1p4PWwiBIx+4Hv0HR68sIIuTdQQc1+eCS3LikdxfsV1wDi+99rvLaYVSl3o9
 2SIyHOoxoeFVXSCvtyjGfTLAxKoI7KALX4OQ0WkQ05oSqHPrKFtkfSXHrudJnlmJOQVbDd6k+9u
 zNnJMnorCMa8qaTApPX+tOcxsNO0cWobyQQOavK8LRHJsmzxwChCcXqkxvsA6yFiyuG3vnJDzF/
 0MW6hlAj2S7IvNTz7T6ewpZD7KCGppWv6z+YKHmXrvwhjxTxOOIJ68/6uHqKCHC+KNUMVjlP6tU
 w2NBFGYadicO6T/ZfPQMWK5w85Fok1tJ01aa7JsnhVOdts+ixSnYYwwCkIPno/ZoPhl+Gb9zdZS
 8jomHVXwo25Mcoo791w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMyBTYWx0ZWRfX+C5kASy01CEr
 3/C+CcwZkd4SGONeKnhSzxIjrTGNnWvCeQK79hVYjNJpIQKME+bpbSdnEW6OqD8w4Zlw7HIh9gx
 hVjPnwijnUC//DDwxosW18sauBG7mj4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200033

On 10/9/26 9:55 AM, Xilin Wu wrote:
> Add initial device tree support for the Radxa Dragon Q8B,
> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
> SC8280XP platform.

[...]

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";

No i2c bus and hpd?

Konrad
