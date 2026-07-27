Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDF43EC6AE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785144100; cv=none; b=WNTDt9SMxhhlsi2SNhnNvPSItpVgCPrLz3XCEsK5K1VRXCGZSE0lM5xhXVLGlQ+bn10uU3g2+AIBuCF5t2EkUUjrMAtFAXcMl7P30NdoEG/+K7WwtUUweFbF/RcfzZmCmLc5CRRU7YCFTSnRHmCcnRVNzui2ZCZN8NZbosR+un4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785144100; c=relaxed/simple;
	bh=7QdTicByAF37/vqEM2Xc4NutdUwNDSif3onVdoTitP8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kTsU/Dd6MBwz765qtEy15cTffUbh6az854eNJciYPDrs86XDqg3a61EIqAnwgocaW0Kwj+6lf59rKYaWD8xbGltcuTjMDQGgBLLrxH3oNDlK+ZO75pK56JOmIbqeTV1UI+kF0Qrie+lLrp/kHFIk4rNB3pwSZwh0wGC4o5+9Pkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTjDuZj6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RDRJTlYV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTjDuZj6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RDRJTlYV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R8ggRi3212859
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V4qjYvLGbKpYukkZn0ohJ+
	qim29uTcqtCsw0h2wS2fU=; b=lTjDuZj6PrBiYng8XKlGcuAvMVSrKW+b2UZTVE
	Pj25yPJnJb1pJ6Zi8lE2TD7lD8EdupRIF+vF7i9/CwEMacOe498+MNGoxkYqK1jI
	t+1oy1nPT+cqxPp+nMBQR3URK8nX+SDU2+ZLKjnTULGGHjmkZKTgznR0WLyqrdhY
	6XwYWuppf07jiH2UPsEkbLFZPgCmKWMCfUXKjaKpw9Z6v+055qeN3WiRKNv8u15x
	/vo74dyaVWLnGlQ4t9yuYqA0FRXR55dMqXU7YYNzrK7f2Zpjz7sPvsbX1bRykscM
	RyMFmAUPTwcFGHKnTXNxtKwhOY5YrrZnFhIaqnN5bQOR3Tdw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmmfgwmr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8efad04d884so50972096d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785144096; x=1785748896; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=V4qjYvLGbKpYukkZn0ohJ+qim29uTcqtCsw0h2wS2fU=;
        b=RDRJTlYVryp9hqzE8jM3GB1iF/yalvizUNqN20FvmSlkRGkxL6vLj1W3WWKakXSPm8
         lQq//MNs1a2+yEJ1Yc8m7RycVwQD+xGJCff2o2/xAhm5TeVOkrOatOIy654+G+3jNv99
         y1Ey5YRjrnlUwyNJGDjk6jd9ytfFmUWyN/m1QoWjMhh5G/4lw6Tp/5ywOE2a6D4JQsl7
         cPv3OMtB3ojg0eb4zpA/AgMXAuJ9lknB5yB0amMx1O64j3lK6d0Xoap8s9V2UZCl/EqJ
         bFkr996tZyfV91jlD+xoJKGyyxANxAayV6s3ldvfbRsFKdqjBWq8pGCAIhcAmdjRUiwN
         Ya8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144096; x=1785748896;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V4qjYvLGbKpYukkZn0ohJ+qim29uTcqtCsw0h2wS2fU=;
        b=onTF7iSN1JA3c3jyPRy38USWl57/DSAE38/YMK6f/eJ0MXd+j7qS4fav8gRlyuqYwl
         2105lBhJxrypOQcy5CvfJVFbdTlKyPMpO9ab6MfIuAYIivzvTO7bhwWlvNZpoPfdLEVF
         K/GF9hdDfoMo+UHZlRezQBryV+JYL4ri0SrMW/HnTRMXygHQyxhB/DexLZ1Xs08VXvqo
         NLI57GSdsWdw4STJb1MPZfA0l6Qlca++6baiFmq1s9syqXstl5d6/QJ7zh0pwmYCfLCd
         uZgiFqzbbPe1ohJXh9nrbhYASlQhPWjk+if8MKm1g9km+dSsqrEl6iqL/qQZ4ivlL22V
         d+vQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrw6igQHaRksHULK8n03x3GS9fzCjSxtYeCzn+xjwe3w97qRCinHyuHEfIpKs5F+FJHctdHWwaR7BpJLuUV@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPRZCSmuxlc7XW4sBBosAG2LEfu+T1nJgEktJq1IOnzPBrmtE
	u2qnslJ0Bdh+yCXoqdttiwqBvMUN5mvHZbzChDdviVzWCTPiS8tTTMgslcrJk4FNwt1cmMu80dA
	CpomyjlQHlP2My5vRCYT36l9v0NVbK7VjUylljHkcoz1aXi2guLj9buViCjqBE34K4eoM
