Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61057392831
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Aug 2026 07:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260454; cv=none; b=RYLNVorx3gJCKk+kqW6YzLqci8alZb7qSzgnPBKx66EFWy+bAufJ1xoPNG76VL7UNPMEXeJPmP5w+o+RLW/VjMm/lO4kgtF0Ef4B6L6d4MiukO5Q71CZP8BoqnP5wbH5xN7G1QHSq92IeKAx5cHdmlV5bome8b39spolXKhkIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260454; c=relaxed/simple;
	bh=78s6XYjaxaQgDZldaFYJHZOhjs+wp1TrYwJin4anK94=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQLiMxWryuCwsycsDl3acBSipEvTY7WT7WivpCnaZkzIues3eVwKNyYTj4CEcB0JEM3I8Dz0EA2iJd06v/nvGRjMgf1tJmu0EfixwSC8g1GH9sdQNfT67dBft3Sd8W0YByOCAzg2oAxakA1YinlsMIvg26Ti4rw/8wUEgTyXNxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=autKU8v5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYZ79vHd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="autKU8v5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYZ79vHd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6795dWtB1916479
	for <linux-arm-msm@vger.kernel.org>; Sun, 9 Aug 2026 07:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZoOk7PXU7qMowx/CrCzixaN3wBqENHxqiVKmEp1XwKw=; b=autKU8v5t7h3Onoe
	crVdEXshT1qnnvL+nkxvOGUAw77o2NleiultahUhaYSiJpCPYyyWiee9nsx2tJ5R
	MPZCwHvAy29xf70Vl0Fzu6rRn2kNVc101cShOH6Jou3PPWjM9rbBEb5ZBuyYDLjz
	4WF1CdPpuCTR2/FTFED/hVTZ84wJ+k4om94AM5wliyU8w1J+0G1Sbo91sLxEEkaq
	eQPouvk8/De0O9oWKfoUTn6yptkPMDtKIrF9zY3HJZp59CZUzNLJ163iVKt45DE+
	WW2PeVq7ulWpzAtHMKuCiELB/FbmcTzRXFPDIcYPqGATl2/VyFyZInXyPGTqmUqb
	dT789A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp2s8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 07:27:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848544a8496so1037901b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 00:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786260450; x=1786865250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZoOk7PXU7qMowx/CrCzixaN3wBqENHxqiVKmEp1XwKw=;
        b=AYZ79vHdTxdEGP+SaTOG2MrtAFLDyx+Usvma8HxJJ+SclGwlDV5JMQu8rb9aU9lUKC
         Gd/c8JhIsnBsOlc9K7XstAWGCHFxUXLu2c9haIFECf6RI1FMI6/q95TF2WLP4iYpK1TE
         fKI/B7cBt5UKXPh3OxA5jGnhO71rbwFWDD37us/L2YiqRheLrDMP4djO7op90y0OK0Ql
         ShHau36yKAR4OkPgWadKvVRhPOrVyvCp8LQZ6QFGU2T9KVZEnsZjvouL8d1JmxKo9uJY
         +ibChCjH2M7da9Hjirpsf7UaG/RAiWczuodWGu/h0NE5trAzKCORmoeMgVpRVvQ2B8l/
         V3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786260450; x=1786865250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoOk7PXU7qMowx/CrCzixaN3wBqENHxqiVKmEp1XwKw=;
        b=h8haycqT9aRzzWlIzfxxc8hCM5V/f2/efHT6ROQWkq1e6TqLb5PyPdr3h5xuTZxBu6
         sXE4T+6Ryj20HWa0H4Ti0wBM0LhCpSvinm23Z88D1sCNW7SkqYyMs5rdca6Gi8Ngzla3
         Rx+CGhl9Dol09dxrAQIQJsexdaFRvYUgLG9k0qvPCS/eETl94CRzidp4sckBYeQq7Ltr
         /XKoWbYKNaqJ5OvjQNTRQngkAdx8AeRGxYI6tFPbR3OIlNAGhPZxJH27+6MP2sLWKKEh
         PRzbAz+9nPijE1aJuwd9oeVjUfrf5C6eC4dXzUFfbe86MHaYJMj9AE9p/TPLocxI4uMJ
         0vyA==
X-Gm-Message-State: AOJu0Yyuc5zHkuGUiJp6tzILdp7KQJvbwx2xaLTgjS85kosa42xk5u/B
	6qRzVdyv3Uldk4A3dG2TXlMtSDwFUll5JCWE7MzWsqdnHHk0fQNHboFxFHYuXW1Lj8GltRnUJ3O
	xe1oT22CAzsP3f5eO+QFNbrLORi/rPnTJr5kfAXrRMZv7k47OyFAP0S0TfK+eDzulxHLL
