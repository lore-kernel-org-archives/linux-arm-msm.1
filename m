Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB044E56C7
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555388; cv=none; b=UGF149J5Lsyr3yU1aH6t6p7CBGRy1YCcMs2mhPNtvBZTxfGvor86B7Br0MgodbtPvr9BVuwJRzYByiV0Sr8WEXo/wRFjwDNbirvI8dsdUn7HPOdnl8gDR4lqgVGJv4Y7ntljBVyo7T97f61DsHij6xB5Q1L0+49kurW8GLCiiOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555388; c=relaxed/simple;
	bh=UuOyDVyJeFbiCVINs6u9sS+zhZ6hq8NLiSsmu2mcank=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dbkFqdUFfduopA5QdpAa2fAQ1Wm4KhvY8d2hZDaajZDZPy89lRvkEBf+XM99+MrlDDnslZD3Q7fgbSm9t/cjNI9tYusvSO5NyOki5OVdm+XAywDp7cMe+L1BK9YYXoe17piE9H2pshuiPLYSM0XmjOOC59w6AalKojre8rJCRww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TbzJo7+d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T9hYLCIl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TbzJo7+d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T9hYLCIl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G931mQ978570
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XIEuDNYC2iW3h0x2HWVcVoAf
	DPrD9G8wcsAY2SJCqlg=; b=TbzJo7+d3AekQrHqciGIaV83lHNl2JiC3Sdpou37
	W9AFmny++RHIe2QaaUkAfIXfikG+dLCwFLxGMfl2M3A4GS3V4rP77L5MMRJNZIHr
	1xoIIyryOONURoCynr3VWDOcQvF2nCp7owl6htznYfJFPC3t/ZHVEjv8nTrcdk+o
	EuOA+JB6hURQOu2NRQMC5xB5fFymUrcb3Tpo8EIFJTpSCv6RkTk9sGTBJnNwRk5J
	FbZDLzQTKgHSPCO8tAyF0gsGTrvVJTFdZt/4P+XTn+5O/2aE6VlBnPe6O5fGNqC7
	pgb9qjUtBYjgtf2GMiWHdJDTeQfubkT8zdJrqDc9oAmSDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rhbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:42:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a01d1d1b6so705334285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789555366; x=1790160166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XIEuDNYC2iW3h0x2HWVcVoAfDPrD9G8wcsAY2SJCqlg=;
        b=T9hYLCIlbkB5MzZfZCpZ9DVT3HKcyn8ZwfEKLGNOyJiuTCHiPdLAzGyFiOjfoxvnk6
         dp5MVjEFhQJnC0V9IE+EkG0OxxB/WKnZBwYIlC60MlQhsSs7hAksdK4QKj7OmSIUd/De
         DdNIaMIGn7rv51omPKrHSlKcJQx+7eiPdtht4ne3ea+HNlc1h+M29oh/9DqVLr2RWsnQ
         Yg84FmOqPry2zHMDQNYppvT8Aa5L/1JH6E0rLu9U9lLVmECM0GKgvhTl0EtgCpmKN8a1
         uC+nUXv4I34bkqUsiXu1KODoxTXS3S9ZSqlfMEDlzLurDerOyihzzrCK+M1aN0xmBCe2
         TtyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555366; x=1790160166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIEuDNYC2iW3h0x2HWVcVoAfDPrD9G8wcsAY2SJCqlg=;
        b=EF2/yOBGEoYEQquIwxUvw1VfTMiU8WkLcHhheCOm9xCAUKDvOPIGXYCNYSLQDXtij1
         yUi1n1K6OiMBBKyxgl5em/yEVEt0d44G/W6mJ3RC9EnN5rR0x42Z6tszuRZWBrqhMpOY
         I//j/sttBQ8s7kJMip7sDzulxMwM4Bf89VbIp7u2M6pTyuJj8KiwC//AdqyvfrXC/AkC
         PkQntEJsV1EN2qoTD18sn+H+aiujbTxNC5FNHp5JORQYUhPrJnfkTdgVLjVvQj/t2ALw
         DPu/2D889MwZ2ke5dnEcXfcVEkGH80rmf/FtD2A2ZRdkscVeDVkyfr3IpHlbC/boCAlK
         8wIA==
