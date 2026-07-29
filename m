Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44398446062
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785321916; cv=none; b=tf+xWhg4IROWOKJy+2NoLuqbDtgD7R6DTYxRYSLniqofJbnc/gLNTk4zNF86bRBZ4J7vc6VzRxMs8uKQkmyrzt47vSbOR5Et0y3F0/7zcCrA0ueku/+6CzUFjOKeE3PEofV8lVVZ4T3gGLwaW90Yx+/VpJeNwVxfgjEXVpv9/6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785321916; c=relaxed/simple;
	bh=uY/V7SXitW7NqiyUcidG7uPzvRLMUGfgLk6jiSJvDM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5R/O24DPlPGzDGk5ZtrkYReq49XNMZiSmIFrkW59vxR0LF98J1p/lBB2BW4+cH1LbNOi7gTorO4wG0VYRZg2fpSkgubqU89u/T88r3d24c+O/tSkZ2pvL80QDsB6p0D9ge/XXv8SxIJ/6h3jjqzJ27I/YF/HTH3ewqMKjgXzts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eE5VJhRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aq3PvVnl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eE5VJhRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aq3PvVnl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7ewiN2326545
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdIOpVMisBlsRPUZFhmWrSDH9SI6cuR7B5qB+ZnLerA=; b=eE5VJhRxb2utr5ab
	y1JqY/2M6OWCcwpvkZ/jh185Cer8diemMJZz6pQs7iipHN62ux9zpdfiAnfVCOUc
	4CUUoUd2xjvBK58zHZ5sGDgeFj4sUUZAr8jFK2eC3ZAWpk7U1h5HpUR+oRkFjNQe
	9barrI1OC63yScNDCYH7SGb9Y+CWTYvl/ZNRiKGeoIf5ZD9/VTUzBMqDpcfd2lbB
	UsSHQfMT8Q5tv0azM/cAtEiNVq09lhiRidmVrYhwo1kt5HZUhFlvLYR6pn6+pDqN
	Bxqym29faxnPAK/ndaV+aRldqYKKKn5Itz2IbAmiG/fTKeP0cqlOsmullXqn8FUk
	UTd0qQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbm1h92y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 10:45:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f3951a6d76so1970796d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785321909; x=1785926709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdIOpVMisBlsRPUZFhmWrSDH9SI6cuR7B5qB+ZnLerA=;
        b=Aq3PvVnloTkYsCg9Po89EGRgcdmp01BWDNm90HKSb18A0XqzNuX8Kp5q42fSH5M3NC
         85OFWi+9aWKGrF0rNMXzDTgiKjtn5ycqzaqfy462WyfXKP91olfeie5USKFZQV9rvXOI
         AKh3PYkSoM5UV0t/Lda6gBP+1+pRzJAM4iCryeRNPsgs9pMdtrVBNtNuaeBeoVX/txBi
         M8QhtzKUXXYLPWxYC/qdqJ+S8R5hCAeO8zUCT0MKm79yz37nO1CQn3qIJ4JPFnfgKyd2
         ijlwcWQC2NfGWKTtm6dV/pCwmvDVtVOxXYPktZfo3rGQkOFg3cLUMS/C8pySM4I2EJ4r
         AMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785321909; x=1785926709;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdIOpVMisBlsRPUZFhmWrSDH9SI6cuR7B5qB+ZnLerA=;
        b=DCouQifUEgKmVVvj8c2aZQSOe+WwBMpbfeWAl3X/yzrXjXWj6rJKPjy7y07VBbFMsi
         U2AejscmcuXytrNEcwInldrHOpTbjxr++ytJv+NP9b/Y1wUK4noNNQ3ibsfpqd4iHZPU
         BxZXkOcCkhR8/HgD+0XcnKN/FHxded36m2jVch3xvLHj3cFtDbIoLAqv7Z1cKIjp3zXa
         Xl9KnpgQOSzXz0AIuZSY1alooQOtbpIBka/1nk1L8wQMOEv5ejvXRbyU/LGmqp6Fk4q9
         o24iespVEzFwH9yH2kW/qQ3ppXO9pWuLlrKrvr6hSn1M/rpYyRjBIq/iY+Hq1fU5jrDT
         tW9g==
X-Gm-Message-State: AOJu0YzBwOY3H2MwFZoIfAWJvDFayr2vWdpQtvvZ58Ey2GbSrXakur6Q
	IeKwwTU+TSeai33A0iT+c128meDhFQH9vHG3BFEWsjOo97fv1L2v5H7mYpSw8dmtxRgBL5Ixt3+
	W/cTYNFIqfWyjjbhzlwx8hU+HWcDTPjkGncEopyLkw7qUjJ70C5sYsmDvBFQq+Yy5sjPu