X-Gm-Gg: AR+sD13Ryeva6oLg8kaQzEiQ4rmX5If+wZapH9omF41aVHSoqXRD21lqm70L4MKfA4Y
	s6WCI9uyHpj7ENzYVpOzl+M4RV44hka1e0pL32Dkv//kL5zyNc8XlvR02HdqezoxMbh13qp4CWt
	tMDdlQ9J1IX4fWaXuYm/Yt7nLXKZZvZ8v1CykXkyDN7mBht85OuTM1/FfGPJhLiW5agTSIrdkCs
	0jx6LIqjx2G3Vn7Uzih+sDD2i/bqhC7QRPI4Hqz/ZIqhTJ2iyTgqzkcyIAgFlbQ2DiUGnK40aIH
	6pw4+/VyGWyrTtIuGULUiQ7dVrJTpD04z2SQbBoPOHv5RLX5rWrrSHa1gw44Rvp9ENdKQTU096E
	f8ev+2s+Yu4M1ycrBLYqLH3Y6TPG6WoSZKRbvJmh/PzEGSfUtpzkKRN7WW3fuZJo4xXIgaYzgkQ
	hf8BSu9c8FH4YvxFoQaNd/CZI=
X-Received: by 2002:a05:6a21:3946:b0:3bf:63af:85d with SMTP id adf61e73a8af0-3cbadc108b1mr26695665637.18.1786260449562;
        Sun, 09 Aug 2026 00:27:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:3946:b0:3bf:63af:85d with SMTP id adf61e73a8af0-3cbadc108b1mr26695626637.18.1786260449091;
        Sun, 09 Aug 2026 00:27:29 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019b4eabsm22655630c88.6.2026.08.09.00.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 00:27:28 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 12:57:00 +0530
Subject: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
In-Reply-To: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786260433; l=997;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=78s6XYjaxaQgDZldaFYJHZOhjs+wp1TrYwJin4anK94=;
 b=8nJNzjuVzNRziWXvzxETun4Cbdn7v2ouual9OMd5EyVzJkx5B0BLJEpWzaqu3bxUFdhnuq9wv
 9ksADNvcAOZB2DZJKTEAWJFG4mU29OKjpvnQUCJ+i90LLkVarWXsLJN
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: 7GYGTZxVntHcP2J2LMczb64OjpBhvO0W
X-Proofpoint-ORIG-GUID: 7GYGTZxVntHcP2J2LMczb64OjpBhvO0W
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a782be2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=6oL2udKUJD5iSylYoFoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX5IRymZAwgaoO
 tDL0Dx0e/oJ5nGNiNE32juClkKy+3+DlZvM04XGkqtblPHkf9/edTEckY5+KWYyi0ETGM/S7x4K
 yJ30CJt/hGLzIL15+YBEovIIUk8oiiAL+1+q7xMmIIFiRN2zFDx4LyvqUQpBfe3bvv5xfLPzaxt
 q0CYGJL5nCpzFBr0GXZQECmI0mYupWyv/SEwhSBb+SZ3NKBKykXfg+wHAOjJWdxmnh66cEOYID/
 hZKfPUH8FEReViQUhZYzDWMw7qMHeIuArqqrgVV9QekihcX0gywqviK0v9+C9eYPfTYFb39o73q
 r2RQmHUxvoQcwTgA26sAnshhekmCaWjBE3+GtSA6DChCPzxu2n5Dp5ohzKNuh7nUAnfKk2jYnum
 fkFz2T5Z6pd5nVmKl5vNgSe/XXGIG129pJfgM72XGRD1C18mdX0wi1rHUjgkafUirVK+w3m1EsC
 Rm6xvNBTUWjX8qSGmsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDA2MyBTYWx0ZWRfX7eTaksoKZ6ZR
 1MMNck8qtZsI/gI3GmmcBeQ6n/K4y2YLM0nnM6QSS7xbkFQWJs176x5Qt3JEpZoNsZf4rgkeUCt
 bpU3NPbBpTNdIOE1bnnc1YrZv6b6mgg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090063

Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
hardware.

Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
wrapper for its debug UART, so this assumption no longer holds.

Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index fd4d4ecd2df0..5b3c9d31fd7f 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
 
 config QCOM_GENI_SE
 	tristate "Qualcomm GENI Serial Engine Driver"
-	depends on ARM64 || COMPILE_TEST
 	default ARCH_QCOM
 	help
 	  This driver is used to manage Generic Interface (GENI) firmware based

-- 
2.43.0

