Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6404A3860
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842027; cv=none; b=tcGorwsruqKiWSYMH71Whx8wDMMmhAdcnOmCwGs8FlPuLcpUZzHwr6T2SJBr5x7pwRDfwlqY7c1ARmJhJ0cnoFXnpTOIZRt5mK4KpOaPNuQ5NuZMdDTDduYu7h2wTPYBkQxeXtlw1gkYvCAYwPFBfajy9KKbX69uedQg/3WwO0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842027; c=relaxed/simple;
	bh=Jty/f3HWkGXalx9H5RrUnfAswWl+v0AAg4ji2EBfru4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BY3xR7Y6hvLX4idMcvovhlVlTFb/uZFI/59+W5vEQzGV6Md8lokPPRTGOMN+ST6irUDfNh+6mXzUfaVjtFNpmcFtTY7SjLXts3sdrQRC9IICWba2oQqbl/zSGjD7lAIdQyBi/GLHR0PwpYAtjJ0csnzyKI/3rjRONdUhXhz/xrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/byryf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DR7nTxph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/byryf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DR7nTxph"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xPCc1933080
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 08:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a2+uakS3SXIfKHjN/Q0tB5X3dTaJ81nHOC9ZuhbU7rM=; b=j/byryf4F4l6haxs
	m3ZK3HLk5vi70FELPX44Gh35VFEFbtOEL2qNIcAo7uyLNg7G8YkIkevOvLzZjyUg
	Sk82MAdlqnSVaUXDAo3nfsmoCFcI+dlDt7UJxZwFqYs+RL/xf5f288dPaqGPE0bG
	SYu0dO1tus7/rih/JD/5qvhy7xbJHBr6ng/CulIZvm0VaX+EQNa8h8I4i3zGWhXp
	q3SmKQ2Vudla8OFuW+BYdlSpFl0vHgOIBUe96ZKSuwz5fbHKsku3mWrMdv2knM01
	fVZKl9279xgjp3FZl7+aq11BjTInopj1ZKT1pDORn6mxMzPca4/ckm2NtU3OEFok
	ueGOBQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1jcfr9wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:07:04 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a54501a8so2750346d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790842024; x=1791446824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a2+uakS3SXIfKHjN/Q0tB5X3dTaJ81nHOC9ZuhbU7rM=;
        b=DR7nTxphg+hbQgkyK5x9IXsaumLXlpugnQyfyMek4MED0SsYYxy4LBFSA82LrkZg6N
         cUI2eBIIgqN5DfeMXYV1VVmJuVlNP8jafKRnKmAQ43M/opi+fT0MKo899BtTUyBzmU0k
         ZkADGwuBy4pLMoT+jM/sYIvVRRwp45TAeYR2eUfwU+jf62Oql+kcbvLAqLLh1LwW3xk/
         wgsR19KLHnLU9SbAuVPsGWIVwY515bXsO2jc0hiZtW5MGVKmEKlvw8zEY1NPRMsezjtq
         LXe9peHzJVSeNJMA397l3xcDmwJgNcS3/5Xp+nFINWReZPXzHZ323bfyhiXNERIXTIz+
         bNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842024; x=1791446824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2+uakS3SXIfKHjN/Q0tB5X3dTaJ81nHOC9ZuhbU7rM=;
        b=KmB1eTUPMrPwlLjt+XgFSA5lYI1LeYwUTn5Tzufvsqcgqc+weEyatrPVx0jScIbZ3M
         36tfUQ9XfjOL0qPQQEJxpF+4DPxUzJ9fCIB4p7pLpqJlVqsqp7u03l0Gho2z+oL8/lRE
         tVaYCLSgDdhnM+hxWtxGGq/Ooa6+Ar/z2b5igLFR0xa6OgM1mIW/h0PCiqADOThX4hZ4
         eccM750p1kA61BOFyWm5Fp2tBQQF54sLl2sAVEpQjSPMz2Nvbxq5530zTyHGRRgi1QAS
         j6ZIBnYER1ZtW5+Of8m5aPx265pnQMjAEx/q53TBzY70fe7mEgUbSSCS49xbOiNgOHh6
         2qrw==
X-Gm-Message-State: AFuF++mHGhg+2tBLIqXqS9lpLxhKigvTYRQ+l9UxuRd8Hb4jrrHDhENJ
	QFOolojEEkezJ+RPDPQSQDsUHZDyfynfJ0ObZvCQl/kz2U811BM+2lGVPVU2852gbJ7T0hmpG59
	k3O/8NCSXmJkzC00UctLiwz+gYbHI0W98juipiF8Y/u61yXm5k9rZTjTAI1uRj2jHnDgd
