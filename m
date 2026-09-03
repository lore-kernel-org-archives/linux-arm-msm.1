Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC00B4119F2
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423047; cv=none; b=rWP46lwJ6ne93ThOh9pOqcFq1JrrqjdXTZf41tGxarfQxJhps2KKv1N7t22scqnDJRVpxaInRX5UfoN84Jz6J88kj/A2zLXOEzFTDS+rM2D5NQDaK5ikCjW/oeJR7MNRESZAD3sIKj1UjVRu1svXUjbJc/yV7ICsgpV/W5Fn/p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423047; c=relaxed/simple;
	bh=b3aHP4glpbl5TnB+5H7BPBdBuPy7x4QVRQrW1rbJY8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egy06Z0TKZCxi2m8n4rw+2boTPuHf/kJdyxFk5Qk+V8KObf4DoupR9VL6H92S0Lm/pbox/v+sC6ic1QzLHpdTdYJEiLuixIvhcA8r0Yh5jqkK7Ptm75BBFK+6FM1WBemE+IBte/mvqCXIOLiL0jtT09ts1z0ehHcuuLYMbAqGYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n+J2qPMU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iqrivUn/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n+J2qPMU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iqrivUn/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lreS3642515
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 08:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rMpUqgqgoWZTEb2f9TIxt36dAocZg5MO4USy9UOEEYA=; b=n+J2qPMUlKB8Axu+
	/FzNqZn3cIK+jrEKtB9/xJnmyShpH2cWduaGLR58QG02VPUnDfskp3+y/UFJQuQ/
	QeHXA1fwg8VfKku2+1f+P/M+SP04MuuFdrdrfCT+PtheaHponlf0UoDtUDj0M7MI
	CwKe0I4LQa1IZGi7jcB2Exk1KCbsRcm5gagwJ+pnEsW2FDyRgmoc9cXYkkbx85u2
	4WshPQEoI77O/pWuezCRRX92sbmRirXr1wdYfot889OQgQXKto5QhDeOw5kPPDTb
	m+tkxxAMImN1oYWKmu7/4LA7ZWts5Y83ilJIWzGg/CSoLGbLJeThqnHkPCDW2O8z
	fcdU+g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrduv58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 08:10:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so53383285a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 01:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423044; x=1789027844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMpUqgqgoWZTEb2f9TIxt36dAocZg5MO4USy9UOEEYA=;
        b=iqrivUn/SFYlnVDmvwf3ykGCWHpnS5dNjh/xyZU/qWyv7EJEFsXKS1IyPU4WivTWwd
         9N+YHSRFE10YUoQahk1eqrgNeQ8ysNGtu8+3M/LG0hmFTGq1OL+3RKfWf+a773i2KMcl
         xXpOuQz1s8aJIdV9UfPMnu0tOL+RjTfASMU7PpdY+EPMEhHcxwNc3gjM30t3SrWZM00G
         Wc1+9/0f8l0ALA1Q234Xll2MhdjSbDfXvJ0xnw6vGPlHCGZfQy/jFRfBVtClelWdWOyP
         zC8jUIFmLJxoQepyFEy2YTKxAhFtf+rvE/fJsQu+mqmKXHMki6+BQs4ecXf6OAX0bw87
         ds5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423044; x=1789027844;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMpUqgqgoWZTEb2f9TIxt36dAocZg5MO4USy9UOEEYA=;
        b=E/ce9S8T1/As44mv4UgnGEHWvOY6Lrcp2vcRq3Uf3hxWlCKsBrkQDXQp4gkB0tG/a0
         ed0zGjauueuccwMgkz8UhK59LF0g1DPfDBAmQ/huaiAxXtmjM8bvnnA2IRwvhG2RbYjQ
         b4XdGaXW5SqwW4Mh6TB/01WsUY8V76ZQii/FX8OoZCXws0YNfTdEkIeVPcS1H8hB02t6
         z1jnjQxPz7UYYeKlNuWI/Q1bCcb/xdwKzPP54ZfMZGzBdW6gOAEdrvLK+HkDFRSv4GQF
         gJj5oZdV6j7JZw8jz8KGfHUd728Te1LpZvVBaJpeR280EoYxszFSfzVcxdrT92M5vtQe
         xaXg==
X-Forwarded-Encrypted: i=1; AKwUvBxbolQ3vNqiGNdGagh8hTpWtQoi+Vp263NW897TkiQO7pFyWDSuN7FKEV+5sMfnmWnvOvVnUZgALW37S4Pd@vger.kernel.org
X-Gm-Message-State: AFuF++mQNzRkPi0Qxo3yFvu9MpqOGMMwvI2xeNUlWA9i0PZNDXdzuD7b
	N9j4XogY6Qe6IeydudXhoSgdTtyMQl3oTDKA1qWCpYD1WLW66LCS5+NbOyWJb0g4jbQDTfzmLgE
	d6I5clODLAqfP7Kp64szYMRSkX0Uh9+g30iTf2Pr5twOBsY+tlPMcowGbsXBFXjyfVLM5
