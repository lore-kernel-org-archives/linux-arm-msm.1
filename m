Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F63CF1FD
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068497; cv=none; b=dJQNW9LkWsLRml93QPv+UQP03Fg2CxwDI/0e7D4MmqQ1RONmVPnYMwf4MdPRzB1DaVfsyP0fnBjEt39T9Su1MIg3lSri/NaJdefLxe9oN5M7P8pDRONcolL/L+4V9Q5qfUkk3LCcJF8Mhv1tyHig5qyV4IN02TRUI2VYzhYpfTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068497; c=relaxed/simple;
	bh=N8g+DXNfDRJOD41XTpggaSV1LHWFsbXlVA7q2pwOZdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fju4UlQ+Cp0WmbhjzEvnKdZ3BqKbcVUSWlQoGHoMbH6suewDrJSH/cnr11hYvp9G6dFdRXGFVm+CsDMZbIc5VftNj6Xga88grmNYLIZtgGGm8+sJsgvMZCGkMX2FGgYB9hZ8EoSJc0xNxFBUaI2LmntiT5YXc6i4qw3NJCDHHQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoL6cXfT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CYALFQNT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoL6cXfT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CYALFQNT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0qOW1427517
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3jglw0Wq9Oscb5y0P5uqnvM312XMF7ZNYTvPJQRdZA=; b=OoL6cXfTsJI5mELS
	/S6bfnV2UhT5L8ox5PRSWYxVFmVzjn5LqOOE0/jsanWsgjYK8GKvliH+14RrdUIs
	KAoHM+kJFDyU2GWXCcaEiHdUOoRHpbl8d6b71NtY4AJcl+xrQ9XSRKeuLdZ+mELa
	3Kbuy18Rp01j3+GlYteXqmvXr8iAzFHbxz4UP9YG5HDP0DkaonRwWZnwFBNOeU2Q
	nZAav2bSE+EgDdgOIbc2pHo22hIpoKyryR/oxKCF/CiIOWY24qH2qbfgKhTHEi1Y
	ZmyWBsG27ngab+YAbAleKKOjavvNTToVqg58QS6vK7QsJmTeuaE5/Dnda34Y5tXk
	a6oMwQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4nb19fu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 15:54:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb48f41343aso978520a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068494; x=1787673294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3jglw0Wq9Oscb5y0P5uqnvM312XMF7ZNYTvPJQRdZA=;
        b=CYALFQNTcd3PqNdlRO5VikxIAZTkGmIAtkreZywiV/BWql7IhJwh/QuurA5zjmwpfQ
         n4Jd5hL66gWKT9icQdbvmwgiSUsgwj5it4MRTppA1Ar7vNLizxOkHxkYm6LMokiUXtFo
         e8puIRemYOTBt/Q/bj27QzQZ/1qagoS95sDnUBga3cEGAxvnIx9fBkCW0Be/UcPB3JEp
         ey2tp1GcUO6HXQJ35zImGJ5xA3Xuw1vOyA/W5J91kSGsjDoYh12a7R+okC0jGq0TqShu
         gB2pULINnjeVAxYlym+yHZ+8FSrcIrq4gFQFIspwBgEHIiKvNaVHdMc5zdaROj7Lmo3r
         48Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068494; x=1787673294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3jglw0Wq9Oscb5y0P5uqnvM312XMF7ZNYTvPJQRdZA=;
        b=qvVY/bs61rIIYOFYgVQy78yxYZCev8M4ssNDpanW/zVXkurbWp30pyoG8IH1W8FQ8F
         sJh33Q05QxZZW8o8hlu3+4qaRs+e7GtNxEbLkHFOT6EE03c259jlAhjRka8TCLl8k3W4
         gl4L3Kx9loiMyBTHV7D6dpulGSephsT/FoQUHCg2yOykh0Gdu18Iimf1e0wJeZbu9ekF
         smHhMgQPaGtgDQffqVP9+fwXbklIIXaecXxA0zsXeQpbqkWv4+JrTejnfRtisAsFRIgb
         kSVxPblgyFgehyA8CtSJ84Acu+kP7TzkUwuwKQI1JVYaOpXsVXg4TSeDdf3PrlBHmDDN
         VKfw==
X-Forwarded-Encrypted: i=1; AHgh+RpFZG89mPYyhpl2b6HhFdzcwAn0l/2VaBGYip/cIUcJJhuaJKPi5RWRZ3iVhP250nLUnhvIeX+Wv5S2bCE/@vger.kernel.org
X-Gm-Message-State: AOJu0YzzClnTi+k9z1lxTE8r/KywTYlk9i8Zn1FAUSdgWG/Asnuw3TQM
	GUiVJm9eBozfMl4tJCKmsexvFO+uNGhqT65GutngjTdSuBgervgH6VXAHqHZsy+XbLbq8I09c19
	y4DfGJsdKZwwhlKzKxnPl3+gnhE69PYWIx8GeWoabVAl1ssdAO4IfOltJsFEBphLNatywmekvox
	mP
