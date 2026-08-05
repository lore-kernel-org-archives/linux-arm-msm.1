Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B2936C9CC
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785948516; cv=none; b=H5IWTuH2lavZW8gIy093I+HoSY9Rb/fxfqXp2BCH8zBfUs7zMxvDdnEhfJRGPrt4Jg69djNTbiZv1367GQtRCMjOrMxh5dOZ02RV+dVACeVyq/A7RNoAy/3YMu2ITyKh4TmyYRaLqUU+qpqBX7/TeqA4PAZxgBQ02ZCi5YrkdJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785948516; c=relaxed/simple;
	bh=RhK2YzNaAdFsBNuwzgXhz8JaZgpPP3+1u11J8QvAJkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rcAT5c7Q6CAylTWYG2qIXJXWUwlEQDKyxM3Uy0ZKtBR3ZlUxFyVKR7wTHZ84q0yEhbcQC+wTWSQIsseQgRaP+q8X9HoftjBwX3fm/I3IFKIg7JbzF8OCm2T/ugxjT4bRUQhDvxgk0FeZHOpsPCDQNrUXnMS3iB4GphDFYDEraeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ys/PvQzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kOcWSgv2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ys/PvQzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kOcWSgv2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675FVK5B2655632
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 16:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s0x/y82/ZYCWr8KscfSkCm
	6MtpItQIqFoVaXXVZMU2c=; b=Ys/PvQzrQbbUfPL6Pmb2NmRqBiEYU5N+tNsAxG
	lHFyhHKTX6XNcByJiyMqbMKqyACvwZbJGGyAReT1NshdQPQEJjZ0zm0j/29tGksS
	up/5CH9JOc0uC0rRvQOlEofkCSyrRZl30mC+rxifMGV4Z2tLVg+i8jFDPcNjCsmz
	YtiW0kHAJLGbQXLjNnP2Jj8XsSC7fxZdcNY77WZd0rfs4c+PrybTxX0Wp2C8LUc7
	jMs439VS34ImuNqOBYUqEZQodImYM9l3tII/pp61DAtY+TyTyVlj+W2OdBLXrtha
	TNVuTkogXF4OQW4xjU1Pv4LoqjAZ7QZCyiXhcUuJ2pX9NuuA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuwbqudsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 16:48:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfca8558d2so16773425ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 09:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785948514; x=1786553314; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s0x/y82/ZYCWr8KscfSkCm6MtpItQIqFoVaXXVZMU2c=;
        b=kOcWSgv2QG0YY/ndN0jk+sOU9hvij2ML/I+sQKut77Wfvz4Zcb29WZTbCqu1HIafKa
         GjcxwSXoXOEqP/G1rb/zPrsysFmUcuEvSaqogj1NlsvUHwebE16X4C7Qg8bhRDKE6tOF
         diUeQiU81bj4fUaMZfGAi74k1VAJXe81EhTMnRizbGgzzRj0adotLlUR5cXqO8WGPJuH
         me9omMTAPI3tn9YiTNqwFvX070kRvOLR+Oj18Q1zojWJ/SC1+ljNSidkGNiYmraO/IkT
         0fdeFugF2USWIDTw6jPg4R3qG0gpKIyaJUbEjBznen6Lq+nW1HcMrWLmXmwbUYda1PwY
         TzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785948514; x=1786553314;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s0x/y82/ZYCWr8KscfSkCm6MtpItQIqFoVaXXVZMU2c=;
        b=qX24M0+YOjGCKnJm+mC6hqU20TEnbdskPvbrT52univcMj5rYqaO6eTtit/SbPnwv1
         /VfzCep3yOOJLAiX4eekZBog0mMqZhZJ3bH/nwcqbp1UwfF+n6x7Mk+pM/VFKKLqdRZh
         HpvAhsnQs9rdUBKESmoOX1YUxOddwv9FN6kQUHWq4ePGetan9RkkOq8CydMtSgO7uAJY
         /AmH4AuTZSaecW8SP36dKzA/RbA3tjW9HzVBoj/TU7qssVjbnojVhESN7xWtaipQSH6+
         CFOpzttgYsDmyatvEy3Cfh9U36jC30vnbno/FaQIM0c0QHCl5JVSYE+IX9rC+AibCpO6
         wuWA==
X-Forwarded-Encrypted: i=1; AHgh+Rog9hklreis4BMTVBjUu32URCc+tNb43cBgPX0u0vfe0eo+/Eb2I+FeGurNLewLV2HU+JJK5MiA/vgcf6uG@vger.kernel.org
X-Gm-Message-State: AOJu0YxKG7RM6kk2E+EA7dwMq6qiudEbrRvB6VrpnG8IdZ14ZcuFA8W/
	4Wh4e03xWopqWIWB/EBJHW3vbCXtD7x3T71LYYaBANVdQov04vUqCojnFSOH4mN0NUO1vM9USiJ
	mMlP9kuM0KYXHMi4aCh/d+E/kiptxua3vaa9pY/+vhBuF2X4k32d7DuLvHFb+xpFS08QJ
