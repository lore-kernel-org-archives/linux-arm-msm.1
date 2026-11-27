Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782221;
	b=Gu3RtnKNBsppyvL4498tSTjjy/e56J1iO81vbP4hPHtEH76KeAqAGeqJcqpF4B9QlCCG
	 DnfWvdsYxpq0vDZCEy2s+yfqBaaxCMsMk/fHPSZf2chgaGlIXwYIMEYugITmGlYFeyk8K
	 eQEzmnCNICV+Auri8Hx6C2FiR7yu1iHZNid+Zhji9i7qbNkBhpKz+usjbQqaakObsZhbf
	 3AEQPEFC7SmUjLaCCulSWARZcJdWN0oaZyq1gYi06gz3WQ2nZPzuSYDJFev25omP/055a
	 nn0XMOUkhsAHKxaepFusSmDsdKMOZr4GfTdSndfygQ7u69KtTBCOhnfRr8ARj4ACC+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lK8pPUXcb7bisjMC4DxnwGbKPhOUZYiLD2d9/0wlTRo=;
	b=qDOdwTE4FE+DX2IVIuq4JvZNsJjRWQfA8X9Np234gJgt/9cc3ouoJV6JU9jGSQj/c6RA
	 3yqwquMNZWUYN8J+ulceODBvSgKycLzHoJQFDnnqZIKQR4jrSRTCigqqdSjZm+QKLTpvQ
	 cgyTqddawamCybj71LIwyKQOKWRcND/xBHoCQPLm6ENINqurzysJ4Qp7Jyx243LG3aBzO
	 7FshfRTXm8MsDy2GvEIdG+6osbiyWefJIpN3LmTO5bWS/0SKyKLeMtNhCkmG8qNVtnWcs
	 x79snvb2FU7YjJktISjcjPt7hDlvUiAgb5+9c8VX9eQdk0m2mu4s97FooFyZp2Xns3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SjnGRDle;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo48tSPj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D845606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D845606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SjnGRDle;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eo48tSPj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp5W11962100
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lK8pPUXcb7bisjMC4DxnwGbKPhOUZYiLD2d9/0wlTRo=; b=SjnGRDleNAAcuVA4
	WgJ/L24VWNvzA+EPkz/+EtsLBy86MC/p1E50Zy2OV2Sd3koUuECdD+jpPX/LYu9f
	s5XwUYs+M3x3LjBWpPhjGE45qxEZNxSZ9DLalZVafxIpDvGafre8sbgiD5NOhHuL
	mN1JDih1Au4KRZbm8FLAoUOwxxYw5UC28KZCrRa4FPw1qJUIzdDu82ul3H0lZeHt
	ZehpD5wVux3x3/7w/UR8ypTpZvKz7HbqRF/A3fZ6o0updRvhPnvFDGGUXzSPTVcq
	jtJT0vy+XXS7IlCPJar4vrrFDN64dwTO0LJLX2XVTCJfc0RTS/uvTLsm/kol68ac
	fOGhxQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4hu00r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:23:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eaab6f56c7so417981e0c.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782219; x=1796387019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lK8pPUXcb7bisjMC4DxnwGbKPhOUZYiLD2d9/0wlTRo=;
        b=Eo48tSPjkh1F0Jqad+al6/t4KCppw9VvqxSaSDB/2VgNpNdboM4GmMWVTP8m+fjLF/
         M0iW7eB3gBtgqoj6YgPYaHLE1DaYZ0hpSsNaf/GrLri1IxODTzLVRBOoY2inra5P6gv4
         4AHbfWH2/0qPUNemZMIlIy++Qhk5oA4xhNu9725CvNQyeXJ1Azzmo670WIalR9W6J384
         f5ywlRJR86LRGIrFVyUUekMYExUlh+CZ/GV+pxVQw/MvgPtAqK25Qfj+iIVK9CwC3Njn
         RvPo1zhBIV0TQHUCDQXbXsYIWg4rDCVHa+8irm8/A62JWWKRY+1R9WMJbr/XB5mrNbtw
         2vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782219; x=1796387019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lK8pPUXcb7bisjMC4DxnwGbKPhOUZYiLD2d9/0wlTRo=;
        b=1DYs68tLn/5JlHFsZJF1ClUsxznu+UDRAv7U0KyW8rVN4DgFL+jWys2GhSEcL1RKrA
         DVQMsIZvhzMM84qHPMvN3XeCNcIogNF616bEc8YQovrF/4FuLSn8nW/Z2F1B2Xje0bOy
         J4y0dx+j7L47AMdnN/AZR7IeJW0RXElnYKXk4mvArp2X4mmWOlch/W8Ybmy7KSA8sml0
         0qM/4gsQLtH1sNNHI0lYB8ZBJV97DuTDKfq4rphF+xbG3/u0aleRf5+7l/ePXXcapHN4
         VOYPBs8MimxddTAH4r7QabE8EUplfU91Zvpemnh1FhsLF/W0sl1MplTuBENvAkPAipQz
         hMYA==
