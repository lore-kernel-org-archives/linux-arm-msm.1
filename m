Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD22D288AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726435; cv=none; b=tAEZ1BxnI3CLAeE84I6hnMrEMegzOlHCUPdo4cv/ACoTfKGeWJHq6TAHPzpEgu4heWOboJHRV+ldMFyHlUeX5a1dR5o7FgSCHaG1FVK3QTM7LNtDKsE4Ea3WDlbFPEErplDtYXPeBXDnOQz+KbPwWiCqzOihduyDWb4QOcr76Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726435; c=relaxed/simple;
	bh=Ib2fFpGA8HXSvCdKaT+K1frPjV6b7O+Vuez/aXtxX5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQPYFnzcQdULMdtnO51CVDIXgEzvCw9KD6LwRcMWR5vxObooUkI3k0PfXTJ4enYubUvBZyutnR7M/TAmN4j92yb0fwl5o0csYdSq0Yi6VOg+5dS+o7+iuNsyEPoPineAYUxlnGg8U/hxYTEbtpwqLrM+24rpBvfACYW0BFvHXYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOuVGQZX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhTmRs2u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOuVGQZX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhTmRs2u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD1pqV791697
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rIMkbAY2u/8YcCwRUcpBFhYi
	OZxj0l75/x2ZVLsA0S0=; b=gOuVGQZXUOAI9gR07CVmntFHO/D/BMf5OOKh6cAn
	M7zA/9GG/q+fri7cpTjqHWUWBQVoYf9K/N5qq87Ny218V+17xAU5J1AeNqZUm323
	cs9gOQyvJX24HLjr64uKE8aF9hgjter/DOgz9Rk5mPghfnluklueg1PZJGGBPO4m
	0DwkAjjquWgBFP/RQfRtOlnTSl3M32RCYVgqinhQABR5pA4P1/8fjEkQtjZjm3iJ
	hhAz7bqSe1U7tDaWkHwXmpNKiX+8c59wImhD0NVMhD7xj9lTXnlgHgU6Nr/n+P2/
	58aKxEHfnS7m+abiG2z9AoKZAQsmN9drgpAxo/XQzh/M5w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjntn29wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:20:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-971ff89d7eeso1781394241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784726432; x=1785331232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIMkbAY2u/8YcCwRUcpBFhYiOZxj0l75/x2ZVLsA0S0=;
        b=KhTmRs2uuE/7POoUXY3WKzd8gsrkbD1GX4OTbo+feWsjAyF+NOL4CeZBFtkXTSRv7G
         h40EkZP8X4XlcoZpVmy7e6iTGd8e9G1as2dJtYdRGs/Td/To8deMAAchhOY0IodbNJtR
         r41w4gmI3WVeYKv56ohgG9iqTQC9IssyPloxCn4HMYJWzEYrVDAUhzsYTzNHWJpp0ksB
         zdWQ0Gvn5oWPWTn8rQYYsFPTv+gsqw+H2Eg32CBNE0SNienp6VSpVQxf7yTzBmhkVv2k
         d2tbh8xJptJA5MoR/nT24lC0OklRf53aOFtehGwlj1xbHAJHyf6m7oe/S8TE9Lf0ujYm
         6T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726432; x=1785331232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIMkbAY2u/8YcCwRUcpBFhYiOZxj0l75/x2ZVLsA0S0=;
        b=Ivo+J2c9vjYEKbN/GYpBu6gBEsi3dUmO7moeNRG08JqhBvcCBlM4O4KRoIzpQU6SO5
         YhwmHO3iscGHGgHM17suEAfyTTq6h5+mjtYOBIopsePGm0xUTg940f1D4V5beLkxOrE3
         lqxgRz6vFtGKcXG7/UYTCeTlD63dpbVPEoCGebSOcZHN5suxD3L0IRY8PaBciERiXTAl
         JPydy48qW5sS/0iHY4CLZHQRj7uDNVybxBjfRUTC4yQgIDdbMeAWyQLmLhiQqBIg+L1i
         /hN3H1AgxYYxrDbzvQV2DmSDkGoorm98L8ybNCAh2HfFwl2dPXFsn1fF33/vWui50GlJ
         jXbw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9nNdtADVf6uYlw9ZTU7yvaipXpxOGfKz6TmEskXyrt9UL3uecsykH3wDqcoZvzgIYT8oQXe8APXSvqoha@vger.kernel.org
X-Gm-Message-State: AOJu0YzaF7Fexo/2wYU+45axD1u2CDFprMAKrE8kINCdmmzlRstW4+7q
	i3O6RCMTSzXnA6Vyr9JrKL0SrTt3EfLb4qFeDS43op9BEI8sI424UBVg7Sau7vFDwrYm2YAZa8j
	dTgSiu7fQp502oOR5ExWCFXQBVTEUbspkcXEk+ZMDNqWtAsR+oxueoLW6VjJF9AD58ZuP
