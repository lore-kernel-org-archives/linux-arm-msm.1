Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198267;
	b=gRLKeQfdAkkLc8WmQKM4iQdmih7kUF02MBzljqo4ScL1EfI6D/bWJL3goAFSHSoVitaX
	 ndHiHZnRbYfLPI+PLX4MA5DnGOvVbfFsB89D+yNSltNeikfob7X+4dX8oV9j7qw6SsNAL
	 4mfz7aJG1Bh+xZZrewHg/gYCnbTWa+WpCg8qkbRgF6nxusGXdVNNzgosWYvIW+elmjSek
	 SIZz8dkguQn5QJAxnE8OSQ6+CPVATd+KlE333eT2ddtp0OTIkl7AfW+jmAFGpyfPV8m78
	 9LG/UdAFHxsQlJA18GlXMiGg+s6tjWnR7ntcgnSUdTIwK8aHOjutQ0FiDjsFzupGRpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=;
	b=KlrioOXOkOcPX8Shpoht76D4PD0sdISyyvksoKGpBzdILtEjOc2Wx3O2H8pakX3fcBRM
	 hiBQyvnunV4+Fz/wBx3HfNpDid4HMp2PvtnHT8EtTWBrnQEioTdZ3MyDA+e3z7sK/j448
	 E3Q5D3Vk5rPa8Drxz2XhrVNYBHdcwwELi31u1rc+wYJ6iMeqy6Fwdijj3Yx9w7ouW0lXE
	 R7bFj23c6IVEPoNS3PbHgImGSRCuNwPUnp5+cBnt5EfW1mpDbKadj7gqJCLqr2Bk1+Kxl
	 pBByEzJR+jnHzL2sb7rjI/WhKN0MUXYltNpAHVnMyaSnrQ0vZ1DkamcegrBaIr6n0fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVHWF99a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MqQ3unHq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D84606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5D84606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FVHWF99a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MqQ3unHq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdwrV2105590
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=; b=FVHWF99am9gDr43l
	/MBzYTpcJkCmaJmT/GUjkKS5+m8Z6Hcs/5JOnOZZKLpOHZlL+WSrwBLJtrVcyTP8
	PgJpYWqEOMGojhA2Ya+g8bpbZyfoHdbaRByTv6JcFoPQQMfAmxl8lD9dGjlsWd3d
	gX70KW7uy6zlEmverd/ApanB3UsFStWYZKR9q9GNusuiW6l+L137WR4G5QLqogdt
	TRchHeWnnDaJ4IqT0frQqv0zbXG/bS9R6wvqBIprT+Jk/0g9FVc84whZuYe9y8g2
	sLsbeoaXqP1QUiAJcYKuzc71wbUcvlsjvI9a/1k1zct4vLF1soVgFPE0k7kxhf0v
	Z3USAg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12pv2e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 14:37:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c97957d83bso89342e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198265; x=1793803065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=;
        b=MqQ3unHqxsCb5N7+MkV9hsH+XFJ3H2V0d8mhOdLsLf+Sl3YiNsJN6ekBNbYaGNhlSH
         rHzvGdofDFQu2vcxG59RIz9K97+LfWzG7qZB4JxJvqr3QOzuQc2sl1X2QprR9WJX91cR
         DWox09ls/plGBKUPHp1AHy/yq7jnBC9LiGCR9fbiG3dQGXDMu6lpuWlHfo7Ea+9P0a9E
         llLz75EKsUmdPon/5oy4kTQIH0l85DGNZmIfV3w4JD9Gm2O/q83Waqud+tvhheZbM/Tg
         t5ntZmK1BGKLkTAcjFq6d0fEwKqq23/LOR807DGwu/2vEIuROA9QO9ujUDMHVbCj77A7
         1eoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198265; x=1793803065;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3DAoL+yUUSVahEuOLyD24m88+Cfx9LZgZjspyLIndDY=;
        b=aS5xg6WPuwBf87W7tPiVwTedOQptvBmmNBo6KUWPmXk92t4eRR+t4hjjUfLplG4+G9
         gz71TwZXOS/fHn4+z4riQFbU6Thazh7trfqfHqOnQXJv1hLh7TnnSB9PAAQuGjad/pEz
         mnWgzLLvnHPu1bgAzc+rxLtJZATDfqb23wo6omSZQ4Oe0f/IZQzTGzFX/EoVADwV+e8u
         7gsZBEWcCyN2zLE+QF5vsUF/g8pJc/Ee6V2ItcWH0eQmArXDzPNKBV8X6VxDKpqyGLfm
         AZYPi8A3lbwP27fx5A24hyGVXPnAPwBR3/WR5DaXdL+k4J+ORO03YmaRe3WIkxp+dT5B
         k8mA==
X-Forwarded-Encrypted: i=1; AKwUvBxLXIiBIgyTf3YOY+mYYnmPOhNB4LEmYMuGRSSGGRx9GJKkpnkhMGZovYMm6f4wvrD4v+Y+GCHB6Nvz+sOO@vger.kernel.org
X-Gm-Message-State: AFq9FYJW92uQy4EDiATE0LC2WIthJJmVSc0VNxvWc9aLg9qGZU+4Rd3L
	qqHEKe1kJ9+OVnVS7EYlthZOwe2MLR0joI55uJeUPzAme5MCn8wCe3RDrOfUjhbEBe1EDxFu2sk
	ak9Cra20B1Awzq+oZ5T+AVbcJc1eJ4SdTkXy5SNqNlWchPiu4Jf6Lq5t6lrB53I1LaxHXa5YOfd
	2L
