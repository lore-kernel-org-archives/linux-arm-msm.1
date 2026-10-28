Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181139;
	b=E0UUWRxN2W/G1XSJUahhucn9cq9CrzE1ZDsNM61N/hEV7YTzZVh41x1ITe0blQ0+rDuF
	 ZxiMkeVnpymreW3PTIm+m5Q3soTlCvfIyp0nSHoyI1kAV+ur8rvuaDVFo9D+NoTij72Wz
	 SJQP5xoVqeAbYHCir3yfBl3qIYijcxmKzlDlFmZljktJazg+jFgBTIR8IYUt0PqFAm5ac
	 q3ByKVvpFCVy0Js/z6+/V/xLFNK+1tEdzEhlAIxhmBfzs83i3u7McL6gEEgqzz/y6ow+B
	 b4+itVicdM5MIP9fvMviW7j/zG3echzMpi6KECx/y1qmMb54VETXyfuGCsy7bZmnzrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pXpG1iBEVpVTYiu0hZ6jjvnNRuCSIs+OV+48HEpQGyg=;
	b=0xoK2JUtj1m50UUhFGWD4cykgeJGDcDKhpfpeVIDF/kKr+SRWhNzqc2hGaq95vgPHhRx
	 2AIX+/alsACcIFE4TDr2euHTtGfzcmVkwMH/HUZOsqfBWHDW1nAuT1KodTWiiE3Uv7PjZ
	 qap0GKTnn6uw2Rge6t6WDzuaP0z7h6lFzM0VLuNenPis94Y7ZqJDdJHxG4S1IiG86DfXh
	 okSkVTBeA4TDcZkGW3rVSU7MDfuUCcmosdyA7sGZ0j+1TnhV/XQ7fDzSK36q9/ZKao+bn
	 m1mscZWgWw40sDezmQWyeEqcOPmyfBabh+8z+6yrMttnJ2T6Z6WM5675tQwyrlNKIkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iYnKCxl3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V3Y/eSEE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29134606A32D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29134606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iYnKCxl3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3Y/eSEE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KKMA3264790
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXpG1iBEVpVTYiu0hZ6jjvnNRuCSIs+OV+48HEpQGyg=; b=iYnKCxl389hSlbf3
	ou7eoEMjYZfzZ5J0nHEY6JWSONhYA7f50WICDCwNOY8VeH+STL/BYGlNVMfOzCgT
	YuYP71rVXWf0tQ8olTBXryWZYLETlxALwZNIADBxBaI4ndrRsC/PdIHg+iVZCv1r
	IqdUa3iKuyCqxHueODhKYCPo68tVwpa7Hpi0S5pLJOcpEzyCVKmGR0bn7v4JLKPX
	AkfvEpBej+8D+y0No+iWr6yDXL3YH9QtYTKpftiOoZQ2qeAnrvVjJW3i8aypMeN3
	lfOKb7PgzPCyidTQgWmwiv5tWMoKsYV/qiTLaqwmGyVFfkgr+eDEK7J2V9BtT5mZ
	omV00w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy713k85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 09:52:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so133725985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181137; x=1793785937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXpG1iBEVpVTYiu0hZ6jjvnNRuCSIs+OV+48HEpQGyg=;
        b=V3Y/eSEENw4WbODvZbH0zBK0HWwGOoVroWk8w3t0ZsEdcDmEYJCaxBl7AXlfO9ebyA
         rDNk/hTajo8uJkx+KYn46I3RQuK4KTXFDVm0lHpyNW+e1NZjeG0/X3JBbnf6HAsrVzYq
         t5FHQev2w3EDApBmAHUNvKlTFxZHGQha4ZSGNjSK9pOWfKnd2cGPSuoVRGiua3tRj8C4
         Bq4rU1VAS0+DfxBGcOk7Gh4ujeEwAh6Ww+mX4V6oofUS1SOQQLGyOJOFmorlS6tNhtVU
         ni06h2+3AbxhDZaoifKWdzAnTRT0wU9HPzieCx+OJusgAjJ0OgSMEVJrc1Znr3r2AvOb
         vlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181137; x=1793785937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXpG1iBEVpVTYiu0hZ6jjvnNRuCSIs+OV+48HEpQGyg=;
        b=zL3P3w9Jal7Y2U6jU5EZz+9ypiwBBMtt4ZXVeKdR1RIceQBxOMh3Wq21tWvhhv8McP
         nJO4PuT+7hj38wZQ7Y7Nzby4fqKTfv1b4UOQ1mCVHOh+98aIjc2KmsGgSjS4fVGl0DoR
         c+8G47mj61y7UDfiUXIm0X5oOpY3lxkSdC+78LY7hJX8DCx3Um/eDSx2vR07A9GAn87E
         GTDyo9bupkd00CVcPweTBn826dKGo0/L4YJ7+/Jv5naiGBwQms4iT4r8tE0ndCRFuGnN
         d2qXjEA08Q38/UiY9yqTpvsYp/bIuBwiMSk+HQUbQR5xRqtkcakcT7QYDe8im/xMHe6v
         I73A==
