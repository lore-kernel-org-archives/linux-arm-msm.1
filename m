Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395E9435AAB
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433536; cv=none; b=H+6F7qQkzb209S9Z887Y7iTCMSjOUmlf0Or1sc2g2UyOPm8J+z24PtZdCA32HRHQ9Aea2u0BeOiv/TIcBsxUzThxUPD4+pHt09W7TcF55PU1X2xLrsJ74LOPVO1j+kAd93K65SYudeVCg1xdZoDD7BiYOdg1F1rxBM9tGDVOFcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433536; c=relaxed/simple;
	bh=/qJDC6cugKVjmjaFiZdIAgE0dBgEMsPvwp+P8zVZKFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUbkeQScQ9DfiEeNv1Qf9yhhWYjYmlXfEOnBiIlnH8jANkNjuRt86vkiJAHqYKUIqEh+xO/7GL3vOYe0MG8wWqRHsIPQEF7l7YGr25Rjc31FFP6t5IowCUCyJYPmhGaGjoHoMZ9ZLIDWaLm2+rE8sRcyNarObnInsoLkQU0ejos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VxaK/D9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UKxrOknE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxaK/D9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UKxrOknE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHB5L212441
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 11:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QHJgfTmB9a74tsOwrBzPpi9Z
	i24vB+4V/J7Jo+ncd8Y=; b=VxaK/D9d9ZLeFG4GKdKBa6I16OaErg5xO9KDaE+3
	XajvEu45mVJHmY0vHWUyec6/Xhg1O/jEUAmgHrJayuZBQUhocwNRpKuSBY0wJf5r
	cTYLMm0gC0TlWzdrGfk7oHqMA2aLWJwk4vVt16VcIAoAHWyxaK6cLkD2sswkVFSX
	aJ7ksiwGrd/FBcjgTyspUadfbViy/bCIMmSgL12azaioy71H/7zd8Ra47wwaAy4o
	54Z9PTGxc/PrekOdo6/1zPrRnWVyTkfH2foGispkM6hy2xohDt2XbhwF1CN8Pw2N
	YJOoDmBcXZSa6/1RGPhmnoYRoj7c+nMBq3Sh7tCxJrqPdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhjhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 11:05:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-938153538caso435165185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 04:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433532; x=1789038332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHJgfTmB9a74tsOwrBzPpi9Zi24vB+4V/J7Jo+ncd8Y=;
        b=UKxrOknEnPwATiFyBNDOgsXK6HnitjWkKEkIpsdATxmn3fM64eOlIBGuADmQtdLVkx
         2ZLWWPs7UQ1yh1dbr3+DHQVUUdrDLVN4nekprViTKG1cBH+ixAcnJOF+69U7lxz4Dwaw
         yx3tl0gUgtENBaWU3KcCckmPsq0AatiuZCh3a6ppydQDjk+1rKB9fqdys7uOR4dyQM2e
         Fc9gd+ogMSJt9jUlqzWCfSWRVmWomNcai7lMDXR9RbxvZV037ZfXeAx1OpJ1BUKXndFg
         YoCy1EHmhRQ+tNzDQ15wBhfX2bHa3J4x0GaNsnZ+gvI+JGtK0QJkQDqIuud0TBy4ky12
         WuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433532; x=1789038332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHJgfTmB9a74tsOwrBzPpi9Zi24vB+4V/J7Jo+ncd8Y=;
        b=J4+bnkQhuSL2hQONdxE60nCetKg0EugnLoegh1E1PfvDS4/VA/IdPQt/G3GNIWx/47
         VZewIr1gpEtFVWz7ROu92XlZX1SxJg3SQgAbB7A7rvetIU16XHYN0edgypJilse8dYMW
         YS7rD8hwrmg8ZQEXUeIEz2i6FiHtxZSPQzuToHZ+902BvNFzAZMNZN481jVnbdaWWZW+
         7cptzeEh3CYyrkuFRfjn/AOxsBQtsHwISORNyGA40rEcC93SKGSdAt8FmjeZey5CF8FC
         hYtUNITBhNlmip4KIKbcibskYyhXwb6sWzBuSNxSOa3HcrlBDtlrx5C3kCx0ndy75Dtw
         xc2A==
