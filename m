Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1C53168EE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161291; cv=none; b=AWlJarkK4BfxLEzixQQ0MVYaq3v/pOuNTcvdBIUl7v4UC5NwAEgbfsc31EDIErPrM5/hdHsRikz80ScnepNUgYmm41iGrYZY4E5MipdEeXRkov80v1ous5+TXIFOOfs8O4z03yjpYUobKkULzNN8k2BKUo0wHfFtboQj5R2sWCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161291; c=relaxed/simple;
	bh=X26uLAsLDlZ0iLHWCeoHqJ1BpK501srndGa4P6m95oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WaODqFusLNM9N1UokVScfgJ9yqI5KGmwCo0UyBjs88MTJIJBAIX6INiD3aWPJf9D0LyXHuhXXmVKPNrdJ4yizMdLXWq9OcJaI5RkkwIwqnE+7YXKUpCVTBItsmGLTLsuKmOYIuOmHqkgjYnpZudX4MU3ALuC7dA6GumnVsxiGw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqFB14XV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D5woMwJ7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqFB14XV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D5woMwJ7"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDljbE3905592
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ziM/+DZgXdtc8jAKvQe7Pv3QHaJFJ4hODKr5LhR/F5A=; b=LqFB14XVzXSoXJPV
	6fg/i3jo8UBicp8ao3JGET8O+KlzNHzMjlNNToqidG/fivAVXuS6KSvhECin3Z6p
	vRmg6vj2Xsp4JYelDqk+aorwSq18IfRJWeTZlkhYwERMoycfj1ONwsacjRW6zuF4
	fmIqDiHGm48ZcumBti+gzQoFpzy3XZuFxxCP7CJ3CObAoMJIcFKa205+1NauipU5
	fBZLNUNJzYamMgjDzsdj99zFlJBpIKFS46+gllitnQhQc2k+QpxELQtgyVGr4qgw
	JlLOegwK/B4EPmDf8xMqktmOiTLWxl+a3/1JVoz31N0rwgVJTvADG+AWOCFIu+rS
	pzDoeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uks078-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:08:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92eebb130dcso11437485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161285; x=1785766085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ziM/+DZgXdtc8jAKvQe7Pv3QHaJFJ4hODKr5LhR/F5A=;
        b=D5woMwJ7/xNt0v3TQfzwYVDc41JSegGmdn71rsGIbKIz+tIN78nTgAggbxGbAiIcft
         JAMNeRXjQlLJGWdTJKFodXHWJsqQ0iFk6owMgUedtKr4J3NlCHGJSgj7wbVdVg7ktzsY
         HXR7vZU/FCfMrCvq84Iu2WpEjHn2uEQ0/Ds/Uj6ABRKpNGZydesCiooS/AR/ZLzpHaif
         mLl62HpF2ITjU/XNOFwOzogh5TW+JOqWnbxHMTqYoQLzv707pnyUloCp/merVtV4dNmq
         +AAbZoR4nLAoJoeYJIF3Zurcsn+sQdT8/ackGU73Sr48KhoqUdwDdYRvdVAKEDIDCTz5
         HDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161285; x=1785766085;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ziM/+DZgXdtc8jAKvQe7Pv3QHaJFJ4hODKr5LhR/F5A=;
        b=OCjVqSohllRJqegI5l8F4b7JcK5RadNgufopmFz6ZbQlQX8NF3jyKg968hE36LeyFJ
         jUZFkDLNCjWFKisG6kwoONm5AQsevvqHVFqdUltgBUbN4csV517/8HI8LznXNkPPLgjG
         yJGNImtVNIebjptYWz+Kq3ABsOR27hO5/JfPVSd9VkZm50lowRFC93QQJvBvxUfFmQ7x
         f1Bzox831xkE6pozFRq7CMR9Tl0WeeIDlyqlB05b44n+Vw9Axx9CbV1bnpOOHI36wJXq
         aq4omC/tTO8WEvBl6tjljvkEGzf8i8VrNfYw5AKIQnFC0BHCjzHcaS4R40lh7SK2782P
         HbDw==
X-Gm-Message-State: AOJu0Yx5KxOYZAFAU83kBppAOwED1FuJORqVGH3F9jQ2qBTiag7h+Dvo
	gafHsmyEI0i6j8Pff0XPQLOrkgaFUBbbYcGNl50YryC2ZBMwb4QKSCwjV1u+scS+fMDRmdOfDJ1
	/aF/g/sPPPDDCSsYdF0MRybj352ngEAsZIFJlR3wwZsb7GrdQudd8KNNRGb3IBZetafUJ
