Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794896850;
	b=zUXjzTWcD6iNZmr5zlkrgghPzdaHC7MF46PPgjofIhkatzjny2iqFw5YVyfAyiD62J4M
	 36DW1a36R6qHkBowCk3hkODuvV23DsWzRK+xetw4FGxc+Nsp4FcvIQz+mi3BsJvUsRUzY
	 K3o1DjDKYTHyUr/QrPtBRGu1/CsllvT/K0SNCdFyf6ErRPSkClqkETDxVnlh/EBfB8QYK
	 DHrzPb8DZi8Uhp7666CDG3VD1cu8flsTDpsvUhzOWJib2OTg6Le/BW3/I5ZjeLifRFoQV
	 oO2wwzNbISFZzQ/veE3JcJNsmNu3zgp5z+72oEcqUH2Rg6/gy+y961hmoMXbnEuZYig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896850;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
	b=E79m+S+wKF1JQhH8K2AJDgNqqRxrg00DgARBJ7/Qbm7wsKQ+A+QwDN6dEdx3SW7BvcRF
	 zSrVQ/OzKcO8obSTE0LNwio8RMqkNxxEgKgF8PfWPRhYuhu13OC4hUQW4uLY+CTlVAh6d
	 ze6TS75IhNwgYZVBPun0nL/eHttsJGuOLCuQrRF599eq49yVuLBBfSHDrOgYGu9/jGO3D
	 TlzjVMGV0bwUJvC+VYTRfAjyNvJi16Ggcx7pE1OHV5fUP0KWyUNGyqXXLddTi8yoPoFuV
	 L5Od3WrvxQDeTTCvjynCtyiYh6f41+EmBxPGOFvIIcoLaQz2/u1QusSP4e78kHULm0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RttC8X1W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MF4Eey6X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4267A606A329
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4267A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RttC8X1W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MF4Eey6X
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aILJ4146685
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kGocrnhODpwc4HBS0K3dbxJ+
	9nBTUl+OfB38M/5zCpk=; b=RttC8X1Wi3rineAEJsXoClK0awK/HZwO3Pd5wbU6
	n+izFuGy/jM1k6iQY6Uv1tUrkcMVmWrjMiX9MLU9MpTSRs68W6MQQmxp5R/+Sp21
	JbKHf6Hx6mqxR0cqsETQyCXNMDiJloBu852Qzg3+wwqsYXexwgqpuvKPvdbAvtR/
	BUT/ws0+ytVtLSaLadBc6ZvDbfITxfX+YxF1xJUro/SEA7dEzhQONrngHzPw+ybu
	yXutTCmkRwsqNbRM6RJj8zbN0uEd/jn6dendsqozFulF7L0h1QrPUvmHzdwzUfa2
	qB7huaRDz4zIZxEy/k+iGZpagm7xGmxCiQOAaXvOXOqsdg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfm300-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 06:27:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so5790015eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 22:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794896847; x=1795501647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
        b=MF4Eey6XMU4u0oG/w5RB3nqp9nUvCnHLRCIUhvDmN/XTqzjCHzc9GJZ3HTcLj3e+bt
         QC5abb2z5NMsdpqWCcCCTB4wP1isgaFl6cA1s7wRe20dfQiJWhLOarkpDOLvPoPo8wld
         TYyvApY08gHz7+WtyHoIPM2IO30kQcXelGwCM5ssgBAntR8rIsbk3IPMwX5jL3WQMHkA
         Tuk+mJjYT1h7xRSnHqZEdJzFaSvporelXF2IGAybK1tRN1PrcZVDqvc/aMxCTO4No9MO
         UI0jcrH6yDLM/5NytdNivJ8hIbBjXhjuwUA4+xVIy/JA1fpCF+aUgtdYTyEZJ5Gxvj9G
         RjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896847; x=1795501647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kGocrnhODpwc4HBS0K3dbxJ+9nBTUl+OfB38M/5zCpk=;
        b=X1/VMt1atpAZkckWJ8f20X4M9FRta2xl2kvm8JKkYpTbA9eVo6F5i8GkUp+N0IpHel
         xU5jW1keVHEGEXzZtSMinm2zgOhe7p3o9l+Df/rv6tsFF/O/+129Vc19mS5vR8qRINJd
         8N3fKqqz338cWFf+oRbubJcnSTdpbXhi13lg/iVeL2nTAP/xSlJfpB4R8nxvosSHmnSd
         d8N/GBLy3XRnoCveIV7vpQRogUV63PcdpCxW4JosrPf1qrHIepUZjaZMZal58yaemNKE
         ZqsV0woGge0Yyf7fzt2vL69Ht8jPL3e7VHN0lvsaLErRzaW0ZUgbDVzcT4pC+PaDaU6b
         RgNQ==
