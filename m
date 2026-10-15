Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D35746F4BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062114; cv=none; b=EJ+qP2TZUUE/QlGrLLyVkRyTeVNAXFcWwGxNyNQgmVkmhwOw8Q0czcAPKiBFz/Ys3gnr/hsNaoIuwjiVlA0+Im9qa+V/i22Xk1qBtFw6V8lOYOesRkOsncHFqZLrsClzNbCxx3B74lKdr0ifqF2RLeqJW8hhx6MuB7sIywIlnUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062114; c=relaxed/simple;
	bh=YZHvAvN59dgFZAlMz5AbtDARiD9t1W2atA1nr6unSmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMgmWbteiOdZN67lRmLzBQVhAutbZYyvYHTWiyDJgbdIQbkSB3juX1H6I2pq6LBzm+PP7+FNk88rfUl8UXUFOPlNlaSXHTzpA5ydc6ZRuH8PL3l/2qkvIcSJl4T4cmpgPKH6b8Dw4gEj0JE5h8aaNSL2MN5nSlt/1ViTujB5A5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inF0ZugA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihWf3FDl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inF0ZugA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihWf3FDl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jTcn2809293
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27RadkhSngOPN3cixnSOE+ldf4UCtEE46PlRVZAmFzY=; b=inF0ZugABga5RGmA
	b4Qmke4FwoUfC+XVIxjurdcCzGSwf7QhxL/3X/Ioly/djFzk0nhIQHb4Vul+Bzr9
	oKIyB85mItCzTHLhoc51NT2JpOe6U4FnVWnscSY11P3JrVqryr6SUd1TPFmCV3LI
	NAywbpMr2Y9Yi/pkxRtj09QDipYT9qmeuxdLItPklwLAGEkZhBHddg3OSxsUE1Cc
	A5gIOd9mVNx33EY0dBBx49uzOsg5Jj9Upbtm5U/Mpr5NwZZnoEreL3sTXEsO+eZ8
	OC0B9fMOnSPZN+WxRmddZxYMglydLK3pBW6PcKQTja9aQCNZOnyxP3E1/mzzTr6y
	8GPRVQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54t75h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 11:01:51 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5caeeb345c7so184573e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062110; x=1792666910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27RadkhSngOPN3cixnSOE+ldf4UCtEE46PlRVZAmFzY=;
        b=ihWf3FDljHuX6TaPMgujKLxzGaabVzRbT7DaWNgna8aeSSDspiNy7gG+6eonb+AGJI
         dQHMnGWdJJ6+SuPhFyaEJYb6YevMSrZlmxdP3w3Vf2wXz/14lT5WQ0JBe7dP7s7CxmZY
         k3dO7HCFkKKEBBeZeAAMaZADOu9ijt5mAnPJ/7ZEOWnrn4T/DQbmg4djNG6I8SAtGmaX
         nQCAqB+Rard//hJHg2WhjLqWKiDauu6CXr4DJKRy+JP3zqtusEZ3z2zxzoN77ekZro9h
         nQXo06kZFH1+vxEaUVKwkn2hYVohz6UrONupQFqdZnPLxzGZA3/sbsd74/OuFJwzJtfQ
         yHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062110; x=1792666910;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27RadkhSngOPN3cixnSOE+ldf4UCtEE46PlRVZAmFzY=;
        b=e7viNFy3DIRBVjp4hmmwfxfl1oj9IKV17WSATWoVidkU1+NYu8TQiNBsd+tFGKYqSY
         vaGupx77CuPH/sGPJUJE/nMTRe9/FyhMYNneOlcokLYcnOijQCQUPIaBugLeH4XpWBs9
         7LOWHoTsv9DmdBJKFn2Tk1Dhnra4xMIDpt7X5XzIjSuUt9Q6iHvr51UBBSsKnCiuAEuM
         /wvB9DGHa77hQdxjXVrhhMQcP+11/JHfLnXAmnB5MLOZNVUb8xeH0TcyRt3R4/XPcfPW
         UvebYVp+tEJA3mctlq22dgfNSqDuvDXTRLFe3qQ8eQcj8y1HJosxctnfLhrBfFWC4GZg
         EfbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS3Yocfu8MCu9ek+NpOg3cP9vV3XNif/yL2rZxMuRJarinowGo73VFLmky7/PrvosusWnDHWJNmdLi6W2G@vger.kernel.org
