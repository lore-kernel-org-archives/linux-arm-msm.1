Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC483955E3
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 11:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324595; cv=none; b=FZw7O2+mIlBOQbnFsIysNmGccoV+desMEjti0D7P7iVFzm2d5RgY5jswhWJM0NcTpnKAk2IAkxJGyHtfLhcJZvs48HCxiETji2Ue0RTn0aK95TPUEMgas6+Tw8paDpdhe54GEhcjZrmCeaey5OMfq+8izOmKOCWubR9nav0Dego=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324595; c=relaxed/simple;
	bh=ap+80GaPDnXI09SxjszHeawrEkEUnedSIl8LSpSpaRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nsnJ6eBoXQmHJwvj5JfpKb7uXAB7sKwXzMGXvJi/ee+vhtrmyZFgIQ905DIFwpVHr/UUwywn861W8wYQJ63SRCPDmobuAs7C+Ex5ooUuluI8XpuDghD4y3wZDk8uDX00oUDMtcq6n5gS/jNdc2eDQS/k2FdDtRU9e8pB0Fd5zF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QvQ9Afmz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bIYmpMR7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QvQ9Afmz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bIYmpMR7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5tLwi2286128
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 11:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gcEYZe12IS5R8fbm0oKp4F5/
	idlukA88I/0oldtDxJQ=; b=QvQ9Afmzj/fGG+aeASrcA/JAaYzYGKk6IFlJtbUL
	W5uH3JiBvrYtBFZykDTHD+Tt8jKX4GWEdGsUD0D/CNPcV42pZYoskpnfq8yAn2TJ
	JXZqU5JFzIO7YLkjVbnQ29AjMQkbTeMKVfeGXEPu2rpZDRdhAl5uLx6qU0X/Qxg2
	D6gB8QsP3SURJ9+VxKET818hKXYkd3wIoLVBDMXRbjBGDdPQrFH+ZLYwJUC8r3W4
	yLU/HfKASohkj9S3ANaovwgwu8urHvo1FRMMb1sg4Gdb6QvubeYSQ226KPx3hdR+
	CDGjnlupNYD6znJGGMCNc3Nq9nHEt3gedBst9cjCh/7Sdw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc2a9junx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 11:56:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso344543385a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Oct 2026 04:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792324592; x=1792929392; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=bIYmpMR7eSOK1TWKlF4snWvPeV2X9sgKMkfxhZvBL1mZy+NTUzGBB/VfVZhe2nb1sC
         gmmy+oHY21eV9JaBGgLcG+pB5Ah6q3Z/r+phl65oje5zIAoNrDjNDGYoSHlmKWaRVBj3
         MMQjl8pXHHhafPjE4OIaDBvR27osDZ4txyWhyGAWMROLJbvDUxvt7soeR7lYZ/zSm/32
         QcQecs5G9Df5wD1+opWNW+RK1uIE6MbiD0fClAs4sPZj0K+KOeBi9/csciAq9C962+L7
         CyBHncaPnBslpgyp3Cak6Tc5NkynaThSAwvubrKfJfB2ZfdheWjNlId8+7JZlLrhtjeY
         BybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792324592; x=1792929392;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcEYZe12IS5R8fbm0oKp4F5/idlukA88I/0oldtDxJQ=;
        b=ZPdNjxSp/AG6g5UnWN2kI5/1JfkJyKBQ/z1eAGsYe+eXEXJBGfO+2oFhtP68KAU8kB
         GAzS51DlVi5kZl1K4pL2a6ASjPlCuDcP4I+QnB7/fVVbq3npfZs647FsAwK7oHm9Evfj
         +FJh7d0ti8d9uQR8xF/k6CUgYIUgCExK4mUDDxmwQAzKQuRbaji0kKHQy1Ncwa2XQCRK
         kHhqFbnvDpnCY8RNCxPiiggL/985KMnlg7hktgTRaaI2WLUrejZCLvOqIobCf4jd4fN/
         frjjjSSapkZizYpVhPt2vENvumhZ8DiAnVwfQ4BIt9soFhXaMMPgcFbDbYYYMFimeKLh
         Sg2g==
