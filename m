Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3639D3B4EA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831408; cv=none; b=uyhmuSU0XR4yarQSKdYbzVkihBubOH7ZPyGyNoeWIzxkOxIu/errvmXDhggQQEXYdRSEmonS9KtQuC7GmVthNhUugwKrlytOPAdE25NvFoLBlOuia7O5N6SrusSmdIF9fXku4H7UNRty+fVM/6M1hzFmLu2M8xVMYDeKi24MJtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831408; c=relaxed/simple;
	bh=+64KFNSGBX7Vz/6dKUW4q2vsU2SoIR16uU37yUrhX3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GbSInjNIi/etGFJcJyLXJeDZ+/yKv205rWmrGAk81zz5nQ3p9moY8KrwPd67lEIJZtEWbAsIhIrzTOlcnIvPHRncP+QdWNvrlB6vR2gbmF6aWxm8/IdthjN2mpfP3B19q3YvjNDGHU35hyqGEJsgJ0R49KoVF2SRrp2NkOA/G3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRqmmG10; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXT9JdyS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRqmmG10";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXT9JdyS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CHujCU3040371
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vOEKkonEgbkbhRs6JRGz2EJ1
	ry/BUCqhg/c2vYmmoyw=; b=PRqmmG10IpnegtQtDCWy7NlbwqG4C02FXCkOjm29
	bP0zi3zxx3LzXRNxaOYU3hZzhplZctalnjV4yBhP55plnhPViHQ+ytNv5pbGHoke
	rFo7luCURR4B7jvLXXt4jxmPtJdtUsCJ80cJjxQJq1cwJR88dIBDy04trbmBQbI3
	GoUfCzFHZT6ClFC+Nc9laB1xAW7LYUii6P1x00Qirtem1Y7Aq7PhS9xITbdDjkcG
	f9TBiT8rrL9vGunvsAUYYXsPpgDbP/7+aZ1CilBAOhsXLGvMJ3T4FMJsJAxYNKqs
	g3YaAcA9e8sYl4JtajGxa6LJPRo/djTP013nbYqMVotzkQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h92jjrvr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 18:56:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so6211798eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 11:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791831405; x=1792436205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vOEKkonEgbkbhRs6JRGz2EJ1ry/BUCqhg/c2vYmmoyw=;
        b=KXT9JdySQM4OTCyrX7kQhrBj2Hu+uEHGNNxTcJawZhdQZhZ0jC5grQCbd5m9dw0kTv
         GUKYb2aKbk1C9o5T7mTw9rIPEoVZbxgj874YYWlS60QmMp4DQenbLVYY5J4lQF4IvSnP
         kerEQqnUUcO+o4fmCYPPfgkXRvWr8AvpCD1TViu52tyC3gc3uY6LW5rxpApAz9FM0BCK
         DHAWerFW5285eX8YSPhqUegwlbBoiLoK4XT6wYqCEiC2Zs9LnnjYC3gk1eyjuTDArol6
         wr/rLiDFcL8MfAOw29PuAeQqEAiFkuYvZ96taOn5sa7cSzIp1I5j4Jp4Jlj5KadtRsaL
         cuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791831405; x=1792436205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOEKkonEgbkbhRs6JRGz2EJ1ry/BUCqhg/c2vYmmoyw=;
        b=VygGmxYnRupKunBDtDdXMT3fuNMFJoVBZpPEyfefa/R562zTIhQoXMXTaNqHtwtykr
         hcLWnhI8LeqoxQaeYMgo6Wus/m+dmtU3dktgIcJ25Kgmir/SmzCW/cYJGYF7i2RfbUSh
         f2IUD8YxWrPZo6oOtPJGaIsq7RHTrE8rGjUsm6HUHJ0Pr6+kUIZY7AeyXaxIpThPjYSo
         JHfnEB2yNpvR1OZbxgfrRzXmR8U7NKe/6/BFKiJ/p8iDTVFXXPuAf/v2DHm4N+F4ybXY
         yge5IpMHYbQJnU0aZvmAtH4s9xYFk5gOQmmHVTedlmHFKTaSC4Fk3vpc/6+D9MhPjLFS
         SFwg==
X-Forwarded-Encrypted: i=1; AKwUvBy/XxuNB0ROi2K38hBGfIRyizLzCVEGIYXKaQeYFZZ8tkacpGMj1pN/udPra4IeJCk+qF0BbQbz5BbftD7O@vger.kernel.org
X-Gm-Message-State: AFq9FYK/vyRI8WqrWSLnn55wBVTPDtQzqRrDfS6rT/ZsCdgBigMSyquV
	OQ2pjt5ekSeyWGHx10Dj3VGZ/15zQVLCl7J/XfAQJhjKSLHSVvrCt5B+9K1qqBDAEbshfyWD5Pq
	6SWJa4CiuhWwSN2R2+ABLR75oCeEu2TtJ5y8jW+nXnTciN0xPOafqKXmaYyWFAkdJtJv0
