Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE3C346E55
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 07:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852090; cv=none; b=JW1nRw/RGCC5Q0mW7KparN1YmTya11Dn5Ed6I8gmvMsV6SXiXHBBt5okEP1ffdQE43bWccmZNfytK5unXbeNj5hmQYfBYN8iQ3N28LMjpLj5xvneaAxAV74GfBgxQxO8jiVxNmYNMMb6sduQzsIee7jz50fUYUhHBmY+yFqjyM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852090; c=relaxed/simple;
	bh=UbArGawaOLt004uiQzVxVKoD0CYmXsvOoyStHnCjaBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lH2W8irTqSexikgFGmgxgPpbpuLBhXfJ6uYJotxij+FmpaBxSGx/r3e9gM0gfwx+k1jr9jKNzgLJuY2NUiCDCNocYd0NhSF5qCwXHQq7fTfiXCZ2y3jI2EZnEI01jjBPQrroeKE06CkQieBuGbGVGawKn/MdYpVXCsw+tSNE6lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M46hdB4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUTPpF4o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M46hdB4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUTPpF4o"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886Lemw3299172
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 07:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CT4nJKvnmHwXrIL3UMrQ8SXJ
	kJUib8CpEc/1U78sn/4=; b=M46hdB4nERfHRDmec6ezX877heZmliZM8niN4dK8
	NxyNFZLj1flK58vXQMnYrRXusgYM59w13QMc9YZ8U02VsVHYbbYRIhcBk+rntBD2
	z/aGikmrhBM+NIOuggGJY5lkTfWKhc+kGFUL7s8S28EiR2PTHQFEmsh7JODngCoX
	iPBN6tCD8/7R9DXd2u4xwlN9JU+3cWkZouJnkBPi95pYhPYfiJSQUVBpQ5rk1LSj
	2HX2SAxtgKXguEiHgTVJr51Og5+A/MiMl35hBPcn+BD0wa8BaAHzo+Myf9yMCuLz
	hJ67l1Eg1h+YQfgqgFNFRGvUIzZcwTfsHVIcvvfNGkqVgQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0p8pc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:21:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939a00c45easo305365185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 00:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788852088; x=1789456888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CT4nJKvnmHwXrIL3UMrQ8SXJkJUib8CpEc/1U78sn/4=;
        b=cUTPpF4oI/6HKS9ArlIDEnjHdvi8HIXnDq39YX/i7cU19hHGrPR6DVBY6FTIOPFR0F
         jjHhLK0up+PvE1a4QeYvBsQU7/kv8nMBqVhfrY+AaQD2l2cqso4RFycqZ/9rSaSYOx6d
         31fD+JRUsnvfFXjXzA72o5xqoFbTYzGQS2ZRQBFEnaTZKysUMBZmNQSytvvZQ9E0qKQM
         BrU/Mor00Ioa7Q+oyYO0X6Mz5rGtdULF5hVi3Xeh41JmUbHzPdhXDVvfIGbm6ARmfFDU
         4s7iK7ENCohc7uyZitL/GshPqKHW94ILTfoK8G1rXrMrvwsGL+zWQfMnBB/v6dxqeTUT
         VEVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852088; x=1789456888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CT4nJKvnmHwXrIL3UMrQ8SXJkJUib8CpEc/1U78sn/4=;
        b=RXcgEiQVtttVNRhgxC11X02xA7Y+0VKM4g4X4fJO+iQENzVnCUz6OlMhWfIKPqTJpZ
         daiNSUqoKn94xLRjun9ifx/oPd38XQGvjjLHdPEDtR5ok40yl9vzIH4hauZC92VV7u2b
         hIwrT+M4wfO3R4HJdxF4E2hg/w78lRQ5yLo2m/z6jJ8zvOqWGuztwnYo6Pj6oN8QBfwB
         WwDukBY/iD9zLvzyO4bH7yyyMVxDnHVOfRfD30ZAnP3xiEZogZokiaNOfQbteH+1lc3N
         TEr8ZzFpOdF7mDgXSnoSA0SuX/SE5LqzuJf54zUYr4JFtikvhWxy3Ml/sCfS92EjALs4
         ObDA==