X-Gm-Gg: AR+sD11A2KANVjN5QTWXW5vfCG1V7QKvlHRvtWEPZQrlVgtvDQJkM0Yftsl4K0LBRVW
	sSqKErpeb9+FblsrUg44Xo8j0YxCRi8iJm6m0B8Ip/RPQM0C/9Hl5SmelrWerzpWNs7SKTV//9S
	8Z406jRyTp4B1qWS8Yu/UyBXwVFuvrz+hIUKij6Bw61/dmH6FQoiLHBLid7DiODWO0QkB1fNYAR
	MK3PYVCuZ5I3tmraCPE2vGTlEsdHrhukDud7wM1+2dX0dzrDMVxnKkhcxH4pzM9K6MSU3WDTHz9
	tLaGuZU/TSTR5cUOnSY6eZMAyOn447/P2W9IssSBR3TpyrHAn6kWZ4BIePYsZBJXRLcDGgZBrIX
	DtcghdFimn6fOsmZ81T8aJuwBtcU4ZuK19w==
X-Received: by 2002:a17:90b:3d92:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39563854dadmr5435316a91.1.1787068493938;
        Tue, 18 Aug 2026 08:54:53 -0700 (PDT)
X-Received: by 2002:a17:90b:3d92:b0:384:927f:3db9 with SMTP id 98e67ed59e1d1-39563854dadmr5435258a91.1.1787068493455;
        Tue, 18 Aug 2026 08:54:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:53 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:17 +0530
Subject: [PATCH v2 4/5] media: iris: Fix power-off ordering to disable
 power domain after clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-4-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068461; l=1899;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=N8g+DXNfDRJOD41XTpggaSV1LHWFsbXlVA7q2pwOZdk=;
 b=YS4oHlm8T8nCDzMMg9SyTy5BQFzxnfosvqqjBnu1xiAUXnPBIKNHNGhgZMbqLDDNVQ2jWNqek
 okaZrqlPtpPBpf8eVhlWHydpoSkCSt0g/tuoP5IqMhkuugyWG3CcTq+
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX8Y9MjnpXw60s
 A8oPxRiy6V3tI7Yf50lq0dB1/1WlNqdNGuvdSCliEDl64EJ25+7ujG9CjrJUlfrt1yJDaK1WglH
 ZsRB6tgp2WD+v849YCyQ6d3zXIwfMOEyZt/4w4ysIGgsp2Q2ARjlOBHP813Qh/nZj/zh3XTZsn/
 023/fFX4Hs5gYPY7yvVB6oUlUyK+mmC8MMJfQUK5j6H/USI9U8pQFIDdPxBxnZd/nB+R2qXGBm2
 5ujUELZh9wrskp4gGnhWu6efY9iYz7diyXfQ3On2u03lxKbe/9MwIJ4EQ+Z7GhYSFVPx+yegpwG
 nPhP23U8wbaliQBs4J7mYjn9LWIHgCDMEp9KZ2sFPWdY1koBO4wLgTwpljUBqeETSyqzbNLWDQg
 m7/plQwx37UG5gcttz9YoHOj9n4ef0UYuRQ3xA0e2sa8zqrboXq/ymgnYIhvwIjIUFeltXe4V76
 tMzpR+zRBflmBxfj+SA==
X-Proofpoint-GUID: cvENhQ7VZ4MkC5yHEimymFqvtj6JXzH4
X-Authority-Analysis: v=2.4 cv=Ze4t8MVA c=1 sm=1 tr=0 ts=6a84804e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ou1eOjPKtcA3bHzkrowA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cvENhQ7VZ4MkC5yHEimymFqvtj6JXzH4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX5mHG8fJq6hyR
 2u7r52meL5GjRUCgFy5FLbJPHqB8nJYvBEPrrYZ68Gr/8VICQFRnjIX+uzQPnO2u958DbEyz387
 TBaBy7z5K5nGNF1HOSLpS/IRTY53vTg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180117

In iris_vpu_power_off_hw(), iris_disable_power_domains() was called
before the associated clocks (IRIS_BSE_HW_CLK, IRIS_HW_AHB_CLK,
IRIS_HW_CLK) were disabled and unprepared. This reverses the correct
power-down sequence: with the power domain already removed, the
subsequent clk_disable_unprepare() calls end up operating on
clock-controller hardware that is no longer powered, which can hang
or behave unpredictably.

Reorder the calls so iris_disable_power_domains() runs after all
three clocks are disabled, ensuring clocks are always turned off
while their power domain is still active, and mirroring the reverse
of the power-on sequence.

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c107709..3cd493b06d84 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -223,10 +223,10 @@ int iris_vpu_power_off_controller(struct iris_core *core)
 void iris_vpu_power_off_hw(struct iris_core *core)
 {
 	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 	iris_disable_unprepare_clock(core, IRIS_BSE_HW_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
 	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
 }
 
 void iris_vpu_power_off(struct iris_core *core)

-- 
2.34.1

