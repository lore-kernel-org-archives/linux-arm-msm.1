Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1823B71A7
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790498441; cv=none; b=cjrx7WYOWoy6sXzR5m8xxeG/7qs3wpLL20wPImjvOuiaGSvFyBuBLsGVT0Zjr42Hd/daEip3+NwrB0b0gvgifGiSuXCD2Hn+dhYNYIlLlrggpONHIu+4olmGZgyleP6sIeN44VYVjcZ+mf7JeOGe2wBIYLmfjXHppZoT5MTNm4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790498441; c=relaxed/simple;
	bh=E7JEhW3K/4jheKK7XYSrmJv6OJRhgoWWWDlla6d2uEg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tlqBXwgQ5AVTjuR1y4ElRGxn+NkyRyFu/OcsYbO44+ulQwHqv0aJjOLioZR0sSz830anvXXQ4rHmVn4wQ3iXLLVmEGrZo07TL17x85mC3A2MH2WDftk/1g7reRofaWOQYo5zwa7ob/mCSAMdfasVB+Db6g5YYC1bDsruqBIe4D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aEgYD23v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZX+YdPA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEgYD23v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZX+YdPA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QNHI1P1478410
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 08:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6XqMK/ERmVKwK7Drj00ei20mLMHsujEDPrurnafjbjA=; b=aEgYD23veb6enSsJ
	Uf2ZFzLb39vz6dtSjbphEotJ+nZLaktoxTICwM28dXDXY9MAQiTiGuFiVB0/p62+
	JLq+hZ8MnLOPZ9qViGTOBiOi4nk7obS6KVdzxUJ8+O3aDk6n0IlF4LftnbpuJSHS
	FH9UFm+Oxj1Lo3q3HH+abTgJg3nj7lVNHkluv3J+2VnQFvIL+Ztd4stXoM+rbcJN
	bDBjwypkAd1uInB5aAB4NQ5itEcc+gRqYmB/cImzJGRW8qMXpy7YwHIJeBmktH39
	bDWvVzQEJem49K8I8tHm4cBMgw0W2pj+rbG5Z4XpxqJiVXmKwp9oJP/Wm/IzWlJ5
	6vquuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx526jq3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 08:40:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5c205127so151484985a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 01:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790498438; x=1791103238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6XqMK/ERmVKwK7Drj00ei20mLMHsujEDPrurnafjbjA=;
        b=hZX+YdPATe0E1HERCAL1KtwpU4v96oLFtrG6f89XBC0eUDCtIJvNazyeqI2Kp4GMrH
         MtWHOMZLxg/UQ5+QKklA0oA+83danupLF2T/G+aOv/rawwt5uXEh+Qq4PJrwfxLlHq8c
         1qWFiIq6Ee3ajNdketQwxzJp0afyvpd4Blqm/Qv4kudJloBH5z3gwjzhGG1A1hgSo/5/
         sRhVOUijrVUFizAmRXNPETfP5BzSyCWnSYc6D7BdPQT4cDbrhRGgs5SYgQJPNAteejb1
         j3uQr+vcfncERAaxq8Ss9f4ferJ4suQQaY05mWY97zE4NLi2LZ8CyZkZyM+uwbR7Tmdk
         UtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790498438; x=1791103238;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6XqMK/ERmVKwK7Drj00ei20mLMHsujEDPrurnafjbjA=;
        b=BzuN6gA1ZGOgrWjr7aZBhIJA31/4YVSIxE/mJUxbjKH15q7zwJEFGsyyd4/cQf9NvO
         xRsaRxk42IhYeeTC/REG4pfmbpkj97sJFs8gohNIAkuJsZId3eFGNRfNcXGouDEOo0Q+
         0YK6J/W6OvIJptXITSpQBcehpy1g3CD3CRkB4fDQlFEkLlVhpHN00pkozIfOC7+y0n5Y
         ESLdsbE3814htaxyUEe893gOuwbUUyCAwHV9LklR40uronbp5g72qSxLuGVdGRkYqDtj
         dWRw/bPdEdawSICWDoRngUxL0FLmVoXIuBXFBUzqG7Hc3BZm+luMwzY4Gh1ZQWSslueJ
         dS5A==
X-Gm-Message-State: AFuF++kvcDvsnRDdKuTDfnpcvsWmgsM0njxJh6Q6aLwTOOnxBV4wOtKj
	Ffh9PQN8Ohi4J1ZNA0dKBWWIvZOQl0l+m3xjNgRAxP3sbl0/9R0s5/uVTw5pEEYqxK9+E9t6Rhj
	pmuUVoGww1oZGS848QTiB306QkIWFZNVIiEiTX/XshWd8hAsWDz5bu1X2DdF4ovu8+yYt
