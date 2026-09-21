Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC3463B8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982115; cv=none; b=XgMiN4ZFqM7E9ieQ807o+eC8Bt+WfIJTjKT/izDcDjnB+cho8bnLzXnrPu69HeaknsNn5Q6pq6yNBbsaLqR7Uskj+JCHFkirYj2XgvfHvz9nyyv3rOR/LTFqJUS0oQLw11yVJbOKgmCt89Sh1BgcVnytrhP2Kphxz2ZxxoYutNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982115; c=relaxed/simple;
	bh=NgDlzEiS0NbsIJziEpI4M8ZIVcA7puykB/WP9m+iYJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEOltKruGonjc4e0bcGHg/yjXhPrIAV4nMqEHO36wYeTs8G7tSIpzDWguUWQrWQA4hA+GR3QYt3SC1zEMfbnbt/7bzcTwV2DYzAb8M/ijmillfSw0LYdkeawfJchA02W22d15NBb5sd1IpLeIpAZC49QMxub7dVyO4Wy6JUtrwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C6lpFupq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X90EbTPt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C6lpFupq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X90EbTPt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79v3N1624391
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GLhLHWDFh1O3xJfyugwviPWr18h9lNQNghkpTPHNp/Q=; b=C6lpFupq6eIsTgEz
	AxaRqx2vny38HtwLqcSsrou+mjtaqfEjUp0xWzC9aaW/IpSQca9A9qILrN58now4
	1zLyh7b1uHQYhE9Jz7SoKuVerVoFSAV1sDZzDXfQKXWXaxRqbRY82344EoWVf+Mh
	MSjWb2Q0saRNuaqYm2c+lrjcJb1JGvJyjVsBp4utM+TAsPpmIwoh7KPkQGvXaKM5
	lB0oNFFp1Y1onyo1TObIjHY215VwRD/x6s0dxKuTSi36lVNAwzFgFOZW6UfYcYfm
	U1W2uN4wuFU585zhiPoV5qWLwDgumc76OUUkSqyG2nDlOU7dr/amn8Z0cgdq6yJu
	eWLscg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wskac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:15:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2dd53f2b27cso35460865ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982112; x=1790586912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLhLHWDFh1O3xJfyugwviPWr18h9lNQNghkpTPHNp/Q=;
        b=X90EbTPt1c1R0JnbUzYjAvBJDcxJq4CoE2yGBrfFX8crrDW3kNrg/FOoc9L3MJi5GW
         o62GnJB61SnGo9x+nejfionNY49Mux1CVwCZ8J/Apa2Clq7Dx3itaIGEcvo8YG7kUk7S
         p2IzPwjkncVKkhDRbQQ0QSzB0kpcl3ORLU0jSlF61OtaKIDclOpvibobp1vRFGUwCGiq
         WMMBOre/tYLA3o4vnkI24UqlGilWB0h5QLUHgQlFYwfxKThFciVz5ZYe3lVTSFjQSO7E
         mQKDcD7KZdRsAAyLP8YCAlcjoDUPhaHPSarutsQI/Oh7mw2ujorpfAVNjeqvqQcRQMKV
         D0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982112; x=1790586912;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLhLHWDFh1O3xJfyugwviPWr18h9lNQNghkpTPHNp/Q=;
        b=CqWiWMrQH3V9qXBen8IuwCLyuV9ynVZcaeoNJ2HFDqq8O1ER2yc9m9f2q++0kW+oxr
         JjLwupxe/0eOIJAqIgqDiHHtbnT3FVc+yTPo6X/ElE4bLUp9jf01s/aYbLaSDnwPh39L
         EEpqjEIyaaBypgrxR3xBJIhOBoUfyxJdI9Z1q3ZuYmRQD/vS+FUSa8S/WwBEbhHjFsXY
         CLSWwoqIw8AUZz138mvYo/Lp5OdpVWHUS4Pp6Kg23adnOwQDJi7FhKq37BmX8jfUfGBY
         +ySLW4IJBUmrQ0HFAQMFfXTQC6svjzl3spKubl8Xf8Ip/+nbtnEIm4X3T+gIZGZzxhfl
         H3wQ==
X-Gm-Message-State: AFuF++nJn+T5Dybq5NXf2QOZ2Up9Y1hYz9dCNMLi2NVrH3+K54e+kZ5V
	x1+ibN41h8YY8vyfo9gBWezGwAvZDCZ7PpqRBh3DpzjFuzmPgbb5lKqKDmLJl0oUZGKmVQ6a64a
	E2wUv8t1KXGOjubG+FsfrswZ66xG/J+iCGl4Rlu/pd5zdSneP9yMUG2Nb8UmKe3R22sCW