X-Gm-Message-State: APuU4Z/2dIVuUojR/BWlE8CpSCZNl4//iJ0HmgHtIx3b+qWrcphHkKML
	oF098LVpbB0O7qismU9MxVFzhIbHmrIGuGOWRMTwvfLVEbnx8jiIl2IjOIZ3hPq5Dm6rM5oNqEo
	yQyIKwJ8hMiLC2ceURT5+kPrb1QqJOoh5WGRPQl2bPtgk3NX07+xQAhWuTsWzhyD1tHUiB4t6RU
	LM
X-Gm-Gg: AZFdTZfQ//Z8vdwRaD049uASqTNPbrW7uMcItxzbiWeMwlmtO+CY9aEeViip24VqF4w
	bVIKws36ClQRs/aH0dCU+CoTnlxcK2nXAGtJQ9lClMb+Dan1tyFh2in2AttOfBVjGJhVNzotr8W
	0ebouZABk4i66KDIef9F7dX+kvW1Mlo1XYmXCziE8yTkYorztkycd345PlqL2g5CRYw8r+otP7A
	dQhsDRXaxh6DjlNxEu6OYYWhyOucL0o5W6f2NUA+GRl145Kt/4Vx8R5aIHmAp7mo1HVThEXIlyp
	ZjjAi9v6BnjqwM3vkn4tcMJihNBvguZsEUiLDWUnm06KsB3BN3AwS+XGUI23DODb+s94s7XvYoE
	FA1S5fRXl5Yc6ALsBZmXqdjFifijwPrFyzWVmpApFe+iRDjb1xaPhASFoMWfbik6SvGzU86U=
X-Received: by 2002:ac5:cc70:0:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ee8af22cf6mr15444474e0c.4.1795782218679;
        Fri, 27 Nov 2026 04:23:38 -0800 (PST)
X-Received: by 2002:ac5:cc70:0:b0:5ea:a8cc:e6fa with SMTP id 71dfb90a1353d-5ee8af22cf6mr15444445e0c.4.1795782218186;
        Fri, 27 Nov 2026 04:23:38 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b030ed9sm874678466b.86.2026.11.27.04.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:23:37 -0800 (PST)
Message-ID: <37815f09-c791-4110-8c4d-cda44bf86b2c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:23:35 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux
 for DP alt mode
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261112-eliza-wcd-mux-fix-v2-1-ce7eedf47bb3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261112-eliza-wcd-mux-fix-v2-1-ce7eedf47bb3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfX8WTvpHfBnbYI
 0ZphW9ZuaPHv38EPeaOa2eKtWSWDN13g07ZOIXdru832/IOm1gIozTmO5Y6BkDVtbQWXZV2zow+
 KtVLBdvDCdPlh0Ys3JBPlQuE/5lp9wg=
X-Proofpoint-GUID: kWf8-EBwWhdodI-br0jakedzpBUA3eZT
X-Proofpoint-ORIG-GUID: kWf8-EBwWhdodI-br0jakedzpBUA3eZT
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b09764b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=vlQx1epL_Riolm4RhqoA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfXxn1YtFiQCvF6
 Abo/gR4ZcbCrJUK5b/2qbTzGbb+A7qJvO6IZvmlqKfiiT/boGR3kYM4y+KRofGDrtry890ytQsM
 0ObgQw0yDJgcgwLti4cmyc7vMc/obK3L/LzWOUrjwfrBgql3zWy2h3QzFzzcH31eVwOLMxUzxMH
 KJ9GFKMSf3+xHRf3Tn63kxB5gQeKYT9dsA+Xs8Kr91z9zR6THXg94A9SRvsyJV3NcBOG+iuLVPY
 SOnuHEJxtt95LvkSg1dI5ucJ1HiW4zLr2IZGN5alxvOQSJ+y0pcCkgXRrCfINdDqbJIDLwnMxcW
 PVQ7sfYAz62t+oeb3okWUtz/mpV/k/BV7KLsUZ93Af2nsh2MDdSdsm5j3EPiphImEonlvNiogOG
 DYiSY+2i5JdSxF4uIFfpQptRgVCUNP+lRNyPzClNMfbKUDGmjKYk4tUqY/oKlvsPiF1zeL9xRZb
 wIzrDO+IW7+vhw73b5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049

On 11/12/26 11:18 AM, Balaji Kalkonda wrote:
> The WCD9390 USB-SS mux routes the AUX/SBU lines between the USB-C
> connector and the DP PHY, but eliza-mtp lacks the devicetree node for
> it. Without a physical path for AUX, every DPCD probe times out and
> the display never comes up:
> 
>   msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
>   msm_dpu ae01000.display-controller: [drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, status=2
>   [drm:msm_dp_bridge_detect [msm]] failed to read caps
>   [drm:msm_dp_bridge_detect [msm]] aux not connected
> 
> Add the wcd_usbss typec-mux node on i2c3, along with its supply and
> reset line, and wire its SBU endpoint to a new port on the pmic-glink
> connector. This gives the AUX/SBU signals a physical path from the
> USB-C connector through the mux to the DP PHY.
> 
> Fixes: 193fd5f1aadf ("arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB")
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
