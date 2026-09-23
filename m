Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FAA51C043
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166738; cv=none; b=M6vCkc5kkp1kdswDzwbsgd1xCQqQW9DBMQvhIhcWOaNxFHpXgiVxbvmArIzfyHXyXz/GIdx0du/XujawAS1VLpatr8sNNQl3r5ieXoRHv/4Zo/RKsH71uNx4H69lgK6yhRcm2gF37fxM5rLbOWRsr66wghYGzwel+kMNbu/7/fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166738; c=relaxed/simple;
	bh=U1wE6PU+rh41Cle3iFBekqUZh/m5lY7C82C6RiMSsZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DCK8gHFrGVSEG+r+tYa3zDVXHRhg+Vn+vLcmeJyLNuxwmRN7ok3U6OgokL5RAY7nHC6/6puXbcsshw1QpoPtvrkkQmD/X6+dYO06ShJb3A6KSAd0CENwYlJHDwLAbLx2WTn4B1eU5kaHQvoHB/Jq01KNy8jVyYpRTteuxvXJENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcEO1tfb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sc/P9d/4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcEO1tfb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sc/P9d/4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBcorr3161409
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wdMS8+R4wHQtzwHsJlNh8jeKE2W5D1KWqQU43Szma4I=; b=mcEO1tfb4QCYZ2VO
	LmUNxsFxNIJJPSLGbez6p2cOiktCBAu0cpl/qGE6ixQj0RaQO9dHPJjlEKT6zFTM
	4A5p/Ga6PoRTkNlcRf8VzJArzqTBdMxcT+5g3ORHu8vIaLUD132W5216d9kY0SQ2
	hrJPQdYkzlCOn7eZwtyRchj8aNxzU0LYSVRu16HDD6UfXByv1xmXepMGmHyLI0Ml
	bEwUvc+j1HoHQHMCakRlpZSS4LGCBoUUcwaKEBL7rAWgYo93j52B/U+Cd24SwZT2
	OVFRPrhh6zgNqjngRSw8hNdJ+Y2GH0GnLXLzJ2z+1b5UhExFVhr8vHnU2w5sh0pl
	6lIo8g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qttsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:32:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c84b0a43efso74989e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 05:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790166731; x=1790771531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wdMS8+R4wHQtzwHsJlNh8jeKE2W5D1KWqQU43Szma4I=;
        b=Sc/P9d/4R0zK5q0cVnCOo7BnedMkpf1FVR6lKNMNNwJNVfQx8n+ggYXr3jPQQRazMe
         rTqaRP3HAmdpyrXciTQYudw1NeWb6Dh9k1Lh9gaNdHLVHa0ZzOWcNVi7klB6qCop4Bas
         KKIACd6gnGYNGh9S57gLFHM6q5CZLSsSuSsfife6YnHDXCW5Wwaa52RDWHZTFH43VtA2
         f0V2dgr7vfjOWmWIjxBDBnBpCgULiBng1Gc+3JhdcUcLs1wQZ2iPfQX8hK4msj5afs/I
         e1X0cBI50fUU239Mzp332PFfkI7gnTsGLQtqo+uThcxK9IaUZIUmifmbIjrjf9WpJA4j
         gqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790166731; x=1790771531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wdMS8+R4wHQtzwHsJlNh8jeKE2W5D1KWqQU43Szma4I=;
        b=gXrR3g0qZX9YbxnFZLGFRFKaTtp0N3nN7WOv6+v72Cqbkx4wTIhW3sptyY5I2vMBlN
         zcBn0ixOl/EgehLAVOaUSinnQk8AtTjU+zZX96OgTIolTLO73vPRzjdGfR4doSZkD10+
         Twfq9u5nht85SmC3/Nri2ryvTD7EtXrNWx+3N9Efenb1zwOtGWVU5l8NZeC1In6JEi9X
         j5r5Uk99/lXXUn02wjIrvZu7H0S9PRLHQL3BxubPbzFTxexq/CBYfWPVVK8nYf+alWfE
         OheqwAlJER7wDGXhEjStT39A1oaGbA5ARwoAvfZVfEWkvMUrJCXgyPhSJmCUCsXecQpl
         c9Mw==
X-Gm-Message-State: AFuF++mxSmBP2DkE4e12pCW73k/UFfP7g1zje7OeBJ/ZtOiTM32UMyO+
	FozLkNZCRXv6wfRUiyivrG5eqOHfeG0rI7dESQFjWeqpsVry3cdd6fokUziau+IqvUPXmVCJaai
	XpJanjeI2dE1sH6C9iYjIKa9/+pmHrINu2RASuPZ/Pqv0228k9Oh6cfmdbKUiN8fEHPKb
