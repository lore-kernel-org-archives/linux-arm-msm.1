Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0594A5ED5
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788362639; cv=none; b=AlraF3qQ06N+VLrLfg6FZS3QqtEpXR85z9UXv8GSmkxQgJMqbN7JhSjE7MmMTjqArQugbSb1vAIzc1Cu4FXNc6TuSMJ8XazuowfwDVHiyWJwL2Jqa/j0gfrsc7uBayhW3MDl/hM+4XD+91dCHQ7E13Uq76A7mOQ/Qw8dnzSwvx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788362639; c=relaxed/simple;
	bh=8rWbjt+EQPsKzbgQAVbw9WUeXQ1yiJbxGJ9Z6dMVE6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K91YySZEA8ugkgAznxTn8UX5s1r96r/u7INdjImEsacAPcRjMeilHeRK3qddtskMbmd6J8DMo72q7wUnEy/YLT1NARUqsUX8hOLBKZ31lXGa5RQ0KbxXKTZs4U84ME7hEUmUFs4p0Ho64RltaSNgeaErD6ksEx8oLk3a/992Rno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RUgOTikM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YJkTx4Pc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUgOTikM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YJkTx4Pc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRHU82001805
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 15:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pn82GJB5qONT2GX4BsYpoqZwIsSErz5P5FOPwWDCQPk=; b=RUgOTikM0CAKzdok
	/97wMjukIO92knilu+DTO1uuPk5rd8gxIJ4ejQ5wlTYhThJ40FLK+UpRKjmQQBh5
	APK14MUobNCnNFl+/B+EzyAvt9ht2v6TWJNdBPYfwwvadwthdHRYA3dGLPTojxgq
	lsVnQvelFlhblSWH7VAuf49petbyOzAlSgvtQRfqMC15wwVkU4jQCsNYKvcUh9yP
	/MOHnawk17Mnd6DWF4RIPD0oS73EGro2K/2UdosmntrQty/8WH3oVpod6aaTr5lc
	6rajkjgBUG7ky2HkBExZ5clbYg4m7Kjts2jjzWXBd22Feus5ROjG15Cqo0xwrQFg
	FnOenA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy1frw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 15:23:56 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7824ec38da4so52768137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788362636; x=1788967436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pn82GJB5qONT2GX4BsYpoqZwIsSErz5P5FOPwWDCQPk=;
        b=YJkTx4PcjTK+E5m9xPmjxspKlppRTuG/y00tZktyiNLW/caBYF1+oCbqVu98MQGZEY
         Wp9JaCBVctMRtAeBtDuoo7AWEx+wvWdmGDi3V48C0xWwHEIqDnYsUuSCOF+zhgQKAwsk
         q0vjd6+iVIRTYaJy9wOyEYZTzol0ZadRZY1HMTGU+qCP8kOwoZcyuBVzerdpBh6Bk3dv
         fMKaSim3YkH7tMas2uDFMHNvNP7Et0u+2u4ecz8fngofXHt7+mhn9PA5zNHqoMWRLRAQ
         hoIzO3f71zbOAX6cCeJptbQcw22TC8SSj4cBmQUpkNFSGYpa5HOtsA0ravZOcBb5r6Gp
         cvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788362636; x=1788967436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pn82GJB5qONT2GX4BsYpoqZwIsSErz5P5FOPwWDCQPk=;
        b=pFFUQCDBPa3iTK1kPrqRGCWBdIs2hFXiwHu/zqlC3EyBmmoPcQnFSs44iJyD29uPiW
         LaJf8aNpWb8BzVFwfFO7nDd8t9wDvpDC/z4GE+26/hBG93hRPEPD40KGH4pzLbP/UJDJ
         VGOh2mf4v/ridLJ9/AlM3bc5fEd/5yVeQnE/bLTTrCSLhmI+xIQoidPTlq69tQ9oOh3Z
         QaVqDYsuawgC9tcxC+AKuQKnhmy0jurPgmnF3iExelGh8xraaqlf3E+AbrLuv5tNisVz
         mq1FnrDxnKnMshme7Vq/cwXKg8BrIbxw6k/hU41PORy0SCXiVIDM+fwMgwgxRUegBe5g
         i3YA==
X-Gm-Message-State: AFuF++ndhVh96WMcbWyzw7qXOO0+xrNpaJkuDsiSo/i9lcLYSfKeYIFQ
	n2eoN65xF2S+h5a1fwfl7ZciEnO1UW8KPJRtK5tMDORPc0Gc1OHsM30KqB5Ubnd2sL1eV+Ph9Uc
	U3bgFul9RR2PQjHdKen3Ea709hpov4mlALQ+o0gDKTHfYxLxXHf4jARaC2M5Dyvhjz1XQ