X-Forwarded-Encrypted: i=1; AKwUvBxTSIWIz+mxujoqU5wDVTC22Hx902EkYjXnze0udgUnyZoewSO8QVI2XR1ZloI/FnrXrO/8wM5jwVtgb5fa@vger.kernel.org
X-Gm-Message-State: AFq9FYL7ujALx1VHW2bapffXRAZ40G0eAiVA6v6IEbKORuog6p7KpnNp
	zKtIHD3WwyjZwjamDeeweutTo6DbSF8i6DrWmYJXRhmr6YyEiEchbiQa3Wt0b5f7lyVBqRC1Sz9
	Vt/+X08f5pxH7FTFNmv7MuLUcxW6iXbuZa7MRQ840LwY9emdDNMnnMVsR8ROVv+yc7UXm
X-Gm-Gg: AYBFou1xqueh9Nx9nYYGnorbdtu4pEDWotPmofeWfgZZnDSr0A0BXzBBUKGaM8G+Nv2
	HgBuMblFJUxHJYjI74KPhUnxSMsy0XwNuCCVdlWavqNw5IhhSoJJz+My6YkfLtDrDQuDp3JzwLA
	uiKF6GJfNA1TWATWXwyqgDgMD2vTmoHQ8ydJEcsUNN22nhQK2wYulNnIHLUALxW7UbDl8VXYnkQ
	o9sb+sEAF96JcE6tCjjKeNEGVw2b7xcoOzsD8q+MSfbkzpGd4WyM/qEyZ9L1Z2Fe0JSsnS8BAa7
	/Y8Q2YCD8rk2Ay3sKfx8QZwuzKS65zgjs85GWE9W9pp+Imf1Q2mNtV1CqsttJO65BUEPBBp2SJA
	j+3dubMojIUrwFsfSGU0lLZqXHjDRDShtKU5eW40h9Z7Z+kJ3rhDKccbMJi0=
X-Received: by 2002:a05:620a:4725:b0:93e:c12c:f134 with SMTP id af79cd13be357-94408dfac1emr237027285a.79.1793181137118;
        Wed, 28 Oct 2026 02:52:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93e:c12c:f134 with SMTP id af79cd13be357-94408dfac1emr237024385a.79.1793181136561;
        Wed, 28 Oct 2026 02:52:16 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:52:06 +0200
