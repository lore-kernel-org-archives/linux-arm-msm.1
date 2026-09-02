Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06A2415F34
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788343903; cv=none; b=RfJFeBNTr7lLVwsFc454xIi8pp6BXuk5MtFu4UIwDV86sAnGlFTp6PlqTDcokCSEAP57THjKUONyyz0GQA5Xf+AVNXq8bn9xKdxD6jpkHLutRuABxyIHMZce5+eUQUKXz1d3B+2TfRtnSA7+u5l4WzIEGrS8IdrGUbqJWX4Ie6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788343903; c=relaxed/simple;
	bh=MqnEivMcGljRZrK7sqB9AWRPTMEpI3mNs3vN5Kxlhko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g6iuxwrEUJPaekCO8GlwJ0dHkZAao7rEyuzO9g4zAnfabB6MMNEVHWUeP6LYxXnX07SKy6Py48HJemd4BL3GWn+LCToqiPTsrhbgoc99OSpOcQAybT+TU/xBZ21RsxhY/+WkdoqCgHhxw6Oip2xzkccwuVzKvabbGIl35b83oYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UeK5KfgL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZF7AMhzK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UeK5KfgL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZF7AMhzK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829N8l82246249
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hGLV8ocmkLX6cUaKfIwRziMPYkvvnBHHmbRn7IWjrAk=; b=UeK5KfgL7e9oD8Tz
	75rNoo3ECYfgWQ+mPypX+A7CArwBHs5szY51yvE9FgFobhIG/n+2GPczqYA4VsN0
	5A4tDVM4LXQeO9L0FOakPDUsk6rGpplqZZee+VKQnVYW0ai5C9Ijyi4mk7YH7oDn
	VpwRo4SZA3n+BkXwrmQFr7k3iSDF/fMtMy7LbpYfojxRuGiL+w440uDaGCGe7SZM
	8V9WH6NPROUqd/poOoEwHu48LnMS+ZxTn8AwbNzqC/5a4QExKZB02NKfnM/zLOBM
	IZFlo7S5WWnYmv6DOzdZogTaT9Yrt1s1d7bpkBben7SViIxusEwwwMog5yngzMPB
	D/9CYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge8whj051-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:11:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93102454272so21189685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788343897; x=1788948697; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGLV8ocmkLX6cUaKfIwRziMPYkvvnBHHmbRn7IWjrAk=;
        b=ZF7AMhzKuZTy4nNXW9BE4HBlcyeQzU2RC/VsuR7uxr9sTDx+9oMNwCEa18dFgw5tIr
         WLgY7FQ4YJQuQftrH4SZIe63ErNp2WM75lJJky/rEIzwUToJov8KSZhBAqe0clwNAJDw
         p+8/Bad6eS9tCSRDZ4L/LX6Yb/xcduD0A+2SAIcM7As4mQncqKR/pwLk69q/79t82tk1
         3kUHCivhHCn8DcmriSJgKq4VUsyxUpEy67T6aajYmnXR/7h/7S5alvDo0RoSu0zXEKOO
         mA/g9R3d6G+d8NRpQQp6uacjl7ILsSZ5a5QJlHXiDDuOqqZq9z0lcDRtLugfCZvDx9p0
         Zuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343897; x=1788948697;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hGLV8ocmkLX6cUaKfIwRziMPYkvvnBHHmbRn7IWjrAk=;
        b=oUroH+DGeubKnO7iubUo4exmUU/CoYVub0qQaRRL0VwRltw2HnxLtfU2z3+tZvaaiL
         BxGUwTV9FY2QbpXXsiFre8s3wtpWbCjIGfNWx3DIYUhPB2MymvB3KbA7pkAaPvOr5wT5
         qLVZ5ENVnk1KalIoIFbMujQV4Tufuir/rhezbr01aISpcFqoXOk52klenaMVsgkZDUMF
         lwgwGdoaYDVHzJlan6tuMArTI+vxUXwjzuCn/oX5PguFHh1XzcbCBcy7K1VfRg8gSZiU
         PlqrgsQLxgNNrijiuskZspsWuVFt0mssjQMaRVyQtiQZMpxe0lvCFucOoW3rPZpLJgWc
         0CBg==
X-Gm-Message-State: AFuF++kD/AuIYdxoFjAzzdH7GjvMCg/VIb5ZprLfbeXHMXaVQk6iuf62
	vWI4iKcgeFkId3bCLfKTH7Kq58pJ/r9uvXD96t3ajhaTAPZEVj3zQN+kK1gShtxGkMTAZ/s2Qvn
	OFIfw+M7DkItFRSy1XO5AV6GoMR9DJV7C2BUDGFjT+44mWmoLQgIDYlzOH1D0uzzOy1Zk
