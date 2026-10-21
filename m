Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568256;
	b=oUtsG63GPaxXnktkkDFgo9L2RzEBk6aBWHXT79e6dw+yiZDnctUIRZHCsWl/vFSwf4Zj
	 PJkOEv9SUQ+owc7pnsK7gsjtGBtHvyogV4j9KK7qXnQc1z1sf3LE7m++JnGwOvSjv9izs
	 +zb9/PZGOzG2iOo3zcW5VLBxJo15tAHQwE1b+w7hMmY2lJq4tVjsCWRMHrTdwk1edyNHF
	 c1qeV3IDRXOSK3heAbdJYCjCba4epud2ADoe2c40LDGdYG96kNG6GdoQAubfEeOk8Yelm
	 r6rnSv2sxDLxlzVR3lxsavsWSjM8jSBvBPKy4fHhMLT6kZt1Vma/l37O3d56ItsJAfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568256;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IvqT98wDmocdUnGZAEXuzIT0GLnL8jYaBKXiUR6/WbE=;
	b=ddslNBH8aFcaxzb6gE3fZM/A4nRpi9NrMOZ1/2mKDq5fb/Jm5FDPZ6Q+VcDeJd+hHw6D
	 1G5bxXtJbgo71V2FAr8dj2NIzabU5PaY6K1y3TaaIF+5QN3et7jfDhNhcC1YYAPJ5NdPQ
	 DUW099f9hJYUxqVvb9MZK2N6MylCupbXxPNaTF/Jkb+Nocu12AFOCvFPKuqqpvwVhGj6V
	 Vm3Y2ppc5k/8z1vnP6HSrwTY6IP3WXoWL955vK8AoL/89oJB+57h6C6Abnd31Ko0Q9BRW
	 I9Hly2oEncRYNiQqvrnfgdfyGCTqilwLLZBH8xY/Nd3h3ByUJ2hd70nIVeirC0gQb7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wm5M0Q44;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUySk21x;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1E3606A335
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1E3606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wm5M0Q44;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUySk21x
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jScP3573382
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvqT98wDmocdUnGZAEXuzIT0GLnL8jYaBKXiUR6/WbE=; b=Wm5M0Q44optcaZT0
	/i+YyoPHVydnXjvQR3qcZYpbWq7gi4bnFCAPsXtg6FRAc0rCGIN3yuWe07FRLGDv
	NQyqLLOjcG6XvXnnqBUfvhcbVzcGNqgLg+S1n50J4/WRPSTkeMP4paJA/EARMjXo
	G6FaI35xCFy0Ia7/1gc9PZcenicHCNMGaxFilD3skvKyOMBZMivbua4K9njzIO+r
	6yls5z9Z+93DMRvvJyyc0V9MSG2XhQxdwDZWycSjK92vjtnfXFuj8piJL0+VKUn3
	0i74p8nQJ8X1cq5WoLNebfHfcUSzk2BzAC5SWW0pPh/IZ5QIfHnrHHQPBL+yPyBy
	3Nla1w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htkrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:37:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53664911d46so15991661cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568254; x=1793173054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IvqT98wDmocdUnGZAEXuzIT0GLnL8jYaBKXiUR6/WbE=;
        b=YUySk21xANGYpoY7E8c650Nm6OoQEYDR8x0t8vRgyptnFIK05gbDjk9USYbVA386lY
         d9aXioTE5W4UoPf+vWXviaDAMV00rR4lPgNUH4Ssuyv8COcv+6CWiikUekJNYcVuasW/
         OCVld+0VobkUF/lxyyIgeCLh3SxnQIATO6k2dJ5pNcPOWMXrkg3ScWhAWXEBqAhBSDmg
         E0wNI16oM9OMY8lM+BecDNK5Uft9B2zp35A9GP+uQn6QauVLyiesKxDUZbn1OH3k+Vfk
         zLmSmZdCqSVyuRfFDyvWK0bAUeG12N70UxIh3m90+54j/Nx1tyW7obd5SUa59dOJzfBT
         wLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568254; x=1793173054;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvqT98wDmocdUnGZAEXuzIT0GLnL8jYaBKXiUR6/WbE=;
        b=mpj1Rs041UaFQPFNSGnFIc+z4J5gvH1ToZI59XrqEidI52MmFZcA/rfqEbL2F2Nh87
         VpyBaVjDXXBLlYgE5x7+vHsUFVdcRFLstcdYeJFbhqipyu7TT5/wDpa6BfwR1IozqIf/
         OrSVSDb+xFad+HcgUEtLV7C89iTQpR6jJ9Op39JVEdShHcZl6iV4tPl01EUMr7o0cNfW
         NiCI55zqMgYsBV9Exvd3sLyqETU196JIfdPBUTH3yeA/z78rhaaqQzyVnQTT48v7lqAf
         FF/9TgIMFNe348p2Z/7rjBYcmaWtbpzDLAPXpECUhgjpltQ7XHTRk0I5RXCbVcUvyxYt
         NzvA==