X-Gm-Gg: AYBFou0koOaynL7vCuVMpHj0QiWJ9H40/ZeuSXVJSzWW0VYsUeUQXX6JPLl5tkPknbQ
	WZ1v2wXXna0dbFaw6G7/s6+/dVpIGMwlGRff/AlG3FJZFWuBTdrwf8qBJupoSdW6wS5pZsP426c
	I7XnsQS0bcFnFWC4eqCrPFWXvo31cIs0d36BQX11QB2Itop537hE6wYNju6Qnl0kXPHsXrx/siH
	u3HCoF209T0Eho316rv3laVPHHE32OYHa6xZ8D6/rC6i/AXaQSWWo5l4yCMvEQ+aBOxGcmvXaWU
	gutTRsLdncGQMXxfUYit0i9pgSz3LpB1SlMtGLJBn2ntrYNH7kle4t2W/Pr+yizflUMu8PYYHEY
	DDadjWb/B7aOWyle3V4g1TOep
X-Received: by 2002:a05:7022:295:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-16a5e49fdaemr13126147c88.12.1791831404782;
        Mon, 12 Oct 2026 11:56:44 -0700 (PDT)
X-Received: by 2002:a05:7022:295:20b0:151:6e80:baa9 with SMTP id a92af1059eb24-16a5e49fdaemr13126117c88.12.1791831404198;
        Mon, 12 Oct 2026 11:56:44 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm37485490c88.12.2026.10.12.11.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:56:43 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:26:36 +0530
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: defconfig: Enable LT9611C bridge driver
Message-ID: <as0tZM1OFsL5Lzld@hu-mdsor-hyd.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
 <20261007-master_lt9611uxd-v4-2-9986704e2a7b@oss.qualcomm.com>
 <701e5e45-f607-452d-8223-c987427fb34f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <701e5e45-f607-452d-8223-c987427fb34f@kernel.org>
X-Proofpoint-GUID: MHkClMkeKgnA0_7oozl2c3iqeujeLat0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA3NSBTYWx0ZWRfX+Ma2fd9qvrEb
 cBFXxbftaJtCsSb0FoaCDjE5JccNDJeB/Z+UzavKfAOvIp27ZDT2vjPE6iOTear4nOnBkfEreKE
 r1/Bhno33Y/XehaqE/b9kTYgEDgEMLk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA3NSBTYWx0ZWRfX1W6N7pWAd+ct
 T0L5mD4wZvho/IcryM5DnWJq0gWbwJmcZiVoTzLRBqI4jgss64yuiZoH8GD9JLVCC2FO5kO5Q4x
 p7Et42OJjOTmruizeJdKqNvCMbP3icPi04i8E6o4+bw3MKSV7XAc5NX8BqNMNz88c7oxuI5v5e2
 dhme3limnZnB34eCXdYQR1xhNvBYwEBTGlOwCGILx3jEuva4/EFzrtWdfOKglI6wQVF/VJOWQOr
 ScbihWmM45pX44RkB+7Z8nm9UWwmB+/CZIR9WC7pF0ImaKg6VBZ1IEFp/vsNajSh2FnUX36iCXI
 5jvvY8G28MJcT630et1hh6EiTQHs44Wgvr4YpjSuBSQssqhmn2b/IYXHRFhS74jC6YPpQCIPBR4
 2dvlxtDL6uYTqkqAz3hqN/+sRIMuKPTPBPXGU0j0bQQN8akEGV6X4XHTsg/XxddzXXhJ7E9rqS0
 nZLsDFkHBxoLVEP4FbA==
X-Authority-Analysis: v=2.4 cv=GfKCDgXL c=1 sm=1 tr=0 ts=6acd2d6e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=9ZJ6AgzfprORt8VdnxIA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: MHkClMkeKgnA0_7oozl2c3iqeujeLat0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 spamscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120075

On Fri, Oct 09, 2026 at 01:50:39PM +0200, Krzysztof Kozlowski wrote:
> On 07/10/2026 14:51, Mohit Dsor wrote:
> > Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
> > This driver supports the LT9611UXD chip used on the Shikra IQS EVK
> > board to provide HDMI output via the MDSS DSI interface.
> 
> Same feedback as v1. Why every second defconfig patch from Qualcomm
> completely ignores the fact that this is not a Qualcomm-only or
> Qualcomm-specific defconfig?
Sure, will change commit message accordingly.
> 
> Best regards,
> Krzysztof
