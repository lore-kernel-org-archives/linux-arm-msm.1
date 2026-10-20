Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792493590;
	b=Sd8uge83B6+cQXksfq2vGHJJZtczCL733+lv3KIjDI4uh2c5TTgPDgnkKIlc3/5PYlLQ
	 RAA1bMQS5F/y76Fz8iZv93o/30RMQ3Lf90fHN3NfG0n3fwD9+UsKknn5LdxJFZtLbfeSi
	 I4+YkIpf3s3/n2yZ81xZajzL7FwFwEXkmQXDuv2fWdGYFXQR4fiViJoCceKaZb0lQ7Dnv
	 XocOmyeONxfhNVa+B4Qw96j86UJvMcmGODpTU4xx7NZ28fStRI2PHXNZJhfygWwnZNvhD
	 gEf3LgtGWS45KuPHtN+DXnPW34AyXHYGkRE+9tp8vI2Ts4DZxXrYN/9lv+aCnXUjJnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792493590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=;
	b=ikHHsuJWh17DphTDSdaKTa8uMeJR5kvLGPmeh3eKhralehvJcfSPQ/HUAl0x42THcLAd
	 b1krIcLbyI2pmd1/LI1EyqemJX/1fAKqd23gOkIgDyGzvCfd29tthBZT4CnKSCunD8OE7
	 dLIv3SoI9xt0OoBFTj1yEbo5s3em1Ml4qj8kxfRrx+0QezdJpjqqjCDeBxM3UysutTsx8
	 PNdsYMZnATqPNbAhFMCOlSI/8mIUrea8oGyyed02ycK6CYVZwUAENr/KtQyzdJ5FB9ara
	 omObEZ8Z1xhPjeSEKnzBeeCPj86H/Zhhs+NItYx2jnfuBeDITd8NuVllarw9nQI5P/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a09MkyTY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PwApjBuH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2D8606A322
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2D8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a09MkyTY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PwApjBuH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8Gi2u186814
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=; b=a09MkyTYoekj80La
	KfCkZdaIGY+uH9MenW+CzrmFFSde2y4GGW4aeHQUJo+RwLoaVDRS83MAuv1XMLR3
	MPcxLLJT5vp/qcrWPLSiWImyOe9lCbtEuDnRarXUZLsj0aVgur8e1M+neH3tk96/
	kMj5Z+jl5rB4C2pLqEJ2rjVyKFm086ZyBysnlYRWnZFQoL6w9tAF9Mv2UP5/xX7G
	AjJne7QZJdDkxwRPEO2GTmwjUkPCCkpFXzBuqaQ7LCdAqehqv6NJrzCnLCOC9KmN
	w4UNa+htDoxj617ourxVqPKG7ssNhD4KuyPecGA7/naSI1m2jIZJpDzbUgcuWGVw
	I8YwWw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nt4uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 10:53:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so101496285a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792493589; x=1793098389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=;
        b=PwApjBuHbaNbfFudvRQK1a0ttxkBWV/gnIigTlCLcTOIxbj8hZQIAofI7/PTwHuQTp
         i9cPChv/PQP1kQRlxg0XrzYFKkiSWrktI6FU+az4dTNvB3gHjTUxwI7UxJTWxFQv7crp
         taccO6jxr4T1EbCiyL8zRwaOyfTiGFIVcsHT+lNuHmEe91XoUWPYbcjcxbVjFIkgM63S
         gd5juuWGPxVaYvVkyzb9N8ADYLk6ek6Qzq269k7ya5AA8+wyldPIAiTFSuzOIwpy4Wqa
         X4S3xZneZ2payTw0sdgKsNS5Wj08TXQo+yUirRmXTWoarYz37hxK7W2gSXUtC3Tu20sk
         yZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792493589; x=1793098389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WMV8ofDDxBNdTwSP1aYc+u/HWDgqRDgvwAh8onkk2KY=;
        b=YcnnteNGVGP6zMgjaIbZeYpXPgOZozcEJW/Bg2JL/EhBSBkRPFcalwS+Gn05bAlbIu
         5dXd5nH0G07h0L5mlz90/IGH/3cJyWFK61Y7C+lQ6+w+vEg42+Yh+m13DEHNV1jsz8Gq
         aVsNt7E5JAWpGPdiqMRV62MUk+UuIMxOZMH0/kg8ckadV0apIjfNEcoiEuIiDWybxW4N
         i7Af+hyuGi46kvLuBdbJ3TEwoX4gtrKHhlMCHClRJVU46rjaasGQ+Xort6ZEForCumXj
         83xFoB1WaTa5aakS+I07f2a7MVCeVGnsPliEXpy7rQt8mkwoI2y8+W/MKwx3wUU97Dab
         gV4Q==
