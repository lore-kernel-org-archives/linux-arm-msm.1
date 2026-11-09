Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217179;
	b=O17BtwB0MT1JuhmOQ0f3swfRM2b8UNvRexP2X8uc/2zOR2CfrKMAVuRAW0fV2vQVTbqJ
	 a6NUXGyFxDEhBI5db/o35KGIFNiCBDJD7L2ez69+wrgSKXYWqvWtBwBNQ8/SsyUiBjMlo
	 Jq1TdotCq268ZMtYV6revpTNqZSYYLbfyb3c5oGkmf8+MJt9zxzga6mgvDLnhJJc8L6Yj
	 Iqdyr/cFH4XRxdvVCDrmgnd+VtdHTlErKrvPbeTya8tu0IQRbk4qcCf9Lnzwd39NcTcwD
	 vLOG1UJiVCpgD3zcyA4Be9sXkqczKwyvKgj/If1p7E5IDtU49fwtvYZC9R5qYgvvuWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=;
	b=VMJd8G3MljgBhaT9JnvWgJQCzYcEsFtyslVDv8179fce8mOjfUBn7/A7H0F/xLufwu/V
	 1ga5nFbZC0KxWsoQNRioPFOUgBK/U+euKGDiHOQDu8sehrQ0aOnculf31QXbDko2xjNZ3
	 mKA+aW0Ia2j3GYKlvJMvz0kyXTlsCENSbsoAudaG58B2L5Gxs3TM8L2p3+B/23+ZbLRvZ
	 0KZiU8ziqd6fZEXmsga7tnoTWUyaIjjRvYDbkDH4CtPbpdVxTPWrN8V/BnLafEiDE+jNN
	 Aq9B6OmLJe5fcCbCgJM6m5yOWH8/Q+cvUkX/qviyuXHv40i7CaJUKpCXVoDxEtXgPzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=acN6b9m9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SbUGFBXn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C349E606A323
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C349E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=acN6b9m9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SbUGFBXn
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96AXmx2007966
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=; b=acN6b9m9Ya7+MPom
	5ezGwy6+9ze2aJrO5B8mZ1gvoToC6REdvTsXHNQXQxsCQAaZVQyd6YRQy16NkrE0
	mjRx4KysVzyNtt4BanXHR8lhg6fTzUGFkxfJtDnWmcYTjoMKCihjKA88sQjy942z
	ZA2onwyIym/K8pWDPT26nd2hFgdVgsBm3n1oTRuyo69zpdwPriyt5v5U9B2NG6qz
	ZzKafRFG1gBC9AgSmZABpR9WZ9sIeqJbNLi2M9ydJk4E2EEfmIT1/mxLy7CXS6EG
	61fm838ukAIgtDHePiWh8aWKjibPzat5upPx6VnRnFCEFjHVkaYeE2VzvHNxsTSA
	eVQqQQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k5gx1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:39:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ea5866643so13740426d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794217177; x=1794821977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=;
        b=SbUGFBXnYu4eL2rXFkAUf6rM0Ta8YMP5cAsdQAK/TxTlOsWWNlxGIPQzHGwrynr35G
         y6J+ly1neMyJXY7sH7fNztAHJyf4chJzf2avsnXO70B2lcJS7vh0rFjWAI9cw34WeGxg
         6PNkt5r4WTQ552qdHs+wIrv3IOmeMJVXgQcaU8PwFJ114vQ/3SOcPHoTanUW3PIkBUrm
         g2wAUcl4QtYD2R0AboE2V2lDIJtvo3X3za9BSvjgthmUEIqIemKrSqPviSxDDpt1CPOr
         AjuBUsUJaIoN6ZcI1cj1sFGDYOwz/A99QaTKIbrtqYI1qE1QHzIPff4xuIlH2EcARw8/
         kMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794217177; x=1794821977;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k/MryLsTIN5kVKTH3Pbnv1AmufsI/5+jgtemRo4uues=;
        b=sHPZk0Q3BADqtQYSmLm7fj5rUaQUtk9AQXyXF/fetpqXsYH7cWkd88cD7NHqK2pbUI
         9h861T68Azm+fD+E/0xqyxHYdfPZpDd3FZTpMeJAN/UGLOiciqnJ2fXHgfgVCWnShXz4
         4frAN/T3myAb+2OGxDbzFOU8QzncghAfO1mGyhfNdg5GU3iyoVslktyylid+FGirD+F8
         IN7vJdzQhTg86jtbcYag3wUqUCoHde7y8sb3w9QnP1PQP/W7TJzbEZ+6RWE0AmQoW98+
         Jfz4LR7fMuEKPRgS/8Wuo521FtyuL52IJkEz7dGItJOX22tZ6gshbnWChbsu8KzrCoBe
         KrEw==