X-Gm-Gg: AYBFou2xAM8s1g0MoYxhyIWQwL/BadhbUv+gc6IXyzPVrp1PR7AQDkM6Jgy1TkvvTnj
	CIH9x8kjLt1qJOxBV+F17cH6DYtCsc7Wo0r8cRKZTx4r4kBAfelKr6JcDUkb80cAM42BDpovfM3
	0fkaFhXy/lZXwEztdDBIjFkqfa7/sbAPNOJoCEu+xB4HM5L/D2deIDY5V0xBScwlHc7LNZ/FxlG
	YB5NWTjPflfdmGdFmHMuxlnmDphnalYFt32zKd1EGj/55Ott4NX2yq3pxLPKAVkJWB0WxnHii5r
	kePTZrP5BFMFP6qP3QC77CwkjvuOUbKdH4cOCXTH2CxuzKqDzZ/t0ysIejzImOPa3zdbBeO1Ie5
	m+L6mB4yP2GaZJIOFPgwm1YZmRzNv0QSFA8SZ1wHura4l6DpgZT+rPkMQDeIVQM4xMGz43bA=
X-Received: by 2002:ac5:cd5a:0:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec4cae6182mr1211472e0c.2.1793198265162;
        Wed, 28 Oct 2026 07:37:45 -0700 (PDT)
X-Received: by 2002:ac5:cd5a:0:b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec4cae6182mr1211449e0c.2.1793198264694;
        Wed, 28 Oct 2026 07:37:44 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e784esm601408766b.19.2026.10.28.07.37.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 07:37:43 -0700 (PDT)
Message-ID: <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:37:40 +0100
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
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen regulator
 vote for QCS8300 and SA8775p PHY
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RQ41YiKk8ESbYGcnDuTRfJ5t4jqMb8kG
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae208ba cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t5PPnQQkLeIUCWTc9swA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfXyUYFnNmnjy3L
 YNZAdSJv6I1V42Hzq+rxq97h+843n6c9H5Y8UbuX8MmMuJOkD209WnLsFdCsnuSG72yHSDPloes
 zI4VDBHnC076lybRTKPf5PaL8V4mMKH6w8xhZK4iBeOiYuPJolTLvRevmTb3EBIibj5tLQlAAe/
 hTpQHUDetURrrLNE2Llui2C9ZL2DzK0FSGGI4ndT4IaZ/XvtZL6P8kfCQvgI4DwJO3Fcd/QvS+7
 h7fdmyOugOnGTnieKSaVpNiZ2SD8LDDW53LiFcqooXbi0EmTG+px94MENpkEABapZ2Mt0xY4Otw
 mMITKcMgF6Voo+glkXQmfZmF7vtEkvIsT/masTRa2f0ih7IBVYJayjegKa3Ju4vMMqdCYpYN/Q7
 qr+txisiztBZrqs+cjNrp0kR8zfS0nISJUGwmW5hGA2Hhvprd45jHgtJnyAFLoGrFPEzs1EyzAN
 SsxD3PzxuoMkfyqvCuA==
X-Proofpoint-GUID: RQ41YiKk8ESbYGcnDuTRfJ5t4jqMb8kG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX6nYZFCe5MJEb
 CBBleMHY+z2s4eSufV/XI+eW8zVDaIsVw6mvOFRR2ngK1JDMQpnEhBEaTYj6XuOfu0AoqMZVEmY
 VpUl8z8lBYlsr1c6lJ2qsVsIf8Gw7UI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

On 9/16/26 12:20 PM, Ziyue Zhang wrote:
> Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
> vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
> and SA8775p PCIe PHY configurations. This avoids modifying
> sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.
> 
> These supplies were missing from the original driver, which was found
> to be the root cause of occasional system crashes observed on QCS8300
> and SA8775p platforms. Without voting for these supplies, the PCIe PHY
> lacks stable reference clock and voltage, so the PHY never becomes
> ready and initialization times out:
> 
>   [    7.303119] qcom-qmp-pcie-phy 1c04000.phy: phy initialization timed-out
>   [    7.309948] phy phy-1c04000.phy.0: phy poweron failed --> -110
> 
> Note that due to a hardware issue, QREF actually depends on refgen3
> rather than refgen2 as documented; refgen3 is therefore voted manually
> via the refgen supply as a workaround.
> 
> Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
> Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index da83358c97ea..ab81c6e584a8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
>  	"vdda-phy", "vdda-pll", "vdda-qref",
>  };
>  
> +static const char * const sa8775p_qmp_phy_vreg_l[] = {
> +	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
> +};

I think we could grab them unconditionally, as QREF/REFGEN appears
on most/all SoCs (perhaps with regulator_optional_get so that we
defer the correctness of this to dt-bindings for any specific
platform)

Konrad
