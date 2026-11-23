Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795471941;
	b=CBmnoIfr8McATtimNcQEdaVOzk00H3trjKsyId2z5TH1aZP/Xk8kRsPLyr/5Ijq5YRpT
	 c9hDyVdvRfPhg1QEIGGNfwiIs5/Eo+J1F2dt7PWU59/vBTL+a5iUAELlyrMwvHG6wf+cS
	 h5VHwxgLVwo6XLVbgXNflO/vYHtU6Vs7OwpyZ6HC2vVRGgmCvwwfkuI4FaYPv42cchPOD
	 sLLySYfuvpw6Hx+XC3aOJNQASkfgXZoXMDkf8Kwzz7XjJ/9rLxVeaiT8N4qEdf8POurvr
	 hAvrluiBjnywqAGlVVt7YJcZQ3UGVpUV9dFxmyv9+6FT1dgs9+AFZa7GpD/ybFYiPLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795471941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y7nPJckBOCgPmlLsWlMebz2Kxq1BAx7WuD6/NnnuYe8=;
	b=gLz3OBnN9Ovp/DMEPLsCgGmXDvWtzwR6C9PcNknPJ7bgZoKy1ECHQxWIXT1JOB5tsa3r
	 gxL2MZPKGKSnYeQRisd+i7zkfoDbJsukGDYCGKbem9XSpC5ocNF5PDWfWmUNoq6vXy72Q
	 aNs4FI7GrnM+WafFRWqHxqf8kjS9yP8ET+160fY9ed2jZesYIl+YaIKr0BrIjDkWxP9R4
	 2/UXVvCHfouSqOTm10rNCQHAR6eLkRw2l23+Xw9kIB8TMmrw/2gTwHoPy3j3xAF6Oar1V
	 pLLHsfq4U4D5C+tlLzDRz5uSSNgftMqOeHg7/WdgwdqBlk+2L9Bq5BbIKQ9nWg3RNsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQVOE4H5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKA5ccY+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D64F606A683
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D64F606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KQVOE4H5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKA5ccY+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuQgg3255327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:12:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7nPJckBOCgPmlLsWlMebz2Kxq1BAx7WuD6/NnnuYe8=; b=KQVOE4H5pjUmBJz0
	tbxA/yYP74J/Wc56vuYJnF6f9q4g/DcnI0eLuTBz8y1pXQVmPWD/liEF7xWpQ7sj
	gA+8a77ht0NByX2wE1+ibJz/VbHhiVZXVcYp9yk1VQ/efDOQAf2vTJi4/mlMI97s
	XIPB69LZEAmzXJPcmQ/mZ4c0kBrhExSIGvdoIJ83WGfEW4IEdPDVxRV4qWVlbHa+
	u/M7EhUB/a56V8goI0k94mOO9Su1jEAFZOri6k4XXi5FHYD8RzSc3gAbih7v2KAX
	1OlViCiIrjeu39QfphEXyxj9RgItztdV/bjWrhKA7/V1E9bCYlfaeY1WQp1XkNUt
	a1hbhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pbmyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:12:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso702166185a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795471940; x=1796076740; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y7nPJckBOCgPmlLsWlMebz2Kxq1BAx7WuD6/NnnuYe8=;
        b=DKA5ccY+9jCZ65fqhnksoVOdZrGS1HspZmuV9rZjTRLfwKmtVv8rGztdt3njsIWqVm
         5Guf8b/qVN6R+yPrg3NMbm7mFIRMEZoXYWH6WXYwPk7jj5fXI+Hz7PC9gt2t0ZcqBIOu
         RvtreUO5LQD7QpUcjb3ItUI/YkBnP/kgZS/Ls5LsP3lqeX/o+wC4Xhr3JFdwKnD43l5S
         eIz0vu6rLb4AGIZIrNlUHxjuCKlSZFtoRrK0SQjUxDBiCTJ4iYAXbPXKE8vWUWFv+LBv
         yiBHVEXVFBy1FiShonSWFwpqLXaUzZkiA13d4O/uWIPWjIyDxhDhLxrejvL/Y2VzMycw
         MgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795471940; x=1796076740;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7nPJckBOCgPmlLsWlMebz2Kxq1BAx7WuD6/NnnuYe8=;
        b=mnDurqp5QAdlUzS47m6hYP5AOWSkGwlRFTLQuHzSy1sHHluuDvbbkcQzbxNwiTrTGB
         ZRvBcvz/kTXOZUszTVPOdOdSt/LHwuFydmMFzrbH2nNWBGPD8fRYvc66LUeDJVBPvf4F
         Jd3s3qf5e/p+qYZHVxyVXhEADuzXUGMQ8Uq4DXHOjBkIHhx7GdWh1wfYf79PmQuu4EwK
         4Ya1p4BgXYfHvfD7IIPMXgyVRDW6WvyiPky329oBkTN12iWLBpIqVf3rrexyX/QBeKM3
         t9E+9S1aawj591rsLXunl0L2WdP6B9HbuiqShbiFR1GDtj9j0nxylZ8Bdk+u/2kXlf6u
         nHRw==