X-Gm-Message-State: AFq9FYJJ5vX5pvWjDy9RRAnmutuJdnRL9zr4CVUYpbfXe/13G0aPBmW/
	8dZJ7Twjis2A2+33l5m5EfboY9+6xzzYSNrKywN3u3h6/V7eocITVP98/7QcuwkmY/kJ6HaIBTC
	CGGgBUR0Lm0pt3FJK6CZfHVFrsGUybhxJ5zdMji4+enoJLEuBqtLPDUHaFQwB+OFFmgXC
X-Gm-Gg: AYBFou1s3ejMrB59h03C6fTWbnxuqHz8KIIkORP4bHmnQnQ7u8Tp9BOF3+jg5K5frUY
	1XVBLS5U38L8TcWN+6NRWQ6YW/aKUW0cLjszqU4e+YzRT9aZ1QZr3DVATc3c4OPyrObU7CMf5rV
	c43GLeQY0CGI85M6TvRJXzNYAW3djOF78MsG9Q9uInnygxat2XEQ4fep1rVZdVU6mfWWII3Pbw0
	GKNrjNJyReS+KB5NpRCElqF6UvUxqNrp3/aOMnWa9CuB1CdjCycM4+xffaN9E9VWq5SW8CyC740
	punsCbb/QvDiKZzxsFNSGRkmpKSOEJMTx4hoElLglO6UmrgbJDisy0X7cv2dFRdTt/Y4QzlQvOa
	Ba5QyedlXUwZuQpJ+ckgOzA==
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr1758674e0c.2.1792062110357;
        Thu, 15 Oct 2026 04:01:50 -0700 (PDT)
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr1758621e0c.2.1792062109804;
        Thu, 15 Oct 2026 04:01:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3f8557c767sm45945766b.50.2026.10.15.04.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:01:48 -0700 (PDT)
Message-ID: <b422b3c2-ea11-4ee2-b3ac-9e58f486ccd4@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm6350-lena: Enable PMK8350
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-8-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-8-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0b29f cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=JHwpSSwbIGnF5Ym6y0QA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX7Bo2m7dfDBWD
 lHgnhuN22Io5dP7w8bMjtiT/2BBDs6pZx9zr3bmejZfkO+TwZlBSMmdFFIRzWs3KiRFbJA/5laG
 MxvUdh0EeKMJtp121JPiuyKCi10Kxigd9O1k0fWwEMKTn/TO2ygQr5WdI/ekSKmhbsH1cvv+lFJ
 dtWDz15cZ4pOSG3EqaAn6RZOJTMZGeCIDD9dbiVhvkPRZXGKFIATcTjQuTnpwU8/XagZWOL6rYi
 pzPKuDTHFd0WIzkK5qlKilJo8ovEd4yVA6XMNx1wNOxTfw4evi9THT8yQ8aJv5QLDmu3tZ5tRM5
 kBjtZXbkigz/uX/UH7jSK9JXzbJB8t1CiNIGCH7jhnczlf0L+q3LTFMemFW37lMB05t0lg58DgP
 JAv+zp+QiPLmguUb2dXlrM6tyACR6FMZ+B0s8TvXBL8I9tknO74xieSL0rnao2UOy2nFeZ1SsrF
 O5cGJGLBCewFTg+M7jA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX5vGqmjDvF/GD
 f7zQymClob6eO2NjtF7mIWqYMhDFLg+1Yg5huOo/UhaSFIG33xKX3NHaxue9R2wHsao0KSGvTMS
 Ye9lm9VHuE4OKK4k84BCJuxj8mKbNqo=
X-Proofpoint-GUID: jtjXQOqUr9lAT9g1zTm889VS-QlQHnOV
X-Proofpoint-ORIG-GUID: jtjXQOqUr9lAT9g1zTm889VS-QlQHnOV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

On 9/26/26 4:00 PM, erebion wrote:
> Configure and enable nodes for PMK8350 on the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