X-Gm-Gg: AR+sD115aIXBzt54V6dYZzdHJhinXP/3qh/v1FWBSvapZaZAyKNTtZZb3qqXaVT67/h
	7y6mAneGs2tWZrSban0BdtfcXgGVWOZAlGFVNg3Q+2ftKsJ9YkniAdRm9M0ztC5UUMXhLqy6V04
	7P6+sxQG5wSZM79kNNpQtiVfdDgN82KzemoEuqY+SWGAXsPgcXJqfX7qtl9wvrDddsZDHU3oAJa
	ZzSnO25ztuClnQIoYpZm+OS70zM/4rlep95oJZRxKHnWU1LxQAnSnkh/QK60GTabVua3SmmvrxT
	DD7DgdQsd3BhCnIBJd4OO4RW4AR0uneKxMNxo5NS0wppOIUL3qeC1RndqnRsN17h6uEi6sxhEWa
	tUfsgofNFIxLoXblgMhBZw+nM2DNZcfigV6C+LuRp1PG3Eg76DwBQYIKHJcRtRY0Uuzrq+1RlC6
	EgHxWOr9dKSNpXTdjRIw3C3yWY49+qQFy3hRgR2tjEfDEO8lxoGm+1
X-Received: by 2002:ac8:5910:0:b0:51c:fc4:a144 with SMTP id d75a77b69052e-529a8337818mr79721611cf.4.1785144095688;
        Mon, 27 Jul 2026 02:21:35 -0700 (PDT)
X-Received: by 2002:ac8:5910:0:b0:51c:fc4:a144 with SMTP id d75a77b69052e-529a8337818mr79721471cf.4.1785144095345;
        Mon, 27 Jul 2026 02:21:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c9babsm2265326a12.12.2026.07.27.02.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:21:34 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/3] i2c: qcom-cci: Fix CCI clock rate enforcement
Date: Mon, 27 Jul 2026 11:21:31 +0200
Message-Id: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABsjZ2oC/22MQQ6CMBBFr0Jm7ZC2EUtceQ/DopZBJgLVVhsN6
 d0dWbv5yXvJfyskikwJjtUKkTInDouA2VXgR7dcCbkXBqPMQVmj0XtGP91w4DcOpPfNxTg/OAv
 yuEcSvdXOnfDI6RniZ4tn/bP/O1mjwoYc2dYq1bv2FFKqHy83+TDPtQx0pZQvju67Hq0AAAA=