X-Gm-Gg: AR+sD11RYFUxD56h1Q9sNon5mqr8KVD3TQHzXoHe1EsviUWQFCbYACnZPwihvVbRDAd
	98pwED/qfgZ73QSyzNElqsQ7r4U/SWEVyP8w1MFZklVtspRiZX0akQCZrkHT53PD3co5zgwZntS
	6uYOmdOTQgSc4rUE1qTL2PXxt4tPidybY6VvJX2HympfphmsvqYJYRxTr9E5PzMVj5fs45WzKJb
	Zgp6fusvJD7AOgptPfTMinnhP23pcu43m6yBjBwfqOBd+WLytCSXOb9DQp7HeGJJAJwX73QMMbg
	BHC6wsB8HfkOHyZ7niPlmIWch/+qQA0f5bSd19trwfcM/aCASV77fDotRzz66b27weh+jhufr+7
	LH3bMscFF117YwibvdVTSC92T
X-Received: by 2002:ad4:5c69:0:b0:8fe:1f54:95d6 with SMTP id 6a1803df08f44-90816f4f49emr60077166d6.0.1785321909103;
        Wed, 29 Jul 2026 03:45:09 -0700 (PDT)
X-Received: by 2002:ad4:5c69:0:b0:8fe:1f54:95d6 with SMTP id 6a1803df08f44-90816f4f49emr60076446d6.0.1785321908693;
        Wed, 29 Jul 2026 03:45:08 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83f4de5bsm97275466b.29.2026.07.29.03.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 03:45:07 -0700 (PDT)
Message-ID: <805bbf27-450a-44e6-ac70-91b594be6656@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 12:45:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
 <20260729-hamoa-m2-dts-v2-v3-3-4d7ef9274575@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260729-hamoa-m2-dts-v2-v3-3-4d7ef9274575@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4OCBTYWx0ZWRfXyfYUJKwk7sHr
 wNJGe3FgVZEo25Qy6xAL6aiJu2gCp+Zz6d9u1ix0l76kzqaedjp57LupSuu1Prirz7jnicPAeQr
 PfjO/Bq1F54vDZb6oNP22bhqLxzNGFKnlAvFX2daUlMXRkH5/J3jdbz3UZpbGk1Mgi8ar9FdOSg
 bvBRpn+zy5AN0qLeWFCCWMfWqktgObmdh9o/Pq1GFBnLHWpwmoXcLajbCWl/s5ggriJpXbjbrdt
 oRySn0T6bPMJZnrgyIKBV83IcfEEgZRJVO7CvZpeZmUbEHzegKsXTr6LdwzQkWf+1155a0whieH
 L6lfHFRJlah+cug1Yrl/yELIe5m9jnulP/9snib4SoHr4NTlzzUQ1hLdBOy7lq7aGLgMGCZHq5d
 p2+OZRSMctAJWY2YoUXA7c3xRYBk8z6wn+yxGQkF8C5gbOaXSwjteUt6YYppgtF6XPJAGIPPt49
 1Vv9lvY6K6NIUSu3aPA==
X-Proofpoint-GUID: zMotTjZ2YArq68Q28yOmGW2qGedmbu3p
X-Authority-Analysis: v=2.4 cv=R7Az39RX c=1 sm=1 tr=0 ts=6a69d9b6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6WoBsH-PcZNXEBUzj7sA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: zMotTjZ2YArq68Q28yOmGW2qGedmbu3p
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4OCBTYWx0ZWRfX+z0tBLtAzH6S
 waP4Ur8+8DI+HlO8GLdt5wmjdFBiv0k+3d/DLJ1nFKeOtoOxZJGT6KjpECud4V4oQyJjHUlIz/l
 WAoTXbA+VfdeL9b8VMxWzmqW8XIUDok=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290088

On 7/29/26 12:27 PM, Wei Deng wrote:
> The Hamoa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
> connectivity cards exposing Wi-Fi over PCIe and Bluetooth over either
> UART or USB, depending on the card variant.
> 
> Describe the connector node with:
> - port@0: PCIe for Wi-Fi, linked to pcie4_port0
> - port@2: USB for Bluetooth (USB variants), linked to usb_2 port@1
> - port@3: UART for Bluetooth (UART variants), linked to uart14
> 
> This allows the pwrseq-pcie-m2 driver to manage card power and
> dynamically create the UART serdev for UART BT variants, while USB
> BT variants are enumerated via the USB hub pwrseq path.
> 
> Remove the chip-specific wcn7850-pmu node, the static bluetooth
> serdev under uart14, and the wifi@0 PCI child node, as the M.2
> connector approach replaces WCN7850-specific power sequencing with
> a chip-agnostic model.
> 
> Also remove the now-unused vreg_wcn_0p95 and vreg_wcn_1p9 dummy
> fixed regulators whose only consumers were the wcn7850-pmu node.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

> @@ -538,6 +512,55 @@ vreg_wwan: regulator-wwan {
>  		regulator-boot-on;
>  	};
>  
> +	wifi-bt-connector {

[...]

This node is out of sorting order now

>  	sound {
>  		compatible = "qcom,x1e80100-sndcard";
>  		model = "X1E80100-EVK";
> @@ -677,66 +700,9 @@ usb_1_ss0_sbu_mux: endpoint {
>  		};
>  	};

Konrad
