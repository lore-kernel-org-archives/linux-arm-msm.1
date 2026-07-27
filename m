Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8194279F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170443; cv=none; b=A4d209uMKjFQF5CcLlw88FPRbJGLk6zKTfM3sPcHJiZPz6eDGibf4rFquy1SOTdfdwFsns4nBlZDJnO4khz65eToRBz793Xa/cWoO2pmjVvdq4LTuOR5cN+mZ0D0lTI5heK232wDdzTxW2GodVzFhUw3+TwbblfHl8zEWeXpFe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170443; c=relaxed/simple;
	bh=co8cIh3iRIDa7qOyuHk89uJ+P1PJBGvgs+ySD+8DRlQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVeBZ/2n3hUEFABaiBKmCYu7Vz0Qlk9LnVcfVfDsltsQqKdUxOohgWfxNO4sbARxpbCuAV7kjQaaDEBxUvXWPk0/p70Ff1MJrzXn0XFcf75+iQW2NYJBsX5pXDc69ipoc9y3fDRR0gLVuTJf0bshNf/wuy6V2jKZl1Uz4oe/KCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGS+89Tu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FZXaVADi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGS+89Tu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FZXaVADi"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlWYF3895496
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nTEKqrxXyrS0inuLovqMwgrnlDBPuM+qblWWYMww9JM=; b=DGS+89Tu84PjsBJk
	tTbZHJv0BIfVuYn33fMyIG0td8AUXHlOEw+hN/9F3UocalKUFsoKYvJQd0v7/aLN
	KQqXQQJFxHIXQRjoCHW5JqIbn8o5ZxO64melcw92xKMNyUbeG552Ln02ybvMjNdG
	hthF0mV/9hpas9ZWhy+X6i6WRv8sSlZWTqFkukMEpJ2pwYPqleUuTARk4mcbwade
	hCIhZo68sbRLolYeE2ssvH/Py4sJPJQ+YnZL2o5JQhqRbnZ3tna9ffCHcDnBh20L
	of1BXetv758ga2I2de8fwmSP8foMB4lKhBZN+BSdKkeUgHugdbRR8we3SQw+6QL/
	7SMRww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs3p1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:40:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso1819417a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785170439; x=1785775239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTEKqrxXyrS0inuLovqMwgrnlDBPuM+qblWWYMww9JM=;
        b=FZXaVADiLjau+ClEG2XDkovlukTkzUPFehLoeVDS8ljwZrzMO93oyy+LsEBMf2k0/J
         T6LSTH6OtWc4XbxydS1Kpana3kf8iKWxNCCGiEmukS9BpCHweAhRMDClxpqoEdy/yckp
         yc2O4xZ20S579KyX1f1XRm4W9mrU5jhEZeK23xixDL2il6VpNRox8Ph6ksZFKQ+tJSXS
         ggO1pNnfTcp/0Pum7mU8mA/Sk8MIFRR7RPZx0rU96/YD7XvH0xqVp2YKtOtnuGxs7EIB
         JRQXg13gq3zcZJ+7trlJ8DvXe1/agsgfPPculNYaPTIcQxb5zunze9yyJ6oVs6Nw3hND
         dK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785170439; x=1785775239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nTEKqrxXyrS0inuLovqMwgrnlDBPuM+qblWWYMww9JM=;
        b=mm8ONa5pewU9FNtnTDaqOosz0u+A6bb+Grs010voEuAe0NKx5FhR2+FEMDV2mBA62J
         wR+uXA+PASctVUizkzwduzFi3mV27QrHPD/4w/U4Af70s7Q877AEE2PlQH0RJyCtd3WH
         NBZVvwfq4ScKqoKT7r2fFyu2iVU/0kmzuXsLLQOe0ET+gocBqTCtU7t4W0yXtX9ttecb
         FtOBCt7YC4xyA4cex/i6E4vwHDdVgdamW92m7R3KQC42T0hekLzLryCA2+YWUuXD3hUc
         PNrn3k6ilJu9sFTI9Zif6TpmnLpwotlN6G9ji+Jt68JGXjdboeya24MLmCV/T5ke2CSg
         KVfQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHvewXpr3lY7LOpzy4pHI5uFqUFh1CJJVDVa1szroyAdcRzoLOELAH+Zj+eUOf6IGHPzacOgVFN5rC9sl+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7+xFhmaIqX+SjNvrFrzddhZRnZfKTCJSroRJjS7pEITITwDx
	nxA1+wf89dE7QDRedH1Gqfxp98iS24fITNviOjSKXIfVn77CFCpkD4Eop+B1r6K4NkHSqvF+GRM
	mMNn2Uxd4cyYBOLWROOoC+brHcWSqgUWBeRAtib5YDxryCQxUTs4mRLnqrrfCz1PBSIqP