X-Gm-Gg: AR+sD10YZohTxJrRb1ONcfUW6FpJjjVjwIDDfWDCZI0wNoFFgFiHJe9SlA3t+3LfNgr
	Z7o45SIEVGji5LD+7PqzanIVoFPrfXEZCXuxBrqeX+/nBqAVR7uqI73cCEqLqwppoZ67PI8LjLR
	W25xreEa70DKsjfGPsq5wDK1Bj4wyI50vUVRimCHJrliBKFk2I0Z3KgPselTK75PyS26gu2C/XZ
	3MRTj2A/u+mlu9DSIW+Fv+karE9JEEYZKy3pMNAITJ+tGJtBPLfflgz11xEbyd1quMG3RWZ3aau
	T2HNIso+tJ8jB7SxsOvuOv5IIJBiFKfi4TmLoH9RE2EQmbqpEMM88ZPYy8OjOSzvxXggdxwLIOw
	TziL0uLKGhlVwxYzPMBoBwdAf9+k1ypvhJoEAW/jfR+mBnT3NQ4ISvkncz04TyVOZh4rl311alJ
	OikEkZB0L19p10HA==
X-Received: by 2002:a05:6102:4490:b0:739:8c52:f2b with SMTP id ada2fe7eead31-747536d3ad7mr7088766137.18.1784726431988;
        Wed, 22 Jul 2026 06:20:31 -0700 (PDT)
X-Received: by 2002:a05:6102:4490:b0:739:8c52:f2b with SMTP id ada2fe7eead31-747536d3ad7mr7088735137.18.1784726431425;
        Wed, 22 Jul 2026 06:20:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef68b68ebsm4860331fa.10.2026.07.22.06.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:20:30 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:20:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v5 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Message-ID: <qf2qoy4re4pk6tjoyqohfcj5odlsccfj33rfqanljnmr3v4yaz@v44t2vujmhoy>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
 <20260720-monza-wireless-v5-8-69ec6743543c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-monza-wireless-v5-8-69ec6743543c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJsSZ1gA c=1 sm=1 tr=0 ts=6a60c3a0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=huXO1bx5tun3eLEzRFsA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: RfNRVJzHiCIK9r8aPZkirYFhSXT1S-Hg
X-Proofpoint-ORIG-GUID: RfNRVJzHiCIK9r8aPZkirYFhSXT1S-Hg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX4eNXxjN3CGOU
 jL/EqUAVjeHo3NVLsz/oKT3ZnfrKeDPuwaHGaJrYpw0BdpACiIvVrseooxGDO8rhcY/mrWuIseY
 2CJrxfDiNzjwZHYSfLeIcyIPRv4x5Ic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMCBTYWx0ZWRfX9gh2Mipjn7dD
 +gFfUrP3pw3VAQSlsR6tLzWSilpOZOuc+tzaGwk2dermSIvnidpyB0uRet2XVKxAQGgwfw+I/br
 88aDejG5QMTFcK2qs3IJ4JMIHuMXgK5kgAZvAAXpi9GME4ILfpn/58qDLtKtYBUBioJAkxrlYLE
 vrYXfa6vvJKRGBFtR9+ZecoODZ7IOfILvslJuxqpvY5dN+482yZhTqjGfAT54ShIh2LUnBhOC/L
 /qTIqesn7vzv3LU+P6CGlDP5Omm7p7vSWv63ZopSiJonPYBGA6n9xrBeUn2dimvRnWxrzZf0N/g
 NPdV7Ej0fY324G1vaJ7rhOKCRUboP8vQ0X/CcWjUK59cfeR+ck4GqRtr0nMiBjsiVFHgf6oqO0H
 q4Rlg6vGHT0uH+XJEk3pdNs/PWrgmVVBkqxULakowcWK1qKtSjwaqmfFqnin+y5OhKxjZRSbRo4
 3eaSSxdfivZEfCZn35Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220130

On Mon, Jul 20, 2026 at 10:04:10AM +0200, Loic Poulain wrote:
> For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
> controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
> rather than a dedicated BT enable GPIO.
> 
> When the serdev controller has an OF graph (indicating it is connected to
> an M.2 connector), acquire the 'uart' pwrseq target from the connector's
> power sequencer and use it to control BT power instead of the bt-enable
> GPIO. This is factored out into qca_serdev_get_m2_pwrseq().
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 47 +++++++++++++++++++++++++++++++++++----------
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 7e4cb03d3db0722e5f9fa2e7a5a9a0894bf4f18c..8496bd428602c48d093bc76f9810abb9b1c43cfa 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -1872,6 +1872,9 @@ static int qca_power_on(struct hci_dev *hdev)
>  			/* Controller needs time to bootup. */
>  			msleep(150);
>  		}
> +
> +		if (qcadev->bt_power.pwrseq)
> +			pwrseq_power_on(qcadev->bt_power.pwrseq);
>  	}
>  
>  	clear_bit(QCA_BT_OFF, &qca->flags);
> @@ -2387,6 +2390,34 @@ static int qca_init_regulators(struct qca_power *qca,
>  	return 0;
>  }
>  
> +static void qca_serdev_put_pwrseq(void *data)
> +{
> +	pwrseq_put(data);
> +}
> +
> +static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
> +{
> +	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
> +	struct pwrseq_desc *pwrseq;
> +
> +	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
> +		return 0;
> +
> +	/* The pwrseq is looked up on the serdev controller (which holds the
> +	 * OF graph to the M.2 connector), but its lifetime must follow this
> +	 * serdev consumer device, not the controller. So acquire it with the
> +	 * non-devres pwrseq_get() and release it via a devres action bound to
> +	 * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->dev).
> +	 */
> +	pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
> +	if (IS_ERR(pwrseq))
> +		return PTR_ERR(pwrseq);

We really need to add devm_pwrseq_get().


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