X-Gm-Message-State: AFq9FYIlBv2xX69QXGvI86Y0CteBART7mF15GM7yPi00hOawrRFJxN2N
	2CK8gWiIE9ll1+H3W5fVwYqZIRB6YYkletr3F4A4R0vkl9iUzKEFh/+CKJeIO5RWQhrie1YfBP1
	S4slogyLHksPDV+Hi7I5gnJ3DUdFrpjaXv7C9DXgxkHwCqXsEQ4OJgHkSvSlEP7MkJ1Wu
X-Gm-Gg: AYBFou04uyLCVQjMpEafj+ThdotNJst0Hsc1HFp4zYsXxmthPvKJhc8+LAKUkXrITYH
	mb3hhwcd3Ie85wiSiSUD1dE99XQ4HBb5iwbD4OW8obJf4zkDYAmaX91jfiB/uNmGXPQy8CQwR+M
	Hk0SHT2BKez3305YqkKCTWZxJVGbE79W67863xqCN6ElyvDwcfegz3c1SnnNCXx5Con8NK7V0MH
	MSszhMc0LhUW35/MBTQgcWJxoGT/TFzomnFSrKYr6Rshb3riiaLLuHEjCgbDScowLt5jbryYgK2
	rmwpIV2RlAvqcESRYlw/WLNyYBWyBt3gvNtEkpT+T0DTHFG2H4BL2XXXax+4wdn7Hfx4eG/8S0C
	Bgtoj0Cbb/WPsbJuHeQrQlA==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1946130185a.4.1792493588624;
        Tue, 20 Oct 2026 03:53:08 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1946128385a.4.1792493588199;
        Tue, 20 Oct 2026 03:53:08 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1335d3sm5239663a12.3.2026.10.20.03.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:53:06 -0700 (PDT)
Message-ID: <69210508-5b08-4199-8d98-67685c8e90d5@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 12:53:03 +0200
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
Subject: Re: [PATCH v6 5/6] phy: qcom: snps-femto-v2: Move PHY init registers
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
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
 <20261009-phy-v6-5-50408e45bcc1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-5-50408e45bcc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5xanqlVjILxFIvMtBDtyNxl4l2b2oBk2
X-Authority-Analysis: v=2.4 cv=DZOCOftW c=1 sm=1 tr=0 ts=6ad74815 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lPcTt8mPJekVWdHiCMEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5xanqlVjILxFIvMtBDtyNxl4l2b2oBk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX5Fh6Ru6CYnFA
 XQwKxLFdbfp2oyttJ4I3akUTY3pNG/cnTecQZZk/QTevUDtKgSl+Wz3iDK2fTmCXs78cBKGrxYg
 RgmdXf9hYo8KPzMCl3MeeZSgTItFhMwdQOWw01aKgmM4/zqOqcmRllGWACh3gjWbXPhXRPprU6C
 MGeA4RZ6AUC+f0NZwJ0W14Wd4KHWiWs/P3I68snGO10+c159VGS0vXjryEXKNUAGrirUV9ahGo1
 JLL8wEHVnKdXBc+BW8wQTI85XcVtJfDC61+TouKHQefy5EfvOMAKOr74KE5wdMpgXl04DGO3Glk
 xuczQmqzuGit1VrN5+iybqDb4cS974NWP4T3ONxuPYj3XPweSsZERH9kH9QctbuBY5ICsHkIh35
 e/hOkv11rzJhZkqmTP2xKWRcrWfTWEiADZ8Bs65BVdPzVrF95WAb8hEh/Dx9liZdfkgJxKSdobL
 hMwVyUhhpF44YFPAM3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MyBTYWx0ZWRfX3o5cynhE4kFF
 5ElGt5rlAdVVMcB+JEnP5xMY4u+JHzMwWFAdGBa5fUFXf3xQR4gjJGVGhBzzj+a5e7qUMzbHTWE
 J7BcTsqXcHlh9aH2o2F3qyrPc3q1KuI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200043

On 10/9/26 6:49 AM, Varadarajan Narayanan wrote:
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
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