X-Forwarded-Encrypted: i=1; AL+hErFDHJbwmLWEHXCeWdFoCs14+kaBhQSS8q9SEZGkOa6YWDR4xO+pfSNuPeysk7n1PbdXRLfYt3e+6DZ50g+J@vger.kernel.org
X-Gm-Message-State: APuU4Z9VqRXyRLTF5WAyb/RSdZC1DMDWnw5yDVuFRyDtJNEUCDufuKmU
	6h99bFaQwNjsEEJobd1USJARda6FoDDWuDX+qQOSN1fW1YEMPJfRyoFNYrCsor09kGV2jl61DgS
	tCdNUV9ZlgYTy3ExH770vSQeUgjcCWwiYF15iRC7qXne9mJtz4e8i3RKF6YYO1Dw8xVo3
X-Gm-Gg: AZFdTZfR0HfvsxqBfnAv5Qtw1Hl0dshX+jYts4iS3Cu9VbXMZNxEa4IcHiE3m5GKnXk
	0UVvWO2/xBgvxVvIK+waGcaWNmqQ6tpmvnruOv0ucP/IDekLkZzHmO8nE5D8lg6CQhoyrMIJzk4
	H7BcXnzq6i13X5EsP/oFrAUM4+qMol7m8FC67NV4ojE+9qkg2Kox+PCP4Q580l/PTQ3NZ76wxQG
	OXZ6bQowx6XbvXqPe+7uKYgm3o3NvVjZeKtccnMWd44nl2aobj04l3IEO/LE0SZ7N72R5ss582y
	T1RgJ/N5rKaX39EQxu+tc3b/iw9tp+k699WAg7yOEQSWLiXHsB+Yf72XsEvOXlTqx88cm9E9+p1
	BMm7q/u/TvQXY6DK49JW+URyQDFDIcwLq+MurwrsIZD+xOSgup9FwVWtMrjtsIwW/boE=
X-Received: by 2002:a05:620a:45a2:b0:946:2a0:a11b with SMTP id af79cd13be357-949ba9cddeamr2216775585a.35.1795471939626;
        Mon, 23 Nov 2026 14:12:19 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:946:2a0:a11b with SMTP id af79cd13be357-949ba9cddeamr2216770385a.35.1795471939081;
        Mon, 23 Nov 2026 14:12:19 -0800 (PST)