X-Gm-Message-State: APuU4Z/8rKWdYnq5DmQ/AyWiyoG+3qDlVYVna0Z61EislX4xyeao7GEw
	GU83ys9/YW/P1hFzByAovNtSJ/e2tChM6rEjxjssrPWd5eLMXF5oGT2gWA1sv/+TeoOZTr/AcEd
	shWgamwkSDq01yx62sQSiuf5nNvR4lh0X5wDNvAJ0E8lmYkCNgamcyBgd28VgElmNx+d3
X-Gm-Gg: AYBFou3PkimrvuvxMaHXLnQKp1HMl9ZoeO/cIGFE3JLlrIVsHBeZYjS+qoP/JSRsp6P
	/2XTqIKEmlzdnP5A2SbzS3kKfnkSU7L8TKYxJV8+PjNY+G12v10MseuMBDPe/+V322uaUfDxc3E
	9rTcjt00ldlES2mzqlKw9SuNRFtAwL6sT3+fbIcR++Pp9YHiB3q6hjefAV37dU8c3zYetg715io
	N8/OG8JmqKvfDPdPbNnWhoH0UPsQuWJxuoI9PGcFQAQCSir3nffdaU1+lDQi/lUJ7/LYyQEXZqk
	ZHMm0WxwTEa7N+d0nN7XmXVSV9Xng1R0XZ6iAa/OR2KOQrO8tGqtwzkZnS039IiibklLj+CuOlx
	2DPL7sDgrd3fFqP7/3HpLWnyYwGHQsxbWtGxj7ei1Pvvps3QKZJEyUtzV2ouhbGXT7UvqGqbrHO
	PNKzxLtLOIg+VFu0gtDRYgPLBnsZ/PGzN7sEnUiYQKwhKpHhQ+Ks3jWtyXpENFXg==
X-Received: by 2002:a05:620a:711a:b0:93e:623d:99ec with SMTP id af79cd13be357-947841e3a3bmr551108985a.13.1794217176925;
        Mon, 09 Nov 2026 01:39:36 -0800 (PST)
X-Received: by 2002:a05:620a:711a:b0:93e:623d:99ec with SMTP id af79cd13be357-947841e3a3bmr551106785a.13.1794217176494;
        Mon, 09 Nov 2026 01:39:36 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cb75913sm164965255e9.0.2026.11.09.01.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:39:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: fix a use-after-free bug in system shutdown path
Date: Mon,  9 Nov 2026 10:39:33 +0100
Message-ID: <179421717024.24538.4724609411487120777.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
References: <20261105-pinctrl-qcom-uaf-v1-1-c9cbc0a93161@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX4F1/vY0h/yvN
 Jn0p6ctzQryG1jyeJ/PR0n/8SeLJkWEJ5sqOaES2jKmjSzjqW0LWScN8rFUCdxo9kwTzI4+VFqs
 uZr1IlXlbN03gT01oYQiONNAXtXdTBd52ELsrglVLV8sgaisEyx8ofign3zdV2wlm0+wgySgZAu
 O4zD/xwwKZSPxYma4fD7ZEyTOdp3uNGbs5CX/io1MpQCfkq4NYkxpUgbKCzcjOPLF4wXeH2BVfz
 1d+hwjmeE6/rsAZ3pwTNAQnPe22ah+aW2N0UDzLP/b5IYtUN5wc1v9gKN/ygCay9AS9kY1zRXVH
 8gtASs33Q9OgV6w7Me4Ebg26j243kPEgTOF1crl/EyxIeS1D3KqTDCEIwvY1n63URfaC5cdEiVM
 oHaO535O9BNlO7DIYYYrZhp+A3+VvF8JxhwSLBHD51sASS50lVEEKygpg8fafbQO4lLalyM3dhW
 +iRNsDbhwTkmcxYyZSQ==
X-Proofpoint-ORIG-GUID: iMG1LyNhf46_HmIqv160mwg2gfxGFXFi
X-Proofpoint-GUID: iMG1LyNhf46_HmIqv160mwg2gfxGFXFi
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6af194da cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=L5XZeMja_UA31ktuEWAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX3XNt8SXI3U7x
 t51AW/8+1GEf1kHhytrVisf2I+XsVWUOQ3qShIPpP3MWAYiIBDn28tE2x9a2qmxU7gmISjK8jrL
 NRPzTbEuFAsN/DPHxpTF6+Dx0qi/RKw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090038


On Thu, 05 Nov 2026 17:09:40 +0100, Bartosz Golaszewski wrote:
> msm_pinctrl_probe() allocates the pctrl structure via devm_kzalloc() and
> unconditionally populates the global variables poweroff_pctrl and
> pm_power_off.
> 
> If msm_pinctrl_probe() subsequently fails, devres resources - including
> the memory allocated for pctrl - are automatically freed. However, the
> global pointers are never cleared, resulting in a use-after-free during
> kernel_power_off().
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: fix a use-after-free bug in system shutdown path
      https://git.kernel.org/brgl/c/6c940958950e5df52831fb8c78a045d426b09f1b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
