Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625374;
	b=JNYBZG8UJcKF/ppGW91wNXLJnLkJEa2/iTSfc1+eiwFkbd+22hPTcPimBdceIQP+mc0Z
	 ic5advrppGUVpwsaaXFFNyD2zxOaIFsSubLSSPmQsRTVseg+jTEXKVpVV0Lb819XrFW2X
	 oZoRvT2e0enhi3eNXiZIYkmuUig3iluvSos4co5KloEG5CrrYYUdm8cQ21P6m50p4CCk+
	 3o2fZripEwNljmNuFlKzh6hhG33DrjRSHCPtb7QlOSE9r5i2+VF1Q+HmbKUtVpspeIUeI
	 rEPcPlcjUbcTYvXGlmf6gDwVFtfoTmEQIQ/bIcI/wQAxNW6flM1IK0RqssLwSl1YVQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625374;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hya+gIi2koVDG+4j5QPeJpDU2NBaBm8cxAs4R6GPce4=;
	b=v537Qbeh8SztosYTa0MBvMrigL82B2ZO2/UYIiMInIDtMnZTHTdiPTsLhhip7KRTrh5V
	 binBZYsJ+TuhUMyBQegj2Era6FCZtkR349LZ39KOqPY1FtnEPIOrBxqz9zU7ySOFlwtgg
	 QsADHNVI0tIM9RDwrMNprdxfPvTD6eVIC2LHQL7zdYyFrspVU1Rxn+3sgepWSctXpUWmC
	 ZA4toHAumDMBPIzjgfJLe6Vm1nZ+ZBBKaI0dbAoZNLSJy8yVxG7S6CSFThe0VVXQGBCWI
	 LOimdSE7Dt/c1MKmSIjyAhzTroGuY/PvKPqEnT6W9IfemUq6qoddsJWHkdT9uAxj+hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7Yibi8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iB0C7hhP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33308606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33308606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bh7Yibi8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iB0C7hhP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAJQo3423272
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hya+gIi2koVDG+4j5QPeJpDU
	2NBaBm8cxAs4R6GPce4=; b=bh7Yibi8Iu8gQDZIzYkTL2FAG8azATUPfbqncMs5
	rJVSbvMcQodfBpDCDXlHdjKqTYJQjIG3nhIuv/Z7bBPMTKJmenp8MufQd21yuNJ/
	c7wQtDpofYJrV4QqucwqJKGhHULRdxZxc/IYUk0BAFtIsInrqyTThqebx+Bol4eS
	pC/2XzINCsHZIu1aSTVd6PLrGgu5K/lDdYObnUluaFXTtGVJd+AIuNnIRECBhqlt
	3sGn3so+mnVwNtFO9te4UNlmDxeIGzwM2eZR2OW2wvLXzxF3mbgPM7yc4bjesrSo
	VXvio64AvYghFD6wEGiiEbAfDCbbxwQ8d6bvFekv5q8EkA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqfrgyfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:16:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98304865f02so2576037241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625372; x=1794230172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hya+gIi2koVDG+4j5QPeJpDU2NBaBm8cxAs4R6GPce4=;
        b=iB0C7hhPWOeseuJcHVHNqGffHixBd4wmCIYNVs1pBzWuxV4mO2OZEw2SHj4i7cesKQ
         ekKRy2hr2ASG6AYY531k59OlSpB0cKcUa59TRK3TzZ7MARfRzzDhkMfYWyvhnYXVXaZ2
         efGL6PII1rCQ0B9PVrXu43GEIgiqpjrWlNtuegQAXVMwkUEHLY1mDx76JltW0OaTNx3L
         R1SiajC9XSgHo/KYLrEsBoJHAEkCtZncgd2O3bCNpPEpMNl/o4DRFodtjvWnjMyKCZJU
         k5emVczePpy4CwTGEk/LeO//H1Rbl98QeJMsIHDIpT5OwyaUJRuijQ9gtaOQI3zH0LF5
         7wLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625372; x=1794230172;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hya+gIi2koVDG+4j5QPeJpDU2NBaBm8cxAs4R6GPce4=;
        b=LHh/iMfGs87vwjWxDzsrM8x/DrjBJ+KzkcZGbiWzvDtQgN8tzzc0qmCjXMpzUKfYoo
         eWVDA0Z+VL0da3WTdN3xAI4GiD2WNc+O7cPK09/mwxCwsUCVfy5pEnCcM+LPtuXRuM+8
         Qi4PQbLBzaffDYueoxveJtlO56T1iIhWYpf9iClinOooG8dkgjbLVA75qC+6wJYnK0XY
         Wo2RJDDqYSZeeyUXmwdeas9nc/FZ+2hN74goAV3ctoguBfmDzpd5P1NkQAGQZRFG4/pM
         jbes7WQiDiJzlm+3ZrGTH267SMtfMJ0pIQ1lkdj0GqEYuyZLgz/LdOCxdvoYQVaF24ct
         HrJA==