X-Gm-Gg: AYBFou3GipdwtTg+69PifjGSQaRP7x8cAfpu2RkfXp5a7oqgwp06j761gyNkOrBcYq9
	Nf54hs+wcmmqT+h4C87YIhpv97MLzFcZGwHF6OgSWzIlWxZz0o5msDZjvSGzEzIycM9BslQ2P/4
	NsUO3rwTeDla2fh+2B/BMLPCdp60J2wpbEhuQxbRj67kM16uCHufWlhkfNtTQ+uJqWx38y+vnmy
	KpV1RdApKE4ovfjaym3TfW8d9HVkj8CAROMb+X6vpDVJgjp2YN/LYUu7BonZfZfykW2cumoMero
	k3XLNqSIhzV+r7NHMHVCNIlHpMQiR6jk7QgMVWq2rqsMgQ2iMmZvcoUsUCyZeYC+CM0gfjxAe18
	TJdJFLABXWsIvGA9RCo0SWQ==
X-Received: by 2002:a05:6123:4214:20b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5ca737615b2mr333064e0c.1.1790166730794;
        Wed, 23 Sep 2026 05:32:10 -0700 (PDT)
X-Received: by 2002:a05:6123:4214:20b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5ca737615b2mr333039e0c.1.1790166730415;
        Wed, 23 Sep 2026 05:32:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3896a53sm1485858a12.18.2026.09.23.05.32.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:32:09 -0700 (PDT)
Message-ID: <ca7cf05f-0aac-4603-a362-0bd4c3193b13@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:32:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: qcom: monaco: Fix pcie1_phy compatible to list
 qcs8300 first
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20260921-monaco_ep-v1-0-63c5282fb0db@oss.qualcomm.com>
 <20260921-monaco_ep-v1-5-63c5282fb0db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-monaco_ep-v1-5-63c5282fb0db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab3c6cb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jsnCtpYymfaPz7_p4TUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: iwxL4Za35Lcli7-LAMdbdKLgCfhyqz9z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX8ea8MNH0sLii
 XJF+MZG1wsyQjPGuj683SFHz8kb0SciPuE9K2x0roieNo+mxqOfa2kjrAHzBnAE9qfF20sTpJGZ
 4CwhSPJGE1580QcFESnsRRZqGCvb+5k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0OSBTYWx0ZWRfX9WJiKBB0J8Xt
 zEFMzLbr2rtJgSCUNw3/+HHBO0RhECLUDf9JQmm2QGvA8IYt/wNLrdkxvUtkCIpoLW4lJFajQu2
 A+Zfb4bPVB4Dc/TxkU1zsHRkcbJo1isqxWArCDVY3BAoF1Re4Pdv+Ke/7ZrKZQWLiNeK3XLC36e
 JWEiiOV68bKsQCGI3ZAzuHyhUSwzOoaim8nUyJ/qlGgv6i3b1EXaG025xhUTYmEXyM3bHHfu2GJ
 fclN94G7tCNgREiuc9OsrbC+9kWpM4Nn45bbCKFSB3OL1co66lZMzikYKAZ7UwQrIy7vvBhr7ca
 uKKgKkeaXLgXOVZO+geKEaKwV9DPkM01sW+Z9PLrluBX7zGAwxy1fG8DN7VuH1pmi2kUFD01hcz
 yIUHKLYy3OS6DNx8BWLz8e1WQaqzKyeugBeJqbQYANG1ADqUkE/H/E1Rl5icUfRAKaOXoh+VjN2
 x8DMpkEGQJ2zrZndGIg==
X-Proofpoint-ORIG-GUID: iwxL4Za35Lcli7-LAMdbdKLgCfhyqz9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230049

On 9/21/26 12:58 PM, Krishna Chaitanya Chundru wrote:
> The existing pcie1_phy node only listed qcom,sa8775p-qmp-gen4x4-pcie-phy
> compatible, since no QCS8300-specific compatible was documented for this
> PHY at the time.
> 
> Now that qcom,qcs8300-qmp-gen4x4-pcie-phy is documented, list it first
> with qcom,sa8775p-qmp-gen4x4-pcie-phy as its fallback, matching the
> order used by the pcie0_ep and pcie1_ep nodes.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