Subject: [PATCH RFC 3/3] clk: qcom: dispcc-glymur: Restore the clocks after
 hibernation
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
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-3-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=BSbzoilxnFmhYsVWYXBkZCbziFiTclz3oDp/brwicxk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq4cXJKhRD8pndPO5KmfIsQ0IH7c7LTfPNqqMNM
 6n/X8xwNoyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauHFyQAKCRAbX0TJAJUV
 VsCLEACrw+y13KUf/mgb1QYv+6HI5YRZSXsym+aMZxhDRhJMD8XpBVQg/Rz95HMefn+apbyhki1
 U9Vu697TJtJq36uj/qgYp7RkkzQQURfFgvhBvHNGauX/6XCTNYVfPpSYxuxqQWY6JnAKE6gfNWQ
 HvZwRufut5K+FrOrDA/88X9vCu3XjulYoqYXnGpZvGPsdDlch1Ry4vyOYVXsTv+YtVcaAhXgzwD
 uGEhTmWhaZLMh/jVmzzxgb7LgzDLt1Cw68FGr4EqUil8rCQ/Nk/SH3oDanCEEcAJOWU2kwXT3yw
 FWrtg77G13i3X6Ku5CzjBshOpk2HdN+CUnoHAWp5Uhhf8iUQkKEstUnhDiu6AkpZvxc+dAJM0uw
 DdUspoGNmbFUS7iMFFdmUWv8W4R4eXWjUM4zmV1QP/umMyPJGjVY9VybvAbcamKj8/Yz6/7tPru
 yhUNgKBftjMqmr+zBmUYnY+cxoP0ZYQzx6a4pDmKJqAqxwH9h2eRfC26XjmNtga/Xm3alclxyH6
 rA4Q6UDmJSbUEDNwrfZ0A4uQ/t5ZuAxAfyGC5YIhjXnrDNjJ62qbQ1/06vUizxe8nMWcXZxgRyQ
 khndtAP5T6uja+Ft1yxL/qmP/9uOTSLokEsrHUlUtGPCG4c48YDvReG4uVbKV5BXr7NqlaN4u8Z
 u7ZvImfkk6CMt8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX2PK8/5bVqYIc
 73KH19jzr4iC+OZx0ahdFZrhP9FszjfiU60CPCmWWaw8MRaT8pR0UFHYMClHxpWyqVRFOdLfHkW
 dvp2if8ajMOJkCrn1Q/30K5oS8e511l/L9WkEYdoDTOjGmLuUZp52BPGD/Kju1gUqnoDdqxr47b
 8fEwdMNvvrPbeNNr0xftrLdw5usNQAUM/UEEOC7TQEt5PdlPPnAAFF5OfpZ+FmPV0ugxSw5SA/2
 VUF9reeJAq1pxXgl7zQO4DDIfW9mQTyHW15phuTkgecLoDbgwHSCd3XciBvdjVO0buOmJ0MJFUg
 rI9MGlIqEHtG2qJ5psTzgcJoSoIhvZA0cPTZB9mBzwq1rDGjq/OiXbuKPZmYRg8SHM456Vtw8u5
 Nvxem9R22a4PSKHm1Vt927VosA8Qv8odE4HM8Ygz1QAJQMkfnR+derAd/ZRZA6wOtPfFtSpvuHe
 37KdRT+Ti0n3W7gKWfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX2aCEOYFoNDDT
 PakwZi8r8rF2mTCrGbxZiuEbTPysEmHCbu7M5NdY9wrheWawbHU80YMKG/D/5Zw6cTGkLxngbu5
 cTG74DmMtEG5Nh3wzDLcsaiiU+xi0PE=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1c5d2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q2havp_FWtokj3eB7a0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ZFoXaRRV9zNtWAw5hZPFDrUyfpuXlsTd
X-Proofpoint-ORIG-GUID: ZFoXaRRV9zNtWAw5hZPFDrUyfpuXlsTd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

The display clock controller driver is a module that the kernel loading
a hibernation image does not probe, so after the image is restored its
PLLs and RCGs still hold what the boot firmware configured, while the
display consumers believe their rates are set. Use the common restore
callback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-glymur.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index 32cc5226b4de..7ea51b8c8e64 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
@@ -1968,6 +1969,7 @@ static struct platform_driver disp_cc_glymur_driver = {
 	.driver = {
 		.name = "dispcc-glymur",
 		.of_match_table = disp_cc_glymur_match_table,
+		.pm = pm_sleep_ptr(&qcom_cc_pm_ops),
 	},
 };
 

-- 
2.54.0