X-Gm-Gg: AYBFou2ZXkLn711PgIJMfCVi9JDwfXi618+KjEKZj76e9NiMPy+fKWiDTfWD0IvYDMj
	T+6rHUI/UlEFXvELC6E0+zGLRxKdqXe7hBN7BceHhj8K0SlYHvR41X2ucUyHe/4l5StYbd+0umV
	RdLTOK8+GffW8g/nv6Nuz/sQjRytyTWUaQ6N6fDp1RMDwsODXg/0VDR6k+tVH0MI0RvjIIadd/B
	zGmdCLgTaSwiY/zj7OvizuJVE4kNjqqpkRyA5gDHkt3LXzII7I/RWy/06RKRe6hbBAHQq/d/hyi
	nmaOdLN2FQwPJdU2N89pkW6hHEdCbZWTN8ya+qrlEWLHJAc+7YZPs5mKLs8PrWz3XnF6wk3kLB9
	cFkYm/E/jGtluqJ5VaRDnow==
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr820069137.1.1788362635838;
        Wed, 02 Sep 2026 08:23:55 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:786:d38d:f7c2 with SMTP id ada2fe7eead31-78a1f29d57amr820054137.1.1788362635258;
        Wed, 02 Sep 2026 08:23:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d043e6bcsm162354566b.61.2026.09.02.08.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 08:23:54 -0700 (PDT)
Message-ID: <e49e4a3a-dc21-4e5e-9045-5091fc543c27@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 17:23:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: qcom: ipq4019: migrate USB to the
 qcom,snps-dwc3 glue
To: linux@divinehawk.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260829-ipq4019-dwc3-migration-v1-0-cc66b54ce21c@divinehawk.com>
 <20260829-ipq4019-dwc3-migration-v1-2-cc66b54ce21c@divinehawk.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260829-ipq4019-dwc3-migration-v1-2-cc66b54ce21c@divinehawk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a983f8c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Chss0xDGAAAA:8 a=wKNooAWPMPxZSHiCGK8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=VZ1z_dUGxXw8Qzmhq9nZ:22
X-Proofpoint-GUID: VE40kLvYmX5p-M6_5Rrxfr7qbuEcOGFr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfXwca8F+Xs256y
 v+dbS6rRP89mlXOm2b+JR+rn96ayVy8esLA101weNRenQwuGa0qnPsUci18Q9p8gBGYaQkKiFyI
 U6XhZSmOVBV6vkBMJPoRBhcklFVNcBg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEzNiBTYWx0ZWRfX5+bNKFOvQ/Zy
 4WofVd10f98cRFPz2fnnGWhor+u9qtWaEy8ITQVlLp2CRU1F5vmWLE9AsbmqoDM6bk/Mwi0roMP
 YqD++o5PUL1lYeukNQu3pqbv6uPJ60zclGHfoTgImJS6/jTZVz4/rigrCFLRx5kXrvjNSefg5yL
 7vjxOE9/yeqU88VuwdGqx9xTSntv7oPpmfbMDgA4Q5TSoUjl0sP5CWaS1PcdnJZyM8SB+bh1j8i
 dqFCPfqTTbVDuvQSgjhxnb/xg9ux8i4Y6jQzthi8TGCmnmT3JidVLa6gn1C3j3TZ5eDqj4iu/Ac
 iLSJMdTZJ+Arw9e1F1TDeqihZVdhlMYWVKj6D08ZXn5HyrWpIjfrwpD0QaEmTEPCuLnFiUu/Gei
 by1drlRA4+u0l/7u9dLbd1eBBj+xWG7xR1f6rpkQj2JXGu5pZ0SR2D37WMiJmvO1xWUknS4hnKG
 i7SoP5VITxlck32kgAA==
X-Proofpoint-ORIG-GUID: VE40kLvYmX5p-M6_5Rrxfr7qbuEcOGFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020136

On 8/29/26 9:31 PM, Matt Eaton via B4 Relay wrote:
> From: Matt Eaton <linux@divinehawk.com>
> 
> The legacy qcom,dwc3 glue describes the DWC3 core as a child node and
> populates it with of_platform_populate(). qcom,snps-dwc3 embeds the core
> in the glue device instead, so the two nodes collapse into one and the
> unit address moves to the core base.
> 
> The QSCRATCH register block sits at a fixed 0xf8800 from the core base on
> this SoC, which is what dwc3-qcom.c already assumes, so no driver change
> is needed:
> 
>   usb3: 0x8a00000 + 0xf8800 = 0x8af8800
>   usb2: 0x6000000 + 0xf8800 = 0x60f8800
> 
> Both match the addresses the wrapper nodes used before.
> 
> The usb3_dwc label goes away with the child node, so the ap120c-ac
> override of the SS phy moves up to the parent.
> 
> Signed-off-by: Matt Eaton <linux@divinehawk.com>
> ---

I can also see:

	     usb2 | usb3
pwr_event  | 135  | 131

Konrad