X-Gm-Gg: AYBFou1qTPyEWC/B7hHdC2sbe5WmZEbqCmYBqHS9dSY3RA9QeI+aD+CAYjAhc0VtuJx
	l+2GuK27UGdPzFgfDKth6V2e8FZBjGirCKhv/VD765iEPl8ivUojvRjI918L5JcM5TuIc5KoC/9
	WYXZYz/+r2PnC4w6K4sajH19kcvUFAx6xNt6j1TeiJHmlf8D9wk4cRr1TUOGX1xu26VpeOfNVxt
	LWvtJmIjb4g7ldOZ4HtlZGiTFCcfYATFF7BqdTLMxWjy6lO44AVdnNnQ2Y1cpaBPby+vXoNno//
	j4MWxjqpPQIO7MaDsix1wF0CdJGXZn/jl8Vtug1XGm1eAhouJ6lG+OMCRnpE0vfhoqiHl6CBY9S
	c1J/+sasLtnlwH4nr6yB7Eg==
X-Received: by 2002:a05:620a:84c6:b0:93c:9e43:6807 with SMTP id af79cd13be357-93ca97b92eemr630027285a.3.1790842024119;
        Thu, 01 Oct 2026 01:07:04 -0700 (PDT)
X-Received: by 2002:a05:620a:84c6:b0:93c:9e43:6807 with SMTP id af79cd13be357-93ca97b92eemr630024085a.3.1790842023633;
        Thu, 01 Oct 2026 01:07:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca72d4esm648046a12.25.2026.10.01.01.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:07:02 -0700 (PDT)
Message-ID: <12e76437-c2bb-40b5-ac9d-a6f89f5f3999@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:07:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
 <20260924-phy-v3-4-088e7be0cfaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-4-088e7be0cfaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX5DDXvAPKLsIb
 SuiTCZ5i2DUJ7dX1dkdoq7zUzv66dwVItzF0LhgCq4e4OnFhia+R70lS73MhFzkVyQ0t+8YrsBc
 PtpzcVWJVmcvQ+DyTVoXuGNgYzGRZsQ=
X-Proofpoint-GUID: BIFW-aknWxlNLu8auC5N3P17mDOWMvjl
X-Authority-Analysis: v=2.4 cv=b4YncdGx c=1 sm=1 tr=0 ts=6abe14a8 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=lPcTt8mPJekVWdHiCMEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: BIFW-aknWxlNLu8auC5N3P17mDOWMvjl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX9Kn8kmDGo9Y+
 56z9hDUthcSsVp9izhFQVUPtXzaySACMOayhIsH2lGhgUiKnsYBMQ0l+jRezU0qJ6zHTVLwKmXv
 8t817Pb6+Fl5HtGPAfED1AJZnR0BbgL1ty+zFYhQ1l5yCgBjOdh3DXuGZ40YLFN+6MwEiyGcFYt
 Udr6P3FPYENOB8ETjCyS5lOKwouHxk/kxUKrjeb3c7fASZA0o+JUKcPRbcgay9eihzHxGIqB9s3
 KROBM85Nna7/sb1U8D6Bs43v+0KeuBbrU4O3qLzKWPefza73a03nX+hIeJbHVzLjJsUPsz7RcUW
 bDOJcjryA35eBPbq8AgLLAUu77Xv91+vAYZtC1e24Laq/Jmr+Ay9N3SX+D3IwDDDQK7gPlGZolT
 bWOldX+erlmN+RxOnJ4ghdgu7s6+qvvJ971RTvgdAjER60X/zwUtmWDbFhmXD8xrvZ/XUj7POuV
 KCMyjEcp3rJKTRF3zAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010032

On 9/24/26 8:10 AM, Varadarajan Narayanan wrote:
> The driver currently programs the common PHY register sequence directly in
> qcom_snps_hsphy_init(), with the fixed register writes split around the
> override parameter handling. This makes it hard to support SoCs that need a
> different sequence or different values.
> 
> Move the fixed pre- and post-override register programming into per-
> compatible configuration tables, and keep the 7 nm override parameters in
> the same match-data structure. This allows the driver to share the common
> sequence while adding SoC-specific sequences for future platforms such as
> IPQ9650.
> 
> Additionally, address the register bit field mask & value mixup for
> USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
> in qcom_snps_hsphy_suspend().

Please separate this out. Otherwise GPT thinks this patch
looks alright

Konrad
