Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CEC448B94
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 10:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344949; cv=none; b=sjdOwD9sbIXJT91sJbYaxzV/mb+2OPNQpewVINNVLqnEGG915dnQykCBbLu0DfTouLq9TTrroFuKLSFeDq4ULu6tYnS1lcisyLiwaYSQgZ9fjQP38uYhiQGDZgYuDp5O4bD0GyhteHoUdQnUC9s6WJ2Z+1MlhPvay8w2pTS+mRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344949; c=relaxed/simple;
	bh=D8ZSpMUPIDCNW+TKfznVVt3G/+Z1IAgE/rX07jvs3Ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aix9KypOeOpLQ6Eml9rpFt2V10sMW8UwlSoRkTK2IN4vTttwXbEcxnnQniOlisfOdRCzp3wNke0XrCYrnPQww+j7eTrQlGmqfwN1ymDl/bANPh2DjdvimbE1YNFCiJ4988+dEq7L/UHAHtzMWcEovz/FTsjkmiLG9OMKXMdpQr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TuWlE+PE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aAg2QRPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TuWlE+PE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aAg2QRPY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6829MwGe4141459
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 10:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdOfQSqLmWJ7y3AMgqR+vy4CjQvTB1wFH1GkCyGK4vc=; b=TuWlE+PEE0fHl+Q+
	Z7tHB0FNlZLyis+6uv07INbF2nYVZdRoJ+svY5ACNrl0dQ7DqE00o7BlnrLI/Asu
	s38/IVguMpGDQid9B7Whs1FHbi2SlIWEkyQbHU2UWz6lj15k02oN/3xh0zZepY0/
	7I3rpZBQRUd5tn7LiQOGnkG4HPE2ea4EjhtRpjt3Wbiim26QShD+YcjVTQTtKdGm
	dKb96JQS2tZeuufTmb200IGGDYSSHbR3aYRdC2jKt5zQjkuRl+3Lw+BNQmdEU7aR
	uwsfJmrM7P+viUve9DEi+tnQYkN/Vs8gS3oi3soF7vXC4XfaH5WCAD5WqCtyRjwN
	DcDtsw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge39ckcs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 10:29:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso20511985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 03:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344942; x=1788949742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TdOfQSqLmWJ7y3AMgqR+vy4CjQvTB1wFH1GkCyGK4vc=;
        b=aAg2QRPYeQSSnJ/pnIBzxmkITRiXqqFk/TFtiyYYVZH3BZn1Zvpa6ZmtxUeTsAAV4C
         8OP2i8zxKGYxblf23Ug/ygPUW2WW/x05L58OqSTNjtRQB/j/PrREHoAB8RFlKX/TsMOZ
         HIKB0TJBJdM87qF2SCS5B5P3cw7JhsSF01ylczEKslhydvDzAqIdLYh6wp8opH1IL4Bx
         oGwMGUNu1+i3nyC30DXtaWoOmVJ09052PiIchsYTkxUYt53OGvF+YztYXHrYRZ7rJsC/
         ZruXnbbH2gYRsXWgj4D4ACN0+4ksc7pdSw9svAKcqasJW8F9nZmY+t/c+ZLs/By2VL+y
         +WTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344942; x=1788949742;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TdOfQSqLmWJ7y3AMgqR+vy4CjQvTB1wFH1GkCyGK4vc=;
        b=R87MWw2VR9bo7MTo/HulYTrrpdpPTdEfDz34qKM5UAvifIYk7qwbYMkpBB7/5tTwr7
         2SH4ReylWD3WITwPBchr9QjVHj/13x8949HoYIcBC6ijQkENaXRra1SWdzHeOudGzp25
         nF00ZGKmFJKYB+5R50vtrP2cz+/hDb+17NgUSJEGvzy0ARulnQnQsesPoheVOLd6klFM
         fNkVAw9PzLR8FllYTT0EFITHHMevjTFe35eBBWlFred7j0H466bzRqVhJYml5VkvvvoW
         2flMQbjC5CoPB1vSU45KTGXNGQ+iu60yzAbyy8oLbq0hol8RUctInv0koaIAzftnFFsz
         tXmw==
X-Forwarded-Encrypted: i=1; AHgh+RqUTMg4rveKWjwxRXHvPpwf62+7LyxMLU+g/VKaviGsghd/LZRUl8fpLWy7OxrqGLsHMxaHyZ+QsfyJgFgs@vger.kernel.org
X-Gm-Message-State: AFuF++m17Q7pBHVfW3mWnpTmqmaBpum5uBjECUpAqBpNVQAtqsPIsI/x
	2AraXtLPZQbFV2P7IoK8oGv+h8okh1R58a/oDyvM4QM6poaRXWZH6bbjmCcDlctCxpy1hsr/Hu6
	kCi/8sN/t13UxViZ6KRrSHhYspVIv+/hthck/11PRbOBbsffPOwBaIUe7BzERqUH6OU3b
