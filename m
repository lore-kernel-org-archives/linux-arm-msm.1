Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBBE3A381C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047723; cv=none; b=fDLraEQZGvFQIyNljAG/jFsvZ9/8PZJNuZ2rJsKvJ8g2tLBdRSJq/xZ6yThuMmGA8u6PX3NoCjdi3ayAyIy4IqKg5pWTBG0Nqz99MCcTODnFod1YE0Ngf4Pmx0m2i39VWL68Ri+KX6doNPHCGwUGmTB0cYsVgt0uErwM06z1B4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047723; c=relaxed/simple;
	bh=QfiBAIQo84wvhlp4PSzKS5oAyVZnF+vu+rXcqOtSjsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E4MNQoVJCRhhkWDQj8d9PcW5ipe+XMuNDMBY0pYiQG2P+qSeOdw3MD41gab1DnsEG/3W+jIQnfrQj+srMZVUjyUxD2e5Ttp1YUVwRvuKZLFXAVyXz7CEVmGtKzmvBmS3NVvTyc2h/7X8UhUvLdIS0qJ6IzlgghDRmlmqGJihWGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wo14ffHr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=er+k9kmq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wo14ffHr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="er+k9kmq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BMsZ547345
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:08:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4zX7BztKtXi11cLzAfcZ9hIjR8IT6XfTvfH3alw4a2I=; b=Wo14ffHrSEJu6/9W
	Zt5LCGEjhuvvj+5polNFsavEnvRSWdMip7Qgfu7oPhRJVNEgx92eXusAEVpv2Vm7
	aXe0MADRBEQ4SpibpuvomQ8WlbTiiAsfcVcniw5oSH2XmsZyG9C8KaIZyjlfiY2y
	mbzrsyKT3RJbnuFm0JAnIUWLApZ2oUUA1jxt5nAmgzAsBZUi4IIP9H66QDvbboGo
	fagV7YwE0kc5/spJO4FDYgC2ce610cLxJUAddqM6lbiG9/h9G3r1cUbKCnlZKXAM
	UVG2uO/DnQYF6FdxHCyqhumd7INOT9Jks5LX5+ROyZIZzp0jVCD1e7RLmSdmCQQM
	Ut9bNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1ew0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:08:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930bd2bfc45so122395785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787047720; x=1787652520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zX7BztKtXi11cLzAfcZ9hIjR8IT6XfTvfH3alw4a2I=;
        b=er+k9kmqG8jp24X4Px4Xt1BpteUOkm2nJyryCb8DePbRr7Hjpbx52pqco4DF4+jHbH
         dngNr9RMUl7sq6RyNGDJQ1HSPShH2Xy1b5Z4gMZ91lYNujiEdt/h79kxe9ucfxXLl7yh
         jMLt93fUgD2YmbIYFMJggd0XFWLw+VqGBKuCLkiwCUNqgMsuB4LPu/yLtlGiNXle16ON
         1N+74I/q8ZeKFNCMbFuUxyM7FHXAps7Evu78QUYYRIbs9m8f0y/VCNxEXFDYJC5lM3nI
         /RGeIpb2x3XCW8Pfx4CtfPGB/nO/1PR0r/JUusUiGFtFnZANsGL4+viIYoLuXT9YemfI
         YLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787047720; x=1787652520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4zX7BztKtXi11cLzAfcZ9hIjR8IT6XfTvfH3alw4a2I=;
        b=Q2vZERcpoWIqtvac/fZ0VQZCYBEUeopfm/a8Sy+poiO9aKqC2pr7OyObtE+U/UWJan
         JlUKIABQ+RG/aqurJs1jM+V6zZ2opWaAo2A3yO+STiXtuedcMosPPMY1oj+UDpB4PimG
         RNxWBitJyTSsWgsJIKdL0tpyzY58DRSuzfHrsi18qZSx965NIYw3hPDVT5bzTqd2J6DJ
         T3UTuVQ55hJdRDFyJNvPaaH73Qzzayrcg4wtehLyUJ+FG3JTcI9uK+mSXBYzRfGLdULR
         ykx48TxpXl4eC/8FQvxK0Sj930YwFphYX5MN1vEnC3ZzLfDGeGmFV9lz0a7AQQulcPBs
         wylA==
X-Forwarded-Encrypted: i=1; AHgh+RrJ5FEDe1FKs09BBFTi8XgJRZJrtOO980LnBO5WP65nr/wUdSpMpTvRz085AJ2+ayy6ReC7apCWWnaX90Yk@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWLQ89gaY36pOAIMSRm48WE/WnO80k7Qv82aHo8fFnau+YKg6
	eyRna85V+KyxmcrFeM9tdy61f+E7QsruQpCptHKZHQfC75Dddjwx+0ZEuZ5b3rbXZna0iuCJDfQ
	KoPyxO1gpKEhZRgdRjEENRNWv6VwayniZv7FrJrlgknyDrK8Zf0ShWpl9No3gr6bMyWXF