X-Forwarded-Encrypted: i=1; AKwUvByiso28Kuc/XAsNSFgjQBxYKa1XPRfCU78CGO73iylGq5fr7wybeG7UaTdU2Rwv72APuzoj9jYb/I8rYQpD@vger.kernel.org
X-Gm-Message-State: AFuF++lETqnw4lZYYD8VCPxOv++rwOJD0XgmhPwJHTKQXGDfVrK/xR/Y
	6EHdc30gIdxFhf+vPsZZm/Xmi3Fo3go+mk10dXqu0owhm19ZsYlMMzIivBw0yqS6MqVGD3KDgs3
	i+oZViCw5+JGTop8d78jHXM6dhlexUa++wi2sHiVK7sVeCmiLE0Y/GYuZ/shtaGF24CLF
X-Gm-Gg: AYBFou2ALcdi6egf8K3sl1ilGcWlyffZNjtV82Z2nY7XXiyu4af7hlybnw20yBlIMgL
	RHGDXW6Zn73JKQzlWZaKwUUnTPRs6sKvCKV/LYUpWvzeeMkGeRT09vorN7jX8TXcoJyt65JFbLX
	Gaik64V9W6QV75+U/NFeQuDPK88sssCb/FP3U4aO/5nFLkImGI7EdUokWneoD/0amgqKJk9WxCX
	7kwG66G7ZKxo20SaOvdUQaxHaqRY1IPwZKCiVmpNXAJkcLPcmdXK0B3rDe+J83ahhx+V+2BPB3Y
	qX08093i+rU7SVZvVkOgbX/PReyvw2VUgmqVywyl8OkxmoGfu8sfmGoE4GFYGdVyIsCpqXZEK5a
	QnSoOBk4RhIg=
X-Received: by 2002:a05:620a:4054:b0:932:ddff:123d with SMTP id af79cd13be357-9398042e263mr3035262585a.29.1788852087760;
        Tue, 08 Sep 2026 00:21:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4054:b0:932:ddff:123d with SMTP id af79cd13be357-9398042e263mr3035257985a.29.1788852087230;
        Tue, 08 Sep 2026 00:21:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm36575044f8f.24.2026.09.08.00.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 00:21:26 -0700 (PDT)
Date: Tue, 8 Sep 2026 10:21:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 7/8] arm64: dts: qcom: agatti: Add OPE node
Message-ID: <jncyxiupuqadcasf7te2eugg5jog7yg67h6oilw57q2hblnz5u@uw7jbabkauta>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
 <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-camss-isp-ope-v6-7-6b915b9c5131@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aCisS4B50-zz4y6VKEh6PXTZDex92SFk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX0GW5zI5heLNZ
 qZhV0Ng4TMemAXNBNQVfsZ01LgeMpCX7K6AXSw0sllmV2mrZ9QlrZEV5ospgmx6kYS4hI2jfHiR
 GRmdeOqtZiaoJQK//OwWPstinRYbPUY=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6a9fb778 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=I_ukrOqQsWpVYGr8uL4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: aCisS4B50-zz4y6VKEh6PXTZDex92SFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3NCBTYWx0ZWRfX62rVknoMfA7E
 TiN7ZMCNyVQAxVa4fAmuePzfZz7ouDsHLmrKycLzNpnWalgVcjcomvab0pxiEK7X1CpOxDj/B3L
 6b84X1IPYotKk1dchEeaR+oHuuxeJsaaAZ/EPgMySJtWlqo22YWDclkLzL8kUK04VRDQ3NReg9h
 MwfgIWcdNfO0nn5EVtaJxltqTdZP4UCLQjwE6YNyV7lwh/8ZY2X6qxUJ+XrpyMEdxQjnzXnBD2G
 cddLeVKfdfe7Tml0DyBWToZzi9rZ+QNkLtBOr6kytwINOwNcVfAbVzocTrtdmOsVTmf7BxOpeBb
 I0idbxY8f/GJNrgqL7DkolNgLQoydrYxAv3iwnvi0bj8PXCdmhcI31DoED5ugHBI3eZgr4EcEIC
 /CS/jzW/uSq17HkWYwonDUYBj9aho3ZWN3QonoU9U5/31FGqzZ6OvreAwnCrIchLJtyV+G+YPtp
 Nsys9SmA/1MxmueIKFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080074

On 26-09-07 12:51:17, Loic Poulain wrote:
> Add the Offline Processing Engine (OPE) device tree node for the
> Agatti platform (QCM2290). The node describes the five register
> regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
> interconnects, IOMMU mappings, and OPP table.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