X-Forwarded-Encrypted: i=1; AL+hErFUZlOmLWUrxnjRqm96EySCExIfSvTgluV/DxAdLnmSYVbSAUBCr4fxs4mVOyImFDlej4AhCpWonydvnt8p@vger.kernel.org
X-Gm-Message-State: APuU4Z9zQPcfeoyatJiZUCDTIhsZjW3GR/KOGXi8MnWH6T+iY0ljgXQP
	6+tEBUIGuG4KM1TAsLPquyDIFTK4bSe3ZQNhqih2ScyNGjw+myeslVE/hvtbUBJFvaOZoGRAGsN
	Q7kNwO506fDseVy3QYvRl2sAdTi1JZVRrUEox9NL71dCPwZXG6KgC3s/5Ba/2XZRBvUHU
X-Gm-Gg: AYBFou294vCILRnWbeRaSTWhoIeAPlmBi5GagTZoGEtDTOJQp/O5E6xQEs7ndFP9w00
	D9HjZV12U6qGIHI6nToRFi94bN/7mLME5SkHAgtRHBFsx/mgyHIiMxpEBAAuKUnR3dUNyX+OFm0
	ZbhWJe2Vq0qNe1Mjfx8odwrSmKxrOyfIi8hGBHY4nGvbm6fp7FXJGsLsed7IFUxzHKEyTsDdV4+
	u4SllmBCOI7Q6jLtDMEzXacvWAw6WnRZTjxRUl57om8zsumLAq4GIVnX7Cwq8h/XnI+cuYukF8I
	DL4Oq6bfgnOcw92YHdCgwIw+hU4ut1V+DbbB9z6cqRDNQvujfVeEB6Ymya93eHfvpafEjeHEann
	kYlCpPToOVcyqaA2MrNFJkbcJ1FmjVr/47wsJ90FGQLY3Ada/DxAZMFW5v6L1XfkL8M9taLKbLN
	VLbT4GcAwADU+lMJN0JcVbWandlwDtjcEYAjW+CTyU4AYzzX+cpFKybYrjI+wqKzwvvhgHKtaif
	W4OmVA=
X-Received: by 2002:a05:693c:8244:b0:369:f291:49da with SMTP id 5a478bee46e88-379675061a4mr12663830eec.40.1794896846956;
        Mon, 16 Nov 2026 22:27:26 -0800 (PST)
X-Received: by 2002:a05:693c:8244:b0:369:f291:49da with SMTP id 5a478bee46e88-379675061a4mr12663806eec.40.1794896846413;
        Mon, 16 Nov 2026 22:27:26 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381cf17c443sm713717eec.15.2026.11.16.22.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:27:25 -0800 (PST)
Date: Tue, 17 Nov 2026 11:57:19 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: usb: qcom,snps-dwc3: Add IPQ9650
 compatible
Message-ID: <avvzxzjzzHP3o+4k@hu-varada-blr.qualcomm.com>
References: <20260924-ctrl-v2-1-fbedbe760375@oss.qualcomm.com>
 <20260930-striped-copper-cat-7c4fff@quoll>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-striped-copper-cat-7c4fff@quoll>
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afbf3d0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xdh-gZmfb6x7HAvpyVYA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX8YG0xuA34/nm
 IuuhJV2GSZn+UrdrilFe1WOId6rKr9blbSNGjpCPx6/Lx5NNIzfJT3sfBgn5Jj1a6XzifEfgFWC
 c1eW/lHII+JwdhsXd2eP/KYrJPiZPP8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX12G6dbGCDD87
 SmjHsK4c4vP9stm7KoeHhp8ZFlG1CYa91qDCPtZ2TtNbGoca9ix+13jXsVfDGL3PTf3mm+lYlji
 OCwcAwKXYUrh4lpduJVo5sIAceGIVNxC3PKY9LFa3hAlR1l7aMAo9eirU/dYuht0L09OrG+U3oX
 pUZS2AWFUnExuVNY+m4FavxfMp5e5UkyQy3RR+DW/q1niZrlW4J93EClsIVHX0HveSSZZh0eFlU
 q6Xb0P1hoitb+/AcqBlPw1A+jQaaannc4n4JUPF9Ud0SoHthDXe4WjMwgvNaHflX1ql1Z5iT4Pn
 hVWTxFnjT1xE/on2Pek0U0Oii1nZwDLZR0aeFLrPQ9qK6Ajd2/pnBejvvDvYG5fk8v1Skva/WZw
 rlOn39IC/eV+eYX9/bgOGgo6RKlSb7tYgHc6hEdMcbyd5XUaBerau1UlaO4E6IF3C32HM1lg1xP
 P9DWOw9DREI6PQ23iRQ==
X-Proofpoint-ORIG-GUID: 2vq7WVfNylPZPhS4VfEoe8DYfPcN7LUa
X-Proofpoint-GUID: 2vq7WVfNylPZPhS4VfEoe8DYfPcN7LUa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170025

On Wed, Sep 30, 2026 at 11:17:37AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Sep 24, 2026 at 01:19:05PM +0530, Varadarajan Narayanan wrote:
> > Add the qcom,ipq9650-dwc3 compatible for the two DWC3 USB controllers found
> > on IPQ9650, using qcom,snps-dwc3 as the fallback compatible.
> >
> > One controller is connected to a High-Speed PHY, while the other is
> > connected to both High-Speed and SuperSpeed PHYs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>

Greg,

Can this be picked up for merge?

Thanks
Varada