X-Gm-Gg: AR+sD12NoXnVhBpk95o2+vCGZzB1MvfpVql51mudewaRVfNoFqXmk767AwfN5VepaZT
	vAH9ocvoy2lT+W5sQlri+XtFI2WoUFnw60hY8g+IADPb53lgXHky4N4HHMZCr74U/nBEtEoieU4
	nDdR3tNBwokA9GfouYlSj54NJUYxbEUDWSr1fB29JIkmp7wNnLAd2Qg/BmmotbkBkoMyz1OL0yq
	6aPFDnbX+Pr6/8uNdMErOC4CmEMTxUdY6C3NC3nEXiA1AOgL9NHVIOi9fotYOcDqFDFUY/4zmue
	AcRNNCSWROdoBPjXEHTGDqMopITGy/Qr1BFqeqZ1n+3jiQ0LrdpMpOrdmRPCY4pshd3eFXJw6H6
	RgS2ZedgaLXzZU4gbTEIMoUPc
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2252169885a.0.1787047719990;
        Tue, 18 Aug 2026 03:08:39 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2252164385a.0.1787047719529;
        Tue, 18 Aug 2026 03:08:39 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc60a2sm126710566b.56.2026.08.18.03.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:08:38 -0700 (PDT)
Message-ID: <070e30fb-a9c5-4685-8185-a5f19ed13693@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:08:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] usb: chipidea: msm: do not force the TX FIFO idle
 on HSIC instances
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang
 <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-7-e5f93ea76ffa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-7-e5f93ea76ffa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Gcsqcjg2TyoBaCEKS_6GTdTufaAdIB2M
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfXygEhNTBB1o+s
 5qEL9lhjjV3lqs62jdpOeoILAx26RxKD0whfYLs1tB4A+fK+HgkS/T05PqSJ7/714lLGgrGwU2v
 ov1oCC803a0HqZh/GDtyJrxYDKKYuR4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3MyBTYWx0ZWRfX47wT9EQR4qnR
 s9pj2Mjvs3yWGpMiiqJMCL5vddSbRUHcy8GZNjZVtGbBMh6zdjbbO2ohrRrhHXX1N8U4eR7Qsnm
 fIR3m59/oFIkiC7zipSn9hQgTR95U82iPBJQMNrBhexT+9tuB6w170vzjNO4BuwFb3WhwSHNx7t
 C9HGKgJ/urhX1x9S+fO/2PAP6tZxIWH4uHX+uOwwbhRMVoQ+43k5oCaBuEk+F0VWccAq04QzAOO
 gPqH3MteIGY3bDVhqzrIBpOzMu2AbmHEb2AslWX9vqcX8bgafAlS2/tA4wWhqHV55n2qdG1S40E
 xi+B/LH4TFT7aACFFRS/14NsTuS2t/iXoh4JEXrq7MuGBkiKZjOJuBdpnRsP77ZX6coxnMwjx35
 OLazVN2IuabHBwipoXaKqy8WuyAM2hJoEkkx52/1dsXMvsJkBYl9jg/TQ6zxRjv64PH64QTcke1
 v4QUMQjEj8QH9yow5JQ==
X-Proofpoint-ORIG-GUID: Gcsqcjg2TyoBaCEKS_6GTdTufaAdIB2M
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a842f28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rJk912bZzWDh8y19x2MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180073

On 8/10/26 5:42 PM, Dmitry Baryshkov wrote:
> The controller reset handler unconditionally clears
> GENCONFIG[TXFIFO_IDLE_FORCE_DIS] as a workaround for an RX buffer
> collision issue. The vendor HSIC host driver never applies this
> workaround on the HSIC instances and leaves the bit at its power-on
> default (set), so clearing it makes the HSIC instance diverge from the
> known-working configuration.
> 
> Skip the workaround for HSIC instances, like the neighbouring
> GENCONFIG_2 write already does.
> 
> Fixes: 47654a162081 ("usb: chipidea: msm: Restore wrapper settings after reset")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_msm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci_hdrc_msm.c b/drivers/usb/chipidea/ci_hdrc_msm.c
> index 9a9410a814e5..69be194f8e27 100644
> --- a/drivers/usb/chipidea/ci_hdrc_msm.c
> +++ b/drivers/usb/chipidea/ci_hdrc_msm.c
> @@ -108,8 +108,9 @@ static int ci_hdrc_msm_notify_event(struct ci_hdrc *ci, unsigned event)
>  		hw_write_id_reg(ci, HS_PHY_AHB_MODE, 0xffffffff, 0x8);
>  
>  		/* workaround for rx buffer collision issue */
> -		hw_write_id_reg(ci, HS_PHY_GENCONFIG,
> -				HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);
> +		if (!msm_ci->hsic)
> +			hw_write_id_reg(ci, HS_PHY_GENCONFIG,
> +					HS_PHY_TXFIFO_IDLE_FORCE_DIS, 0);

This patch seems not to match downstream, msm-3.10 sets it in both
hsic and non-hsic drivers

Konrad