X-Gm-Gg: AR+sD136TQYOgEhur7VkioMdf0t1iHmTIdVNGYBZ027UkEpqvz5VgDYw/HBsNDKZP8/
	SxWGj8+cASy/Zvw8pHfcfxvtjsZaQE6ZoJ4OrJhkbT1f3Niy5PJTPzkZT38PJeGY+0Hd4CvOJJ0
	pBFPjatEwR0JYUn+Rrqdwj8Tcj7vVdbaSkYHRs6+Ht49V9dy6lja/VzKeRN4ameiEnadN9yGu9/
	cQVQjJqrcdM/QMKPEP+cAJS7buDEGYHxeyys/PdYNFfttlI2PaG03CrdBO0FInuV3Ognq6GUniP
	USGGIUWSL4W8oHExYAhUX+MMfPAFvPNBUQb/h6xG2cWNoYRTLbvvhH8ZzFOklRmp97cqugezHSD
	BB9HYYFPloxRfQuUEA50NHQ==
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr241731285a.1.1788343897373;
        Wed, 02 Sep 2026 03:11:37 -0700 (PDT)
X-Received: by 2002:a05:620a:1729:b0:939:48c8:656 with SMTP id af79cd13be357-93960cc57ecmr241723585a.1.1788343896176;
        Wed, 02 Sep 2026 03:11:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039c9fasm105678066b.31.2026.09.02.03.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:11:35 -0700 (PDT)
Message-ID: <18a73f51-a535-4cf2-a4da-d7cd4fd2a801@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:11:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe
 multi-PHY support
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260828-nord-v2-0-18bf59d19d6f@oss.qualcomm.com>
 <20260828-nord-v2-4-18bf59d19d6f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-nord-v2-4-18bf59d19d6f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a97f65a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=uUvTuc4oTmGzQ4V00ZcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: ipXnKdFcZ317ZlUaTUpA6Yq3dX0T_r8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfX9BEyreTzE71M
 c1ykjlueEpK0QHRk3mMagJ9vwwrYUTpEbsZC4c1SwO6OVWW2ACo6giQ5TZOgvXocnFlBfhOdX66
 /gxGt8dtknwG15g5ZcLUIfPQXU8GvLAtGFqTtSm9NEZ9Dh3D16OpiWahvtYOg6uhbczggr8JnAU
 XFW0wkOLJJLVZ6AaFThuvXwF4NKBfRgH2D8Syi1CxTGz6Ui5ri9B1Ayew9ofJW42+Iwp/a6l/RK
 Xbl7bNc/8GqMMhoK7n2bsPWVnNFmwu5p5XJJV2PNBD4OtlSsbY4+T/J/HX9pYQME/AMq2jD3Vlr
 1HBqSZKwj8OzBlpab7jeGmst6+oEegA5lZ/enapKoTELhRySnrsaNPHl7EnD/90+qC5aaipMB0n
 XUUXC7NQC+1R7gHLtdjEMazEfNCmOEaMQMbqyM1VYbLePtfHx3YnAKBPHnB/5+hHRQ+3sNneS3D
 9l3vldUWqHFN1HUe/CA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MCBTYWx0ZWRfXxapfjHS56MgR
 oYVP4CeTXqqZpK6zgp2SZoyVsFmwuG4Pbj1BOdv3okS6k2hWwg8cH2gp+tQ2jI9iQxZ+Hn1MGp5
 uPyq43lNL1jJb1s/m10icR1gci6W3OM=
X-Proofpoint-GUID: ipXnKdFcZ317ZlUaTUpA6Yq3dX0T_r8i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020090

On 8/28/26 10:43 AM, Krishna Chaitanya Chundru wrote:
> Add support for the Nord Gen5x16 bifurcated QMP PCIe PHY.
> 
> Nord has a single PCIe PHY block split into four ports which can be
> used in multiple lane configurations: x16, x8+x8, x8+x4+x4 and
> x8+x4+x2+x2. The active topology is selected through the link mode
> configuration register, and the driver exposes the corresponding PHY
> instances based on that mode.

[...]

> +static const char * const nord_pciephy_port_a_vreg_l[] = {
> +	"vdda-phy-a", "vdda-pll-a",
> +};
> +
> +static const char * const nord_pciephy_port_b_vreg_l[] = {
> +	"vdda-phy-b", "vdda-pll-b",
> +};
> +
> +static const char * const nord_pciephy_port_c_vreg_l[] = {
> +	"vdda-phy-c", "vdda-pll-c",
> +};
> +
> +static const char * const nord_pciephy_port_d_vreg_l[] = {
> +	"vdda-phy-d", "vdda-pll-d",
> +};
> +
> +static const char * const nord_pciephy_port_cd_vreg_l[] = {
> +	"vdda-phy-c", "vdda-phy-d", "vdda-pll-c", "vdda-pll-d",
> +};
> +
> +static const char * const nord_pciephy_port_bcd_vreg_l[] = {
> +	"vdda-phy-b", "vdda-phy-c", "vdda-phy-d",
> +	"vdda-pll-b", "vdda-pll-c", "vdda-pll-d",
> +};

Can we only list a/b/c/d resources and then take a union of them
as necessary for combined modes?


> +static struct qmp_phy_init_tbl nord_qmp_pcie_pll_a_tbl[] = {

The abcd tables are identical except for the last 2 writes. Factor
out the common config and create overlays.

[...]

> +static const char * const nord_pciephy_port_a_reg_l[] = { "port_a" };

We already have some of these symbols in this file that shouldn't
carry any SoC prefix

Konrad
