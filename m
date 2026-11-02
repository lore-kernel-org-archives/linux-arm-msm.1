Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793604739;
	b=2GXpu3FYG3dlgqmwcOx63DYW0/xSLZNmLSNfbtvmrqkEJbNhVQQhP+j8PmskHNUsUt0F
	 8Jt5mhKTfqWD+aGuNcCPa7fQK/up2rrmRWZMk8INlz7JDQSrxu0Zs6Un84B1OKXtFpOSw
	 d7mi5rLTjIJc5+pyOtOLc2EV15dW+cA0d6jMC9AuSrQLwy/x4tPF+eIbIpyRqk14ArqOA
	 O99GNPo5A2V49bBp/YbYIHWRHb+ubHWFFwD4BdBa+a9upSaiQBQpAUzZK1gRcF5IFybJC
	 I7z78GwV60lwIJpBHIs5lKnUvZcTV4trhxWfwKC5L6TaDqhBNqo8yg0n0G65qcaG5lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793604739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
	b=ZHnla4sU9azholWhD75BZJELm8q7y71L10cDeWQaEWj9LenUD9JDqf7noFnYPIrUon4o
	 1UIkUlllCeby0goHgTObYZFZWVzdBdtKyJzULmFfBrT38iWHI+lfucGYuRf6wfEGpTyPT
	 fsKIU5nITXWKIfILBZt3cKaYkQhZ4v4v0e0JHUXR/fFSndc9+q3jwOcfdkkVQDPlHcM1D
	 H9kjzSz7tmE9oQWZRdGqsOox6QUCcM1hdcDagzFcAbEAhoTbiHIsSafojAqggMyQ7Gs11
	 Z08lmi/rMPVMFQaAliwzT2Ns0F+wgVSarYXfIXBFZV5y/9az+D1xJOovxs3rwfXU5Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dWonRU4Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRHkkdTK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5B606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 07:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BD5B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dWonRU4Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aRHkkdTK
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vMHY1676249
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 07:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=; b=dWonRU4Q+/LEfOMw
	nvCbJdrIzu4jsc7tq5zoseQmsFCEOORMyF41B9D6chd9bfBM/Q1G6mAW+whh9MYT
	pK9uxM+o/4vH49BL4t4bJTt9bifuHeSYg2sLJO0JGm7fC8KrZp3rsHI+VPQKccqp
	uWoj4T3hYqHBn5+R5q/mxN6L4zpxVnGj8RI7o+L8Fi/ZAmTLXakkHqvvOkICLAXm
	13HLDGNQX0Ye0HbnBimrwCqeDk1isaPwT/nRUKTUvBXC07TdPus7VTVObAmO/CDR
	s4thpjEpLAnzk81nC3dDgq+SVevVQHemb+Ohd/6XeAo1pMSLw3aqrzPWp1SFl61Z
	60mhrw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7wp3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:32:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea785a4decso33000885ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793604737; x=1794209537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
        b=aRHkkdTKQXybd1KHGc+2gPPwqinsNnb5/6EUZsCMH+1okFs2J1fjS3M43zOdMW0xwZ
         3baE0JcjtZ1qh7Fdd2MkTw+b/CEsRyNcfckq3pFjH0I960LpyH0Wtnj0VDHEuzWV+1NO
         iwdS/SmD9QWq12Jfmlh6dOOyzcUc4vL+ebeGEh4ckqaMKC/UjMfmMX6priQtsIz6Tc5k
         Q97f2Z/vetHiAknOApJUszJFcHGV4VZ1aTulCVgY1aLHCfJAfLrlWVSdmMZHCzK8Vp2w
         RuFSZbgjVlDD5dB1Mjj+2ZbpBFBDuIaqj4nuWYUXsJo4cLfVrxZ3Ez3QDrd/6iwt5vSx
         vTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793604737; x=1794209537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6mFFCiL8lIPiaMGx8F2iqO0rpdGKsv7l3cO/bPM0n4=;
        b=0G6SFMcv8xyneqAEozVcoGzhfjyaD8kQ32tGMnIxR2i49C63qvCbMZLinW9yZ12WEH
         mD7HG69Fnn7FzpWo9jm4LxgffmDJSwZwW5a7hLJ3yeUr1OLtWkZTXoB6ba/OwCjoDe/T
         qiG4FNV6l/Tx/OHiaD/CRIJ0gAqqDjd7I+ZwLhc997p4QV4heZEQWeUH7WbuhOn2lfP4
         MXdoCy0P/kjRdiNbR9j8o6zZPd9XAy1YNXC2MZ7sWbx7ZwAORnrGG+nGq81HsIr8+PXM
         yDrpYjFr2u97IdoEEr24bjfR2ioHOlFskgnS9Sck5Lg0aHudUV026XlNsrWUb7ZW1I6b
         k8nQ==