X-Forwarded-Encrypted: i=1; AKwUvBy4Zr0DZoWHMjv2a7skzrDrgmj1iz/fEt3uDZOHDnDQHxLD2uLgOSmSVTaB3TtTBAgn2ncJsO0UriNUSQjh@vger.kernel.org
X-Gm-Message-State: AFuF++lMlVabZutfN742FRr91Azfzg2Q16GU0IBb9WbQ3QEhvTb2sn5c
	WH6uOnivWW5HDJyvB9QYEvGhs9knKzkQFy4a2oc2bZxYpdZaPi4QsU7axjEn/VJQtA2KQz5PbAh
	f1udexTSDkBytQ4OsF/Chh6bfa1bJGHgIEXtjTpSeuvhzZji4Dn/B3kMxLJJsooXYpEG6
X-Gm-Gg: AYBFou2aOj5IGQ1TdvO6ID1/ijJ6APHl+23cjgiN7NbVN7klatUfa4A+JV0qidQBwOh
	ZFsvelHfpUVukdnkyZP7HK5xJOMjtJ7Lhxzp6xqRsgq2S1/NiOleyvVuI/EsnwF0OLydPYKkHor
	FGsiyu+AIGE0pCXmM4spSjaE4rkCVKYNVsr+wzIE79oeXK1RhWA/ItTORNYgsbc6PUZN3gUcMpp
	DOLroBn/3Ihmtf26/N9vCKiizbcndT0bhV0Am4VxKnvKjhLfeyzxqrswMIRieVHmQULhhGLwaCP
	Orz2nWYCVPZxM0iJ9gBWBI8/wHYwPfqpjU23UTTPRbXMcpLLksJ04abTPeYDrfvYqi1LviIlHB6
	P0cBlhQzZT8xMfg==
X-Received: by 2002:a05:620a:404e:b0:932:ddff:123d with SMTP id af79cd13be357-93960f796d6mr1350757585a.29.1788433532247;
        Thu, 03 Sep 2026 04:05:32 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:932:ddff:123d with SMTP id af79cd13be357-93960f796d6mr1350745985a.29.1788433531584;
        Thu, 03 Sep 2026 04:05:31 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dec54sm74620175e9.12.2026.09.03.04.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:05:30 -0700 (PDT)
Date: Thu, 3 Sep 2026 14:05:28 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
Message-ID: <33t3reowiellyer7bc6ipp3n5jhchf5ozbj5imkctp7mcibkq4@w3jbhjet4w6z>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
 <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfX3V4W1wTe5/Vq
 2Ct2sOtcYkDarMNKFp+eAZyomV1KnrnieK/HU+hF7hswLs0PSIT47S38ydje+kzrWg2POFCcb0l
 wmRbO1gL1rjMoJBdajO2Oe/GtXbt7XjhjBx/xT1XJJw1sdzxKZVr/szTuBXRH/pJbXLMEnn8oEx
 YyG+/wF7b90YRnp3UlwAYJRfmRt89yWieda8dqMkGempI5Yfgn7Qm/DGZ+GNyJgaz/em/32U9rr
 85HmIxzYNvhHEpLedOITutjYLiB1Bo/f77jUswFlB0EjswnLH84ru3BrRL/vKYTDAY5yQNMNlRQ
 Bnto54ojQVm9cMUY0eSlgSrospGXYjRg2rUoQruHd28AQ0yt4YCYdvApvaqSPdHPi22NcUN/Lfv
 LyxJz+5vPDJVGZ+PHi4sHt8P0AgebqAcmCoVhAElbLDeA0N93bhTclnPLYtH9cfofugoKs2eaCF
 GuCriEYFqL3wjtMZDvQ==
X-Proofpoint-ORIG-GUID: 2Lgdlx0u8TXo2ZIuoTky2GtsVgTEGpqw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NiBTYWx0ZWRfXxO0FTbd0chGv
 scNLtZePlEbSBXaz/oH97aJ5uPN//UkOmJSk09iJjVQidJfpwCFszF8NAc8mW0SqWZIRcGiCtlX
 DWU0nVA2tFwckVI48l2oYxdKmyV1JWU=
X-Proofpoint-GUID: 2Lgdlx0u8TXo2ZIuoTky2GtsVgTEGpqw
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a99547d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fFHDuP4XVuiI0RsLl8oA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030096

On 26-09-01 12:27:57, Lorenzo Bianconi wrote:
> The Toshiba TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
> lines.
> The controller is registered as an auxiliary device by the TC9563 power
> controller and accessed through the same i2c device.
> Describe the controller as a "gpio" child node of the switch and use it
> to control the PERST# reset lines of the two external downstream ports
> (pcie@1,0 and pcie@2,0), as expected by the TC9563 power controller after
> switching to the GPIO descriptor API for per-port resets.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