X-Forwarded-Encrypted: i=1; AKwUvBzYtCFaE45dsYI/L806rEqjUyA8WOA/zalUMZKK6DxIFZy/vT2xOSY2XBy72OWSdp7Yvd+RlysuJXLYijIM@vger.kernel.org
X-Gm-Message-State: AFq9FYL8D593X7TGRXC2IfD/BooPh7Eu4mlVEJRQvD4QNvv/Smx+3ZXg
	Csp5p0Q6XmurKxioAvNdzr7ofVmr8zL+rmj7CrBo43K0SRNVEpeNWpzJxinl1k0x6mxwuGuYV7v
	ioOzXwdQcuczINRSzHVafevSxQYPhd0JE0Ju3SrWTgzJSMggHzV/AJEQAVT4wMth5P5BK
X-Gm-Gg: AYBFou3gFyk6PkmTsw6IHXRraZcrU18TNTD5DPIclCknVa1Yl0DZCPLQ1+iev3vdkwQ
	sjlVuN5SAnyLieka1EMMxc18HexTyrC/HH5cXiA7EjCL2i9cOFzWNHJP7xgd1+UALx6h8GZmog7
	fhpAq+6EyqVflQ61pMLespRlEHk7/QAQn00YHFFcFyPdzTEY8MXPweghbIeDDaKGsKDMBWdJN5P
	sUVG3xicDLhtlK0Uzre5O3o4saLYvi9qFMJtg7+vN77m7thXDVkVHCPssixb/YESbU53+IzXaHK
	L+/rTMe0zl/NdxfgpbEzTxlp8FApRN4z3KTs1gODzWxCE5l49pvZ1JhIXXr2GNDJ6aHUfr+Gki6
	UTSiUyRwFCSZizysm3+sHs7XliR+3N3g9cCeJhYG4Rtqrf74ZgKuXmOxpFqD0yyg=
X-Received: by 2002:a05:622a:1345:b0:531:2243:436a with SMTP id d75a77b69052e-5369b85e19fmr17392401cf.55.1792568253848;
        Wed, 21 Oct 2026 00:37:33 -0700 (PDT)
X-Received: by 2002:a05:622a:1345:b0:531:2243:436a with SMTP id d75a77b69052e-5369b85e19fmr17392031cf.55.1792568253317;
        Wed, 21 Oct 2026 00:37:33 -0700 (PDT)
Received: from [10.111.170.159] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c0bd4csm18301266d6.30.2026.10.21.00.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:37:32 -0700 (PDT)
Message-ID: <3843110c-4766-4352-ab2a-6d3017336534@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:37:23 +0800
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
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
 <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad86bbe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0Hab3u7fAHnAQfOSGZgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX1sA7oXxO9Ezu
 1YnmCZrvwYEi+NKxNEG8A4aC3Gq64oPdzOtRUKZcqYBxrlimGpe1UwLCp5FdYhTB+8WjgCi1ZsU
 PQ8NBsdNSjd857LBrCzdGUXbshg2cXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX3iljPqaazA0L
 V6cpEGoLiHs5PqA6+8NtnlozGCNjMetLZak2DW4cUskqOkx20bt9HJkjBcglbMpF7uLPOpTTAb7
 /Z07P64Fz5Il3zB6eVo/8yUsbtTYi5cWwoip01HGFtPMX66NbXO7IHb6r2mG/ITsY0IThHcNohP
 nkpWjsgZFvinMwOsYY4TLZHFQWPzECVg+70Z4uxCCLLJGrHmHhkajV7VcRiOiwSK5TxJ1F1l0XG
 fm8mowcM8UpO6sW86FzBeQc9XxxODz6BS5FZrWDIIweVzElQh+n+GaayO/KZjs4kMAE3sp9u2G1
 7icJiiBwiymsubDwjebBvhD1AuaUh/Rgd/K+F9ahWxegTxc+5R8/pNy7agAdFGH6L8fFIFP/RjF
 10atiY31O9UZ8mL5+trBjasXjtwakq66jTnStwzdUZm5RdwNVwylJRyOv5EJJQikaR2a2C7WEc0
 vbM8/FXb48fbeS6nvwg==
X-Proofpoint-GUID: 4dwL5c893S1gUEnXmP1z5Cmv92kw90-N
X-Proofpoint-ORIG-GUID: 4dwL5c893S1gUEnXmP1z5Cmv92kw90-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030