X-Gm-Gg: AYBFou3hGWD/SCwQ37pBJjRNmCfnQcszSg9g8glspcSAsh/njDH9iCXRDlc0JQbyYVL
	JnelwscLRa2haFgFZ6orFSz0PEJ7FpR7Oo213FhxcDC5QsE6XCk+ljEOYVQhmU0t2fXEeJM9qE/
	pz3TMH67METDB6mVsv3ZjVBvJKEjiYsoQ40WuplejwmgDomMZ0CdE4EwXzHe3wggOAl4OtEfvWf
	smRpicfogI26cp2os8pczhChVR4liYnGRMbb0zFLAOVpK+5KOqZDyi5vXuxloUlpxX+TSdd0Ej/
	rvfI8dTT88+D7QHXelgUozx405conECSKbAk/UbyShPNXWjjc/+4iRwT5ziGNkbGv813SdcB2nO
	11hF0C/A/O6Q58IuFjPA+BYoaqqvF86u8m6/smsFB1bxg
X-Received: by 2002:a17:903:468e:b0:2dd:c100:4b81 with SMTP id d9443c01a7336-2ddc1005f8cmr91844145ad.56.1789982112406;
        Mon, 21 Sep 2026 02:15:12 -0700 (PDT)
X-Received: by 2002:a17:903:468e:b0:2dd:c100:4b81 with SMTP id d9443c01a7336-2ddc1005f8cmr91843865ad.56.1789982111982;
        Mon, 21 Sep 2026 02:15:11 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311ad4esm17917215eec.5.2026.09.21.02.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:15:11 -0700 (PDT)
Message-ID: <65d9422c-d691-4b5f-b1f3-c2ae5ba5cfc8@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:45:05 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qcom-qmp-pcie: Split phy_ops into
 init/exit/reset/power_on
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
 <20260915-align_pcie_init_sequence_0916-v1-4-0b2195836f30@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260915-align_pcie_init_sequence_0916-v1-4-0b2195836f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfXwjX8PpOnHkH/
 oMoG513+fuNBhWU2UOll+fh9qDOF30RATQRGuWfPD3iioIxTT1pO/0hGBJ2bMWO3h9DoqdsrLxA
 zG+Z0NKDzEUlFfXFRO17QaQRcl42pH/HGnDY4w1m4wwQVq2SZLYwJYYyfoGrNJqe/stxTOoUxTo
 +GsdpKOcwlrt/oNrZYWdPIO/rwmUrGVGz2BJOjnteb24LabmNQBjryEDDvbn9f7oYHdoQfl7Mg7
 rBU/HHXr7Ru+ieafeh9qxlx8zJon6qZFAOV67i2RyDpbPVWfZ/Z5+V96o2APE7g34+mPPa3rQ0i
 xLJatn0ISK37/Bt855UO3gwEtxl9LzVJMmm7bUynO0Mh367xiWttFDI2B2YplrOg9btantx7UoS
 loblbDPaYebAN/4rO9k1Y+W9fK1xONHtwFiBYN7FIaMGNtBOhwuInCgMsh160H3mwURoUcGR934
 ITjF8XhgVwT4qoszreQ==
X-Proofpoint-ORIG-GUID: NmI73mP6CMz0xVeb9igUBTzFXdcmjxGh
X-Proofpoint-GUID: NmI73mP6CMz0xVeb9igUBTzFXdcmjxGh
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab0f5a1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DFGctsAPzAe98lL7n_0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfXyt5+/tOlGToW
 GdV3mnO6mdYVCwEBKT4hsrxQ1PmVdw6e1Nfnn/8kc/15I9JUSBu8LlyfPpgc6IfNtyu1swMF9zw
 APFRjxi0cPqNheHKIRA6c5IHPGGrvxE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210131


On 9/16/2026 11:34 AM, Qiang Yu wrote:
> The controller now calls phy_init() from
> qcom_pcie_host_init()/qcom_pcie_enable_resources() and phy_reset()
> from inside its own core reset assert/deassert, so the PHY's reset
> toggles alongside the controller's core reset as HPG requires.
> Making that actually happen here needs phy_ops::init and
> phy_ops::reset implemented, and phy_ops::power_on adjusted to match.
> Split the combined phy_ops::power_on/power_off into
> phy_ops::init/exit/reset/power_on to do that.
>
> phy_ops::init enables regulators and all clocks (pipe clock first)
> and determines skip_init/skip_reset. phy_ops::reset toggles the
> reset that skip_init picked. Register-table programming used to run
> while the no-CSR reset was still asserted; now it runs afterwards,
> in phy_ops::power_on.
>
> Adds skip_reset to struct qmp_pcie so phy_ops::reset and
> phy_ops::power_on share the value phy_ops::init determined instead
> of re-reading PCS registers.
>
> Signed-off-by: Qiang Yu<qiang.yu@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 184 ++++++++++++++-----------------
>   1 file changed, 80 insertions(+), 104 deletions(-)

Verified the PCIe enumeration in IPQ9574 and IPQ5424 and it works fine. So,

Tested-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com> #IPQ9574-RDP433, IPQ5424-RDP466