X-Gm-Message-State: APuU4Z/7AMSVzVD9AG1MFkXe7IfSbU784S89JirqXH7rzhue2+SKUlU8
	j1OQp7mvxrfZoxLqsrttQlEUJQkus2vj7fw62+/YQ66IYOpLw8QxxCcu8Y1reggU5bUEnXbF1ab
	Yt1bvUddekUhZwCGGRR8rbNGxV1jLzZFvFqP0EmG62syiOGc1aDgYIRZTRSztIX73ttqT
X-Gm-Gg: AYBFou1B9DBvTZId0CxhY+GlhOjg2XLAjfvMvxIyFSnk5MuOqMNt98TPnRgqxQvA9+q
	2WPy9eqDN7eRc4HzUW5OEw1IpZObgFsELgev7xCMg+DuyBv2Zo6hEw15rBXlMpRgk4mAweUi/Dv
	Fq3Uf9iuYLOc95v6K0gwXDGE1Fcow0tbI1MljJpW38S3FMSZuaY4+rW5Qg6nidtLxwAWw7P9AHD
	1Mqk6cnf5VMahlUoQ6ImJXYTurI99ASvtxoUVt/1BajZ0nlTPEau+Fhh7R5CYz4QZRfJ12mbHle
	v8mI/96J1/hMo5Bd84ex5ERYsY2fJKCWajrUZ2vNv+bfjhCRWlR9v5oF/7u/4n6texUQVqpW0O2
	a5YBA+hKjhwgZaKpbBDs060JVH2BA2igPvd93PgggWWT2bjKF0gxU6TFdlDT1OM4nrqex8khg6Z
	JZ/DIM
X-Received: by 2002:a17:902:d4d0:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2eb1aab5040mr79983415ad.1.1793604737347;
        Sun, 01 Nov 2026 23:32:17 -0800 (PST)
X-Received: by 2002:a17:902:d4d0:b0:2e5:1069:fc11 with SMTP id d9443c01a7336-2eb1aab5040mr79983215ad.1.1793604736850;
        Sun, 01 Nov 2026 23:32:16 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39052f0fsm23861775ad.11.2026.11.01.23.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:32:16 -0800 (PST)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:01:35 +0530
Subject: [PATCH v3 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-lyra-display-upstream-post-v3-5-7f660c3b622c@oss.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
In-Reply-To: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793604704; l=756;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=D574Y22uTji1IMYHtzDZtLzIycKBRn05fzUPAQ1Xe0U=;
 b=/ZryEtzmyp06P+iMnFK9/3xFBaYu3B6I0tOctWwl5MAOe5aUs4FQw3ghXnuw/3LmliZqtsg3b
 jw0bmq+2E7hCcOU15UUe4MdnXg8EggGKKKH0DVUrX0CF7blBAziNY3s
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: FUIVoxtxacO_ciBm8Baf5OnIYRRJmNE1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX5rhAd/FPIvoZ
 sF3Y1UKlz8Mav8j+GATpbjWsnotqLhxv35x63AgtDVYAP0qbZ0o5Xc7RCwrFBHW3f1gZg3YaieF
 AA6Yu5iRZR8EPw1RodGiwa1nL56Bi4M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyOSBTYWx0ZWRfX8HFSjKI9usfU
 M7HE3j0TKBwTTuyn8wIqxufu7/nTRNMdawnACbw/N+3SUQXF7DZdf7vUpfHjcuHBoFUmDxkhePE
 8OZoThdHJjsQAkYwkdQPMte1k5iFxFidroAqpT7dej6jm6AULhcj2jYL180BKtLW2+7BBC68k0N
 22Zqdp1CyXivf/PX3DJcv9EYNq3MkGsaKfVl6/nbEx12i361sHFqOnae24v/46ASgellUtwEJF0
 VN3uWaI9BkhmIOn/RMl7vV933qk9g+v/tMUX9P1AFX6Shiz1/bXbq27bLKsh+UQzKJvBW8SQBl+
 VlOGkY+OT04r7wu59vICqWtOahdnlZe8ThuNvcTkT+0/IYfm9t1rWkCN/K2AR3kiJknzjxF1/qq
 tGAZgLR0e5P6eu6U74F/dhZYUqsdzB1bHvdtDBK0YXwSl8p3leBmTJkJkAuon0JvUYgasVEzmd4
 0CATZi3HDHbYGAqYy3w==
X-Proofpoint-GUID: FUIVoxtxacO_ciBm8Baf5OnIYRRJmNE1
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae83c82 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020029

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Qualcomm Talos Lyra EVK LVDS panel overlay
backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0