X-Gm-Gg: AR+sD12FERXAR+XYwM83jkD84L3lXo5D4u/7upnzF6r3SnakP3pDGXzoSj7Roe8/eEt
	XQHDUr+3gWiW54olRWcMCp49BQ+pDSFIzM4JEjC0sQv2qCOrkat/yxP5ikW6Pd5FJcwZW5sa3Et
	UcBs6Vm50KsKP83T6fTP1T+xwb4h3r4ers6hhtFokH8OUvm5zcJ2+jnWEdq9IdHizZMcCakApJL
	h/tvhxCRbk2eh8TC7V9s5B/EY8TnS7FqJy1g++uD7D5uAXK2zlzvifBMSpZL0oC7A9aioZwyPBN
	IoCRfrsTA8mWDpDXw7Gq2SFRG15rIFn8Q75MXf4Pn7kaP9FSbGZTjW0KhuqPCZXHCLFcQo4Rh9L
	mb9l0bhvOuqB/cNCHTVz+QJemflS69kWqsGZiVpF01wvu
X-Received: by 2002:a05:6a21:4e01:b0:3c3:67e9:660d with SMTP id adf61e73a8af0-3c6c8030a60mr306669637.60.1785170439311;
        Mon, 27 Jul 2026 09:40:39 -0700 (PDT)
X-Received: by 2002:a05:6a21:4e01:b0:3c3:67e9:660d with SMTP id adf61e73a8af0-3c6c8030a60mr306636637.60.1785170438774;
        Mon, 27 Jul 2026 09:40:38 -0700 (PDT)
Received: from [192.168.1.5] ([122.164.81.201])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e63sm34799688eec.19.2026.07.27.09.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 09:40:38 -0700 (PDT)
Message-ID: <2a8ffb55-6aff-46a8-bde0-6a6887f73a8d@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 22:10:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 3/3] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
 <20260727-wdt_reset_reason-v11-3-eeedb22beefe@oss.qualcomm.com>
 <20260727162052.eyvmubroov4fex64@hu-mojha-hyd.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260727162052.eyvmubroov4fex64@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1NCBTYWx0ZWRfX+dp6Y2HYX+wf
 9PC6D3Wv2nC0HqcK+5PM2pAB2Tnp2NYNUSbT5zVbgGNUE98P04e1Rq6WB0UPD5uUW7piNu+KfiY
 S+VM5wy+jctOVYLlQRQ4jto/xyDpRzDB/CXH995WEV8NlVFuVPypnDKTyvq4Z/V0v2fDVkDfT1D
 r05tMwJoCl/zmsJIuP/Anrcott9IkDWECYWXRl7qWvHYW0AXMf/iUNS4lwbEhuC516KNsI4srQj
 TmfFa00SEyKXc2QXnxp7OgYZgOPg9+SBba+1hlsh78yjruHfkOdLvO86iQzWzxOtlCCwKusD8t1
 k8kVGCQ5oIv+WgQuxM+P5tFZ0K5pw4TVVcJ14dUsptZIIAT4JSFu6khkW90x7R/zv349TaO+VeY
 60IlyP3s96jhEjXtctYTfO20XPdoA+aK2BfberYOdVSha+6iPZC0QqYi9FAN2vlWHQyu1Nc9eZR
 P9yp1KbdIoQGBuWX7Ag==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a678a08 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=P3jInBWtalU6Uic2C8YT4w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gS3PISI-MQk2NkVQGAQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: ar9nNjs-N3_gfuvDU1ckEQLYXwAz4bEx
X-Proofpoint-GUID: ar9nNjs-N3_gfuvDU1ckEQLYXwAz4bEx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1NCBTYWx0ZWRfX1OfRGdcByY44
 Mc75b0ERntfLwSCu4wCKv3zkBE9AjBwlLCkXDwbMJATIw4o1WYpKtijA/KNhio56P25804XTBku
 gL6Zwz6FIiSPra/c1wfna+AuBZR5NAc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270154


On 7/27/2026 9:50 PM, Mukesh Ojha wrote:
> On Mon, Jul 27, 2026 at 09:17:37PM +0530, Kathiravan Thirumoorthy wrote:
>> Add the "sram" property to the watchdog device node to enable
>> retrieval of the system restart reason from IMEM, populated by XBL.
> Just checking if it's XBL and not TZ? who writes into IMEM.
>
> As when unsure, mentioning boot firmware is a better choice.

XBL consolidates the various SS reason codes and populates the final 
reason via IMEM, which is consumed by the watchdog driver.

>
>> Parse this information in the watchdog driver and update the bootstatus
>> sysFS if the restart was triggered by a watchdog timeout.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> index ed61db0749f8..23f851e9241f 100644
>> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
>> @@ -624,6 +624,7 @@ watchdog@f410000 {
>>   			reg = <0 0x0f410000 0 0x1000>;
>>   			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>>   			clocks = <&sleep_clk>;
>> +			sram = <&restart_reason>;
>>   		};
>>   
>>   		qusb_phy_1: phy@71000 {
>> @@ -739,6 +740,10 @@ sram@8600000 {
>>   
>>   			#address-cells = <1>;
>>   			#size-cells = <1>;
>> +
>> +			restart_reason: restartreason-sram@7b0 {
>> +				reg = <0x7b0 0x4>;
>> +			};
>>   		};
>>   
>>   		usb3: usb3@8af8800 {
>>
>> -- 
>> 2.34.1
>>