X-Gm-Gg: AR+sD10mQiGCBCFODriFYr5HhO89VXua2vckgSMf8tamWjpZVxdmTNNLY2coupWPT0X
	u35YHSlAozsHWn1fcm4qJUkYyOkN++kvoXgstcDJdv1FIYykZjSPIRUF/N8X32fAToZlgXT9QcL
	N6nhcbGjr4/qnVQnE4Glf1Hwt46PxaWtSQs3RTOeGtb5hygwdRw04ai4Mrt+/gdXBIdTEGBED5I
	T0RA29yNDMPCjLm8GBVFnazIiFplGft+wlU5ucxo2qw/nEo8w42zXwRnDLf6Q1TjmVeDAOpgiWt
	5cht9qrBCM6G3zleEpKSuNdSp/36e41xUHsCkd7PekQgp8kodVB+PbdwDlfpiufOFbvIRPYFqC8
	BpCmpdHvClrOPUwqGlRTd3w==
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr241295685a.2.1788344942245;
        Wed, 02 Sep 2026 03:29:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:939:48e9:51a1 with SMTP id af79cd13be357-93960e1e27bmr241292085a.2.1788344941785;
        Wed, 02 Sep 2026 03:29:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002dcbesm109123366b.16.2026.09.02.03.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 03:29:01 -0700 (PDT)
Message-ID: <3d31f750-750b-4561-96a3-d265b632da6d@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 12:28:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] usb: dwc3: qcom: Modify interrupt handling for
 eUSB2 Phy targets
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260826-eusb2-interrupt-v6-v6-0-ae2601cfa80c@oss.qualcomm.com>
 <20260826-eusb2-interrupt-v6-v6-5-ae2601cfa80c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260826-eusb2-interrupt-v6-v6-5-ae2601cfa80c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T968ifKQ c=1 sm=1 tr=0 ts=6a97fa6f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=FycFWezSpWEMHrBiXq0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NjS7_Ek9TayYqZ_JaMZ3kFNeDaT8tZEZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX9L8CovxEdaCD
 Y3zv/j9Nxdt2JKJhgO2gbAAHypWzT1m+po2V1dA0KOyanKIon7V6uC+BYSnogy0EYiTTJ9P910G
 Gm8c0lod8n7nroul3MnkSHUyRF9Yig4=
X-Proofpoint-GUID: NjS7_Ek9TayYqZ_JaMZ3kFNeDaT8tZEZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX2jyug+X3RfL/
 nwfpV26pAKYsEOfhYoXrLqBox8zYnPTOVTgJOuaqWyza7/NdarwFy4z0OEld88VXGsgUCY8sNbk
 3SLHlnpjVyLc2b0kBVhSqvp5wySP6KVZbSeKDBVdaRw60dFYg6gXFK4Bw1Y+3CSY1zs/v5yygkd
 Gq8Pms37cfmcYn5QI2uQ6FMzE/ZyY1L0Gdo6JFgyGY9HJ/YUlrT/ZRCQH4/zcQoCkSYl+M71bN9
 sJ1OkuXpZI9pw7GoRYb5lZgEj/Ts9s/hImp+VGiGO+cVdVkVifcEFhJ89H5Ka8BwvtQKGKK/Yz2
 1Mh97fDsd690fUy8i74s8zBE8p2vcxmEzedpCRbx46YPHhFxT4yRwaEfV7erZA22sh9Jov20sJA
 KxafrdyzfoleDqoKQqL2OmO/e+5dp5fD0GKcP1PmDMZ2Pqm7YLTGf5n5skWPnpIJ/uEO5Rei5pV
 Rr6fxv8pFiUD7iwYvSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020092

On 8/26/26 7:02 PM, Krishna Kurapati wrote:
> eUSB2 targets handle wakeup interrupts differently depending on device
> speed when operating in host mode.
> 
> According to the eUSB2 specification, remote wakeup signaling in host
> mode is detected via different data-line assertions based on the
> connected device speed.
> 
> When a low-speed device is connected, the host repeater drives eD+ to
> logic '1' upon detecting a K-state on the USB lines during remote wakeup
> (eUSB2 specification, Section 5.5.14).
> 
> When a full-speed or high-speed device is connected, the host repeater
> drives eD- to logic '1' upon detecting a K-state on the USB line during
> remote wakeup (eUSB2 specification, Sections 5.5.15 and 5.5.18).
> 
> Since the eUSB2 PHY's "DP" and "DM" interrupt lines monitor the eD+ and
> eD- line states, query the phy type and configure the wakeup interrupts
> accordingly.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

[...]

> +	phy = devm_of_phy_get_by_index(dev, dev->of_node, 0);
> +	if (IS_ERR(phy)) {
> +		if (PTR_ERR(phy) != -ENODEV) {
> +			ret = dev_err_probe(dev, PTR_ERR(phy),
> +					    "failed to get usb2 phy\n");
> +			goto clk_disable;
> +		}
> +		phy = NULL;
> +	}

Looks like we don't have a devm_of_phy_optional_get_by_index()..

> +	qcom->has_eusb2_phy = phy && (phy_get_type(phy) == PHY_TYPE_EUSB2);

phy_get_type() and generally all PHY APIs accept nullptrs just fine,
no need for the first check

Konrad