X-Change-ID: 20260721-cci-clk-fix-fe145b2acfa7
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 0bOVJ8DjIo67wh7fwATMVXQ0eSCeuuu9
X-Proofpoint-ORIG-GUID: 0bOVJ8DjIo67wh7fwATMVXQ0eSCeuuu9
X-Authority-Analysis: v=2.4 cv=GdYnWwXL c=1 sm=1 tr=0 ts=6a672320 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GMDCHhIFIY8WwY_rtYAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA5MSBTYWx0ZWRfX7CUCavEOJOIP
 Z5J1opojqcNI4C73iQ/Gz0pfg5Pq7f/XFpE0I9pwBjtkttH/zrCjWdwP10y/5FluAslyzTsyMQV
 fPfyrfgTD4c3V1GQ3jaXIqPovN/5VhM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA5MSBTYWx0ZWRfX/lTTzpC3h1Q9
 EURDngNB1IYRT6SRhPka7b+CbkJ5TjZFv9q4QEvpA0w+Hd9QGYmgy3oAAUVw7jbN1q2O/MmhdC2
 yGNDffIwfQTUoJhek/FM4Ih+/LWQsOptzBaOG3rYmcdsfYgIzNt5gHkNPU4pM36HMH24gmphoGq
 whM4xrG/YC6qMxZbCu/8XfpDD7CBOXDOsNexEULwFqZyo/RCUi51z8HaHde3qFokG5geqc26TLt
 D1zJR043jSqGR8wTH4trUpZCPRMm46Zvzz3L9Le9/1aX4EldqMcvu+PfOae9GRqLofhJVfs9U5g
 AmiwmhDYvKIEJqlRDRvbuZQr4TKBlwzeRYWW7bVthGRGY5mW5DeQ2JMISKrSa7HQ0+dhW+YfiiT
 n0wqc60PGEn9lrj3DuRDf4IlFD8tewSqZ3qkhB7EjEomXwizW7+LmfbLH7DYBqXUVEfONfsgu5N
 ldFkJk6Zv7EVY6lamFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_02,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270091

The CCI hw_params timing values (thigh, tlow, etc.) are expressed in
clock ticks and were calibrated for a specific CCI clock frequency per
hardware variant (19.2 MHz for v1/v1.5, 37.5 MHz for v2). Running at the
wrong frequency causes incorrect I2C timings that may violate the I2C
specification.

A previous series removed the cci_clk_rate field and the associated
warning from the driver on the grounds that the warning was noisy and
the rate was already set via assigned-clock-rates in the DT. However,
enforcing a clock frequency configuration through DT is fragile and not
the right approach, the driver owns the hw_params and should own the
clock rate too.

This series first fixes the msm8953 timing table, which is internally
inconsistent (Standard/Fast calibrated for 19.2 MHz but Fast+ for
37.5 MHz), by reusing the v2 config (same hardware version as
msm8996/sdm630). It then reverts the removal of cci_clk_rate and
replaces the passive warn-only approach with an active rate enforcement
at probe time. The rate is applied through the OPP framework so that
boards describing an opp table also get the required power-domain and
regulator votes.

Note: Vladimir suggested selecting the CCI clock rate per I2C mode
(Standard/Fast/Fast+) rather than a single per-variant rate. That would
be a much larger change as it requires a table describing all the rates
supported for a given clock, plus proper vote/arbitration management,
since a single CCI clock is shared by multiple masters that may run in
different modes simultaneously. So this is out of scope for this series,
which keeps the simpler per-variant rate.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Instead of adding a 19.2 MHz cci_clk_rate for msm8953, switch it to
  the v2 config (37.5 MHz). The msm8953 table was internally
  inconsistent (Standard/Fast for 19.2 MHz, Fast+ for 37.5 MHz), so a
  single rate could not satisfy all modes. msm8953 is the same HW
  version as msm8996/sdm630, which already use v2. (Vladimir)
- Remove the msm8953 fix tag (Vladimir)
- Apply the rate via the OPP framework instead of a bare clk_set_rate(),
  managing the vote across runtime PM. (Konrad)
- Link to v1: https://lore.kernel.org/r/20260721-cci-clk-fix-v1-0-5eae78700da8@oss.qualcomm.com

---
Loic Poulain (3):
      i2c: qcom-cci: Switch msm8953 to the CCI v2 timing/rate config
      Revert "i2c: qcom-cci: Remove unused struct member cci_clk_rate"
      i2c: qcom-cci: Fix CCI clock rate enforcement

 drivers/i2c/busses/i2c-qcom-cci.c | 100 ++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 46 deletions(-)
---
base-commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
change-id: 20260721-cci-clk-fix-fe145b2acfa7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