X-Gm-Gg: AR+sD13u73I+ThBZPQAQX+WDfZAgeRgf3PNEtYx23TWGAqqIYLWDt3jUC9PVbYQPxUI
	XMp2z5guliKfd99cCYzKTWxeNMTqnyNo7vhBwObT/VQcQ9VGF33lOUqX7+wiZUI2r2U2HkcNL7Y
	f1zhOAV+kvYabqyZAvazUTS5JRn7A2XdWmbD4ulVYQpdA1IoolI+2NmYnRCn9R/pad0vbeC7tGH
	e8gLKR0lQyFD5jY1T4qjv95yrr7rrSm5pzykAm9nz0737oFiE6pyKhT4L7CZeHmN/xany2k9lTK
	OfByR6xZRLnsZomNvmO0EySXAj+7tm5Rd0cfX8cijwbOKW8sthI1Ny8X2qpaW8tR+RPfalBLPa8
	Id4RAkie2djRzQIeAYsBPWaul
X-Received: by 2002:a05:620a:ab08:b0:92a:d10e:bde3 with SMTP id af79cd13be357-932fc00dd43mr26436685a.3.1785161285385;
        Mon, 27 Jul 2026 07:08:05 -0700 (PDT)
X-Received: by 2002:a05:620a:ab08:b0:92a:d10e:bde3 with SMTP id af79cd13be357-932fc00dd43mr26431285a.3.1785161284738;
        Mon, 27 Jul 2026 07:08:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebb385sm651388466b.52.2026.07.27.07.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:08:03 -0700 (PDT)
Message-ID: <4d0c2aaf-f521-4527-9e53-3c63f6930667@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:08:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/6] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy
 with dedicated pcie3b_phy
To: Qiang Yu <qiang.yu@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
 <20260724-glymur_linkmode_0724-v7-5-65c8469c6b65@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-5-65c8469c6b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: dyYznLI59t1_pbP-cKxpK1GPe9A_tyPA
X-Proofpoint-ORIG-GUID: dyYznLI59t1_pbP-cKxpK1GPe9A_tyPA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfX7phE3nnzR3Dy
 b3MUCQ0+8jz6qD5yzYIJhQ6Rd5ihmEvTnj16RBD7EZznYDo0NFeXx/TahtHaFIhAWdvdWwNTlkr
 yQmTx0ks3bmtNEm2HhAU0MH5/qNDwDQ=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a676646 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GN4xtFq8P7hki0q-dAwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNCBTYWx0ZWRfXztdh5/ZrOcuN
 O+BFLw8Tp6HUq/8SYhBx7BybPQzZ/Wy1Vl/qyC0LsgtJ7CmTN2rCjSRVLKa6+F7cn7t2UhrQ/+P
 ydVaybq5xkIcx8DuVkYhSpD/bbFXqDu8lYjuxwDTifwvc11bWq1H6/toWuXqtIGSCLQVtYPRW0J
 /k2DDLmcsejITjLAH+kQiOmBPk/LkNR/Pd8E4uv0O8CdLkvywQNjx/Xgfllo2dgOgWoG7u5Fw2G
 ugY1yxTUE/k+IlcSMlVru7gawFhHk+bpwAFMK49uwjOW87CmgyijkduTotPEOx5nhKk7Fyp2MtT
 4y/oo/UYKDgjQokgNqcRIquO6V89Ty3ZU9Fk8oMifB6xGmHr8EppZ5aNCkaii+3BwZf++EHDY5c
 KRyRDRkuo/W0FMXBUSKpmqf48l2APIH5PeQQx2nFu+J7jHFHn8L2OE/1BHA1jE9lgEWX0O9b9b7
 XBA8axG8vhXkW/ss+rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270134

On 7/24/26 12:01 PM, Qiang Yu wrote:
> Unlike Glymur, Mahua only has PCIe3b wired up; there is no PCIe3a
> controller and no shared Gen5x8 PHY block. Delete the inherited pcie3a
> and pcie3_phy nodes, and add a dedicated pcie3b_phy using the existing
> qcom,glymur-qmp-gen5x4-pcie-phy compatible.
> 
> Point pcie3b_port0's phys and the GCC pipe clock parent array at
> &pcie3b_phy instead of the deleted &pcie3_phy.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
