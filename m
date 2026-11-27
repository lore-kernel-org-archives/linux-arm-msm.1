Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785980;
	b=5F8jtOtbbj7GRs1IFAXPDXc6hBVD/RxF8FPvW88dA6g84sXckVPPsdFTQz7q6Bg1uayc
	 7Y3FDSj3FMgilGvvEG7T/orWExmcmK0q6Q6ld7y9JfRKEBlVCaPRZPGRIq268wc7eZxRo
	 zKUlk6rI/D1vjQR5nvOm7TyoYMcKMuHPhQkMyABkACUWfQ10kW8zIK1lWeE3VyzlbFUua
	 5IG+5nYDREBDWsc2EZXoGBKuFfraL3OP/PXGlVfK3aEQgpO/a1rg7mvr0pqImfn/f+7oB
	 e6ASs+ecUNd8rEvlKrofUKLvreGAnJg3GI/9hN5DtbeeuKyt5OydWr+1kpMjtCUqIlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
	b=EYiuyQ+tfpG3MmRHLWYQHZF0nikouUqjExJala34iJKcvt7KcX+KCkmsWd38lE1PcRjg
	 z03xD2Vy84eRFhGJz8gIA9lH6XFtQ+z2EKyPpvSmIkYiXKedJuDwElunCXAsV0k4Xqt6m
	 ZCAdvLjYGty5Z/Xy70OVG749lrhAiOSdXzsMneIRsyTYz+yrD3E1IcuXQcxhl8Spo/4kp
	 HdQa1j+1XjVMyi4BubsQ8eTVSOPJwOuf4N+1ZDqEG4V506sKxcjFrWWJCoaqsHEcwCIJY
	 ygyqAswkWhSvoGXCl1ZEHKKUom+A44SJvCR/vUsK3FIgsDpGHELhs43r192rUFm5gdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gTala7n0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fL/GMGNI";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4168B606A32C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4168B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gTala7n0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fL/GMGNI
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChMvx1803338
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=; b=gTala7n01tU2cB5+
	uWdw4rRZjX40s/buTh7RST/DQvNqQZxeIR7KLjvn9b51gNUHMAOJ+5qyMNQf7frF
	POCODruCSV5+xvJDW9IpznqFYKKOPrdGJ4+QOu5rqQejswufFT+jHnzWLMqxEKDh
	oF/7nAVfA7bNXsy11cplSq9kjqD+zLe/mJhGdP26o9RvzF+lVEP+/dQlyTwXqs2+
	B/3UmXCR8mJzpqmvJDZzyVKQhamVnP3auznLs6io1lkIhqYn4qAzhll2khaUorKf
	hqXYa6kN4FiqzL+pui5EV5kur0E+Y6htRxOkea0xaz5UHrK52TzrtI/G/eYkKuA0
	CMDU1g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55u5ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:26:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-92137a593c3so10441376d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795785978; x=1796390778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
        b=fL/GMGNIXRzTak0MXqfvh1GykEEbv+J63o3Kf+vl3839bOE0G7z3HTHY24DHEdHSjS
         bAoCG0IMf6M3nkcUViMxSXCf1ucg3SeOmDomdNVcAdTZ5OahW1iP/reVjVV1JEnFtjIi
         UrYBqp8ZlRpIJhKWTXYsl/SyVXhzD5PAGVZXcVBolp/XEU5TAEoLB8Z4ZCtGtvSmA0jr
         6nHYv3J75Ua0TCaVu+t9I+TC2pNvpqjBAtsj5LS4wYXOWsPyskxgCBm/WvXicZsHMB5B
         rRCGz8CklkgG63APYMdzCMMQohlFhhUs0p9VhsrsYkgzSFgKMCIq173Q64HTt0EXEP4t
         piLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785978; x=1796390778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHRL8I+yz0kGiE+hySJDhurRqoWQ+O/WzGFuI1MAlmw=;
        b=0cjLOvgTtd62dVNmOns63nCKvYOJReliRrfA4dZq0yLjGu/Jw1XVwK86rYv/MTdizv
         RwE0q72khaVN550OzcnqEUruSmkZ3P55JG2xzFL05VXAP834vw7CgVvfQXyQP+Pch+wF
         trWyuUKTVS6Bfz4RKhOTqsn+Y9dRHXcQoD4glgGxvYR5TEW/PU4ozfFuuDflfqeiZbgy
         IdcJHtFMJ2D/RIFTM27qjCa3QUzPmwB3xNxBulm0J1G30SSr+lLwRIEpyiZi+yi97K68
         CCedibbTz+kWfLWRyiLfBnmyCY77IClwT+2dtBGyINyJ6ORStM2hZ2TysbOWE2mjPCAN
         ttwA==