X-Gm-Gg: AYBFou29cV3T4Cprn3elf/Vh8d+uht9JsFDS4yNMzX38/jvGW6IFaV8Dpwh+nyGYuBB
	lk9nFgg8C1PAlx7X7xMyNUFCnB/8c7D+rHA8hkqcrTZolkUncsl5BaXsbeu4nuJ4/NT7ZQeZ8q9
	8g1c5q7O456TAAYo2/qcvYgXEE/y9x31aCeqawcf2zBSHKmwCkXxgAbVbY+KyRjG4TV5CmdbeE4
	KVzBMy7IdMrVF3QTg0LHgdsFbmrmGJ596Eyj7rsx+uj5LRN18171AqlsC3Iccta9NEEfVCqT4AC
	KgKb27ZUlqq00OzFr3EqPWUnXKaAf7en/R1bnVAVL6ONbigxiSTSaO3xb5pq9xnO8K7eJggGLBF
	a6cBYWKX39aF5ThnYj35hpA==
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr363083685a.0.1788423043976;
        Thu, 03 Sep 2026 01:10:43 -0700 (PDT)
X-Received: by 2002:a05:620a:236:b0:939:6c5f:9a8e with SMTP id af79cd13be357-9396c5f9b56mr363081685a.0.1788423043577;
        Thu, 03 Sep 2026 01:10:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172626sm60991266b.16.2026.09.03.01.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:10:42 -0700 (PDT)
Message-ID: <0e5368aa-0b75-40a6-a023-af2eb4589249@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 10:10:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-lg: Enable NFC
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Heidelberg <david@ixit.cz>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260902-sdm845-lg-judy-nfc-v1-1-282173900569@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902-sdm845-lg-judy-nfc-v1-1-282173900569@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a992b84 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OQN141zOAAAA:20 a=Gbw9aFdXAAAA:8 a=GcxSr_ZgTee_yd3lG38A:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: RcQBCGaFFvfT8dcdcUKKxUkVl1Daqj70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfXxSg+dBXBgNiV
 rnkD05boIYmqRLAHQfvwl4lb3UAKKnAzJvOLHKEyODjJ6RfbONMS2we47Uq7u/FxEROTViaM6NV
 mqXnrKWNIwPbb0QjM9K78U6kQUQ25pwzxM/9JrqyS6V6M9QJLvdde8yDq8K7IX/wxI8Pmg/Ud0f
 kWTNOaBCoNq1hmgXu5Q8N7a+JjpBDE4Afxr9GXuEwEka3ZVBqTVJOW7SCKztudZf00i7SxxdsuN
 LQdNnOYD0TJoVukUezcv3CC+m29UFhWZrSnt+EnmB3jf8Y32zuQHcUv5VUHptZuSzSc4T3NrO15
 wjZc1f7A3nhLiatrtYzBYjpFcbAGFeZ5vnXgfQHYiDKZOVXw9ce5JLLHhV8tovTrPQo9hmgvWjH
 osYjcNgjCW8syVQfA56+2W+X4BKG0UEDiPYEIuC1fl+m0lc6UHWRZnb1hYCstTDEwa9Et68o7VT
 zHU3HQffG3c6D3dGhUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MSBTYWx0ZWRfX5Nv6eTObcPXf
 6x8hFFRcDPpoKuqKuHW7YBowy+XVxpksITp/PscanIQiZhQ6+agEYAf95KA6ZbGSPHi4B/Ww9yl
 R2zj+ijOZtxqzhzHv24b0iFihg9t3no=
X-Proofpoint-ORIG-GUID: RcQBCGaFFvfT8dcdcUKKxUkVl1Daqj70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030071

On 9/3/26 4:03 AM, Paul Sajna wrote:
> Add the i2c and tlmm nodes to support the NXP PN547 NFC chip
> 
> Downstream dtsi for reference:
> https://github.com/LineageOS/android_kernel_lge_sdm845/blob/lineage-22.2/arch/arm64/boot/dts/lge/sdm845-judy/sdm845-judyln_lao_com/sdm845-judyln_lao_com-nfc.dtsi
> 
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
> ---

[...]

> +	nfc_default: nfc-default-state {
> +		pins = "gpio12", "gpio62", "gpio63";
> +		function = "gpio";
> +		drive-strength = <6>;
> +		bias-pull-up;

active-high pins and pull-ups don't really go well together, please
verify that

Konrad