Received: from localhost ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm304524935e9.0.2026.11.23.14.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:12:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 23:12:10 +0100
Subject: [PATCH v2 1/2] soc: qcom: socinfo: Copy new SoC IDs from bindings
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
Message-Id: <20261123-qcom-socinfo-id-dt-bindings-v2-1-4504c1ce869a@oss.qualcomm.com>
References: <20261123-qcom-socinfo-id-dt-bindings-v2-0-4504c1ce869a@oss.qualcomm.com>
In-Reply-To: <20261123-qcom-socinfo-id-dt-bindings-v2-0-4504c1ce869a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5077;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TXzO7lczvT0ho7ofH7ywyEnPwL+VNQhDd+3sEnhiFCw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBrBLo88biPftZQwIXFDoOc0V3d2CtiANRH2uMLB
 RdpRD4HzUeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCawS6PAAKCRDBN2bmhouD
 12vVD/9tOT8oLQAabcfTYp0fgrwqezd0GVrUgm8RFkBCfJczLqS+CUux2HvWhxqx5qcE3MHW6PU
 6/qjY62ktXtrBMyqLVLptk6/4ZZzd8NPKJdZ3sbu5+tW/fuUwWajt5nJxXHO++JpN3VHH0EAwCc
 R0giZ2mFBO9+cIwCbV8GVKBkrC0+c307xPQodm+tLBlR40gxcJZED0Or/dma6+xt/Npan6PU90S
 26pyGiwsJ66woWFc8GhIYD0MetvHhsqTwfIbwJzOenJdQA9h4mB5xTPK5K0ntTQzwrGZ3/Jrzvj
 foAWxaIjtjY7cYjalrP4xQtt2fqBmNKfkECJ9qzYR8qkXEku/bYcSKBgmuH+SQtpEvMuDuWYgno
 wHP0IRoy+aKVgEXelYlXPyjaJrDaNbQqVpS7ozbRfqaHhSggieEyczLseQdw7PjOszDpZep2tbP
 bL59ze8zFiSuiIzfM4mUpyCIOSdq/FgddN6Ve1WIEUFwA2+c4mrRQafF8uEkznHvgd43xjDWX6U
 msrRSEoT8nADDelR6/wKeEZBW4NgRtxHnLrCwYPAZvpjkjFlI/NM3qDsoXcMwJnLCuW7TTSax0Z
 P/FG30v6X0x/UGLjY7bGWZxwMEyPXlPBr423ffnWZg6nQgSHS3Vuqcm5OIjIK0FqMY+o/hAysFE
 Kq4OncxueczaEMw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX/noQ26UNl4w9
 lW9q+wyhkt23eKQoAlND69EFGMZoyXvi7RYnfhad9glgh4xuLYj1ceYBQhayxfeT3K/YOi7Ti2P
 G3D62N4Lb+qoFNhEfJPpVtuga8YVyw1pO02z8CoIaJ6cCL1vQUNVQ9zL88uxG15YMXMWoHYSokD
 E4aAMI8b5OPL1rsPhOQmnjP2yIy855Ab+3tU+T8CaUcThK5fOA20PiUYLKyXF5E8e9hAsUZPOd5
 q50T0DLZZR6eUMMuCwQb/RDgGB6oru/c2fZXVocOzpDGS0qe3g3PZefYk70SVOyYSdYuSztF92G
 OgGB+6ulrDds4NQuxuq6Oe+hrFIAlH3NMo17lMlt+NjvzWt2A/CV7WtfS4iyvDLGN8k1bjqxx6R
 UwQKusQ4sZiNzsl8nFeDzTpFsw2njZSYQz7lcd59LiiKcPLKulqeQCtKIOyL3EIfxUzAjWFA6l8
 q4NYcLPdsObaAuDEqzQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04ba44 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GMOlWMlolr8ObqTOX9EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 7XNXEx4SLoApBdQWMyf8egyy2uvxx_K4
X-Proofpoint-ORIG-GUID: 7XNXEx4SLoApBdQWMyf8egyy2uvxx_K4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4OCBTYWx0ZWRfX06LqsbGPnK3u
 6+lzlb27ZvmvUlwa0VwGzTUiNWQhkhBGY2vdSHMmY9uMtgKb9eEXhh0bdvgEY9mreAkl7PnN2Wu
 OSn4czVm9/SLnQ86oNuDccWiRJ9KvLY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230088

The IDs of newer Qualcomm SoCs, as reported by hardware or firmware, are
currently used only in the socinfo.c driver.  There should not be and
there is no in-tree DTS user of these, so none of these constants are
really proper Devicetree ABI.  IDs of older SoCs were being used in DTS,
thus that part matches the concept behind DT bindings.

Copy arbitrarily chosen newer SoC IDs from the DT bindings to the
regular header of socinfo driver and use it when needed, so later they
could be removed from the bindings.  Note, that DT bindings do not allow
qcom,msm-id ABI for anything newer than SM8250 or SM7225.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/apss-ipq6018.c      |  2 +-
 drivers/cpufreq/qcom-cpufreq-nvmem.c |  1 +
 include/linux/soc/qcom/socinfo.h     | 92 ++++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
index 32347e6d8775..b4babeece2e0 100644
--- a/drivers/clk/qcom/apss-ipq6018.c
+++ b/drivers/clk/qcom/apss-ipq6018.c
@@ -11,9 +11,9 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
-#include <dt-bindings/arm/qcom,ids.h>
 
 #include "common.h"
 #include "clk-regmap.h"
diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index 2b458ed1f6cf..3f933a434526 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -29,6 +29,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
 
 #include <dt-bindings/arm/qcom,ids.h>
 
diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
index ba823a0013c5..317dcc26c504 100644
--- a/include/linux/soc/qcom/socinfo.h
+++ b/include/linux/soc/qcom/socinfo.h
@@ -112,4 +112,96 @@ enum qcom_socinfo_feature_code {
 #define SOCINFO_PCn(n)			((n) + 1)
 #define SOCINFO_PC_RESERVE		(BIT(31) - 1)
 
+/* SoC IDs */
+#define QCOM_ID_SM8450			457
+#define QCOM_ID_SA8295P			460
+#define QCOM_ID_SA8540P			461
+#define QCOM_ID_QCM4290			469
+#define QCOM_ID_QCS4290			470
+#define QCOM_ID_SM7325			475
+#define QCOM_ID_SM8450_2		480
+#define QCOM_ID_SM8450_3		482
+#define QCOM_ID_SC7280			487
+#define QCOM_ID_SC7180P			495
+#define QCOM_ID_QCM6490			497
+#define QCOM_ID_QCS6490			498
+#define QCOM_ID_SM7325P			499
+#define QCOM_ID_IPQ5000			503
+#define QCOM_ID_IPQ0509			504
+#define QCOM_ID_IPQ0518			505
+#define QCOM_ID_SM7450			506
+#define QCOM_ID_SM6375			507
+#define QCOM_ID_IPQ9514			510
+#define QCOM_ID_IPQ9550			511
+#define QCOM_ID_IPQ9554			512
+#define QCOM_ID_IPQ9570			513
+#define QCOM_ID_IPQ9574			514
+#define QCOM_ID_SM8550			519
+#define QCOM_ID_IPQ5016			520
+#define QCOM_ID_IPQ9510			521
+#define QCOM_ID_QRB4210			523
+#define QCOM_ID_QRB2210			524
+#define QCOM_ID_SAR2130P		525
+#define QCOM_ID_SM8475			530
+#define QCOM_ID_SM8475P			531
+#define QCOM_ID_SA8255P			532
+#define QCOM_ID_SA8650P			533
+#define QCOM_ID_SA8775P			534
+#define QCOM_ID_QRU1000			539
+#define QCOM_ID_SM8475_2		540
+#define QCOM_ID_QDU1000			545
+#define QCOM_ID_SM7450P			547
+#define QCOM_ID_X1E80100		555
+#define QCOM_ID_SM8650			557
+#define QCOM_ID_SM4450			568
+#define QCOM_ID_SAR1130P		579
+#define QCOM_ID_QDU1010			587
+#define QCOM_ID_QRU1032			588
+#define QCOM_ID_QRU1052			589
+#define QCOM_ID_QRU1062			590
+#define QCOM_ID_IPQ5332			592
+#define QCOM_ID_IPQ5322			593
+#define QCOM_ID_IPQ5312			594
+#define QCOM_ID_IPQ5302			595
+#define QCOM_ID_QCS8550			603
+#define QCOM_ID_QCM8550			604
+#define QCOM_ID_SM8750			618
+#define QCOM_ID_IPQ5300			624
+#define QCOM_ID_SM7635			636
+#define QCOM_ID_SM6650			640
+#define QCOM_ID_SM6650P			641
+#define QCOM_ID_IPQ5321			650
+#define QCOM_ID_IPQ5424			651
+#define QCOM_ID_QCM6690			657
+#define QCOM_ID_QCS6690			658
+#define QCOM_ID_SM7750			659
+#define QCOM_ID_SM8850			660
+#define QCOM_ID_QCS9100			667
+#define QCOM_ID_IPQ5404			671
+#define QCOM_ID_QCS8300			674
+#define QCOM_ID_QCS8275			675
+#define QCOM_ID_QCS9075			676
+#define QCOM_ID_QCS615			680
+#define QCOM_ID_SA8797P			690
+#define QCOM_ID_SM8975			707
+#define QCOM_ID_CQ7790M			731
+#define QCOM_ID_CQ7790S			732
+#define QCOM_ID_SM8950			735
+#define QCOM_ID_CQ2390M			756
+#define QCOM_ID_CQ2390S			758
+#define QCOM_ID_IQ2390S			759
+#define QCOM_ID_IPQ5200			765
+#define QCOM_ID_IPQ5210			766
+#define QCOM_ID_QCF2200			767
+#define QCOM_ID_QCF3200			768
+#define QCOM_ID_QCF3210			769
+#define QCOM_ID_IPQ9620			770
+#define QCOM_ID_IPQ9650			771
+#define QCOM_ID_IPQ9610			778
+#define QCOM_ID_IPQ9630			779
+#define QCOM_ID_IPQ9640			780
+#define QCOM_ID_IPQ9670			781
+#define QCOM_ID_QCF3211			801
+#define QCOM_ID_IPQ5211			802
+
 #endif

-- 
2.53.0