X-Gm-Message-State: APuU4Z8o6nJwNCZVXkJcuTaiAjkwOxYkyXZxIiZ4q8g9UaMFhKcDVTkU
	6yEX+nHz9+OMbR9qEOplQ7bvSHg4MahszEUXu0xynvyiFVonci7p449ALd2O7YoDpOwEsD+aqto
	Lt+sdhiLgTttmK1ACwuU1QKGndCPvRQLmE8am4mSwxvlsIeX3DIVCDP2zoOwaNPvmH5Y+
X-Gm-Gg: AZFdTZfHolATQxnDY27d9//Z2pHabYyOG8AvtAdSSoKKkiwRSVQ8js8iQbFLWerzOjE
	/YdvIbhrxH6dhGSDhKcNYRaXdqzk8XpVL3Lu+4DYEuLLxbe0JUCzokqeUDOBOzm+ReVGnx7oUXU
	TO722J7mxcpVNPsObpvqOnzHJVgd325qNBdLDe9WWiBjHyRFFbUocOblzodT5xD+iRPPSebts1l
	Rdzdmm61z5JcdLwPi9Pq+F9hQ0vtIzpnNdXsumLOXC8DKIdgFsF4t3qQNb+S9bwcqtFqB3CmO2V
	QZ8C44Xg7VcJwuKHrjzrnupntDOJCmSP8Ue9xRjiCesKmkoz2lSkxQm6cNDjBcK7Agpq6D3bgo3
	x8DgsSz9he5+BjbzsDnGBs9YnakycLNPNOxJP0d8QxL/r5BjX9a+k4z7jDZyrffdF9ruhusM=
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4555765085a.5.1795785977616;
        Fri, 27 Nov 2026 05:26:17 -0800 (PST)
X-Received: by 2002:a05:620a:a50f:b0:949:a6de:cf5 with SMTP id af79cd13be357-949bab1db0amr4555760785a.5.1795785977172;
        Fri, 27 Nov 2026 05:26:17 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aec5115sm856186866b.51.2026.11.27.05.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:26:16 -0800 (PST)
Message-ID: <1bd90d60-8f5c-492c-8d82-71a1de995a9b@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:26:14 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] clk: qcom: rpmh: add RPMh clocks for Seca
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tyler Baker <tyler.baker@oss.qualcomm.com>
References: <20261127-seca-clocks-v1-0-1781298e658b@oss.qualcomm.com>
 <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261127-seca-clocks-v1-6-1781298e658b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX+9knN0aY1/jD
 2xNE40kOPlP+yoBsxLQNdVM/yisj7Ed/gIKMP20/WrmlcQLtAI6uxCEu7dqi1mxGFGjyXpX8yOL
 KJ2PcLciQK8yzchcJU61++X2u8kpDwo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MyBTYWx0ZWRfX2fPhop4Z/e+A
 X3LL2qxM6424VEMOTZJkeEua3PbNMQlqbixrWXL8vi62QYbUw6rcr1IOYgLtaT6J0UL/eTi7rdL
 X/N+25V7airPQVgwOwsMqyoOpi3LrCYRa2pc5JmsvG0s9EiDhYtLWurlVANNwjMsSqQvZvy/geJ
 Wrym1Wfao5AH70VV7jTqxf9EWuygbKeZF7MGK+PeH38Maul7tVwzGO5mSE4ho45V6BJ9i40Kfy9
 nPQRwY7ct3yHjH/t1pGeD7NmHRlewwP83qn56q42v7m4BDXZ50x9aSK+4wS9soanphC2LO6t65Z
 xNxTJXZVrNtcYvzre5Nrca0h81Dy5AbW5yIvPLvofz3V8zR+fMYY9v36mEWdBTVFEk/lq3p4fzX
 rvZzbQy8UY4wekBQ/kf+CAyz7jrVy3lxYAPUj62WmxuFnMMQBGwcQJp6t/QT2uqvvFTZX7jdcmQ
 WLeNpN7f36o1Bnj6niQ==
X-Proofpoint-ORIG-GUID: VkW00d6dY2E5pdKp-ESeQD5XFrZhZ3D7
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b0984fb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0_OSfFgOA50T1ex7QDYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: VkW00d6dY2E5pdKp-ESeQD5XFrZhZ3D7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270053

On 11/27/26 12:41 PM, Bartosz Golaszewski wrote:
> Add the RPMh clocks present on the Qualcomm Seca SoC.
> 
> Co-developed-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
