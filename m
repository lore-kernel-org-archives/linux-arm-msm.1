Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44163988F9
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788265216; cv=none; b=KeO33czZNXyslXPMo9G1zw36/rXpqJZD/jWMLoUKgjIPXgr6HkpEbTpVx0jCX5W7+IOA3kejgshWyY13+a0KY6Myt3e9k4+Bg2QniIZyDwqb+1gM2S9wgqA+H0337RrA4sNkwjGci7bTOFntmtzE+GfKUA1alpas996tVaK3TK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788265216; c=relaxed/simple;
	bh=qXg8sssEt9Q9EeWhnCnsQ6Z9yvVpjqAAzFP2DSeudrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyBla3LO+Duv8dzHi/hWrC0qhKM9chAI8QPsxPuG2sHrG0VFpa1s+y5QgEmwOJ2yO8yb8SdF4ZFBQDdqJaILuFv6kcTB7zFz1wEkiypDLVRfppla80DqJd0CjPOWIWiUdxFzfxASNUL64rjcORfonI04UJa+Q6HJ7eu6X8CNvFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lWqn8avk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRcOQcf7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lWqn8avk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRcOQcf7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJCXQ3406516
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 12:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kN2kJoz7hO2o7NskE9YevJ8bM5MarrXbwTiIKjarUso=; b=lWqn8avknas80M0G
	+rPK9sTcfUabALhvPkswOLG5U4wgEa/xDpbFr4/OSbbYdm1/sdLbJ+PWAYYHXcdC
	LOVA/ADi8OIEXBfoNmGYPRKy8VouuGJqcINCVxuWGoJURicmBa0DTMGUSOm1ZE+1
	V8wnst+7Qg1T2CX+em6qE3TIabME1mBGSQB4szoe8PYVbDcTQ0ObMT1KUx9sMax/
	Ez+WD1ampzDU3z2QrLSH2VJEFiMHqN4kk0oVwx0w2EJSGJs5N0SonGfS+4iju9AB
	UnAINYs+ZRqJGKDKayoum7aJiXLQEI/ICffGTVK2YXL6ZxAbSS7w+AfX47YgeoM2
	hA+GfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu1fpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 12:20:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so72303585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 05:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788265213; x=1788870013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kN2kJoz7hO2o7NskE9YevJ8bM5MarrXbwTiIKjarUso=;
        b=ZRcOQcf7byOjReIBQtpzjFZXIaSxr6TUTj+mhwh14Y3yuSnNnvOduZrp6xQglaSnyG
         3IgIxFxYd880ogejdXlUZ5UYI5K6VTtCVZ81ck2v1vhANNmebLgeY/toDBKxM8haFwcd
         dXDVkKoYOpLTpXOUkb0F3tSMnDPsXhiTODfO83jj9NlPBNYLnqg1XxzAq8s4X4bzK+WN
         RvSy6yhe6OlTQ9w4pxMmD0ucNveY0eXbRqTfbUNboTyU+7iLmP9tQe0x/nlr+D1atiTk
         VbIlyyDS/C1k25dqj/7DHelMdijmMrvqlc2VUwrMV+GLMyxTrmVX1C4WPlYmI5xASltS
         djeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788265213; x=1788870013;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kN2kJoz7hO2o7NskE9YevJ8bM5MarrXbwTiIKjarUso=;
        b=sDPhrv2ZS+8+fM1IZ74sfWyTa3X3XNtAN/CcPbh5Zcyc33NGbrLVPmjSGhvhhNVQVG
         PuA7zOhzXWx1QHq1b1qb/tMJzI3pUL3BZyGv/FQIpwLvYinFrt33xGvDey7bhCtkQrHB
         s+0yxdLphCh3qFK4YXDlLF3nutWaKpjLE148H3adCwMTUYq72I2aXM2EahGJVzlqZujt
         lEORevyFpJ+XJPnnnBn1D5UHhovzKpHjsWRYRNBoDeA3NkmaKpLB6F8Z9X9VpJwIk/jm
         s9Z252JVg42dnygp03Y+5TIigVrBLekUDe/EE8iNLSeQinOneevaNb1xAMgQN3de7DyM
         Eosw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1aP1fW45MRU4M79F0YREYg+lMQtAG/Y50ROcVWbeZX9e/NDiS4ScjsNn1vSslg/n0LuImNoyuIy2d7z2h@vger.kernel.org