Hi Bryan, Hangxiang,

On 10/12/2026 2:45 PM, Hangxiang Ma wrote:
> On stream-on, CAMSS starts the subdevices upstream from the video node
> through their sink pads, so the VFE is started before the CSID.
> 
> Starting with CSID 680, the REG_UPDATE is issued through the CSID
> rather than the VFE. However, vfe_enable_output_v2() still issues a
> REG_UPDATE after queueing each initial buffer, before the CSID has
> configured the stream. The VFE then never signals BUF_DONE. Therefore,
> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
> and CSID Gen3 instead. The operation happens after the RX configuration
> and before the RDI path is enabled.
> 
> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
> the VFE sink pad implements the reg_update callback. Platforms whose
> CSID does not provide this callback, as well as lines fed by ISPIF,
> keep the existing VFE-side REG_UPDATE.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
>   drivers/media/platform/qcom/camss/camss-vfe.c      | 37 +++++++++++++++++++++-
>   3 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb94..556cdfef6207 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	writel(val, csid->base + CSID_RDI_CFG0(port));
>   }
>   
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear);
> +
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   {
>   	int i;
> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   		if (csid->phy.en_vc & BIT(i)) {
>   			__csid_configure_rdi_stream(csid, enable, i, 0);
>   			__csid_configure_rx(csid, &csid->phy, 0);
> +			csid_subdev_reg_update(csid, i, false);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   	}
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27d..830c9c818d3d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
>   	writel(val, csid->base + CSID_RDI_CFG0(port));
>   }
>   
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool is_clear);
> +
>   static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   {
>   	u8 i;
> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
>   		if (csid->phy.en_vc & BIT(i)) {
>   			__csid_configure_rdi_stream(csid, enable, i, 0);
>   			__csid_configure_rx(csid, &csid->phy, 0);
> +			csid_subdev_reg_update(csid, i, false);
>   			__csid_ctrl_rdi(csid, enable, i);
>   		}
>   }
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..16a0b5663fe2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>   }
>   
> +/*
> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding this line
> + * issues its own streamon RUP (i.e. its configure_stream does the RUP).
> + *
> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, so the
> + * upstream entity of the sink pad is either a CSID (possibly with RUP) or an
> + * ISPIF (no RUP). Only enabled links are considered.
> + */
> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
> +{
> +	struct vfe_device *vfe = to_vfe(line);
> +	struct camss *camss = vfe->camss;
> +	struct media_pad *remote;
> +	unsigned int i;
> +
> +	remote = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
> +	if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
> +		return false;
> +
> +	for (i = 0; i < camss->res->csid_num; i++) {
> +		struct csid_device *csid = &camss->csid[i];
> +
> +		if (&csid->subdev.entity != remote->entity)
> +			continue;
> +
> +		return !!csid->res->hw_ops->reg_update;
> +	}
> +
> +	return false;
> +}
> +
>   int vfe_enable_output_v2(struct vfe_line *line)
>   {
>   	struct vfe_device *vfe = to_vfe(line);
> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   	unsigned long flags;
>   	unsigned int frame_skip = 0;
>   	unsigned int i;
> +	bool rup_in_csid;
>   
>   	sensor_pad = camss_find_sensor_pad(&line->subdev.entity);
>   	if (sensor_pad) {
> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   			frame_skip = VFE_FRAME_DROP_VAL - 1;
>   	}
>   
> +	rup_in_csid = vfe_upstream_csid_has_reg_update(line);
> +
>   	spin_lock_irqsave(&vfe->output_lock, flags);
>   
>   	ops->reg_update_clear(vfe, line->id);
> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>   		output->gen2.active_num++;
>   		ops->vfe_wm_update(vfe, output->wm_idx[0],
>   				   output->buf[i]->addr[0], line);
> -		ops->reg_update(vfe, line->id);
> +		if (!rup_in_csid)
> +			ops->reg_update(vfe, line->id);
>   	}
>   
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> 

According to the hardware documentation:
Starting with CSID 680, CAMIF has moved into the CSID. As a result, RUP 
is now issued by the CSID and propagated to the IFE.

Starting with CSID 980, software must also set the SET bit in 
RUP_AUP_CMD after issuing the RUP/AUP command. Otherwise, the hardware 
ignores the command and the corresponding register update does not take 
effect.


Bryan, according to the HW documentation, the change itself is 
consistent with the required programming sequence. The main question is 
whether this is the right implementation from the driver perspective, or 
if there is a cleaner way to handle it.

I have tested the change on the Hamoa EVK board.
Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com> # Hamoa EVK


Thanks,
Wenmeng