X-Forwarded-Encrypted: i=1; AKwUvBwJxK5v94ypIILQ0R8yKjBo85m/gV4jPRxmwbFCo8bEsE7H90UtpxatphqdUpEP1+wacIm3+2VGsOWp4hAn@vger.kernel.org
X-Gm-Message-State: APuU4Z+PbhD4QCgGVBBCJjdf8DEx9rAYRh2PsUtcotDzxjj/IllaTcb9
	wZVX12V4YcoFs68+pEO+13+Nia1i7fLbdvVmqzG4eFjwqDMtoAxhcmY+TQCwUsgRveX5ZiH2Z7O
	HGszgRsiumMT8wqw6f/1OXMCSs4sxQIQVKKoYocjSiFlqIDYTri+8iJ+eShbowQNYgWOF
X-Gm-Gg: AYBFou1ZFSJbj35AqzIK3kPNXhQW9dnnrdKG/2UjFBsZcgPLT9lzxfWud8DsQROrrc8
	BqpEx2l/it3yeVnCBUCNgg2a0vRHbYkw3iLvdgDH10sDIM8KooGQsHPN3y1XhBAbu2wc2kJmHWB
	GG34kClGX9IkqtNk0FHZxv0mdAalBZZvYjLJbTq6In06hOASbWEhPSuSWkNUJWpO9VZWOOrDdvQ
	mZYUrODMKtStohMxhJ0/EysWzaztojN2tup3AfEjI5VWRek9u6YBKvBrcCaWHe/d8AUtBucdmsa
	E8ydkUjdUOYQueGPtxHTpIvoIsneYc+iUJUnG+wrDz5wG13OrvlTN5CAwT9E1xp2WoT+qES5s+6
	bjOVfQcm47fziNU1dNiB3NGVzhhDNiDOMTaeFEMPLZmSlLr95eorxyX2N9ZdYmR8=
X-Received: by 2002:a67:e111:0:b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-7d07223fbb2mr3757421137.2.1793625372170;
        Mon, 02 Nov 2026 05:16:12 -0800 (PST)
X-Received: by 2002:a67:e111:0:b0:78e:1e0f:ea42 with SMTP id ada2fe7eead31-7d07223fbb2mr3757411137.2.1793625371414;
        Mon, 02 Nov 2026 05:16:11 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1114sm298991405e9.7.2026.11.02.05.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:16:10 -0800 (PST)
Date: Mon, 2 Nov 2026 15:16:09 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v4 6/7] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN
 support
Message-ID: <5irujcxbl7w6nvtjp5en3z6rwn64cc27ln5yrs45msncjjjfk2@znziikd3jpgi>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
 <20261031142433.1212809-7-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261031142433.1212809-7-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HMJWhYtv c=1 sm=1 tr=0 ts=6ae88d1d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9wUN3dL8otb4LRdDC5gA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: WhdbC7jKITv-oLum2KUO_HeUg-69l38d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXx1Yptoea5sHU
 rVVE50E7uqPaqIFVW4zZV3N3YGMCI5BTKMnuQjOpYr0tzMuA9DUTU5jHoFU8Fwvk9spo+aasNvS
 dHQhDNVTTC+YUrZInq3e5rKc3lV0u8E=
X-Proofpoint-ORIG-GUID: WhdbC7jKITv-oLum2KUO_HeUg-69l38d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX3GQY07shOVav
 g+9rUjlZ0B9fbXeedPkf2tJtkQFBt80/PFNHYIAWjtf9x4gWad89Zryd4448NEukl3UaPpxonQu
 quS8v58G/Z4/7v0WXowQiJSz+NafsrgmIlhwoijWTt5s1MeGP61+Hfo0sSjtvcwbUkVWeVXuQUE
 OCVBUdRx336pfGwbylGRbZAeJPiMGOMWMSid7vs5j1v5dpwJmCR2SOFcNFLchNtN1gdAJyWMujd
 ZDF4rtZBn21lh+8stsvNjWvwjpl2cJ+d/0D+D6XPj1Zc3TYd6+7zxLN0i27RJR/u9Etgfb904Sl
 fjSZOcLBdCmrBctwbL1ivS7vzSNdaMt1qdxUYScenf0OOYpmh1zuBHUIWD7i/wmfa6sU9Qlvzyv
 68vsui9KQ+pJrBAhdNxfcwcKgpa6h7pmzFKpcDggTYpWqiMabisvxWsh6VVHZh2Hh4MiPcrRVcz
 XWcp9gvUZzA+2aZkFUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020052

On 26-10-31 22:24:32, Shawn Guo wrote:
> From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
> 
> The Nord RRD carries a QCA6797AQ (WCN7850) LGA module on a
> connectivity adapter card hanging off PCIe2.  Three PMIC GPIOs gate the
> module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
> DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH,
> PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail,
> and PWR_CTRL2 (pmau0102_e GPIO7) enables the 1.9 V rail.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