X-Gm-Message-State: AFuF++nEqv54QhiciANFcdPzm/sWU24c5DGJAcfHYzPlgtWmhFoGpQ73
	ujEmqbZ3i1oPemc8ZMMjsBcHEkb6rAdBrdw4t6zNMxVNBHRL3iA2u/ndTPfzQtlNIXpn/ihp5+o
	V0OqY7PM109z34l7wkJeymDQj499QtZjKLHCye/qynnfSk/xfnFFRV7CuiTQy0++GE1VT
X-Gm-Gg: AR+sD121QBr/J0EN4IpQZb7WIOaU4BcsTA3kO//nO54fLKM1eOWgr+z4pE3kHhNsGaw
	WSSw5YsgGs7yljwHN1spss7PHEfub/YbqSVgQwChg8h2uOe1De0f0Xd98Lns2v4wsEHdkDbM1Lr
	L8SODSidlXSxnSA1/xPrVnas5zA77AWQYZxaKvcEn/dJ9NTSiZFl+fYrzn0gxjBUO9uCqSwxblj
	GFP51JMJkHJ/smWSXWzRE5TH7aSBjsGQ3qhq+FEVftVzrtdJZAjaxDUcfSOg0ZxuTzKWZV7lmHv
	STYwHd5SBOl8WBsTuRSLQ9RMdjc5ip246pz1GWE7Kb0s2XugqNPijUHhEGaF1Px0Ov9t5qiZ+W/
	NRBL10/wKG3WAq7N7nL+GBw==
X-Received: by 2002:a05:620a:46a3:b0:931:23a:83ca with SMTP id af79cd13be357-939287bdc55mr1477161885a.4.1788265212412;
        Tue, 01 Sep 2026 05:20:12 -0700 (PDT)
X-Received: by 2002:a05:620a:46a3:b0:931:23a:83ca with SMTP id af79cd13be357-939287bdc55mr1477151785a.4.1788265211504;
        Tue, 01 Sep 2026 05:20:11 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee2872dsm590060666b.15.2026.09.01.05.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:20:10 -0700 (PDT)
Message-ID: <b4dc8702-212e-452d-b0a9-c9816b545066@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 14:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: qcs6490-rb3gen2: enable TC9563
 embedded GPIO controller
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
 <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-5-dd9b80738e70@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwOSBTYWx0ZWRfX4CTYt8OPGSie
 9pm6TIauJmD+gwjgTj1UMR+8EaXtmUSqIKhtDvJ/MW2OOa6r/i0++hPil6MbA3oh5BrsvhPSaMJ
 eDyRjCijAU+Yc+ZdsYm1P1xS+SfKOHgAkVzkC397LLcHPtGHY/N5fFVQZpoUSXe1Uuc8ciEBMc0
 406JvsEDclYCtZ+SiXJ+UoYZg7I98qen12uDUj0VjprHxKOiRUpFQGrTJ/th8TBR3gw7JWLsQ4R
 00aCwyMJg3ZSkIncYSeHz2y1cbDEMJToZydCa0LWmXEel6g5JpEAYWgetYwxmB1m2KKh+jS89D9
 T0flMAj8GURSN43O0N/tzR15+K1ZGG/m1ocPicz2khbYwleK9PX2yyq+VeaEl9Rt19boUUEKGnU
 t1tOOtxsj8/aWRl/pFTMFTKhf3Q/ghp99lSeClmiPQ6cklvsDcLFSqb5qzk5auTU5fj2ptIUzrm
 U93b3i/eS59GIaaWMlw==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96c2fe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=fFHDuP4XVuiI0RsLl8oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwOSBTYWx0ZWRfX2gERQWR0sQB4
 UTBUSllC5bqjc9JrRxzWHKdH8ieOQ78oNclpoF7rPkk1CNUTv8t0RBzV0cJiWZSwpNRMRs++sh5
 GElAaLYqzraJV93H7vlrUpajbrWFYA8=
X-Proofpoint-ORIG-GUID: QO8UDBWBZYC0gC88jaajBSZ9g2Hrzo7g
X-Proofpoint-GUID: QO8UDBWBZYC0gC88jaajBSZ9g2Hrzo7g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010109

On 9/1/26 12:27 PM, Lorenzo Bianconi wrote:
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
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