X-Forwarded-Encrypted: i=1; AKwUvBynegPHJHhBH7qGVAxng2uoUYLaGcNZQolsSzS9w0s4wLClNdWv3FM7Be4yt5VKRdKnBudkLSQQFmgnKpqU@vger.kernel.org
X-Gm-Message-State: AFuF++n5/1AFDMw7uu5QfmNq4+uDZNjfHr9/klimI3i1YrVlf6to5iAO
	vpkU9fC8SuQPvNj7WTjCPlJ2ewaMsUa7eXd9+UKjFUzgx+Gcdrd96344ZfBbwhw+JfnMCNcmqyS
	zVQdUQHbf5xQTaqV8HQUmqkIaGCE31Iz2sGmkjWHGIMjgF5LIINDIBZcqbxWxLV+JUrS2
X-Gm-Gg: AYBFou0vr14rTjXIPrtIhIwbAHOL6vVaVyZlIErLS6qhc7ul5WKkhwRGIvWU+34xE8N
	IUDHnSvbJ63+eRkekw2D77PE0YrPC4AYUiU1+dfUMnY9HhJ4DCtKZKVwJsBHSj7WCSWKnouFVCo
	7Fo88Xt9fJJM0wBnCWRt9cJFV1+RsIGZoq/cv5Zz9cgp9U27RGx+Mx7uvcG1v6H0CHLQrtA8fm6
	HWmIvry9sEeNbjO3jPxn2tiQ7HC++dk0RRym7IQjCLdnaamt1iUw7VlqFWLkpw85AVTLlrZGI9k
	4dnC72glapWWHUregNr4qU6HGGv5R+X3FIb23W5BN2SrvcgLDFPJ8KoDgJOgy9QvIe+/IS7v7dM
	qSwaldTYrMz/cYAA=
X-Received: by 2002:a05:620a:2618:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93bb7881a08mr317187085a.28.1789555365622;
        Wed, 16 Sep 2026 03:42:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2618:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93bb7881a08mr317096385a.28.1789555354062;
        Wed, 16 Sep 2026 03:42:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83aead50sm78780185e9.7.2026.09.16.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:42:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:42:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicko van Someren <nicko@nicko.org>, Chris Pouliot <chris@pouliot.me>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Message-ID: <oorz3qknsttz5726g5ypr6ypmlo6ucqz7hrjz5lvrv2tgjbugo@qaalsnqnkbgj>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX2Sq6JlOiNWMI
 jXQ+ZC2RVtwRo2kBERLlEJr5wOeduS4Nf48Av9LTtZfoKn5kxwmia7JRUOrCD57gYSZD7C9UgNr
 llnG6011x5lwuKofd+m313Eg/iWg8p323U57O8dcAmGh9O3X7VUJsvFaHAFX2SWdH4CL3ZKcXoZ
 1PNUOKqFd3crcfOz21oCbiuFNY3m2TqBtsvigab5QhE3ZqFLzYgcP0B+OLICP8RSi5LePJc4qyE
 SI0fLYm+K2m5KP4g0yGQibITZdJcZfRsXEiti8+F/srxfNgx0MG9ZaCes3dIodOXAou3x8A+dNh
 7AJ+1cSn78d/pe+TMKOEG9MWzDYcmWnb9gbfVcqFwvx0rD8f7fsQrM/656u83D5QE0XpZkBIFRK
 pYIVuSNqxNwsdKM7wL/5e3A1Vro+PoXw00bgRQflsFVdtdcu8x+3Nc8l/VXXUPWwpVu3l/KBnke
 4S39xjvRKhbYZto+Edw==
X-Proofpoint-GUID: XJwB0XiCR6uE9_ychBPQnosVPao_48Kq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX6aWf6TbYqoIf
 REoSEm3/Yxh+r+CDGkZ3ofCdVCad0IQPBIGdvBp4Vv3KfBPg3ldP+2XHeLcHbmBrx6ELfEcyzG+
 X1EAujhR15j6sgAkRgr4LU8jfjkUshc=
X-Proofpoint-ORIG-GUID: XJwB0XiCR6uE9_ychBPQnosVPao_48Kq
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa72a6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6LU_cUpum_TGSJiRvRUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160140

On 26-09-15 20:54:23, Bjorn Andersson wrote:
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> the other typical Glymur platform capabilities.
> 
> The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