X-Forwarded-Encrypted: i=1; AKwUvBz13u1T0wnVvPpBev3iCEtL5SiH0BPkz/yOoNCFZ8yuAGBrsvzlqsb1AOsvc4YxjEhuHUfoCaZ9sxHTmed3@vger.kernel.org
X-Gm-Message-State: AFq9FYKuuVKB5lZgIwXt3po9Stq/09C4b4+leitmT1aQPrkJNFbdYl1g
	nfFeLwYIXabfqH1743sgrKFEPfxiKuBDF0HBWmbdQ9/XHhwumkCXIz/pgsp284Ti1VKtxAiZCT+
	h8Sx/JlHqneORsk3McyLPr3WAHSzcg6b0QJAne7H1zCl5IrwedGJwJveePRALwAQJxAQm
X-Gm-Gg: AYBFou3Perju4nkZBshWrY4EP8E+/V9wADGBV9kVgf+WB32+RSn8MpAdKOGeZsYFx4I
	jXSI3VkbjyejB5qFGGqlN8/9ekqHDq6T2Yzbo3nYgb5puQcr7Xig7XsT7p9abPyziOYXf12UDKC
	xEoRk+GGtfPEBY/j5/GiReuwzYMJBJGJgMWfE3LT6zQGjtrZUQNfDpKB85pmXRsiRsUGKg7OFvg
	E+Fg3AADXW5OO33Mk5h12mGFuBDuEN1n3BLOnyWzh3mO9DGe1Q2i4Thc+LLefu8yRwwKDyBzFG9
	B3Q6DfGs36oRcdzX2vdpzTnxPkdQrddUgBuUhlFo7tkiU1cmCvehmvwDR6hY2sFhfmPZA3vbxy6
	GsZ7uMtS9nF1sOixzvZhjDhoOYLwnViGESGHgtYTznZwphvGCoOs/6sLg8PH+gHQC65nVpH9Sui
	9hI6Cis+lHbM6j
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332142185a.68.1792324591826;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
X-Received: by 2002:a05:620a:2314:10b0:93f:31bb:e3c with SMTP id af79cd13be357-93f31bb153bmr332139985a.68.1792324591331;
        Sun, 18 Oct 2026 04:56:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63cd1esm1370126e87.72.2026.10.18.04.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 04:56:29 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:56:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Use DP AltMode defines
Message-ID: <46mtzsydckbt6ca66h3stj7sn37ittzarhc6nqbjp3fitaqx3x@i7b7vbpxsui6>
References: <20261017-dp-altmode-dt-defines-v2-0-7ab3d93553dd@collabora.com>
 <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017-dp-altmode-dt-defines-v2-4-7ab3d93553dd@collabora.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfX8VCqt/dCtg++
 v0yFLTbsMRFv97vSyCr6+1DgI7pU8HWON7lykPvv8SwM0W/VIhtBD5cNbNe6pD99s3h2tPUflMo
 o0A2BHQskBYjGepb57/xWf+CHscs4Ac=
X-Proofpoint-GUID: NVAsSqODX-WoRT1yIu4Zn6tNcLq1NBDt
X-Proofpoint-ORIG-GUID: NVAsSqODX-WoRT1yIu4Zn6tNcLq1NBDt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA0NyBTYWx0ZWRfXzAM0QgPJWiJH
 HNLn+eMY9B+ZgAcUE77jAzB0uylbtAGcVmH85he2C92XHPMjszfI0bYvLw4J1tOeUHxde4Al1B9
 gB/tvgZV7da1EesTlK/FEu8w9tc8Vk6eebsr+R9RI8AZDoszeKmZGVuLZTmvqqoK9760qCE1vG4
 X7fTkJ+OEuzFtAL8Dz2zGRSVq57uqDjcFTEGzzfQIaUif0s80ZoH7XdVRSUbVpXRT+MiWE7PHm/
 0MG85nIdmL7YlucgS4dG5SDrGsovVPqA+Fs5BVURCPcS+VoCI26d2JSci3DINzodJBhiOoaBQ9u
 HTjclTynQ3cgnj03UZ6bsRH/VeQXjOyOu5vV9xgpSUhCVN1yT7zeqJk11jGGKvfHry8tOwSqyRF
 XZU/hv7ApVsru7IIbQulvqUr6dwN51TK2OT6WG885GLaUUzSR/hm/d/3xRZBQkSQotKSli3x2jd
 vZzspesh3Rd+J9GL4SQ==
X-Authority-Analysis: v=2.4 cv=PMeaavqC c=1 sm=1 tr=0 ts=6ad4b3f1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=imkpALUroobUoGdfvlcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180047

On Sat, Oct 17, 2026 at 09:59:33PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 8 ++++++--
>  arch/arm64/boot/dts/qcom/sm8150-hdk.dts  | 9 +++++++--
>  2 files changed, 13 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
