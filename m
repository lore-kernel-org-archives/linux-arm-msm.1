Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871A847ACEB
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268903; cv=none; b=fwSgU2FS0jsfMGN3AfzYLHabo0ky4vpEbsWjNwWuAwcZByNGU6Mtw7KyPymoE1fNadTGvsyMBACeYrqhTNTSpd0im8KRTiyqVPkr+k6ksYUPlDRXGOU3WZuWpLLliNIONg2/nPOh6d0NRxNhbcexInKX3nPxPlA0JHD6lgMVowg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268903; c=relaxed/simple;
	bh=qJfVo8NaWUV3he8g/jBVBQ24fD8jjxPCQ2QJcjp93xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bi/rKULHTEdvU+ej1dtncfRYIPrLp3xZCmwrtGsuRTzZoL232Pp3GijUR8nTFZkI6UvTg25rrbNvtIrxLgkL0aCHbsiOj29lw/kuyjoL7rZ+Uw3lwPSbhdNkATBgIgJA/BzHivXSYvI8dprnuYDrog66sHhKr9sVICooZlO8y38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HC5Iec2w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqeRDBqG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HC5Iec2w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqeRDBqG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJJ7h2241828
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 13:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=; b=HC5Iec2w8Q0r8o2A
	gfZcfMA9VCQ25Uo/i7Hq+YU/CARRMRIHDaWAE6sGzILPk0zqOr2cDoUK9dMVF1eB
	/YbwY02vuOH3zSeyfuarRA8HACvFGdQ9ZinhFNLZ/BnPkjA0jk3IHlmdOo5DYMnL
	DrljuhRUt8Dsd+0H9kIflADs+CrOjees55BopLaJLEJyMlJT6ok//edN4L3224L5
	VFXNeaEmRI29Oh3LsyJW99LNoep1dIr6NyOVrgx7rpOBhXXd5OcukWY5soXnbyr+
	Q3NPRYh3A22ah6fqKIYFDV6sDKImu0VZiXh2uetRTv9gYY3b0qM6ryopeTCXFMc0
	DMap9Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdvmm0r0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 13:21:41 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c6645a6ab1so126536e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788268901; x=1788873701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=;
        b=fqeRDBqGCgzZFU800J+yoe9S/QQGT1rq+KFBxAbJJp0VPDCVBGj95WdH+UQD3Abwv0
         1aa2Jh9pIJD4bI6JEHveMCQ7wqA5AoBet9QUFpgIsl9gZS/cXqvwTqA+fw7tOIyt5aHs
         +Pnb9UVw/dh1E3IbztyUbmqCmpI4vw3Kt1+qs6gL4u7ORCBGbbzB1UgWHnCUDvpomN42
         KZHVOfHIy8M4cxwqwqRqT4BR4cgfbk4G6uVlJkKZ6HgG0VDhpBfkMg0AhJRrsobw6DhR
         ccJUMal0eH8MI3KkH1YUpmZl7jlakU24CMY2htIbGCwgAn2SC8YJpKb2NDctF920FFUj
         Kynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268901; x=1788873701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jSiZjk2rYPgMxkc/Mk6oF6H/vSiu5oWVsT6MYw51UtA=;
        b=QMdFn4/HuR5y9XcYnFVjmvc0eKV6hBm+5/DzReJyIlgCkviQrtp4TRqk4GqM8ZvcCj
         IGU21fqclmldiRGf4GtL93gDhcHG1GUf/xOTZRWiSRM+9ou/kJkpsHW0hLH/3RiMWj5T
         OlbsHZMZzjJIggqHFxaNsIwsXOLSBYs2ihS6M3T+1bi7gQ2HCWFjf0NO8NNsNuihXahI
         MoM8GNreZ1oRioa6j+u7FJvik8NfsNazxawAWkd1IdUswajMKJJWfXXn0LrN6dWstMO0
         CcE+tfIFGWb+/aedeZwUtaXZW29Qp8jWbcf/1zgApKp3DadJw8QzStVt8qMiFIW8zpvf
         uFCQ==