X-Gm-Gg: AR+sD136dnYwVJUlcbHPDh9zjjRdfmqoux4zxsxbfuidLBQsROW96tG5CaJreOdXLo2
	iEmKppMOoTU84wVkzoEf4WFFkVkTzPITBNV78z3/unwwL4eI/+pQqP7L6l1KPPHcWgXINww92C5
	zmTVRJhhWoHM1rCohH004wfOrijU+OVtXliQyZOXi5olrGbqMFmrQ4LTOSFDvX1WJ6Bai9CV3i7
	pwkFKFiNEy0YjBzFLat3Cwx3IKoGqFfb1AQf0pWxT2mVHLUVJveX7LatFRncDhG44JgsS7Glj9H
	KOiD0Yue+CNg1jcjURDMmsDnyP0PFhCv5bcDcIpa2eMjCFLaI+Y14/UhP5LY9qE8heTPsUDAQdN
	vWx7IrUwAS/7VhKO0FjrzbWijJzfWTrE=
X-Received: by 2002:a17:902:d547:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2d0ca7faee4mr95892875ad.16.1785948513497;
        Wed, 05 Aug 2026 09:48:33 -0700 (PDT)
X-Received: by 2002:a17:902:d547:b0:2c9:b8b7:5d1c with SMTP id d9443c01a7336-2d0ca7faee4mr95892365ad.16.1785948513087;
        Wed, 05 Aug 2026 09:48:33 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4d986fsm19159465ad.75.2026.08.05.09.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:48:32 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks
Date: Wed, 05 Aug 2026 22:17:12 +0530
Message-Id: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBpc2oC/x3MSQqAMAxA0atI1gaqBaeriIsaUw2KQyMiiHe3u
 HyL/x9QDsIKTfJA4EtUtjUiSxOgya0jowzRkJu8MKXN8CCtrDF4KiEts6Lv+7qo/OCotBCzPbC
 X+1+23ft+FrYslmIAAAA=
X-Change-ID: 20260731-qcs8300-tsc-clks-fbb968fdac73
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: EukkaLM46nE8QApoQj_alE-ZK01IeUzd
X-Authority-Analysis: v=2.4 cv=B+uJFutM c=1 sm=1 tr=0 ts=6a736962 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=DcIv4KPYSJKIViMFPNcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: EukkaLM46nE8QApoQj_alE-ZK01IeUzd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfXx3gruSKO3UR0
 Shg2sIkNDVucOyF61H9MIRZoEQ1ENYq5PlaRCO6R0iSuPPqPaLCam26bKPTSx8hu6bl4rMxtvtG
 MxArv340YG4ukfET6lB1L2TI2hXoxtg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDEzNyBTYWx0ZWRfX9gO2sJymQu+Y
 IlG6iBb7HppttU1d0Md8g6O/o4NQHYBjve4KoMWfwchDwVs9QfgVFEa6zDsEomMXKjDbLxXLFh4
 s2LaxvZOFh/Rcv66bXkqw9jlQicaGzYW1TSusDZp2aUEZ7xMq5T4KXZYYQbnkTsHabW4eYVRNQ9
 exuTxOTZTzlmvka2WSKiULERR5b5OBDpjaLRePcjervhG5kcXFFJDundjoifm+msfd3PGnHwqOC
 V8viyCMj2cmNeSB/4G8DpkPEWHIqBmXt/A6GAGKgkYkhqLN4DVoYI5H+wV/aiyqyVk9xwIMuDzS
 qnCNM5py6I2KlTpDF++8usr0hjpze1q2wILXq1uOGXQdD/NOuDuOU3Iz8PK8YTlFrxOCUAkOAN2
 0y1jmHsVLkoFbUnYj/kH5bbF5ONdZzW6UURMsHv1vCKIeMPoLoUb74q5I9pKianaP4+zFwm8MJW
 osAh8Iv5OiGpdvIjSVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050137

This series adds support for the GCC TSCSS clocks required for the
Timestamp Counter Subsystem (TSCSS) hardware functionality on Qualcomm
QCS8300 SoC.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
Imran Shaik (2):
      dt-bindings: clock: qcom,qcs8300-gcc: Add TSCSS clocks and resets
      clk: qcom: gcc-qcs8300: Add support for TSCSS clocks and resets

 drivers/clk/qcom/gcc-qcs8300.c               | 103 +++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs8300-gcc.h |   6 ++
 2 files changed, 109 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260731-qcs8300-tsc-clks-fbb968fdac73

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