X-Gm-Gg: AYBFou3aGR2uBXPyjyU/LusBK5e6f3H0wb5iif2AY2ZEiLQfPm+UC10ftNuBl/6dPZk
	ZPjSvdlUgg4f8p3NdvPDQj8NCnh4Mgtky328ClnBj09e6MXav+3fWIaikYmB4a2jbALZisuzn+R
	O8G9nYmqLMp+09dQxEqyqq92fRI0zMXZQ+IeBasbQj0nrWioyr9AlEO5PlOmjXTLm8sM75uBSBl
	T45yBBkoKJf91XLRwDhgWkDl1FeNu3a5C7bBg+DZgJ7YKvUoOYwPJPrx4SfHIz8zzw2JTW50ZL7
	pX1tDMaJUUjJeaWz1FUgogXE4cx/eHZgVwUe6JFcoqFGRUBFvj/PvlCa9VIjxcAyjB2RitbBHw3
	ZQjNTpF5qwyGf7yUjbywDOH2mczSCb1fSRIg1EpDKSq+PZEu349x6xTsgclq9M5E52RM9T6dCIz
	DWowPmgRyubvQ/YO/1Mm/+MRXaI5MTma6L0grsiZJE9HGpqhjbeZtw86XntqzwtlYfCA==
X-Received: by 2002:a05:620a:7010:b0:939:f522:b2f7 with SMTP id af79cd13be357-93c43cd31b9mr1423864085a.33.1790498438255;
        Sun, 27 Sep 2026 01:40:38 -0700 (PDT)
X-Received: by 2002:a05:620a:7010:b0:939:f522:b2f7 with SMTP id af79cd13be357-93c43cd31b9mr1423859585a.33.1790498437693;
        Sun, 27 Sep 2026 01:40:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aae5dd8badsm2910285a12.22.2026.09.27.01.40.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 01:40:35 -0700 (PDT)
Message-ID: <105d1f73-5334-4ae1-8267-1927f8691a06@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 10:40:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v20 5/6] media: qcom: camss: Add support for PHY API
 devices
To: Liviu Nicoara <lnicoara@thinkoid.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Felipe Balbi <balbi@ti.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-5-dc244e124e71@linaro.org>
 <20260925164054.25831-1-lnicoara@thinkoid.org>
Content-Language: en-US, nl
In-Reply-To: <20260925164054.25831-1-lnicoara@thinkoid.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvS2kO2n c=1 sm=1 tr=0 ts=6ab8d686 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8
 a=KOsBq0R2AAAA:8 a=Nv_Mk3N-tBtoCUosGXcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=p7IlednmDx7li90OXeev:22
X-Proofpoint-GUID: cqtlJ8Pxf1v9eY_y5iJ2eOQ3yZHjDlN8
X-Proofpoint-ORIG-GUID: cqtlJ8Pxf1v9eY_y5iJ2eOQ3yZHjDlN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAzNCBTYWx0ZWRfX8KAnqfw7hKle
 JSQmZVB3x3hXfKv+LxAlXJu8iG0Om5IZhv4hWdfyw7HEwh43uv91jlG7Za8F4gRQgML8ZoGLI8W
 KnlREmEyFYPTgGgXEv8CqufWfOc36ohRZyfHXeAErMPUwnWHVeBhZ6w/ujnQ0HKo2OMk+Kyv2ir
 V3WenLsUGvVnJSt1SxM43baUE5dqmWCfsx7y/54RDjU3gO9yDflGCgZxC5fTF5/FICQyflFOf1x
 eVvG2paA1uIlTn7/kQ2BqiPQFKirfWf+L26rRgtRtzjTjyqcunFLpKMvlGKExBxZNgUfraDDzHU
 eNNFkeIcRJw2fyU54+6EF2OiN1klDyCHF4gCZs9na4HmdVOn8lEMFfONLwfdJhPgczbiYbaj8VO
 BgNAiH61cm0BbwK562XHqEVeZKlq9XovSixid3KqJJULCqEE6dkUHZTtYupiyCGsOG4GgcVxAWo
 LolwtW0s6k08Jn/fcnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAzNCBTYWx0ZWRfX9jWFhe0rz/iW
 f0+6RHIrhMm+e4rMuojIac0KMIhPn6oi+Tt193ABVE/7h1wxfhkypBsXuDj8TFGceMxUag7Mzjw
 AVmeunAel9KJ8Bk3zFOvTuW5Fa61fdw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270034

Hi,

On 25-Sep-26 18:40, Liviu Nicoara wrote:
> On Fri, 18 Sep 2026 14:56:40 +0100, Bryan O'Donoghue wrote:
>> In the first instance the code will try to use the new PHY interface. If no
>> PHYs are present in the DT then the legacy method will be attempted.
> 
> Tested on a Dell XPS 13 9345 (X1E80100, OV02C10 on CSIPHY4, two
> lanes), with this series, the CSI2 PHY driver v18 and patches 1-4 of
> the x1e camera DT v7, on 7.2.6, plus a board DT for the 9345 (to be
> posted). CAMSS picks up CSIPHY4 through the PHY API, and the sensor
> streams at 30 fps through libcamera's software ISP and into a browser.
> 
> Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345

Thank you for testing.

It would be great if you can post your DT bits for this upstream soon,
then we can add them to:

https://github.com/linux-msm/laptops-kernel/commits/qcom-laptops/

and more people can test.

Regards,

Hans