X-Gm-Message-State: AFuF++mb5E5J6TswNTn6G2Qdeu6AvKFACoJ9JJlFK+44DsTTpLSH+HIR
	Ug2aOPjIr1MEc7BjPH9O09LXJAX9EWHZ4BQKsStS8SRwyNkPhOVvKMcfWtbnZrXfi7Wqmk73aUc
	N+ruEiD7Nor7NVjFew2zjgOav9xPEcWPtPmiICzCjKXef0Fh/Asu6WDBEw2f9jgOUqSic
X-Gm-Gg: AR+sD11LD/TGD9IT8eu9sMEN3gib4mRd1h6OXi+FGFmZzDU7e0N6KHmXAoXRtteiRzV
	BDbLAI+kj+Cx4d+jz1rPuXJ4Mc3ulwXGvpxCiiZinK577gm8phsYruFLCjLwk3t2aMa/e5+tbRf
	M7FbET1UVWAbmsrAJPVjHAj/P+6iRP+kXNyp0hSmXMAIe+PwgdHpsAl3HSE8Gx3++uTDmlHTog4
	g7cNfxYXRZc+yCIaHaiej+4/TJ5SO9W/02zklz0UbvjvwcOriKZwX8av6Bsz/l36EwMe/tQjUMT
	S5arVJ/1NJznVx4LLjr0+eIgxK1i6dqtpjpJALrvNK4Z+a7u/kio5WduYGK+VUw5Xv/ja48ZzVt
	1efq9nVCJlVstQl+UncehTA==
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2441017137.2.1788268900713;
        Tue, 01 Sep 2026 06:21:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6a84:b0:786:8d84:5aca with SMTP id ada2fe7eead31-7868d845f20mr2440992137.2.1788268900215;
        Tue, 01 Sep 2026 06:21:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b605b17582sm57141e87.69.2026.09.01.06.21.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:21:39 -0700 (PDT)
Message-ID: <773d4d11-dedb-4630-bdaf-ed9bf5dedc5d@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:21:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/12] phy: qualcomm: qcom-uniphy-pcie-usb3-28lp: Add
 support for USB3 PHY on IPQ5018
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-7-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9_NoNpIgpENgd_1qhIaCuHGF7ZoO1A5B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX746v8FvL3wo7
 0oCbyQcb1m2Jw38D/0JhCFPe6fUxwv1xdkM1nS/nFByb2AexEQvidznd6Gxe6fKCAJnKOcHCu+d
 GGiS85OReme/f4XEStGvk1Ms+G1dogY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfX9mNbGd1GphpG
 Eaj/2o+dd42fMI+EC2VlaR5rBMQ3CVzQnuEobLr6C1zB5pjL7Me5m/0wPbY3xobWIGuegSUS7SW
 qobe9YK17/kax9L3RbDvSYbL6/QQNWiml/9uw/OHQXJgiddcA37zWaCWv2IvrwBp/+TEN4buDY9
 aos4SBs3t5yJmYYVV555pjfNyAbjszpEBZ6uvWIziPHLsh0dtwD/T9QNNnMvrExyYImUxiH+nee
 JdSyLSxwqsKXroPcQiohGRcjNF0SksC8Q6/XJNOcWdUOPySFbJNl7n9mmBTXlym+5XMThZCItU9
 ox6YzyW/RgKSkUS/kDMmTJspiwv6RWh1Eidar2stzW10bX4OUYFCj9BYRjqXb2q+pIOJGh/fsNS
 aeE0Tq+MkQnipiyIC3ZFZ6Ra42jltLmPgs6/tfrPM2vllylZcts8Ujt6ioc9xRVlyFtVkbXIjcG
 7cw/af3pmZ1mQ3W6NKQ==
X-Proofpoint-GUID: 9_NoNpIgpENgd_1qhIaCuHGF7ZoO1A5B
X-Authority-Analysis: v=2.4 cv=GfwnWwXL c=1 sm=1 tr=0 ts=6a96d165 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UqCG9HQmAAAA:8 a=xr6W56IWL_GKtPyFExwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add support for the USB3 PHY on IPQ5018 chipsets.

[...]

> +static int qcom_uniphy_usb_mux_select(struct qcom_uniphy *phy, bool enable)
> +{
> +	return regmap_update_bits(phy->tcsr, phy->mux_offset,
> +				  TCSR_USB_MUX_SEL,
> +				  enable ? TCSR_USB_MUX_SEL : 0);

regmap_assign_bits()

Konrad
